require "../../src/libgodot"

# =============================================================================
# LibGodot Test Runner & Assertion Framework
# =============================================================================

module TestFramework
  class AssertionError < Exception
  end

  record TestResult, category : String, name : String, passed : Bool, message : String = ""

  def self.assert_true(cond : Bool, msg : String = "Expected true, got false")
    raise AssertionError.new(msg) unless cond
  end

  def self.assert_false(cond : Bool, msg : String = "Expected false, got true")
    raise AssertionError.new(msg) if cond
  end

  def self.assert_eq(actual, expected, msg : String = "")
    if actual != expected
      detail = msg.empty? ? "Expected #{expected.inspect}, got #{actual.inspect}" : "#{msg} (Expected #{expected.inspect}, got #{actual.inspect})"
      raise AssertionError.new(detail)
    end
  end

  def self.assert_approx_eq(actual : Float32 | Float64, expected : Float32 | Float64, epsilon : Float64 = 0.0001, msg : String = "")
    diff = (actual - expected).abs
    if diff > epsilon
      detail = msg.empty? ? "Expected ~#{expected}, got #{actual} (diff #{diff})" : "#{msg} (Expected ~#{expected}, got #{actual})"
      raise AssertionError.new(detail)
    end
  end

  def self.assert_not_nil(val, msg : String = "Expected non-nil value")
    raise AssertionError.new(msg) if val.nil?
  end

  def self.assert_nil(val, msg : String = "Expected nil value")
    raise AssertionError.new(msg) unless val.nil?
  end

  # ===========================================================================
  # Centralized Extensible Test Registry
  # ===========================================================================
  class TestCase
    getter category : String
    getter name : String
    @block : (Godot::Node -> Void)

    def initialize(@category : String, @name : String, &@block : Godot::Node -> Void)
    end

    def execute(context_node : Godot::Node) : TestResult
      Godot.print("  [Running] [#{@category}] #{@name}...")
      begin
        @block.call(context_node)
        TestResult.new(@category, @name, true, "PASS")
      rescue ex : AssertionError
        TestResult.new(@category, @name, false, ex.message || "Assertion failed")
      rescue ex : Exception
        TestResult.new(@category, @name, false, "ERROR: #{ex.class.name}: #{ex.message}")
      end
    end
  end

  class Registry
    @@tests = Array(TestCase).new

    def self.register(category : String, name : String, &block : Godot::Node -> Void)
      @@tests << TestCase.new(category, name, &block)
    end

    def self.all_tests : Array(TestCase)
      @@tests
    end

    def self.for_category(category : String) : Array(TestCase)
      @@tests.select { |t| t.category == category }
    end

    def self.categories : Array(String)
      @@tests.map(&.category).uniq
    end

    def self.run_category(category : String, context_node : Godot::Node) : Array(TestResult)
      results = Array(TestResult).new
      for_category(category).each do |test|
        results << test.execute(context_node)
      end
      results
    end

    def self.run_all(context_node : Godot::Node) : Array(TestResult)
      results = Array(TestResult).new
      @@tests.each do |test|
        results << test.execute(context_node)
      end
      results
    end
  end
end

# Declarative DSL Macros for Simple 3-Line Test Authoring
macro test_2d(name, &block)
  ::TestFramework::Registry.register("2D", {{name}}) do |node|
    {{block.body}}
  end
end

macro test_3d(name, &block)
  ::TestFramework::Registry.register("3D", {{name}}) do |node|
    {{block.body}}
  end
end

macro test_core(name, &block)
  ::TestFramework::Registry.register("Core", {{name}}) do |node|
    {{block.body}}
  end
end

macro test_prop(name, &block)
  ::TestFramework::Registry.register("Properties", {{name}}) do |node|
    {{block.body}}
  end
end

# =============================================================================
# Custom Property & Annotation Test Target Node
# =============================================================================

