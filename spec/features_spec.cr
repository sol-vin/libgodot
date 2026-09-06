require "../src/libgodot"

puts "=== Running New Features Verification (Docs, GDScript, Enums, Singletons) ==="

# 1. Test Node with Doc Comments and XML generation
node TestDocPlayer < CharacterBody3D do
  @[Doc("Represents a test player entity")]

  # Player movement speed in pixels
  @[Export(range: 10.0_f32..500.0_f32, doc: "Movement velocity")]
  property speed : Float32 = 250.0_f32

  # Emitted on player death
  signal player_died

  # Inflicts damage to the entity
  def take_damage(dmg : Int32) : Void
  end
end

docs = Godot::EditorDocRegistry.xml_documents
abort "Failed: expected EditorDocRegistry to have at least 1 document" if docs.empty?

player_doc = docs.find { |d| d.includes?("TestDocPlayer") }
abort "Failed: TestDocPlayer doc not found in registry" unless player_doc

abort "Failed: missing class description" unless player_doc.includes?("Represents a test player entity")
abort "Failed: missing member speed" unless player_doc.includes?("<member name=\"speed\"")
abort "Failed: missing member speed doc" unless player_doc.includes?("Movement velocity")
abort "Failed: missing signal player_died" unless player_doc.includes?("<signal name=\"player_died\"")

puts "✓ Compile-time Doc Comments and Godot XML DocData generation verified!"

# 2. Test GDScript Interop Macro
class CustomGDScriptBinding < Godot::Node
  bind_gdscript_methods do
    gdscript_method calculate_score(points : Int32)
    gdscript_static_method get_version
    gdscript_property active : Bool
  end
end

binding_obj = CustomGDScriptBinding.new
binding_obj.active = true
abort "Failed: GDScript property getter/setter" unless binding_obj.active == true
binding_obj.calculate_score(100)
CustomGDScriptBinding.get_version

puts "✓ GDScript Interop Macro verified!"

# 3. Test Global Enums and Singletons
abort "Failed: Key::Space enum" unless Godot::Key::Space.value == 32_i64
abort "Failed: Key::Escape enum" unless Godot::Key::Escape.value == 4194305_i64
abort "Failed: Key::Enter enum" unless Godot::Key::Enter.value == 4194309_i64

abort "Failed: Singleton Input exists" unless Godot::Input
abort "Failed: Singleton Engine exists" unless Godot::Engine

puts "✓ Global Enums & Singletons verified!"
puts "All new features passed specifications cleanly!"
