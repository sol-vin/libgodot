require "../src/libgodot"

puts "=== Verifying LibGodot DLL Loading ==="

loader = LibGodot::DynamicLoader.new("bin/libgodot.dll")
if loader.loaded?
  puts "SUCCESS: bin/libgodot.dll loaded successfully!"
  puts "SUCCESS: Found libgodot_create_godot_instance and libgodot_destroy_godot_instance entry points!"
else
  puts "ERROR: Could not load bin/libgodot.dll or find entry points."
  exit 1
end
