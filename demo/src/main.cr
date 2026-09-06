require "../../src/libgodot"

# # Crystal LibGodot 4.8 Interactive Demo
#
# Showcases:
# 1. 3D physics movement (WASD, Sprint, Jump, and E=Crystal Dash) with CharacterBody3D
# 2. Dynamic collectible crystals with sinusoidal bobbing & continuous rotation
# 3. Proximity detection and automatic crystal pickup with score accumulation
# 4. Godot Inspector @[Export] properties with live tweakable ranges
# 5. Compile-time doc comments appearing in Godot Editor tooltips and F1 Help
# 6. GDScript interop macro calling methods, statics, and properties
# 7. Hotkeys: H=Heal, J=Damage, R=Respawn Crystals, C=Companion Chat, E=Dash
# 8. Crystal Signal emissions and Range type cohesion

# Main scene controller managing game lifecycle and stats
node DemoScene do
  def _ready
    Godot.print("==================================================================")
    Godot.print("       Welcome to the Crystal LibGodot 4.8 Interactive Demo!      ")
    Godot.print("  Move: WASD / Arrows | Sprint: Shift | Jump: Space | Dash: E     ")
    Godot.print("  Actions: H=Heal | J=Damage | R=Respawn Gems | C=Companion Chat  ")
    Godot.print("  Walk near floating crystals to collect them and earn score!     ")
    Godot.print("==================================================================")
  end
end

# Floating and rotating collectible crystal
# An animated floating collectible crystal that spins, bobs, and rewards score
node SpinningCrystal < Node3D do
  # Global registry of all active crystals in the scene
  class_property all : Array(SpinningCrystal) = [] of SpinningCrystal

  def self.reset_all! : Void
    count = 0
    @@all.each do |c|
      if c.collected
        c.reset!
        count += 1
      end
    end
    Godot.print("[SpinningCrystal] Respawned #{count} crystals!")
  end

  # Rotation rate in radians per second
  @[Export(range: 0.1_f32..10.0_f32, step: 0.1_f32, doc: "Rotation speed in radians/second")]
  property rotation_speed : Float32 = 2.5_f32

  # Vertical oscillation height
  @[Export(range: 0.05_f32..1.5_f32, step: 0.05_f32, doc: "Vertical bobbing amplitude")]
  property bob_height : Float32 = 0.25_f32

  # Vertical oscillation speed
  @[Export(range: 0.5_f32..10.0_f32, step: 0.5_f32, doc: "Vertical bobbing frequency")]
  property bob_frequency : Float32 = 3.0_f32

  # Score value awarded when collected
  @[Export(range: 10..1000, step: 10)]
  property score_value : Int32 = 100

  # Custom test property for inspector testing
  @[Export]
  property my_new_property : Int32 = 100

  # Custom test property for inspector testing
  @[Export]
  property my_new_property2_electric : Int32 = 567

  # Custom test property for inspector testing
  @[Export]
  property my_new_property3_coedsrevenge : Int32 = 9787

  # Custom test property for inspector testing
  @[Export]
  property my_new_property4_theticklere : Int32 = 21772

  # Whether this crystal has been collected
  property collected : Bool = false

  # Internal elapsed time counter for sine wave
  property elapsed_time : Float32 = 0.0_f32
  property base_y : Float32 = 1.0_f32

  signal crystal_collected(value : Int32)

  def _ready
    @base_y = position.y
    SpinningCrystal.all << self
    Godot.print("[SpinningCrystal] Ready at #{position} with value #{@score_value}!")
  end

  def _process(delta : Float64) : Void
    return if @collected

    dt = delta.to_f32
    @elapsed_time += dt

    # Smooth continuous Y-axis rotation
    rot = rotation
    rot.y += @rotation_speed * dt
    self.rotation = rot

    # Sinusoidal vertical bobbing
    pos = position
    pos.y = @base_y + Math.sin(@elapsed_time * @bob_frequency) * @bob_height
    self.position = pos
  end

  def collect! : Int32
    return 0 if @collected
    @collected = true
    emit_crystal_collected(@score_value)
    Godot.print("[SpinningCrystal] Collected! +#{score_value} points!")
    # Visually hide crystal by scaling down
    self.scale = Vector3.new(0.0_f32, 0.0_f32, 0.0_f32)
    @score_value
  end

  def reset! : Void
    @collected = false
    @elapsed_time = 0.0_f32
    self.scale = Vector3.new(1.0_f32, 1.0_f32, 1.0_f32)
  end
end

