# Annotation for exported properties in Godot Inspector
annotation Export
end

# Annotation to mark Godot classes internally
annotation GodotClass
end

module Godot
  struct PropertyInfo
    getter name : String
    getter type_name : String
    getter variant_type : Int32
    getter hint : UInt32
    getter hint_string : String
    getter usage : UInt32

    def initialize(@name : String, @type_name : String, @variant_type : Int32, @hint : UInt32 = 0_u32, @hint_string : String = "", @usage : UInt32 = 6_u32)
    end
  end

  struct SignalArgInfo
    getter name : String
    getter variant_type : Int32

    def initialize(@name : String, @variant_type : Int32 = 0)
    end
  end

  struct SignalInfo
    getter name : String
    getter args : Array(SignalArgInfo)

    def initialize(@name : String, @args : Array(SignalArgInfo) = [] of SignalArgInfo)
    end
  end

  # Registry to keep track of all user-defined nodes and classes
  class ClassRegistry
    class Entry
      getter class_name : String
      getter parent_name : String
      getter create_proc : (Void* -> Object)
      property has_ready : Bool
      property has_process : Bool
      property has_physics_process : Bool
      property properties : Array(PropertyInfo)
      property signals : Array(SignalInfo)

      def initialize(
        @class_name : String,
        @parent_name : String,
        @create_proc : (Void* -> Object),
        @has_ready : Bool = false,
        @has_process : Bool = false,
        @has_physics_process : Bool = false,
        @properties : Array(PropertyInfo) = [] of PropertyInfo,
        @signals : Array(SignalInfo) = [] of SignalInfo
      )
      end
    end

    class_getter entries = Array(Entry).new

    def self.register(entry : Entry)
      if parent = find(entry.parent_name)
        entry.has_ready ||= parent.has_ready
        entry.has_process ||= parent.has_process
        entry.has_physics_process ||= parent.has_physics_process
      end
      @@entries << entry
    end

    def self.find(name : String) : Entry?
      @@entries.find { |e| e.class_name == name }
    end
  end
end

