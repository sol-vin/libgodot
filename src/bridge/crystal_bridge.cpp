/**
 * ==============================================================================
 * LibGodot for Crystal - GDExtension Loader Bridge (crystal_bridge.cpp)
 * ==============================================================================
 *
 * Architecture & Design:
 * ----------------------
 * This file implements the native C++ GDExtension loader bridge connecting the
 * Godot Engine 4.x runtime to dynamically compiled Crystal shared libraries
 * (game.dll on Windows, game.so on Linux).
 *
 * Key Responsibilities:
 * 1. GDExtension Lifecycle Host:
 *    Godot loads this shared library at startup (configured via crystal.gdextension).
 *    This bridge captures Godot's C-API function pointers through the entry point
 *    `crystal_library_init` and initializes the scene-level GDExtension module.
 *
 * 2. Dynamic Crystal Library Loading & Hot-Reloading:
 *    - Development / Editor Mode:
 *      When running in the Godot Editor or during development, the bridge creates
 *      a temporary shadow copy (`game_loaded_<PID>_<timestamp>.dll/so`) before loading.
 *      This bypasses Windows DLL file locks (`ERROR_SHARING_VIOLATION`) so the Crystal
 *      compiler can rebuild `game.dll` live while Godot remains open.
 *    - Release / Production Mode:
 *      When built with `LIBGODOT_RELEASE` or `NDEBUG`, shadow copying is disabled.
 *      The bridge directly loads `game.dll` or `game.so` without file copying overhead.
 *
 * 3. ClassDB Bridge & Reflection:
 *    Crystal classes declared with `@register_class` or subclassing Godot nodes
 *    (e.g. Node, Node3D, CharacterBody3D) are registered dynamically into Godot's
 *    ClassDB via `gd_classdb_register_extension_class6`.
 *
 * 4. Instance & Virtual Method Dispatch:
 *    Bridges Godot lifecycle callbacks (`_ready`, `_process`, `_physics_process`)
 *    and property getters/setters between Godot's Object instances and the Crystal
 *    heap instance wrappers (`GenericExtensionInstance`).
 *
 * 5. C-ABI Interface Table (`BridgeAPI`):
 *    Exposes a stable C function-pointer table to Crystal (`crystal_godot_init`),
 *    enabling Crystal game code to interact with Godot's engine singletons, node
 *    trees, signals, RPCs, and PackedScenes with zero C++ header dependencies.
 * ==============================================================================
 */

#ifdef _WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#define GDE_EXPORT __declspec(dllexport)
#else
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
#endif
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <vector>
#include <deque>
#include <string>
#include <unordered_set>
#include <unordered_map>
#include <utility>

#include "gdextension_interface.h"

#ifdef _WIN32
static LONG WINAPI custom_crash_handler(PEXCEPTION_POINTERS pExceptionInfo);
#endif

// ==============================================================================
// Cached Function Pointers from Godot Engine (GDExtension Interface)
// ==============================================================================
// Populated in crystal_library_init() via p_get_proc_address callback.

/** Master interface symbol resolver supplied by Godot */
static GDExtensionInterfaceGetProcAddress gd_get_proc_address = nullptr;

/** Creates a Godot StringName instance from a null-terminated UTF-8 C-string */
static GDExtensionInterfaceStringNameNewWithUtf8Chars gd_string_name_new_with_utf8_chars = nullptr;

/** Creates a Godot String instance from a null-terminated UTF-8 C-string */
static GDExtensionInterfaceStringNewWithUtf8Chars gd_string_new_with_utf8_chars = nullptr;

/** Destroys a Godot Variant instance and releases its internal refcounts */
static GDExtensionInterfaceVariantDestroy gd_variant_destroy = nullptr;

/** Instantiates an uninitialized Godot Object of the given ClassDB class name */
static GDExtensionInterfaceClassdbConstructObject gd_classdb_construct_object = nullptr;

/** Destroys an Object via GDExtension interface */
static GDExtensionInterfaceObjectDestroy gd_object_destroy = nullptr;

/** Sets the Object referenced by a Ref<T> pointer */
static GDExtensionInterfaceRefSetObject gd_ref_set_object = nullptr;

/** Gets the Object referenced by a Ref<T> pointer */
static GDExtensionInterfaceRefGetObject gd_ref_get_object = nullptr;

/** Retrieves the 64-bit instance ID of an Object */
static GDExtensionInterfaceObjectGetInstanceId gd_object_get_instance_id = nullptr;

/** Binds a custom extension instance pointer (GenericExtensionInstance) to a Godot Object */
static GDExtensionInterfaceObjectSetInstance gd_object_set_instance = nullptr;

/** Registers a custom GDExtension class into Godot's ClassDB with lifecycle callbacks */
static GDExtensionInterfaceClassdbRegisterExtensionClass6 gd_classdb_register_extension_class6 = nullptr;

/** Unregisters a custom GDExtension class from Godot's ClassDB during shutdown */
static GDExtensionInterfaceClassdbUnregisterExtensionClass gd_classdb_unregister_extension_class = nullptr;

/** Registers an exported property (inspector variable) for a registered extension class */
static GDExtensionInterfaceClassdbRegisterExtensionClassProperty gd_classdb_register_extension_class_property = nullptr;

/** Registers a property group for an extension class in ClassDB */
static GDExtensionInterfaceClassdbRegisterExtensionClassPropertyGroup gd_classdb_register_extension_class_property_group = nullptr;

/** Registers a property subgroup for an extension class in ClassDB */
static GDExtensionInterfaceClassdbRegisterExtensionClassPropertySubgroup gd_classdb_register_extension_class_property_subgroup = nullptr;

/** Registers an integer or enum constant for an extension class in ClassDB */
static GDExtensionInterfaceClassdbRegisterExtensionClassIntegerConstant gd_classdb_register_extension_class_integer_constant = nullptr;

/** Registers a custom signal for a registered extension class */
static GDExtensionInterfaceClassdbRegisterExtensionClassSignal gd_classdb_register_extension_class_signal = nullptr;

/** Registers a custom callable method on an extension class */
static GDExtensionInterfaceClassdbRegisterExtensionClassMethod gd_classdb_register_extension_class_method = nullptr;

/** Retrieves a cached MethodBind pointer by class name, method name, and method hash */
static GDExtensionInterfaceClassdbGetMethodBind gd_classdb_get_method_bind = nullptr;

/** Executes a MethodBind via high-performance raw pointer call (ptrcall) */
static GDExtensionInterfaceObjectMethodBindPtrcall gd_object_method_bind_ptrcall = nullptr;

/** Executes a MethodBind via universal Variant call (supports varargs and dynamic dispatch) */
static GDExtensionInterfaceObjectMethodBindCall gd_object_method_bind_call = nullptr;

/** Loads XML editor documentation into Godot's in-engine Help system */
static GDExtensionsInterfaceEditorHelpLoadXmlFromUtf8Chars gd_editor_help_load_xml_from_utf8_chars = nullptr;

/** Retrieves engine global singletons (e.g., Engine, Input, ResourceLoader) by name */
static GDExtensionInterfaceGlobalGetSingleton gd_global_get_singleton = nullptr;

/** Retrieves a constructor function to box a native C type into a Godot Variant */
static GDExtensionInterfaceGetVariantFromTypeConstructor gd_get_variant_from_type_constructor = nullptr;

/** Retrieves a constructor function to unbox a Godot Variant into a native C type */
static GDExtensionInterfaceGetVariantToTypeConstructor gd_get_variant_to_type_constructor = nullptr;

// ==============================================================================
// Godot Engine Diagnostic & Logging Interfaces
// ==============================================================================

/** Logs an error to Godot's debugger and standard error */
static GDExtensionInterfacePrintError gd_print_error = nullptr;

/** Logs an error with a detailed message to Godot's debugger */
static GDExtensionInterfacePrintErrorWithMessage gd_print_error_with_message = nullptr;

/** Logs a warning to Godot's debugger and standard error */
static GDExtensionInterfacePrintWarning gd_print_warning = nullptr;

/** Logs a warning with a detailed message to Godot's debugger */
static GDExtensionInterfacePrintWarningWithMessage gd_print_warning_with_message = nullptr;

/** Looks up built-in utility functions (e.g. print, printerr) by name and hash */
static GDExtensionInterfaceVariantGetPtrUtilityFunction gd_variant_get_ptr_utility_function = nullptr;

/** Looks up the constructor function for a specific Variant type */
static GDExtensionInterfaceVariantGetPtrConstructor gd_variant_get_ptr_constructor = nullptr;

/** Looks up the destructor function for a specific Variant type */
static GDExtensionInterfaceVariantGetPtrDestructor gd_variant_get_ptr_destructor = nullptr;

/** Looks up a built-in method on a Variant type */
static GDExtensionInterfaceVariantGetPtrBuiltinMethod gd_variant_get_ptr_builtin_method = nullptr;

/** Looks up a keyed setter function for a Variant type (e.g. Dictionary) */
static GDExtensionInterfaceVariantGetPtrKeyedSetter gd_variant_get_ptr_keyed_setter = nullptr;

/** Cached constructor for NodePath(const String &) */
static GDExtensionPtrConstructor gd_nodepath_from_string = nullptr;

/** Cached destructor for NodePath */
static GDExtensionPtrDestructor gd_nodepath_destroy = nullptr;

/** Cached constructor for String(const StringName &) */
static GDExtensionPtrConstructor gd_string_from_string_name = nullptr;

/** Cached utility function pointer for print() */
static GDExtensionPtrUtilityFunction gd_util_print = nullptr;

/** Cached utility function pointer for printerr() */
static GDExtensionPtrUtilityFunction gd_util_printerr = nullptr;

/** Constructor to convert Godot String -> Variant */
static GDExtensionVariantFromTypeConstructorFunc gd_variant_from_string = nullptr;

/** Destructor for Godot String */
static GDExtensionPtrDestructor gd_string_destroy = nullptr;

/** Destructor for Godot StringName */
static GDExtensionPtrDestructor gd_string_name_destroy = nullptr;

/** Queries the GDExtensionVariantType enum of a given Variant */
static GDExtensionInterfaceVariantGetType gd_variant_get_type = nullptr;

/** Retrieves the 64-bit ObjectID from an Object-type Variant */
static GDExtensionInterfaceVariantGetObjectInstanceId gd_variant_get_object_instance_id = nullptr;

/** Resolves an Object pointer from a 64-bit ObjectID */
static GDExtensionInterfaceObjectGetInstanceFromId gd_object_get_instance_from_id = nullptr;

/** Stringifies any Variant into a Godot String */
static GDExtensionInterfaceVariantStringify gd_variant_stringify = nullptr;

/** Extracts UTF-8 character bytes from a Godot String */
static GDExtensionInterfaceStringToUtf8Chars gd_string_to_utf8_chars = nullptr;

/** Internal getter function type for accessing raw Object pointers inside Variants */
typedef GDExtensionVariantGetInternalPtrFunc (*GDExtensionInterfaceVariantGetPtrInternalGetter)(GDExtensionVariantType p_type);
static GDExtensionVariantGetInternalPtrFunc gd_variant_get_internal_ptr_object = nullptr;

/** Library handle passed to GDExtension at initialization, required for class registration */
static GDExtensionClassLibraryPtr g_library = nullptr;

/** Custom Callable interface pointers for connecting Godot signals to Crystal callbacks */
static GDExtensionInterfaceCallableCustomCreate2 gd_callable_custom_create2 = nullptr;
static GDExtensionInterfaceCallableCustomCreate gd_callable_custom_create = nullptr;
static GDExtensionInterfaceVariantNewNil gd_variant_new_nil = nullptr;
static GDExtensionPtrDestructor gd_callable_destroy = nullptr;

typedef void (*CrystalSignalCallbackFn)(uint64_t target_id, const char *signal_name, const char **args, int arg_count);
static std::vector<CrystalSignalCallbackFn> g_crystal_signal_callbacks;

static GDExtensionMethodBindPtr mb_object_connect = nullptr;
static GDExtensionMethodBindPtr mb_object_is_connected = nullptr;
static GDExtensionMethodBindPtr mb_object_disconnect = nullptr;
static GDExtensionMethodBindPtr mb_object_has_signal = nullptr;

// ==============================================================================
// Variant & Object Marshaling Helpers
// ==============================================================================

/**
 * Extracts a native Godot Object pointer from a Variant buffer.
 *
 * Uses three sequential fallback strategies to guarantee robust Object unboxing
 * across different Godot 4.x minor versions:
 * 1. Fast Path: variant_get_internal_ptr_object (direct pointer access, fastest).
 * 2. Standard Path: get_variant_to_type_constructor (official type unboxing).
 * 3. Fallback Path: get_object_instance_id + get_instance_from_id (safe ID lookup).
 *
 * @param variant Pointer to the Godot Variant memory (24 bytes).
 * @return GDExtensionObjectPtr or nullptr if invalid or null.
 */
static GDExtensionObjectPtr bridge_object_from_variant(const void *variant) {
    if (!variant) return nullptr;
    if (gd_variant_get_type && gd_variant_get_type((GDExtensionConstVariantPtr)variant) != GDEXTENSION_VARIANT_TYPE_OBJECT) {
        return nullptr;
    }
    if (gd_variant_get_internal_ptr_object) {
        void *internal_ptr = gd_variant_get_internal_ptr_object((GDExtensionVariantPtr)variant);
        if (internal_ptr) {
            GDExtensionObjectPtr obj = *(GDExtensionObjectPtr*)internal_ptr;
            if (obj) return obj;
        }
    }
    GDExtensionObjectPtr obj = nullptr;
    if (gd_get_variant_to_type_constructor) {
        GDExtensionTypeFromVariantConstructorFunc conv = gd_get_variant_to_type_constructor(GDEXTENSION_VARIANT_TYPE_OBJECT);
        if (conv) {
            conv(&obj, (GDExtensionVariantPtr)variant);
            if (obj) return obj;
        }
    }
    if (gd_variant_get_object_instance_id && gd_object_get_instance_from_id) {
        GDObjectInstanceID id = gd_variant_get_object_instance_id(variant);
        if (id != 0) {
            return gd_object_get_instance_from_id(id);
        }
    }
    return nullptr;
}

/**
 * Unboxes a Godot Variant into a raw C/Crystal destination buffer based on variant_type.
 *
 * @param variant_type The GDExtensionVariantType enum value.
 * @param dst Pointer to the destination buffer allocated by Crystal.
 * @param variant Pointer to the source Godot Variant.
 */
static void* make_string(const char *str);
static void free_string(void *s);

static void bridge_type_from_variant(int variant_type, void *dst, const void *variant) {
    if (!variant || !dst) return;
    if (variant_type == GDEXTENSION_VARIANT_TYPE_OBJECT) {
        GDExtensionObjectPtr obj = bridge_object_from_variant(variant);
        memcpy(dst, &obj, sizeof(GDExtensionObjectPtr));
        return;
    }
    if (variant_type == GDEXTENSION_VARIANT_TYPE_STRING) {
        static thread_local char s_type_str_buf[1024];
        s_type_str_buf[0] = '\0';
        if (gd_string_to_utf8_chars && gd_get_variant_to_type_constructor) {
            alignas(void*) char gd_str[8] = {0};
            GDExtensionTypeFromVariantConstructorFunc conv = gd_get_variant_to_type_constructor(GDEXTENSION_VARIANT_TYPE_STRING);
            if (conv) {
                conv(gd_str, (GDExtensionVariantPtr)variant);
                int64_t len = gd_string_to_utf8_chars(gd_str, s_type_str_buf, sizeof(s_type_str_buf) - 1);
                if (len >= 0 && len < (int64_t)sizeof(s_type_str_buf)) {
                    s_type_str_buf[len] = '\0';
                }
            }
            if (gd_string_destroy) gd_string_destroy(gd_str);
        }
        *(const char**)dst = s_type_str_buf;
        return;
    }
    if (gd_get_variant_to_type_constructor) {
        GDExtensionTypeFromVariantConstructorFunc conv = gd_get_variant_to_type_constructor((GDExtensionVariantType)variant_type);
        if (conv) {
            conv(dst, (GDExtensionVariantPtr)variant);
        }
    }
}

/**
 * Boxes a raw C/Crystal source buffer into a Godot Variant buffer.
 *
 * @param variant_type The GDExtensionVariantType enum value.
 * @param variant Pointer to the target 24-byte Variant buffer.
 * @param src Pointer to the source raw value (e.g. float, int, Vector3).
 */
static void bridge_variant_from_type(int variant_type, void *variant, const void *src) {
    if (!variant || !src) return;
    if (variant_type == GDEXTENSION_VARIANT_TYPE_STRING) {
        const char *s = *(const char**)src;
        void *gd_str = make_string(s ? s : "");
        if (gd_variant_from_string) {
            gd_variant_from_string(variant, gd_str);
        }
        if (gd_string_destroy) {
            gd_string_destroy(gd_str);
        }
        free(gd_str);
        return;
    }
    if (gd_get_variant_from_type_constructor && variant && src) {
        GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor((GDExtensionVariantType)variant_type);
        if (conv) {
            conv(variant, (GDExtensionTypePtr)src);
        }
    }
}

// ==============================================================================
// Process Management Method Binds
// ==============================================================================

/** Cached MethodBind for Node::set_physics_process(bool) */
static GDExtensionMethodBindPtr mb_set_physics_process = nullptr;

/** Cached MethodBind for Node::set_process(bool) */
static GDExtensionMethodBindPtr mb_set_process = nullptr;

// ==============================================================================
// Godot Engine Diagnostic & Console Logging Helpers
// ==============================================================================

/**
 * Prints an informational message to stdout and to Godot's engine console.
 *
 * @param msg Null-terminated UTF-8 message string.
 */
static void godot_log_print(const char *msg) {
    if (!msg) return;
    printf("%s\n", msg);
    fflush(stdout);

    if (gd_util_print && gd_variant_from_string && gd_string_new_with_utf8_chars && gd_variant_destroy) {
        void *gd_str = malloc(sizeof(void*));
        gd_string_new_with_utf8_chars(gd_str, msg);
        alignas(void*) char var_buf[24];
        gd_variant_from_string(var_buf, gd_str);
        const void *args[1] = { var_buf };
        gd_util_print(nullptr, args, 1);
        gd_variant_destroy(var_buf);
        if (gd_string_destroy) {
            gd_string_destroy(gd_str);
        }
        free(gd_str);
    }
}

/**
 * Prints an error or warning message to stderr and to Godot's engine error output.
 *
 * @param msg Null-terminated UTF-8 error string.
 */
static void godot_log_printerr(const char *msg) {
    if (!msg) return;
    fprintf(stderr, "%s\n", msg);
    fflush(stderr);

    if (gd_util_printerr && gd_variant_from_string && gd_string_new_with_utf8_chars && gd_variant_destroy) {
        void *gd_str = malloc(sizeof(void*));
        gd_string_new_with_utf8_chars(gd_str, msg);
        alignas(void*) char var_buf[24];
        gd_variant_from_string(var_buf, gd_str);
        const void *args[1] = { var_buf };
        gd_util_printerr(nullptr, args, 1);
        gd_variant_destroy(var_buf);
        if (gd_string_destroy) {
            gd_string_destroy(gd_str);
        }
        free(gd_str);
    }
}

/**
 * Reports an error with file, line, and function context through Godot's debugger.
 */
static void godot_log_error(const char *desc, const char *msg, const char *func, const char *file, int line) {
    const char *safe_func = (func && func[0] != '\0') ? func : "libgodot";
    const char *safe_file = (file && file[0] != '\0') ? file : "libgodot.cr";
    const char *safe_desc = desc ? desc : "Unknown error";

    fprintf(stderr, "[ERROR] %s: %s (%s:%d in %s)\n", safe_desc, msg ? msg : "", safe_file, line, safe_func);
    fflush(stderr);

    if (gd_print_error_with_message && msg && msg[0] != '\0') {
        gd_print_error_with_message(safe_desc, msg, safe_func, safe_file, line, 0);
    } else if (gd_print_error) {
        gd_print_error(safe_desc, safe_func, safe_file, line, 0);
    }
}

/**
 * Reports a warning with file, line, and function context through Godot's debugger.
 */
static void godot_log_warning(const char *desc, const char *msg, const char *func, const char *file, int line) {
    const char *safe_func = (func && func[0] != '\0') ? func : "libgodot";
    const char *safe_file = (file && file[0] != '\0') ? file : "libgodot.cr";
    const char *safe_desc = desc ? desc : "Unknown warning";

    fprintf(stderr, "[WARNING] %s: %s (%s:%d in %s)\n", safe_desc, msg ? msg : "", safe_file, line, safe_func);
    fflush(stderr);

    if (gd_print_warning_with_message && msg && msg[0] != '\0') {
        gd_print_warning_with_message(safe_desc, msg, safe_func, safe_file, line, 0);
    } else if (gd_print_warning) {
        gd_print_warning(safe_desc, safe_func, safe_file, line, 0);
    }
}

