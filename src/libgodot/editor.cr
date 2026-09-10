# =============================================================================
# LibGodot - Crystal Editor Integration Plugin
# =============================================================================
# A compiled GDExtension EditorPlugin registered directly in Godot's ClassDB.
# Acts as the native backend for the Crystal integration addon, handling
# editor lifecycle events, version reporting, toolbar controls, and F5 build hooks.

module Godot
  @[Tool]
  node CrystalIntegrationPlugin < EditorPlugin do
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
  @@crystal_panel : Node? = nil
  @@cached_icon_texture : Texture2D? = nil
  @@debugger_plugin : EditorDebuggerPlugin? = nil

  def _enter_tree : Void
    Godot.print("==================================================================")
    Godot.print("  [CrystalIntegrationPlugin] Native Crystal editor plugin loaded!")
    Godot.print("  LibGodot Version: #{::Godot::VERSION}")
    Godot.print("==================================================================")

    if Godot.editor_hint?
      # Disable 'Highlight Type Safe Lines' to prevent engine bug in TextEdit (p_gutter = -1 out of bounds)
      if !Godot::EditorInterface.singleton_ptr.null?
        ed_interface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
        ed_settings = ed_interface.get_editor_settings
        if !ed_settings.pointer.null?
          ed_settings.call("set_setting", "text_editor/appearance/gutters/highlight_type_safe_lines", false)
          ed_settings.call("set_initial_value", "text_editor/appearance/gutters/highlight_type_safe_lines", false, false)
          ed_settings.call("set_setting", "text_editor/appearance/guidelines/highlight_type_safe_lines", false)

          val = ed_settings.call_str("get_setting", "docks/filesystem/textfile_extensions")
          exts = (val.empty? ? "txt,md,cfg,ini,log,json,yml,yaml,toml,xml" : val).split(',').map(&.strip).reject(&.empty?)
          unless exts.includes?("cr")
            exts << "cr"
            new_val = exts.join(",")
            ed_settings.call("set_setting", "docks/filesystem/textfile_extensions", new_val)
            ed_settings.call("set_initial_value", "docks/filesystem/textfile_extensions", new_val, false)
            Godot.print("[CrystalIntegrationPlugin] Added 'cr' to EditorSettings docks/filesystem/textfile_extensions: #{new_val}")
          end
        end
      end

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

      # Safe filesystem scan only if Godot is not already performing its startup scan
      if !Godot::EditorInterface.singleton_ptr.null?
        ed_interface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
        r_fs = ed_interface.get_resource_filesystem
        if !r_fs.pointer.null? && !r_fs.is_scanning
          r_fs.scan
          Godot.print("[CrystalIntegrationPlugin] Triggered EditorFileSystem.scan() to index Crystal source files.")
        end
      end

      setup_toolbar_button
      setup_main_screen_panel
      setup_debugger_plugin

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
      highlighter.destroy
      @@crystal_highlighter = nil
    end

    if loader = @@resource_loader
      r_loader = Godot::ResourceLoader.new(Godot::ResourceLoader.singleton_ptr)
      r_loader.remove_resource_format_loader(loader)
      loader.destroy
      @@resource_loader = nil
      ResourceFormatLoaderCrystal.clear_instance
    end

    if saver = @@resource_saver
      r_saver = Godot::ResourceSaver.new(Godot::ResourceSaver.singleton_ptr)
      r_saver.remove_resource_format_saver(saver)
      saver.destroy
      @@resource_saver = nil
      ResourceFormatSaverCrystal.clear_instance
    end

    if tex = @@cached_icon_texture
      tex.destroy
      @@cached_icon_texture = nil
    end

    if lang = @@crystal_language
      engine = Godot::Engine.new(Godot::Engine.singleton_ptr)
      engine.unregister_script_language(lang)
      lang.destroy
      @@crystal_language = nil
    end

    if btn = @@compile_button
      remove_control_from_container(Godot::EditorPlugin::CustomControlContainer::ContainerToolbar.value, btn)
      if p = btn.call_obj("get_parent")
        p.call("remove_child", btn)
      end
      btn.queue_free
      @@compile_button = nil
    end

    if dbg_plug = @@debugger_plugin
      remove_debugger_plugin(dbg_plug)
      @@debugger_plugin = nil
    end

    if panel = @@crystal_panel
      dock = panel.call_obj("get_parent")
      panel.call("queue_free")
      @@crystal_panel = nil
      if dock && !dock.pointer.null? && dock.call_str("get_class") == "EditorDock"
        dock.call("queue_free")
      end
    end

    Godot.print("  [CrystalIntegrationPlugin] Native Crystal editor plugin unloaded.")
  end

  CRYSTAL_ICON_SVG = "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 193.2 206.7' width='16' height='16'><path fill='#e0e0e0' d='m165.4 122-50 49.9c-.2.2-.5.3-.7.2l-68.3-18.3c-.3-.1-.5-.3-.5-.5L27.5 85.1c-.1-.3 0-.5.2-.7l50-49.9c.2-.2.5-.3.7-.2l68.3 18.3c.3.1.5.3.5.5l18.3 68.2c.2.3.1.5-.1.7zm-67-54.3L31.3 85.6c-.1 0-.2.2-.1.3l49.1 49c.1.1.3.1.3-.1l18-67c.1 0-.1-.2-.2-.1z'/></svg>"

  # Registers and configures the native LLDB debugger plugin
  def setup_debugger_plugin : Void
    return if @@debugger_plugin

    if Godot::EditorInterface.singleton_ptr.null?
      return
    end
    ed_interface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
    main_screen = ed_interface.get_editor_main_screen
    if main_screen.pointer.null?
      return
    end

    if !Godot::DisplayServer.singleton_ptr.null?
      ds = Godot::DisplayServer.new(Godot::DisplayServer.singleton_ptr)
      ds_name = ds.call_str("get_name")
      Godot.print("[CrystalIntegrationPlugin] DisplayServer name: '#{ds_name}'")
      if ds_name == "headless"
        return
      end
    end

    lldb_path = "lldb"
    ed_settings = ed_interface.get_editor_settings
    if !ed_settings.pointer.null?
      custom_lldb = ed_settings.call_str("get_setting", "crystal/debugger/lldb_path")
      lldb_path = custom_lldb unless custom_lldb.empty?
    end

    if Debugger::LldbDriver.available?(lldb_path)
      found = Debugger::LldbDriver.find_lldb(lldb_path)
      Godot.print("[CrystalIntegrationPlugin] LLDB native debugger detected: #{found}")
    else
      Godot.print("[CrystalIntegrationPlugin] Tip: LLDB not found in PATH. Install LLVM (e.g. 'scoop install llvm' on Windows, 'apt install lldb' on Linux) for native Crystal in-editor debugging.")
    end

    dbg_plugin = Godot.create("CrystalDebuggerPlugin")
    if dbg_plugin && !dbg_plugin.pointer.null?
      plug = Godot::EditorDebuggerPlugin.new(dbg_plugin.pointer)
      if plug.get_reference_count == 0
        plug.init_ref
      end
      add_debugger_plugin(plug)
      @@debugger_plugin = plug
      Godot.print("[CrystalIntegrationPlugin] CrystalDebuggerPlugin registered into EditorDebuggerNode.")
    end
  rescue ex
    Godot.print("[CrystalIntegrationPlugin] Notice: debugger plugin setup: #{ex.message}")
  end

  # Docks the CrystalPanel into Godot Editor's main screen
  def setup_main_screen_panel : Void
    if @@crystal_panel
      return
    end
    if Godot::EditorInterface.singleton_ptr.null?
      return
    end
    ed_iface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
    main_screen = ed_iface.get_editor_main_screen
    if main_screen.pointer.null?
      return
    end

    if !Godot::DisplayServer.singleton_ptr.null?
      ds = Godot::DisplayServer.new(Godot::DisplayServer.singleton_ptr)
      if ds.call_str("get_name") == "headless"
        return
      end
    end

    if panel = Godot.create("CrystalPanel")
      panel.call("set_visible", false)
      main_screen.call("add_child", panel)
      @@crystal_panel = panel
      Godot.print("[CrystalIntegrationPlugin] Native Crystal Main Screen Tab docked successfully.")
    end
  rescue ex
    Godot.printerr("[CrystalIntegrationPlugin] Notice: could not setup main screen panel: #{ex.message}")
  end

  def make_crystal_panel_visible(visible : Bool) : Void
    if panel = @@crystal_panel
      panel.call("set_visible", visible)
    end
  end

  def get_crystal_plugin_icon : Texture2D?
    self.class.get_crystal_icon_texture
  end

  def self._godot_has_virtual_method(method_name : String) : Bool
    case method_name
    when "_has_main_screen", "_get_plugin_name", "_get_plugin_icon", "_make_visible"
      true
    else
      false
    end
  end

  def _godot_call_virtual_with_data(method_name : String, args : Void**, ret : Void*) : Void
    case method_name
    when "_has_main_screen"
      return if ret.null?
      ret.as(UInt8*).value = 1_u8
      Godot.print("[CrystalIntegrationPlugin] Main screen queried: _has_main_screen -> true")
    when "_get_plugin_name"
      return if ret.null?
      Bridge.ret_string(ret, "Crystal")
      Godot.print("[CrystalIntegrationPlugin] Main screen queried: _get_plugin_name -> 'Crystal'")
    when "_get_plugin_icon"
      return if ret.null?
      tex = self.class.get_crystal_icon_texture
      if tex && !tex.pointer.null?
        Bridge.ret_ref(ret, tex.pointer)
      else
        Bridge.ret_ref(ret, Pointer(Void).null)
      end
      Godot.print("[CrystalIntegrationPlugin] Main screen queried: _get_plugin_icon -> #{tex ? "icon" : "null"}")
    when "_make_visible"
      visible = !args.null? && !args[0].null? && (args[0].as(UInt8*).value != 0_u8)
      make_crystal_panel_visible(visible)
      Godot.print("[CrystalIntegrationPlugin] Main screen visibility toggled: _make_visible(#{visible})")
    end
  end

  def _has_main_screen : Bool
    true
  end

  def _get_plugin_name : String
    "Crystal"
  end

  def _get_plugin_icon : Texture2D?
    get_crystal_plugin_icon
  end

  def _make_visible(visible : Bool) : Void
    make_crystal_panel_visible(visible)
  end

  def self.get_crystal_icon_texture : Godot::Texture2D?
    if cached = @@cached_icon_texture
      return cached if !cached.pointer.null?
    end

    icon_tex : Godot::Texture2D? = nil
    ["res://addons/crystal_integration/crystal_icon.svg", "res://crystal_icon.svg"].each do |p|
      res = Godot.load(p, "Texture2D")
      if res && !res.pointer.null?
        icon_tex = Godot::Texture2D.new(res.pointer)
        break
      end
    end

    if !icon_tex || icon_tex.pointer.null?
      img = Godot.create(Godot::Image)
      if img && !img.pointer.null?
        err = img.load_svg_from_string(CRYSTAL_ICON_SVG, 1.0_f64)
        if err == 0_i64
          itex = Godot.create(Godot::ImageTexture)
          if itex && !itex.pointer.null?
            itex.set_image(img)
            icon_tex = itex
          end
        end
      end
    end

    @@cached_icon_texture = icon_tex
    icon_tex
  end

  def setup_toolbar_button : Void
    return if @@compile_button
    return if Godot::EditorInterface.singleton_ptr.null?
    ed_iface = Godot::EditorInterface.new(Godot::EditorInterface.singleton_ptr)
    base_ctrl = ed_iface.get_base_control
    return if base_ctrl.pointer.null?

    if !Godot::DisplayServer.singleton_ptr.null?
      ds = Godot::DisplayServer.new(Godot::DisplayServer.singleton_ptr)
      return if ds.call_str("get_name") == "headless"
    end

    # Check if button already exists in editor tree to avoid duplicates
    existing = base_ctrl.call_obj("find_child", "BuildCrystalToolbarButton", true, false)
    if existing && !existing.pointer.null?
      @@compile_button = Godot::Button.new(existing.pointer)
      return
    end

    btn = Godot.create(Godot::Button)
    return unless btn
    btn.call("set_name", "BuildCrystalToolbarButton")
    btn.call("set_flat", true)
    btn.call("set_theme_type_variation", "RunBarButton")

    icon_tex = self.class.get_crystal_icon_texture

    if icon_tex && !icon_tex.pointer.null?
      btn.set_button_icon(icon_tex)
      btn.call("set_button_icon", icon_tex)
      btn.call("set_text", "")
    else
      btn.call("set_text", "Build Crystal")
    end

    btn.call("set_tooltip_text", "Build Crystal (Quick Recompile)")
    btn.call("set_focus_mode", 0)

    btn.connect("pressed") do |_args|
      on_compile_button_pressed
    end

    # Place the "Build Crystal" button in CONTAINER_TOOLBAR (EditorTitleBar, an HBoxContainer)
    # and move it right before EditorRunBar (the Play buttons)
    add_control_to_container(Godot::EditorPlugin::CustomControlContainer::ContainerToolbar.value, btn)

    if title_bar = btn.call_obj("get_parent")
      run_bar_idx = -1_i64
      count = title_bar.call_i64("get_child_count")
      count.times do |i|
        child = title_bar.call_obj("get_child", i)
        if child && !child.pointer.null?
          cls = child.call_str("get_class")
          c_name = child.call_str("get_name")
          if cls == "EditorRunBar" || c_name == "EditorRunBar" || c_name.includes?("RunBar")
            run_bar_idx = i
            break
          end
        end
      end

      if run_bar_idx >= 0
        title_bar.call("move_child", btn, run_bar_idx)
        Godot.print("[CrystalIntegrationPlugin] Build Crystal button placed in EditorTitleBar before EditorRunBar at index #{run_bar_idx}.")
      else
        Godot.print("[CrystalIntegrationPlugin] Build Crystal button added to ContainerToolbar.")
      end
    end

    @@compile_button = btn
  rescue ex
    Godot.printerr("[CrystalIntegrationPlugin] Warning: could not setup toolbar button: #{ex.message}")
  end

  # Handles toolbar compile button press to trigger manual Crystal rebuild
  def on_compile_button_pressed : Void
    Godot.print("[CrystalIntegrationPlugin] Triggering manual Crystal build...")
    recompile_modified_addons_silent
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
    recompile_modified_addons_silent
    execute_crystal_build
  end

  # Scans project addons/ directory and recompiles any Crystal addons whose source code changed
  def recompile_modified_addons_silent : Void
    addons_dir = "addons"
    addons_dir = "../addons" unless Dir.exists?(addons_dir)
    return unless Dir.exists?(addons_dir)

    so_ext = {% if flag?(:windows) %}
      "dll"
    {% elsif flag?(:darwin) %}
      "dylib"
    {% else %}
      "so"
    {% end %}

    link_flags = {% if flag?(:windows) %}
      "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init"
    {% elsif flag?(:darwin) %}
      "-dynamiclib"
    {% else %}
      "-shared"
    {% end %}

    Dir.each_child(addons_dir) do |entry|
      next if entry == "crystal_integration"
      addon_path = File.join(addons_dir, entry)
      next unless Dir.exists?(addon_path)

      main_cr = File.join(addon_path, "src", "main.cr")
      next unless File.exists?(main_cr)

      bin_dir = File.join(addon_path, "bin")
      Dir.mkdir_p(bin_dir) unless Dir.exists?(bin_dir)

      target_bin = File.join(bin_dir, "#{entry}.#{so_ext}")
      target_mtime = File.exists?(target_bin) ? File.info(target_bin).modification_time : ::Time.unix(0)

      # Check if any .cr file inside the addon was modified after target_bin
      needs_recompile = !File.exists?(target_bin)
      unless needs_recompile
        Dir.glob(File.join(addon_path, "**", "*.cr")).each do |src_file|
          if File.info(src_file).modification_time > target_mtime
            needs_recompile = true
            break
          end
        end
      end

      if needs_recompile
        Godot.print("[CrystalIntegrationPlugin] Recompiling modified addon: #{entry}...")
        args = ["build", "--link-flags", link_flags, main_cr, "-o", target_bin]
        status = Process.run("crystal", args)
        if status.success?
          Godot.print("[CrystalIntegrationPlugin] Successfully recompiled addon: #{entry}")
        else
          Godot.printerr("[CrystalIntegrationPlugin] Failed to recompile addon: #{entry} (exit code: #{status.exit_code})")
        end
      end
    end
  rescue ex
    Godot.printerr("[CrystalIntegrationPlugin] Error checking addon recompilation: #{ex.message}")
  end

  # Compiles project Crystal code into shared library
  def execute_crystal_build : Bool
    execute_crystal_build_with_options(false)
  end

  # Compiles project Crystal code with optional release optimizations
  def execute_crystal_build_with_options(is_release : Bool = false) : Bool
    entry_file = "src/main.cr"
    if !Godot::SystemIO.file_exists?(entry_file) && !Godot::ProjectSettings.singleton_ptr.null?
      ps = Godot::ProjectSettings.new(Godot::ProjectSettings.singleton_ptr)
      global_entry = ps.call_str("globalize_path", "res://src/main.cr").gsub('\\', '/')
      entry_file = global_entry if !global_entry.empty? && Godot::SystemIO.file_exists?(global_entry)
    end

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
    if dbg = @@debugger_plugin
      dbg.call("poll") rescue nil
    end
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

