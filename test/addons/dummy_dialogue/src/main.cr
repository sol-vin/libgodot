require "libgodot"

@[Tool]
node DialogueBox < Control do
  tool

  @[Export]
  property speaker_name : String = "Narrator"

  @[Export]
  property dialogue_text : String = "Welcome to LibGodot multi-addon test!"

  signal line_finished(speaker : String)

  def advance_line(new_text : String) : Void
    @dialogue_text = new_text
    emit_line_finished(@speaker_name)
  end
end

@[Tool]
node DummyDialoguePlugin < EditorPlugin do
  tool

  def _enter_tree : Void
    Godot.print("[DummyDialoguePlugin] Initialized successfully in editor!")
  end

  def _exit_tree : Void
    Godot.print("[DummyDialoguePlugin] Deinitialized.")
  end
end
