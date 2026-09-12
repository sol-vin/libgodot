#pragma once

#include "common.hpp"
#include "gdextension_api.hpp"
#include "bridge_types.hpp"
#include "gc_support.hpp"
#include "dispatch_signals.hpp"

/**
 * ==============================================================================
 * LibGodot - Extension Instance Lifecycle, Property Access & Virtual Dispatch
 * ==============================================================================
 */

/**
 * Queries whether the Godot Editor is currently running (Engine.is_editor_hint()).
 * Caches the result to prevent repeated singleton and method lookups on every frame.
 */
inline bool is_editor_active() {
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
    gd_object_method_bind_ptrcall(mb, engine, nullptr, &ret_bool);
    s_cached = (ret_bool != 0) ? 1 : 0;
    return s_cached == 1;
}

inline bool is_editor_class_name(const char *name) {
    if (!name) return false;
    return (strncmp(name, "Editor", 6) == 0);
}

inline bool is_tool_desc(const CrystalClassDesc *desc) {
    if (!desc) return false;
    if (desc->is_tool) return true;
    const CrystalClassDesc *curr = desc;
    while (curr) {
        if (curr->is_tool || is_editor_class_name(curr->parent_name)) return true;
        curr = curr->parent_desc;
    }
    return false;
}

inline bool is_refcounted_desc(const CrystalClassDesc *desc) {
    if (!desc) return false;
    const CrystalClassDesc *curr = desc;
    while (curr) {
        if (curr->parent_name) {
            if (strcmp(curr->parent_name, "RefCounted") == 0 ||
                strcmp(curr->parent_name, "Resource") == 0 ||
                strcmp(curr->parent_name, "ResourceFormatLoader") == 0 ||
                strcmp(curr->parent_name, "ResourceFormatSaver") == 0 ||
                strcmp(curr->parent_name, "EditorSyntaxHighlighter") == 0 ||
                strcmp(curr->parent_name, "EditorDebuggerPlugin") == 0) {
                return true;
            }
        }
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
 */
inline GDExtensionObjectPtr generic_class_create(void *p_class_userdata, GDExtensionBool p_notify_postinitialize) {
    (void)p_notify_postinitialize;
    ensure_gc_thread_registered();
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    // Find the closest native Godot parent class to construct
    const CrystalClassDesc *root_desc = desc;
    int depth = 0;
    while (root_desc->parent_desc && depth++ < 32) {
        root_desc = root_desc->parent_desc;
    }
    const char *native_parent = root_desc->parent_name;
    if (!native_parent || native_parent[0] == '\0') {
        native_parent = "Object";
    }
    if (!desc->name || desc->name[0] == '\0') {
        godot_log_error("generic_class_create called with null/empty desc->name", nullptr, "generic_class_create", __FILE__, __LINE__);
        return nullptr;
    }

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
inline GDExtensionClassInstancePtr generic_class_recreate(void *p_class_userdata, GDExtensionObjectPtr p_object) {
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
inline void generic_class_free(void *p_class_userdata, GDExtensionClassInstancePtr p_instance) {
    (void)p_class_userdata;
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
inline void generic_virtual_physics_process(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    (void)r_ret;
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
    inst->desc->call_virtual(inst->crystal_instance, "_physics_process", delta);
}

/** Dispatches Godot's _process(delta) virtual callback into Crystal */
inline void generic_virtual_process(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    (void)r_ret;
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
    inst->desc->call_virtual(inst->crystal_instance, "_process", delta);
}

/** Dispatches Godot's _ready() virtual callback into Crystal */
inline void generic_virtual_ready(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    (void)p_args; (void)r_ret;
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    inst->desc->call_virtual(inst->crystal_instance, "_ready", 0.0);
}

/** Dispatches Godot's _enter_tree() virtual callback into Crystal */
inline void generic_virtual_enter_tree(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    (void)p_args; (void)r_ret;
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    inst->desc->call_virtual(inst->crystal_instance, "_enter_tree", 0.0);
}

/** Dispatches Godot's _exit_tree() virtual callback into Crystal */
inline void generic_virtual_exit_tree(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    (void)p_args; (void)r_ret;
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !is_tool_desc(inst->desc)) return;
    inst->desc->call_virtual(inst->crystal_instance, "_exit_tree", 0.0);
}

/** Dispatches Godot's _build() virtual callback for EditorPlugin into Crystal */
inline void generic_virtual_build(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    (void)p_args;
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->crystal_instance) return;
    if (r_ret) *(uint8_t*)r_ret = 1;
    if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_build", 0.0);
}

inline GDExtensionClassCallVirtual generic_class_get_virtual(void *p_class_userdata, GDExtensionConstStringNamePtr p_name) {
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    char method_buf[64];
    if (!string_name_to_cstr(p_name, method_buf, sizeof(method_buf))) return nullptr;

    if (desc->has_physics_process && strcmp(method_buf, "_physics_process") == 0) {
        return generic_virtual_physics_process;
    }
    if (desc->has_process && strcmp(method_buf, "_process") == 0) {
        return generic_virtual_process;
    }
    if (desc->has_ready && strcmp(method_buf, "_ready") == 0) {
        return generic_virtual_ready;
    }
    if (desc->has_enter_tree && strcmp(method_buf, "_enter_tree") == 0) {
        return generic_virtual_enter_tree;
    }
    if (desc->has_exit_tree && strcmp(method_buf, "_exit_tree") == 0) {
        return generic_virtual_exit_tree;
    }
    if (strcmp(method_buf, "_build") == 0) {
        return generic_virtual_build;
    }

    return nullptr;
}

static std::unordered_set<std::string> g_interned_virtual_methods;

inline const char* intern_virtual_method(const char *name) {
    if (!name) return nullptr;
    auto it = g_interned_virtual_methods.find(name);
    if (it != g_interned_virtual_methods.end()) {
        return it->c_str();
    }
    auto res = g_interned_virtual_methods.insert(name);
    return res.first->c_str();
}

/**
 * Resolves virtual call user data for Godot 4 virtual methods.
 * Returning non-null indicates the virtual method is overridden by the extension.
 */
inline void* generic_class_get_virtual_call_data(void *p_class_userdata, GDExtensionConstStringNamePtr p_name, uint32_t p_hash) {
    (void)p_hash;
    ensure_gc_thread_registered();
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    char method_buf[128];
    if (!string_name_to_cstr(p_name, method_buf, sizeof(method_buf))) {
        godot_log_print("[CrystalBridge] generic_class_get_virtual_call_data: string_name_to_cstr FAILED");
        return nullptr;
    }

    // Built-in lifecycle methods (check both with and without leading underscore)
    if (strcmp(method_buf, "_ready") == 0 || strcmp(method_buf, "ready") == 0) {
        return desc->has_ready ? (void*)intern_virtual_method(method_buf) : nullptr;
    }
    if (strcmp(method_buf, "_process") == 0 || strcmp(method_buf, "process") == 0) {
        return desc->has_process ? (void*)intern_virtual_method(method_buf) : nullptr;
    }
    if (strcmp(method_buf, "_physics_process") == 0 || strcmp(method_buf, "physics_process") == 0) {
        return desc->has_physics_process ? (void*)intern_virtual_method(method_buf) : nullptr;
    }
    if (strcmp(method_buf, "_enter_tree") == 0 || strcmp(method_buf, "enter_tree") == 0) {
        return desc->has_enter_tree ? (void*)intern_virtual_method(method_buf) : nullptr;
    }
    if (strcmp(method_buf, "_exit_tree") == 0 || strcmp(method_buf, "exit_tree") == 0) {
        return desc->has_exit_tree ? (void*)intern_virtual_method(method_buf) : nullptr;
    }
    if (strcmp(method_buf, "_build") == 0 || strcmp(method_buf, "build") == 0) {
        return (void*)intern_virtual_method(method_buf);
    }

    // Direct resolution for first-class script language extension classes
    if (desc->name) {
        const char *norm_name = (method_buf[0] == '_') ? method_buf : nullptr;
        char prefixed[130];
        if (!norm_name) {
            prefixed[0] = '_';
            strncpy(prefixed + 1, method_buf, sizeof(prefixed) - 2);
            prefixed[sizeof(prefixed) - 1] = '\0';
            norm_name = prefixed;
        }

        if (strcmp(desc->name, "CrystalLanguage") == 0) {
            if (strcmp(norm_name, "_get_name") == 0 ||
                strcmp(norm_name, "_init") == 0 ||
                strcmp(norm_name, "_get_type") == 0 ||
                strcmp(norm_name, "_get_extension") == 0 ||
                strcmp(norm_name, "_finish") == 0 ||
                strcmp(norm_name, "_get_recognized_extensions") == 0 ||
                strcmp(norm_name, "_get_reserved_words") == 0 ||
                strcmp(norm_name, "_is_control_flow_keyword") == 0 ||
                strcmp(norm_name, "_get_comment_delimiters") == 0 ||
                strcmp(norm_name, "_get_doc_comment_delimiters") == 0 ||
                strcmp(norm_name, "_get_string_delimiters") == 0 ||
                strcmp(norm_name, "_make_template") == 0 ||
                strcmp(norm_name, "_get_built_in_templates") == 0 ||
                strcmp(norm_name, "_is_using_templates") == 0 ||
                strcmp(norm_name, "_validate") == 0 ||
                strcmp(norm_name, "_validate_path") == 0 ||
                strcmp(norm_name, "_create_script") == 0 ||
                strcmp(norm_name, "_has_named_classes") == 0 ||
                strcmp(norm_name, "_supports_builtin_mode") == 0 ||
                strcmp(norm_name, "_supports_documentation") == 0 ||
                strcmp(norm_name, "_can_inherit_from_file") == 0 ||
                strcmp(norm_name, "_find_function") == 0 ||
                strcmp(norm_name, "_make_function") == 0 ||
                strcmp(norm_name, "_can_make_function") == 0 ||
                strcmp(norm_name, "_open_in_external_editor") == 0 ||
                strcmp(norm_name, "_overrides_external_editor") == 0 ||
                strcmp(norm_name, "_preferred_file_name_casing") == 0 ||
                strcmp(norm_name, "_complete_code") == 0 ||
                strcmp(norm_name, "_lookup_code") == 0 ||
                strcmp(norm_name, "_auto_indent_code") == 0 ||
                strcmp(norm_name, "_add_global_constant") == 0 ||
                strcmp(norm_name, "_add_named_global_constant") == 0 ||
                strcmp(norm_name, "_remove_named_global_constant") == 0 ||
                strcmp(norm_name, "_thread_enter") == 0 ||
                strcmp(norm_name, "_thread_exit") == 0 ||
                strcmp(norm_name, "_frame") == 0 ||
                strcmp(norm_name, "_reload_all_scripts") == 0 ||
                strcmp(norm_name, "_reload_scripts") == 0 ||
                strcmp(norm_name, "_reload_tool_script") == 0 ||
                strcmp(norm_name, "_get_public_functions") == 0 ||
                strcmp(norm_name, "_get_public_constants") == 0 ||
                strcmp(norm_name, "_get_public_annotations") == 0 ||
                strcmp(norm_name, "_profiling_start") == 0 ||
                strcmp(norm_name, "_profiling_stop") == 0 ||
                strcmp(norm_name, "_profiling_set_save_native_calls") == 0 ||
                strcmp(norm_name, "_profiling_get_accumulated_data") == 0 ||
                strcmp(norm_name, "_profiling_get_frame_data") == 0 ||
                strcmp(norm_name, "_handles_global_class_type") == 0 ||
                strcmp(norm_name, "_get_global_class_name") == 0) {
                return (void*)intern_virtual_method(norm_name);
            }
        } else if (strcmp(desc->name, "ResourceFormatLoaderCrystal") == 0) {
            if (strcmp(norm_name, "_get_recognized_extensions") == 0 ||
                strcmp(norm_name, "_handles_type") == 0 ||
                strcmp(norm_name, "_get_resource_type") == 0 ||
                strcmp(norm_name, "_get_resource_script_class") == 0 ||
                strcmp(norm_name, "_load") == 0 ||
                strcmp(norm_name, "_recognize_path") == 0) {
                return (void*)intern_virtual_method(norm_name);
            }
        } else if (strcmp(desc->name, "ResourceFormatSaverCrystal") == 0) {
            if (strcmp(norm_name, "_get_recognized_extensions") == 0 ||
                strcmp(norm_name, "_recognize") == 0 ||
                strcmp(norm_name, "_recognize_path") == 0 ||
                strcmp(norm_name, "_save") == 0) {
                return (void*)intern_virtual_method(norm_name);
            }
        } else if (strcmp(desc->name, "CrystalHighlighter") == 0) {
            if (strcmp(norm_name, "_get_line_syntax_highlighting") == 0 ||
                strcmp(norm_name, "_clear_highlighting_cache") == 0 ||
                strcmp(norm_name, "_update_cache") == 0) {
                return (void*)intern_virtual_method(norm_name);
            }
        } else if (strcmp(desc->name, "CrystalScript") == 0) {
            if (strcmp(norm_name, "_can_instantiate") == 0 ||
                strcmp(norm_name, "_inherits_script") == 0 ||
                strcmp(norm_name, "_get_base_script") == 0 ||
                strcmp(norm_name, "_get_global_name") == 0 ||
                strcmp(norm_name, "_get_instance_base_type") == 0 ||
                strcmp(norm_name, "_instance_create") == 0 ||
                strcmp(norm_name, "_placeholder_instance_create") == 0 ||
                strcmp(norm_name, "_placeholder_erased") == 0 ||
                strcmp(norm_name, "_instance_has") == 0 ||
                strcmp(norm_name, "_has_source_code") == 0 ||
                strcmp(norm_name, "_get_source_code") == 0 ||
                strcmp(norm_name, "_set_source_code") == 0 ||
                strcmp(norm_name, "_reload") == 0 ||
                strcmp(norm_name, "_editor_can_reload_from_file") == 0 ||
                strcmp(norm_name, "_has_method") == 0 ||
                strcmp(norm_name, "_has_static_method") == 0 ||
                strcmp(norm_name, "_get_script_method_argument_count") == 0 ||
                strcmp(norm_name, "_get_method_info") == 0 ||
                strcmp(norm_name, "_is_valid") == 0 ||
                strcmp(norm_name, "_is_tool") == 0 ||
                strcmp(norm_name, "_is_abstract") == 0 ||
                strcmp(norm_name, "_get_language") == 0 ||
                strcmp(norm_name, "_has_script_signal") == 0 ||
                strcmp(norm_name, "_get_script_signal_list") == 0 ||
                strcmp(norm_name, "_has_property_default_value") == 0 ||
                strcmp(norm_name, "_get_property_default_value") == 0 ||
                strcmp(norm_name, "_update_exports") == 0 ||
                strcmp(norm_name, "_get_script_method_list") == 0 ||
                strcmp(norm_name, "_get_script_property_list") == 0 ||
                strcmp(norm_name, "_get_member_line") == 0 ||
                strcmp(norm_name, "_get_constants") == 0 ||
                strcmp(norm_name, "_get_members") == 0 ||
                strcmp(norm_name, "_get_documentation") == 0 ||
                strcmp(norm_name, "_get_doc_class_name") == 0 ||
                strcmp(norm_name, "_get_class_icon_path") == 0 ||
                strcmp(norm_name, "_is_placeholder_fallback_enabled") == 0 ||
                strcmp(norm_name, "_get_rpc_config") == 0) {
                return (void*)intern_virtual_method(norm_name);
            }
        } else if (strcmp(desc->name, "CrystalIntegrationPlugin") == 0) {
            if (strcmp(norm_name, "_has_main_screen") == 0 ||
                strcmp(norm_name, "_get_plugin_name") == 0 ||
                strcmp(norm_name, "_get_plugin_icon") == 0 ||
                strcmp(norm_name, "_make_visible") == 0 ||
                strcmp(norm_name, "_build") == 0) {
                return (void*)intern_virtual_method(norm_name);
            }
        }
    }

    // Generic virtual method queried via Crystal callback (check verbatim, un-prefixed, and prefixed)
    if (desc->has_virtual_method) {
        if (desc->has_virtual_method(desc, method_buf)) {
            return (void*)intern_virtual_method(method_buf);
        }
        if (method_buf[0] == '_') {
            if (desc->has_virtual_method(desc, method_buf + 1)) {
                return (void*)intern_virtual_method(method_buf);
            }
        } else {
            char alt_buf[130];
            alt_buf[0] = '_';
            strncpy(alt_buf + 1, method_buf, sizeof(alt_buf) - 2);
            alt_buf[sizeof(alt_buf) - 1] = '\0';
            if (desc->has_virtual_method(desc, alt_buf)) {
                return (void*)intern_virtual_method(method_buf);
            }
        }
    }

    return nullptr;
}

/**
 * Dispatches generic virtual methods with arguments and return buffers into Crystal.
 */
inline void generic_class_call_virtual_with_data(
    GDExtensionClassInstancePtr p_instance,
    GDExtensionConstStringNamePtr p_name,
    void *p_virtual_call_userdata,
    const GDExtensionConstTypePtr *p_args,
    GDExtensionTypePtr r_ret
) {
    (void)p_name;
    ensure_gc_thread_registered();
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->crystal_instance) return;

    const char *method_name = (const char*)p_virtual_call_userdata;
    if (!method_name) return;

    if (strcmp(method_name, "_ready") == 0 || strcmp(method_name, "ready") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_ready", 0.0);
        return;
    }
    if (strcmp(method_name, "_process") == 0 || strcmp(method_name, "process") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_process", delta);
        return;
    }
    if (strcmp(method_name, "_physics_process") == 0 || strcmp(method_name, "physics_process") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666666666666666;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_physics_process", delta);
        return;
    }
    if (strcmp(method_name, "_enter_tree") == 0 || strcmp(method_name, "enter_tree") == 0) {
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_enter_tree", 0.0);
        return;
    }
    if (strcmp(method_name, "_exit_tree") == 0 || strcmp(method_name, "exit_tree") == 0) {
        if (is_editor_active() && !is_tool_desc(inst->desc)) return;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_exit_tree", 0.0);
        return;
    }
    if (strcmp(method_name, "_overrides_external_editor") == 0 || strcmp(method_name, "overrides_external_editor") == 0) {
        if (r_ret) *(uint8_t*)r_ret = 0;
        return;
    }
    if (strcmp(method_name, "_build") == 0 || strcmp(method_name, "build") == 0) {
        if (r_ret) *(uint8_t*)r_ret = 1;
        if (inst->desc->call_virtual) inst->desc->call_virtual(inst->crystal_instance, "_build", 0.0);
        return;
    }
    if (strcmp(method_name, "_lookup_code") == 0 || strcmp(method_name, "lookup_code") == 0) {
        bridge_ret_dictionary_lookup_code(r_ret);
        return;
    }
    if (strcmp(method_name, "_complete_code") == 0 || strcmp(method_name, "complete_code") == 0) {
        bridge_ret_dictionary_complete_code(r_ret);
        return;
    }

    if (inst->desc->call_virtual_with_data) {
        inst->desc->call_virtual_with_data(inst->crystal_instance, method_name, (const void**)p_args, (void*)r_ret);
    }
}

/**
 * Dynamic property setter called by Godot's inspector, animations, or scripts.
 */
inline GDExtensionBool generic_class_set(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionConstVariantPtr p_value) {
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
 */
inline GDExtensionBool generic_class_get(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret) {
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
 * Dynamic method dispatcher for GodotChannel helper objects.
 */
inline void channel_method_call(
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