@[Tool]
@[Icon("res://addons/crystal_integration/crystal.gdextension")]
node PropertyTestTarget < Godot::Node do
  # 1. Standard Property Exports
  @[Export]
  property float32_val : Float32 = 1.25_f32

  @[Export]
  property float64_val : Float64 = 9.87654

  @[Export]
  property int32_val : Int32 = 42

  @[Export]
  property int64_val : Int64 = 10000000000_i64

  @[Export]
  property bool_val : Bool = true

  @[Export]
  property string_val : String = "LibGodot"

  @[Export]
  property vec2_val : Godot::Vector2 = Godot::Vector2.new(3.0, 4.0)

  @[Export]
  property vec2i_val : Godot::Vector2i = Godot::Vector2i.new(7, 8)

  @[Export]
  property vec3_val : Godot::Vector3 = Godot::Vector3.new(1.0, 2.0, 3.0)

  @[Export]
  property vec3i_val : Godot::Vector3i = Godot::Vector3i.new(4, 5, 6)

  @[Export]
  property color_val : Godot::Color = Godot::Color.new(1.0, 0.5, 0.25, 1.0)

  @[Export]
  property rect2_val : Godot::Rect2 = Godot::Rect2.new(10.0, 20.0, 100.0, 200.0)

  # 2. Custom Getters & Setters
  @raw_health : Float32 = 100.0_f32
  @dirty_counter : Int32 = 0
  @tool_action_fired : Bool = false

  # Computed getter
  def health_percentage : Float32
    (@raw_health / 100.0_f32) * 100.0_f32
  end

  # Setter with value clamping
  def clamped_health=(val : Float32)
    @raw_health = val.clamp(0.0_f32, 100.0_f32)
  end

  def clamped_health : Float32
    @raw_health
  end

  # Setter triggering side-effect
  def dirty_trigger=(val : Int32)
    @dirty_counter += val
  end

  def dirty_trigger : Int32
    @dirty_counter
  end

  # Setter acting as a tool button action
  def tool_button_trigger=(val : Bool)
    if val
      @tool_action_fired = true
    end
  end

  def tool_button_trigger : Bool
    @tool_action_fired
  end

  # 3. Export Property Hints
  @[ExportRange(0..100, 5)]
  property range_hint_prop : Int32 = 25

  @[ExportEnum("Low", "Medium", "High")]
  property enum_hint_prop : String = "Medium"

  @[ExportFile("*.tscn")]
  property file_hint_prop : String = "res://scenes/test_dummy_2d.tscn"

  @[ExportMultiline]
  property multiline_hint_prop : String = "First Line\nSecond Line"

  @[ExportColorNoAlpha]
  property color_no_alpha_prop : Godot::Color = Godot::Color.new(1.0, 0.0, 0.0)

  @[ExportNodePath("Child")]
  property nodepath_hint_prop : Godot::NodePath = Godot::NodePath.new("Child")

  @[ExportStorage]
  property storage_only_prop : Int32 = 999

  @[ExportToolButton("Click Here")]
  property tool_btn_prop : Bool = false

  @[ExportCustom(hint: 1_u32, hint_string: "0,50,5")]
  property custom_hint_prop : Int32 = 10

  # 4. Grouping Annotations
  @[ExportCategory("Stats")]
  property cat_marker : Int32 = 1

  @[ExportGroup("Movement", prefix: "move_")]
  property move_speed : Float32 = 250.0_f32

  @[ExportSubgroup("Air")]
  property move_air_speed : Float32 = 180.0_f32

  # 5. Signals
  signal test_event_fired(val : Int32)
end

# =============================================================================
# @tool 2D & 3D Test Runner Nodes
# =============================================================================

