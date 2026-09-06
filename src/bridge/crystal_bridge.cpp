#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <vector>
#include <string>

#include "gdextension_interface.h"

#define GDE_EXPORT __declspec(dllexport)

// Cached function pointers from Godot
static GDExtensionInterfaceGetProcAddress gd_get_proc_address = nullptr;
static GDExtensionInterfaceStringNameNewWithUtf8Chars gd_string_name_new_with_utf8_chars = nullptr;
static GDExtensionInterfaceStringNewWithUtf8Chars gd_string_new_with_utf8_chars = nullptr;
static GDExtensionInterfaceVariantDestroy gd_variant_destroy = nullptr;
static GDExtensionInterfaceClassdbConstructObject gd_classdb_construct_object = nullptr;
static GDExtensionInterfaceObjectSetInstance gd_object_set_instance = nullptr;
static GDExtensionInterfaceClassdbRegisterExtensionClass6 gd_classdb_register_extension_class6 = nullptr;
static GDExtensionInterfaceClassdbUnregisterExtensionClass gd_classdb_unregister_extension_class = nullptr;
static GDExtensionInterfaceClassdbRegisterExtensionClassProperty gd_classdb_register_extension_class_property = nullptr;
static GDExtensionInterfaceClassdbRegisterExtensionClassSignal gd_classdb_register_extension_class_signal = nullptr;
static GDExtensionInterfaceClassdbRegisterExtensionClassMethod gd_classdb_register_extension_class_method = nullptr;
static GDExtensionInterfaceClassdbGetMethodBind gd_classdb_get_method_bind = nullptr;
static GDExtensionInterfaceObjectMethodBindPtrcall gd_object_method_bind_ptrcall = nullptr;
static GDExtensionInterfaceObjectMethodBindCall gd_object_method_bind_call = nullptr;
static GDExtensionsInterfaceEditorHelpLoadXmlFromUtf8Chars gd_editor_help_load_xml_from_utf8_chars = nullptr;
static GDExtensionInterfaceGlobalGetSingleton gd_global_get_singleton = nullptr;
static GDExtensionInterfaceGetVariantFromTypeConstructor gd_get_variant_from_type_constructor = nullptr;
static GDExtensionInterfaceGetVariantToTypeConstructor gd_get_variant_to_type_constructor = nullptr;

// Godot engine logging interfaces
static GDExtensionInterfacePrintError gd_print_error = nullptr;
static GDExtensionInterfacePrintErrorWithMessage gd_print_error_with_message = nullptr;
static GDExtensionInterfacePrintWarning gd_print_warning = nullptr;
static GDExtensionInterfacePrintWarningWithMessage gd_print_warning_with_message = nullptr;
static GDExtensionInterfaceVariantGetPtrUtilityFunction gd_variant_get_ptr_utility_function = nullptr;
static GDExtensionInterfaceVariantGetPtrDestructor gd_variant_get_ptr_destructor = nullptr;

static GDExtensionPtrUtilityFunction gd_util_print = nullptr;
static GDExtensionPtrUtilityFunction gd_util_printerr = nullptr;
static GDExtensionVariantFromTypeConstructorFunc gd_variant_from_string = nullptr;
static GDExtensionPtrDestructor gd_string_destroy = nullptr;
static GDExtensionPtrDestructor gd_string_name_destroy = nullptr;

static GDExtensionClassLibraryPtr g_library = nullptr;

// Variant conversion helpers
static void bridge_type_from_variant(int variant_type, void *dst, const void *variant) {
    if (gd_get_variant_to_type_constructor && variant && dst) {
        GDExtensionTypeFromVariantConstructorFunc conv = gd_get_variant_to_type_constructor((GDExtensionVariantType)variant_type);
        if (conv) {
            conv(dst, (GDExtensionVariantPtr)variant);
        }
    }
}

static void bridge_variant_from_type(int variant_type, void *variant, const void *src) {
    if (gd_get_variant_from_type_constructor && variant && src) {
        GDExtensionVariantFromTypeConstructorFunc conv = gd_get_variant_from_type_constructor((GDExtensionVariantType)variant_type);
        if (conv) {
            conv(variant, (GDExtensionTypePtr)src);
        }
    }
}

