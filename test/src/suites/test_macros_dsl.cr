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

enum DslTestRole
  Knight = 0
  Wizard = 1
  Thief  = 5
end

node EnumDslTestNode < Godot::Node do
  @[ExportEnum(DslTestRole)]
  property role : DslTestRole = DslTestRole::Knight

  @[ExportEnum(DslTestRole)]
  property role_id : Int32 = 0

  signal role_changed(new_role : Int32)

  def advance_role(next_val : Int32) : Int32
    @role = DslTestRole.from_value?(next_val.to_i64) || @role
    emit_role_changed(@role.to_i64.to_i32)
    @role.to_i64.to_i32
  end
end

node LifecycleMacroTestNode < Godot::Node do
  property enter_tree_called : Bool = false
  property exit_tree_called : Bool = false

  def _enter_tree : Void
    @enter_tree_called = true
  end

  def _exit_tree : Void
    @exit_tree_called = true
  end
end

@[Flags]
enum DslTestSkills
  Melee   = 1
  Magic   = 2
  Archery = 4
end

node ExhaustiveExportMacroNode < Godot::Node do
  @[ExportFlags(DslTestSkills)]
  property skills : DslTestSkills = DslTestSkills::Melee

  @[ExportRange(0.0..100.0, step: 2.5)]
  property range_val : Float64 = 50.0

  @[ExportFile("*.tres")]
  property file_val : String = "res://item.tres"

  @[ExportDir]
  property dir_val : String = "res://scenes"

  @[ExportMultiline]
  property multiline_val : String = "Hello\nWorld"

  @[ExportPlaceholder("Enter name...")]
  property placeholder_val : String = ""

  @[ExportColorNoAlpha]
  property opaque_color : Godot::Color = Godot::Color.new(1.0, 0.0, 0.0, 1.0)

  @[ExportExpEasing]
  property easing_val : Float32 = 1.5_f32

  @[ExportNodePath("Camera3D")]
  property camera_path : Godot::NodePath = Godot::NodePath.new("Camera3D")

  @[ExportStorage]
  property hidden_storage : Int32 = 42

  @[ExportFlags2DRender]
  property render2d_flags : Int32 = 1

  @[ExportFlags2DPhysics]
  property physics2d_flags : Int32 = 2

  @[ExportFlags3DPhysics]
  property physics3d_flags : Int32 = 4

  @[ExportGroup("Combat", prefix: "combat_")]
  property combat_power : Int32 = 100

  @[ExportSubgroup("Defenses", prefix: "combat_def_")]
  property combat_def_armor : Int32 = 50
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

test_macros_dsl "Direct Crystal enum property binding and property dispatch" do
  node = EnumDslTestNode.new
  TestFramework.assert_eq node.role, DslTestRole::Knight
  TestFramework.assert_eq node.role_id, 0

  # Update via direct Crystal setter
  node.role = DslTestRole::Wizard
  TestFramework.assert_eq node.role, DslTestRole::Wizard

  # Dispatch set property as Godot does via pointer
  val_thief = 5_i64
  node._godot_set_property("role", pointerof(val_thief).as(Void*))
  TestFramework.assert_eq node.role, DslTestRole::Thief

  # Dispatch get property
  val_out = 0_i64
  node._godot_get_property("role", pointerof(val_out).as(Void*))
  TestFramework.assert_eq val_out, 5_i64

  node.destroy
end

test_macros_dsl "Transferring Crystal enum node to GDScript: reading, setting, and inspecting property metadata" do
  enum_node = Godot.create(EnumDslTestNode)
  root.add_child(enum_node)

  scene = Godot.load_as(Godot::PackedScene, "res://scenes/test_gdscript_interop.tscn")
  controller = scene.instantiate
  root.add_child(controller)

  # GDScript reads initial enum value (Knight = 0)
  val = controller.call_i64("inspect_enum_property", enum_node, "role")
  TestFramework.assert_eq val, 0_i64, "GDScript should read enum value 0 for Knight"

  # GDScript checks PROPERTY_HINT_ENUM
  hint = controller.call_i64("get_enum_property_hint", enum_node, "role")
  TestFramework.assert_eq hint, 2_i64, "GDScript should identify PROPERTY_HINT_ENUM (2)"

  # GDScript checks enum hint_string format
  hint_str = controller.call_str("get_enum_property_hint_string", enum_node, "role")
  TestFramework.assert_true hint_str.includes?("Knight:0"), "Hint string must include Knight:0"
  TestFramework.assert_true hint_str.includes?("Wizard:1"), "Hint string must include Wizard:1"
  TestFramework.assert_true hint_str.includes?("Thief:5"), "Hint string must include Thief:5"

  # GDScript writes new enum value (Thief = 5)
  success = controller.call_bool("set_enum_property", enum_node, "role", 5_i64)
  TestFramework.assert_true success, "GDScript set_enum_property should succeed"
  TestFramework.assert_eq enum_node.role, DslTestRole::Thief, "Crystal node must reflect updated enum state"

  # Test ClassDB integer constant registration
  classdb_val = controller.call_i64("query_classdb_enum_constant", "EnumDslTestNode", "Thief")
  TestFramework.assert_eq classdb_val, 5_i64, "ClassDB should return 5 for EnumDslTestNode.Thief"

  enum_node.queue_free
  controller.queue_free