// ==============================================================================
// String & StringName Allocation Helpers
// ==============================================================================

/** Allocates and initializes a heap-backed Godot StringName instance */
static void* make_string_name(const char *name) {
    void *sn = malloc(sizeof(void*));
    gd_string_name_new_with_utf8_chars(sn, name);
    return sn;
}

/** Destroys and frees a heap-backed Godot StringName instance */
static void free_string_name(void *sn) {
    if (!sn) return;
    if (gd_string_name_destroy) {
        gd_string_name_destroy(sn);
    }
    free(sn);
}

/** Allocates and initializes a heap-backed Godot String instance */
static void* make_string(const char *str) {
    void *s = malloc(sizeof(void*));
    gd_string_new_with_utf8_chars(s, str ? str : "");
    return s;
}

/** Destroys and frees a heap-backed Godot String instance */
static void free_string(void *s) {
    if (!s) return;
    if (gd_string_destroy) {
        gd_string_destroy(s);
    }
    free(s);
}

// ==============================================================================
// Generic Bridge Registration Data Structures (C-ABI)
// ==============================================================================

/**
 * Describes a property exported from a Crystal class to Godot's Inspector.
 */
struct CrystalPropertyDesc {
    const char *name;         /** Property identifier (e.g., "speed", "player_name") */
    const char *type_name;    /** Godot type name (e.g., "float", "Vector3", "Node3D") */
    int variant_type;         /** GDExtensionVariantType enum representing the underlying storage */
    uint32_t hint;            /** PropertyHint enum flags (e.g., PROPERTY_HINT_RANGE) */
    const char *hint_string;  /** Formatting string for the hint (e.g., "0.0,100.0,0.1") */
    uint32_t usage;           /** PropertyUsageFlags bitmask (defaults to PROPERTY_USAGE_DEFAULT) */
};

/**
 * Describes an argument of a custom Godot signal declared in Crystal.
 */
struct CrystalSignalArgDesc {
    const char *name;         /** Argument name */
    int variant_type;         /** GDExtensionVariantType of the parameter */
};

/**
 * Describes a custom Godot signal declared in Crystal.
 */
struct CrystalSignalDesc {
    const char *name;                    /** Signal name (e.g., "health_changed", "goal_scored") */
    int arg_count;                       /** Number of arguments in the signal signature */
    const CrystalSignalArgDesc *args;   /** Array of argument descriptors */
};

struct CrystalConstantDesc {
    const char *enum_name;     /** Name of the enum or empty string */
    const char *constant_name; /** Name of the constant */
    int64_t value;             /** Value of the constant */
    bool is_bitfield;          /** True if part of a bitfield */
};

/**
 * Comprehensive metadata describing a Crystal class exposed to Godot's ClassDB.
 *
 * Contains inheritance details, lifecycle flags, exported properties, signals,
 * and C function pointers dishing back into Crystal runtime dispatchers.
 */
struct CrystalClassDesc {
    const char *name;         /** Registered class name (e.g. "MyPlayer", "ToolTester2D") */
    const char *parent_name;  /** Native or Crystal parent class (e.g. "CharacterBody3D") */
    const char *icon_path;    /** Optional editor icon path (e.g. "res://icon.svg") */
    bool is_virtual;          /** True if class is a virtual/interface class */
    bool is_abstract;         /** True if class cannot be instantiated directly */
    bool is_tool;             /** True if marked @tool (runs in the Godot Editor) */
    bool has_ready;           /** True if the class overrides _ready() */
    bool has_process;         /** True if the class overrides _process(delta) */
    bool has_physics_process; /** True if the class overrides _physics_process(delta) */
    bool has_enter_tree;      /** True if the class overrides _enter_tree() */
    bool has_exit_tree;       /** True if the class overrides _exit_tree() */

    // Crystal Host Callbacks
    /** Allocates a Crystal class instance on the GC heap and binds it to godot_object */
    void* (*create_instance)(const CrystalClassDesc *desc, void *godot_object);

    /** Invoked by Godot when the native Object is deleted to free the Crystal wrapper */
    void (*free_instance)(void *crystal_instance);

    /** Dispatches a virtual lifecycle call (_ready, _process, _physics_process) to Crystal */
    void (*call_virtual)(void *crystal_instance, const char *method_name, double delta);

    /** Invokes Crystal property setter */
    void (*set_property)(void *crystal_instance, const char *prop_name, const void *val_ptr);

    /** Invokes Crystal property getter */
    void (*get_property)(void *crystal_instance, const char *prop_name, void *ret_ptr);

    /** Queries whether the Crystal class overrides a specific virtual method */
    int (*has_virtual_method)(const CrystalClassDesc *desc, const char *method_name);

    /** Invokes a generic virtual method with raw arguments and return pointer */
    void (*call_virtual_with_data)(void *crystal_instance, const char *method_name, const void **args, void *ret);

    int property_count;                     /** Number of exported properties */
    const CrystalPropertyDesc *properties;  /** Array of property descriptors */

    int signal_count;                       /** Number of custom signals */
    const CrystalSignalDesc *signals;       /** Array of signal descriptors */

    int constant_count;                     /** Number of integer/enum constants */
    const CrystalConstantDesc *constants;   /** Array of constant descriptors */

    const CrystalClassDesc *parent_desc;    /** Linked parent CrystalClassDesc if parent is also Crystal */
};

/**
 * Generic instance wrapper linking a native Godot Object to its corresponding
 * Crystal heap object instance and class metadata.
 */
struct GenericExtensionInstance {
    GDExtensionObjectPtr godot_object;  /** Native Godot C++ Object pointer */
    void *crystal_instance;             /** Heap pointer to Crystal object */
    const CrystalClassDesc *desc;       /** Metadata descriptor for the class */
};

/** Global list of registered classes for unregistration on shutdown (deque ensures pointer stability) */
static std::deque<CrystalClassDesc> g_registered_classes;
static GDExtensionInitializationLevel g_current_init_level = GDEXTENSION_INITIALIZATION_SCENE;
static std::vector<std::pair<GDExtensionClassLibraryPtr, CrystalClassDesc*>> g_deferred_editor_classes;
static std::unordered_map<GDExtensionClassLibraryPtr, std::vector<std::string>> g_library_editor_classes;
static std::unordered_map<GDExtensionClassLibraryPtr, std::vector<std::string>> g_library_scene_classes;
static std::unordered_set<std::string> g_all_registered_class_names;
static bool is_editor_class(const CrystalClassDesc *desc);

/**
 * Queries whether the Godot Editor is currently running (Engine.is_editor_hint()).
 * Caches the result to prevent repeated singleton and method lookups on every frame.
 *
 * @return True if running within the Godot editor, false during standalone game execution.
 */
static bool is_editor_active() {
    static int s_cached = -1;
    if (s_cached != -1) return s_cached == 1;

    if (!gd_global_get_singleton || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return false;
    void *sn_engine = make_string_name("Engine");
    GDExtensionObjectPtr engine = gd_global_get_singleton(sn_engine);
    if (!engine) { free_string_name(sn_engine); return false; }
    void *sn_is_editor = make_string_name("is_editor_hint");
    GDExtensionMethodBindPtr mb = gd_classdb_get_method_bind(sn_engine, sn_is_editor, 36873697);
    free_string_name(sn_engine); free_string_name(sn_is_editor);
    if (!mb) return false;
    uint8_t ret_bool = 0;
    gd_object_method_bind_ptrcall(mb, engine, NULL, &ret_bool);
    s_cached = (ret_bool != 0) ? 1 : 0;
    return s_cached == 1;
}

// ==============================================================================
// Boehm GC Multi-Threading & Foreign Engine Thread Registration
// ==============================================================================
struct GC_stack_base {
    void *mem_base;
};

typedef int (*GCGetStackBaseFn)(struct GC_stack_base *sb);
typedef int (*GCRegisterMyThreadFn)(const struct GC_stack_base *sb);
typedef int (*GCThreadIsRegisteredFn)(void);
typedef void (*GCAllowRegisterThreadsFn)(void);
typedef void (*GCInitFn)(void);

static GCGetStackBaseFn gd_gc_get_stack_base = nullptr;
static GCRegisterMyThreadFn gd_gc_register_my_thread = nullptr;
static GCThreadIsRegisteredFn gd_gc_thread_is_registered = nullptr;
static GCAllowRegisterThreadsFn gd_gc_allow_register_threads = nullptr;
static GCInitFn gd_gc_init = nullptr;

static void init_gc_library();

static thread_local bool t_gc_thread_registered = false;

static void ensure_gc_thread_registered() {
    if (t_gc_thread_registered) return;
    init_gc_library();
    if (gd_gc_register_my_thread && gd_gc_get_stack_base) {
        if (gd_gc_thread_is_registered && gd_gc_thread_is_registered()) {
            t_gc_thread_registered = true;
            return;
        }
        struct GC_stack_base sb;
        sb.mem_base = nullptr;
        if (gd_gc_get_stack_base(&sb) == 0) {
            gd_gc_register_my_thread(&sb);
            t_gc_thread_registered = true;
        }
    }
}

// ==============================================================================
// Generic ClassDB Lifecycle & Virtual Callbacks
// ==============================================================================

static bool is_editor_class_name(const char *name) {
    if (!name) return false;
    return (strncmp(name, "Editor", 6) == 0);
}

static bool is_tool_desc(const CrystalClassDesc *desc) {
    if (!desc) return false;
    if (desc->is_tool) return true;
    const CrystalClassDesc *curr = desc;
    while (curr) {
        if (curr->is_tool || is_editor_class_name(curr->parent_name)) return true;
        curr = curr->parent_desc;
    }
    return false;
}

/**
 * Instantiates a new Godot Object for a registered Crystal class.
 *
 * Traverses parent descriptors to determine the root native Godot class
 * (e.g. Node, Node3D, CharacterBody3D), invokes ClassDB to allocate the native
 * object, wraps it in a GenericExtensionInstance, invokes Crystal's create_instance
 * constructor callback, and configures automatic physics/idle processing flags.
 *
 * @param p_class_userdata Pointer to the CrystalClassDesc descriptor.
 * @param p_notify_postinitialize Whether to notify post-initialization.
 * @return Allocated GDExtensionObjectPtr or nullptr on failure.
 */
static GDExtensionObjectPtr generic_class_create(void *p_class_userdata, GDExtensionBool p_notify_postinitialize) {
    ensure_gc_thread_registered();
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    // Find the closest native Godot parent class to construct
    const CrystalClassDesc *root_desc = desc;
    while (root_desc->parent_desc) {
        root_desc = root_desc->parent_desc;
    }
    const char *native_parent = root_desc->parent_name;

    void *parent_sn = make_string_name(native_parent);
    void *class_sn = make_string_name(desc->name);

    GDExtensionObjectPtr obj = gd_classdb_construct_object(parent_sn);
    if (!obj) {
        char err[128];
        snprintf(err, sizeof(err), "Failed to construct base object for %s (%s)", desc->name, native_parent);
        godot_log_error(err, nullptr, "generic_class_create", __FILE__, __LINE__);
        free_string_name(parent_sn); free_string_name(class_sn);
        return nullptr;
    }

    GenericExtensionInstance *inst = new GenericExtensionInstance();
    inst->godot_object = obj;
    inst->desc = desc;
    if (desc->create_instance) {
        inst->crystal_instance = desc->create_instance(desc, obj);
    } else {
        inst->crystal_instance = nullptr;
    }

    gd_object_set_instance(obj, class_sn, (GDExtensionClassInstancePtr)inst);

    bool allow_processing = !is_editor_active() || is_tool_desc(desc);

    // Auto-enable physics process if requested
    if (desc->has_physics_process && mb_set_physics_process && allow_processing) {
        uint8_t enabled = 1;
        const void *args[1] = { &enabled };
        gd_object_method_bind_ptrcall(mb_set_physics_process, obj, args, nullptr);
    }
    // Auto-enable idle process if requested
    if (desc->has_process && mb_set_process && allow_processing) {
        uint8_t enabled = 1;
        const void *args[1] = { &enabled };
        gd_object_method_bind_ptrcall(mb_set_process, obj, args, nullptr);
    }

    free_string_name(parent_sn);
    free_string_name(class_sn);
    return obj;
}

/**
 * Recreates a Crystal extension instance wrapper on an existing native Godot Object.
 * Used during scene deserialization, editor reload, or hot-reload recreation.
 */
static GDExtensionClassInstancePtr generic_class_recreate(void *p_class_userdata, GDExtensionObjectPtr p_object) {
    ensure_gc_thread_registered();
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    GenericExtensionInstance *inst = new GenericExtensionInstance();
    inst->godot_object = p_object;
    inst->desc = desc;
    if (desc->create_instance) {
        inst->crystal_instance = desc->create_instance(desc, p_object);
    } else {
        inst->crystal_instance = nullptr;
    }

    bool allow_processing = !is_editor_active() || is_tool_desc(desc);

    // Auto-enable physics process if requested
    if (desc->has_physics_process && mb_set_physics_process && allow_processing) {
        uint8_t enabled = 1;
        const void *args[1] = { &enabled };
        gd_object_method_bind_ptrcall(mb_set_physics_process, p_object, args, nullptr);
    }
    // Auto-enable idle process if requested
    if (desc->has_process && mb_set_process && allow_processing) {
        uint8_t enabled = 1;
        const void *args[1] = { &enabled };
        gd_object_method_bind_ptrcall(mb_set_process, p_object, args, nullptr);
    }

    return (GDExtensionClassInstancePtr)inst;
}

/**
 * Frees the Crystal extension instance wrapper and invokes Crystal's free_instance callback.
 * Called by Godot when the underlying C++ Object is destroyed.
 */
static void generic_class_free(void *p_class_userdata, GDExtensionClassInstancePtr p_instance) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (inst) {
        if (inst->desc && inst->desc->free_instance && inst->crystal_instance) {
            inst->desc->free_instance(inst->crystal_instance);
        }
        delete inst;
    }
}

/** Dispatches Godot's _physics_process(delta) virtual callback into Crystal */
static void generic_virtual_physics_process(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
    inst->desc->call_virtual(inst->crystal_instance, "_physics_process", delta);
}

/** Dispatches Godot's _process(delta) virtual callback into Crystal */
static void generic_virtual_process(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
    inst->desc->call_virtual(inst->crystal_instance, "_process", delta);
}

/** Dispatches Godot's _ready() virtual callback into Crystal */
static void generic_virtual_ready(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    inst->desc->call_virtual(inst->crystal_instance, "_ready", 0.0);
}

/** Dispatches Godot's _enter_tree() virtual callback into Crystal */
static void generic_virtual_enter_tree(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    inst->desc->call_virtual(inst->crystal_instance, "_enter_tree", 0.0);
}

/** Dispatches Godot's _exit_tree() virtual callback into Crystal */
static void generic_virtual_exit_tree(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    inst->desc->call_virtual(inst->crystal_instance, "_exit_tree", 0.0);
}

/** Dispatches Godot's _build() virtual callback for EditorPlugin into Crystal */
static void generic_virtual_build(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->crystal_instance) return;
    if (r_ret) *(uint8_t*)r_ret = 1;
    if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_build", 0.0);
}

/**
 * Legacy virtual method resolution for Godot 4.1/4.2.
 */
static void *g_sn_pp = nullptr;
static void *g_sn_p = nullptr;
static void *g_sn_r = nullptr;
static void *g_sn_et = nullptr;
static void *g_sn_xt = nullptr;
static void *g_sn_b = nullptr;

static GDExtensionClassCallVirtual generic_class_get_virtual(void *p_class_userdata, GDExtensionConstStringNamePtr p_name) {
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    if (!g_sn_pp) {
        g_sn_pp = make_string_name("_physics_process");
        g_sn_p = make_string_name("_process");
        g_sn_r = make_string_name("_ready");
        g_sn_et = make_string_name("_enter_tree");
        g_sn_xt = make_string_name("_exit_tree");
        g_sn_b = make_string_name("_build");
    }

    if (desc->has_physics_process && memcmp(p_name, g_sn_pp, sizeof(void*)) == 0) {
        return generic_virtual_physics_process;
    }
    if (desc->has_process && memcmp(p_name, g_sn_p, sizeof(void*)) == 0) {
        return generic_virtual_process;
    }
    if (desc->has_ready && memcmp(p_name, g_sn_r, sizeof(void*)) == 0) {
        return generic_virtual_ready;
    }
    if (desc->has_enter_tree && memcmp(p_name, g_sn_et, sizeof(void*)) == 0) {
        return generic_virtual_enter_tree;
    }
    if (desc->has_exit_tree && memcmp(p_name, g_sn_xt, sizeof(void*)) == 0) {
        return generic_virtual_exit_tree;
    }
    if (memcmp(p_name, g_sn_b, sizeof(void*)) == 0) {
        return generic_virtual_build;
    }

    return nullptr;
}

static std::unordered_set<std::string> g_interned_virtual_methods;

static const char* intern_virtual_method(const char *name) {
    if (!name) return nullptr;
    auto it = g_interned_virtual_methods.find(name);
    if (it != g_interned_virtual_methods.end()) {
        return it->c_str();
    }
    auto res = g_interned_virtual_methods.insert(name);
    return res.first->c_str();
}

static bool string_name_to_cstr(GDExtensionConstStringNamePtr sn, char *out, size_t max_len) {
    if (!sn || !out || max_len == 0) return false;
    out[0] = '\0';
    if (!gd_string_from_string_name && gd_variant_get_ptr_constructor) {
        gd_string_from_string_name = gd_variant_get_ptr_constructor(GDEXTENSION_VARIANT_TYPE_STRING, 2);
    }
    if (gd_string_from_string_name && gd_string_to_utf8_chars) {
        alignas(void*) char gd_str[8] = {};
        const GDExtensionConstTypePtr args[1] = { sn };
        gd_string_from_string_name(gd_str, args);

        int64_t len = gd_string_to_utf8_chars(gd_str, out, max_len - 1);
        if (len >= 0 && len < (int64_t)max_len) {
            out[len] = '\0';
        } else {
            out[max_len - 1] = '\0';
        }
        if (gd_string_destroy) gd_string_destroy(gd_str);
        return true;
    }
    return false;
}

/**
 * Resolves virtual call user data for Godot 4 virtual methods.
 * Returning non-null indicates the virtual method is overridden by the extension.
 */
static void *generic_class_get_virtual_call_data(void *p_class_userdata, GDExtensionConstStringNamePtr p_name, uint32_t p_hash) {
    ensure_gc_thread_registered();
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    char method_buf[128];
    if (!string_name_to_cstr(p_name, method_buf, sizeof(method_buf))) {
        return nullptr;
    }

    // Built-in lifecycle methods
    if (strcmp(method_buf, "_ready") == 0) {
        return desc->has_ready ? (void*)intern_virtual_method("_ready") : nullptr;
    }
    if (strcmp(method_buf, "_process") == 0) {
        return desc->has_process ? (void*)intern_virtual_method("_process") : nullptr;
    }
    if (strcmp(method_buf, "_physics_process") == 0) {
        return desc->has_physics_process ? (void*)intern_virtual_method("_physics_process") : nullptr;
    }
    if (strcmp(method_buf, "_enter_tree") == 0) {
        return desc->has_enter_tree ? (void*)intern_virtual_method("_enter_tree") : nullptr;
    }
    if (strcmp(method_buf, "_exit_tree") == 0) {
        return desc->has_exit_tree ? (void*)intern_virtual_method("_exit_tree") : nullptr;
    }
    if (strcmp(method_buf, "_build") == 0) {
        return (void*)intern_virtual_method("_build");
    }

    // Generic virtual method queried via Crystal callback
    if (desc->has_virtual_method && desc->has_virtual_method(desc, method_buf)) {
        return (void*)intern_virtual_method(method_buf);
    }

    return nullptr;
}

/**
 * Dispatches generic virtual methods with arguments and return buffers into Crystal.
 */
static void generic_class_call_virtual_with_data(
    GDExtensionClassInstancePtr p_instance,
    GDExtensionConstStringNamePtr p_name,
    void *p_virtual_call_userdata,
    const GDExtensionConstTypePtr *p_args,
    GDExtensionTypePtr r_ret
) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->crystal_instance) return;

    const char *method_name = (const char*)p_virtual_call_userdata;
    if (!method_name) return;

    if (strcmp(method_name, "_ready") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_ready", 0.0);
        return;
    }
    if (strcmp(method_name, "_process") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_process", delta);
        return;
    }
    if (strcmp(method_name, "_physics_process") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_physics_process", delta);
        return;
    }
    if (strcmp(method_name, "_enter_tree") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_enter_tree", 0.0);
        return;
    }
    if (strcmp(method_name, "_exit_tree") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_exit_tree", 0.0);
        return;
    }
    if (strcmp(method_name, "_build") == 0) {
        if (r_ret) *(uint8_t*)r_ret = 1;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_build", 0.0);
        return;
    }

    if (inst->desc->call_virtual_with_data) {
        inst->desc->call_virtual_with_data(inst->crystal_instance, method_name, (const void**)p_args, (void*)r_ret);
    }
}