// Method binds for process management
static GDExtensionMethodBindPtr mb_set_physics_process = nullptr;
static GDExtensionMethodBindPtr mb_set_process = nullptr;

// Logging helpers
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

static void godot_log_error(const char *desc, const char *msg, const char *func, const char *file, int line) {
    fprintf(stderr, "[ERROR] %s: %s (%s:%d in %s)\n", desc, msg ? msg : "", file, line, func);
    fflush(stderr);

    if (gd_print_error_with_message && msg) {
        gd_print_error_with_message(desc, msg, func, file, line, 1);
    } else if (gd_print_error) {
        gd_print_error(desc, func, file, line, 1);
    }
}

static void godot_log_warning(const char *desc, const char *msg, const char *func, const char *file, int line) {
    fprintf(stderr, "[WARNING] %s: %s (%s:%d in %s)\n", desc, msg ? msg : "", file, line, func);
    fflush(stderr);

    if (gd_print_warning_with_message && msg) {
        gd_print_warning_with_message(desc, msg, func, file, line, 1);
    } else if (gd_print_warning) {
        gd_print_warning(desc, func, file, line, 1);
    }
}

// Helpers
static void* make_string_name(const char *name) {
    void *sn = malloc(sizeof(void*));
    gd_string_name_new_with_utf8_chars(sn, name);
    return sn;
}

static void free_string_name(void *sn) {
    if (!sn) return;
    if (gd_string_name_destroy) {
        gd_string_name_destroy(sn);
    }
    free(sn);
}

static void* make_string(const char *str) {
    void *s = malloc(sizeof(void*));
    gd_string_new_with_utf8_chars(s, str ? str : "");
    return s;
}

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

struct CrystalPropertyDesc {
    const char *name;
    const char *type_name;
    int variant_type;
    uint32_t hint;
    const char *hint_string;
    uint32_t usage;
};

struct CrystalSignalArgDesc {
    const char *name;
    int variant_type;
};

struct CrystalSignalDesc {
    const char *name;
    int arg_count;
    CrystalSignalArgDesc args[8];
};

struct CrystalClassDesc {
    const char *name;
    const char *parent_name;
    const char *icon_path;
    bool is_virtual;
    bool is_abstract;
    bool is_tool;
    bool has_ready;
    bool has_process;
    bool has_physics_process;

    // Crystal Host Callbacks
    void* (*create_instance)(const CrystalClassDesc *desc, void *godot_object);
    void (*free_instance)(void *crystal_instance);
    void (*call_virtual)(void *crystal_instance, const char *method_name, float delta);
    void (*set_property)(void *crystal_instance, const char *prop_name, const void *val_ptr);
    void (*get_property)(void *crystal_instance, const char *prop_name, void *ret_ptr);

    int property_count;
    CrystalPropertyDesc properties[128];

    int signal_count;
    CrystalSignalDesc signals[16];

    const CrystalClassDesc *parent_desc;
};

// Generic Instance Wrapper linking Godot Object to Crystal Instance
struct GenericExtensionInstance {
    GDExtensionObjectPtr godot_object;
    void *crystal_instance;
    const CrystalClassDesc *desc;
};

// Global list of registered classes for unregistration on shutdown
#define MAX_REGISTERED_CLASSES 128
static CrystalClassDesc g_registered_classes[MAX_REGISTERED_CLASSES];
static int g_registered_class_count = 0;

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

// Generic ClassDB Callbacks
static GDExtensionObjectPtr generic_class_create(void *p_class_userdata, GDExtensionBool p_notify_postinitialize) {
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

    bool allow_processing = !is_editor_active() || desc->is_tool;

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

static GDExtensionClassInstancePtr generic_class_recreate(void *p_class_userdata, GDExtensionObjectPtr p_object) {
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

    bool allow_processing = !is_editor_active() || desc->is_tool;

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

static void generic_class_free(void *p_class_userdata, GDExtensionClassInstancePtr p_instance) {
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (inst) {
        if (inst->desc && inst->desc->free_instance && inst->crystal_instance) {
            inst->desc->free_instance(inst->crystal_instance);
        }
        delete inst;
    }
}

static void generic_virtual_physics_process(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !inst->desc->is_tool) return;
    double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666;
    inst->desc->call_virtual(inst->crystal_instance, "_physics_process", (float)delta);
}

static void generic_virtual_process(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !inst->desc->is_tool) return;
    double delta = (p_args && p_args[0]) ? *(const double*)p_args[0] : 0.016666;
    inst->desc->call_virtual(inst->crystal_instance, "_process", (float)delta);
}

