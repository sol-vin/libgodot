#pragma once

#include "common.hpp"

#ifndef _WIN32
#include <signal.h>
#include <pthread.h>
#endif

/**
 * ==============================================================================
 * LibGodot - Boehm GC Multi-Threading & Foreign Engine Thread Registration
 * ==============================================================================
 */

struct GC_stack_base {
    void *mem_base;
};

using GCGetStackBaseFn = int (*)(struct GC_stack_base *sb);
using GCRegisterMyThreadFn = int (*)(const struct GC_stack_base *sb);
using GCThreadIsRegisteredFn = int (*)(void);
using GCAllowRegisterThreadsFn = void (*)(void);
using GCInitFn = void (*)(void);
using GCGetSuspendSignalFn = int (*)(void);

static GCGetStackBaseFn gd_gc_get_stack_base = nullptr;
static GCRegisterMyThreadFn gd_gc_register_my_thread = nullptr;
static GCThreadIsRegisteredFn gd_gc_thread_is_registered = nullptr;
static GCAllowRegisterThreadsFn gd_gc_allow_register_threads = nullptr;
static GCInitFn gd_gc_init = nullptr;
static GCGetSuspendSignalFn gd_gc_get_suspend_signal = nullptr;
using GCGetThrRestartSignalFn = int (*)(void);
static GCGetThrRestartSignalFn gd_gc_get_thr_restart_signal = nullptr;

static thread_local bool t_gc_thread_registered = false;
static void *s_cached_game_module = nullptr;

#ifndef _WIN32
// Hook pthread_sigmask on POSIX so whenever Godot worker threads (WorkerThreadPool)
// mask signals, Boehm GC's thread suspension/restart signals remain unblocked.
// This prevents Boehm GC from aborting with "Signals delivery fails constantly".
extern "C" GDE_EXPORT int pthread_sigmask(int how, const sigset_t *set, sigset_t *oldset) {
    static int (*real_sigmask)(int, const sigset_t *, sigset_t *) = nullptr;
    if (!real_sigmask) {
        real_sigmask = (int (*)(int, const sigset_t *, sigset_t *))dlsym(RTLD_NEXT, "pthread_sigmask");
    }
    if (!set || !real_sigmask) {
        return real_sigmask ? real_sigmask(how, set, oldset) : 0;
    }
    if (how == SIG_BLOCK || how == SIG_SETMASK) {
        sigset_t mod_set = *set;
        if (gd_gc_get_suspend_signal) {
            int sig = gd_gc_get_suspend_signal();
            if (sig > 0) sigdelset(&mod_set, sig);
        }
        if (gd_gc_get_thr_restart_signal) {
            int sig = gd_gc_get_thr_restart_signal();
            if (sig > 0) sigdelset(&mod_set, sig);
        }
#ifdef SIGPWR
        sigdelset(&mod_set, SIGPWR);
#endif
#ifdef SIGXCPU
        sigdelset(&mod_set, SIGXCPU);
#endif
        return real_sigmask(how, &mod_set, oldset);
    }
    return real_sigmask(how, set, oldset);
}
#endif

