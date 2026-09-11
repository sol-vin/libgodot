#pragma once

#include "common.hpp"
#include "gdextension_api.hpp"

/**
 * ==============================================================================
 * LibGodot - In-Editor XML Help Documentation Subsystem
 * ==============================================================================
 */

static std::vector<std::string> g_editor_doc_xmls;
static std::unordered_set<std::string> g_loaded_editor_doc_xmls;

inline void bridge_load_editor_help_xml(const char *xml) {
    if (!xml) return;
    std::string s(xml);
    if (g_loaded_editor_doc_xmls.find(s) != g_loaded_editor_doc_xmls.end()) {
        return;
    }
    g_loaded_editor_doc_xmls.insert(s);
    g_editor_doc_xmls.push_back(s);
    if (g_current_init_level >= GDEXTENSION_INITIALIZATION_EDITOR && gd_editor_help_load_xml_from_utf8_chars) {
        gd_editor_help_load_xml_from_utf8_chars(xml);
    }
}

inline void bridge_flush_editor_help() {
    if (!gd_editor_help_load_xml_from_utf8_chars) return;
    if (g_editor_doc_xmls.empty()) return;
    for (const auto &xml : g_editor_doc_xmls) {
        gd_editor_help_load_xml_from_utf8_chars(xml.c_str());
    }
    char log_buf[128];
    snprintf(log_buf, sizeof(log_buf), "[CrystalBridge] Flushed %zu EditorHelp XML documentation document(s) into Godot", g_editor_doc_xmls.size());
    godot_log_print(log_buf);
}
