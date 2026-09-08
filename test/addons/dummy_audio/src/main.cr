require "libgodot"

@[Tool]
node AudioStreamPlayerCrystal < Node do
  tool

  @[Export]
  property volume_db : Float32 = 0.0_f32

  @[Export]
  property bus_name : String = "Master"

  @[Export]
  property is_playing : Bool = false

  signal playback_started(bus : String)

  def play_stream : Void
    @is_playing = true
    emit_playback_started(@bus_name)
  end

  def stop_stream : Void
    @is_playing = false
  end
end

@[Tool]
node DummyAudioPlugin < EditorPlugin do
  tool

  def _enter_tree : Void
    Godot.print("[DummyAudioPlugin] Initialized successfully in editor!")
  end

  def _exit_tree : Void
    Godot.print("[DummyAudioPlugin] Deinitialized.")
  end
end