inline void init_gc_library(void *game_module_handle = nullptr) {
    if (game_module_handle) {
        s_cached_game_module = game_module_handle;
    } else {
        game_module_handle = s_cached_game_module;
    }
    if (!gd_gc_register_my_thread) {
#ifdef _WIN32
        HMODULE hGc = GetModuleHandleA("gc.dll");
        if (!hGc) hGc = LoadLibraryA("gc.dll");
        if (hGc) {
            gd_gc_init = reinterpret_cast<GCInitFn>(GetProcAddress(hGc, "GC_init"));
            gd_gc_allow_register_threads = reinterpret_cast<GCAllowRegisterThreadsFn>(GetProcAddress(hGc, "GC_allow_register_threads"));
            gd_gc_get_stack_base = reinterpret_cast<GCGetStackBaseFn>(GetProcAddress(hGc, "GC_get_stack_base"));
            gd_gc_register_my_thread = reinterpret_cast<GCRegisterMyThreadFn>(GetProcAddress(hGc, "GC_register_my_thread"));
            gd_gc_thread_is_registered = reinterpret_cast<GCThreadIsRegisteredFn>(GetProcAddress(hGc, "GC_thread_is_registered"));
            if (gd_gc_init) gd_gc_init();
            if (gd_gc_allow_register_threads) gd_gc_allow_register_threads();
        }
#else
        void *hGc = nullptr;
        if (game_module_handle) {
            gd_gc_register_my_thread = reinterpret_cast<GCRegisterMyThreadFn>(dlsym(game_module_handle, "GC_register_my_thread"));
            if (gd_gc_register_my_thread) hGc = game_module_handle;
        }
        if (!gd_gc_register_my_thread) {
            gd_gc_register_my_thread = reinterpret_cast<GCRegisterMyThreadFn>(dlsym(RTLD_DEFAULT, "GC_register_my_thread"));
            if (gd_gc_register_my_thread) hGc = RTLD_DEFAULT;
        }
        if (!gd_gc_register_my_thread) {
            const char *gc_libs[] = { "libgc.so.1", "libgc.so", "libgc.dylib" };
            for (size_t i = 0; i < sizeof(gc_libs) / sizeof(gc_libs[0]); i++) {
                void *hLib = dlopen(gc_libs[i], RTLD_LAZY | RTLD_GLOBAL);
                if (hLib) {
                    gd_gc_register_my_thread = reinterpret_cast<GCRegisterMyThreadFn>(dlsym(hLib, "GC_register_my_thread"));
                    if (gd_gc_register_my_thread) {
                        hGc = hLib;
                        break;
                    }
                }
            }
        }
        if (gd_gc_register_my_thread && hGc) {
            gd_gc_init = reinterpret_cast<GCInitFn>(dlsym(hGc, "GC_init"));
            gd_gc_allow_register_threads = reinterpret_cast<GCAllowRegisterThreadsFn>(dlsym(hGc, "GC_allow_register_threads"));
            gd_gc_get_stack_base = reinterpret_cast<GCGetStackBaseFn>(dlsym(hGc, "GC_get_stack_base"));
            gd_gc_thread_is_registered = reinterpret_cast<GCThreadIsRegisteredFn>(dlsym(hGc, "GC_thread_is_registered"));
            gd_gc_get_suspend_signal = reinterpret_cast<GCGetSuspendSignalFn>(dlsym(hGc, "GC_get_suspend_signal"));
            gd_gc_get_thr_restart_signal = reinterpret_cast<GCGetThrRestartSignalFn>(dlsym(hGc, "GC_get_thr_restart_signal"));
            static bool s_gc_initialized = false;
            if (!s_gc_initialized) {
                if (gd_gc_init) gd_gc_init();
                if (gd_gc_allow_register_threads) gd_gc_allow_register_threads();
                s_gc_initialized = true;
            }
        }
#endif
    }
}

inline void ensure_gc_thread_registered() {
    if (t_gc_thread_registered) return;
    init_gc_library();
#ifndef _WIN32
    // Unmask Boehm GC thread suspend/restart signals on foreign threads before registering.
    sigset_t set;
    sigemptyset(&set);
    if (gd_gc_get_suspend_signal) {
        int sig = gd_gc_get_suspend_signal();
        if (sig > 0) sigaddset(&set, sig);
    }
    if (gd_gc_get_thr_restart_signal) {
        int sig = gd_gc_get_thr_restart_signal();
        if (sig > 0) sigaddset(&set, sig);
    }
#ifdef SIGPWR
    sigaddset(&set, SIGPWR);
#endif
#ifdef SIGXCPU
    sigaddset(&set, SIGXCPU);
#endif
    pthread_sigmask(SIG_UNBLOCK, &set, nullptr);
#endif
    if (gd_gc_register_my_thread) {
        if (gd_gc_thread_is_registered && gd_gc_thread_is_registered()) {
            t_gc_thread_registered = true;
            return;
        }
        struct GC_stack_base sb;
        sb.mem_base = nullptr;
        int rc = -1;
        if (gd_gc_get_stack_base) {
            rc = gd_gc_get_stack_base(&sb);
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
            gd_gc_register_my_thread(&sb);
            t_gc_thread_registered = true;
        }
    }
}