static void generic_virtual_ready(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret) {
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->call_virtual || !inst->crystal_instance) return;
    if (is_editor_active() && !inst->desc->is_tool) return;
    inst->desc->call_virtual(inst->crystal_instance, "_ready", 0.0f);
}

static GDExtensionClassCallVirtual generic_class_get_virtual(void *p_class_userdata, GDExtensionConstStringNamePtr p_name, uint32_t p_hash) {
    const CrystalClassDesc *desc = (const CrystalClassDesc*)p_class_userdata;
    if (!desc) return nullptr;

    static void *sn_pp = nullptr;
    static void *sn_p = nullptr;
    static void *sn_r = nullptr;
    if (!sn_pp) {
        sn_pp = make_string_name("_physics_process");
        sn_p = make_string_name("_process");
        sn_r = make_string_name("_ready");
    }

    if (desc->has_physics_process && memcmp(p_name, sn_pp, sizeof(void*)) == 0) {
        return generic_virtual_physics_process;
    }
    if (desc->has_process && memcmp(p_name, sn_p, sizeof(void*)) == 0) {
        return generic_virtual_process;
    }
    if (desc->has_ready && memcmp(p_name, sn_r, sizeof(void*)) == 0) {
        return generic_virtual_ready;
    }

    return nullptr;
}

static GDExtensionBool generic_class_set(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionConstVariantPtr p_value) {
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->set_property || !inst->crystal_instance) return 0;

    const CrystalClassDesc *curr = inst->desc;
    while (curr) {
        for (int i = 0; i < curr->property_count; i++) {
            void *prop_sn = make_string_name(curr->properties[i].name);
            bool match = (memcmp(p_name, prop_sn, sizeof(void*)) == 0);
            free_string_name(prop_sn);
            if (match) {
                alignas(void*) char raw_buf[64] = {};
                bridge_type_from_variant(curr->properties[i].variant_type, raw_buf, p_value);
                inst->desc->set_property(inst->crystal_instance, curr->properties[i].name, raw_buf);
                return 1;
            }
        }
        curr = curr->parent_desc;
    }
    return 0;
}

static GDExtensionBool generic_class_get(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret) {
    GenericExtensionInstance *inst = (GenericExtensionInstance*)p_instance;
    if (!inst || !inst->desc || !inst->desc->get_property || !inst->crystal_instance) return 0;

    const CrystalClassDesc *curr = inst->desc;
    while (curr) {
        for (int i = 0; i < curr->property_count; i++) {
            void *prop_sn = make_string_name(curr->properties[i].name);
            bool match = (memcmp(p_name, prop_sn, sizeof(void*)) == 0);
            free_string_name(prop_sn);
            if (match) {
                alignas(void*) char raw_buf[64] = {};
                inst->desc->get_property(inst->crystal_instance, curr->properties[i].name, raw_buf);
                bridge_variant_from_type(curr->properties[i].variant_type, r_ret, raw_buf);
                return 1;
            }
        }
        curr = curr->parent_desc;
    }
    return 0;
}