/**
 * Dynamic property setter called by Godot's inspector, animations, or scripts.
 *
 * Traverses the class inheritance hierarchy, matches the property name,
 * unboxes the Variant value into a raw type buffer, and passes it to Crystal.
 *
 * @return 1 if the property was handled, 0 otherwise.
 */
static GDExtensionBool generic_class_set(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionConstVariantPtr p_value) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->set_property || !inst->crystal_instance) return 0;

    char prop_name_buf[128];
    if (!string_name_to_cstr(p_name, prop_name_buf, sizeof(prop_name_buf))) return 0;

    const CrystalClassDesc *curr = inst->desc;
    while (curr) {
        for (int i = 0; i < curr->property_count; i++) {
            if (curr->properties[i].usage & (64 | 128 | 256)) continue;
            if (strcmp(prop_name_buf, curr->properties[i].name) == 0) {
                alignas(void*) char raw_buf[128] = {};
                bridge_type_from_variant(curr->properties[i].variant_type, raw_buf, p_value);
                inst->desc->set_property(inst->crystal_instance, curr->properties[i].name, raw_buf);
                return 1;
            }
        }
        curr = curr->parent_desc;
    }
    return 0;
}

/**
 * Dynamic property getter called by Godot's inspector, serialization, or scripts.
 *
 * Traverses the class inheritance hierarchy, retrieves the raw value from Crystal,
 * boxes it into a Godot Variant, and writes to r_ret.
 *
 * @return 1 if the property was handled, 0 otherwise.
 */
static GDExtensionBool generic_class_get(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->get_property || !inst->crystal_instance) return 0;

    char prop_name_buf[128];
    if (!string_name_to_cstr(p_name, prop_name_buf, sizeof(prop_name_buf))) return 0;

    const CrystalClassDesc *curr = inst->desc;
    while (curr) {
        for (int i = 0; i < curr->property_count; i++) {
            if (curr->properties[i].usage & (64 | 128 | 256)) continue;
            if (strcmp(prop_name_buf, curr->properties[i].name) == 0) {
                alignas(void*) char raw_buf[128] = {};
                inst->desc->get_property(inst->crystal_instance, curr->properties[i].name, raw_buf);
                bridge_variant_from_type(curr->properties[i].variant_type, r_ret, raw_buf);
                return 1;
            }
        }
        curr = curr->parent_desc;
    }
    return 0;
}

/**
 * Checks if a class is already registered in Godot's ClassDB (either engine native or another GDExtension module).
 */
static bool is_class_registered_in_engine(const char *name) {
    if (!name || !gd_global_get_singleton || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return false;
    void *sn_cdb = make_string_name("ClassDB");
    GDExtensionObjectPtr cdb = gd_global_get_singleton(sn_cdb);
    free_string_name(sn_cdb);
    if (!cdb) return false;

    static GDExtensionMethodBindPtr mb_exists = nullptr;
    if (!mb_exists) {
        void *sn_c = make_string_name("ClassDB");
        void *sn_m = make_string_name("class_exists");
        mb_exists = gd_classdb_get_method_bind(sn_c, sn_m, 2619796661ULL);
        free_string_name(sn_c); free_string_name(sn_m);
    }
    if (!mb_exists) return false;

    void *sn_target = make_string_name(name);
    const void *args[1] = { sn_target };
    uint8_t ret = 0;
    gd_object_method_bind_ptrcall(mb_exists, cdb, args, &ret);
    free_string_name(sn_target);
    return (ret != 0);
}

static void channel_method_call(
    void *method_userdata,
    GDExtensionClassInstancePtr p_instance,
    const GDExtensionConstVariantPtr *p_args,
    GDExtensionInt p_argument_count,
    GDExtensionVariantPtr r_return,
    GDExtensionCallError *r_error
) {
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->crystal_instance || !inst->desc->call_virtual_with_data) {
        if (r_error) r_error->error = GDEXTENSION_CALL_ERROR_INSTANCE_IS_NULL;
        return;
    }
    if (r_error) r_error->error = GDEXTENSION_CALL_OK;

    const char *mname = (const char*)method_userdata;
    if (!mname) return;

    if (strcmp(mname, "send") == 0 || strcmp(mname, "try_send") == 0) {
        const char *s_val = "";
        char str_buf[1024] = {};
        if (p_argument_count > 0 && p_args && p_args[0]) {
            const char *p_s = str_buf;
            bridge_type_from_variant(GDEXTENSION_VARIANT_TYPE_STRING, &p_s, p_args[0]);
            s_val = p_s ? p_s : "";
        }
        const void *c_args[1] = { s_val };
        uint8_t ret_bool = 0;
        inst->desc->call_virtual_with_data(inst->crystal_instance, mname, c_args, &ret_bool);
        bool b = (ret_bool != 0);
        bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_BOOL, r_return, &b);
    } else if (strcmp(mname, "receive") == 0 || strcmp(mname, "try_receive") == 0) {
        const char *ret_str = nullptr;
        inst->desc->call_virtual_with_data(inst->crystal_instance, mname, nullptr, &ret_str);
        if (ret_str) {
            bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_STRING, r_return, &ret_str);
        } else {
            if (gd_variant_new_nil) gd_variant_new_nil(r_return);
        }
    } else if (strcmp(mname, "close") == 0) {
        inst->desc->call_virtual_with_data(inst->crystal_instance, "close", nullptr, nullptr);
        if (gd_variant_new_nil) gd_variant_new_nil(r_return);
    } else if (strcmp(mname, "size") == 0) {
        int32_t ret_size = 0;
        inst->desc->call_virtual_with_data(inst->crystal_instance, "size", nullptr, &ret_size);
        int64_t ret_i64 = ret_size;
        bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_INT, r_return, &ret_i64);
    } else if (strcmp(mname, "is_empty") == 0 || strcmp(mname, "is_full") == 0 || strcmp(mname, "is_closed") == 0) {
        uint8_t ret_bool = 0;
        inst->desc->call_virtual_with_data(inst->crystal_instance, mname, nullptr, &ret_bool);
        bool b = (ret_bool != 0);
        bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_BOOL, r_return, &b);
    }
}

static void register_channel_methods(void *class_sn) {
    if (!gd_classdb_register_extension_class_method || !g_library) return;

    auto reg_method = [&](const char *name, int ret_type, int arg_count, const char *arg_name, int arg_type) {
        void *sn_name = make_string_name(name);
        std::string ret_name = std::string(name) + "_ret";
        GDExtensionPropertyInfo ret_info = {};
        ret_info.type = (GDExtensionVariantType)ret_type;
        ret_info.name = make_string_name(ret_name.c_str());
        ret_info.class_name = make_string_name("");
        ret_info.hint = 0;
        ret_info.hint_string = make_string("");
        ret_info.usage = 0; // PROPERTY_USAGE_NONE

        GDExtensionPropertyInfo arg_info = {};
        GDExtensionClassMethodArgumentMetadata arg_meta = GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE;
        if (arg_count > 0 && arg_name) {
            arg_info.type = (GDExtensionVariantType)arg_type;
            arg_info.name = make_string_name(arg_name);
            arg_info.class_name = make_string_name("");
            arg_info.hint = 0;
            arg_info.hint_string = make_string("");
            arg_info.usage = 0; // PROPERTY_USAGE_NONE
        }

        GDExtensionClassMethodInfo minfo = {};
        minfo.name = sn_name;
        minfo.method_userdata = (void*)name;
        minfo.call_func = channel_method_call;
        minfo.ptrcall_func = nullptr;
        minfo.method_flags = GDEXTENSION_METHOD_FLAG_NORMAL;
        minfo.has_return_value = (ret_type != GDEXTENSION_VARIANT_TYPE_NIL) ? 1 : 0;
        minfo.return_value_info = (ret_type != GDEXTENSION_VARIANT_TYPE_NIL) ? &ret_info : nullptr;
        minfo.return_value_metadata = GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE;
        minfo.argument_count = arg_count;
        minfo.arguments_info = (arg_count > 0) ? &arg_info : nullptr;
        minfo.arguments_metadata = (arg_count > 0) ? &arg_meta : nullptr;
        minfo.default_argument_count = 0;
        minfo.default_arguments = nullptr;

        gd_classdb_register_extension_class_method(g_library, class_sn, &minfo);

        free_string_name(sn_name);
        free_string_name(ret_info.name);
        free_string_name(ret_info.class_name);
        free_string(ret_info.hint_string);
        if (arg_count > 0) {
            free_string_name(arg_info.name);
            free_string_name(arg_info.class_name);
            free_string(arg_info.hint_string);
        }
    };

    reg_method("send", GDEXTENSION_VARIANT_TYPE_BOOL, 1, "value", GDEXTENSION_VARIANT_TYPE_STRING);
    reg_method("try_send", GDEXTENSION_VARIANT_TYPE_BOOL, 1, "value", GDEXTENSION_VARIANT_TYPE_STRING);
    reg_method("receive", GDEXTENSION_VARIANT_TYPE_STRING, 0, nullptr, 0);
    reg_method("try_receive", GDEXTENSION_VARIANT_TYPE_STRING, 0, nullptr, 0);
    reg_method("close", GDEXTENSION_VARIANT_TYPE_NIL, 0, nullptr, 0);
    reg_method("size", GDEXTENSION_VARIANT_TYPE_INT, 0, nullptr, 0);
    reg_method("is_empty", GDEXTENSION_VARIANT_TYPE_BOOL, 0, nullptr, 0);
    reg_method("is_full", GDEXTENSION_VARIANT_TYPE_BOOL, 0, nullptr, 0);
    reg_method("is_closed", GDEXTENSION_VARIANT_TYPE_BOOL, 0, nullptr, 0);
}

/**
 * Internal helper that executes ClassDB registration with Godot.
 */
static void do_classdb_register(CrystalClassDesc *desc) {
    if (!desc || !g_library) return;
    if (is_class_registered_in_engine(desc->name)) {
        char msg[256];
        snprintf(msg, sizeof(msg), "[CrystalBridge] Notice: Class '%s' already registered with ClassDB in engine. Skipping duplicate registration safely.", desc->name);
        godot_log_print(msg);
        return;
    }

    void *class_sn = make_string_name(desc->name);
    void *parent_sn = make_string_name(desc->parent_name);

    GDExtensionClassCreationInfo6 cinfo = {};
    cinfo.is_virtual = desc->is_virtual ? 1 : 0;
    cinfo.is_abstract = desc->is_abstract ? 1 : 0;
    cinfo.is_exposed = 1;
    cinfo.is_runtime = 0;
    cinfo.icon_path = (desc->icon_path && strlen(desc->icon_path) > 0) ? make_string(desc->icon_path) : nullptr;
    cinfo.set_func = generic_class_set;
    cinfo.get_func = generic_class_get;
    cinfo.create_instance_func = generic_class_create;
    cinfo.free_instance_func = generic_class_free;
    cinfo.recreate_instance_func = generic_class_recreate;
    cinfo.get_virtual_func = nullptr;
    cinfo.get_virtual_call_data_func = generic_class_get_virtual_call_data;
    cinfo.call_virtual_with_data_func = generic_class_call_virtual_with_data;
    cinfo.class_userdata = (void*)desc;

    gd_classdb_register_extension_class6(g_library, class_sn, parent_sn, &cinfo);

    if (cinfo.icon_path) {
        free_string((void*)cinfo.icon_path);
    }

    // Register properties dynamically without arbitrary limits
    for (int i = 0; i < desc->property_count; i++) {
        const CrystalPropertyDesc &p = desc->properties[i];

        if ((p.usage & 64) && gd_classdb_register_extension_class_property_group) {
            void *grp_str = make_string(p.name ? p.name : "");
            void *pfx_str = make_string(p.hint_string ? p.hint_string : "");
            gd_classdb_register_extension_class_property_group(g_library, class_sn, grp_str, pfx_str);
            free_string(grp_str);
            free_string(pfx_str);
            continue;
        }

        if ((p.usage & 256) && gd_classdb_register_extension_class_property_subgroup) {
            void *sub_str = make_string(p.name ? p.name : "");
            void *pfx_str = make_string(p.hint_string ? p.hint_string : "");
            gd_classdb_register_extension_class_property_subgroup(g_library, class_sn, sub_str, pfx_str);
            free_string(sub_str);
            free_string(pfx_str);
            continue;
        }

        GDExtensionPropertyInfo pinfo = {};
        pinfo.type = (GDExtensionVariantType)p.variant_type;
        pinfo.name = make_string_name(p.name);
        pinfo.class_name = make_string_name(p.type_name ? p.type_name : "");
        pinfo.hint = p.hint;
        pinfo.hint_string = make_string(p.hint_string ? p.hint_string : "");
        pinfo.usage = p.usage ? p.usage : 6; // PROPERTY_USAGE_DEFAULT

        void *setter_sn = make_string_name("");
        void *getter_sn = make_string_name("");

        gd_classdb_register_extension_class_property(g_library, class_sn, &pinfo, setter_sn, getter_sn);

        free_string_name(pinfo.name); free_string_name(pinfo.class_name); free_string(pinfo.hint_string);
        free_string_name(setter_sn); free_string_name(getter_sn);
    }

    // Register signals dynamically with vector
    for (int i = 0; i < desc->signal_count; i++) {
        const CrystalSignalDesc &s = desc->signals[i];
        void *sig_sn = make_string_name(s.name);
        std::vector<GDExtensionPropertyInfo> sargs(s.arg_count);
        for (int a = 0; a < s.arg_count; a++) {
            sargs[a].type = (GDExtensionVariantType)s.args[a].variant_type;
            sargs[a].name = make_string_name(s.args[a].name);
            sargs[a].class_name = make_string_name("");
            sargs[a].hint = 0;
            sargs[a].hint_string = make_string("");
            sargs[a].usage = 6;
        }

        gd_classdb_register_extension_class_signal(g_library, class_sn, sig_sn, sargs.data(), s.arg_count);

        free_string_name(sig_sn);
        for (int a = 0; a < s.arg_count; a++) {
            free_string_name(sargs[a].name); free_string_name(sargs[a].class_name); free_string(sargs[a].hint_string);
        }
    }

    // Register class integer / enum constants
    if (gd_classdb_register_extension_class_integer_constant) {
        for (int i = 0; i < desc->constant_count; i++) {
            const CrystalConstantDesc &c = desc->constants[i];
            void *enum_sn = make_string_name(c.enum_name ? c.enum_name : "");
            void *const_sn = make_string_name(c.constant_name ? c.constant_name : "");
            gd_classdb_register_extension_class_integer_constant(
                g_library,
                class_sn,
                enum_sn,
                const_sn,
                (GDExtensionInt)c.value,
                c.is_bitfield ? 1 : 0
            );
            free_string_name(enum_sn);
            free_string_name(const_sn);
        }
    }

    if (strcmp(desc->name, "GodotChannel") == 0) {
        register_channel_methods(class_sn);
    }

    char log_buf[128];
    snprintf(log_buf, sizeof(log_buf), "  [ClassDB] Registered %s < %s", desc->name, desc->parent_name);
    godot_log_print(log_buf);

    if (g_current_init_level == GDEXTENSION_INITIALIZATION_EDITOR || is_editor_class(desc)) {
        g_library_editor_classes[g_library].push_back(std::string(desc->name));
    } else {
        g_library_scene_classes[g_library].push_back(std::string(desc->name));
    }

    free_string_name(class_sn);
    free_string_name(parent_sn);
}

static bool is_editor_class(const CrystalClassDesc *desc) {
    if (!desc || !desc->parent_name) return false;
    if (strncmp(desc->parent_name, "Editor", 6) == 0) return true;
    if (desc->parent_desc) return is_editor_class(desc->parent_desc);
    return false;
}

/**
 * Registers a Crystal class, all its exported properties, and all its signals with Godot ClassDB.
 *
 * Called by Crystal during game library initialization (crystal_godot_init).
 *
 * @param p_desc Pointer to the CrystalClassDesc filled out by Crystal's registration macros.
 * @return 1 on success, 0 on failure.
 */
static int bridge_register_class(const CrystalClassDesc *p_desc) {
    if (!p_desc || !g_library) return 0;

    if (g_all_registered_class_names.find(p_desc->name) != g_all_registered_class_names.end() || is_class_registered_in_engine(p_desc->name)) {
        char log_buf[256];
        snprintf(log_buf, sizeof(log_buf), "[CrystalBridge] Notice: Class '%s' already registered with ClassDB. Skipping duplicate registration safely.", p_desc->name);
        godot_log_print(log_buf);
        return 1;
    }
    g_all_registered_class_names.insert(p_desc->name);

    g_registered_classes.push_back(*p_desc);
    CrystalClassDesc *desc = &g_registered_classes.back();

    // Link parent_desc if parent is also a registered Crystal class
    desc->parent_desc = nullptr;
    for (size_t i = 0; i < g_registered_classes.size() - 1; i++) {
        if (strcmp(g_registered_classes[i].name, desc->parent_name) == 0) {
            desc->parent_desc = &g_registered_classes[i];
            break;
        }
    }

    // Defer editor-specific classes if Godot is still at SCENE initialization level
    if (g_current_init_level < GDEXTENSION_INITIALIZATION_EDITOR && is_editor_class(desc)) {
        char log_buf[128];
        snprintf(log_buf, sizeof(log_buf), "  [ClassDB] Deferring editor class %s < %s to EDITOR level", desc->name, desc->parent_name);
        godot_log_print(log_buf);
        g_deferred_editor_classes.push_back({g_library, desc});
        return 1;
    }

    do_classdb_register(desc);
    return 1;
}

// ==============================================================================
// Method Bind Lookup & Invocation Helpers
// ==============================================================================

/**
 * Resolves a Godot MethodBind pointer by class name, method name, and API hash.
 *
 * @param class_name The Godot class name (e.g. "Node", "Object", "CharacterBody3D").
 * @param method_name The method name (e.g. "set_position", "move_and_slide").
 * @param hash 64-bit API hash generated by Godot's extension API dump.
 * @return GDExtensionMethodBindPtr or nullptr if unresolved.
 */
static GDExtensionMethodBindPtr bridge_get_method_bind(const char *class_name, const char *method_name, int64_t hash) {
    if (!gd_classdb_get_method_bind) return nullptr;
    void *c_sn = make_string_name(class_name);
    void *m_sn = make_string_name(method_name);
    GDExtensionMethodBindPtr mb = gd_classdb_get_method_bind(c_sn, m_sn, hash);
    free_string_name(c_sn); free_string_name(m_sn);
    return mb;
}

/**
 * Invokes a Godot MethodBind via direct pointer call (ptrcall).
 * Fast path: passes raw pointers without Variant boxing.
 *
 * @param method_bind The cached MethodBind pointer.
 * @param instance The target Godot Object instance pointer.
 * @param args Array of raw argument pointers.
 * @param ret Pointer to the return value buffer.
 */
static void bridge_method_bind_ptrcall(GDExtensionMethodBindPtr method_bind, GDExtensionObjectPtr instance, const void **args, void *ret) {
    if (gd_object_method_bind_ptrcall && method_bind && instance) {
        gd_object_method_bind_ptrcall(method_bind, instance, args, ret);
    }
}

/**
 * Invokes a Godot MethodBind via Variant-based call.
 * Standard path: supports variable argument counts and dynamic reflection.
 *
 * @param method_bind The cached MethodBind pointer.
 * @param instance The target Godot Object instance pointer.
 * @param args Array of Variant pointers.
 * @param arg_count Number of arguments.
 * @param ret Variant pointer to receive the return value.
 * @param error Pointer to call error status struct.
 */
static void bridge_method_bind_call(GDExtensionMethodBindPtr method_bind, GDExtensionObjectPtr instance, const GDExtensionConstVariantPtr *args, GDExtensionInt arg_count, GDExtensionVariantPtr ret, GDExtensionCallError *error) {
    if (gd_object_method_bind_call && method_bind && instance) {
        gd_object_method_bind_call(method_bind, instance, args, arg_count, ret, error);
    }
}

// ==============================================================================
// In-Editor XML Help Documentation
// ==============================================================================

/** Internal buffer storing raw XML documentation strings until the editor is ready */
static std::vector<std::string> g_editor_doc_xmls;

/**
 * Queues an XML documentation string for registration with Godot's Help system.
 *
 * @param xml Null-terminated UTF-8 XML documentation string.
 */