@[Tool]
node ToolTester2D < Godot::Node2D do
  @[ExportToolButton("▶ Run 2D Tool Tests")]
  property run_tests_button : Bool = false

  property test_status : String = "Ready"

  def run_tests_button=(val : Bool)
    @run_tests_button = val
    if val
      run_tool_tests
      @run_tests_button = false
    end
  end

  def run_tool_tests
    Godot.print("------------------------------------------------------------------")
    Godot.print("[ToolTester2D] Executing In-Editor 2D Test Suite...")
    Godot.print("------------------------------------------------------------------")
    
    results = ::TestFramework::Registry.run_category("2D", self) +
              ::TestFramework::Registry.run_category("Core", self) +
              ::TestFramework::Registry.run_category("Properties", self)
              
    passed = results.count(&.passed)
    total = results.size
    
    results.each do |r|
      if r.passed
        Godot.print("  [PASS] [#{r.category}] #{r.name}")
      else
        Godot.printerr("  [FAIL] [#{r.category}] #{r.name}: #{r.message}")
      end
    end
    
    if passed == total
      @test_status = "All #{total}/#{total} Tests Passed!"
      Godot.print("[ToolTester2D] SUCCESS: All #{total} in-editor tests passed cleanly!")
    else
      @test_status = "Failed: #{total - passed}/#{total} Errors"
      Godot.printerr("[ToolTester2D] FAILED: #{total - passed} test(s) failed.")
    end
  end
end

@[Tool]
node ToolTester3D < Godot::Node3D do
  @[ExportToolButton("▶ Run 3D Tool Tests")]
  property run_tests_button : Bool = false

  property test_status : String = "Ready"

  def run_tests_button=(val : Bool)
    @run_tests_button = val
    if val
      run_tool_tests
      @run_tests_button = false
    end
  end

  def run_tool_tests
    Godot.print("------------------------------------------------------------------")
    Godot.print("[ToolTester3D] Executing In-Editor 3D Test Suite...")
    Godot.print("------------------------------------------------------------------")
    
    results = ::TestFramework::Registry.run_category("3D", self) +
              ::TestFramework::Registry.run_category("Core", self) +
              ::TestFramework::Registry.run_category("Properties", self)
              
    passed = results.count(&.passed)
    total = results.size
    
    results.each do |r|
      if r.passed
        Godot.print("  [PASS] [#{r.category}] #{r.name}")
      else
        Godot.printerr("  [FAIL] [#{r.category}] #{r.name}: #{r.message}")
      end
    end
    
    if passed == total
      @test_status = "All #{total}/#{total} Tests Passed!"
      Godot.print("[ToolTester3D] SUCCESS: All #{total} in-editor tests passed cleanly!")
    else
      @test_status = "Failed: #{total - passed}/#{total} Errors"
      Godot.printerr("[ToolTester3D] FAILED: #{total - passed} test(s) failed.")
    end
  end
end

# =============================================================================
# Runtime Test Runner UI Panel
# =============================================================================

node RunTesterPanel < Godot::Control do
  def _ready
    Godot.print("==================================================================")
    Godot.print("    LibGodot Interactive Test Runner Loaded (Two-Click Testing)   ")
    Godot.print("==================================================================")
    
    # Automatically execute all tests on startup
    run_and_display_all
  end

  def run_and_display_all
    results = ::TestFramework::Registry.run_all(self)
    passed = results.count(&.passed)
    total = results.size

    Godot.print("\n=== LibGodot Test Results: #{passed}/#{total} Passed ===")
    results.each do |r|
      if r.passed
        Godot.print("  ✔ [#{r.category}] #{r.name}")
      else
        Godot.printerr("  ✘ [#{r.category}] #{r.name}: #{r.message}")
      end
    end

    # Update UI if controls exist
    if stats_label = get_node?("MarginContainer/VBox/StatsLabel")
      stats_label.call("set_text", "Results: #{passed} / #{total} Passed (#{total - passed} Failed)")
    end

    if badge = get_node?("MarginContainer/VBox/HeaderBox/StatusBadge")
      if passed == total
        badge.call("set_text", "ALL PASSED")
      else
        badge.call("set_text", "#{total - passed} FAILED")
      end
    end

    if log_box = get_node?("MarginContainer/VBox/LogOutput")
      lines = [] of String
      lines << "[b]=== LibGodot Test Execution Suite ===[/b]"
      results.each do |r|
        color = r.passed ? "#44ff88" : "#ff4444"
        icon = r.passed ? "[color=#{color}]✔ PASS[/color]" : "[color=#{color}]✘ FAIL[/color]"
        lines << "#{icon} [b][#{r.category}][/b] #{r.name} - #{r.message}"
      end
      log_box.call("set_text", lines.join("\n"))
    end
  end
