# =============================================================================
# LibGodot - Crystal Editor Integration Plugin
# =============================================================================
# A compiled GDExtension EditorPlugin registered directly in Godot's ClassDB.
# Acts as the native backend for the Crystal integration addon, handling
# editor lifecycle events, version reporting, toolbar controls, and F5 build hooks.

module Godot
  @[Tool]
  node CrystalIntegrationPlugin < EditorPlugin do
    tool

  # Version of the compiled LibGodot library
  getter version : String = ::Godot::VERSION

  # Active status of the compiled Crystal editor integration
  getter active : Bool = true

  # Status message visible in inspector or tooling
  getter status_message : String = "LibGodot Crystal Integration Active"

  # Emitted when the Crystal editor plugin finishes initialization
  signal ready_in_editor

  @@crystal_language : CrystalLanguage? = nil
  @@crystal_highlighter : CrystalHighlighter? = nil
  @@resource_loader : ResourceFormatLoaderCrystal? = nil
  @@resource_saver : ResourceFormatSaverCrystal? = nil
  @@compile_button : Button? = nil

  def _enter_tree : Void
    Godot.print("==================================================================")
    Godot.print("  [CrystalIntegrationPlugin] Native Crystal editor plugin loaded!")
    Godot.print("  LibGodot Version: #{::Godot::VERSION}")
    Godot.print("==================================================================")

    if Godot.editor_hint?
      if lang = Godot.create(Godot::CrystalLanguage)
        @@crystal_language = lang
        engine = Godot::Engine.new(Godot::Engine.singleton_ptr)
        engine.register_script_language(lang)
      end

      if highlighter = Godot.create(Godot::CrystalHighlighter)
        @@crystal_highlighter = highlighter
        if !Godot::EditorInterface.singleton_ptr.null?
          ed_interface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
          script_editor = ed_interface.get_script_editor
          if !script_editor.pointer.null?
            script_editor.register_syntax_highlighter(highlighter)
            self.class.apply_highlighter_if_needed
            script_editor.connect("editor_script_changed") do |_args|
              self.class.apply_highlighter_if_needed
            end
          end
        end
      end

      if loader = Godot.create(Godot::ResourceFormatLoaderCrystal)
        @@resource_loader = loader
        r_loader = Godot::ResourceLoader.new(Godot::ResourceLoader.singleton_ptr)
        r_loader.add_resource_format_loader(loader, true)
      end

      if saver = Godot.create(Godot::ResourceFormatSaverCrystal)
        @@resource_saver = saver
        r_saver = Godot::ResourceSaver.new(Godot::ResourceSaver.singleton_ptr)
        r_saver.add_resource_format_saver(saver, true)
      end

      setup_toolbar_button

      Godot.print("[CrystalIntegrationPlugin] First-class .cr script support, language, and syntax highlighter registered in 100% pure Crystal.")
    end

    emit_ready_in_editor
  end

  def _exit_tree : Void
    if (highlighter = @@crystal_highlighter) && !Godot::EditorInterface.singleton_ptr.null?
      ed_interface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
      script_editor = ed_interface.get_script_editor
      if !script_editor.pointer.null?
        script_editor.unregister_syntax_highlighter(highlighter)
      end
      highlighter.unreference
      @@crystal_highlighter = nil
    end

    if loader = @@resource_loader
      r_loader = Godot::ResourceLoader.new(Godot::ResourceLoader.singleton_ptr)
      r_loader.remove_resource_format_loader(loader)
      loader.unreference
      @@resource_loader = nil
    end

    if saver = @@resource_saver
      r_saver = Godot::ResourceSaver.new(Godot::ResourceSaver.singleton_ptr)
      r_saver.remove_resource_format_saver(saver)
      saver.unreference
      @@resource_saver = nil
    end

    if lang = @@crystal_language
      engine = Godot::Engine.new(Godot::Engine.singleton_ptr)
      engine.unregister_script_language(lang)
      lang.destroy
      @@crystal_language = nil
    end

    if btn = @@compile_button
      remove_control_from_container(Godot::EditorPlugin::CustomControlContainer::ContainerToolbar.value, btn)
      btn.queue_free
      @@compile_button = nil
    end

    Godot.print("  [CrystalIntegrationPlugin] Native Crystal editor plugin unloaded.")
  end

  private def setup_toolbar_button : Void
    return if Godot::EditorInterface.singleton_ptr.null?
    ed_iface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
    base_ctrl = ed_iface.get_base_control
    return if base_ctrl.pointer.null?

    if !Godot::DisplayServer.singleton_ptr.null?
      ds = Godot::DisplayServer.new(Godot::DisplayServer.singleton_ptr)
      return if ds.call_str("get_name") == "headless"
    end

    btn = Godot.create(Godot::Button)
    return unless btn
    btn.call("set_flat", true)
    btn.call("set_text", "Build Crystal")

    add_control_to_container(Godot::EditorPlugin::CustomControlContainer::ContainerToolbar.value, btn)
    @@compile_button = btn
  rescue ex
    Godot.printerr("[CrystalIntegrationPlugin] Warning: could not setup toolbar button: #{ex.message}")
  end

  # Handles toolbar compile button press to trigger manual Crystal rebuild
  def on_compile_button_pressed : Void
    Godot.print("[CrystalIntegrationPlugin] Triggering manual Crystal build...")
    success = execute_crystal_build
    if success
      Godot.print("[CrystalIntegrationPlugin] Build completed successfully!")
      ext_path = "res://addons/crystal_integration/crystal.gdextension"
      gd_ext_mgr = Godot::GDExtensionManager.new(Godot::GDExtensionManager.singleton_ptr)
      if gd_ext_mgr.is_extension_loaded(ext_path)
        status = gd_ext_mgr.reload_extension(ext_path)
        Godot.print("[CrystalIntegrationPlugin] GDExtension reload status: #{status}")
      end
    else
      Godot.printerr("[CrystalIntegrationPlugin] Build failed.")
    end
  end

  # Invoked by Godot editor before running project (F5 / F6)
  def _build : Bool
    Godot.print("[CrystalIntegrationPlugin] Editor build requested (F5 / Play). Compiling Crystal...")
    execute_crystal_build
  end

  # Compiles project Crystal code into shared library
  def execute_crystal_build : Bool
    execute_crystal_build_with_options(false)
  end

  # Compiles project Crystal code with optional release optimizations
  def execute_crystal_build_with_options(is_release : Bool = false) : Bool
    entry_file = "src/main.cr"
    entry_file = "test/src/main.cr" unless Godot::SystemIO.file_exists?(entry_file)
    entry_file = "../test/src/main.cr" unless Godot::SystemIO.file_exists?(entry_file)
    entry_file = "demo/src/main.cr" unless Godot::SystemIO.file_exists?(entry_file)

    out_dll = {% if flag?(:windows) %}
      "bin/game.dll"
    {% elsif flag?(:darwin) %}
      "bin/game.dylib"
    {% else %}
      "bin/game.so"
    {% end %}

    link_flags = {% if flag?(:windows) %}
      "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init"
    {% elsif flag?(:darwin) %}
      "-dynamiclib"
    {% else %}
      "-shared"
    {% end %}

    args = ["build", "--link-flags", link_flags]
    args << "--release" if is_release
    args << entry_file
    args << "-o"
    args << out_dll

    Godot.print("[CrystalIntegrationPlugin] Running: crystal #{args.join(" ")}")
    status = Process.run("crystal", args)
    if status.success?
      Godot.print("[CrystalIntegrationPlugin] Crystal build succeeded: #{out_dll}")
      if File.directory?("../bin")
        begin
          File.copy(out_dll, "../bin/#{File.basename(out_dll)}")
          Godot.print("[CrystalIntegrationPlugin] Synced DLL to root: ../bin/#{File.basename(out_dll)}")
        rescue
        end
      end
      true
    else
      Godot.printerr("[CrystalIntegrationPlugin] Crystal build failed with exit code #{status.exit_code}")
      false
    end
  rescue ex
    Godot.printerr("[CrystalIntegrationPlugin] Error running build: #{ex.message}")
    false
  end

  def _process(delta : Float64) : Void
  end

  def apply_highlighter_if_needed : Void
    self.class.apply_highlighter_if_needed
  end

  def self.apply_highlighter_if_needed : Void
    return if Godot::EditorInterface.singleton_ptr.null?
    hl = @@crystal_highlighter
    return unless hl && !hl.pointer.null?

    ed_iface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
    se = ed_iface.get_script_editor
    return if se.pointer.null?

    curr_script = se.get_current_script
    if curr_script && !curr_script.pointer.null?
      path = curr_script.call_str("get_path")
      curr_script.unreference # Balance the Ref<Script> created by ptrcall
      if path.ends_with?(".cr")
        curr_ed = se.call_obj("get_current_editor")
        if curr_ed && !curr_ed.pointer.null?
          curr_ed.call("add_syntax_highlighter", hl)
          base_ed = curr_ed.call_obj("get_base_editor")
          if base_ed && !base_ed.pointer.null?
            base_ed.call("set_syntax_highlighter", hl)
            base_ed.call("queue_redraw")
          end
        end
      end
    end
  rescue
  end
end
end

alias CrystalIntegrationPlugin = Godot::CrystalIntegrationPlugin

