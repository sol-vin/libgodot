@tool
extends CrystalIntegrationPlugin

var compile_button: Button

func _enter_tree():
	if not Engine.is_editor_hint():
		return
	if DisplayServer.get_name() != "headless":
		compile_button = Button.new()
		compile_button.flat = true
		var icon_path = "res://addons/crystal_integration/crystal_icon.svg"
		if ResourceLoader.exists(icon_path):
			compile_button.icon = load(icon_path)
		compile_button.tooltip_text = "Build Crystal (runs 'crystal build')"
		compile_button.pressed.connect(_on_compile_button_pressed)
		add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, compile_button)

func _exit_tree():
	if compile_button:
		remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, compile_button)
		compile_button.queue_free()
		compile_button = null

func _on_compile_button_pressed():
	print("[CrystalIntegrationPlugin] Triggering manual Crystal build...")
	var success = _build()
	if success:
		print("[CrystalIntegrationPlugin] Build completed successfully!")
		var ext_path = "res://addons/crystal_integration/crystal.gdextension"
		if GDExtensionManager.is_extension_loaded(ext_path):
			var status = GDExtensionManager.reload_extension(ext_path)
			print("[CrystalIntegrationPlugin] GDExtension reload status: %d" % status)
		if GDExtensionManager.has_signal("extensions_reloaded"):
			GDExtensionManager.emit_signal("extensions_reloaded")
	else:
		printerr("[CrystalIntegrationPlugin] Build failed.")
