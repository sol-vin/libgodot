# =============================================================================
# LibGodot Test Suite: Ergonomic Macros & DSL Enhancements
# =============================================================================

# Test class exercising declarative group, onready, and unique_node macros
node GroupDslTestNode < Godot::Node do
  group "enemies", "flammable"

  signal battle_started
  signal score_updated(points : Int32, multiplier : Float32)

  onready auto_child, Godot::Node
  onready explicit_child, Godot::Node, "CustomPath"
  unique_node hud_panel, Godot::Node
  unique_node custom_panel, Godot::Node, "MyPanel"

  property method_called_by_symbol : Bool = false

  def trigger_method : Void
    @method_called_by_symbol = true
  end
end

test_macros_dsl "Type-safe signal listeners with converted arguments (on_<signal>)" do
  target = PropertyTestTarget.new
  received_code = 0
  received_label = ""
  received_ratio = 0.0_f64
  listener_invoked = false

  # Type-safe listener auto-converts Array(String) into Int32, String, Float64
  target.on_multi_arg_event do |code, label, ratio|
    received_code = code
    received_label = label
    received_ratio = ratio
    listener_invoked = true
  end

  target.emit_multi_arg_event(404, "Not Found", 3.14)

  TestFramework.assert_true listener_invoked, "on_multi_arg_event callback should be invoked"
  TestFramework.assert_eq received_code, 404
  TestFramework.assert_eq received_label, "Not Found"
  TestFramework.assert_true (received_ratio - 3.14).abs < 0.001

  target.disconnect("multi_arg_event")
end

test_macros_dsl "Parameterless type-safe signal listeners (on_<signal>)" do
  target = GroupDslTestNode.new
  called = false

  target.on_battle_started do
    called = true
  end

  target.emit_battle_started
  TestFramework.assert_true called, "on_battle_started should trigger with zero-argument block"
  target.disconnect("battle_started")
end

test_macros_dsl "One-shot type-safe signal listener (on_<signal>_once)" do
  target = PropertyTestTarget.new
  invocation_count = 0

  target.on_test_event_fired_once do |_val|
    invocation_count += 1
  end

  # Emit multiple times
  target.emit_test_event_fired(1)
  target.emit_test_event_fired(2)
  target.emit_test_event_fired(3)

  TestFramework.assert_eq invocation_count, 1, "on_<signal>_once should trigger exactly once"
end

test_macros_dsl "BoundSignal#connect_one_shot automatically disconnects" do
  target = PropertyTestTarget.new
  invocation_count = 0

  target.test_event_fired.connect_one_shot do |_args|
    invocation_count += 1
  end

  target.test_event_fired.emit(10)
  target.test_event_fired.emit(20)

  TestFramework.assert_eq invocation_count, 1, "connect_one_shot should trigger only once"
end

test_macros_dsl "Signal connecting to method symbol on target object" do
  emitter = GroupDslTestNode.new
  listener = GroupDslTestNode.new

  TestFramework.assert_false listener.method_called_by_symbol

  emitter.battle_started.connect(listener, :trigger_method)
  emitter.emit_battle_started

  TestFramework.assert_true listener.method_called_by_symbol, "Signal connected via method symbol should invoke method on target"
  emitter.disconnect("battle_started")
  emitter.destroy
  listener.destroy
end

test_macros_dsl "Signal introspection: has_signal? and signal_connection_count" do
  target = PropertyTestTarget.new

  TestFramework.assert_true target.has_signal?("test_event_fired")
  TestFramework.assert_true target.has_signal?("multi_arg_event")
  TestFramework.assert_false target.has_signal?("ghost_non_existent_signal")

  TestFramework.assert_eq target.signal_connection_count("test_event_fired"), 0

  sub = target.test_event_fired.connect { |_| }
  TestFramework.assert_eq target.signal_connection_count("test_event_fired"), 1

  target.disconnect("test_event_fired")
  TestFramework.assert_eq target.signal_connection_count("test_event_fired"), 0
end

test_macros_dsl "Declarative class-level group macro and in_group? predicate" do
  node = GroupDslTestNode.new

  # Manually trigger _ready dispatch for unparented test node
  node._godot_call_virtual("_ready", 0.0)

  TestFramework.assert_true node.in_group?("enemies"), "Node should be added to 'enemies' group via group macro"
  TestFramework.assert_true node.in_group?("flammable"), "Node should be added to 'flammable' group via group macro"
  TestFramework.assert_false node.in_group?("allies"), "Node should not be in unassigned group"
  node.destroy
end

test_macros_dsl "Hierarchy cast helpers on Node (get_parent_as, find_child_as, get_unique_node_as)" do
  parent = Godot.create(Godot::Node2D)
  child = Godot.create(Godot::Node2D)
  child.name = "MyUniqueChild"
  parent.add_child(child)

  # get_parent_as
  casted_parent = child.get_parent_as(Godot::Node2D)
  TestFramework.assert_not_nil casted_parent
  TestFramework.assert_true casted_parent.is_a?(Godot::Node2D)

  # find_child_as
  found_child = parent.find_child_as(Godot::Node2D, "MyUniqueChild")
  TestFramework.assert_not_nil found_child
  TestFramework.assert_true found_child.is_a?(Godot::Node2D)

  # Negative search returns nil without crashing
  not_found = parent.find_child_as(Godot::Node2D, "NonExistentChild_999")
  TestFramework.assert_nil not_found

  # get_unique_node_as
  unique_child = parent.get_unique_node_as(Godot::Node2D, "MyUniqueChild")
  TestFramework.assert_not_nil unique_child

  parent.destroy
end

test_macros_dsl "Singletons accessors on Godot module" do
  TestFramework.assert_not_nil Godot.input
  TestFramework.assert_not_nil Godot.engine
  TestFramework.assert_not_nil Godot.os
  TestFramework.assert_not_nil Godot.project_settings
  TestFramework.assert_not_nil Godot.display_server
  TestFramework.assert_not_nil Godot.audio_server
  TestFramework.assert_not_nil Godot.performance

  # Singleton instances should be idempotent
  TestFramework.assert_eq Godot.input.object_id, Godot.input.object_id
  TestFramework.assert_eq Godot.engine.object_id, Godot.engine.object_id
end

test_macros_dsl "Input convenience query helpers" do
  # These methods shouldn't crash when querying unconfigured actions
  pressed = Godot::Input.action_pressed?("ui_accept")
  just_pressed = Godot::Input.action_just_pressed?("ui_accept")
  just_released = Godot::Input.action_just_released?("ui_accept")
  axis_val = Godot::Input.axis("ui_left", "ui_right")

  TestFramework.assert_true pressed.is_a?(Bool)
  TestFramework.assert_true just_pressed.is_a?(Bool)
  TestFramework.assert_true just_released.is_a?(Bool)
  TestFramework.assert_true axis_val.is_a?(Float32)
end

test_macros_dsl "Top-level math constructor helpers: vec2 and vec3" do
  v2 = vec2(15.5, -42.0)
  TestFramework.assert_true v2.is_a?(Vector2)
  TestFramework.assert_true (v2.x - 15.5_f32).abs < 0.001
  TestFramework.assert_true (v2.y - (-42.0_f32)).abs < 0.001

  v3 = vec3(1.0, 2.5, -9.9)
  TestFramework.assert_true v3.is_a?(Vector3)
  TestFramework.assert_true (v3.x - 1.0_f32).abs < 0.001
  TestFramework.assert_true (v3.y - 2.5_f32).abs < 0.001
  TestFramework.assert_true (v3.z - (-9.9_f32)).abs < 0.001
end