# Primary playable 3D character
node DemoCharacter < CharacterBody3D do
  # Active player instance for global access
  class_property current_player : DemoCharacter? = nil

  # Base ground movement speed
  @[Export(range: 1.0_f32..15.0_f32, step: 0.5_f32, doc: "Base movement speed in meters per second")]
  property speed : Float32 = 6.5_f32

  # Sprint multiplier applied when holding Shift
  @[Export(range: 1.1_f32..3.0_f32, step: 0.1_f32, doc: "Sprint multiplier while holding Shift")]
  property sprint_multiplier : Float32 = 1.8_f32

  # Vertical jump impulse velocity
  @[Export(range: 1.0_f32..25.0_f32, step: 0.5_f32, doc: "Vertical jump impulse")]
  property jump_velocity : Float32 = 7.5_f32

  # Downward gravitational acceleration
  @[Export(range: 1.0_f32..50.0_f32, step: 1.0_f32, doc: "Gravity acceleration")]
  property gravity : Float32 = 18.0_f32

  # Maximum character hit points
  @[Export(range: 10..500, step: 10)]
  property max_health : Int32 = 100

  # Custom test property for inspector testing
  @[Export]
  property my_new_property : Int32 = 100

  # Current player hit points
  property current_health : Int32 = 100

  # Player current score
  property current_score : Int32 = 0

  # Dash cooldown in seconds
  property dash_cooldown : Float32 = 0.0_f32

  # Last movement heading direction
  property last_dir_x : Float32 = 0.0_f32
  property last_dir_z : Float32 = -1.0_f32

  signal health_changed(new_health : Int32, max_health : Int32)
  signal score_changed(new_score : Int32)
  signal died

  # Interactive physics character with WASD movement, jumping, dash, and health
  def _ready
    @current_health = @max_health
    DemoCharacter.current_player = self
    Godot.print("[DemoCharacter] Spawned at position: #{position}")
  end

  def _physics_process(delta : Float64) : Void
    dt = delta.to_f32
    vel = velocity

    if @dash_cooldown > 0.0_f32
      @dash_cooldown = Math.max(0.0_f32, @dash_cooldown - dt)
    end

    # Apply downward gravity when airborne
    unless is_on_floor
      vel.y -= @gravity * dt
    end

    # Handle Jump (Space bar or ui_accept)
    if is_on_floor && (Input.is_key_pressed(Godot::Key::Space) || Input.is_action_just_pressed("ui_accept"))
      vel.y = @jump_velocity
      Godot.print("[DemoCharacter] Jump triggered! Y-velocity: #{@jump_velocity}")
    end

    # Interactive test hotkeys:
    # H = Heal (+15 HP)
    if Input.is_key_pressed(Godot::Key::H)
      heal(15)
    # J = Damage (-15 HP)
    elsif Input.is_key_pressed(Godot::Key::J)
      take_damage(15)
    end

    # R = Respawn Crystals
    if Input.is_key_pressed(Godot::Key::R)
      SpinningCrystal.reset_all!
    end

    # C = Talk to Companion
    if Input.is_key_pressed(Godot::Key::C)
      CompanionController.interact_with_player(@current_score, @current_health)
    end

    # Determine move speed (with Shift sprint)
    current_speed = @speed
    if Input.is_key_pressed(Godot::Key::Shift)
      current_speed *= @sprint_multiplier
    end

    # 3D Direction Vector from WASD / Arrow keys
    dir_x = 0.0_f32
    dir_z = 0.0_f32

    # W / Up = Forward (-Z)
    if Input.is_key_pressed(Godot::Key::W) || Input.is_key_pressed(Godot::Key::Up)
      dir_z -= 1.0_f32
    end
    # S / Down = Backward (+Z)
    if Input.is_key_pressed(Godot::Key::S) || Input.is_key_pressed(Godot::Key::Down)
      dir_z += 1.0_f32
    end
    # A / Left = Left (-X)
    if Input.is_key_pressed(Godot::Key::A) || Input.is_key_pressed(Godot::Key::Left)
      dir_x -= 1.0_f32
    end
    # D / Right = Right (+X)
    if Input.is_key_pressed(Godot::Key::D) || Input.is_key_pressed(Godot::Key::Right)
      dir_x += 1.0_f32
    end

    # Normalize horizontal movement direction
    len_sq = dir_x * dir_x + dir_z * dir_z
    if len_sq > 0.0001_f32
      inv_len = 1.0_f32 / Math.sqrt(len_sq)
      dir_x *= inv_len
      dir_z *= inv_len
      @last_dir_x = dir_x
      @last_dir_z = dir_z

      vel.x = dir_x * current_speed
      vel.z = dir_z * current_speed
    else
      # Smooth deceleration toward 0
      vel.x = Math.move_toward(vel.x, 0.0_f32, 15.0_f32 * dt)
      vel.z = Math.move_toward(vel.z, 0.0_f32, 15.0_f32 * dt)
    end

    # E = Crystal Dash ability
    if Input.is_key_pressed(Godot::Key::E) && @dash_cooldown <= 0.0_f32
      dash_impulse = 18.0_f32
      vel.x = @last_dir_x * dash_impulse
      vel.z = @last_dir_z * dash_impulse
      @dash_cooldown = 1.2_f32
      Godot.print("[DemoCharacter] Crystal Dash activated! Speed burst: #{dash_impulse} m/s")
    end

    # Commit velocity and execute physics slide
    self.velocity = vel
    move_and_slide

    # Proximity collection check for all crystals
    p_pos = position
    SpinningCrystal.all.each do |crystal|
      next if crystal.collected
      c_pos = crystal.position
      dx = p_pos.x - c_pos.x
      dy = p_pos.y - c_pos.y
      dz = p_pos.z - c_pos.z
      dist_sq = dx * dx + dy * dy + dz * dz
      if dist_sq < 2.5_f32 # ~1.58m radius pickup range
        earned = crystal.collect!
        add_score(earned)
      end
    end
  end

  def take_damage(amount : Int32) : Void
    @current_health = Math.max(0, @current_health - amount)
    emit_health_changed(@current_health, @max_health)
    Godot.print("[DemoCharacter] Took #{amount} damage! Health: #{@current_health}/#{@max_health}")
    if @current_health <= 0
      emit_died
      Godot.print("[DemoCharacter] Character died! Press H to revive!")
    end
  end

  def heal(amount : Int32) : Void
    @current_health = Math.min(@max_health, @current_health + amount)
    emit_health_changed(@current_health, @max_health)
    Godot.print("[DemoCharacter] Healed #{amount}! Health: #{@current_health}/#{@max_health}")
  end

  def add_score(amount : Int32) : Void
    @current_score += amount
    emit_score_changed(@current_score)
    Godot.print("[DemoCharacter] Total Score: #{@current_score}")
  end