end

# =============================================================================
# Test Suite 1: Core Built-ins, Math, Resources, Singletons
# =============================================================================

test_core "Vector2 arithmetic and length" do
  v1 = Godot::Vector2.new(3.0, 4.0)
  TestFramework.assert_approx_eq v1.length, 5.0_f32
  TestFramework.assert_approx_eq v1.length_squared, 25.0_f32

  v2 = Godot::Vector2.new(1.0, 2.0)
  add = v1 + v2
  TestFramework.assert_eq add.x, 4.0_f32
  TestFramework.assert_eq add.y, 6.0_f32

  sub = v1 - v2
  TestFramework.assert_eq sub.x, 2.0_f32
  TestFramework.assert_eq sub.y, 2.0_f32

  dot = Godot::Vector2.new(1.0, 0.0).dot(Godot::Vector2.new(0.0, 1.0))
  TestFramework.assert_approx_eq dot, 0.0_f32
end

test_core "Vector2i grid coordinates" do
  v = Godot::Vector2i.new(10, 20)
  TestFramework.assert_eq v.x, 10
  TestFramework.assert_eq v.y, 20
  v_mul = v * 2
  TestFramework.assert_eq v_mul.x, 20
  TestFramework.assert_eq v_mul.y, 40
end

test_core "Vector3 arithmetic, dot and cross product" do
  v1 = Godot::Vector3.new(1.0, 0.0, 0.0)
  v2 = Godot::Vector3.new(0.0, 1.0, 0.0)
  cross = v1.cross(v2)
  TestFramework.assert_approx_eq cross.x, 0.0_f32
  TestFramework.assert_approx_eq cross.y, 0.0_f32
  TestFramework.assert_approx_eq cross.z, 1.0_f32

  dot = v1.dot(v2)
  TestFramework.assert_approx_eq dot, 0.0_f32
end

test_core "Color channel precision and constants" do
  c = Godot::Color.new(0.5, 0.25, 0.75, 1.0)
  TestFramework.assert_approx_eq c.r, 0.5_f32
  TestFramework.assert_approx_eq c.g, 0.25_f32
  TestFramework.assert_approx_eq c.b, 0.75_f32
  TestFramework.assert_approx_eq c.a, 1.0_f32

  white = Godot::Color::WHITE
  TestFramework.assert_approx_eq white.r, 1.0_f32
  TestFramework.assert_approx_eq white.g, 1.0_f32
  TestFramework.assert_approx_eq white.b, 1.0_f32
end

test_core "Rect2 bounds and position" do
  r = Godot::Rect2.new(10.0, 20.0, 50.0, 60.0)
  TestFramework.assert_eq r.position.x, 10.0_f32
  TestFramework.assert_eq r.position.y, 20.0_f32
  TestFramework.assert_eq r.size.x, 50.0_f32
  TestFramework.assert_eq r.size.y, 60.0_f32
end

test_core "Transform3D and Basis identity matrix" do
  t = Godot::Transform3D.new
  TestFramework.assert_approx_eq t.origin.x, 0.0_f32
  TestFramework.assert_approx_eq t.origin.y, 0.0_f32
  TestFramework.assert_approx_eq t.origin.z, 0.0_f32

  vec = Godot::Vector3.new(1.0, 2.0, 3.0)
  transformed = t.basis * vec
  TestFramework.assert_approx_eq transformed.x, 1.0_f32
  TestFramework.assert_approx_eq transformed.y, 2.0_f32
  TestFramework.assert_approx_eq transformed.z, 3.0_f32
end

test_core "Math.move_toward float precision" do
  moved32 = Math.move_toward(0.0_f32, 10.0_f32, 2.5_f32)
  TestFramework.assert_approx_eq moved32, 2.5_f32

  moved64 = Math.move_toward(10.0, 0.0, 3.0)
  TestFramework.assert_approx_eq moved64, 7.0
end

