@tool
extends EditorPlugin

var compile_button: Button

func _enter_tree():
	# Add explicit Compile button to the top toolbar
	compile_button = Button.new()
	compile_button.text = "Build Crystal"
	compile_button.tooltip_text = "Compile Crystal source code (runs 'crystal build')"
	compile_button.pressed.connect(_on_compile_button_pressed)
	add_control_to_container(CONTAINER_TOOLBAR, compile_button)
	print("[CrystalPlugin] Crystal integration plugin activated.")

func _exit_tree():
	if compile_button:
		remove_control_from_container(CONTAINER_TOOLBAR, compile_button)
		compile_button.queue_free()

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

	# Determine entry file: prioritize demo/src/main.cr when running inside demo or when demo exists
	var entry_file = project_dir + "src/main.cr"
	if project_dir.ends_with("demo/") or project_dir.ends_with("demo\\"):
		entry_file = project_dir + "src/main.cr"
	elif FileAccess.file_exists(project_dir + "demo/src/main.cr"):
		entry_file = project_dir + "demo/src/main.cr"
	elif not FileAccess.file_exists(entry_file):
		entry_file = project_dir + "../demo/src/main.cr"

	var args = ["build", "--link-flags", "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init", entry_file, "-o", out_dll]
	print("[CrystalPlugin] Running: crystal " + " ".join(args))

	var exit_code = OS.execute("crystal", args, output, true)

	if exit_code != 0:
		printerr("[CrystalPlugin] === Crystal Compilation Error ===")
		if output.size() > 0:
			printerr(output[0])
		return false

	print("[CrystalPlugin] Crystal build succeeded: " + out_dll)

	# Ensure both bin/game.dll and demo/bin/game.dll are kept in sync
	if project_dir.ends_with("demo/") or project_dir.ends_with("demo\\"):
		var root_bin = project_dir + "../bin"
		if DirAccess.dir_exists_absolute(root_bin):
			DirAccess.copy_absolute(out_dll, root_bin + "/game.dll")
			print("[CrystalPlugin] Synced DLL to root: " + root_bin + "/game.dll")
	else:
		var demo_bin = project_dir + "demo/bin"
		if DirAccess.dir_exists_absolute(demo_bin):
			DirAccess.copy_absolute(out_dll, demo_bin + "/game.dll")
			print("[CrystalPlugin] Synced DLL to demo: " + demo_bin + "/game.dll")

	# Trigger hot-reload of the GDExtension so newly added nodes immediately show up in the editor
	var ext_path = "res://addons/crystal_integration/crystal.gdextension"
	if GDExtensionManager.is_extension_loaded(ext_path):
		var status = GDExtensionManager.reload_extension(ext_path)
		print("[CrystalPlugin] GDExtension reloaded (status: %d). New classes are now available in Editor." % status)
	else:
		GDExtensionManager.reload_extensions()
		print("[CrystalPlugin] GDExtension reload requested.")

	return true
