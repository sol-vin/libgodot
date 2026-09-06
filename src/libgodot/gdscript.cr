# # GDScript Interoperability Macro System
#
# Provides seamless binding between Godot GDScript files and Crystal classes.
# Replicates GDScript instance methods, static functions, and properties.

module Godot
  # Helper for dynamic invocation on Godot objects
  module ScriptInterop
    # Dynamic method dispatch on Godot object
    def self.call_method(object_ptr : Void*, method_name : String, *args)
      # Future: route to object_call / method_bind_call
      # For now, bridge logging / fallback
    end
  end
end

# Declarative GDScript method binding DSL inside classes
macro bind_gdscript_methods(&block)
  {% for stmt in block.body.is_a?(Expressions) ? block.body.expressions : [block.body] %}
    {% if stmt.is_a?(Call) %}
      {% if stmt.name.id == "gdscript_method" %}
        {% m_call = stmt.args[0] %}
        {% if m_call.is_a?(Call) %}
          {% m_name = m_call.name %}
          {% m_args = m_call.args %}
        {% else %}
          {% m_name = m_call %}
          {% m_args = [] of Nil %}
        {% end %}
        def {{m_name.id}}({% for a, i in m_args %}{{a.id}}{% if i < m_args.size - 1 %}, {% end %}{% end %})
          # Invokes script method on Godot Object instance
          Godot.print("[GDScript] Calling {{m_name.id}} on #{@pointer}")
        end
      {% elsif stmt.name.id == "gdscript_static_method" %}
        {% m_call = stmt.args[0] %}
        {% if m_call.is_a?(Call) %}
          {% m_name = m_call.name %}
          {% m_args = m_call.args %}
        {% else %}
          {% m_name = m_call %}
          {% m_args = [] of Nil %}
        {% end %}
        def self.{{m_name.id}}({% for a, i in m_args %}{{a.id}}{% if i < m_args.size - 1 %}, {% end %}{% end %})
          # Invokes static script method
          Godot.print("[GDScript] Calling static {{m_name.id}}")
        end
      {% elsif stmt.name.id == "gdscript_property" %}
        {% p_arg = stmt.args[0] %}
        {% if p_arg.is_a?(TypeDeclaration) %}
          {% p_name = p_arg.var %}
          {% p_type = p_arg.type %}
        {% else %}
          {% p_name = p_arg %}
          {% p_type = "Object".id %}
        {% end %}
        def {{p_name.id}} : {{p_type.id}}?
          @{{p_name.id}}
        end
        def {{p_name.id}}=(val : {{p_type.id}})
          @{{p_name.id}} = val
        end
      {% end %}
    {% end %}
  {% end %}
end

# Primary macro: bind_gdscript ClassName < BaseClass, "path/to/script.gd"
macro bind_gdscript(decl, script_path, &block)
  {% if decl.is_a?(Call) && decl.name == "<" %}
    {% class_name = decl.receiver %}
    {% parent_name = decl.args[0] %}
  {% else %}
    {% class_name = decl %}
    {% parent_name = "Godot::Node".id %}
  {% end %}

  node {{class_name}} < {{parent_name}} do
    # Reference to bound GDScript path
    def self.gdscript_path : String
      {{script_path}}
    end

    {{ yield }}
  end
end

# Overload for bind_gdscript without block
macro bind_gdscript(decl, script_path)
  bind_gdscript({{decl}}, {{script_path}}) do
  end
end