test_core "Godot::Range and Crystal Range cohesion" do
  cr_range = (10..100)
  g_range = cr_range.to_godot_range(5.0)
  TestFramework.assert_eq g_range.min_value, 10.0
  TestFramework.assert_eq g_range.max_value, 100.0
  TestFramework.assert_eq g_range.step, 5.0

  g_range.value = 55.0
  TestFramework.assert_approx_eq g_range.ratio, 0.5
  TestFramework.assert_true g_range.includes?(55)
  TestFramework.assert_false g_range.includes?(150)
end

test_core "Resource loading (Godot.load & preload)" do
  # Load dummy scene
  res = Godot.load("res://scenes/test_dummy_2d.tscn")
  TestFramework.assert_not_nil res
  TestFramework.assert_false res.pointer.null?

  # Load via load_as PackedScene
  scene = Godot.load_as(Godot::PackedScene, "res://scenes/test_dummy_2d.tscn")
  TestFramework.assert_not_nil scene
  TestFramework.assert_false scene.pointer.null?

  # Instantiate the loaded scene
  inst = scene.instantiate
  TestFramework.assert_not_nil inst
  TestFramework.assert_false inst.pointer.null?
  TestFramework.assert_eq inst.name, "TestDummy2D"
end

test_core "Input singleton method verification" do
  # Verify Input.is_key_pressed doesn't crash
  pressed = Godot::Input.is_key_pressed(4194305) # Key::KEY_ESCAPE
  TestFramework.assert_false pressed
end

# =============================================================================
# Test Suite 2: 2D Nodes, Transforms & Traversal
# =============================================================================

test_2d "Node2D position, rotation, and scale" do |node|
  # If context is a Node2D, test transform
  if node.is_a?(Godot::Node2D)
    node.position = Godot::Vector2.new(120.0, 240.0)
    TestFramework.assert_approx_eq node.position.x, 120.0_f32
    TestFramework.assert_approx_eq node.position.y, 240.0_f32

    node.rotation = 1.5708_f32
    TestFramework.assert_approx_eq node.rotation, 1.5708_f32, 0.001

    node.scale = Godot::Vector2.new(2.0, 2.0)
    TestFramework.assert_approx_eq node.scale.x, 2.0_f32
    TestFramework.assert_approx_eq node.scale.y, 2.0_f32
  else
    # Standalone Node2D test
    n = Godot::Node2D.new
    n.position = Godot::Vector2.new(50.0, 60.0)
    TestFramework.assert_approx_eq n.position.x, 50.0_f32
  end
end

test_2d "get_node retrieves existing child and nested path" do |node|
  # Look for ToolTester2D child
  target = node.find_child("ToolTester2D") || node
  if child2d = target.get_node?("Child2D")
    TestFramework.assert_not_nil child2d
    TestFramework.assert_eq child2d.name, "Child2D"

    # Nested path
    if marker = target.get_node?("Child2D/Marker2D")
      TestFramework.assert_not_nil marker
      TestFramework.assert_eq marker.name, "Marker2D"
    end
  end
end

test_2d "get_node? returns nil for non-existent node" do |node|
  missing = node.get_node?("DefinitelyNonExistentNode12345")
  TestFramework.assert_nil missing
end

test_2d "get_node raises exception when node is not found" do |node|
  caught = false
  begin
    node.get_node("GhostNode_Should_Fail_987")
  rescue ex : Exception
    caught = true
  end
  TestFramework.assert_true caught, "get_node should raise when node does not exist"
end

test_2d "get_node_as casts to Crystal node class" do |node|
  target = node.find_child("ToolTester2D") || node
  if target.get_node?("Child2D")
    casted = target.get_node_as(Godot::Node2D, "Child2D")
    TestFramework.assert_not_nil casted
    TestFramework.assert_true casted.is_a?(Godot::Node2D)
  end
end

test_2d "find_child locates node anywhere in subtree" do |node|
  found = node.find_child("Marker2D")
  TestFramework.assert_not_nil found
  TestFramework.assert_eq found.not_nil!.name, "Marker2D"
end

# =============================================================================
# Test Suite 3: 3D Nodes, Spatial Transforms & CharacterBody3D
# =============================================================================

