@tool
extends EditorPlugin

var compile_button: Button
var inspector_plugin: EditorInspectorPlugin

# Custom Inspector plugin for @tool test runners and tool buttons
class CrystalInspectorPlugin extends EditorInspectorPlugin:
	func _can_handle(object) -> bool:
		return object != null

	func _parse_property(object: Object, type: int, name: String, hint_type: int, hint_string: String, usage_flags: int, wide: bool) -> bool:
		if hint_type == PROPERTY_HINT_TOOL_BUTTON or name == "run_tests_button" or name == "run_tool_tests" or name.ends_with("_test_button") or name.ends_with("_button"):
			var container = VBoxContainer.new()
			container.add_theme_constant_override("separation", 4)
			
			var btn = Button.new()
			var btn_title = hint_string if hint_string != "" else "▶ Run Tests"
			btn.text = btn_title
			btn.tooltip_text = "Execute test suite directly in the Godot editor"
			btn.custom_minimum_size = Vector2(0, 32)
			btn.add_theme_color_override("font_color", Color(0.2, 1.0, 0.4))
			
			var result_label = Label.new()
			result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			result_label.text = "Status: Ready (click to run)"
			result_label.add_theme_color_override("font_color", Color(0.75, 0.85, 0.95))
			
			btn.pressed.connect(func():
				print("==================================================================")
				print("[CrystalToolTester] Triggering in-editor tests for: " + object.get_class())
				print("==================================================================")
				result_label.text = "Executing tests..."
				result_label.add_theme_color_override("font_color", Color(1.0, 0.85, 0.2))
				
				# Trigger through property setter or method
				if object.get(name) != null:
					object.set(name, true)
				elif object.has_method("run_tool_tests"):
					object.call("run_tool_tests")
				
				# Read status if available
				var status = object.get("test_status")
				if status != null and str(status) != "":
					result_label.text = str(status)
					if str(status).contains("Failed") or str(status).contains("Error"):
						result_label.add_theme_color_override("font_color", Color(1.0, 0.3, 0.3))
					else:
						result_label.add_theme_color_override("font_color", Color(0.3, 1.0, 0.5))
				else:
					result_label.text = "Tests completed! See Output console."
					result_label.add_theme_color_override("font_color", Color(0.3, 1.0, 0.5))
			)
			
			container.add_child(btn)
			container.add_child(result_label)
			add_custom_control(container)
			return true
		return false

func _enter_tree():
	# Add explicit Compile button to the top toolbar
	compile_button = Button.new()
	compile_button.text = "Build Crystal"
	compile_button.tooltip_text = "Compile Crystal source code (runs 'crystal build')"
	compile_button.pressed.connect(_on_compile_button_pressed)
	add_control_to_container(CONTAINER_TOOLBAR, compile_button)
	
	# Register custom inspector plugin for @tool test runners
	inspector_plugin = CrystalInspectorPlugin.new()
	add_inspector_plugin(inspector_plugin)
	
	print("[CrystalPlugin] Crystal integration plugin activated with inspector test support.")
	if OS.get_environment("GODOT_RUN_TOOL_TESTS") == "1" or "--run-tool-tests" in OS.get_cmdline_args():
		call_deferred("_run_in_editor_tool_tests")

	if compile_button:
		remove_control_from_container(CONTAINER_TOOLBAR, compile_button)
		compile_button.queue_free()
	if inspector_plugin:
		remove_inspector_plugin(inspector_plugin)

func _on_compile_button_pressed():
	print("[CrystalPlugin] Triggering manual Crystal build...")
	var success = execute_crystal_build()
	if success:
		print("[CrystalPlugin] Build completed successfully!")
	else:
		printerr("[CrystalPlugin] Build failed. See output above.")

func _build() -> bool:
	# Godot built-in hook: invoked automatically before F5 / Play Project / Play Scene
	print("[CrystalPlugin] Editor build requested (F5 / Play). Compiling Crystal...")
	return execute_crystal_build()

func execute_crystal_build() -> bool:
	var output = []
	var project_dir = ProjectSettings.globalize_path("res://")
	var out_dll = project_dir + "bin/game.dll"

	# Ensure bin directory exists
	DirAccess.make_dir_absolute(project_dir + "bin")

	# Determine entry file: check local project src/main.cr first, then test/src/main.cr
	var entry_file = project_dir + "src/main.cr"
	if not FileAccess.file_exists(entry_file):
		if FileAccess.file_exists(project_dir + "test/src/main.cr"):
			entry_file = project_dir + "test/src/main.cr"
		elif FileAccess.file_exists(project_dir + "../test/src/main.cr"):
			entry_file = project_dir + "../test/src/main.cr"
		elif FileAccess.file_exists(project_dir + "demo/src/main.cr"):
			entry_file = project_dir + "demo/src/main.cr"

	var args = ["build", "--link-flags", "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init", entry_file, "-o", out_dll]
	print("[CrystalPlugin] Running: crystal " + " ".join(args))

	var exit_code = OS.execute("crystal", args, output, true)

	if exit_code != 0:
		printerr("[CrystalPlugin] === Crystal Compilation Error ===")
		if output.size() > 0:
			printerr(output[0])
		return false

	print("[CrystalPlugin] Crystal build succeeded: " + out_dll)

	# Ensure root bin/game.dll is kept in sync if compiling from a consumer project
	var root_bin = project_dir + "../bin"
	if DirAccess.dir_exists_absolute(root_bin):
		DirAccess.copy_absolute(out_dll, root_bin + "/game.dll")
		print("[CrystalPlugin] Synced DLL to root: " + root_bin + "/game.dll")

	# Trigger hot-reload of the GDExtension so newly added nodes and properties immediately update
	var ext_path = "res://addons/crystal_integration/crystal.gdextension"
	if GDExtensionManager.is_extension_loaded(ext_path):
		var status = GDExtensionManager.reload_extension(ext_path)
		if status == OK:
			print("[CrystalPlugin] GDExtension reloaded successfully (status: %d). New classes are now available in Editor." % status)
		else:
			printerr("[CrystalPlugin] GDExtension reload failed (status: %d). Check output log." % status)
	else:
		var status = GDExtensionManager.load_extension(ext_path)
		print("[CrystalPlugin] GDExtension loaded (status: %d)." % status)

	# Emit extensions_reloaded to trigger EditorNode::_gdextensions_reloaded()
	# In Godot C++, reload_extension() does not emit this signal automatically.
	# Emitting it triggers InspectorDock update_tree(), ScriptEditor reload_scripts(), and EditorHelp doc regeneration.
	if GDExtensionManager.has_signal("extensions_reloaded"):
		GDExtensionManager.emit_signal("extensions_reloaded")

	# Ensure the Godot Inspector refreshes the currently selected nodes so new properties appear immediately
	_refresh_inspector()

	return true