static void bridge_load_editor_help_xml(const char *xml) {
    if (!xml) return;
    g_editor_doc_xmls.push_back(std::string(xml));
    if (g_current_init_level >= GDEXTENSION_INITIALIZATION_EDITOR && gd_editor_help_load_xml_from_utf8_chars) {
        gd_editor_help_load_xml_from_utf8_chars(xml);
    }
}

/**
 * Flushes all queued XML documentation strings into Godot's EditorHelp database.
 * Invoked during GDEXTENSION_INITIALIZATION_EDITOR level.
 */
static void bridge_flush_editor_help() {
    if (!gd_editor_help_load_xml_from_utf8_chars) return;
    if (g_editor_doc_xmls.empty()) return;
    for (const auto &xml : g_editor_doc_xmls) {
        gd_editor_help_load_xml_from_utf8_chars(xml.c_str());
    }
    char log_buf[128];
    snprintf(log_buf, sizeof(log_buf), "[CrystalBridge] Flushed %zu EditorHelp XML documentation document(s) into Godot", g_editor_doc_xmls.size());
    godot_log_print(log_buf);
}

/**
 * Retrieves a global Godot singleton instance by name (e.g., "Engine", "Input").
 *
 * @param name Singleton identifier string.
 * @return GDExtensionObjectPtr or nullptr if not registered.
 */
static GDExtensionObjectPtr bridge_get_singleton(const char *name) {
    if (!gd_global_get_singleton) return nullptr;
    void *sn = make_string_name(name);
    GDExtensionObjectPtr s = gd_global_get_singleton(sn);
    free_string_name(sn);
    return s;
}

// ==============================================================================
// Dynamic Vararg Invocation & Signal Dispatch
// ==============================================================================

/**
 * Interop struct for passing typed arguments across the C boundary to Godot.
 * Types: 1=bool, 2=int64, 3=double, 4=string, 5=Vector2, 6=Vector3, 7=Object*
 */
struct BridgeSignalArg {
    int type;            /** Value type identifier */
    const void *data;    /** Pointer to raw argument data */
};

static GDExtensionVariantFromTypeConstructorFunc gd_variant_from_string_name = nullptr;

/**
 * Universal vararg caller for Object methods taking a StringName first argument
 * (e.g. emit_signal(signal_name, ...), call(method_name, ...), call_deferred(method_name, ...)).
 *
 * Automatically converts up to 16 BridgeSignalArg arguments into Godot Variants,
 * performs the call, and cleans up all temporary Variant allocations.
 */
static void bridge_call_method_vararg(GDExtensionMethodBindPtr mb, GDExtensionObjectPtr instance, const char *first_arg_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !first_arg_name || !mb || !gd_object_method_bind_call) return;

    if (!gd_variant_from_string_name && gd_get_variant_from_type_constructor) {
        gd_variant_from_string_name = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_STRING_NAME);
    }

    void *sn = make_string_name(first_arg_name);
    alignas(void*) char var_first_arg[24];
    memset(var_first_arg, 0, sizeof(var_first_arg));
    if (gd_variant_from_string_name) {
        gd_variant_from_string_name(var_first_arg, sn);
    }

    alignas(void*) char var_args[16][24];
    const void *call_args[17];
    call_args[0] = var_first_arg;

    int actual_count = (args && arg_count > 0) ? ((arg_count < 16) ? arg_count : 16) : 0;
    for (int i = 0; i < actual_count; i++) {
        memset(var_args[i], 0, sizeof(var_args[i]));
        int t = args[i].type;
        const void *d = args[i].data;
        if (d) {
            if (t == 1) { // bool
                uint8_t val = *(const uint8_t*)d;
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_BOOL);
                if (conv) conv(var_args[i], &val);
            } else if (t == 2) { // int64
                int64_t val = *(const int64_t*)d;
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_INT);
                if (conv) conv(var_args[i], &val);
            } else if (t == 3) { // double
                double val = *(const double*)d;
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_FLOAT);
                if (conv) conv(var_args[i], &val);
            } else if (t == 4) { // string
                void *gd_str = make_string((const char*)d);
                if (gd_variant_from_string) gd_variant_from_string(var_args[i], gd_str);
                if (gd_string_destroy) gd_string_destroy(gd_str);
                free(gd_str);
            } else if (t == 5) { // Vector2
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_VECTOR2);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            } else if (t == 6) { // Vector3
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_VECTOR3);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            } else if (t == 7) { // Object*
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_OBJECT);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            } else if (t == 8) { // Color
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_COLOR);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            }
        }
        call_args[i + 1] = var_args[i];
    }

    alignas(void*) char var_ret[24];
    memset(var_ret, 0, sizeof(var_ret));
    GDExtensionCallError call_err;
    gd_object_method_bind_call(mb, instance, (const GDExtensionConstVariantPtr*)call_args, actual_count + 1, var_ret, &call_err);

    // Cleanup
    if (gd_variant_destroy) {
        gd_variant_destroy(var_ret);
        for (int i = 0; i < actual_count; i++) {
            gd_variant_destroy(var_args[i]);
        }
        gd_variant_destroy(var_first_arg);
    }
    free_string_name(sn);
}

/**
 * Vararg caller that writes the unboxed return value into a preallocated Variant buffer.
 */
static void bridge_call_method_vararg_ret(GDExtensionMethodBindPtr mb, GDExtensionObjectPtr instance, const char *first_arg_name, const BridgeSignalArg *args, int arg_count, void *r_ret_variant) {
    if (!instance || !first_arg_name || !mb || !gd_object_method_bind_call) return;

    if (!gd_variant_from_string_name && gd_get_variant_from_type_constructor) {
        gd_variant_from_string_name = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_STRING_NAME);
    }

    void *sn = make_string_name(first_arg_name);
    alignas(void*) char var_first_arg[24];
    memset(var_first_arg, 0, sizeof(var_first_arg));
    if (gd_variant_from_string_name) {
        gd_variant_from_string_name(var_first_arg, sn);
    }

    alignas(void*) char var_args[16][24];
    const void *call_args[17];
    call_args[0] = var_first_arg;

    int actual_count = (args && arg_count > 0) ? ((arg_count < 16) ? arg_count : 16) : 0;
    for (int i = 0; i < actual_count; i++) {
        memset(var_args[i], 0, sizeof(var_args[i]));
        int t = args[i].type;
        const void *d = args[i].data;
        if (d) {
            if (t == 1) { // bool
                uint8_t val = *(const uint8_t*)d;
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_BOOL);
                if (conv) conv(var_args[i], &val);
            } else if (t == 2) { // int64
                int64_t val = *(const int64_t*)d;
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_INT);
                if (conv) conv(var_args[i], &val);
            } else if (t == 3) { // double
                double val = *(const double*)d;
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_FLOAT);
                if (conv) conv(var_args[i], &val);
            } else if (t == 4) { // string
                void *gd_str = make_string((const char*)d);
                if (gd_variant_from_string) gd_variant_from_string(var_args[i], gd_str);
                if (gd_string_destroy) gd_string_destroy(gd_str);
                free(gd_str);
            } else if (t == 5) { // Vector2
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_VECTOR2);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            } else if (t == 6) { // Vector3
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_VECTOR3);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            } else if (t == 7) { // Object*
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_OBJECT);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            } else if (t == 8) { // Color
                GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_COLOR);
                if (conv) conv(var_args[i], (GDExtensionTypePtr)d);
            }
        }
        call_args[i + 1] = var_args[i];
    }

    alignas(void*) char var_ret[24];
    memset(var_ret, 0, sizeof(var_ret));
    GDExtensionCallError call_err;
    gd_object_method_bind_call(mb, instance, (const GDExtensionConstVariantPtr*)call_args, actual_count + 1, var_ret, &call_err);

    if (r_ret_variant) {
        memcpy(r_ret_variant, var_ret, 24);
    } else if (gd_variant_destroy) {
        gd_variant_destroy(var_ret);
    }

    if (gd_variant_destroy) {
        for (int i = 0; i < actual_count; i++) {
            gd_variant_destroy(var_args[i]);
        }
        gd_variant_destroy(var_first_arg);
    }
    free_string_name(sn);
}

/**
 * Constructs a native Godot Object by class name via ClassDB.
 *
 * @param class_name The name of the native Godot class (e.g. "Timer", "Sprite2D").
 * @return GDExtensionObjectPtr or nullptr on failure.
 */
static GDExtensionObjectPtr bridge_classdb_construct_object(const char *class_name) {
    if (!gd_classdb_construct_object || !class_name) return nullptr;
    void *sn = make_string_name(class_name);
    GDExtensionObjectPtr obj = gd_classdb_construct_object(sn);
    free_string_name(sn);
    return obj;
}

static GDExtensionMethodBindPtr mb_object_get_instance_id = nullptr;
static GDExtensionPtrUtilityFunction gd_util_is_instance_id_valid = nullptr;
static GDExtensionPtrUtilityFunction gd_util_instance_from_id = nullptr;

/** Destroys an Object via Godot GDExtension interface */
static void bridge_object_destroy(GDExtensionObjectPtr p_o) {
    if (!p_o) return;
    if (gd_object_destroy) {
        gd_object_destroy(p_o);
    }
}

static int64_t bridge_object_call_ret_int(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);

/** Returns the 64-bit instance ID of an Object */
static uint64_t bridge_object_get_instance_id(GDExtensionConstObjectPtr p_o) {
    if (!p_o) return 0;
    uint64_t id = 0;
    if (gd_object_get_instance_id) {
        id = (uint64_t)gd_object_get_instance_id(p_o);
    }
    if (id != 0) return id;

    // Strategy 2: Extract instance ID from Variant representation
    if (gd_variant_get_object_instance_id && gd_get_variant_from_type_constructor) {
        alignas(void*) char var_obj[24] = {0};
        GDExtensionObjectPtr obj_ptr = (GDExtensionObjectPtr)p_o;
        bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_OBJECT, var_obj, &obj_ptr);
        id = (uint64_t)gd_variant_get_object_instance_id(var_obj);
        if (gd_variant_destroy) gd_variant_destroy(var_obj);
    }
    if (id != 0) return id;

    // Strategy 3: Fast ptrcall
    if (gd_classdb_get_method_bind && gd_object_method_bind_ptrcall) {
        if (!mb_object_get_instance_id) {
            void *sn_obj = make_string_name("Object");
            void *sn_gid = make_string_name("get_instance_id");
            mb_object_get_instance_id = gd_classdb_get_method_bind(sn_obj, sn_gid, 3905245786ULL);
            free_string_name(sn_obj); free_string_name(sn_gid);
        }
        if (mb_object_get_instance_id) {
            int64_t ret_id = 0;
            gd_object_method_bind_ptrcall(mb_object_get_instance_id, (GDExtensionObjectPtr)p_o, nullptr, &ret_id);
            id = (uint64_t)ret_id;
        }
    }
    if (id != 0) return id;

    // Strategy 4: Dynamic Object::call("get_instance_id")
    id = (uint64_t)bridge_object_call_ret_int((GDExtensionObjectPtr)p_o, "get_instance_id", nullptr, 0);
    return id;
}

/** Looks up a living Object pointer from its instance ID, or nullptr if dead */
static GDExtensionObjectPtr bridge_object_get_instance_from_id(uint64_t id) {
    if (id == 0) return nullptr;
    if (gd_object_get_instance_from_id) {
        GDExtensionObjectPtr ptr = gd_object_get_instance_from_id((GDObjectInstanceID)id);
        if (ptr) return ptr;
    }
    if (!gd_util_instance_from_id && gd_variant_get_ptr_utility_function && gd_string_name_new_with_utf8_chars) {
        void *sn_ifi = make_string_name("instance_from_id");
        gd_util_instance_from_id = gd_variant_get_ptr_utility_function(sn_ifi, 1156694636ULL);
        free_string_name(sn_ifi);
    }
    if (gd_util_instance_from_id) {
        GDExtensionObjectPtr ret_obj = nullptr;
        int64_t id_i64 = (int64_t)id;
        const void *args[1] = { &id_i64 };
        gd_util_instance_from_id(&ret_obj, (const GDExtensionConstTypePtr*)args, 1);
        return ret_obj;
    }
    return nullptr;
}

/** Fast boolean check whether an Object instance ID is still alive in ObjectDB */
static uint8_t bridge_is_instance_valid(uint64_t id) {
    if (id == 0) return 0;
    if (gd_object_get_instance_from_id && gd_object_get_instance_from_id((GDObjectInstanceID)id) != nullptr) {
        return 1;
    }
    if (!gd_util_is_instance_id_valid && gd_variant_get_ptr_utility_function && gd_string_name_new_with_utf8_chars) {
        void *sn_iiiv = make_string_name("is_instance_id_valid");
        gd_util_is_instance_id_valid = gd_variant_get_ptr_utility_function(sn_iiiv, 2232439758ULL);
        free_string_name(sn_iiiv);
    }
    if (gd_util_is_instance_id_valid) {
        uint8_t is_valid = 0;
        int64_t id_i64 = (int64_t)id;
        const void *args[1] = { &id_i64 };
        gd_util_is_instance_id_valid(&is_valid, (const GDExtensionConstTypePtr*)args, 1);
        return is_valid != 0 ? 1 : 0;
    }
    return 0;
}

static GDExtensionMethodBindPtr mb_object_emit_signal = nullptr;

/**
 * Emits a Godot signal on a target Object instance.
 *
 * @param instance The target Godot Object.
 * @param signal_name The signal identifier to emit.
 * @param args Array of typed arguments.
 * @param arg_count Number of arguments in args.
 */
static void bridge_object_emit_signal(GDExtensionObjectPtr instance, const char *signal_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !signal_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return;
    if (!mb_object_emit_signal) {
        void *sn_obj = make_string_name("Object");
        void *sn_emit = make_string_name("emit_signal");
        mb_object_emit_signal = gd_classdb_get_method_bind(sn_obj, sn_emit, 4047867050ULL);
        free_string_name(sn_obj); free_string_name(sn_emit);
    }
    if (!mb_object_emit_signal) return;
    bridge_call_method_vararg(mb_object_emit_signal, instance, signal_name, args, arg_count);
}

static GDExtensionMethodBindPtr mb_object_call_deferred = nullptr;

/**
 * Calls a method on an Object deferred on Godot's main thread message queue.
 *
 * @param instance The target Godot Object.
 * @param method_name The method identifier to call.
 * @param args Array of typed arguments.
 * @param arg_count Number of arguments.
 */
static void bridge_object_call_deferred(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !method_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return;
    if (!mb_object_call_deferred) {
        void *sn_obj = make_string_name("Object");
        void *sn_cd = make_string_name("call_deferred");
        mb_object_call_deferred = gd_classdb_get_method_bind(sn_obj, sn_cd, 3400424181ULL);
        free_string_name(sn_obj); free_string_name(sn_cd);
    }
    if (!mb_object_call_deferred) return;
    bridge_call_method_vararg(mb_object_call_deferred, instance, method_name, args, arg_count);
}

static GDExtensionMethodBindPtr mb_object_call = nullptr;

/**
 * Synchronously calls a method on an Object via reflection.
 *
 * @param instance The target Godot Object.
 * @param method_name The method identifier to call.
 * @param args Array of typed arguments.
 * @param arg_count Number of arguments.
 */
static void bridge_object_call(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !method_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return;
    if (!mb_object_call) {
        void *sn_obj = make_string_name("Object");
        void *sn_c = make_string_name("call");
        mb_object_call = gd_classdb_get_method_bind(sn_obj, sn_c, 3400424181ULL);
        free_string_name(sn_obj); free_string_name(sn_c);
    }
    if (!mb_object_call) return;
    bridge_call_method_vararg(mb_object_call, instance, method_name, args, arg_count);
}

/** Calls an Object method and unboxes the return value as a Godot Object pointer */
static GDExtensionObjectPtr bridge_object_call_ret_object(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !method_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return nullptr;
    if (!mb_object_call) {
        void *sn_obj = make_string_name("Object");
        void *sn_c = make_string_name("call");
        mb_object_call = gd_classdb_get_method_bind(sn_obj, sn_c, 3400424181ULL);
        free_string_name(sn_obj); free_string_name(sn_c);
    }
    if (!mb_object_call) return nullptr;

    alignas(void*) char var_ret[24] = {0};
    bridge_call_method_vararg_ret(mb_object_call, instance, method_name, args, arg_count, var_ret);

    GDExtensionObjectPtr ret_obj = bridge_object_from_variant(var_ret);
    if (gd_variant_destroy) gd_variant_destroy(var_ret);
    return ret_obj;
}

/** Calls an Object method and unboxes the return value as a 64-bit integer */
static int64_t bridge_object_call_ret_int(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !method_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return 0;
    if (!mb_object_call) {
        void *sn_obj = make_string_name("Object");
        void *sn_c = make_string_name("call");
        mb_object_call = gd_classdb_get_method_bind(sn_obj, sn_c, 3400424181ULL);
        free_string_name(sn_obj); free_string_name(sn_c);
    }
    if (!mb_object_call) return 0;

    alignas(void*) char var_ret[24] = {0};
    bridge_call_method_vararg_ret(mb_object_call, instance, method_name, args, arg_count, var_ret);

    int64_t ret_val = 0;
    bridge_type_from_variant(GDEXTENSION_VARIANT_TYPE_INT, &ret_val, var_ret);
    if (gd_variant_destroy) gd_variant_destroy(var_ret);
    return ret_val;
}

/** Calls an Object method and unboxes the return value as a 64-bit float (double) */
static double bridge_object_call_ret_float(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !method_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return 0.0;
    if (!mb_object_call) {
        void *sn_obj = make_string_name("Object");
        void *sn_c = make_string_name("call");
        mb_object_call = gd_classdb_get_method_bind(sn_obj, sn_c, 3400424181ULL);
        free_string_name(sn_obj); free_string_name(sn_c);
    }
    if (!mb_object_call) return 0.0;

    alignas(void*) char var_ret[24] = {0};
    bridge_call_method_vararg_ret(mb_object_call, instance, method_name, args, arg_count, var_ret);

    double ret_val = 0.0;
    bridge_type_from_variant(GDEXTENSION_VARIANT_TYPE_FLOAT, &ret_val, var_ret);
    if (gd_variant_destroy) gd_variant_destroy(var_ret);
    return ret_val;
}

/** Calls an Object method and unboxes the return value as a boolean */
static bool bridge_object_call_ret_bool(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !method_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return false;
    if (!mb_object_call) {
        void *sn_obj = make_string_name("Object");
        void *sn_c = make_string_name("call");
        mb_object_call = gd_classdb_get_method_bind(sn_obj, sn_c, 3400424181ULL);
        free_string_name(sn_obj); free_string_name(sn_c);
    }
    if (!mb_object_call) return false;

    alignas(void*) char var_ret[24] = {0};
    bridge_call_method_vararg_ret(mb_object_call, instance, method_name, args, arg_count, var_ret);

    uint8_t ret_val = 0;
    bridge_type_from_variant(GDEXTENSION_VARIANT_TYPE_BOOL, &ret_val, var_ret);
    if (gd_variant_destroy) gd_variant_destroy(var_ret);
    return ret_val != 0;
}

/**
 * Calls an Object method, converts the return value to a string via Stringify,
 * and returns a thread-local UTF-8 buffer pointer.
 */
