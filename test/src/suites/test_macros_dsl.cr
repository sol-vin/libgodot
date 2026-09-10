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

node TypedSignalTestEmitterNode < Godot::Node do
  signal status_ping
  signal single_score(score : Int32)
  signal level_scored(score : Int32, bonus : Float32, title : String)
  signal transform_updated(pos : Godot::Vector2, tint : Godot::Color)
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

alias MacroTestCameraAlias = Godot::Camera3D
alias MacroTestMultiCameraUnionAlias = Godot::Camera3D | Godot::Camera2D

node ComprehensiveGroupingTestNode < Godot::Node do
  @[Export]
  property pre_group_stat : Int32 = 10

  export_category "Combat Systems" do
    export_group "Attributes", prefix: "attr_" do
      @[ExportRange(0.0..100.0, step: 1.0)]
      property attr_health : Float64 = 100.0

      @[ExportEnum(DslTestRole)]
      property attr_role : DslTestRole = DslTestRole::Knight

      @[ExportFlags(DslTestSkills)]
      property attr_skills : DslTestSkills = DslTestSkills::Melee

      @[ExportFile("*.tres")]
      property attr_config : String = "res://config.tres"

      @[ExportMultiline]
      property attr_bio : String = "Hero character bio"

      @[ExportColorNoAlpha]
      property attr_tint : Godot::Color = Godot::Color.new(1.0, 1.0, 1.0, 1.0)

      @[ExportExpEasing]
      property attr_curve : Float32 = 1.0_f32

      @[ExportStorage]
      property attr_cache_id : Int32 = 99

      export_subgroup "Defenses", prefix: "attr_def_" do
        @[Export]
        property attr_def_armor : Int32 = 25

        @[Export]
        property attr_def_shield : Float32 = 50.0_f32
      end

      # Post-subgroup property inside the "Attributes" group
      @[Export]
      property attr_speed : Float32 = 7.5_f32
    end

    # Post-group property inside "Combat Systems" category (outside Attributes group)
    @[Export]
    property category_unscoped : String = "standalone"

    # ExportNodePath variants with typed classes, unions, aliases, and strings
    @[ExportNodePath(Godot::Camera3D)]
    property cam_single : Godot::NodePath = Godot::NodePath.new("CamSingle")

    @[ExportNodePath(Godot::Camera3D | Godot::Camera2D)]
    property cam_union : Godot::NodePath = Godot::NodePath.new("CamUnion")

    @[ExportNodePath(MacroTestCameraAlias)]
    property cam_alias : Godot::NodePath = Godot::NodePath.new("CamAlias")

    @[ExportNodePath(MacroTestMultiCameraUnionAlias)]
    property cam_union_alias : Godot::NodePath = Godot::NodePath.new("CamUnionAlias")

    @[ExportNodePath("Camera3D", "Camera2D")]
    property cam_strings : Godot::NodePath = Godot::NodePath.new("CamStrings")
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

  parent.remove_child(child)
  child.destroy
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

  root.remove_child(enum_node)
  root.remove_child(controller)
  enum_node.destroy
  controller.destroy
  scene.destroy
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