test_3d "Node3D position, rotation, and scale" do |node|
  if node.is_a?(Godot::Node3D)
    node.position = Godot::Vector3.new(10.0, 20.0, 30.0)
    TestFramework.assert_approx_eq node.position.x, 10.0_f32
    TestFramework.assert_approx_eq node.position.y, 20.0_f32
    TestFramework.assert_approx_eq node.position.z, 30.0_f32

    node.scale = Godot::Vector3.new(3.0, 3.0, 3.0)
    TestFramework.assert_approx_eq node.scale.x, 3.0_f32
  else
    n = Godot::Node3D.new
    n.position = Godot::Vector3.new(1.0, 2.0, 3.0)
    TestFramework.assert_approx_eq n.position.x, 1.0_f32
  end
end

test_3d "get_node retrieves existing 3D child and nested path" do |node|
  target = node.find_child("ToolTester3D") || node
  if child3d = target.get_node?("Child3D")
    TestFramework.assert_not_nil child3d
    TestFramework.assert_eq child3d.name, "Child3D"

    if marker = target.get_node?("Child3D/Marker3D")
      TestFramework.assert_not_nil marker
      TestFramework.assert_eq marker.name, "Marker3D"
    end
  end
end

test_3d "CharacterBody3D velocity and is_on_floor" do
  cb = Godot::CharacterBody3D.new
  cb.velocity = Godot::Vector3.new(0.0, -9.8, 5.0)
  TestFramework.assert_approx_eq cb.velocity.y, -9.8_f32
  TestFramework.assert_approx_eq cb.velocity.z, 5.0_f32
end

# =============================================================================
# Test Suite 4: Annotations, Getters & Setters
# =============================================================================

test_prop "Export Property Getters and Setters round-trip" do
  target = PropertyTestTarget.new

  target.float32_val = 45.67_f32
  TestFramework.assert_approx_eq target.float32_val, 45.67_f32

  target.float64_val = 123.456789
  TestFramework.assert_approx_eq target.float64_val, 123.456789

  target.int32_val = 999
  TestFramework.assert_eq target.int32_val, 999

  target.int64_val = 55555555555_i64
  TestFramework.assert_eq target.int64_val, 55555555555_i64

  target.bool_val = false
  TestFramework.assert_false target.bool_val

  target.string_val = "Updated String"
  TestFramework.assert_eq target.string_val, "Updated String"

  target.vec2_val = Godot::Vector2.new(11.0, 22.0)
  TestFramework.assert_eq target.vec2_val.x, 11.0_f32

  target.vec3_val = Godot::Vector3.new(1.0, 2.0, 3.0)
  TestFramework.assert_eq target.vec3_val.z, 3.0_f32

  target.color_val = Godot::Color::BLUE
  TestFramework.assert_approx_eq target.color_val.b, 1.0_f32

  target.rect2_val = Godot::Rect2.new(5.0, 5.0, 50.0, 50.0)
  TestFramework.assert_eq target.rect2_val.size.x, 50.0_f32
end

test_prop "Custom computed getter returns calculated value" do
  target = PropertyTestTarget.new
  TestFramework.assert_approx_eq target.health_percentage, 100.0_f32
end

test_prop "Custom setter clamps input within bounds" do
  target = PropertyTestTarget.new

  target.clamped_health = 150.0_f32
  TestFramework.assert_approx_eq target.clamped_health, 100.0_f32

  target.clamped_health = -25.0_f32
  TestFramework.assert_approx_eq target.clamped_health, 0.0_f32

  target.clamped_health = 75.0_f32
  TestFramework.assert_approx_eq target.clamped_health, 75.0_f32
end

test_prop "Custom setter triggers side-effects" do
  target = PropertyTestTarget.new
  TestFramework.assert_eq target.dirty_trigger, 0

  target.dirty_trigger = 3
  TestFramework.assert_eq target.dirty_trigger, 3

  target.dirty_trigger = 2
  TestFramework.assert_eq target.dirty_trigger, 5
end

test_prop "Custom tool button setter acts as action trigger" do
  target = PropertyTestTarget.new
  TestFramework.assert_false target.tool_button_trigger

  target.tool_button_trigger = true
  TestFramework.assert_true target.tool_button_trigger
