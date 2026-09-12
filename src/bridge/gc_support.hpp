#pragma once

#include "common.hpp"

#include <vector>
#include <mutex>

#ifndef _WIN32
#include <signal.h>
#include <pthread.h>
#endif

struct GC_stack_base {
    void *mem_base;
};

using GCGetStackBaseFn = int (*)(struct GC_stack_base *sb);
using GCRegisterMyThreadFn = int (*)(const struct GC_stack_base *sb);
using GCThreadIsRegisteredFn = int (*)(void);
using GCAllowRegisterThreadsFn = void (*)(void);
using GCInitFn = void (*)(void);
using GCGetSuspendSignalFn = int (*)(void);
using GCGetThrRestartSignalFn = int (*)(void);

struct GCModuleEntry {
    void *handle = nullptr;
    GCGetStackBaseFn get_stack_base = nullptr;
    GCRegisterMyThreadFn register_my_thread = nullptr;
    GCThreadIsRegisteredFn thread_is_registered = nullptr;
    GCAllowRegisterThreadsFn allow_register_threads = nullptr;
    GCInitFn init = nullptr;
    GCGetSuspendSignalFn get_suspend_signal = nullptr;
    GCGetThrRestartSignalFn get_thr_restart_signal = nullptr;
};

static std::vector<GCModuleEntry> g_gc_modules;
static std::recursive_mutex g_gc_modules_mutex;
static thread_local size_t t_gc_registered_module_count = 0;
static void *s_cached_game_module = nullptr;

inline void init_gc_library(void *game_module_handle = nullptr) {
    std::lock_guard<std::recursive_mutex> lock(g_gc_modules_mutex);

    if (game_module_handle) {
        s_cached_game_module = game_module_handle;
    } else {
        game_module_handle = s_cached_game_module;
    }

#ifdef _WIN32
    HMODULE hGc = GetModuleHandleA("gc.dll");
    if (!hGc) hGc = LoadLibraryA("gc.dll");
    if (hGc) {
        bool found = false;
        for (const auto &m : g_gc_modules) {
            if (m.handle == hGc) {
                found = true;
                break;
            }
        }
        if (!found) {
            GCModuleEntry entry;
            entry.handle = hGc;
            entry.init = reinterpret_cast<GCInitFn>(GetProcAddress(hGc, "GC_init"));
            entry.allow_register_threads = reinterpret_cast<GCAllowRegisterThreadsFn>(GetProcAddress(hGc, "GC_allow_register_threads"));
            entry.get_stack_base = reinterpret_cast<GCGetStackBaseFn>(GetProcAddress(hGc, "GC_get_stack_base"));
            entry.register_my_thread = reinterpret_cast<GCRegisterMyThreadFn>(GetProcAddress(hGc, "GC_register_my_thread"));
            entry.thread_is_registered = reinterpret_cast<GCThreadIsRegisteredFn>(GetProcAddress(hGc, "GC_thread_is_registered"));
            if (entry.init) entry.init();
            if (entry.allow_register_threads) entry.allow_register_threads();
            g_gc_modules.push_back(entry);
        }
    }
#else
    std::vector<void*> candidates;
    if (game_module_handle) {
        candidates.push_back(game_module_handle);
    }
    candidates.push_back(RTLD_DEFAULT);

    const char *gc_libs[] = { "libgc.so.1", "libgc.so", "libgc.dylib" };
    for (size_t i = 0; i < sizeof(gc_libs) / sizeof(gc_libs[0]); i++) {
        void *hLib = dlopen(gc_libs[i], RTLD_LAZY | RTLD_GLOBAL);
        if (hLib) {
            candidates.push_back(hLib);
        }
    }

    for (void *hCand : candidates) {
        GCRegisterMyThreadFn reg_fn = reinterpret_cast<GCRegisterMyThreadFn>(dlsym(hCand, "GC_register_my_thread"));
        if (!reg_fn) continue;

        bool already_registered = false;
        for (const auto &m : g_gc_modules) {
            if (m.register_my_thread == reg_fn) {
                already_registered = true;
                break;
            }
        }
        if (already_registered) {
            if (hCand == game_module_handle) {
                break;
            }
            continue;
        }

        GCModuleEntry entry;
        entry.handle = hCand;
        entry.register_my_thread = reg_fn;
        entry.init = reinterpret_cast<GCInitFn>(dlsym(hCand, "GC_init"));
        entry.allow_register_threads = reinterpret_cast<GCAllowRegisterThreadsFn>(dlsym(hCand, "GC_allow_register_threads"));
        entry.get_stack_base = reinterpret_cast<GCGetStackBaseFn>(dlsym(hCand, "GC_get_stack_base"));
        entry.thread_is_registered = reinterpret_cast<GCThreadIsRegisteredFn>(dlsym(hCand, "GC_thread_is_registered"));
        entry.get_suspend_signal = reinterpret_cast<GCGetSuspendSignalFn>(dlsym(hCand, "GC_get_suspend_signal"));
        entry.get_thr_restart_signal = reinterpret_cast<GCGetThrRestartSignalFn>(dlsym(hCand, "GC_get_thr_restart_signal"));

        if (entry.init) entry.init();
        if (entry.allow_register_threads) entry.allow_register_threads();
        g_gc_modules.push_back(entry);

        if (hCand == game_module_handle) {
            break;
        }
    }
#endif
}