static const char* bridge_object_call_ret_string(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count) {
    static thread_local char s_call_str_buf[1024];
    s_call_str_buf[0] = '\0';
    if (!instance || !method_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return "";
    if (!mb_object_call) {
        void *sn_obj = make_string_name("Object");
        void *sn_c = make_string_name("call");
        mb_object_call = gd_classdb_get_method_bind(sn_obj, sn_c, 3400424181ULL);
        free_string_name(sn_obj); free_string_name(sn_c);
    }
    if (!mb_object_call) return "";

    alignas(void*) char var_ret[24] = {0};
    bridge_call_method_vararg_ret(mb_object_call, instance, method_name, args, arg_count, var_ret);

    if (gd_variant_stringify && gd_string_to_utf8_chars) {
        alignas(void*) char gd_str[8] = {0};
        gd_variant_stringify(var_ret, gd_str);
        int64_t len = gd_string_to_utf8_chars(gd_str, s_call_str_buf, sizeof(s_call_str_buf) - 1);
        if (len >= 0 && len < (int64_t)sizeof(s_call_str_buf)) {
            s_call_str_buf[len] = '\0';
        }
        if (gd_string_destroy) gd_string_destroy(gd_str);
    }
    if (gd_variant_destroy) gd_variant_destroy(var_ret);
    return s_call_str_buf;
}

// ==============================================================================
// High-Level Node Tree, Scene & Resource Helpers
// ==============================================================================

static GDExtensionMethodBindPtr mb_node_find_child = nullptr;

/**
 * Searches for a child node by name pattern (e.g. "Player", "Camera*").
 *
 * @param node The parent Godot Node to search under.
 * @param pattern The node name pattern or exact string.
 * @param recursive If true, recursively searches all descendants.
 * @param owned If true, only searches nodes owned by the scene root.
 * @return Found GDExtensionObjectPtr or nullptr if not found.
 */
static GDExtensionObjectPtr bridge_node_find_child(GDExtensionObjectPtr node, const char *pattern, bool recursive, bool owned) {
    if (!node || !pattern || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return nullptr;
    if (!mb_node_find_child) {
        void *sn_node = make_string_name("Node");
        void *sn_fc = make_string_name("find_child");
        mb_node_find_child = gd_classdb_get_method_bind(sn_node, sn_fc, 2008217037ULL);
        free_string_name(sn_node); free_string_name(sn_fc);
    }
    if (!mb_node_find_child) return nullptr;

    void *gd_str = make_string(pattern);
    uint8_t rec = recursive ? 1 : 0;
    uint8_t own = owned ? 1 : 0;
    const void *args[3] = { gd_str, &rec, &own };
    GDExtensionObjectPtr ret_node = nullptr;
    gd_object_method_bind_ptrcall(mb_node_find_child, node, args, &ret_node);

    free_string(gd_str);

    return ret_node;
}

static GDExtensionMethodBindPtr mb_node_get_node = nullptr;

/**
 * Resolves a child node relative to a given Node via NodePath.
 * Uses Node::get_node_or_null to avoid throwing Godot engine errors on missing nodes.
 *
 * @param node The base Godot Node.
 * @param path Relative or absolute NodePath string (e.g. "Sprite2D", "../Enemy").
 * @return Found GDExtensionObjectPtr or nullptr.
 */
static GDExtensionObjectPtr bridge_node_get_node(GDExtensionObjectPtr node, const char *path) {
    if (!node || !path || !gd_classdb_get_method_bind) return nullptr;
    if (!mb_node_get_node) {
        void *sn_node = make_string_name("Node");
        void *sn_gn = make_string_name("get_node_or_null");
        mb_node_get_node = gd_classdb_get_method_bind(sn_node, sn_gn, 2734337346ULL);
        free_string_name(sn_node); free_string_name(sn_gn);
    }
    if (!mb_node_get_node) return nullptr;

    if (!gd_nodepath_from_string && gd_variant_get_ptr_constructor) {
        gd_nodepath_from_string = gd_variant_get_ptr_constructor(GDEXTENSION_VARIANT_TYPE_NODE_PATH, 2);
    }
    if (!gd_nodepath_destroy && gd_variant_get_ptr_destructor) {
        gd_nodepath_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_NODE_PATH);
    }

    if (gd_nodepath_from_string && gd_object_method_bind_ptrcall) {
        void *gd_str = make_string(path);
        alignas(void*) char np_buf[8] = {};
        const GDExtensionConstTypePtr cargs[1] = { gd_str };
        gd_nodepath_from_string(np_buf, cargs);

        const void *args[1] = { np_buf };
        GDExtensionObjectPtr ret_node = nullptr;
        gd_object_method_bind_ptrcall(mb_node_get_node, node, args, &ret_node);

        if (gd_nodepath_destroy) {
            gd_nodepath_destroy(np_buf);
        }
        free_string(gd_str);
        return ret_node;
    }

    if (gd_object_method_bind_call && gd_variant_from_string) {
        void *gd_str = make_string(path);
        alignas(void*) char var_str[24] = {};
        alignas(void*) char var_ret[24] = {};
        gd_variant_from_string(var_str, gd_str);

        const void *call_args[1] = { var_str };
        GDExtensionCallError call_err;
        gd_object_method_bind_call(mb_node_get_node, node, (const GDExtensionConstVariantPtr*)call_args, 1, var_ret, &call_err);

        GDExtensionObjectPtr ret_node = bridge_object_from_variant(var_ret);

        if (gd_variant_destroy) {
            gd_variant_destroy(var_str);
            gd_variant_destroy(var_ret);
        }
        free_string(gd_str);
        return ret_node;
    }

    return nullptr;
}

static GDExtensionMethodBindPtr mb_range_set_value = nullptr;

/**
 * Fast direct pointer call helper to set value on a Godot Range node (ProgressBar, Slider, etc.).
 *
 * @param range_obj The Range object pointer.
 * @param value Double floating-point value.
 */
static void bridge_range_set_value(GDExtensionObjectPtr range_obj, double value) {
    if (!range_obj || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return;
    if (!mb_range_set_value) {
        void *sn_range = make_string_name("Range");
        void *sn_sv = make_string_name("set_value");
        mb_range_set_value = gd_classdb_get_method_bind(sn_range, sn_sv, 373806689ULL);
        free_string_name(sn_range); free_string_name(sn_sv);
    }
    if (mb_range_set_value) {
        const void *args[1] = { &value };
        gd_object_method_bind_ptrcall(mb_range_set_value, range_obj, args, nullptr);
    }
}

static GDExtensionMethodBindPtr mb_node_rpc_config = nullptr;

/**
 * Configures a method for multiplayer RPC on a Node.
 *
 * @param node The target Node pointer.
 * @param method The method identifier string.
 * @param rpc_mode Multiplayer RPC mode.
 * @param transfer_mode Transfer mode (reliable, unreliable, etc.).
 * @param call_local Whether to also invoke the method locally.
 * @param channel Network channel number.
 */
static void bridge_node_rpc_config(GDExtensionObjectPtr node, const char *method, int rpc_mode, int transfer_mode, bool call_local, int channel) {
    if (!node || !method || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return;
    if (!mb_node_rpc_config) {
        void *sn_node = make_string_name("Node");
        void *sn_rc = make_string_name("rpc_config");
        mb_node_rpc_config = gd_classdb_get_method_bind(sn_node, sn_rc, 3776071444ULL);
        free_string_name(sn_node); free_string_name(sn_rc);
    }
    if (!mb_node_rpc_config) return;

    void *m_sn = make_string_name(method);
    alignas(void*) char var_config[24];
    memset(var_config, 0, sizeof(var_config));

    // Call Node.rpc_config(method, config)
    const void *args[2] = { m_sn, var_config };
    gd_object_method_bind_ptrcall(mb_node_rpc_config, node, args, nullptr);

    free_string_name(m_sn);
}

static GDExtensionMethodBindPtr mb_res_loader_load = nullptr;

/**
 * Loads a resource (e.g. PackedScene, Mesh, Texture, AudioStream) from the virtual res:// filesystem.
 * Automatically takes an explicit reference on RefCounted objects to prevent garbage collection.
 *
 * @param path Virtual resource path (e.g. "res://scenes/player.tscn").
 * @param type_hint Optional expected type hint string.
 * @param cache_mode ResourceLoader CacheMode enum value.
 * @return GDExtensionObjectPtr to the loaded Resource or nullptr.
 */
static GDExtensionObjectPtr bridge_resource_loader_load(const char *path, const char *type_hint, int64_t cache_mode) {
    if (!path || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return nullptr;
    GDExtensionObjectPtr res_loader = bridge_get_singleton("ResourceLoader");
    if (!res_loader) return nullptr;

    if (!mb_res_loader_load) {
        void *sn_rl = make_string_name("ResourceLoader");
        void *sn_load = make_string_name("load");
        mb_res_loader_load = gd_classdb_get_method_bind(sn_rl, sn_load, 3358495409ULL);
        free_string_name(sn_rl); free_string_name(sn_load);
    }
    if (!mb_res_loader_load) return nullptr;

    alignas(void*) char var_path[24] = {};
    alignas(void*) char var_type[24] = {};
    alignas(void*) char var_cache[24] = {};
    alignas(void*) char var_ret[24] = {};

    void *gd_path = make_string(path);
    if (gd_variant_from_string) gd_variant_from_string(var_path, gd_path);

    void *gd_type = make_string(type_hint ? type_hint : "");
    if (gd_variant_from_string) gd_variant_from_string(var_type, gd_type);

    if (gd_get_variant_from_type_constructor) {
        GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_INT);
        if (conv) conv(var_cache, &cache_mode);
    }

    const void *call_args[3] = { var_path, var_type, var_cache };
    GDExtensionCallError call_err;
    gd_object_method_bind_call(mb_res_loader_load, res_loader, (const GDExtensionConstVariantPtr*)call_args, 3, var_ret, &call_err);

    GDExtensionObjectPtr ret_obj = nullptr;
    bridge_type_from_variant(GDEXTENSION_VARIANT_TYPE_OBJECT, &ret_obj, var_ret);

    static GDExtensionMethodBindPtr mb_refcounted_reference = nullptr;
    if (ret_obj && !mb_refcounted_reference) {
        void *sn_rc = make_string_name("RefCounted");
        void *sn_ref = make_string_name("reference");
        mb_refcounted_reference = gd_classdb_get_method_bind(sn_rc, sn_ref, 2240911060ULL);
        free_string_name(sn_rc); free_string_name(sn_ref);
    }
    if (ret_obj && mb_refcounted_reference && gd_object_method_bind_ptrcall) {
        uint8_t success = 0;
        gd_object_method_bind_ptrcall(mb_refcounted_reference, ret_obj, nullptr, &success);
    }

    if (gd_variant_destroy) {
        gd_variant_destroy(var_path);
        gd_variant_destroy(var_type);
        gd_variant_destroy(var_cache);
        gd_variant_destroy(var_ret);
    }
    free_string(gd_path);
    free_string(gd_type);

    return ret_obj;
}

static GDExtensionMethodBindPtr mb_packed_scene_instantiate = nullptr;

/**
 * Instantiates a PackedScene object into a Node tree hierarchy.
 *
 * @param scene The PackedScene object pointer.
 * @param edit_state PackedScene::GenEditState flag (0 = state disabled, 1 = state instance).
 * @return Root GDExtensionObjectPtr of the instantiated scene.
 */
static GDExtensionObjectPtr bridge_packed_scene_instantiate(GDExtensionObjectPtr scene, int64_t edit_state) {
    if (!scene || !gd_classdb_get_method_bind) return nullptr;
    if (!mb_packed_scene_instantiate) {
        void *sn_ps = make_string_name("PackedScene");
        void *sn_inst = make_string_name("instantiate");
        mb_packed_scene_instantiate = gd_classdb_get_method_bind(sn_ps, sn_inst, 2628778455ULL);
        free_string_name(sn_ps); free_string_name(sn_inst);
    }
    if (!mb_packed_scene_instantiate) return nullptr;

    if (gd_object_method_bind_ptrcall) {
        int32_t state_i32 = (int32_t)edit_state;
        const void *args[1] = { &state_i32 };
        GDExtensionObjectPtr ret_node = nullptr;
        gd_object_method_bind_ptrcall(mb_packed_scene_instantiate, scene, args, &ret_node);
        if (ret_node) return ret_node;
    }

    if (gd_object_method_bind_call) {
        alignas(void*) char var_edit[24] = {};
        alignas(void*) char var_ret[24] = {};

        if (gd_get_variant_from_type_constructor) {
            GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_INT);
            if (conv) conv(var_edit, &edit_state);
        }

        const void *call_args[1] = { var_edit };
        GDExtensionCallError call_err;
        gd_object_method_bind_call(mb_packed_scene_instantiate, scene, (const GDExtensionConstVariantPtr*)call_args, 1, var_ret, &call_err);

        GDExtensionObjectPtr ret_node = bridge_object_from_variant(var_ret);

        if (gd_variant_destroy) {
            gd_variant_destroy(var_edit);
            gd_variant_destroy(var_ret);
        }

        return ret_node;
    }

    return nullptr;
}

static GDExtensionMethodBindPtr mb_node_get_name = nullptr;

/**
 * Retrieves the StringName identifier of a Node as a thread-local UTF-8 C-string.
 *
 * @param node The target Godot Node pointer.
 * @return Null-terminated string or empty string.
 */
static const char* bridge_node_get_name(GDExtensionObjectPtr node) {
    if (!node || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return "";
    if (!mb_node_get_name) {
        void *sn_node = make_string_name("Node");
        void *sn_gn = make_string_name("get_name");
        mb_node_get_name = gd_classdb_get_method_bind(sn_node, sn_gn, 2002593661ULL);
        free_string_name(sn_node); free_string_name(sn_gn);
    }
    if (!mb_node_get_name) return "";

    alignas(void*) char sn_buf[8] = {};
    gd_object_method_bind_ptrcall(mb_node_get_name, node, nullptr, sn_buf);

    static thread_local char s_name_buf[256];
    s_name_buf[0] = '\0';

    if (!gd_string_from_string_name && gd_variant_get_ptr_constructor) {
        gd_string_from_string_name = gd_variant_get_ptr_constructor(GDEXTENSION_VARIANT_TYPE_STRING, 2);
    }

    if (gd_string_from_string_name && gd_string_to_utf8_chars) {
        alignas(void*) char gd_str[8] = {};
        const GDExtensionConstTypePtr args[1] = { sn_buf };
        gd_string_from_string_name(gd_str, args);

        int64_t len = gd_string_to_utf8_chars(gd_str, s_name_buf, sizeof(s_name_buf) - 1);
        if (len >= 0 && len < (int64_t)sizeof(s_name_buf)) {
            s_name_buf[len] = '\0';
        }

        if (gd_string_destroy) gd_string_destroy(gd_str);
    } else if (gd_variant_stringify && gd_string_to_utf8_chars) {
        alignas(void*) char var_sn[24] = {};
        alignas(void*) char gd_str[8] = {};
        bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_STRING_NAME, var_sn, sn_buf);
        gd_variant_stringify(var_sn, gd_str);

        int64_t len = gd_string_to_utf8_chars(gd_str, s_name_buf, sizeof(s_name_buf) - 1);
        if (len >= 0 && len < (int64_t)sizeof(s_name_buf)) {
            s_name_buf[len] = '\0';
        }

        if (gd_string_destroy) gd_string_destroy(gd_str);
        if (gd_variant_destroy) gd_variant_destroy(var_sn);
    }

    if (gd_string_name_destroy) {
        gd_string_name_destroy(sn_buf);
    }

    return s_name_buf;
}

// ==============================================================================
// Virtual Call Return and Argument Marshalling Helpers
// ==============================================================================

static void bridge_ret_string(void *r_ret, const char *str) {
    if (!r_ret) return;
    if (gd_string_new_with_utf8_chars) {
        gd_string_new_with_utf8_chars(r_ret, str ? str : "");
    }
}

static void bridge_ret_string_name(void *r_ret, const char *str) {
    if (!r_ret) return;
    if (gd_string_name_new_with_utf8_chars) {
        gd_string_name_new_with_utf8_chars(r_ret, str ? str : "");
    }
}

static GDExtensionPtrConstructor gd_packed_string_array_constructor = nullptr;
static GDExtensionPtrBuiltInMethod gd_packed_string_array_append = nullptr;

static void bridge_ret_packed_string_array(void *r_ret, const char **strings, int count) {
    if (!r_ret) return;
    if (!gd_packed_string_array_append && gd_variant_get_ptr_builtin_method) {
        void *sn_append = make_string_name("append");
        gd_packed_string_array_append = gd_variant_get_ptr_builtin_method(GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY, sn_append, 816187996ULL);
        free_string_name(sn_append);
    }
    if (gd_packed_string_array_append && strings) {
        for (int i = 0; i < count; i++) {
            alignas(void*) char gd_str[8] = {};
            if (gd_string_new_with_utf8_chars) {
                gd_string_new_with_utf8_chars(gd_str, strings[i] ? strings[i] : "");
            }
            const GDExtensionConstTypePtr args[1] = { gd_str };
            alignas(void*) uint8_t append_ret = 0;
            gd_packed_string_array_append(r_ret, args, &append_ret, 1);
            if (gd_string_destroy) gd_string_destroy(gd_str);
        }
    }
}

static GDExtensionPtrConstructor gd_dictionary_constructor = nullptr;
static GDExtensionPtrConstructor gd_array_constructor = nullptr;
static GDExtensionPtrConstructor gd_variant_nil_constructor = nullptr;
static GDExtensionPtrKeyedSetter gd_dict_keyed_setter = nullptr;

static void bridge_ret_dictionary_empty(void *r_ret) {
    if (!r_ret) return;
    if (!gd_dictionary_constructor && gd_variant_get_ptr_constructor) {
        gd_dictionary_constructor = gd_variant_get_ptr_constructor(GDEXTENSION_VARIANT_TYPE_DICTIONARY, 0);
    }
    if (gd_dictionary_constructor) {
        gd_dictionary_constructor(r_ret, nullptr);
    }
}

static void bridge_ret_array_empty(void *r_ret) {
    if (!r_ret) return;
    if (!gd_array_constructor && gd_variant_get_ptr_constructor) {
        gd_array_constructor = gd_variant_get_ptr_constructor(GDEXTENSION_VARIANT_TYPE_ARRAY, 0);
    }
    if (gd_array_constructor) {
        gd_array_constructor(r_ret, nullptr);
    }
}

static void bridge_ret_object(void *r_ret, void *obj) {
    if (!r_ret) return;
    *(GDExtensionObjectPtr*)r_ret = (GDExtensionObjectPtr)obj;
}

static void bridge_ret_ref(void *r_ret, void *obj) {
    if (!r_ret) return;
    if (gd_ref_set_object) {
        gd_ref_set_object((GDExtensionRefPtr)r_ret, (GDExtensionObjectPtr)obj);
    } else {
        *(GDExtensionObjectPtr*)r_ret = (GDExtensionObjectPtr)obj;
    }
}

static void bridge_ret_variant_object(void *r_ret, void *obj) {
    if (!r_ret) return;
    bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_OBJECT, r_ret, &obj);
}

static void bridge_ret_variant_nil(void *r_ret) {
    if (!r_ret) return;
    memset(r_ret, 0, 24);
}

static void bridge_highlighter_add_span(void *r_color_map, int64_t col, float r, float g, float b, float a) {
    if (!r_color_map) return;
    if (!gd_dict_keyed_setter && gd_variant_get_ptr_keyed_setter) {
        gd_dict_keyed_setter = gd_variant_get_ptr_keyed_setter(GDEXTENSION_VARIANT_TYPE_DICTIONARY);
    }
    if (!gd_dictionary_constructor && gd_variant_get_ptr_constructor) {
        gd_dictionary_constructor = gd_variant_get_ptr_constructor(GDEXTENSION_VARIANT_TYPE_DICTIONARY, 0);
    }
    if (!gd_dict_keyed_setter || !gd_dictionary_constructor) return;

    alignas(void*) char sub_dict[8] = {};
    gd_dictionary_constructor(sub_dict, nullptr);

    alignas(void*) char var_color_str[24] = {};
    const char *color_str = "color";
    bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_STRING, var_color_str, &color_str);

    struct { float r, g, b, a; } color_val = { r, g, b, a };
    alignas(void*) char var_color_val[24] = {};
    bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_COLOR, var_color_val, &color_val);

    gd_dict_keyed_setter(sub_dict, var_color_str, var_color_val);

    alignas(void*) char var_col[24] = {};
    bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_INT, var_col, &col);

    alignas(void*) char var_sub_dict[24] = {};
    bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_DICTIONARY, var_sub_dict, sub_dict);

    gd_dict_keyed_setter(r_color_map, var_col, var_sub_dict);

    if (gd_variant_destroy) {
        gd_variant_destroy(var_color_str);
        gd_variant_destroy(var_color_val);
        gd_variant_destroy(var_col);
        gd_variant_destroy(var_sub_dict);
    }
    static GDExtensionPtrDestructor gd_dict_destructor = nullptr;
    if (!gd_dict_destructor && gd_variant_get_ptr_destructor) {
        gd_dict_destructor = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_DICTIONARY);
    }
    if (gd_dict_destructor) {
        gd_dict_destructor(sub_dict);
    }
}

static int bridge_arg_to_string(const void *arg, char *out, int max_len) {
    if (!arg || !out || max_len <= 0) return 0;
    out[0] = '\0';
    if (gd_string_to_utf8_chars) {
        int64_t len = gd_string_to_utf8_chars((GDExtensionConstStringPtr)arg, out, max_len - 1);
        if (len >= 0 && len < (int64_t)max_len) {
            out[len] = '\0';
            return (int)len;
        } else {
            out[max_len - 1] = '\0';
            return max_len - 1;
        }
    }
    return 0;
}

static int bridge_arg_to_string_name(const void *arg, char *out, int max_len) {
    if (!arg || !out || max_len <= 0) return 0;
    out[0] = '\0';
    if (string_name_to_cstr((GDExtensionConstStringNamePtr)arg, out, max_len)) {
        return (int)strlen(out);
    }
    return 0;
}

