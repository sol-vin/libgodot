require "../src/libgodot"

# Define test nodes
node CameraRig do
  property zoom : Float32 = 1.0_f32
end

node Player < CharacterBody3D do
  @[Export(range: 50.0_f32..800.0_f32, step: 10.0_f32)]
  property speed : Float32 = 300.0_f32

  @[Export]
  property max_health : Int32 = 100

  signal health_changed(new_health : Int32, max_health : Int32)
  signal died

  def _ready
    puts "Player initialized: #{name}"
  end
end

puts "=== Running LibGodot Crystal Verification ==="

# 1. Verify ClassRegistry registration
entries = Godot::ClassRegistry.entries
puts "Total Registered Nodes: #{entries.size}"

abort "Failed: expected at least 2 registered nodes, got #{entries.size}" unless entries.size >= 2

camera_entry = entries.find { |e| e.class_name == "CameraRig" }
abort "Failed: CameraRig not registered" unless camera_entry
abort "Failed: CameraRig parent should be Node" unless camera_entry.parent_name == "Node"

player_entry = entries.find { |e| e.class_name == "Player" }
abort "Failed: Player not registered" unless player_entry
abort "Failed: Player parent should be CharacterBody3D" unless player_entry.parent_name == "CharacterBody3D"

# 2. Test instantiation and default values
player = Player.new
abort "Failed: Default speed mismatch" unless player.speed == 300.0_f32
abort "Failed: Default max_health mismatch" unless player.max_health == 100

# 3. Test Vector3 math
v1 = Vector3.new(1.0, 2.0, 3.0)
v2 = Vector3.new(4.0, 5.0, 6.0)
v3 = v1 + v2
abort "Failed: Vector3 addition" unless v3.x == 5.0_f32 && v3.y == 7.0_f32 && v3.z == 9.0_f32

dot = v1.dot(v2)
abort "Failed: Vector3 dot product" unless dot == 32.0_f32

cross = Vector3::UP.cross(Vector3::RIGHT)
abort "Failed: Vector3 cross product" unless cross.z == -1.0_f32

# 4. Test Range type cohesion
node CustomSlider < Range do
end

slider = CustomSlider.new(0..100)
abort "Failed: Range cohesion min_value" unless slider.min_value == 0.0
abort "Failed: Range cohesion max_value" unless slider.max_value == 100.0

slider.range = 25..75
abort "Failed: Range assignment" unless slider.to_range == (25.0..75.0)
abort "Failed: Range includes? check" unless slider.includes?(50)
abort "Failed: Range out of bounds check" if slider.includes?(10)

hint = (0.0..100.0).to_godot_hint_string(0.5)
abort "Failed: Range to_godot_hint_string" unless hint == "0.0,100.0,0.5"

bounds = (10..50).to_godot_bounds
abort "Failed: Range to_godot_bounds" unless bounds == {10.0, 50.0}

# 5. Test get_node error handling and get_node? / get_node_or_null
test_node = Godot::Node.new
begin
  test_node.get_node("non_existent_node")
  abort "Failed: get_node with invalid path should have raised an exception"
rescue ex
  abort "Failed: unexpected error message: #{ex.message}" unless ex.message.not_nil!.includes?("Node not found")
end

abort "Failed: get_node? should return nil for invalid path" unless test_node.get_node?("non_existent_node").nil?
abort "Failed: get_node_or_null should return nil for invalid path" unless test_node.get_node_or_null("non_existent_node").nil?

puts "All verification checks (including get_node and Range type cohesion) passed successfully!"