// Function to register a class from Crystal
static int bridge_register_class(const CrystalClassDesc *p_desc) {
    if (!p_desc || !g_library) return 0;
    if (g_registered_class_count >= MAX_REGISTERED_CLASSES) {
        godot_log_error("Max registered classes exceeded", nullptr, "bridge_register_class", __FILE__, __LINE__);
        return 0;
    }

    // Save copy in static storage
    CrystalClassDesc *desc = &g_registered_classes[g_registered_class_count++];
    memcpy(desc, p_desc, sizeof(CrystalClassDesc));

    // Link parent_desc if parent is also a registered Crystal class
    desc->parent_desc = nullptr;
    for (int i = 0; i < g_registered_class_count - 1; i++) {
        if (strcmp(g_registered_classes[i].name, desc->parent_name) == 0) {
            desc->parent_desc = &g_registered_classes[i];
            break;
        }
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
    cinfo.get_virtual_func = generic_class_get_virtual;
    cinfo.class_userdata = (void*)desc;

    gd_classdb_register_extension_class6(g_library, class_sn, parent_sn, &cinfo);

    if (cinfo.icon_path) {
        free_string((void*)cinfo.icon_path);
    }

    // Register properties
    for (int i = 0; i < desc->property_count; i++) {
        const CrystalPropertyDesc &p = desc->properties[i];
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

    // Register signals
    for (int i = 0; i < desc->signal_count; i++) {
        const CrystalSignalDesc &s = desc->signals[i];
        void *sig_sn = make_string_name(s.name);
        GDExtensionPropertyInfo sargs[8] = {};
        for (int a = 0; a < s.arg_count && a < 8; a++) {
            sargs[a].type = (GDExtensionVariantType)s.args[a].variant_type;
            sargs[a].name = make_string_name(s.args[a].name);
            sargs[a].class_name = make_string_name("");
            sargs[a].hint = 0;
            sargs[a].hint_string = make_string("");
            sargs[a].usage = 6;
        }

        gd_classdb_register_extension_class_signal(g_library, class_sn, sig_sn, sargs, s.arg_count);

        free_string_name(sig_sn);
        for (int a = 0; a < s.arg_count && a < 8; a++) {
            free_string_name(sargs[a].name); free_string_name(sargs[a].class_name); free_string(sargs[a].hint_string);
        }
    }

    char log_buf[128];
    snprintf(log_buf, sizeof(log_buf), "  [ClassDB] Registered %s < %s", desc->name, desc->parent_name);
    godot_log_print(log_buf);

    free_string_name(class_sn);
    free_string_name(parent_sn);
    return 1;
}

// Method bind lookup helper for Crystal
static GDExtensionMethodBindPtr bridge_get_method_bind(const char *class_name, const char *method_name, int64_t hash) {
    if (!gd_classdb_get_method_bind) return nullptr;
    void *c_sn = make_string_name(class_name);
    void *m_sn = make_string_name(method_name);
    GDExtensionMethodBindPtr mb = gd_classdb_get_method_bind(c_sn, m_sn, hash);
    free_string_name(c_sn); free_string_name(m_sn);
    return mb;
}

static void bridge_method_bind_ptrcall(GDExtensionMethodBindPtr method_bind, GDExtensionObjectPtr instance, const void **args, void *ret) {
    if (gd_object_method_bind_ptrcall && method_bind && instance) {
        gd_object_method_bind_ptrcall(method_bind, instance, args, ret);
    }
}

static void bridge_method_bind_call(GDExtensionMethodBindPtr method_bind, GDExtensionObjectPtr instance, const GDExtensionConstVariantPtr *args, GDExtensionInt arg_count, GDExtensionVariantPtr ret, GDExtensionCallError *error) {
    if (gd_object_method_bind_call && method_bind && instance) {
        gd_object_method_bind_call(method_bind, instance, args, arg_count, ret, error);
    }
}


static std::vector<std::string> g_editor_doc_xmls;

static void bridge_load_editor_help_xml(const char *xml) {
    if (!xml) return;
    g_editor_doc_xmls.push_back(std::string(xml));
}

static void bridge_flush_editor_help() {
    if (!gd_editor_help_load_xml_from_utf8_chars) return;
    for (const auto &xml : g_editor_doc_xmls) {
        gd_editor_help_load_xml_from_utf8_chars(xml.c_str());
    }
}

static GDExtensionObjectPtr bridge_get_singleton(const char *name) {
    if (!gd_global_get_singleton) return nullptr;
    void *sn = make_string_name(name);
    GDExtensionObjectPtr s = gd_global_get_singleton(sn);
    free_string_name(sn);
    return s;
}

struct BridgeSignalArg {
    int type;
    const void *data;
};

static GDExtensionMethodBindPtr mb_object_emit_signal = nullptr;
static GDExtensionVariantFromTypeConstructorFunc gd_variant_from_string_name = nullptr;

static void bridge_object_emit_signal(GDExtensionObjectPtr instance, const char *signal_name, const BridgeSignalArg *args, int arg_count) {
    if (!instance || !signal_name || !gd_classdb_get_method_bind || !gd_object_method_bind_call) return;
    if (!mb_object_emit_signal) {
        void *sn_obj = make_string_name("Object");
        void *sn_emit = make_string_name("emit_signal");
        mb_object_emit_signal = gd_classdb_get_method_bind(sn_obj, sn_emit, 4047867050ULL);
        free_string_name(sn_obj); free_string_name(sn_emit);
    }
    if (!mb_object_emit_signal) return;

    if (!gd_variant_from_string_name && gd_get_variant_from_type_constructor) {
        gd_variant_from_string_name = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_STRING_NAME);
    }

    void *sn = make_string_name(signal_name);
    alignas(void*) char var_sig_name[24];
    memset(var_sig_name, 0, sizeof(var_sig_name));
    if (gd_variant_from_string_name) {
        gd_variant_from_string_name(var_sig_name, sn);
    }

    alignas(void*) char var_args[16][24];
    const void *call_args[17];
    call_args[0] = var_sig_name;

    int actual_count = (arg_count < 16) ? arg_count : 16;
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
            }
        }
        call_args[i + 1] = var_args[i];
    }

    alignas(void*) char var_ret[24];
    memset(var_ret, 0, sizeof(var_ret));
    GDExtensionCallError call_err;
    gd_object_method_bind_call(mb_object_emit_signal, instance, (const GDExtensionConstVariantPtr*)call_args, actual_count + 1, var_ret, &call_err);

    // Cleanup
    if (gd_variant_destroy) {
        gd_variant_destroy(var_ret);
        for (int i = 0; i < actual_count; i++) {
            gd_variant_destroy(var_args[i]);
        }
        gd_variant_destroy(var_sig_name);
    }
    free_string_name(sn);
}

