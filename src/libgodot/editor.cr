# =============================================================================
# LibGodot - Crystal Editor Integration Plugin
# =============================================================================
# A compiled GDExtension EditorPlugin registered directly in Godot's ClassDB.
# Acts as the native backend for the Crystal integration addon, handling
# editor lifecycle events, version reporting, toolbar controls, and F5 build hooks.

@[Tool]
node CrystalIntegrationPlugin < EditorPlugin do
  tool

  # Version of the compiled LibGodot library
  @[Export]
  property version : String = ::Godot::VERSION

  # Active status of the compiled Crystal editor integration
  @[Export]
  property active : Bool = true

  # Status message visible in inspector or tooling
  @[Export]
  property status_message : String = "LibGodot Crystal Integration Active"

  # Emitted when the Crystal editor plugin finishes initialization
  signal ready_in_editor

  def _enter_tree : Void
    Godot.print("==================================================================")
    Godot.print("  [CrystalIntegrationPlugin] Native Crystal editor plugin loaded!")
    Godot.print("  LibGodot Version: #{::Godot::VERSION}")
    Godot.print("==================================================================")
    emit_ready_in_editor
  end

  def _exit_tree : Void
    Godot.print("  [CrystalIntegrationPlugin] Native Crystal editor plugin unloaded.")
  end

  # Handles toolbar compile button press to trigger manual Crystal rebuild
  def on_compile_button_pressed : Void
    Godot.print("[CrystalIntegrationPlugin] Triggering manual Crystal build...")
    success = execute_crystal_build
    if success
      Godot.print("[CrystalIntegrationPlugin] Build completed successfully!")
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
    entry_file = "test/src/main.cr" unless File.exists?(entry_file)
    entry_file = "../test/src/main.cr" unless File.exists?(entry_file)
    entry_file = "demo/src/main.cr" unless File.exists?(entry_file)

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
end
