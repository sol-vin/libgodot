# =============================================================================
# LibGodot Test Suite: Core Data Resources & RefCounted Engine Utilities
# =============================================================================

macro test_resources(name, &block)
  ::TestFramework::Registry.register("Resources", {{name}}) do |node|
    root = node
    {{block.body}}
  end
end

test_resources "ConfigFile key/value persistence and sections" do
  cfg = Godot.create(Godot::ConfigFile)
  cfg.call("set_value", "audio", "master_volume", 1.0_f64)
  TestFramework.assert_true cfg.call_bool("has_section", "audio")
  TestFramework.assert_true cfg.call_bool("has_section_key", "audio", "master_volume")

  cfg.call("erase_section", "audio")
  TestFramework.assert_false cfg.call_bool("has_section", "audio")
  cfg.destroy
end

test_resources "AStar2D graph pathfinding point registration and connection" do
  astar = Godot.create(Godot::AStar2D)
  astar.add_point(1_i64, Godot::Vector2.new(0.0, 0.0), 1.0_f64)
  astar.add_point(2_i64, Godot::Vector2.new(10.0, 0.0), 1.0_f64)

  TestFramework.assert_true astar.has_point(1_i64)
  TestFramework.assert_true astar.has_point(2_i64)
  TestFramework.assert_false astar.has_point(99_i64)

  astar.connect_points(1_i64, 2_i64, true)
  TestFramework.assert_true astar.are_points_connected(1_i64, 2_i64, true)

  p1 = astar.get_point_position(1_i64)
  TestFramework.assert_approx_eq p1.x, 0.0_f32

  astar.clear
  TestFramework.assert_false astar.has_point(1_i64)
  astar.destroy
end

test_resources "AStar3D graph pathfinding point registration and connectivity" do
  astar3d = Godot.create(Godot::AStar3D)
  astar3d.add_point(10_i64, Godot::Vector3.new(0.0, 0.0, 0.0), 1.0_f64)
  astar3d.add_point(20_i64, Godot::Vector3.new(0.0, 10.0, 0.0), 1.0_f64)

  TestFramework.assert_true astar3d.has_point(10_i64)
  TestFramework.assert_true astar3d.has_point(20_i64)

  astar3d.connect_points(10_i64, 20_i64, true)
  TestFramework.assert_true astar3d.are_points_connected(10_i64, 20_i64, true)

  astar3d.clear
  TestFramework.assert_false astar3d.has_point(10_i64)
  astar3d.destroy
end

test_resources "FastNoiseLite procedural noise sampling and frequencies" do
  fnl = Godot.create(Godot::FastNoiseLite)
  fnl.set_seed(4242_i64)
  TestFramework.assert_eq fnl.get_seed, 4242_i64

  fnl.set_frequency(0.05_f64)
  TestFramework.assert_approx_eq fnl.get_frequency.to_f32, 0.05_f32

  n1 = fnl.get_noise_2d(10.0_f64, 20.0_f64)
  n2 = fnl.get_noise_2d(10.0_f64, 20.0_f64)
  TestFramework.assert_approx_eq n1.to_f32, n2.to_f32 # Deterministic

  fnl.destroy
end

test_resources "RandomNumberGenerator deterministic seeding and random ranges" do
  rng = Godot.create(Godot::RandomNumberGenerator)
  rng.set_seed(987654321_i64)

  r_int = rng.randi_range(1_i64, 100_i64)
  TestFramework.assert_true r_int >= 1_i64 && r_int <= 100_i64

  r_float = rng.randf_range(10.0_f64, 20.0_f64)
  TestFramework.assert_true r_float >= 10.0 && r_float <= 20.0
  rng.destroy
end

test_resources "StyleBoxFlat margins and background color" do
  sbf = Godot.create(Godot::StyleBoxFlat)
  sbf.set_bg_color(Godot::Color.new(0.2, 0.2, 0.2, 1.0))
  TestFramework.assert_approx_eq sbf.get_bg_color.r, 0.2_f32

  sbf.set_border_width(Godot::Side::Left.to_i64, 4_i64)
  TestFramework.assert_eq sbf.get_border_width(Godot::Side::Left.to_i64), 4_i64
  sbf.destroy
end

test_resources "Environment ambient lighting and glow settings" do
  env = Godot.create(Godot::Environment)
  env.set_ambient_light_color(Godot::Color.new(0.05, 0.05, 0.1, 1.0))
  TestFramework.assert_approx_eq env.get_ambient_light_color.b, 0.1_f32

  env.set_glow_enabled(true)
  TestFramework.assert_true env.is_glow_enabled
  env.destroy
end