end

test_prop "Property hints registered correctly in ClassDB" do
  entry = Godot::ClassRegistry.find("PropertyTestTarget")
  TestFramework.assert_not_nil entry
  props = entry.not_nil!.properties

  # Range hint (hint = 1)
  range_prop = props.find { |p| p.name == "range_hint_prop" }
  TestFramework.assert_not_nil range_prop
  TestFramework.assert_eq range_prop.not_nil!.hint, 1_u32
  TestFramework.assert_eq range_prop.not_nil!.hint_string, "0,100,5"

  # Enum hint (hint = 2)
  enum_prop = props.find { |p| p.name == "enum_hint_prop" }
  TestFramework.assert_not_nil enum_prop
  TestFramework.assert_eq enum_prop.not_nil!.hint, 2_u32
  TestFramework.assert_eq enum_prop.not_nil!.hint_string, "Low,Medium,High"

  # File hint (hint = 13)
  file_prop = props.find { |p| p.name == "file_hint_prop" }
  TestFramework.assert_not_nil file_prop
  TestFramework.assert_eq file_prop.not_nil!.hint, 13_u32

  # Multiline hint (hint = 18)
  multi_prop = props.find { |p| p.name == "multiline_hint_prop" }
  TestFramework.assert_not_nil multi_prop
  TestFramework.assert_eq multi_prop.not_nil!.hint, 18_u32

  # Color no alpha hint (hint = 21)
  color_prop = props.find { |p| p.name == "color_no_alpha_prop" }
  TestFramework.assert_not_nil color_prop
  TestFramework.assert_eq color_prop.not_nil!.hint, 21_u32

  # Tool button hint (hint = 39)
  tool_prop = props.find { |p| p.name == "tool_btn_prop" }
  TestFramework.assert_not_nil tool_prop
  TestFramework.assert_eq tool_prop.not_nil!.hint, 39_u32

  # Storage only (usage = 2)
  storage_prop = props.find { |p| p.name == "storage_only_prop" }
  TestFramework.assert_not_nil storage_prop
  TestFramework.assert_eq storage_prop.not_nil!.usage, 2_u32
end

test_prop "Inspector Grouping annotations registered" do
  entry = Godot::ClassRegistry.find("PropertyTestTarget")
  TestFramework.assert_not_nil entry
  props = entry.not_nil!.properties

  # Category (usage = 128)
  cat = props.find { |p| p.usage == 128_u32 }
  TestFramework.assert_not_nil cat
  TestFramework.assert_eq cat.not_nil!.name, "Stats"

  # Group (usage = 64)
  grp = props.find { |p| p.usage == 64_u32 && p.name == "Movement" }
  TestFramework.assert_not_nil grp

  # Subgroup (usage = 64)
  sub = props.find { |p| p.usage == 64_u32 && p.name == "Air" }
  TestFramework.assert_not_nil sub
end

test_prop "Class-level Tool and Icon annotations registered" do
  entry = Godot::ClassRegistry.find("PropertyTestTarget")
  TestFramework.assert_not_nil entry
  TestFramework.assert_true entry.not_nil!.is_tool
  TestFramework.assert_eq entry.not_nil!.icon_path, "res://addons/crystal_integration/crystal.gdextension"

  # Check ToolTester2D is marked as tool
  tool2d_entry = Godot::ClassRegistry.find("ToolTester2D")
  TestFramework.assert_not_nil tool2d_entry
  TestFramework.assert_true tool2d_entry.not_nil!.is_tool
end

test_prop "Signal registration and type-safe emission" do
  target = PropertyTestTarget.new
  entry = Godot::ClassRegistry.find("PropertyTestTarget")
  TestFramework.assert_not_nil entry
  sig = entry.not_nil!.signals.find { |s| s.name == "test_event_fired" }
  TestFramework.assert_not_nil sig
  TestFramework.assert_eq sig.not_nil!.args.size, 1

  # Test type-safe emission helper
  target.emit_test_event_fired(100)
end
