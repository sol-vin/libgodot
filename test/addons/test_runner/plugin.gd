@tool
extends EditorPlugin

# =============================================================================
# LibGodot Test Suite - In-Editor @tool Test Runner Plugin
# =============================================================================
# Dedicated test harness plugin residing strictly in the test consumer project.
# Automatically tickles ToolTester2D and ToolTester3D scenes when invoked with
# GODOT_RUN_TOOL_TESTS=1 or --run-tool-tests.

func _enter_tree():
	if OS.get_environment("GODOT_RUN_TOOL_TESTS") == "1" or "--run-tool-tests" in OS.get_cmdline_args():
		call_deferred("_run_in_editor_tool_tests")

func _run_in_editor_tool_tests():
	print("==================================================================")
	print("[CrystalToolTester] Headless Editor Mode: Tickling @tool Tests...")
	print("==================================================================")
	var errors = 0
	var error_messages = []

	for i in range(5):
		await get_tree().process_frame
	if EditorInterface.get_resource_filesystem():
		while EditorInterface.get_resource_filesystem().is_scanning():
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
					var msg = "[CrystalToolTester] ToolTester2D failed: " + status_2d
					printerr(msg)
					error_messages.append(msg)
					errors += 1
			else:
				var msg = "[CrystalToolTester] ToolTester2D node not found in test_tool_2d.tscn"
				printerr(msg)
				error_messages.append(msg)
				errors += 1
			node_2d.free()
	else:
		var msg = "[CrystalToolTester] Failed to load res://scenes/test_tool_2d.tscn"
		printerr(msg)
		error_messages.append(msg)
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
				print("[CrystalToolTester] run_tool_tests completed. Getting test_status...")
				var status_3d = str(tester_3d.get("test_status"))
				print("[CrystalToolTester] ToolTester3D status: " + status_3d)
				if status_3d.contains("Failed") or status_3d.contains("Error"):
					var msg = "[CrystalToolTester] ToolTester3D failed: " + status_3d
					printerr(msg)
					error_messages.append(msg)
					errors += 1
			else:
				var msg = "[CrystalToolTester] ToolTester3D node not found in test_tool_3d.tscn"
				printerr(msg)
				error_messages.append(msg)
				errors += 1
			print("[CrystalToolTester] Freeing node_3d...")
			node_3d.free()
			print("[CrystalToolTester] node_3d freed successfully!")
	else:
		var msg = "[CrystalToolTester] Failed to load res://scenes/test_tool_3d.tscn"
		printerr(msg)
		error_messages.append(msg)
		errors += 1

	# 3. Verify Multi-Addon EditorPlugin Classes in ClassDB during in-editor execution
	print("[CrystalToolTester] Verifying multi-addon EditorPlugin classes in ClassDB...")
	var required_editor_classes = [
		"CrystalIntegrationPlugin",
		"DummyDialoguePlugin",
		"DummyInventoryPlugin",
		"DummyAudioPlugin"
	]
	for cls in required_editor_classes:
		if not ClassDB.class_exists(cls):
			var msg = "[CrystalToolTester] Required editor plugin class '%s' missing from ClassDB!" % cls
			printerr(msg)
			error_messages.append(msg)
			errors += 1
		elif not ClassDB.is_parent_class(cls, "EditorPlugin"):
			var msg = "[CrystalToolTester] Class '%s' does not inherit from EditorPlugin!" % cls
			printerr(msg)
			error_messages.append(msg)
			errors += 1
		else:
			print("[CrystalToolTester]   ✔ %s registered as EditorPlugin" % cls)

	# 4. Open a .cr script in the editor to verify Script tab integration
	print("[CrystalToolTester] Testing Script Tab: Loading and editing res://src/main.cr...")
	var cr_script = load("res://src/main.cr")
	if cr_script:
		print("[CrystalToolTester]   ✔ Loaded res://src/main.cr as %s" % cr_script.get_class())
		EditorInterface.edit_script(cr_script, true)
		print("[CrystalToolTester]   ✔ Successfully opened res://src/main.cr in EditorInterface.edit_script!")
	else:
		var msg = "[CrystalToolTester] Failed to load res://src/main.cr as CrystalScript resource"
		printerr(msg)
		error_messages.append(msg)
		errors += 1

	print("==================================================================")
	if errors > 0:
		printerr("[CrystalToolTester] IN-EDITOR TOOL TESTS FAILED (%d errors)!" % errors)
		var f = FileAccess.open("res://.tool_tests_failed", FileAccess.WRITE)
		if f:
			f.store_string("FAILED: %d errors\n%s\n" % [errors, "\n".join(error_messages)])
			f.close()
	else:
		print("[CrystalToolTester] ALL IN-EDITOR TOOL TESTS PASSED CLEANLY!")
		var f = FileAccess.open("res://.tool_tests_passed", FileAccess.WRITE)
		if f:
			f.store_string("PASSED\n")
			f.close()

	var has_quit_after = false
	for arg in OS.get_cmdline_args():
		if arg == "--quit-after" or arg.begins_with("--quit-after"):
			has_quit_after = true
			break

	if not has_quit_after:
		if errors > 0:
			get_tree().quit(1)
		else:
			get_tree().quit(0)