# The primary `node` macro:
# Usage:
#   node MyNode do
#     # defaults to Godot::Node
#   end
#
#   node Player < CharacterBody3D do
#     # inherits Godot::CharacterBody3D
#   end
macro node(decl, &block)
  {% if decl.is_a?(Call) && decl.name == "<" %}
    {% class_name = decl.receiver %}
    {% raw_parent = decl.args[0] %}
    {% if raw_parent.stringify.includes?("::") %}
      {% parent_name = raw_parent %}
      {% base_godot_name = raw_parent.stringify.split("::").last %}
    {% elsif Godot.has_constant?(raw_parent.stringify) %}
      {% parent_name = "Godot::#{raw_parent}".id %}
      {% base_godot_name = raw_parent.stringify %}
    {% else %}
      {% parent_name = raw_parent %}
      {% base_godot_name = raw_parent.stringify %}
    {% end %}
  {% else %}
    {% class_name = decl %}
    {% parent_name = "Godot::Node".id %}
    {% base_godot_name = "Node" %}
  {% end %}

  {%
    has_ready = false
    has_process = false
    has_physics_process = false
    props = [] of Nil
    sigs = [] of Nil
    methods_doc = [] of Nil
    class_doc = ""
    stmts = block.body.is_a?(Expressions) ? block.body.expressions : [block.body]
    last_anno = nil

    # Extract source file text to harvest doc comments
    src_content = read_file(__FILE__)
    src_lines = src_content.split("\n")
    comment_accum = ""
    in_target_node = false
    extracted_prop_docs = {} of StringLiteral => StringLiteral
    extracted_sig_docs = {} of StringLiteral => StringLiteral
  %}

  {% for s_line in src_lines %}
    {% s_stripped = s_line.strip %}
    {% if s_stripped.starts_with?("#") %}
      {% s_text = s_stripped.gsub(/^#+\s*/, "") %}
      {% comment_accum = comment_accum.empty? ? s_text : comment_accum + " " + s_text %}
    {% elsif s_stripped.includes?("node " + class_name.stringify) %}
      {% class_doc = comment_accum %}
      {% comment_accum = "" %}
      {% in_target_node = true %}
    {% elsif in_target_node && s_stripped.starts_with?("property ") %}
      {% p_var = s_stripped.gsub(/^property\s+/, "").gsub(/\s*[:=].*/, "") %}
      {% extracted_prop_docs[p_var] = comment_accum %}
      {% comment_accum = "" %}
    {% elsif in_target_node && s_stripped.starts_with?("signal ") %}
      {% s_var = s_stripped.gsub(/^signal\s+/, "").gsub(/\s*[(:].*/, "") %}
      {% extracted_sig_docs[s_var] = comment_accum %}
      {% comment_accum = "" %}
    {% elsif in_target_node && s_stripped == "end" %}
      {% in_target_node = false %}
      {% comment_accum = "" %}
    {% elsif !s_stripped.starts_with?("@") && !s_stripped.empty? %}
      {% comment_accum = "" %}
    {% end %}
  {% end %}

  {% for stmt in stmts %}
    {% if stmt.class_name.id == "Annotation" %}
      {% if stmt.name.stringify == "Doc" %}
        {% class_doc = stmt.args[0].stringify %}
      {% else %}
        {% last_anno = stmt %}
      {% end %}
    {% elsif stmt.is_a?(StringLiteral) && class_doc.empty? %}
      {% class_doc = stmt.value %}
    {% elsif stmt.is_a?(Def) %}
      {% if stmt.name.stringify == "_ready" %}
        {% has_ready = true %}
      {% elsif stmt.name.stringify == "_process" %}
        {% has_process = true %}
      {% elsif stmt.name.stringify == "_physics_process" %}
        {% has_physics_process = true %}
      {% else %}
        {% m_doc = stmt.doc_comment || "" %}
        {% methods_doc << {stmt.name, stmt.args, stmt.return_type, m_doc} %}
      {% end %}
      {% last_anno = nil %}
    {% elsif stmt.is_a?(Call) && stmt.name.id == "property" %}
      {%
        p_name_str = stmt.args[0].var.stringify
        p_doc = extracted_prop_docs[p_name_str] || ""
      %}
      {% if last_anno %}
        {% for key, val in last_anno.named_args %}
          {% if key.stringify == "doc" %}
            {% p_doc = val.stringify %}
          {% end %}
        {% end %}
      {% end %}
      {% props << {stmt.args[0], last_anno, p_doc} %}
      {% last_anno = nil %}
    {% elsif stmt.is_a?(Call) && stmt.name.id == "signal" %}
      {%
        s_item = stmt.args[0]
        s_name_str = (s_item.is_a?(Call) ? s_item.name : s_item).stringify
        s_doc = extracted_sig_docs[s_name_str] || ""
      %}
      {% sigs << {stmt.args[0], s_doc} %}
      {% last_anno = nil %}
    {% else %}
      {% last_anno = nil %}
    {% end %}
  {% end %}

  @[GodotClass]
  class {{class_name}} < {{parent_name}}
    def self.godot_class_name : String
      "{{class_name}}"
    end

    def self.godot_parent_class_name : String
      {{base_godot_name}}
    end

    # Macro block containing fields, signals, and methods
    {{ yield }}

    def _godot_call_virtual(method_name : String, delta : Float32) : Void
      case method_name
      {% if has_ready %}
      when "_ready"
        _ready
      {% end %}
      {% if has_process %}
      when "_process"
        _process(delta.to_f64)
      {% end %}
      {% if has_physics_process %}
      when "_physics_process"
        _physics_process(delta.to_f64)
      {% end %}
      else
        super
      end
    end

    def _godot_set_property(prop_name : String, val_ptr : Void*) : Void
      case prop_name
      {% for item in props %}
        {% arg = item[0] %}
        {% var_name = arg.var %}
        {% var_type = arg.type.stringify %}
        when "{{var_name.id}}"
          {% if var_type == "Float32" %}
            self.{{var_name.id}} = val_ptr.as(Float64*).value.to_f32
          {% elsif var_type == "Float64" %}
            self.{{var_name.id}} = val_ptr.as(Float64*).value
          {% elsif var_type == "Int32" %}
            self.{{var_name.id}} = val_ptr.as(Int64*).value.to_i32
          {% elsif var_type == "Int64" %}
            self.{{var_name.id}} = val_ptr.as(Int64*).value
          {% elsif var_type == "Bool" %}
            self.{{var_name.id}} = val_ptr.as(UInt8*).value != 0_u8
          {% end %}
      {% end %}
      else
        super
      end
    end

    def _godot_get_property(prop_name : String, ret_ptr : Void*) : Void
      case prop_name
      {% for item in props %}
        {% arg = item[0] %}
        {% var_name = arg.var %}
        {% var_type = arg.type.stringify %}
        when "{{var_name.id}}"
          {% if var_type == "Float32" || var_type == "Float64" %}
            ret_ptr.as(Float64*).value = self.{{var_name.id}}.to_f64
          {% elsif var_type == "Int32" || var_type == "Int64" %}
            ret_ptr.as(Int64*).value = self.{{var_name.id}}.to_i64
          {% elsif var_type == "Bool" %}
            ret_ptr.as(UInt8*).value = self.{{var_name.id}} ? 1_u8 : 0_u8
          {% end %}
      {% end %}
      else
        super
      end
    end
  end

  # Auto-register this node with full property and signal metadata
  properties_{{class_name}} = Array(::Godot::PropertyInfo).new
  {% for item in props %}
    {% arg = item[0] %}
    {% anno = item[1] %}
    {% var_name = arg.var %}
    {% var_type = arg.type.stringify %}
    {%
      vtype = 0
      if var_type == "Float32" || var_type == "Float64"
        vtype = 3 # FLOAT
      elsif var_type == "Int32" || var_type == "Int64"
        vtype = 2 # INT
      elsif var_type == "Bool"
        vtype = 1 # BOOL
      elsif var_type == "String"
        vtype = 4 # STRING
      elsif var_type == "Vector2"
        vtype = 5 # VECTOR2
      elsif var_type == "Vector3"
        vtype = 9 # VECTOR3
      end

      hint = 0
      hint_str = ""
    %}
    {% if anno %}
      {% for key, val in anno.named_args %}
        {% if key.stringify == "range" %}
          {% hint = 1 %}
          {% b_id = val.begin.id.gsub(/_[a-z0-9]+/, "") %}
          {% e_id = val.end.id.gsub(/_[a-z0-9]+/, "") %}
          {% hint_str = "#{b_id},#{e_id}" %}
        {% elsif key.stringify == "step" %}
          {% s_id = val.id.gsub(/_[a-z0-9]+/, "") %}
          {% hint_str = "#{hint_str.id},#{s_id}" %}
        {% end %}
      {% end %}
    {% end %}
    {%
      # If annotated with @[Export], usage is PROPERTY_USAGE_DEFAULT (STORAGE | EDITOR = 6)
      # Otherwise PROPERTY_USAGE_STORAGE (2) so internal properties don't pollute the Godot inspector
      prop_usage = anno ? 6_u32 : 2_u32
    %}
    properties_{{class_name}} << ::Godot::PropertyInfo.new(
      "{{var_name.id}}",
      "{{var_type.id}}",
      {{vtype}},
      {{hint}}_u32,
      "{{hint_str.id}}",
      {{prop_usage}}
    )
  {% end %}

  signals_{{class_name}} = Array(::Godot::SignalInfo).new
  {% for sig_entry in sigs %}
    {% sig = sig_entry[0] %}
    {% sig_doc = sig_entry[1] %}
    {% if sig.is_a?(Call) %}
      {% sig_name = sig.name %}
      {% sig_args = sig.args %}
    {% else %}
      {% sig_name = sig %}
      {% sig_args = [] of Nil %}
    {% end %}

    args_{{sig_name.id}} = Array(::Godot::SignalArgInfo).new
    {% for a in sig_args %}
      {% if a.is_a?(TypeDeclaration) %}
        {% atype = a.type.stringify %}
        {%
          avtype = 0
          if atype == "Float32" || atype == "Float64"
            avtype = 3
          elsif atype == "Int32" || atype == "Int64"
            avtype = 2
          elsif atype == "Bool"
            avtype = 1
          elsif atype == "String"
            avtype = 4
          end
        %}
        args_{{sig_name.id}} << ::Godot::SignalArgInfo.new("{{a.var.id}}", {{avtype}})
      {% else %}
        args_{{sig_name.id}} << ::Godot::SignalArgInfo.new("{{a.id}}", 0)
      {% end %}
    {% end %}
    signals_{{class_name}} << ::Godot::SignalInfo.new("{{sig_name.id}}", args_{{sig_name.id}})
  {% end %}

  ::Godot::ClassRegistry.register(
    ::Godot::ClassRegistry::Entry.new(
      "{{class_name}}",
      {{base_godot_name}},
      ->(godot_ptr : Void*) {
        inst = {{class_name}}.new
        inst.pointer = godot_ptr
        inst.as(::Godot::Object)
      },
      {{has_ready}},
      {{has_process}},
      {{has_physics_process}},
      properties_{{class_name}},
      signals_{{class_name}}
    )
  )

  # Auto-register Godot Editor documentation XML
  xml_{{class_name}} = String.build do |io|
    io << "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"
    io << "<class name=\"{{class_name.id}}\" inherits=\"" << {{base_godot_name}} << "\">\n"
    io << "  <brief_description>\n"
    {% if class_doc != "" %}
      io << "    " << {{class_doc}} << "\n"
    {% end %}
    io << "  </brief_description>\n"
    io << "  <description>\n"
    {% if class_doc != "" %}
      io << "    " << {{class_doc}} << "\n"
    {% end %}
    io << "  </description>\n"
    io << "  <tutorials>\n  </tutorials>\n"
    io << "  <members>\n"
    {% for item in props %}
      {% arg = item[0] %}
      {% p_doc = item[2] %}
      {% var_type = arg.type.stringify %}
      {%
        gtype = "Variant"
        if var_type == "Float32" || var_type == "Float64"
          gtype = "float"
        elsif var_type == "Int32" || var_type == "Int64"
          gtype = "int"
        elsif var_type == "Bool"
          gtype = "bool"
        elsif var_type == "String"
          gtype = "String"
        elsif var_type == "Vector2"
          gtype = "Vector2"
        elsif var_type == "Vector3"
          gtype = "Vector3"
        elsif var_type == "Color"
          gtype = "Color"
        elsif var_type == "NodePath"
          gtype = "NodePath"
        end
      %}
      io << "    <member name=\"{{arg.var.id}}\" type=\"{{gtype.id}}\" setter=\"\" getter=\"\">"
      {% if p_doc && p_doc != "" %}
        io << {{p_doc}}
      {% end %}
      io << "</member>\n"
    {% end %}
    io << "  </members>\n"
    io << "  <signals>\n"
    {% for sig_entry in sigs %}
      {% s_item = sig_entry[0] %}
      {% s_doc = sig_entry[1] %}
      {% s_name = s_item.is_a?(Call) ? s_item.name : s_item %}
      io << "    <signal name=\"{{s_name.id}}\">\n"
      {% if s_item.is_a?(Call) %}
        {% for s_arg, idx in s_item.args %}
          {% if s_arg.is_a?(TypeDeclaration) %}
            {% s_atype = s_arg.type.stringify %}
            {%
              s_gtype = "Variant"
              if s_atype == "Float32" || s_atype == "Float64"
                s_gtype = "float"
              elsif s_atype == "Int32" || s_atype == "Int64"
                s_gtype = "int"
              elsif s_atype == "Bool"
                s_gtype = "bool"
              elsif s_atype == "String"
                s_gtype = "String"
              end
            %}
            io << "      <param index=\"{{idx}}\" name=\"{{s_arg.var.id}}\" type=\"{{s_gtype.id}}\" />\n"
          {% end %}
        {% end %}
      {% end %}
      io << "      <description>"
      {% if s_doc && s_doc != "" %}
        io << {{s_doc}}
      {% end %}
      io << "</description>\n"
      io << "    </signal>\n"
    {% end %}
    io << "  </signals>\n"
    io << "</class>"
  end
  ::Godot::EditorDocRegistry.register(xml_{{class_name}})
end

# Clean signal declaration macro:
# Usage:
#   signal died
#   signal health_changed(new_health : Int32, max_health : Int32)
macro signal(sig_decl)
  {% if sig_decl.is_a?(Call) %}
    {% sig_name = sig_decl.name %}
    {% sig_args = sig_decl.args %}
  {% else %}
    {% sig_name = sig_decl %}
    {% sig_args = [] of Nil %}
  {% end %}

  # Type-safe emission helper
  def emit_{{sig_name.id}}({% for arg, i in sig_args %}{% if arg.is_a?(TypeDeclaration) %}{{arg.var}} : {{arg.type}}{% else %}{{arg}}{% end %}{% if i < sig_args.size - 1 %}, {% end %}{% end %}) : Void
    emit_signal("{{sig_name.id}}"{% for arg in sig_args %}, {% if arg.is_a?(TypeDeclaration) %}{{arg.var}}{% else %}{{arg}}{% end %}{% end %})
  end
end

# Inspector organization macros
macro export_group(name, prefix = "")
end

macro export_subgroup(name, prefix = "")
end
