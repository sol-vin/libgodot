require "libgodot"

# Sample player demonstrating first-class Crystal scripts in Godot 4
node SamplePlayer < CharacterBody2D do
  # Movement speed in pixels per second
  @[Export(range: 50.0_f32..1000.0_f32, step: 10.0_f32)]
  property speed : Float32 = 300.0_f32

  # Maximum player health
  @[Export(range: 10..500, step: 5)]
  property max_health : Int32 = 100

  # Current health points
  property health : Int32 = 100

  # Emitted when player receives damage
  signal damaged(amount : Int32, remaining_health : Int32)

  # Emitted when player health reaches zero
  signal died

  def _ready : Void
    Godot.print("SamplePlayer initialized: #{name}")
  end

  def _physics_process(delta : Float64) : Void
    # Movement calculation
  end
end