static void dict_set_variant(void *dict, const char *key_str, int var_type, const void *val_ptr) {
    if (!gd_dict_keyed_setter && gd_variant_get_ptr_keyed_setter) {
        gd_dict_keyed_setter = gd_variant_get_ptr_keyed_setter(GDEXTENSION_VARIANT_TYPE_DICTIONARY);
    }
    if (!gd_dict_keyed_setter) return;

    alignas(void*) char var_key[24] = {};
    const char *k = key_str;
    bridge_variant_from_type(GDEXTENSION_VARIANT_TYPE_STRING, var_key, &k);

    alignas(void*) char var_val[24] = {};
    bridge_variant_from_type(var_type, var_val, val_ptr);

    gd_dict_keyed_setter(dict, var_key, var_val);

    if (gd_variant_destroy) {
        gd_variant_destroy(var_key);
        gd_variant_destroy(var_val);
    }
}

static void bridge_ret_dictionary_validate(void *r_ret, uint8_t valid) {
    bridge_ret_dictionary_empty(r_ret);
    uint8_t v_bool = valid;
    dict_set_variant(r_ret, "valid", GDEXTENSION_VARIANT_TYPE_BOOL, &v_bool);
}

static void bridge_ret_dictionary_complete_code(void *r_ret) {
    bridge_ret_dictionary_empty(r_ret);
    int64_t v_res = 0;
    dict_set_variant(r_ret, "result", GDEXTENSION_VARIANT_TYPE_INT, &v_res);
    uint8_t v_force = 0;
    dict_set_variant(r_ret, "force", GDEXTENSION_VARIANT_TYPE_BOOL, &v_force);
    const char *v_hint = "";
    dict_set_variant(r_ret, "call_hint", GDEXTENSION_VARIANT_TYPE_STRING, &v_hint);
}

static void bridge_ret_dictionary_lookup_code(void *r_ret) {
    bridge_ret_dictionary_empty(r_ret);
    int64_t v_res = 2; // ERR_UNAVAILABLE
    dict_set_variant(r_ret, "result", GDEXTENSION_VARIANT_TYPE_INT, &v_res);
    int64_t v_type = 0;
    dict_set_variant(r_ret, "type", GDEXTENSION_VARIANT_TYPE_INT, &v_type);
}

static GDExtensionMethodBindPtr mb_text_edit_get_line = nullptr;

static int bridge_text_edit_get_line(void *text_edit, int64_t line, char *out_buf, int max_len) {
    if (!text_edit || !out_buf || max_len <= 0) return 0;
    out_buf[0] = '\0';
    if (!mb_text_edit_get_line && gd_classdb_get_method_bind) {
        void *sn_te = make_string_name("TextEdit");
        void *sn_gl = make_string_name("get_line");
        mb_text_edit_get_line = gd_classdb_get_method_bind(sn_te, sn_gl, 844755477ULL);
        free_string_name(sn_te); free_string_name(sn_gl);
    }
    if (!mb_text_edit_get_line || !gd_object_method_bind_ptrcall) return 0;

    alignas(void*) char gd_str[8] = {};
    const void *args[1] = { &line };
    gd_object_method_bind_ptrcall(mb_text_edit_get_line, (GDExtensionObjectPtr)text_edit, args, gd_str);

    int ret_len = 0;
    if (gd_string_to_utf8_chars) {
        int64_t len = gd_string_to_utf8_chars(gd_str, out_buf, max_len - 1);
        if (len >= 0 && len < (int64_t)max_len) {
            out_buf[len] = '\0';
            ret_len = (int)len;
        } else {
            out_buf[max_len - 1] = '\0';
            ret_len = max_len - 1;
        }
    }
    if (gd_string_destroy) {
        gd_string_destroy(gd_str);
    }
    return ret_len;
}

// ==============================================================================
// Native Signal Connection & Custom Callable Dispatcher
// ==============================================================================

struct CustomSignalBinding {
    uint64_t target_id;
    std::string signal_name;
};

static void custom_callable_call(void *callable_userdata, const GDExtensionConstVariantPtr *p_args, GDExtensionInt p_argument_count, GDExtensionVariantPtr r_return, GDExtensionCallError *r_error) {
    if (r_error) {
        r_error->error = GDEXTENSION_CALL_OK;
        r_error->argument = 0;
        r_error->expected = 0;
    }
    if (r_return && gd_variant_new_nil) {
        gd_variant_new_nil(r_return);
    }
    if (!callable_userdata) return;
    ensure_gc_thread_registered();
    CustomSignalBinding *binding = (CustomSignalBinding*)callable_userdata;
    if (g_crystal_signal_callbacks.empty()) return;

    int count = (int)p_argument_count;
    std::vector<std::string> str_storage;
    std::vector<const char*> c_ptrs;
    if (count > 0 && p_args) {
        str_storage.reserve(count);
        c_ptrs.reserve(count);
        for (int i = 0; i < count; i++) {
            if (p_args[i] && gd_variant_stringify && gd_string_to_utf8_chars && gd_string_destroy) {
                void *gd_str = malloc(sizeof(void*));
                gd_variant_stringify((GDExtensionConstVariantPtr)p_args[i], gd_str);
                GDExtensionInt len = gd_string_to_utf8_chars(gd_str, nullptr, 0);
                std::string s(len, '\0');
                gd_string_to_utf8_chars(gd_str, &s[0], len);
                gd_string_destroy(gd_str);
                free(gd_str);
                str_storage.push_back(s);
                c_ptrs.push_back(str_storage.back().c_str());
            } else {
                str_storage.push_back("");
                c_ptrs.push_back(str_storage.back().c_str());
            }
        }
    }

    for (auto cb : g_crystal_signal_callbacks) {
        if (cb) {
            cb(
                binding->target_id,
                binding->signal_name.c_str(),
                c_ptrs.empty() ? nullptr : c_ptrs.data(),
                count
            );
        }
    }
}

static GDExtensionBool custom_callable_is_valid(void *callable_userdata) {
    if (!callable_userdata) return 0;
    return 1;
}

static void custom_callable_free(void *callable_userdata) {
    if (callable_userdata) {
        delete (CustomSignalBinding*)callable_userdata;
    }
}

static uint32_t custom_callable_hash(void *callable_userdata) {
    if (!callable_userdata) return 0;
    CustomSignalBinding *b = (CustomSignalBinding*)callable_userdata;
    uint32_t h = (uint32_t)(b->target_id ^ (b->target_id >> 32));
    for (char c : b->signal_name) {
        h = (h * 31) + (uint32_t)c;
    }
    return h;
}

static GDExtensionBool custom_callable_equal(void *a, void *b) {
    if (a == b) return 1;
    if (!a || !b) return 0;
    CustomSignalBinding *ba = (CustomSignalBinding*)a;
    CustomSignalBinding *bb = (CustomSignalBinding*)b;
    return (ba->target_id == bb->target_id && ba->signal_name == bb->signal_name) ? 1 : 0;
}

static GDExtensionBool custom_callable_less_than(void *a, void *b) {
    if (!a || !b) return 0;
    CustomSignalBinding *ba = (CustomSignalBinding*)a;
    CustomSignalBinding *bb = (CustomSignalBinding*)b;
    if (ba->target_id != bb->target_id) return ba->target_id < bb->target_id ? 1 : 0;
    return ba->signal_name < bb->signal_name ? 1 : 0;
}

static void custom_callable_to_string(void *callable_userdata, GDExtensionBool *r_is_valid, GDExtensionStringPtr r_out) {
    if (r_is_valid) *r_is_valid = 1;
    if (gd_string_new_with_utf8_chars && r_out) {
        gd_string_new_with_utf8_chars(r_out, "CrystalSignalCallable");
    }
}

static void bridge_register_signal_callback(CrystalSignalCallbackFn fn) {
    if (!fn) return;
    for (auto existing : g_crystal_signal_callbacks) {
        if (existing == fn) return;
    }
    g_crystal_signal_callbacks.push_back(fn);
}

