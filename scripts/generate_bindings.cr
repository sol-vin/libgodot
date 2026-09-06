require "json"
require "yaml"

puts "=== LibGodot Crystal Binding Generator ==="
puts "Loading extension_api.json..."

unless File.exists?("extension_api.json")
  puts "Error: extension_api.json not found! Run godot.exe --headless --dump-extension-api first."
  exit 1
end

api_json = File.read("extension_api.json")
api_data = JSON.parse(api_json)

# Load overrides
overrides = if File.exists?("scripts/overrides.yml")
  YAML.parse(File.read("scripts/overrides.yml"))
else
  YAML.parse("{}")
end

keywords = Hash(String, String).new
if kw = overrides["keywords"]?
  kw.as_h.each do |k, v|
    keywords[k.to_s] = v.to_s
  end
end

type_map = Hash(String, String).new
if tm = overrides["type_map"]?
  tm.as_h.each do |k, v|
    type_map[k.to_s] = v.to_s
  end
end

def sanitize_name(name : String, keywords : Hash(String, String)) : String
  clean = name.gsub(/[^a-zA-Z0-9_]/, "_")
  if clean.starts_with?(/[0-9]/)
    clean = "arg_#{clean}"
  end
  if mapped = keywords[clean]?
    mapped
  else
    clean
  end
end

def crystal_type_name(godot_type : String, type_map : Hash(String, String)) : String
  if godot_type.starts_with?("enum::") || godot_type.starts_with?("bitfield::")
    return "Int64"
  elsif mapped = type_map[godot_type]?
    mapped
  elsif godot_type.starts_with?("typedarray::")
    return "Godot::Array"
  else
    godot_type.gsub(/[^a-zA-Z0-9_]/, "")
  end
end

# Ensure directories
Dir.mkdir_p("src/libgodot/generated")
Dir.mkdir_p("src/libgodot/generated/classes")

# =============================================================================
# 1. Global Enums
# =============================================================================
puts "Generating global enums..."
File.open("src/libgodot/generated/global_enums.cr", "w") do |f|
  f.puts "# Generated Global Enums for Godot 4.8+"
  f.puts "module Godot"
  
  if global_enums = api_data["global_enums"]?
    global_enums.as_a.each do |e|
      raw_enum_name = e["name"].as_s
      enum_name = raw_enum_name.starts_with?("Variant.") ? raw_enum_name.gsub("Variant.", "") : raw_enum_name
      next if enum_name.empty?

      f.puts "  enum #{enum_name} : Int64"
      enum_prefix = "#{enum_name.underscore.upcase}_"
      alt_prefix = "#{enum_name.upcase}_"
      if values = e["values"]?
        values.as_a.each do |v|
          val_name = v["name"].as_s
          clean_val = if val_name.starts_with?(enum_prefix)
            val_name[enum_prefix.size..]
          elsif val_name.starts_with?(alt_prefix)
            val_name[alt_prefix.size..]
          else
            val_name
          end
          parts = clean_val.split('_')
          camel_val = parts.map(&.capitalize).join
          camel_val = "Val#{camel_val}" if camel_val.starts_with?(/[0-9]/)
          camel_val = "None" if camel_val.empty?
          val_num = v["value"].as_i64
          f.puts "    #{camel_val} = #{val_num}_i64"
        end
      end
      f.puts "  end\n"
    end
  end

  f.puts "end"
end

# =============================================================================
# 2. Singletons
# =============================================================================
puts "Generating singletons..."
File.open("src/libgodot/generated/singletons.cr", "w") do |f|
  f.puts "# Generated Singletons for Godot 4.8+"
  f.puts "module Godot"

  if singletons = api_data["singletons"]?
    singletons.as_a.each do |s|
      s_name = s["name"].as_s
      f.puts "  module #{s_name}"
      f.puts "    @@instance : Void* = Pointer(Void).null"
      f.puts "    def self.singleton_ptr : Void*"
      f.puts "      if @@instance.null?"
      f.puts "        @@instance = Bridge.get_singleton(\"#{s_name}\")"
      f.puts "      end"
      f.puts "      @@instance"
      f.puts "    end"
      f.puts "  end\n"
    end
  end

  f.puts "end"
end

# =============================================================================
# 3. Classes (Topologically Sorted)
# =============================================================================
puts "Sorting classes topologically..."
classes = api_data["classes"].as_a

# Build dependency graph
class_map = Hash(String, JSON::Any).new
inherits_map = Hash(String, String?).new
classes.each do |c|
  name = c["name"].as_s
  class_map[name] = c
  inherits_map[name] = c["inherits"]?.try(&.as_s)
