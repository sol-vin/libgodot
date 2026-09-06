require "./libgodot/types"
require "./libgodot/object"
require "./libgodot/doc_macro"
require "./libgodot/macros"
require "./libgodot/bridge"
require "./libgodot/gdscript"
require "./libgodot/gdextension_interface"
require "./libgodot/c_api"
require "./libgodot/instance"
require "./libgodot/generated/global_enums"
require "./libgodot/generated/classes/all_classes"
require "./libgodot/generated/singletons"

# # LibGodot for Crystal
#
# High-performance Crystal bindings and 2-way host language integration for Godot Engine 4.8+.
#
# ## Overview
#
# LibGodot enables Crystal to act as the primary host language for Godot games, combining Crystal's
# LLVM-compiled speed and Ruby-like elegance with Godot's powerful scene tree, rendering, and editor tooling.
#
# ### Key Features
# - **Native LibGodot Host (Option C)**: Crystal owns the executable (`game.exe`), initializing its runtime
#   and Boehm GC cleanly before booting Godot in-memory via `libgodot.dll`.
# - **Clean Macro Syntax**:
#   - `node MyNode do ... end` (defaults to inheriting `Godot::Node`)
#   - `node Player < CharacterBody3D do ... end` (inherits specified Godot node type)
#   - `signal health_changed(new_health : Int32)`
#   - `@[Export]` with full Godot Inspector hints (ranges, sliders, enums, bitflags, resource pickers, files, colors, arrays).
# - **Compile Button Hook**: The Godot Editor's Play (F5) and Build buttons invoke `crystal build` via an `EditorPlugin._build()` hook.
#
# ### Basic Example
#
# ```crystal
# require "libgodot"
#
# node Player < CharacterBody3D do
#   @[Export(range: 50.0_f32..800.0_f32, step: 10.0_f32)]
#   property speed : Float32 = 300.0_f32
#
#   @[Export(range: 100.0_f32..1000.0_f32, step: 25.0_f32)]
#   property jump_velocity : Float32 = 450.0_f32
#
#   signal health_changed(new_health : Int32, max_health : Int32)
#   signal died
#
#   def _ready
#     puts "Player ready!"
#   end
#
#   def _physics_process(delta : Float64) : Void
#     vel = velocity
#     unless is_on_floor
#       vel.y -= 980.0_f32 * delta.to_f32
#     end
#     if Input.is_action_just_pressed("jump") && is_on_floor
#       vel.y = @jump_velocity
#     end
#     self.velocity = vel
#     move_and_slide
#   end
# end
# ```
module Godot
  VERSION = "0.1.0"
end

# Top-level type aliases for developer ergonomics
alias Vector2 = Godot::Vector2
alias Vector2i = Godot::Vector2i
alias Vector3 = Godot::Vector3
alias Vector3i = Godot::Vector3i
alias Rect2 = Godot::Rect2
alias Color = Godot::Color
alias Basis = Godot::Basis
alias Transform3D = Godot::Transform3D
alias Node = Godot::Node
alias Node2D = Godot::Node2D
alias Node3D = Godot::Node3D
alias CharacterBody2D = Godot::CharacterBody2D
alias CharacterBody3D = Godot::CharacterBody3D
alias Control = Godot::Control
alias GodotRange = Godot::Range
alias ProgressBar = Godot::ProgressBar
alias PackedScene = Godot::PackedScene
alias Texture = Godot::Texture
alias Texture2D = Godot::Texture2D
alias AudioStream = Godot::AudioStream
alias NodePath = Godot::NodePath
alias Input = Godot::Input