static GDExtensionMethodBindPtr mb_node_find_child = nullptr;
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
static GDExtensionObjectPtr bridge_node_get_node(GDExtensionObjectPtr node, const char *path) {
    if (!node || !path || !gd_classdb_get_method_bind || !gd_object_method_bind_ptrcall) return nullptr;
    if (!mb_node_get_node) {
        void *sn_node = make_string_name("Node");
        void *sn_gn = make_string_name("get_node_or_null");
        mb_node_get_node = gd_classdb_get_method_bind(sn_node, sn_gn, 2734337346ULL);
        free_string_name(sn_node); free_string_name(sn_gn);
    }
    if (!mb_node_get_node) return nullptr;

    void *gd_str = make_string(path);
    alignas(void*) char var_str[24];
    memset(var_str, 0, sizeof(var_str));
    if (gd_variant_from_string) gd_variant_from_string(var_str, gd_str);

    alignas(void*) char np_buf[8];
    memset(np_buf, 0, sizeof(np_buf));
    bridge_type_from_variant(GDEXTENSION_VARIANT_TYPE_NODE_PATH, np_buf, var_str);

    const void *args[1] = { np_buf };
    GDExtensionObjectPtr ret_node = nullptr;
    gd_object_method_bind_ptrcall(mb_node_get_node, node, args, &ret_node);

    if (gd_variant_get_ptr_destructor) {
        GDExtensionPtrDestructor np_des = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_NODE_PATH);
        if (np_des) np_des(np_buf);
    }
    if (gd_variant_destroy) gd_variant_destroy(var_str);
    free_string(gd_str);

    return ret_node;
}

static GDExtensionMethodBindPtr mb_range_set_value = nullptr;
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
static void bridge_node_rpc_config(GDExtensionObjectPtr node, const char *method, int rpc_mode, int transfer_mode, bool call_local, int channel) {
    if (!node || !method || !gd_classdb_get_method_bind) return;
    if (!mb_node_rpc_config) {
        void *sn_node = make_string_name("Node");
        void *sn_rc = make_string_name("rpc_config");
        mb_node_rpc_config = gd_classdb_get_method_bind(sn_node, sn_rc, 3776071444ULL);
        free_string_name(sn_node); free_string_name(sn_rc);
    }
    if (!mb_node_rpc_config) return;

    void *m_sn = make_string_name(method);
    free_string_name(m_sn);
}