func _refresh_inspector() -> void:
	var selection = EditorInterface.get_selection().get_selected_nodes()
	if selection.is_empty():
		return

	print("[CrystalPlugin] Refreshing inspector for %d selected node(s)..." % selection.size())
	# Clear selection and inspected object so EditorInspector clears out old node state
	EditorInterface.get_selection().clear()
	EditorInterface.inspect_object(null)
	EditorInterface.edit_node(null)

	# Defer reselection to let the GDExtension reload and ClassDB caches completely flush
	await get_tree().process_frame
	await get_tree().process_frame
	_reselect_nodes(selection)

func _reselect_nodes(nodes: Array[Node]) -> void:
	var sel = EditorInterface.get_selection()
	sel.clear()
	for node in nodes:
		if is_instance_valid(node):
			sel.add_node(node)
			node.notify_property_list_changed()
			EditorInterface.edit_node(node)
			EditorInterface.inspect_object(node)
			print("[CrystalPlugin] Inspector refreshed for node: %s" % node.name)

func _run_in_editor_tool_tests():
	print("==================================================================")
	print("[CrystalToolTester] Headless Editor Mode: Tickling @tool Tests...")
	print("==================================================================")
	var errors = 0
	
	# Wait for editor frame initialization
	await get_tree().process_frame
	
	# 1. Tickle ToolTester2D
	print("[CrystalToolTester] Instantiating and executing ToolTester2D...")
	var scene_2d = load("res://scenes/test_tool_2d.tscn")
	if scene_2d:
		var node_2d = scene_2d.instantiate()
		if node_2d:
			var tester_2d = node_2d if node_2d.get_class() == "ToolTester2D" else node_2d.find_child("ToolTester2D", true, false)
			if tester_2d:
				if tester_2d.has_method("run_tool_tests"):
					tester_2d.call("run_tool_tests")
				var status_2d = str(tester_2d.get("test_status"))
				print("[CrystalToolTester] ToolTester2D status: " + status_2d)
				if status_2d.contains("Failed") or status_2d.contains("Error"):
					printerr("[CrystalToolTester] ToolTester2D failed: " + status_2d)
					errors += 1
			else:
				printerr("[CrystalToolTester] ToolTester2D node not found in test_tool_2d.tscn")
				errors += 1
			node_2d.free()
	else:
		printerr("[CrystalToolTester] Failed to load res://scenes/test_tool_2d.tscn")
		errors += 1

	# 2. Tickle ToolTester3D
	print("[CrystalToolTester] Instantiating and executing ToolTester3D...")
	var scene_3d = load("res://scenes/test_tool_3d.tscn")
	if scene_3d:
		var node_3d = scene_3d.instantiate()
		if node_3d:
			var tester_3d = node_3d if node_3d.get_class() == "ToolTester3D" else node_3d.find_child("ToolTester3D", true, false)
			if tester_3d:
				if tester_3d.has_method("run_tool_tests"):
					tester_3d.call("run_tool_tests")
				var status_3d = str(tester_3d.get("test_status"))
				print("[CrystalToolTester] ToolTester3D status: " + status_3d)
				if status_3d.contains("Failed") or status_3d.contains("Error"):
					printerr("[CrystalToolTester] ToolTester3D failed: " + status_3d)
					errors += 1
			else:
				printerr("[CrystalToolTester] ToolTester3D node not found in test_tool_3d.tscn")
				errors += 1
			node_3d.free()
	else:
		printerr("[CrystalToolTester] Failed to load res://scenes/test_tool_3d.tscn")
		errors += 1

	print("==================================================================")
	if errors > 0:
		printerr("[CrystalToolTester] IN-EDITOR TOOL TESTS FAILED (%d errors)!" % errors)
		var f = FileAccess.open("res://.tool_tests_failed", FileAccess.WRITE)
		if f:
			f.store_string("FAILED: %d errors\n" % errors)
			f.close()
		get_tree().quit(1)
	else:
		print("[CrystalToolTester] ALL IN-EDITOR TOOL TESTS PASSED CLEANLY!")
		var f = FileAccess.open("res://.tool_tests_passed", FileAccess.WRITE)
		if f:
			f.store_string("PASSED\n")
			f.close()
		get_tree().quit(0)