end

# Topological sort
visited = Set(String).new
sorted_classes = Array(JSON::Any).new

def visit(name : String, class_map, inherits_map, visited, sorted_classes)
  return if visited.includes?(name)
  visited.add(name)
  if parent = inherits_map[name]?
    if class_map.has_key?(parent)
      visit(parent, class_map, inherits_map, visited, sorted_classes)
    end
  end
  if c = class_map[name]?
    sorted_classes << c
  end
end

class_map.keys.each do |name|
  visit(name, class_map, inherits_map, visited, sorted_classes)
end

puts "Generating #{sorted_classes.size} classes..."

# Categorize classes
core_classes = [] of JSON::Any
scene_2d_classes = [] of JSON::Any
scene_3d_classes = [] of JSON::Any
gui_classes = [] of JSON::Any
server_classes = [] of JSON::Any
other_classes = [] of JSON::Any

sorted_classes.each do |c|
  name = c["name"].as_s
  parent = c["inherits"]?.try(&.as_s) || ""
  if name.includes?("2D")
    scene_2d_classes << c
  elsif name.includes?("3D")
    scene_3d_classes << c
  elsif name.includes?("Server")
    server_classes << c
  elsif ["Control", "Button", "Label", "Range", "ProgressBar", "Slider", "ScrollContainer", "BoxContainer", "TextureRect"].includes?(name) || parent == "Control" || parent == "Range"
    gui_classes << c
  elsif ["Object", "RefCounted", "Resource", "Node", "SceneTree", "MainLoop"].includes?(name)
    core_classes << c
  else
    other_classes << c
  end
end

