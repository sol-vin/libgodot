require "libgodot"

# Main root node for the template project
node MainNode < Node3D do
  # Rotation speed in radians per second
  @[Export(range: 0.1_f32..10.0_f32, step: 0.1_f32)]
  property rotation_speed : Float32 = 1.0_f32

  # Emitted when the node completes initialization
  signal initialized

  def _ready
    Godot.print("Welcome to your Crystal + Godot Game!")
    emit_initialized
  end

  def _process(delta : Float64) : Void
    # Example per-frame logic
    rot = rotation
    rot.y += rotation_speed * delta.to_f32
    self.rotation = rot
  end
end