static void bridge_object_connect_signal(GDExtensionObjectPtr instance, const char *signal_name) {
    if (!instance || !signal_name || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return;
    if (!gd_callable_custom_create2 && !gd_callable_custom_create) return;

    uint64_t target_id = bridge_object_get_instance_id(instance);
    if (target_id == 0) return;

    if (!mb_object_connect) {
        void *sn_obj = make_string_name("Object");
        void *sn_conn = make_string_name("connect");
        mb_object_connect = gd_classdb_get_method_bind(sn_obj, sn_conn, 1518946055ULL);
        if (!mb_object_connect) {
            mb_object_connect = gd_classdb_get_method_bind(sn_obj, sn_conn, 1469446357ULL);
        }
        void *sn_is_conn = make_string_name("is_connected");
        mb_object_is_connected = gd_classdb_get_method_bind(sn_obj, sn_is_conn, 768136979ULL);
        void *sn_disconn = make_string_name("disconnect");
        mb_object_disconnect = gd_classdb_get_method_bind(sn_obj, sn_disconn, 1874754934ULL);
        void *sn_has_sig = make_string_name("has_signal");
        mb_object_has_signal = gd_classdb_get_method_bind(sn_obj, sn_has_sig, 2619796661ULL);

        free_string_name(sn_obj);
        free_string_name(sn_conn);
        free_string_name(sn_is_conn);
        free_string_name(sn_disconn);
        free_string_name(sn_has_sig);
    }
    if (!mb_object_connect) return;

    void *sn_sig = make_string_name(signal_name);

    if (mb_object_has_signal) {
        uint8_t signal_exists = 0;
        const void *has_args[1] = { sn_sig };
        gd_object_method_bind_ptrcall(mb_object_has_signal, instance, (GDExtensionConstTypePtr*)has_args, &signal_exists);
        if (!signal_exists) {
            free_string_name(sn_sig);
            return;
        }
    }

    CustomSignalBinding *binding = new CustomSignalBinding{ target_id, signal_name };
    alignas(void*) char callable_buf[32] = {0};

    if (gd_callable_custom_create2) {
        GDExtensionCallableCustomInfo2 info;
        memset(&info, 0, sizeof(info));
        info.callable_userdata = binding;
        info.token = g_library;
        info.object_id = 0;
        info.call_func = custom_callable_call;
        info.is_valid_func = nullptr;
        info.free_func = custom_callable_free;
        info.hash_func = custom_callable_hash;
        info.equal_func = custom_callable_equal;
        info.less_than_func = custom_callable_less_than;
        info.to_string_func = custom_callable_to_string;
        gd_callable_custom_create2(callable_buf, &info);
    } else {
        GDExtensionCallableCustomInfo info;
        memset(&info, 0, sizeof(info));
        info.callable_userdata = binding;
        info.token = g_library;
        info.object_id = 0;
        info.call_func = custom_callable_call;
        info.is_valid_func = nullptr;
        info.free_func = custom_callable_free;
        info.hash_func = custom_callable_hash;
        info.equal_func = custom_callable_equal;
        info.less_than_func = custom_callable_less_than;
        info.to_string_func = custom_callable_to_string;
        gd_callable_custom_create(callable_buf, &info);
    }

    uint8_t already_connected = 0;
    if (mb_object_is_connected) {
        const void *check_args[2] = { sn_sig, callable_buf };
        gd_object_method_bind_ptrcall(mb_object_is_connected, instance, (GDExtensionConstTypePtr*)check_args, &already_connected);
    }

    if (!already_connected) {
        uint32_t flags = 0;
        const void *conn_args[3] = { sn_sig, callable_buf, &flags };
        int64_t err = 0;
        gd_object_method_bind_ptrcall(mb_object_connect, instance, (GDExtensionConstTypePtr*)conn_args, &err);
    }

    free_string_name(sn_sig);

    if (gd_callable_destroy) {
        gd_callable_destroy(callable_buf);
    }
}

static void bridge_object_disconnect_signal(GDExtensionObjectPtr instance, const char *signal_name) {
    if (!instance || !signal_name || !mb_object_disconnect || !gd_object_method_bind_ptrcall) return;
    uint64_t target_id = bridge_object_get_instance_id(instance);
    if (target_id == 0) return;

    CustomSignalBinding temp_binding{ target_id, signal_name };
    alignas(void*) char callable_buf[32] = {0};
    if (gd_callable_custom_create2) {
        GDExtensionCallableCustomInfo2 info;
        memset(&info, 0, sizeof(info));
        info.callable_userdata = &temp_binding;
        info.token = g_library;
        info.object_id = 0;
        info.call_func = custom_callable_call;
        info.hash_func = custom_callable_hash;
        info.equal_func = custom_callable_equal;
        info.less_than_func = custom_callable_less_than;
        gd_callable_custom_create2(callable_buf, &info);
    } else if (gd_callable_custom_create) {
        GDExtensionCallableCustomInfo info;
        memset(&info, 0, sizeof(info));
        info.callable_userdata = &temp_binding;
        info.token = g_library;
        info.object_id = 0;
        info.call_func = custom_callable_call;
        info.hash_func = custom_callable_hash;
        info.equal_func = custom_callable_equal;
        info.less_than_func = custom_callable_less_than;
        gd_callable_custom_create(callable_buf, &info);
    }

    void *sn_sig = make_string_name(signal_name);
    uint8_t is_conn = 0;
    if (mb_object_is_connected) {
        const void *check_args[2] = { sn_sig, callable_buf };
        gd_object_method_bind_ptrcall(mb_object_is_connected, instance, (GDExtensionConstTypePtr*)check_args, &is_conn);
    }
    if (is_conn) {
        const void *dis_args[2] = { sn_sig, callable_buf };
        gd_object_method_bind_ptrcall(mb_object_disconnect, instance, (GDExtensionConstTypePtr*)dis_args, nullptr);
    }
    free_string_name(sn_sig);
    if (gd_callable_destroy) {
        gd_callable_destroy(callable_buf);
    }
}

// ==============================================================================
// Master BridgeAPI Table Exposed to Crystal
// ==============================================================================

/**
 * Stable C-ABI function pointer table passed to Crystal during initialization.
 * Crystal mirrors this struct in LibGodot::BridgeAPI.
 */
struct BridgeAPI {
    int (*register_class)(const CrystalClassDesc *desc);
    GDExtensionMethodBindPtr (*get_method_bind)(const char *class_name, const char *method_name, int64_t hash);
    void (*method_bind_ptrcall)(GDExtensionMethodBindPtr method_bind, GDExtensionObjectPtr instance, const void **args, void *ret);
    void (*method_bind_call)(GDExtensionMethodBindPtr method_bind, GDExtensionObjectPtr instance, const GDExtensionConstVariantPtr *args, GDExtensionInt arg_count, GDExtensionVariantPtr ret, GDExtensionCallError *error);
    void (*load_editor_help_xml)(const char *xml);
    GDExtensionObjectPtr (*get_singleton)(const char *name);
    void* (*make_string_name)(const char *name);
    void (*free_string_name)(void *sn);
    void (*type_from_variant)(int type, void *dst, const void *variant);
    void (*variant_from_type)(int type, void *variant, const void *src);
    void (*log_print)(const char *msg);
    void (*log_error)(const char *desc, const char *msg, const char *func, const char *file, int line);
    void (*log_warning)(const char *desc, const char *msg, const char *func, const char *file, int line);
    void (*object_emit_signal)(GDExtensionObjectPtr instance, const char *signal_name, const BridgeSignalArg *args, int arg_count);
    void (*object_call_deferred)(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);
    void (*object_call)(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);
    GDExtensionObjectPtr (*node_find_child)(GDExtensionObjectPtr node, const char *pattern, bool recursive, bool owned);
    GDExtensionObjectPtr (*node_get_node)(GDExtensionObjectPtr node, const char *path);
    void (*range_set_value)(GDExtensionObjectPtr range_obj, double value);
    void (*node_rpc_config)(GDExtensionObjectPtr node, const char *method, int rpc_mode, int transfer_mode, bool call_local, int channel);
    GDExtensionObjectPtr (*resource_loader_load)(const char *path, const char *type_hint, int64_t cache_mode);
    GDExtensionObjectPtr (*packed_scene_instantiate)(GDExtensionObjectPtr scene, int64_t edit_state);
    const char* (*node_get_name)(GDExtensionObjectPtr node);
    GDExtensionObjectPtr (*classdb_construct_object)(const char *class_name);
    GDExtensionObjectPtr (*object_call_ret_object)(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);
    int64_t (*object_call_ret_int)(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);
    double (*object_call_ret_float)(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);
    bool (*object_call_ret_bool)(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);
    const char* (*object_call_ret_string)(GDExtensionObjectPtr instance, const char *method_name, const BridgeSignalArg *args, int arg_count);
    void (*object_destroy)(GDExtensionObjectPtr p_o);
    uint64_t (*object_get_instance_id)(GDExtensionConstObjectPtr p_o);
    GDExtensionObjectPtr (*object_get_instance_from_id)(uint64_t id);
    uint8_t (*is_instance_valid)(uint64_t id);
    void (*ret_string)(void *r_ret, const char *str);
    void (*ret_string_name)(void *r_ret, const char *str);
    void (*ret_packed_string_array)(void *r_ret, const char **strings, int count);
    void (*ret_dictionary_empty)(void *r_ret);
    void (*ret_array_empty)(void *r_ret);
    void (*ret_object)(void *r_ret, void *obj);
    void (*ret_ref)(void *r_ret, void *obj);
    void (*ret_variant_object)(void *r_ret, void *obj);
    void (*ret_variant_nil)(void *r_ret);
    void (*highlighter_add_span)(void *r_color_map, int64_t col, float r, float g, float b, float a);
    int (*arg_to_string)(const void *arg, char *out, int max_len);
    int (*arg_to_string_name)(const void *arg, char *out, int max_len);
    void (*ret_dictionary_validate)(void *r_ret, uint8_t valid);
    void (*ret_dictionary_complete_code)(void *r_ret);
    void (*ret_dictionary_lookup_code)(void *r_ret);
    int (*text_edit_get_line)(void *text_edit, int64_t line, char *out_buf, int max_len);
    void (*object_connect_signal)(GDExtensionObjectPtr instance, const char *signal_name);
    void (*object_disconnect_signal)(GDExtensionObjectPtr instance, const char *signal_name);
    void (*register_signal_callback)(CrystalSignalCallbackFn fn);
};

static BridgeAPI g_bridge_api = {
    bridge_register_class,
    bridge_get_method_bind,
    bridge_method_bind_ptrcall,
    bridge_method_bind_call,
    bridge_load_editor_help_xml,
    bridge_get_singleton,
    make_string_name,
    free_string_name,
    bridge_type_from_variant,
    bridge_variant_from_type,
    godot_log_print,
    godot_log_error,
    godot_log_warning,
    bridge_object_emit_signal,
    bridge_object_call_deferred,
    bridge_object_call,
    bridge_node_find_child,
    bridge_node_get_node,
    bridge_range_set_value,
    bridge_node_rpc_config,
    bridge_resource_loader_load,
    bridge_packed_scene_instantiate,
    bridge_node_get_name,
    bridge_classdb_construct_object,
    bridge_object_call_ret_object,
    bridge_object_call_ret_int,
    bridge_object_call_ret_float,
    bridge_object_call_ret_bool,
    bridge_object_call_ret_string,
    bridge_object_destroy,
    bridge_object_get_instance_id,
    bridge_object_get_instance_from_id,
    bridge_is_instance_valid,
    bridge_ret_string,
    bridge_ret_string_name,
    bridge_ret_packed_string_array,
    bridge_ret_dictionary_empty,
    bridge_ret_array_empty,
    bridge_ret_object,
    bridge_ret_ref,
    bridge_ret_variant_object,
    bridge_ret_variant_nil,
    bridge_highlighter_add_span,
    bridge_arg_to_string,
    bridge_arg_to_string_name,
    bridge_ret_dictionary_validate,
    bridge_ret_dictionary_complete_code,
    bridge_ret_dictionary_lookup_code,
    bridge_text_edit_get_line,
    bridge_object_connect_signal,
    bridge_object_disconnect_signal,
    bridge_register_signal_callback
};

// ==============================================================================
// Exported C API Functions
// ==============================================================================
// Accessible by dynamic linking or foreign language bindings.

extern "C" {
    GDE_EXPORT void crystal_godot_print(const char *msg) {
        godot_log_print(msg);
    }
    GDE_EXPORT void crystal_godot_printerr(const char *msg) {
        godot_log_printerr(msg);
    }
    GDE_EXPORT void crystal_godot_error(const char *msg, const char *func, const char *file, int line) {
        godot_log_error(msg, nullptr, func, file, line);
    }
    GDE_EXPORT void crystal_godot_warning(const char *msg, const char *func, const char *file, int line) {
        godot_log_warning(msg, nullptr, func, file, line);
    }
    GDE_EXPORT void crystal_object_emit_signal(GDExtensionObjectPtr instance, const char *signal_name, const BridgeSignalArg *args, int arg_count) {
        bridge_object_emit_signal(instance, signal_name, args, arg_count);
    }
    GDE_EXPORT GDExtensionObjectPtr crystal_node_find_child(GDExtensionObjectPtr node, const char *pattern, bool recursive, bool owned) {
        return bridge_node_find_child(node, pattern, recursive, owned);
    }
    GDE_EXPORT GDExtensionObjectPtr crystal_node_get_node(GDExtensionObjectPtr node, const char *path) {
        return bridge_node_get_node(node, path);
    }
    GDE_EXPORT void crystal_range_set_value(GDExtensionObjectPtr range_obj, double value) {
        bridge_range_set_value(range_obj, value);
    }
    GDE_EXPORT void crystal_object_connect_signal(GDExtensionObjectPtr instance, const char *signal_name) {
        bridge_object_connect_signal(instance, signal_name);
    }
    GDE_EXPORT void crystal_object_disconnect_signal(GDExtensionObjectPtr instance, const char *signal_name) {
        bridge_object_disconnect_signal(instance, signal_name);
    }
    GDE_EXPORT void crystal_register_signal_callback(CrystalSignalCallbackFn fn) {
        bridge_register_signal_callback(fn);
    }
    GDE_EXPORT const BridgeAPI* crystal_bridge_get_api() {
        return &g_bridge_api;
    }
}

// ==============================================================================
// Cross-Platform OS, File System & Dynamic Linking Abstractions
// ==============================================================================

/** Checks if a file exists on disk at the specified path */
static bool bridge_file_exists(const char *path) {
#ifdef _WIN32
    return GetFileAttributesA(path) != INVALID_FILE_ATTRIBUTES;
#else
    return access(path, F_OK) == 0;
#endif
}

/**
 * Copies a binary file from src to dst.
 * Windows: CopyFileA with failIfExists=FALSE.
 * POSIX: Buffered open/read/write/close.
 */
static bool bridge_copy_file(const char *src, const char *dst) {
#ifdef _WIN32
    return CopyFileA(src, dst, FALSE) != 0;
#else
    int in_fd = open(src, O_RDONLY);
    if (in_fd < 0) return false;
    int out_fd = open(dst, O_WRONLY | O_CREAT | O_TRUNC, 0755);
    if (out_fd < 0) {
        close(in_fd);
        return false;
    }
    char buf[8192];
    ssize_t bytes;
    bool success = true;
    while ((bytes = read(in_fd, buf, sizeof(buf))) > 0) {
        if (write(out_fd, buf, bytes) != bytes) {
            success = false;
            break;
        }
    }
    close(in_fd);
    close(out_fd);
    return success && (bytes >= 0);
#endif
}

/** Deletes a file on disk (DeleteFileA / unlink) */
static void bridge_delete_file(const char *path) {
#ifdef _WIN32
    DeleteFileA(path);
#else
    unlink(path);
#endif
}

/** Retrieves the OS Process ID */
static unsigned long bridge_get_pid() {
#ifdef _WIN32
    return (unsigned long)GetCurrentProcessId();
#else
    return (unsigned long)getpid();
#endif
}

/** Retrieves high-resolution monotonic millisecond timestamp */
static uint64_t bridge_get_tick_count() {
#ifdef _WIN32
    return GetTickCount64();
#else
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ((uint64_t)ts.tv_sec * 1000ULL) + ((uint64_t)ts.tv_nsec / 1000000ULL);
#endif
}

/**
 * Loads a shared dynamic library into the current process address space.
 * Windows: LoadLibraryExA with LOAD_WITH_ALTERED_SEARCH_PATH.
 * POSIX: dlopen with RTLD_NOW | RTLD_GLOBAL.
 */
static HMODULE bridge_load_library(const char *path) {
#ifdef _WIN32
    HMODULE h = LoadLibraryExA(path, NULL, LOAD_WITH_ALTERED_SEARCH_PATH);
    if (!h) h = LoadLibraryA(path);
    return h;
#else
    return dlopen(path, RTLD_NOW | RTLD_GLOBAL);
#endif
}

/** Resolves an exported symbol address from a loaded shared library */
static void* bridge_get_proc(HMODULE hMod, const char *proc_name) {
#ifdef _WIN32
    return (void*)GetProcAddress(hMod, proc_name);
#else
    return dlsym(hMod, proc_name);
#endif
}

/** Formats the most recent dynamic link error message into out_buf */
static void bridge_get_last_error(char *out_buf, size_t buf_size) {
#ifdef _WIN32
    snprintf(out_buf, buf_size, "error code %lu", (unsigned long)GetLastError());
#else
    const char *err = dlerror();
    snprintf(out_buf, buf_size, "%s", err ? err : "unknown dl error");
#endif
}

/** Queries the last modification timestamp of a file on disk */
static uint64_t get_file_mtime(const char *path) {
#ifdef _WIN32
    WIN32_FILE_ATTRIBUTE_DATA data;
    if (GetFileAttributesExA(path, GetFileExInfoStandard, &data)) {
        return ((uint64_t)data.ftLastWriteTime.dwHighDateTime << 32) | data.ftLastWriteTime.dwLowDateTime;
    }
    return 0;
#else
    struct stat st;
    if (stat(path, &st) == 0) {
        return (uint64_t)st.st_mtime;
    }
    return 0;
#endif
}

/** Global handle to the currently loaded Crystal game library (game.dll/so) */
static HMODULE g_hGame = NULL;
/** List of all loaded Crystal module handles (plugin.dll, game.dll, etc.) */
static std::vector<HMODULE> g_loaded_modules;
/** Set of absolute library file paths that have already been loaded */
static std::unordered_set<std::string> g_loaded_module_paths;
/** Set of crystal_godot_init entry function pointers already invoked */
static std::unordered_set<void*> g_initialized_init_fns;
/** Count of active GDExtension initializations sharing this bridge */
static int g_active_extension_count = 0;

static void init_gc_library() {
    if (!gd_gc_register_my_thread) {
#ifdef _WIN32
        HMODULE hGc = GetModuleHandleA("gc.dll");
        if (!hGc) hGc = LoadLibraryA("gc.dll");
        if (hGc) {
            gd_gc_init = (GCInitFn)GetProcAddress(hGc, "GC_init");
            gd_gc_allow_register_threads = (GCAllowRegisterThreadsFn)GetProcAddress(hGc, "GC_allow_register_threads");
            gd_gc_get_stack_base = (GCGetStackBaseFn)GetProcAddress(hGc, "GC_get_stack_base");
            gd_gc_register_my_thread = (GCRegisterMyThreadFn)GetProcAddress(hGc, "GC_register_my_thread");
            gd_gc_thread_is_registered = (GCThreadIsRegisteredFn)GetProcAddress(hGc, "GC_thread_is_registered");
            if (gd_gc_init) gd_gc_init();
            if (gd_gc_allow_register_threads) gd_gc_allow_register_threads();
        }
#else
        void *hGc = nullptr;
        if (g_hGame) {
            gd_gc_register_my_thread = (GCRegisterMyThreadFn)dlsym(g_hGame, "GC_register_my_thread");
            if (gd_gc_register_my_thread) hGc = g_hGame;
        }
        if (!gd_gc_register_my_thread) {
            gd_gc_register_my_thread = (GCRegisterMyThreadFn)dlsym(RTLD_DEFAULT, "GC_register_my_thread");
            if (gd_gc_register_my_thread) hGc = RTLD_DEFAULT;
        }
        if (!gd_gc_register_my_thread) {
            const char *gc_libs[] = { "libgc.so.1", "libgc.so", "libgc.dylib" };
            for (size_t i = 0; i < sizeof(gc_libs) / sizeof(gc_libs[0]); i++) {
                void *hLib = dlopen(gc_libs[i], RTLD_LAZY | RTLD_GLOBAL);
                if (hLib) {
                    gd_gc_register_my_thread = (GCRegisterMyThreadFn)dlsym(hLib, "GC_register_my_thread");
                    if (gd_gc_register_my_thread) {
                        hGc = hLib;
                        break;
                    }
                }
            }
        }
        if (gd_gc_register_my_thread && hGc) {
            gd_gc_init = (GCInitFn)dlsym(hGc, "GC_init");
            gd_gc_allow_register_threads = (GCAllowRegisterThreadsFn)dlsym(hGc, "GC_allow_register_threads");
            gd_gc_get_stack_base = (GCGetStackBaseFn)dlsym(hGc, "GC_get_stack_base");
            gd_gc_thread_is_registered = (GCThreadIsRegisteredFn)dlsym(hGc, "GC_thread_is_registered");
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

/**
 * Unloads the Crystal game library reference.
 * Note: FreeLibrary/dlclose is intentionally NOT called. Crystal's Boehm GC
 * and runtime internals must remain resident in memory across hot-reloads;
 * subsequent builds are loaded via unique shadow library copies.
 */
static void unload_crystal_game_library() {
    g_hGame = NULL;
    g_loaded_modules.clear();
    g_loaded_module_paths.clear();
    g_crystal_signal_callbacks.clear();
    g_initialized_init_fns.clear();
}

/**
 * Scans the bridge directory and removes stale temporary shadow copies
 * (`*_loaded_*.dll/so`) left behind by previous, closed editor sessions.
 */
static void cleanup_old_shadow_dlls(const char *dir) {
    if (!dir || dir[0] == '\0') return;
#ifdef _WIN32
    char search_pattern[MAX_PATH];
    snprintf(search_pattern, sizeof(search_pattern), "%s\\*_loaded_*.dll", dir);

    WIN32_FIND_DATAA fd;
    HANDLE hFind = FindFirstFileA(search_pattern, &fd);
    if (hFind != INVALID_HANDLE_VALUE) {
        do {
            char file_path[MAX_PATH];
            snprintf(file_path, sizeof(file_path), "%s\\%s", dir, fd.cFileName);
            DeleteFileA(file_path);
        } while (FindNextFileA(hFind, &fd));
        FindClose(hFind);
    }
#else
    DIR *d = opendir(dir);
    if (!d) return;
    struct dirent *entry;
    while ((entry = readdir(d)) != nullptr) {
        if (strstr(entry->d_name, "_loaded_") != nullptr) {
            char file_path[MAX_PATH];
            snprintf(file_path, sizeof(file_path), "%s/%s", dir, entry->d_name);
            unlink(file_path);
        }
    }
    closedir(d);
#endif
}

// ==============================================================================
// Game Library Loading, Shadow Copying & Hot-Reloading
// ==============================================================================

/**
 * Determines whether the bridge should create a temporary shadow copy
 * (`game_loaded_<PID>_<timestamp>.dll/so`) before loading the Crystal library.
 *
 * Rules:
 * 1. Compile-time release: If compiled with `LIBGODOT_RELEASE` or `NDEBUG`, shadow copying
 *    is disabled at compile time. The engine directly loads `game.dll` or `game.so`.
 * 2. Environment overrides: If `LIBGODOT_NO_SHADOW=1`, `LIBGODOT_RELEASE=1`, or
 *    `LIBGODOT_HOT_RELOAD=0` is set in the environment, shadow copying is disabled.
 * 3. Default (Development / Editor): Returns true to enable live compilation without
 *    Windows file lock conflicts.
 *
 * @return True to create a shadow copy; false to load directly.
 */
static bool bridge_should_use_shadow_copy() {
#if defined(LIBGODOT_RELEASE) || defined(NDEBUG) || defined(__ANDROID__) || defined(ANDROID)
    return false;
#else
    if (!is_editor_active()) {
        return false;
    }
    const char *no_shadow = getenv("LIBGODOT_NO_SHADOW");
    if (no_shadow && (strcmp(no_shadow, "1") == 0 || strcmp(no_shadow, "true") == 0)) {
        return false;
    }
    const char *release_env = getenv("LIBGODOT_RELEASE");
    if (release_env && (strcmp(release_env, "1") == 0 || strcmp(release_env, "true") == 0)) {
        return false;
    }
    const char *hot_reload = getenv("LIBGODOT_HOT_RELOAD");
    if (hot_reload && (strcmp(hot_reload, "0") == 0 || strcmp(hot_reload, "false") == 0)) {
        return false;
    }
    return true;
#endif
}

/**
 * Locates, loads, and initializes the Crystal game library (game.dll / game.so / libgame.so).
 *
 * Execution Steps:
 * 1. Unloads any previous library handle reference.
 * 2. Resolves the directory where `crystal_bridge` resides.
 * 3. Cleans up any stale `game_loaded_*.dll/so` files from past sessions.
 * 4. Preloads Windows Crystal runtime dependencies (gc.dll, iconv-2.dll, pcre2-8.dll).
 * 5. Loads `game.dll` / `game.so` / `libgame.so`.
 * 6. Searches fallback paths if co-located library was not found.
 * 7. Resolves the exported `crystal_godot_init` symbol and passes `&g_bridge_api`.
 */
static void load_crystal_game_library() {
    char bridge_dir[MAX_PATH] = {0};
#ifdef _WIN32
    HMODULE hBridge = NULL;
    if (GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, (LPCSTR)&load_crystal_game_library, &hBridge)) {
        if (GetModuleFileNameA(hBridge, bridge_dir, sizeof(bridge_dir))) {
            char *last_slash = strrchr(bridge_dir, '\\');
            if (!last_slash) last_slash = strrchr(bridge_dir, '/');
            if (last_slash) {
                *last_slash = '\0';
            }
        }
    }
#else
    Dl_info dlinfo;
    if (dladdr((void*)&load_crystal_game_library, &dlinfo) && dlinfo.dli_fname) {
        strncpy(bridge_dir, dlinfo.dli_fname, sizeof(bridge_dir) - 1);
        char *last_slash = strrchr(bridge_dir, '/');
        if (last_slash) {
            *last_slash = '\0';
        }
    }
#endif

    if (bridge_dir[0] != '\0') {
        char dir_log[512];
        snprintf(dir_log, sizeof(dir_log), "[CrystalBridge] Resolved bridge directory: %s", bridge_dir);
        godot_log_print(dir_log);
    }

    // Clean up stale shadow copies from previous editor sessions
    cleanup_old_shadow_dlls(bridge_dir);

    bool use_shadow = bridge_should_use_shadow_copy();
    uint64_t ts = bridge_get_tick_count();
    unsigned long pid = bridge_get_pid();

#ifdef _WIN32
    const char *candidate_names[] = { "game.dll", "crystal_addon.dll", "plugin.dll" };
    const char *path_sep = "\\";
    const char *shadow_ext = "dll";
#elif defined(__ANDROID__) || defined(ANDROID)
    const char *candidate_names[] = { "libgame.so", "libcrystal_addon.so", "libplugin.so" };
    const char *path_sep = "/";
    const char *shadow_ext = "so";
#elif defined(__APPLE__)
    const char *candidate_names[] = { "game.dylib", "libgame.dylib", "crystal_addon.dylib", "plugin.dylib" };
    const char *path_sep = "/";
    const char *shadow_ext = "dylib";
#else
    const char *candidate_names[] = { "game.so", "crystal_addon.so", "plugin.so" };
    const char *path_sep = "/";
    const char *shadow_ext = "so";
#endif

    std::vector<std::string> to_load;

    // 1. Primary candidates sitting directly next to crystal_bridge
    if (bridge_dir[0] != '\0') {
#ifdef _WIN32
        SetDllDirectoryA(bridge_dir);
#endif
        for (size_t c = 0; c < sizeof(candidate_names) / sizeof(candidate_names[0]); c++) {
            if (!is_editor_active() && strstr(candidate_names[c], "plugin") != nullptr) {
                continue;
            }
            char test_path[MAX_PATH] = {0};
            snprintf(test_path, sizeof(test_path), "%s%s%s", bridge_dir, path_sep, candidate_names[c]);
            if (bridge_file_exists(test_path)) {
                to_load.push_back(std::string(test_path));
            }
        }

        // If standard names not found, search directory for any custom addon DLL/SO
        if (to_load.empty()) {
#ifdef _WIN32
            char search_pattern[MAX_PATH];
            snprintf(search_pattern, sizeof(search_pattern), "%s\\*.dll", bridge_dir);
            WIN32_FIND_DATAA fd;
            HANDLE hFind = FindFirstFileA(search_pattern, &fd);
            if (hFind != INVALID_HANDLE_VALUE) {
                do {
                    // Skip system/runtime dlls and temporary shadow dlls
                    if (strstr(fd.cFileName, "crystal_bridge") == nullptr &&
                        fd.cFileName[0] != '~' &&
                        strcmp(fd.cFileName, "gc.dll") != 0 &&
                        strcmp(fd.cFileName, "iconv-2.dll") != 0 &&
                        strcmp(fd.cFileName, "pcre2-8.dll") != 0 &&
                        strcmp(fd.cFileName, "libgodot.dll") != 0 &&
                        strstr(fd.cFileName, "_loaded_") == nullptr) {
                        char full_path[MAX_PATH];
                        snprintf(full_path, sizeof(full_path), "%s\\%s", bridge_dir, fd.cFileName);
                        to_load.push_back(std::string(full_path));
                    }
                } while (FindNextFileA(hFind, &fd));
                FindClose(hFind);
            }
#else
            DIR *d = opendir(bridge_dir);
            if (d) {
                struct dirent *entry;
                while ((entry = readdir(d)) != nullptr) {
                    const char *name = entry->d_name;
                    size_t len = strlen(name);
                    bool is_lib = (len > 3 && strcmp(name + len - 3, ".so") == 0) ||
                                  (len > 6 && strcmp(name + len - 6, ".dylib") == 0);
                    if (is_lib &&
                        strstr(name, "crystal_bridge") == nullptr &&
                        strstr(name, "libgc") == nullptr &&
                        strstr(name, "libpcre2") == nullptr &&
                        strstr(name, "libiconv") == nullptr &&
                        strstr(name, "libgodot") == nullptr &&
                        strstr(name, "_loaded_") == nullptr) {
                        char full_path[MAX_PATH];
                        snprintf(full_path, sizeof(full_path), "%s/%s", bridge_dir, name);
                        to_load.push_back(std::string(full_path));
                    }
                }
                closedir(d);
            }
#endif
        }
    }

#ifdef _WIN32
    // Preload runtime dependencies on Windows if present
    const char *runtime_deps[] = { "gc.dll", "iconv-2.dll", "pcre2-8.dll" };
    for (int r = 0; r < 3; r++) {
        char dep_path[MAX_PATH];
        if (bridge_dir[0] != '\0') {
            snprintf(dep_path, sizeof(dep_path), "%s\\%s", bridge_dir, runtime_deps[r]);
            LoadLibraryA(dep_path);
        }
        LoadLibraryA(runtime_deps[r]);
    }
#endif

    // Fallback search paths if none found in bridge_dir
    if (to_load.empty()) {
#ifdef _WIN32
        const char *fallbacks[] = { "addons/crystal_integration/bin/plugin.dll", "addons/crystal_integration/bin/game.dll", "addons/crystal_addon/bin/game.dll", "bin/game.dll", "game.dll" };
#elif defined(__ANDROID__) || defined(ANDROID)
        const char *fallbacks[] = { "libplugin.so", "libgame.so", "addons/crystal_integration/bin/android/arm64-v8a/libgame.so", "bin/android/arm64-v8a/libgame.so", "game.so" };
#elif defined(__APPLE__)
        const char *fallbacks[] = { "addons/crystal_integration/bin/plugin.dylib", "addons/crystal_integration/bin/game.dylib", "addons/crystal_addon/bin/game.dylib", "bin/game.dylib", "game.dylib", "bin/libgame.dylib", "libgame.dylib" };
#else
        const char *fallbacks[] = { "addons/crystal_integration/bin/plugin.so", "addons/crystal_integration/bin/game.so", "addons/crystal_addon/bin/game.so", "bin/game.so", "game.so" };
#endif
        for (size_t i = 0; i < sizeof(fallbacks) / sizeof(fallbacks[0]); i++) {
            if (bridge_file_exists(fallbacks[i])) {
                to_load.push_back(std::string(fallbacks[i]));
                break;
            }
        }
    }

#if defined(__ANDROID__) || defined(ANDROID)
    // On Android, if not found on filesystem, try loading directly via linker search path
    if (to_load.empty()) {
        HMODULE hSys = bridge_load_library("libgame.so");
        if (hSys) {
            godot_log_print("[CrystalBridge] Loaded game library via system dlopen('libgame.so')");
            g_hGame = hSys;
            g_loaded_modules.push_back(hSys);
            typedef void (*CrystalInitFn)(const BridgeAPI *api);
            CrystalInitFn init_fn = (CrystalInitFn)bridge_get_proc(hSys, "crystal_godot_init");
            if (init_fn) init_fn(&g_bridge_api);
            return;
        }
    }
#endif

    if (to_load.empty()) {
        godot_log_print("[CrystalBridge] No game or plugin library found yet. Click 'Build Crystal' in the editor to compile your project.");
        return;
    }

    typedef void (*CrystalInitFn)(const BridgeAPI *api);

    for (size_t i = 0; i < to_load.size(); i++) {
        const std::string &candidate_path = to_load[i];
        char canonical_path[MAX_PATH] = {0};
#ifdef _WIN32
        if (_fullpath(canonical_path, candidate_path.c_str(), MAX_PATH)) {
            for (char *p = canonical_path; *p; p++) {
                if (*p == '/') *p = '\\';
                *p = (char)tolower(*p);
            }
        } else {
            snprintf(canonical_path, sizeof(canonical_path), "%s", candidate_path.c_str());
        }
#else
        if (realpath(candidate_path.c_str(), canonical_path) == nullptr) {
            snprintf(canonical_path, sizeof(canonical_path), "%s", candidate_path.c_str());
        }
#endif
        if (g_loaded_module_paths.find(canonical_path) != g_loaded_module_paths.end()) {
            continue;
        }

#ifdef _WIN32
        HMODULE hExisting = GetModuleHandleA(candidate_path.c_str());
        if (!hExisting) {
            hExisting = GetModuleHandleA(canonical_path);
        }
        if (!hExisting) {
            const char *leaf = strrchr(canonical_path, '\\');
            if (leaf) hExisting = GetModuleHandleA(leaf + 1);
        }
        if (hExisting) {
            g_loaded_module_paths.insert(canonical_path);
            continue;
        }
#else
        void *hExisting = dlopen(canonical_path, RTLD_NOLOAD | RTLD_NOW);
        if (!hExisting) {
            hExisting = dlopen(candidate_path.c_str(), RTLD_NOLOAD | RTLD_NOW);
        }
        if (!hExisting) {
            const char *leaf = strrchr(canonical_path, '/');
            if (leaf) hExisting = dlopen(leaf + 1, RTLD_NOLOAD | RTLD_NOW);
        }
        if (hExisting) {
            dlclose(hExisting);
            g_loaded_module_paths.insert(canonical_path);
            continue;
        }
#endif
        HMODULE hModule = NULL;

        if (use_shadow) {
            char shadow_path[MAX_PATH] = {0};
            do {
                snprintf(shadow_path, sizeof(shadow_path), "%s_loaded_%lu_%llu.%s", candidate_path.c_str(), pid, (unsigned long long)ts, shadow_ext);
                ts++;
            } while (bridge_file_exists(shadow_path));

            if (!bridge_copy_file(candidate_path.c_str(), shadow_path)) {
                char err_buf[256];
                bridge_get_last_error(err_buf, sizeof(err_buf));
                char log_buf[512];
                snprintf(log_buf, sizeof(log_buf), "[CrystalBridge] Copy failed from %s to %s (%s)", candidate_path.c_str(), shadow_path, err_buf);
                godot_log_error(log_buf, nullptr, "load_crystal_game_library", __FILE__, __LINE__);
            }
            hModule = bridge_load_library(shadow_path);
            if (hModule) {
                char buf[512];
                snprintf(buf, sizeof(buf), "[CrystalBridge] Loaded library from %s via shadow copy %s", candidate_path.c_str(), shadow_path);
                godot_log_print(buf);
            } else {
                char err_buf[256];
                bridge_get_last_error(err_buf, sizeof(err_buf));
                char log_buf[512];
                snprintf(log_buf, sizeof(log_buf), "[CrystalBridge] Failed to load library %s (%s)", shadow_path, err_buf);
                godot_log_warning(log_buf, nullptr, "load_crystal_game_library", __FILE__, __LINE__);
            }
        } else {
            hModule = bridge_load_library(candidate_path.c_str());
            if (hModule) {
                char buf[512];
                snprintf(buf, sizeof(buf), "[CrystalBridge] Loaded library directly from %s", candidate_path.c_str());
                godot_log_print(buf);
            } else {
                char err_buf[256];
                bridge_get_last_error(err_buf, sizeof(err_buf));
                char log_buf[512];
                snprintf(log_buf, sizeof(log_buf), "[CrystalBridge] Failed to load library %s (%s)", candidate_path.c_str(), err_buf);
                godot_log_warning(log_buf, nullptr, "load_crystal_game_library", __FILE__, __LINE__);
            }
        }

        if (hModule) {
            g_loaded_module_paths.insert(canonical_path);
            g_hGame = hModule;
            g_loaded_modules.push_back(hModule);
            init_gc_library();
            ensure_gc_thread_registered();
            CrystalInitFn init_fn = (CrystalInitFn)bridge_get_proc(hModule, "crystal_godot_init");
            if (init_fn) {
                if (g_initialized_init_fns.find((void*)init_fn) == g_initialized_init_fns.end()) {
                    g_initialized_init_fns.insert((void*)init_fn);
                    init_fn(&g_bridge_api);
                }
            } else {
                godot_log_error("Failed to find 'crystal_godot_init' in loaded library", nullptr, "load_crystal_game_library", __FILE__, __LINE__);
            }
        }
    }
}

/**
 * Pre-caches frequently used Godot engine method binds and utility functions.
 */
static void init_common_method_binds() {
    void *sn_node = make_string_name("Node");
    void *sn_spp = make_string_name("set_physics_process");
    void *sn_sp = make_string_name("set_process");

    mb_set_physics_process = gd_classdb_get_method_bind(sn_node, sn_spp, 2586408642);
    mb_set_process = gd_classdb_get_method_bind(sn_node, sn_sp, 2586408642);

    free_string_name(sn_node); free_string_name(sn_spp); free_string_name(sn_sp);

    if (gd_variant_get_ptr_utility_function) {
        void *sn_p = make_string_name("print");
        gd_util_print = gd_variant_get_ptr_utility_function(sn_p, 2648703342ULL);
        free_string_name(sn_p);

        void *sn_perr = make_string_name("printerr");
        gd_util_printerr = gd_variant_get_ptr_utility_function(sn_perr, 2648703342ULL);
        free_string_name(sn_perr);

        void *sn_iiiv = make_string_name("is_instance_id_valid");
        gd_util_is_instance_id_valid = gd_variant_get_ptr_utility_function(sn_iiiv, 2232439758ULL);
        free_string_name(sn_iiiv);

        void *sn_ifi = make_string_name("instance_from_id");
        gd_util_instance_from_id = gd_variant_get_ptr_utility_function(sn_ifi, 1156694636ULL);
        free_string_name(sn_ifi);
    }

    if (gd_classdb_get_method_bind) {
        void *sn_obj = make_string_name("Object");
        void *sn_gid = make_string_name("get_instance_id");
        mb_object_get_instance_id = gd_classdb_get_method_bind(sn_obj, sn_gid, 3905245786ULL);
        free_string_name(sn_obj); free_string_name(sn_gid);
    }

    if (gd_get_variant_from_type_constructor) {
        gd_variant_from_string = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_STRING);
    }
}

// ==============================================================================
// GDExtension Module Lifecycle Callbacks
// ==============================================================================

/**
 * Callback invoked by Godot at distinct initialization levels (CORE, SERVERS, SCENE, EDITOR).
 * Initializes common method binds and boots the Crystal runtime at GDEXTENSION_INITIALIZATION_SCENE.
 */
static void initialize_crystal_module(void *p_userdata, GDExtensionInitializationLevel p_level) {
    if (p_userdata) {
        g_library = (GDExtensionClassLibraryPtr)p_userdata;
    }
    g_current_init_level = p_level;
    if (p_level == GDEXTENSION_INITIALIZATION_SCENE) {
        init_common_method_binds();
        godot_log_print("[CrystalBridge] Initializing generic Crystal GDExtension host...");
        load_crystal_game_library();
    } else if (p_level == GDEXTENSION_INITIALIZATION_EDITOR) {
        if (!g_deferred_editor_classes.empty()) {
            godot_log_print("[CrystalBridge] Registering deferred Editor classes at EDITOR level...");
            for (auto &pair : g_deferred_editor_classes) {
                g_library = pair.first;
                do_classdb_register(pair.second);
            }
            g_deferred_editor_classes.clear();
        }
        bridge_flush_editor_help();
    }
}

/**
 * Callback invoked by Godot during engine shutdown or reload.
 * Unregisters all registered Crystal classes from ClassDB and resets game library handles.
 * Editor classes are unregistered at EDITOR level before editor types are destroyed;
 * Scene classes are unregistered at SCENE level.
 */
static void deinitialize_crystal_module(void *p_userdata, GDExtensionInitializationLevel p_level) {
    GDExtensionClassLibraryPtr lib = (GDExtensionClassLibraryPtr)p_userdata;
    if (p_userdata) {
        g_library = lib;
    }
    if (p_level == GDEXTENSION_INITIALIZATION_EDITOR) {
        if (lib && g_library_editor_classes.find(lib) != g_library_editor_classes.end()) {
            auto &classes = g_library_editor_classes[lib];
            if (!classes.empty() && gd_classdb_unregister_extension_class) {
                godot_log_print("[CrystalBridge] Unregistering Editor classes at EDITOR level...");
                for (int i = (int)classes.size() - 1; i >= 0; i--) {
                    void *sn = make_string_name(classes[i].c_str());
                    gd_classdb_unregister_extension_class(lib, sn);
                    free_string_name(sn);
                }
            }
            g_library_editor_classes.erase(lib);
        }
    } else if (p_level == GDEXTENSION_INITIALIZATION_SCENE) {
        if (lib && g_library_scene_classes.find(lib) != g_library_scene_classes.end()) {
            auto &classes = g_library_scene_classes[lib];
            if (!classes.empty() && gd_classdb_unregister_extension_class) {
                godot_log_print("[CrystalBridge] Unregistering Crystal classes...");
                for (int i = (int)classes.size() - 1; i >= 0; i--) {
                    void *sn = make_string_name(classes[i].c_str());
                    gd_classdb_unregister_extension_class(lib, sn);
                    free_string_name(sn);
                }
            }
            g_library_scene_classes.erase(lib);
        }
        g_active_extension_count--;
        if (g_active_extension_count <= 0) {
            g_active_extension_count = 0;
            g_library_scene_classes.clear();
            g_library_editor_classes.clear();
            g_registered_classes.clear();
            g_deferred_editor_classes.clear();
            g_editor_doc_xmls.clear();
            g_all_registered_class_names.clear();
            if (g_sn_pp) { free_string_name(g_sn_pp); g_sn_pp = nullptr; }
            if (g_sn_p) { free_string_name(g_sn_p); g_sn_p = nullptr; }
            if (g_sn_r) { free_string_name(g_sn_r); g_sn_r = nullptr; }
            if (g_sn_et) { free_string_name(g_sn_et); g_sn_et = nullptr; }
            if (g_sn_xt) { free_string_name(g_sn_xt); g_sn_xt = nullptr; }
            if (g_sn_b) { free_string_name(g_sn_b); g_sn_b = nullptr; }
            unload_crystal_game_library();
            godot_log_print("[CrystalBridge] Crystal module deinitialized.");
        }
    }
}

// ==============================================================================
// GDExtension Library Master Entry Point
// ==============================================================================

/**
 * Primary entry point declared in crystal.gdextension (entry_symbol = "crystal_library_init").
 *
 * Godot calls this function immediately upon loading the bridge shared library.
 * Populates all GDExtensionInterface function pointers and registers initialization hooks.
 *
 * @param p_get_proc_address Function pointer resolution callback from Godot.
 * @param p_library The GDExtensionClassLibraryPtr assigned by Godot.
 * @param r_initialization Struct to receive initialize and deinitialize function pointers.
 * @return 1 on success, 0 on failure.
 */
#ifdef _WIN32
static LONG WINAPI custom_crash_handler(PEXCEPTION_POINTERS pExceptionInfo) {
    if (pExceptionInfo->ExceptionRecord->ExceptionCode == EXCEPTION_ACCESS_VIOLATION) {
        void *faulting_addr = pExceptionInfo->ExceptionRecord->ExceptionAddress;
        ULONG_PTR access_type = pExceptionInfo->ExceptionRecord->ExceptionInformation[0];
        ULONG_PTR target_addr = pExceptionInfo->ExceptionRecord->ExceptionInformation[1];

        HMODULE hMod = NULL;
        char mod_name[MAX_PATH] = "Unknown";
        if (GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                               (LPCSTR)faulting_addr, &hMod)) {
            GetModuleFileNameA(hMod, mod_name, sizeof(mod_name));
        }

        char report[4096];
        int pos = snprintf(report, sizeof(report),
            "\n==================== CRASH INTERCEPTED ====================\n"
            "Access Violation (0xC0000005) attempting to %s address 0x%llx\n"
            "Faulting instruction at: %p in module %s (offset 0x%llx)\n"
            "Callstack:\n",
            access_type == 0 ? "read" : "write", (unsigned long long)target_addr,
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

extern "C" GDE_EXPORT GDExtensionBool crystal_library_init(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization *r_initialization
) {
    g_active_extension_count++;
    init_gc_library();
    ensure_gc_thread_registered();
#ifdef _WIN32
    static bool s_handler_installed = false;
    if (!s_handler_installed) {
        s_handler_installed = true;
        AddVectoredExceptionHandler(1, custom_crash_handler);
    }
#endif
    gd_get_proc_address = p_get_proc_address;
    g_library = p_library;

    gd_string_name_new_with_utf8_chars = (GDExtensionInterfaceStringNameNewWithUtf8Chars)p_get_proc_address("string_name_new_with_utf8_chars");
    gd_string_new_with_utf8_chars = (GDExtensionInterfaceStringNewWithUtf8Chars)p_get_proc_address("string_new_with_utf8_chars");
    gd_variant_destroy = (GDExtensionInterfaceVariantDestroy)p_get_proc_address("variant_destroy");
    gd_classdb_construct_object = (GDExtensionInterfaceClassdbConstructObject)p_get_proc_address("classdb_construct_object");
    gd_object_set_instance = (GDExtensionInterfaceObjectSetInstance)p_get_proc_address("object_set_instance");
    gd_classdb_register_extension_class6 = (GDExtensionInterfaceClassdbRegisterExtensionClass6)p_get_proc_address("classdb_register_extension_class6");
    gd_classdb_unregister_extension_class = (GDExtensionInterfaceClassdbUnregisterExtensionClass)p_get_proc_address("classdb_unregister_extension_class");
    gd_classdb_register_extension_class_property = (GDExtensionInterfaceClassdbRegisterExtensionClassProperty)p_get_proc_address("classdb_register_extension_class_property");
    gd_classdb_register_extension_class_property_group = (GDExtensionInterfaceClassdbRegisterExtensionClassPropertyGroup)p_get_proc_address("classdb_register_extension_class_property_group");
    gd_classdb_register_extension_class_property_subgroup = (GDExtensionInterfaceClassdbRegisterExtensionClassPropertySubgroup)p_get_proc_address("classdb_register_extension_class_property_subgroup");
    gd_classdb_register_extension_class_integer_constant = (GDExtensionInterfaceClassdbRegisterExtensionClassIntegerConstant)p_get_proc_address("classdb_register_extension_class_integer_constant");
    gd_classdb_register_extension_class_signal = (GDExtensionInterfaceClassdbRegisterExtensionClassSignal)p_get_proc_address("classdb_register_extension_class_signal");
    gd_classdb_register_extension_class_method = (GDExtensionInterfaceClassdbRegisterExtensionClassMethod)p_get_proc_address("classdb_register_extension_class_method");
    gd_classdb_get_method_bind = (GDExtensionInterfaceClassdbGetMethodBind)p_get_proc_address("classdb_get_method_bind");
    gd_object_method_bind_ptrcall = (GDExtensionInterfaceObjectMethodBindPtrcall)p_get_proc_address("object_method_bind_ptrcall");
    gd_object_method_bind_call = (GDExtensionInterfaceObjectMethodBindCall)p_get_proc_address("object_method_bind_call");
    gd_editor_help_load_xml_from_utf8_chars = (GDExtensionsInterfaceEditorHelpLoadXmlFromUtf8Chars)p_get_proc_address("editor_help_load_xml_from_utf8_chars");
    gd_global_get_singleton = (GDExtensionInterfaceGlobalGetSingleton)p_get_proc_address("global_get_singleton");
    gd_get_variant_from_type_constructor = (GDExtensionInterfaceGetVariantFromTypeConstructor)p_get_proc_address("get_variant_from_type_constructor");
    gd_get_variant_to_type_constructor = (GDExtensionInterfaceGetVariantToTypeConstructor)p_get_proc_address("get_variant_to_type_constructor");
    gd_variant_get_type = (GDExtensionInterfaceVariantGetType)p_get_proc_address("variant_get_type");
    gd_variant_get_object_instance_id = (GDExtensionInterfaceVariantGetObjectInstanceId)p_get_proc_address("variant_get_object_instance_id");
    gd_object_get_instance_from_id = (GDExtensionInterfaceObjectGetInstanceFromId)p_get_proc_address("object_get_instance_from_id");
    gd_object_destroy = (GDExtensionInterfaceObjectDestroy)p_get_proc_address("object_destroy");
    gd_object_get_instance_id = (GDExtensionInterfaceObjectGetInstanceId)p_get_proc_address("object_get_instance_id");
    gd_ref_set_object = (GDExtensionInterfaceRefSetObject)p_get_proc_address("ref_set_object");
    gd_ref_get_object = (GDExtensionInterfaceRefGetObject)p_get_proc_address("ref_get_object");
    gd_variant_stringify = (GDExtensionInterfaceVariantStringify)p_get_proc_address("variant_stringify");
    gd_string_to_utf8_chars = (GDExtensionInterfaceStringToUtf8Chars)p_get_proc_address("string_to_utf8_chars");

    GDExtensionInterfaceVariantGetPtrInternalGetter get_internal = (GDExtensionInterfaceVariantGetPtrInternalGetter)p_get_proc_address("variant_get_ptr_internal_getter");
    if (get_internal) {
        gd_variant_get_internal_ptr_object = get_internal(GDEXTENSION_VARIANT_TYPE_OBJECT);
    }

    // Logging & error functions
    gd_print_error = (GDExtensionInterfacePrintError)p_get_proc_address("print_error");
    gd_print_error_with_message = (GDExtensionInterfacePrintErrorWithMessage)p_get_proc_address("print_error_with_message");
    gd_print_warning = (GDExtensionInterfacePrintWarning)p_get_proc_address("print_warning");
    gd_print_warning_with_message = (GDExtensionInterfacePrintWarningWithMessage)p_get_proc_address("print_warning_with_message");
    gd_variant_get_ptr_utility_function = (GDExtensionInterfaceVariantGetPtrUtilityFunction)p_get_proc_address("variant_get_ptr_utility_function");
    gd_variant_get_ptr_constructor = (GDExtensionInterfaceVariantGetPtrConstructor)p_get_proc_address("variant_get_ptr_constructor");
    gd_variant_get_ptr_destructor = (GDExtensionInterfaceVariantGetPtrDestructor)p_get_proc_address("variant_get_ptr_destructor");
    gd_variant_get_ptr_builtin_method = (GDExtensionInterfaceVariantGetPtrBuiltinMethod)p_get_proc_address("variant_get_ptr_builtin_method");
    gd_variant_get_ptr_keyed_setter = (GDExtensionInterfaceVariantGetPtrKeyedSetter)p_get_proc_address("variant_get_ptr_keyed_setter");

    gd_callable_custom_create2 = (GDExtensionInterfaceCallableCustomCreate2)p_get_proc_address("callable_custom_create2");
    gd_callable_custom_create = (GDExtensionInterfaceCallableCustomCreate)p_get_proc_address("callable_custom_create");
    gd_variant_new_nil = (GDExtensionInterfaceVariantNewNil)p_get_proc_address("variant_new_nil");

    if (gd_variant_get_ptr_destructor) {
        gd_string_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING);
        gd_string_name_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING_NAME);
        gd_callable_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_CALLABLE);
    }

    if (gd_variant_get_ptr_utility_function && gd_string_name_new_with_utf8_chars) {
        void *sn_print = make_string_name("print");
        gd_util_print = gd_variant_get_ptr_utility_function(sn_print, 2648703342);
        free_string_name(sn_print);

        void *sn_printerr = make_string_name("printerr");
        gd_util_printerr = gd_variant_get_ptr_utility_function(sn_printerr, 2648703342);
        free_string_name(sn_printerr);
    }

    if (gd_get_variant_from_type_constructor) {
        gd_variant_from_string = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_STRING);
    }

    r_initialization->initialize = initialize_crystal_module;
    r_initialization->deinitialize = deinitialize_crystal_module;
    r_initialization->minimum_initialization_level = GDEXTENSION_INITIALIZATION_SCENE;
    r_initialization->userdata = p_library;

    return 1;
}