end

# Specialized player character node inheriting DemoCharacter
node DemoPlayer < DemoCharacter do
end

node CompanionController < Node do
  class_property current_instance : CompanionController? = nil
  property last_interaction_time : Float64 = 0.0

  bind_gdscript_methods do
    gdscript_method calculate_bonus(score : Int32)
    gdscript_static_method get_system_status
    gdscript_method cheer(score : Int32)
    gdscript_method praise_player(name : String)
    gdscript_property bonus_multiplier : Float32
  end

  def self.interact_with_player(score : Int32, health : Int32) : Void
    if inst = @@current_instance
      now = Time.utc.to_unix_f
      if now - inst.last_interaction_time > 1.0 # 1s throttle
        inst.last_interaction_time = now
        inst.chat(score, health)
      end
    end
  end

  # Demonstrates binding and calling GDScript methods from Crystal
  def _ready
    @@current_instance = self
    Godot.print("[CompanionController] Initialized GDScript interop bindings!")
    calculate_bonus(100)
    CompanionController.get_system_status
  end

  def chat(score : Int32, health : Int32) : Void
    Godot.print("[Companion] Checking in...")
    cheer(score)
    praise_player("CrystalExplorer")
    status = CompanionController.get_system_status
    Godot.print("[Companion] Status: #{status}")
  end
end

# In-Game UI Controller showcasing Range cohesion and health bar tracking
node DemoHUD < Control do
  @health_bar : Godot::Range? = nil

  def _ready
    Godot.print("[DemoHUD] HUD activated with Range cohesion and health bar tracking.")
    # Crystal Range cohesion demonstration
    godot_range = (0..100).to_godot_range(step: 1.0)
    Godot.print("[DemoHUD] Created Godot::Range with bounds: #{godot_range.to_range}")

    if hb = find_child("HealthBar", recursive: true, owned: false)
      @health_bar = Godot::Range.new(hb.pointer)
      Godot.print("[DemoHUD] HealthBar found and bound to Range control!")
    else
      Godot.printerr("[DemoHUD] HealthBar node not found in HUD children!")
    end
  end

  def _process(delta : Float64) : Void
    if bar = @health_bar
      if player = DemoCharacter.current_player
        bar.set_value(player.current_health.to_f64)
      end
    end
  end
end

Godot.print "[Crystal Demo] Successfully loaded interactive showcase with #{Godot::ClassRegistry.entries.size} nodes!"
