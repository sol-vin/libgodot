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
 * Modular Components:
 * - common.hpp: System headers, platform abstractions, SEH crash dumps.
 * - gdextension_api.hpp: Cached Godot C-API function pointers and logging.
 * - bridge_types.hpp: C-ABI data structures (VariantArg, CrystalClassDesc, BridgeAPI).
 * - gc_support.hpp: Boehm GC foreign engine thread registration.
 * - editor_doc.hpp: In-Editor XML Help Documentation harvester.
 * - dispatch_signals.hpp: Method bind dispatch, Variant marshaling, CustomCallable.
 * - extension_instance.hpp: GenericExtensionInstance lifecycle and property access.
 * - classdb_registry.hpp: ClassDB class registration and reflection.
 * - bridge_api.hpp: Master BridgeAPI function table and exported C API.
 * - module_loader.hpp: Dynamic library loading, shadow copying, and hot reloading.
 * ==============================================================================
 */

#include "common.hpp"
#include "gdextension_api.hpp"
#include "bridge_types.hpp"
#include "gc_support.hpp"
#include "editor_doc.hpp"
#include "dispatch_signals.hpp"
#include "extension_instance.hpp"
#include "classdb_registry.hpp"
#include "bridge_api.hpp"
#include "module_loader.hpp"

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
    s_is_reloading = 0;
    if (p_level == GDEXTENSION_INITIALIZATION_SCENE) {
        init_common_method_binds();
        godot_log_print("[CrystalBridge] Initializing generic Crystal GDExtension host...");
        load_crystal_game_library();
    } else if (p_level == GDEXTENSION_INITIALIZATION_EDITOR) {
        register_deferred_editor_classes();
        bridge_flush_editor_help();
    }
}

#ifdef _WIN32
static bool s_handler_installed = false;
static PVOID g_veh_handler = NULL;
#endif


static bool is_engine_shutting_down() {
    return (s_is_reloading == 0);
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
        // Run Crystal deinitialization callbacks (e.g. unregistering ResourceFormatLoader, ResourceFormatSaver, ScriptLanguage)
        // BEFORE unregistering classes from ClassDB so instances can be cleanly removed from singletons while their types exist.
        if (lib) {
            auto it = g_library_deinit_callbacks.find(lib);
            if (it != g_library_deinit_callbacks.end()) {
                for (auto fn : it->second) {
                    if (fn) fn();
                }
                g_library_deinit_callbacks.erase(it);
            }
        }

        // Only unregister from ClassDB during hot-reload. During normal engine shutdown,
        // Godot's ClassDB::cleanup() automatically cleans up all classes.
        // Calling unregister_extension_class during shutdown causes stack overflow recursion in Godot 4.
        if (lib && !is_engine_shutting_down() && gd_classdb_unregister_extension_class) {
            auto it_ed = g_library_editor_classes.find(lib);
            if (it_ed != g_library_editor_classes.end()) {
                for (int i = (int)it_ed->second.size() - 1; i >= 0; i--) {
                    void *sn = make_string_name(it_ed->second[i].c_str());
                    gd_classdb_unregister_extension_class(lib, sn);
                    free_string_name(sn);
                }
                g_library_editor_classes.erase(it_ed);
            }
        }
    } else if (p_level == GDEXTENSION_INITIALIZATION_SCENE) {
        if (lib) {
            auto it = g_library_deinit_callbacks.find(lib);
            if (it != g_library_deinit_callbacks.end()) {
                for (auto fn : it->second) {
                    if (fn) fn();
                }
                g_library_deinit_callbacks.erase(it);
            }
        }

        if (lib) {
            if (!is_engine_shutting_down() && gd_classdb_unregister_extension_class) {
                auto it_ed = g_library_editor_classes.find(lib);
                if (it_ed != g_library_editor_classes.end()) {
                    for (int i = (int)it_ed->second.size() - 1; i >= 0; i--) {
                        void *sn = make_string_name(it_ed->second[i].c_str());
                        gd_classdb_unregister_extension_class(lib, sn);
                        free_string_name(sn);
                    }
                    g_library_editor_classes.erase(it_ed);
                }

                auto it_sc = g_library_scene_classes.find(lib);
                if (it_sc != g_library_scene_classes.end()) {
                    for (int i = (int)it_sc->second.size() - 1; i >= 0; i--) {
                        void *sn = make_string_name(it_sc->second[i].c_str());
                        gd_classdb_unregister_extension_class(lib, sn);
                        free_string_name(sn);
                    }
                    g_library_scene_classes.erase(it_sc);
                }
            } else {
                g_library_editor_classes.erase(lib);
                g_library_scene_classes.erase(lib);
            }
        }
        g_active_extension_count--;
        if (g_active_extension_count <= 0) {
            if (!is_engine_shutting_down() && gd_classdb_unregister_extension_class) {
                for (auto &pair : g_library_editor_classes) {
                    for (int i = (int)pair.second.size() - 1; i >= 0; i--) {
                        void *sn = make_string_name(pair.second[i].c_str());
                        gd_classdb_unregister_extension_class(pair.first, sn);
                        free_string_name(sn);
                    }
                }
                for (auto &pair : g_library_scene_classes) {
                    for (int i = (int)pair.second.size() - 1; i >= 0; i--) {
                        void *sn = make_string_name(pair.second[i].c_str());
                        gd_classdb_unregister_extension_class(pair.first, sn);
                        free_string_name(sn);
                    }
                }
            }
            g_active_extension_count = 0;
            g_library_deinit_callbacks.clear();
            g_library_scene_classes.clear();
            g_library_editor_classes.clear();
            // Retain g_persistent_class_descs and g_all_registered_class_names:
            // Godot ClassDB retains class_userdata pointers across reloads. Preserving them prevents dangling pointers.
            g_deferred_editor_classes.clear();
            g_editor_doc_xmls.clear();
            g_loader_registered = 0;
            g_saver_registered = 0;
            g_language_registered = 0;
            s_is_reloading = 0;
            unload_crystal_game_library();
#ifdef _WIN32
            // Retain g_veh_handler so heap corruption or termination faults during process exit are captured
#endif
            godot_log_print("[CrystalBridge] Crystal module deinitialized.");
        }
    }
}