test_macros_dsl "Comprehensive grouping DSL: category, group, subgroup boundaries and sentinels in ClassRegistry" do
  entry = Godot::ClassRegistry.find("ComprehensiveGroupingTestNode")
  TestFramework.assert_not_nil entry, "ComprehensiveGroupingTestNode must be registered in ClassRegistry"
  props = entry.not_nil!.properties

  # Verify initial ungrouped property
  p_pre = props.find { |p| p.name == "pre_group_stat" }
  TestFramework.assert_not_nil p_pre
  TestFramework.assert_eq p_pre.not_nil!.usage, 6_u32

  # Category "Combat Systems"
  p_cat = props.find { |p| p.usage == 128_u32 && p.name == "Combat Systems" }
  TestFramework.assert_not_nil p_cat, "Category 'Combat Systems' must be registered with usage 128"

  # Group "Attributes"
  p_grp = props.find { |p| p.usage == 64_u32 && p.name == "Attributes" }
  TestFramework.assert_not_nil p_grp, "Group 'Attributes' must be registered with usage 64"
  TestFramework.assert_eq p_grp.not_nil!.hint_string, "attr_"

  # Subgroup "Defenses"
  p_sub = props.find { |p| p.usage == 256_u32 && p.name == "Defenses" }
  TestFramework.assert_not_nil p_sub, "Subgroup 'Defenses' must be registered with usage 256"
  TestFramework.assert_eq p_sub.not_nil!.hint_string, "attr_def_"

  # Verify subgroup boundary closure sentinel (name: "", usage: 256)
  sub_sentinels = props.select { |p| p.usage == 256_u32 && p.name == "" }
  TestFramework.assert_eq sub_sentinels.size, 1, "Subgroup boundary must emit an empty sentinel with usage 256"

  # Verify group boundary closure sentinel (name: "", usage: 64)
  grp_sentinels = props.select { |p| p.usage == 64_u32 && p.name == "" }
  TestFramework.assert_eq grp_sentinels.size, 1, "Group boundary must emit an empty sentinel with usage 64"

  # Verify relative ordering across boundaries:
  sub_idx = props.index { |p| p.usage == 256_u32 && p.name == "Defenses" }.not_nil!
  armor_idx = props.index { |p| p.name == "attr_def_armor" }.not_nil!
  sub_sentinel_idx = props.index { |p| p.usage == 256_u32 && p.name == "" }.not_nil!
  speed_idx = props.index { |p| p.name == "attr_speed" }.not_nil!
  grp_sentinel_idx = props.index { |p| p.usage == 64_u32 && p.name == "" }.not_nil!
  unscoped_idx = props.index { |p| p.name == "category_unscoped" }.not_nil!

  TestFramework.assert_true sub_idx < armor_idx, "Defenses subgroup must precede its properties"
  TestFramework.assert_true armor_idx < sub_sentinel_idx, "attr_def_armor must precede subgroup sentinel"
  TestFramework.assert_true sub_sentinel_idx < speed_idx, "attr_speed must follow subgroup sentinel (restored to Attributes group)"
  TestFramework.assert_true speed_idx < grp_sentinel_idx, "attr_speed must precede group sentinel"
  TestFramework.assert_true grp_sentinel_idx < unscoped_idx, "category_unscoped must follow group sentinel (restored to category)"

  # Verify all diverse export types inside group
  p_health = props.find { |p| p.name == "attr_health" }.not_nil!
  TestFramework.assert_eq p_health.hint, 1_u32 # PROPERTY_HINT_RANGE
  TestFramework.assert_eq p_health.hint_string, "0.0,100.0,1.0"

  p_role = props.find { |p| p.name == "attr_role" }.not_nil!
  TestFramework.assert_eq p_role.hint, 2_u32 # PROPERTY_HINT_ENUM

  p_skills = props.find { |p| p.name == "attr_skills" }.not_nil!
  TestFramework.assert_eq p_skills.hint, 6_u32 # PROPERTY_HINT_FLAGS

  p_config = props.find { |p| p.name == "attr_config" }.not_nil!
  TestFramework.assert_eq p_config.hint, 13_u32 # PROPERTY_HINT_FILE

  p_bio = props.find { |p| p.name == "attr_bio" }.not_nil!
  TestFramework.assert_eq p_bio.hint, 18_u32 # PROPERTY_HINT_MULTILINE_TEXT

  p_tint = props.find { |p| p.name == "attr_tint" }.not_nil!
  TestFramework.assert_eq p_tint.hint, 21_u32 # PROPERTY_HINT_COLOR_NO_ALPHA

  p_curve = props.find { |p| p.name == "attr_curve" }.not_nil!
  TestFramework.assert_eq p_curve.hint, 4_u32 # PROPERTY_HINT_EXP_EASING

  p_cache = props.find { |p| p.name == "attr_cache_id" }.not_nil!
  TestFramework.assert_eq p_cache.usage, 2_u32 # PROPERTY_USAGE_STORAGE
end

test_macros_dsl "ExportNodePath type resolution: classes, unions, aliases, and strings" do
  entry = Godot::ClassRegistry.find("ComprehensiveGroupingTestNode").not_nil!
  props = entry.properties


  # Direct Godot class type
  p_single = props.find { |p| p.name == "cam_single" }.not_nil!
  TestFramework.assert_eq p_single.hint, 26_u32 # PROPERTY_HINT_NODE_PATH_VALID_TYPES
  TestFramework.assert_eq p_single.hint_string, "Camera3D"

  # Union of Godot classes
  p_union = props.find { |p| p.name == "cam_union" }.not_nil!
  TestFramework.assert_eq p_union.hint, 26_u32
  TestFramework.assert_eq p_union.hint_string, "Camera3D,Camera2D"

  # Type alias to single class
  p_alias = props.find { |p| p.name == "cam_alias" }.not_nil!
  TestFramework.assert_eq p_alias.hint, 26_u32
  TestFramework.assert_eq p_alias.hint_string, "Camera3D"

  # Type alias to union
  p_union_alias = props.find { |p| p.name == "cam_union_alias" }.not_nil!
  TestFramework.assert_eq p_union_alias.hint, 26_u32
  TestFramework.assert_eq p_union_alias.hint_string, "Camera3D,Camera2D"

  # Classical comma-separated strings
  p_strings = props.find { |p| p.name == "cam_strings" }.not_nil!
  TestFramework.assert_eq p_strings.hint, 26_u32
  TestFramework.assert_eq p_strings.hint_string, "Camera3D,Camera2D"
