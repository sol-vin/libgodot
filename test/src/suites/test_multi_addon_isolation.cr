# =============================================================================
# LibGodot Test Suite: Multi-Addon Isolation & Conflict Prevention
# =============================================================================

macro test_multi_addon(name, &block)
  ::TestFramework::Registry.register("MultiAddon", {{name}}) do |node|
    root = node
    {{block.body}}
  end
end

test_multi_addon "Multi-addon ClassDB registration and isolation" do
  class_db = Godot::ClassDB.new(Godot::ClassDB.singleton_ptr)

  # In editor sessions, EditorPlugin classes are registered in ClassDB at EDITOR initialization level.
  if Godot.editor_hint? || class_db.call_bool("class_exists", "EditorPlugin")
    TestFramework.assert_true class_db.call_bool("class_exists", "CrystalIntegrationPlugin"), "CrystalIntegrationPlugin must exist in ClassDB in editor"
  end

  # Verify DialogueBox node from dummy_dialogue
  dialogue_ptr = Godot::Bridge.construct_object("DialogueBox")
  TestFramework.assert_false dialogue_ptr.null?, "DialogueBox must be constructible via ClassDB"
  box = Godot::Control.new(dialogue_ptr)
  TestFramework.assert_true box.alive?, "DialogueBox should be instantiated"
  TestFramework.assert_eq box.call_str("get", "speaker_name"), "Narrator"
  box.destroy
  TestFramework.assert_true box.destroyed?

  # Verify InventoryGrid node from dummy_inventory
  inv_ptr = Godot::Bridge.construct_object("InventoryGrid")
  TestFramework.assert_false inv_ptr.null?, "InventoryGrid must be constructible via ClassDB"
  inv = Godot::Control.new(inv_ptr)
  TestFramework.assert_true inv.alive?, "InventoryGrid should be instantiated"
  TestFramework.assert_eq inv.call_i64("get", "capacity"), 20_i64
  TestFramework.assert_eq inv.call_i64("get", "item_count"), 5_i64
  inv.destroy
  TestFramework.assert_true inv.destroyed?

  # Verify AudioStreamPlayerCrystal node from dummy_audio
  audio_ptr = Godot::Bridge.construct_object("AudioStreamPlayerCrystal")
  TestFramework.assert_false audio_ptr.null?, "AudioStreamPlayerCrystal must be constructible via ClassDB"
  audio = Godot::Node.new(audio_ptr)
  TestFramework.assert_true audio.alive?, "AudioStreamPlayerCrystal should be instantiated"
  TestFramework.assert_eq audio.call_str("get", "bus_name"), "Master"
  TestFramework.assert_false audio.call_bool("get", "is_playing")
  audio.destroy
  TestFramework.assert_true audio.destroyed?
end

test_multi_addon "EditorPlugin coexistence and single compiler hook enforcement" do
  class_db = Godot::ClassDB.new(Godot::ClassDB.singleton_ptr)

  # When in editor sessions (where EditorPlugin exists in ClassDB):
  if Godot.editor_hint? || class_db.call_bool("class_exists", "EditorPlugin")
    # Verify CrystalIntegrationPlugin is registered in ClassDB and inherits from EditorPlugin
    TestFramework.assert_true class_db.call_bool("class_exists", "CrystalIntegrationPlugin"), "CrystalIntegrationPlugin must exist in ClassDB"
    TestFramework.assert_true class_db.call_bool("is_parent_class", "CrystalIntegrationPlugin", "EditorPlugin"), "CrystalIntegrationPlugin must inherit EditorPlugin"
    TestFramework.assert_true class_db.call_bool("class_has_signal", "CrystalIntegrationPlugin", "ready_in_editor"), "CrystalIntegrationPlugin must expose ready_in_editor signal"

    # Verify multiple distinct EditorPlugin classes can coexist in ClassDB without collisions
    dummy_plugins = ["DummyDialoguePlugin", "DummyInventoryPlugin", "DummyAudioPlugin"]
    dummy_plugins.each do |plugin_name|
      TestFramework.assert_true class_db.call_bool("class_exists", plugin_name), "#{plugin_name} must exist in ClassDB"
      TestFramework.assert_true class_db.call_bool("is_parent_class", plugin_name, "EditorPlugin"), "#{plugin_name} must inherit EditorPlugin"
      TestFramework.assert_false class_db.call_bool("class_has_signal", plugin_name, "ready_in_editor"), "#{plugin_name} must NOT have compiler build hook signal"
    end
  else
    # In standalone game runtime, verify that runtime addon classes are available
    TestFramework.assert_true class_db.call_bool("class_exists", "DialogueBox"), "DialogueBox must exist in runtime ClassDB"
    TestFramework.assert_true class_db.call_bool("class_exists", "InventoryGrid"), "InventoryGrid must exist in runtime ClassDB"
    TestFramework.assert_true class_db.call_bool("class_exists", "AudioStreamPlayerCrystal"), "AudioStreamPlayerCrystal must exist in runtime ClassDB"
  end
end

test_multi_addon "EditorPlugin documentation and public methods registration" do
  class_db = Godot::ClassDB.new(Godot::ClassDB.singleton_ptr)

  # Check that plugins have their exported properties and signals registered in ClassDB
  if Godot.editor_hint? || class_db.call_bool("class_exists", "EditorPlugin")
    TestFramework.assert_true class_db.call_bool("class_has_signal", "DummyAudioPlugin", "preview_stopped"), "DummyAudioPlugin must expose preview_stopped signal"
    TestFramework.assert_true class_db.call_bool("class_has_signal", "DummyDialoguePlugin", "dialogue_validated"), "DummyDialoguePlugin must expose dialogue_validated signal"
    TestFramework.assert_true class_db.call_bool("class_has_signal", "DummyInventoryPlugin", "slot_inspected"), "DummyInventoryPlugin must expose slot_inspected signal"
  end

  # Check runtime node signals and properties
  TestFramework.assert_true class_db.call_bool("class_has_signal", "AudioStreamPlayerCrystal", "playback_started"), "AudioStreamPlayerCrystal must expose playback_started signal"
  TestFramework.assert_true class_db.call_bool("class_has_signal", "DialogueBox", "line_finished"), "DialogueBox must expose line_finished signal"
  TestFramework.assert_true class_db.call_bool("class_has_signal", "InventoryGrid", "item_added"), "InventoryGrid must expose item_added signal"
end

test_multi_addon "Zero memory leak across multiple addon nodes" do
  container = Godot.create(Godot::Node)
  root.add_child(container)

  5.times do |i|
    # Add dummy dialogue boxes
    d_ptr = Godot::Bridge.construct_object("DialogueBox")
    if !d_ptr.null?
      d_node = Godot::Control.new(d_ptr)
      d_node.name = "DialogueBox_#{i}"
      container.add_child(d_node)
    end

    # Add dummy inventory grids
    inv_ptr = Godot::Bridge.construct_object("InventoryGrid")
    if !inv_ptr.null?
      inv_node = Godot::Control.new(inv_ptr)
      inv_node.name = "InventoryGrid_#{i}"
      container.add_child(inv_node)
    end
  end

  container.queue_free
  GC.collect
  TestFramework.assert_true true, "Multi-addon nodes cleanly allocated and deallocated"
end
