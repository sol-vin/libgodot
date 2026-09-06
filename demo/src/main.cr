require "../../src/libgodot"

node DemoScene do
  def _ready
    puts "============================================="
    puts "  Welcome to the Crystal LibGodot 4.8 Demo!  "
    puts "============================================="
  end
end

node DemoCharacter < CharacterBody3D do
  @[Export(range: 1.0_f32..800.0_f32, step: 10.0_f32)]
  property speed : Float32 = 300.0_f32

  @[Export(range: 0.0_f32..1000.0_f32, step: 1.0_f32)]
  property jump_velocity : Float32 = 10.0_f32

  @[Export(range: 0.0_f32..500.0_f32)]
  property gravity : Float32 = 1.0

  @[Export(range: 1..500)]
  property max_health : Int32 = 100

  signal health_changed(new_health : Int32, max_health : Int32)
  signal died

  def _ready
    puts "[DemoCharacter] Initialized at position: #{global_position}"
  end

  def _physics_process(delta : Float64) : Void
    vel = velocity

    # Apply gravity when in air
    unless is_on_floor
      vel.y -= gravity  * delta.to_f32
    end

    # Space key / ui_accept makes the character jump
    if is_on_floor && (Input.is_key_pressed(Godot::Key::Space) || Input.is_action_just_pressed("ui_accept"))
      vel.y = jump_velocity
      puts "[DemoCharacter] Space pressed! Jumping with velocity #{jump_velocity}"
    end

    self.velocity = vel
    move_and_slide
  end
end

node DemoPlayer < DemoCharacter do
end

node CustomSlider < Range do
end

node DemoHUD < Control do
  def _ready
    puts "[DemoHUD] Initializing HUD with Range cohesion..."
    slider = CustomSlider.new(0..100)
    slider.range = 10..90
    puts "[DemoHUD] Slider range set to: #{slider.to_range}"
  end
end

Godot.print "[Crystal Demo] #{Godot::ClassRegistry.entries.size} Crystal nodes registered and ready!"
Godot::ClassRegistry.entries.each do |e|
  Godot.print "  -> Node: #{e.class_name} < #{e.parent_name}"
end

if ARGV.includes?("--boot")
  instance = Godot::Instance.new("bin/libgodot.dll")
  instance.boot(ARGV)
end