// Exported BridgeAPI table provided to Crystal
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
    GDExtensionObjectPtr (*node_find_child)(GDExtensionObjectPtr node, const char *pattern, bool recursive, bool owned);
    GDExtensionObjectPtr (*node_get_node)(GDExtensionObjectPtr node, const char *path);
    void (*range_set_value)(GDExtensionObjectPtr range_obj, double value);
    void (*node_rpc_config)(GDExtensionObjectPtr node, const char *method, int rpc_mode, int transfer_mode, bool call_local, int channel);
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
    bridge_node_find_child,
    bridge_node_get_node,
    bridge_range_set_value,
    bridge_node_rpc_config
};

// C API exports
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
    GDE_EXPORT const BridgeAPI* crystal_bridge_get_api() {
        return &g_bridge_api;
    }
}

static uint64_t get_file_mtime(const char *path) {
    WIN32_FILE_ATTRIBUTE_DATA data;
    if (GetFileAttributesExA(path, GetFileExInfoStandard, &data)) {
        return ((uint64_t)data.ftLastWriteTime.dwHighDateTime << 32) | data.ftLastWriteTime.dwLowDateTime;
    }
    return 0;
}

static HMODULE g_hGame = NULL;

static void unload_crystal_game_library() {
    // Note: Do not call FreeLibrary(g_hGame). Crystal's Boehm GC and runtime
    // remain resident across hot-reloads; subsequent builds are loaded via
    // distinct shadow DLL copies (game_loaded_<pid>_<count>.dll).
    g_hGame = NULL;
}

static void cleanup_old_shadow_dlls(const char *dir) {
    if (!dir || dir[0] == '\0') return;
    char search_pattern[MAX_PATH];
    snprintf(search_pattern, sizeof(search_pattern), "%s\\game_loaded_*.dll", dir);

    WIN32_FIND_DATAA fd;
    HANDLE hFind = FindFirstFileA(search_pattern, &fd);
    if (hFind != INVALID_HANDLE_VALUE) {
        do {
            char file_path[MAX_PATH];
            snprintf(file_path, sizeof(file_path), "%s\\%s", dir, fd.cFileName);
            // DeleteFileA automatically fails silently if the DLL is currently locked by a running process
            DeleteFileA(file_path);
        } while (FindNextFileA(hFind, &fd));
        FindClose(hFind);
    }
}