end

test_macros_dsl "Runtime property mutation and state integrity on ComprehensiveGroupingTestNode" do
  node = Godot.create(ComprehensiveGroupingTestNode)
  root.add_child(node)

  # Verify properties can be read and set at runtime
  TestFramework.assert_eq node.attr_def_armor, 25
  node.attr_def_armor = 80
  TestFramework.assert_eq node.attr_def_armor, 80

  TestFramework.assert_eq node.category_unscoped, "standalone"
  node.category_unscoped = "updated"
  TestFramework.assert_eq node.category_unscoped, "updated"

  TestFramework.assert_eq node.attr_speed, 7.5_f32
  node.attr_speed = 12.0_f32
  TestFramework.assert_eq node.attr_speed, 12.0_f32

  root.remove_child(node)
  node.destroy
end

test_macros_dsl "GDScript interop: inspecting grouped node properties and ExportNodePath hints" do
  node = Godot.create(ComprehensiveGroupingTestNode)
  root.add_child(node)

  scene = Godot.load_as(Godot::PackedScene, "res://scenes/test_gdscript_interop.tscn")
  controller = scene.instantiate
  root.add_child(controller)

  # Inspect crystal node
  status = controller.call_str("inspect_crystal_node", node)
  TestFramework.assert_true status.starts_with?("OK:"), "GDScript must inspect ComprehensiveGroupingTestNode"

  # Verify GDScript can inspect ExportNodePath hints using helper
  cam_hint = controller.call_i64("get_enum_property_hint", node, "cam_union")
  TestFramework.assert_eq cam_hint, 26_i64, "cam_union hint must be PROPERTY_HINT_NODE_PATH_VALID_TYPES (26)"

  cam_hint_str = controller.call_str("get_enum_property_hint_string", node, "cam_union")
  TestFramework.assert_eq cam_hint_str, "Camera3D,Camera2D", "cam_union hint_string must be Camera3D,Camera2D"

  alias_hint_str = controller.call_str("get_enum_property_hint_string", node, "cam_union_alias")
  TestFramework.assert_eq alias_hint_str, "Camera3D,Camera2D", "cam_union_alias hint_string must resolve alias to Camera3D,Camera2D"

  # Verify GDScript can read and write grouped properties
  armor_val = controller.call_i64("inspect_enum_property", node, "attr_def_armor")
  TestFramework.assert_eq armor_val, 25_i64, "GDScript should read initial attr_def_armor value 25"

  write_ok = controller.call_bool("set_enum_property", node, "attr_def_armor", 95_i64)
  TestFramework.assert_true write_ok, "GDScript set_enum_property should succeed for attr_def_armor"
  TestFramework.assert_eq node.attr_def_armor, 95, "Crystal node must reflect updated attr_def_armor"

  root.remove_child(node)
  root.remove_child(controller)
  node.destroy
  controller.destroy
  scene.destroy
end

test_macros_dsl "TypedSignal connect and automatic unboxing of primitive and math types" do
  node = Godot.create(TypedSignalTestEmitterNode)
  root.add_child(node)

  # 1. Zero-arg TypedSignal
  ping_count = 0
  sub_ping = node.status_ping.connect do
    ping_count += 1
  end
  node.emit_status_ping
  node.emit_status_ping
  TestFramework.assert_eq ping_count, 2, "Zero-arg TypedSignal connect should fire on each emit"
  sub_ping.unsubscribe

  # 2. Multi-arg TypedSignal with primitives (Int32, Float32, String)
  recv_score = 0
  recv_bonus = 0.0_f32
  recv_title = ""
  sub_scored = node.level_scored.connect do |score, bonus, title|
    recv_score = score
    recv_bonus = bonus
    recv_title = title
  end
  node.emit_level_scored(100, 2.5_f32, "Stage Complete")
  TestFramework.assert_eq recv_score, 100, "Primitive Int32 should be automatically unboxed"
  TestFramework.assert_approx_eq recv_bonus, 2.5_f32, 0.001, "Primitive Float32 should be automatically unboxed"
  TestFramework.assert_eq recv_title, "Stage Complete", "String argument should be unboxed"
  sub_scored.unsubscribe

  # 3. Multi-arg TypedSignal with Godot math structs (Vector2, Color)
  recv_pos = Godot::Vector2.new(0.0_f32, 0.0_f32)
  recv_tint = Godot::Color.new(0.0_f32, 0.0_f32, 0.0_f32, 0.0_f32)
  sub_transform = node.transform_updated.connect do |pos, tint|
    recv_pos = pos
    recv_tint = tint
  end
  node.emit_transform_updated(Godot::Vector2.new(42.0_f32, 84.0_f32), Godot::Color.new(0.2_f32, 0.4_f32, 0.6_f32, 1.0_f32))
  TestFramework.assert_approx_eq recv_pos.x, 42.0_f32, 0.001, "Vector2.x should match emitted value"
  TestFramework.assert_approx_eq recv_pos.y, 84.0_f32, 0.001, "Vector2.y should match emitted value"
  TestFramework.assert_approx_eq recv_tint.r, 0.2_f32, 0.001, "Color.r should match emitted value"
  TestFramework.assert_approx_eq recv_tint.g, 0.4_f32, 0.001, "Color.g should match emitted value"
  TestFramework.assert_approx_eq recv_tint.b, 0.6_f32, 0.001, "Color.b should match emitted value"
  sub_transform.unsubscribe

  root.remove_child(node)
  node.destroy
