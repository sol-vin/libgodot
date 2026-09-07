# =============================================================================
# LibGodot Test Suite: Lifecycle, Destruction, Dead-Pointer Safety & Leak Auditing
# =============================================================================

macro test_lifecycle(name, &block)
  ::TestFramework::Registry.register("Lifecycle", {{name}}) do |node|
    root = node
    {{block.body}}
  end
end

test_lifecycle "Object creation tracks valid 64-bit instance ID in ObjectDB" do
  obj = Godot.create(Godot::Node2D)
  TestFramework.assert_true obj.alive?
  TestFramework.assert_false obj.destroyed?

  inst_id = obj.instance_id
  TestFramework.assert_true inst_id > 0_u64

  # Query Godot's ObjectDB directly
  TestFramework.assert_true Godot::Object.is_instance_id_valid(inst_id)

  obj.destroy
  TestFramework.assert_true obj.destroyed?
  TestFramework.assert_false Godot::Object.is_instance_id_valid(inst_id)
end

test_lifecycle "Immediate destruction via #destroy invalidates pointer and engine ID" do
  timer = Godot.create(Godot::Timer)
  timer_id = timer.instance_id
  TestFramework.assert_true Godot::Object.is_instance_id_valid(timer_id)

  timer.destroy
  TestFramework.assert_true timer.destroyed?
  TestFramework.assert_false timer.alive?
  TestFramework.assert_false Godot::Object.is_instance_id_valid(timer_id)
end

test_lifecycle "Dead-pointer access raises DisposedObjectError safely instead of segfaulting" do
  dummy = Godot.create(Godot::Node)
  dummy_id = dummy.instance_id
  dummy.destroy

  TestFramework.assert_false dummy.alive?

  caught = false
  begin
    dummy.call("get_name")
  rescue ex : Godot::DisposedObjectError
    caught = true
    TestFramework.assert_eq ex.instance_id, dummy_id
  end
  TestFramework.assert_true caught, "Expected DisposedObjectError when accessing deleted node"
end

test_lifecycle "GDScript destroying node causes Crystal to detect dead pointer and raise DisposedObjectError" do
  scene = Godot.load_as(Godot::PackedScene, "res://scenes/test_gdscript_interop.tscn")
  interop_root = scene.instantiate

  # Create a Crystal worker node
  victim = Godot.create(Godot::Node2D)
  victim.name = "VictimNode"
  victim_id = victim.instance_id
  interop_root.add_child(victim)

  TestFramework.assert_true victim.alive?
  TestFramework.assert_true Godot::Object.is_instance_id_valid(victim_id)

  # Hand node over to GDScript to be freed via target.free()
  freed_by_gd = interop_root.call_bool("destroy_node_from_gdscript", victim)
  TestFramework.assert_true freed_by_gd

  # Engine ObjectDB should reflect deletion immediately
  TestFramework.assert_false Godot::Object.is_instance_id_valid(victim_id)
  TestFramework.assert_false victim.alive?
  TestFramework.assert_true victim.destroyed?

  # Attempting to call methods on the GDScript-freed node safely raises DisposedObjectError
  caught = false
  begin
    victim.call("get_position")
  rescue ex : Godot::DisposedObjectError
    caught = true
  end
  TestFramework.assert_true caught, "Calling GDScript-freed node must raise DisposedObjectError, not segfault"

  interop_root.destroy
end

test_lifecycle "Node hierarchy lifecycle: add_child, reparent, remove_child, and queue_free" do
  parent = Godot.create(Godot::Node2D)
  parent.name = "LifecycleParent"
  child = Godot.create(Godot::Node2D)
  child.name = "LifecycleChild"

  TestFramework.assert_nil child.get_parent?

  parent.add_child(child)
  TestFramework.assert_eq parent.get_child_count, 1_i64
  TestFramework.assert_eq child.get_parent.name, "LifecycleParent"

  parent.remove_child(child)
  TestFramework.assert_eq parent.get_child_count, 0_i64
  TestFramework.assert_nil child.get_parent?

  child.queue_free
  TestFramework.assert_true child.is_queued_for_deletion

  parent.destroy
end

test_lifecycle "RefCounted atomic lifecycle: reference, unreference, and automated deallocation" do
  rc = Godot.create(Godot::RefCounted)
  rc_id = rc.instance_id

  TestFramework.assert_true Godot::Object.is_instance_id_valid(rc_id)
  # Native RefCounted starts with refcount 1
  TestFramework.assert_eq rc.get_reference_count, 1_i64

  # Increment ref count
  rc.reference
  TestFramework.assert_eq rc.get_reference_count, 2_i64

  # Decrement back
  rc.unreference
  TestFramework.assert_eq rc.get_reference_count, 1_i64

  # Final unreference drops refcount to 0, returning true indicating it should be freed
  should_free = rc.unreference
  TestFramework.assert_true should_free
  rc.destroy
  TestFramework.assert_false Godot::Object.is_instance_id_valid(rc_id)
end

test_lifecycle "Quantitative zero-leak verification using Performance monitors and GC.collect" do
  engine = Godot::Bridge.get_singleton("Performance")
  mb_get_monitor = Godot::Bridge.get_method_bind("Performance", "get_monitor", 1943275655_i64)

  # Monitor 9 is OBJECT_NODE_COUNT
  get_node_count = -> {
    arg_val = 9_i64 # Performance::OBJECT_NODE_COUNT
    arg_p = pointerof(arg_val).as(Void*)
    args = [arg_p]
    ret = 0.0_f64
    Godot::Bridge.ptrcall(mb_get_monitor, engine, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
    ret.to_i64
  }

  baseline_nodes = get_node_count.call

  # Spawn 100 nodes in Crystal and attach to SceneTree
  batch = Array(Godot::Node2D).new(100)
  100.times do |i|
    n = Godot.create(Godot::Node2D)
    n.name = "LeakCheckNode_#{i}"
    root.add_child(n)
    batch << n
  end

  # Verify engine object count increased
  active_nodes = get_node_count.call
  TestFramework.assert_true active_nodes >= baseline_nodes + 100_i64

  # Cleanly detach and destroy all 100 nodes
  batch.each do |n|
    root.remove_child(n)
    n.destroy
  end
  batch.clear

  # Trigger Crystal Boehm GC cycle to reclaim wrappers
  GC.collect

  # Verify node count returned to baseline
  final_nodes = get_node_count.call
  TestFramework.assert_eq final_nodes, baseline_nodes, "Node count must return to baseline after destruction (zero leaks)"
end