// Loads game.dll compiled from Crystal and invokes crystal_godot_init(&g_bridge_api)
static void load_crystal_game_library() {
    unload_crystal_game_library();

    char bridge_dir[MAX_PATH] = {0};
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

    // Clean up stale shadow copies from previous editor sessions
    cleanup_old_shadow_dlls(bridge_dir);

    char candidate_path[MAX_PATH] = {0};
    char shadow_path[MAX_PATH] = {0};

    // Use GetTickCount64() + verification loop so every reload creates a guaranteed unique filename
    uint64_t ts = GetTickCount64();

    // 1. Primary candidate: game.dll sitting directly next to crystal_bridge.dll
    if (bridge_dir[0] != '\0') {
        snprintf(candidate_path, sizeof(candidate_path), "%s\\game.dll", bridge_dir);
        do {
            snprintf(shadow_path, sizeof(shadow_path), "%s\\game_loaded_%lu_%llu.dll", bridge_dir, (unsigned long)GetCurrentProcessId(), (unsigned long long)ts);
            ts++;
        } while (GetFileAttributesA(shadow_path) != INVALID_FILE_ATTRIBUTES);
        SetDllDirectoryA(bridge_dir);
    }

    // Preload runtime dependencies if present
    const char *runtime_deps[] = { "gc.dll", "iconv-2.dll", "pcre2-8.dll" };
    for (int r = 0; r < 3; r++) {
        char dep_path[MAX_PATH];
        if (bridge_dir[0] != '\0') {
            snprintf(dep_path, sizeof(dep_path), "%s\\%s", bridge_dir, runtime_deps[r]);
            LoadLibraryA(dep_path);
        }
        LoadLibraryA(runtime_deps[r]);
    }

    HMODULE hGame = NULL;

    // Check if the co-located game.dll exists
    if (candidate_path[0] != '\0' && GetFileAttributesA(candidate_path) != INVALID_FILE_ATTRIBUTES) {
        if (!CopyFileA(candidate_path, shadow_path, FALSE)) {
            DWORD err = GetLastError();
            char err_buf[256];
            snprintf(err_buf, sizeof(err_buf), "[CrystalBridge] CopyFile failed from %s to %s (error code %lu)", candidate_path, shadow_path, err);
            godot_log_error(err_buf, nullptr, "load_crystal_game_library", __FILE__, __LINE__);
        }
        hGame = LoadLibraryExA(shadow_path, NULL, LOAD_WITH_ALTERED_SEARCH_PATH);
        if (!hGame) {
            hGame = LoadLibraryA(shadow_path);
        }
        if (hGame) {
            char buf[512];
            snprintf(buf, sizeof(buf), "[CrystalBridge] Loaded game library from %s via shadow copy %s", candidate_path, shadow_path);
            godot_log_print(buf);
            g_hGame = hGame;
        } else {
            DWORD err = GetLastError();
            char err_buf[256];
            snprintf(err_buf, sizeof(err_buf), "[CrystalBridge] Failed to LoadLibrary %s (error code %lu)", shadow_path, err);
            godot_log_warning(err_buf, nullptr, "load_crystal_game_library", __FILE__, __LINE__);
        }
    }

    // Fallback search paths if co-located wasn't found
    if (!hGame) {
        const char *fallbacks[] = { "demo/bin/game.dll", "bin/game.dll", "game.dll" };
        for (int i = 0; i < 3; i++) {
            if (GetFileAttributesA(fallbacks[i]) == INVALID_FILE_ATTRIBUTES) continue;
            do {
                snprintf(shadow_path, sizeof(shadow_path), "%s_loaded_%lu_%llu.dll", fallbacks[i], (unsigned long)GetCurrentProcessId(), (unsigned long long)ts);
                ts++;
            } while (GetFileAttributesA(shadow_path) != INVALID_FILE_ATTRIBUTES);
            if (!CopyFileA(fallbacks[i], shadow_path, FALSE)) {
                DWORD err = GetLastError();
                char err_buf[256];
                snprintf(err_buf, sizeof(err_buf), "[CrystalBridge] CopyFile failed from %s to %s (error code %lu)", fallbacks[i], shadow_path, err);
                godot_log_error(err_buf, nullptr, "load_crystal_game_library", __FILE__, __LINE__);
            }
            hGame = LoadLibraryExA(shadow_path, NULL, LOAD_WITH_ALTERED_SEARCH_PATH);
            if (!hGame) {
                hGame = LoadLibraryA(shadow_path);
            }
            if (hGame) {
                char buf[512];
                snprintf(buf, sizeof(buf), "[CrystalBridge] Loaded fallback game library from %s via %s", fallbacks[i], shadow_path);
                godot_log_print(buf);
                g_hGame = hGame;
                break;
            }
        }
    }

    if (!hGame) {
        godot_log_print("[CrystalBridge] No game.dll found yet. Click 'Build Crystal' in the editor to compile your project.");
        return;
    }

    typedef void (*CrystalInitFn)(const BridgeAPI *api);
    CrystalInitFn init_fn = (CrystalInitFn)GetProcAddress(hGame, "crystal_godot_init");
    if (!init_fn) {
        godot_log_error("Failed to find 'crystal_godot_init' in game.dll", nullptr, "load_crystal_game_library", __FILE__, __LINE__);
        return;
    }

    init_fn(&g_bridge_api);
}

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
    }
    if (gd_get_variant_from_type_constructor) {
        gd_variant_from_string = gd_get_variant_from_type_constructor(GDEXTENSION_VARIANT_TYPE_STRING);
    }
}

