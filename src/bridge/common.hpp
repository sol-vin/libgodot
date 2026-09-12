#pragma once

/**
 * ==============================================================================
 * LibGodot - Common Platform Definitions & Crash Diagnostics
 * ==============================================================================
 */

#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#define GDE_EXPORT __declspec(dllexport)
#else
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <dlfcn.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <dirent.h>
#include <time.h>
#include <fcntl.h>
#define GDE_EXPORT __attribute__((visibility("default")))
#define HMODULE void*
#ifndef MAX_PATH
#define MAX_PATH 4096
#endif
#ifndef RTLD_NEXT
#define RTLD_NEXT ((void *) -1l)
#endif
#endif

#include <cstdint>
#include <cstdio>
#include <cstring>
#include <string>
#include <string_view>
#include <vector>
#include <deque>
#include <unordered_set>
#include <unordered_map>
#include <utility>
#include <memory>
#include <algorithm>

#include "gdextension_interface.h"

#ifdef _WIN32
// Custom crash handler for Windows SEH to produce diagnostic crash dumps
static LONG WINAPI custom_crash_handler(PEXCEPTION_POINTERS pExceptionInfo) {
    DWORD code = pExceptionInfo->ExceptionRecord->ExceptionCode;
    if (code == EXCEPTION_ACCESS_VIOLATION || code == 0xC0000374) {
        void *faulting_addr = pExceptionInfo->ExceptionRecord->ExceptionAddress;

        HMODULE hMod = NULL;
        char mod_name[MAX_PATH] = "Unknown";
        if (GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                               (LPCSTR)faulting_addr, &hMod)) {
            GetModuleFileNameA(hMod, mod_name, sizeof(mod_name));
        }

        char report[4096];
        int pos = snprintf(report, sizeof(report),
            "\n==================== CRASH INTERCEPTED ====================\n"
            "Exception Code: 0x%08lx (%s)\n"
            "Faulting instruction at: %p in module %s (offset 0x%llx)\n"
            "Callstack:\n",
            (unsigned long)code, (code == 0xC0000374 ? "STATUS_HEAP_CORRUPTION" : "ACCESS_VIOLATION"),
            faulting_addr, mod_name, (unsigned long long)((uintptr_t)faulting_addr - (uintptr_t)hMod));

        void *backtrace[32];
        WORD count = CaptureStackBackTrace(0, 32, backtrace, NULL);
        for (int i = 0; i < count && pos < (int)sizeof(report) - 128; i++) {
            HMODULE frame_mod = NULL;
            char frame_mod_name[MAX_PATH] = "Unknown";
            if (GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                                   (LPCSTR)backtrace[i], &frame_mod)) {
                GetModuleFileNameA(frame_mod, frame_mod_name, sizeof(frame_mod_name));
            }
            const char *base_name = strrchr(frame_mod_name, '\\');
            base_name = base_name ? base_name + 1 : frame_mod_name;
            pos += snprintf(report + pos, sizeof(report) - pos,
                "  [%02d] %p (%s + 0x%llx)\n", i, backtrace[i], base_name,
                (unsigned long long)((uintptr_t)backtrace[i] - (uintptr_t)frame_mod));
        }
        if (pos < (int)sizeof(report) - 64) {
            pos += snprintf(report + pos, sizeof(report) - pos,
                "===========================================================\n\n");
        }

        FILE *f = fopen("crash_dump.log", "w");
        if (f) {
            fputs(report, f);
            fclose(f);
        }

        DWORD written = 0;
        HANDLE hErr = GetStdHandle(STD_ERROR_HANDLE);
        if (hErr && hErr != INVALID_HANDLE_VALUE) {
            WriteFile(hErr, report, (DWORD)pos, &written, NULL);
        }
        HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
        if (hOut && hOut != INVALID_HANDLE_VALUE) {
            WriteFile(hOut, report, (DWORD)pos, &written, NULL);
        }
        fputs(report, stderr);
        fflush(stderr);
    }
    return EXCEPTION_CONTINUE_SEARCH;
}
#endif