end

test_macros_dsl "Exhaustive @Export property annotation metadata and hint validation in ClassDB" do
  entry = Godot::ClassRegistry.find("ExhaustiveExportMacroNode")
  TestFramework.assert_not_nil entry, "ExhaustiveExportMacroNode must be registered"
  props = entry.not_nil!.properties

  # Range
  p_range = props.find { |p| p.name == "range_val" }
  TestFramework.assert_not_nil p_range
  TestFramework.assert_eq p_range.not_nil!.hint, 1_u32 # PROPERTY_HINT_RANGE
  TestFramework.assert_eq p_range.not_nil!.hint_string, "0.0,100.0,2.5"

  # File
  p_file = props.find { |p| p.name == "file_val" }
  TestFramework.assert_not_nil p_file
  TestFramework.assert_eq p_file.not_nil!.hint, 13_u32 # PROPERTY_HINT_FILE
  TestFramework.assert_eq p_file.not_nil!.hint_string, "*.tres"

  # Dir
  p_dir = props.find { |p| p.name == "dir_val" }
  TestFramework.assert_not_nil p_dir
  TestFramework.assert_eq p_dir.not_nil!.hint, 14_u32 # PROPERTY_HINT_DIR

  # Multiline
  p_multi = props.find { |p| p.name == "multiline_val" }
  TestFramework.assert_not_nil p_multi
  TestFramework.assert_eq p_multi.not_nil!.hint, 18_u32 # PROPERTY_HINT_MULTILINE_TEXT

  # Placeholder
  p_place = props.find { |p| p.name == "placeholder_val" }
  TestFramework.assert_not_nil p_place
  TestFramework.assert_eq p_place.not_nil!.hint, 20_u32 # PROPERTY_HINT_PLACEHOLDER_TEXT
  TestFramework.assert_eq p_place.not_nil!.hint_string, "Enter name..."

  # ColorNoAlpha
  p_color = props.find { |p| p.name == "opaque_color" }
  TestFramework.assert_not_nil p_color
  TestFramework.assert_eq p_color.not_nil!.hint, 21_u32 # PROPERTY_HINT_COLOR_NO_ALPHA

  # ExpEasing
  p_ease = props.find { |p| p.name == "easing_val" }
  TestFramework.assert_not_nil p_ease
  TestFramework.assert_eq p_ease.not_nil!.hint, 4_u32 # PROPERTY_HINT_EXP_EASING

  # NodePath
  p_npath = props.find { |p| p.name == "camera_path" }
  TestFramework.assert_not_nil p_npath
  TestFramework.assert_eq p_npath.not_nil!.hint, 26_u32 # PROPERTY_HINT_NODE_PATH_VALID_TYPES
  TestFramework.assert_eq p_npath.not_nil!.hint_string, "Camera3D"

  # Storage
  p_stor = props.find { |p| p.name == "hidden_storage" }
  TestFramework.assert_not_nil p_stor
  TestFramework.assert_eq p_stor.not_nil!.usage, 2_u32 # PROPERTY_USAGE_STORAGE

  # Flags 2D/3D Layers
  p_r2d = props.find { |p| p.name == "render2d_flags" }
  TestFramework.assert_not_nil p_r2d
  TestFramework.assert_eq p_r2d.not_nil!.hint, 7_u32 # PROPERTY_HINT_LAYERS_2D_RENDER

  p_p2d = props.find { |p| p.name == "physics2d_flags" }
  TestFramework.assert_not_nil p_p2d
  TestFramework.assert_eq p_p2d.not_nil!.hint, 8_u32 # PROPERTY_HINT_LAYERS_2D_PHYSICS

  p_p3d = props.find { |p| p.name == "physics3d_flags" }
  TestFramework.assert_not_nil p_p3d
  TestFramework.assert_eq p_p3d.not_nil!.hint, 11_u32 # PROPERTY_HINT_LAYERS_3D_PHYSICS

  # Bitflags enum
  p_flags = props.find { |p| p.name == "skills" }
  TestFramework.assert_not_nil p_flags
  TestFramework.assert_eq p_flags.not_nil!.hint, 6_u32 # PROPERTY_HINT_FLAGS
  TestFramework.assert_eq p_flags.not_nil!.hint_string, "Melee,Magic,Archery"

  # Grouping
  grp = props.find { |p| p.usage == 64_u32 && p.name == "Combat" }
  TestFramework.assert_not_nil grp

  sub = props.find { |p| p.usage == 256_u32 && p.name == "Defenses" }
  TestFramework.assert_not_nil sub
end

test_macros_dsl "Lifecycle hooks: _enter_tree and _exit_tree callbacks" do
  node = Godot.create(LifecycleMacroTestNode)
  TestFramework.assert_false node.enter_tree_called
  TestFramework.assert_false node.exit_tree_called

  root.add_child(node)
  node._godot_call_virtual("_enter_tree", 0.0)
  TestFramework.assert_true node.enter_tree_called, "_enter_tree should be invoked"

  root.remove_child(node)
  node._godot_call_virtual("_exit_tree", 0.0)
  TestFramework.assert_true node.exit_tree_called, "_exit_tree should be invoked"

  node.destroy
end


