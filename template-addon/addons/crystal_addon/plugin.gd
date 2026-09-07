@tool
extends CrystalAddonPlugin

func _ready():
	if OS.get_environment("GODOT_RUN_ADDON_TEST") == "1" or "--run-addon-tests" in OS.get_cmdline_args():
		call_deferred("_wait_and_quit")

func _wait_and_quit():
	# Wait for editor frame initialization and initial filesystem scan to complete
	for i in range(5):
		await get_tree().process_frame
	if EditorInterface.get_resource_filesystem():
		while EditorInterface.get_resource_filesystem().is_scanning():
			await get_tree().process_frame
	# Allow any remaining deferred message queue items to flush
	for i in range(5):
		await get_tree().process_frame
	get_tree().quit(0)