inline void ensure_gc_thread_registered() {
    if (t_gc_registered_module_count >= g_gc_modules.size() && !g_gc_modules.empty()) {
        return;
    }

    std::vector<GCModuleEntry> modules_snapshot;
    {
        std::lock_guard<std::recursive_mutex> lock(g_gc_modules_mutex);
        if (g_gc_modules.empty()) {
            init_gc_library();
        }
        modules_snapshot = g_gc_modules;
    }
    if (modules_snapshot.empty()) {
        return;
    }

#ifndef _WIN32
    // Unmask Boehm GC thread suspend/restart signals on foreign threads before registering.
    sigset_t set;
    sigemptyset(&set);
    for (const auto &mod : modules_snapshot) {
        if (mod.get_suspend_signal) {
            int sig = mod.get_suspend_signal();
            if (sig > 0) sigaddset(&set, sig);
        }
        if (mod.get_thr_restart_signal) {
            int sig = mod.get_thr_restart_signal();
            if (sig > 0) sigaddset(&set, sig);
        }
    }
#ifdef SIGPWR
    sigaddset(&set, SIGPWR);
#endif
#ifdef SIGXCPU
    sigaddset(&set, SIGXCPU);
#endif
#if defined(SIGRTMIN) && defined(SIGRTMAX)
    for (int s = SIGRTMIN; s <= SIGRTMAX; s++) {
        sigaddset(&set, s);
    }
#elif defined(__SIGRTMIN) && defined(__SIGRTMAX)
    for (int s = __SIGRTMIN; s <= __SIGRTMAX; s++) {
        sigaddset(&set, s);
    }
#endif
    pthread_sigmask(SIG_UNBLOCK, &set, nullptr);
#endif

    struct GC_stack_base sb;
    sb.mem_base = nullptr;
    int rc = -1;

    for (const auto &mod : modules_snapshot) {
        if (mod.get_stack_base) {
            rc = mod.get_stack_base(&sb);
            if (rc == 0 && sb.mem_base != nullptr) {
                break;
            }
        }
    }

#if defined(__APPLE__)
    if (rc != 0 || sb.mem_base == nullptr) {
        sb.mem_base = pthread_get_stackaddr_np(pthread_self());
        rc = 0;
    }
#elif defined(__linux__)
    if (rc != 0 || sb.mem_base == nullptr) {
        pthread_attr_t attr;
        if (pthread_getattr_np(pthread_self(), &attr) == 0) {
            void *stack_addr = nullptr;
            size_t stack_size = 0;
            pthread_attr_getstack(&attr, &stack_addr, &stack_size);
            pthread_attr_destroy(&attr);
            if (stack_addr) {
                sb.mem_base = (void*)((uintptr_t)stack_addr + stack_size);
                rc = 0;
            }
        }
    }
#endif

    if (rc == 0 && sb.mem_base != nullptr) {
        for (const auto &mod : modules_snapshot) {
            if (mod.register_my_thread) {
                if (mod.thread_is_registered && mod.thread_is_registered()) {
                    continue;
                }
                mod.register_my_thread(&sb);
            }
        }
        t_gc_registered_module_count = modules_snapshot.size();
    }
}