end

test_macros_dsl "TypedSignal ConnectFlags::OneShot and flag bitwise operations" do
  node = Godot.create(TypedSignalTestEmitterNode)
  root.add_child(node)

  # OneShot flag test
  one_shot_count = 0
  node.status_ping.connect(flags: Godot::ConnectFlags::OneShot) do
    one_shot_count += 1
  end
  node.emit_status_ping
  node.emit_status_ping
  node.emit_status_ping
  TestFramework.assert_eq one_shot_count, 1, "OneShot connection should fire exactly once and auto-unsubscribe"

  # Bitwise flags composition test
  combo_flags = Godot::ConnectFlags::Persist | Godot::ConnectFlags::OneShot
  TestFramework.assert_true combo_flags.includes?(Godot::ConnectFlags::Persist), "Combined flags should include Persist"
  TestFramework.assert_true combo_flags.includes?(Godot::ConnectFlags::OneShot), "Combined flags should include OneShot"
  TestFramework.assert_false combo_flags.includes?(Godot::ConnectFlags::Deferred), "Combined flags should not include Deferred"

  combo_count = 0
  node.single_score.connect(flags: combo_flags) do |val|
    combo_count += val
  end
  node.emit_single_score(50)
  node.emit_single_score(50)
  TestFramework.assert_eq combo_count, 50, "Combined flags with OneShot should fire only once"

  # Verify Deferred flag bitwise configuration and connection
  def_flags = Godot::ConnectFlags::Deferred | Godot::ConnectFlags::OneShot
  TestFramework.assert_true def_flags.includes?(Godot::ConnectFlags::Deferred), "Deferred flag bitwise configuration valid"
  node.single_score.connect(flags: def_flags) do |_|
    # Deferred callable accepted by Godot engine message queue
  end

  root.remove_child(node)
  node.destroy
end

test_macros_dsl "TypedSignal cooperative await with typed return values" do
  node = Godot.create(TypedSignalTestEmitterNode)
  root.add_child(node)

  # 1. Zero-arg await returns nil
  nil_res = "initial"
  Godot.spawn do
    res = node.status_ping.await
    nil_res = res.nil? ? "was_nil" : "was_not_nil"
  end
  3.times { Fiber.yield }
  node.emit_status_ping
  5.times { Fiber.yield }
  TestFramework.assert_eq nil_res, "was_nil", "Zero-arg await should return nil"

  # 2. Single-arg await returns T directly (Int32)
  single_res = 0
  Godot.spawn do
    single_res = node.single_score.await
  end
  3.times { Fiber.yield }
  node.emit_single_score(999)
  5.times { Fiber.yield }
  TestFramework.assert_eq single_res, 999, "Single-arg await should return unboxed T directly"

  # 3. Multi-arg await returns Tuple(*T)
  scored_score = 0
  scored_bonus = 0.0_f32
  scored_title = ""
  Godot.spawn do
    score, bonus, title = node.level_scored.await
    scored_score = score
    scored_bonus = bonus
    scored_title = title
  end
  3.times { Fiber.yield }
  node.emit_level_scored(555, 3.25_f32, "Victory")
  5.times { Fiber.yield }
  TestFramework.assert_eq scored_score, 555, "Tuple return should correctly unbox first element (Int32)"
  TestFramework.assert_approx_eq scored_bonus, 3.25_f32, 0.001, "Tuple return should correctly unbox second element (Float32)"
  TestFramework.assert_eq scored_title, "Victory", "Tuple return should correctly unbox third element (String)"

  root.remove_child(node)
  node.destroy
end