def generate_class_code(io : IO, c : JSON::Any, keywords : Hash(String, String), type_map : Hash(String, String))
  name = c["name"].as_s
  parent = c["inherits"]?.try(&.as_s) || "Godot::Object"
  parent_type = parent == "Godot::Object" ? parent : (parent.starts_with?("Godot::") ? parent : "Godot::#{parent}")

  io.puts "  class #{name} < #{parent_type}"
  io.puts "    def initialize(pointer : Void* = Pointer(Void).null)"
  io.puts "      super(pointer)"
  io.puts "    end\n"

  # Inner enums
  if enums = c["enums"]?
    enums.as_a.each do |e|
      e_name = e["name"].as_s
      next if e_name.empty?
      io.puts "    enum #{e_name} : Int64"
      if values = e["values"]?
        values.as_a.each do |v|
          val_name = v["name"].as_s
          parts = val_name.split('_')
          camel_val = parts.map(&.capitalize).join
          camel_val = "Val#{camel_val}" if camel_val.starts_with?(/[0-9]/)
          val_num = v["value"].as_i64
          io.puts "      #{camel_val} = #{val_num}_i64"
        end
      end
      io.puts "    end\n"
    end
  end

  # Methods
  if methods = c["methods"]?
    methods.as_a.each do |m|
      m_name = m["name"].as_s
      next if m["is_virtual"]?.try(&.as_bool)
      hash_val = m["hash"]?.try(&.as_i64) || 0_i64
      sanitized_m_name = sanitize_name(m_name, keywords)

      # Build argument list
      args = m["arguments"]?.try(&.as_a) || [] of JSON::Any
      arg_defs = [] of String
      
      args.each_with_index do |a, idx|
        raw_a_name = a["name"].as_s
        a_name = sanitize_name(raw_a_name, keywords)
        a_type = crystal_type_name(a["type"].as_s, type_map)
        arg_defs << "#{a_name} : #{a_type}"
      end

      # Return type
      ret_data = m["return_value"]?
      ret_type_godot = ret_data ? ret_data["type"].as_s : "void"
      ret_type_crystal = crystal_type_name(ret_type_godot, type_map)

      # Lazy method bind variable
      clean_var_name = m_name.gsub(/[^a-zA-Z0-9_]/, "_")
      io.puts "    @@mb_#{clean_var_name} : Void* = Pointer(Void).null"
      io.puts "    def #{sanitized_m_name}(#{arg_defs.join(", ")}) : #{ret_type_crystal}"
      io.puts "      if @@mb_#{clean_var_name}.null?"
      io.puts "        @@mb_#{clean_var_name} = Bridge.get_method_bind(\"#{name}\", \"#{m_name}\", #{hash_val}_i64)"
      io.puts "      end"

      # Prepare arguments for ptrcall
      args_expr = if args.empty?
        "Pointer(Pointer(Void)).null"
      else
        args.each_with_index do |a, idx|
          raw_a_name = a["name"].as_s
          a_name = sanitize_name(raw_a_name, keywords)
          a_type = crystal_type_name(a["type"].as_s, type_map)
          if a_type.starts_with?("Godot::") || ["Node", "Resource", "SceneTree", "Object"].includes?(a_type)
            io.puts "      arg_ptr_#{idx} = #{a_name} ? #{a_name}.pointer : Pointer(Void).null"
            io.puts "      arg_#{idx} = pointerof(arg_ptr_#{idx}).as(Void*)"
          else
            io.puts "      val_#{idx} = #{a_name}"
            io.puts "      arg_#{idx} = pointerof(val_#{idx}).as(Void*)"
          end
        end
        arg_names = (0...args.size).map { |i| "arg_#{i}" }
        io.puts "      args = [#{arg_names.join(", ")}]"
        "args.to_unsafe.as(Void**)"
      end
      
      # Marshalling return value
      if ret_type_crystal == "Void"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, Pointer(Void).null)"
      elsif ret_type_crystal == "Bool"
        io.puts "      ret = 0_u8"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret).as(Void*))"
        io.puts "      ret != 0_u8"
      elsif ret_type_crystal == "Int64" || ret_type_crystal == "Int32"
        io.puts "      ret = 0_i64"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret).as(Void*))"
        io.puts "      ret"
      elsif ret_type_crystal == "Float64" || ret_type_crystal == "Float32"
        io.puts "      ret = 0.0_f64"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret).as(Void*))"
        io.puts "      ret"
      elsif ret_type_crystal == "Vector2"
        io.puts "      ret = Vector2.new"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret).as(Void*))"
        io.puts "      ret"
      elsif ret_type_crystal == "Vector3"
        io.puts "      ret = Vector3.new"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret).as(Void*))"
        io.puts "      ret"
      elsif ret_type_crystal == "Color"
        io.puts "      ret = Color.new"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret).as(Void*))"
        io.puts "      ret"
      elsif ret_type_crystal == "Transform3D"
        io.puts "      ret = Transform3D.new"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret).as(Void*))"
        io.puts "      ret"
      elsif ret_type_crystal == "Void*" || ret_type_crystal == "Pointer(Void)"
        io.puts "      ret_ptr = Pointer(Void).null"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret_ptr).as(Void*))"
        io.puts "      ret_ptr"
      elsif ret_type_crystal == "String"
        io.puts "      \"\""
      else
        io.puts "      ret_ptr = Pointer(Void).null"
        io.puts "      Bridge.ptrcall(@@mb_#{clean_var_name}, @pointer, #{args_expr}, pointerof(ret_ptr).as(Void*))"
        io.puts "      #{ret_type_crystal}.new(ret_ptr)"
      end

      io.puts "    end\n"
    end
  end

  io.puts "  end\n"
end

# Generate modular files
categories = {
  "core" => core_classes,
  "scene_2d" => scene_2d_classes,
  "scene_3d" => scene_3d_classes,
  "gui" => gui_classes,
  "servers" => server_classes,
  "other" => other_classes
}

categories.each do |cat_name, cat_classes|
  puts "Writing src/libgodot/generated/classes/#{cat_name}.cr (#{cat_classes.size} classes)..."
  File.open("src/libgodot/generated/classes/#{cat_name}.cr", "w") do |f|
    f.puts "# Generated #{cat_name} classes"
    f.puts "module Godot"
    cat_classes.each do |c|
      generate_class_code(f, c, keywords, type_map)
    end
    f.puts "end"
  end
end

# Generate master all_classes.cr
File.open("src/libgodot/generated/classes/all_classes.cr", "w") do |f|
  f.puts "# Master index requiring all class categories in dependency order"
  f.puts "require \"./core\""
  f.puts "require \"./servers\""
  f.puts "require \"./gui\""
  f.puts "require \"./scene_2d\""
  f.puts "require \"./scene_3d\""
  f.puts "require \"./other\""
end

# Generate generated.cr index
File.open("src/libgodot/generated/classes.cr", "w") do |f|
  f.puts "require \"./global_enums\""
  f.puts "require \"./singletons\""
  f.puts "require \"./classes/core\""
  f.puts "require \"./classes/scene_2d\""
  f.puts "require \"./classes/scene_3d\""
  f.puts "require \"./classes/gui\""
end

puts "=== Binding Generation Complete! ==="