// Lifecycle callbacks
static void initialize_crystal_module(void *p_userdata, GDExtensionInitializationLevel p_level) {
    if (p_level == GDEXTENSION_INITIALIZATION_SCENE) {
        g_registered_class_count = 0;
        init_common_method_binds();
        godot_log_print("[CrystalBridge] Initializing generic Crystal GDExtension host...");
        load_crystal_game_library();
    } else if (p_level == GDEXTENSION_INITIALIZATION_EDITOR) {
        bridge_flush_editor_help();
    }
}

static void deinitialize_crystal_module(void *p_userdata, GDExtensionInitializationLevel p_level) {
    if (p_level == GDEXTENSION_INITIALIZATION_SCENE) {
        godot_log_print("[CrystalBridge] Unregistering Crystal classes...");
        if (gd_classdb_unregister_extension_class) {
            for (int i = g_registered_class_count - 1; i >= 0; i--) {
                void *sn = make_string_name(g_registered_classes[i].name);
                gd_classdb_unregister_extension_class(g_library, sn);
                free_string_name(sn);
            }
        }
        g_registered_class_count = 0;
        g_editor_doc_xmls.clear();
        unload_crystal_game_library();
        godot_log_print("[CrystalBridge] Crystal module deinitialized.");
    }
}

// GDExtension Entry Point
extern "C" GDE_EXPORT GDExtensionBool crystal_library_init(
    GDExtensionInterfaceGetProcAddress p_get_proc_address,
    GDExtensionClassLibraryPtr p_library,
    GDExtensionInitialization *r_initialization
) {
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
    gd_classdb_register_extension_class_signal = (GDExtensionInterfaceClassdbRegisterExtensionClassSignal)p_get_proc_address("classdb_register_extension_class_signal");
    gd_classdb_register_extension_class_method = (GDExtensionInterfaceClassdbRegisterExtensionClassMethod)p_get_proc_address("classdb_register_extension_class_method");
    gd_classdb_get_method_bind = (GDExtensionInterfaceClassdbGetMethodBind)p_get_proc_address("classdb_get_method_bind");
    gd_object_method_bind_ptrcall = (GDExtensionInterfaceObjectMethodBindPtrcall)p_get_proc_address("object_method_bind_ptrcall");
    gd_object_method_bind_call = (GDExtensionInterfaceObjectMethodBindCall)p_get_proc_address("object_method_bind_call");
    gd_editor_help_load_xml_from_utf8_chars = (GDExtensionsInterfaceEditorHelpLoadXmlFromUtf8Chars)p_get_proc_address("editor_help_load_xml_from_utf8_chars");
    gd_global_get_singleton = (GDExtensionInterfaceGlobalGetSingleton)p_get_proc_address("global_get_singleton");
    gd_get_variant_from_type_constructor = (GDExtensionInterfaceGetVariantFromTypeConstructor)p_get_proc_address("get_variant_from_type_constructor");
    gd_get_variant_to_type_constructor = (GDExtensionInterfaceGetVariantToTypeConstructor)p_get_proc_address("get_variant_to_type_constructor");

    // Logging & error functions
    gd_print_error = (GDExtensionInterfacePrintError)p_get_proc_address("print_error");
    gd_print_error_with_message = (GDExtensionInterfacePrintErrorWithMessage)p_get_proc_address("print_error_with_message");
    gd_print_warning = (GDExtensionInterfacePrintWarning)p_get_proc_address("print_warning");
    gd_print_warning_with_message = (GDExtensionInterfacePrintWarningWithMessage)p_get_proc_address("print_warning_with_message");
    gd_variant_get_ptr_utility_function = (GDExtensionInterfaceVariantGetPtrUtilityFunction)p_get_proc_address("variant_get_ptr_utility_function");
    gd_variant_get_ptr_destructor = (GDExtensionInterfaceVariantGetPtrDestructor)p_get_proc_address("variant_get_ptr_destructor");

    if (gd_variant_get_ptr_destructor) {
        gd_string_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING);
        gd_string_name_destroy = gd_variant_get_ptr_destructor(GDEXTENSION_VARIANT_TYPE_STRING_NAME);
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
    r_initialization->userdata = nullptr;

    return 1;
}