// ==============================================================================
// GDExtension Library Master Entry Point
// ==============================================================================

extern "C" GDE_EXPORT GDExtensionBool crystal_library_init(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization *r_initialization
) {
#ifdef _WIN32
    // Pin crystal_bridge in memory so Godot's FreeLibrary during GDExtension reload
    // does NOT unmap the bridge DLL. Godot's ClassDB retains function pointers
    // and class_userdata pointers across reloads; unmapping the DLL causes immediate
    // ACCESS_VIOLATION (0xC0000005) crashes when Godot dispatches to unmapped code.
    HMODULE hBridgeMod = NULL;
    GetModuleHandleExA(
        GET_MODULE_HANDLE_EX_FLAG_PIN | GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS,
        (LPCSTR)&crystal_library_init,
        &hBridgeMod
    );
#elif !defined(__APPLE__) && !defined(__ANDROID__)
    Dl_info dli;
    if (dladdr((void*)&crystal_library_init, &dli) && dli.dli_fname) {
        dlopen(dli.dli_fname, RTLD_NOW | RTLD_NODELETE);
    }
#endif
    g_active_extension_count++;
    init_gc_library();
    ensure_gc_thread_registered();
#ifdef _WIN32
    if (!s_handler_installed) {
        s_handler_installed = true;
        g_veh_handler = AddVectoredExceptionHandler(1, custom_crash_handler);
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
    gd_placeholder_script_instance_create = (GDExtensionInterfacePlaceHolderScriptInstanceCreate)p_get_proc_address("placeholder_script_instance_create");

    if (gd_variant_get_ptr_destructor) {
        gd_string_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING);
        gd_string_name_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING_NAME);
        gd_callable_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_CALLABLE);
    }

    if (gd_variant_get_ptr_utility_function && gd_string_name_new_with_utf8_chars) {
        void *sn_print = make_string_name("print");
        gd_util_print = gd_variant_get_ptr_utility_function(sn_print, 2648703342ULL);
        free_string_name(sn_print);

        void *sn_printerr = make_string_name("printerr");
        gd_util_printerr = gd_variant_get_ptr_utility_function(sn_printerr, 2648703342ULL);
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
