require "./libgodot/types"
require "./libgodot/system_io"
require "./libgodot/object"
require "./libgodot/doc_macro"
require "./libgodot/macros"
require "./libgodot/bridge"
require "./libgodot/channel"
require "./libgodot/collections"
require "./libgodot/gdextension_interface"
require "./libgodot/c_api"
require "./libgodot/instance"
require "./libgodot/generated/global_enums"
require "./libgodot/generated/classes/all_classes"
require "./libgodot/generated/singletons"
require "./libgodot/docs"
require "./libgodot/script"
require "./libgodot/editor"

module Godot
  class PackedScene < Resource
    # Convenience zero-argument instantiate defaulting edit_state to 0
    def instantiate : Node
      instantiate(0_i64)
    end

    # Instantiates the scene and casts directly to wrapper type T
    def instantiate_as(type : T.class, edit_state : Int64 = 0_i64) : T forall T
      node = instantiate(edit_state)
      if alive = Bridge.find_alive_instance(node.pointer)
        if typed = alive.as?(T)
          return typed
        end
      end
      T.new(node.pointer)
    end

    # Packs the node and all owned sub-nodes into this PackedScene via reflection.
    def pack(path : Node) : Int64
      call_i64("pack", path)
    end
  end

  class ResourceSaver < Object
    # Saves a resource to disk using dynamic reflection to ensure valid string and variant marshalling.
    def save(resource : Resource, path : String, flags : Int64 = 0_i64) : Int64
      call_i64("save", resource, path, flags)
    end
  end

  class SceneTreeTimer < RefCounted
    # Convenience time_left accessor
    def time_left : Float64
      get_time_left
    end

    # Bound signal accessor for `await(timer.timeout)` or `timer.timeout.await`
    def timeout : BoundSignal
      signal("timeout")
    end
  end

  # Cooperatively awaits a SceneTreeTimer until its countdown expires
  def self.await(timer : SceneTreeTimer) : Void
    while timer.alive? && timer.get_time_left > 0.0
      Fiber.yield
    end
  end

  class Node < Object
    getter local_groups : Set(String) = Set(String).new

    # Returns true if this node is currently a member of the active SceneTree.
    def inside_tree? : Bool
      is_inside_tree
    end

    # Adds this node to the specified group (with default non-persistent flag)
    def add_to_group(group : String) : Void
      @local_groups.add(group)
      return if @pointer.null?
      add_to_group(group, false)
    end

    # Returns true if this node belongs to the given node group.
    def in_group?(group_name : String) : Bool
      return true if @local_groups.includes?(group_name)
      return false if @pointer.null?
      is_in_group(group_name)
    end

    # Returns the parent node cast to T, or nil if parent is not of type T or is null
    def get_parent_as(type : T.class) : T? forall T
      if parent = get_parent?
        if alive = Bridge.find_alive_instance(parent.pointer)
          if typed = alive.as?(T)
            return typed
          end
        end
        T.new(parent.pointer)
      end
    end

    # Finds child node matching pattern and casts to T, returning nil if not found
    def find_child_as(type : T.class, pattern : String, recursive : Bool = true, owned : Bool = false) : T? forall T
      if child = find_child(pattern, recursive, owned)
        if alive = Bridge.find_alive_instance(child.pointer)
          if typed = alive.as?(T)
            return typed
          end
        end
        T.new(child.pointer)
      end
    end

    # Returns the scene unique node with name `%unique_name` cast to T
    def get_unique_node_as(type : T.class, unique_name : String) : T? forall T
      path = unique_name.starts_with?("%") ? unique_name : "%#{unique_name}"
      node = get_node?(path) || find_child(unique_name.lchop("%"))
      if node
        if alive = Bridge.find_alive_instance(node.pointer)
          if typed = alive.as?(T)
            return typed
          end
        end
        T.new(node.pointer)
      end
    end

    # Reliable GDExtension bridge implementation of find_child with default parameters
    def find_child(pattern : String, recursive : Bool = true, owned : Bool = false) : Node?
      ptr = Bridge.node_find_child(@pointer, pattern, recursive, owned)
      ptr.null? ? nil : Node.new(ptr)
    end

    @@mb_node_add_child : Void* = Pointer(Void).null
    @@mb_node_remove_child : Void* = Pointer(Void).null
    @@mb_node_reparent : Void* = Pointer(Void).null
    @@mb_node_get_parent : Void* = Pointer(Void).null
    @@mb_node_get_child_count : Void* = Pointer(Void).null
    @@mb_node_get_child : Void* = Pointer(Void).null
    @@mb_node_queue_free : Void* = Pointer(Void).null
    @@mb_node_is_queued_for_deletion : Void* = Pointer(Void).null
    @@mb_node_is_inside_tree : Void* = Pointer(Void).null

    # Adds a child node with optional force_readable_name and internal mode flags
    def add_child(node : Node, force_readable_name : Bool = false, internal : Int64 = 0_i64) : Void
      check_alive!
      node.check_alive!
      if @@mb_node_add_child.null?
        @@mb_node_add_child = Bridge.get_method_bind("Node", "add_child", 3863233950_i64)
      end
      arg_ptr_0 = node.pointer
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = force_readable_name ? 1_u8 : 0_u8
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = internal
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_node_add_child, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end

    # Removes a child node from this node without freeing it
    def remove_child(node : Node) : Void
      check_alive!
      node.check_alive!
      if @@mb_node_remove_child.null?
        @@mb_node_remove_child = Bridge.get_method_bind("Node", "remove_child", 1078189570_i64)
      end
      arg_ptr_0 = node.pointer
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_node_remove_child, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end

    # Changes the parent of this Node to new_parent
    def reparent(new_parent : Node, keep_global_transform : Bool = true) : Void
      check_alive!
      new_parent.check_alive!
      if @@mb_node_reparent.null?
        @@mb_node_reparent = Bridge.get_method_bind("Node", "reparent", 3685795103_i64)
      end
      arg_ptr_0 = new_parent.pointer
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = keep_global_transform ? 1_u8 : 0_u8
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_node_reparent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end

    # Returns the parent Node
    def get_parent : Node
      check_alive!
      if @@mb_node_get_parent.null?
        @@mb_node_get_parent = Bridge.get_method_bind("Node", "get_parent", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_node_get_parent, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end

    # Returns the parent Node, or nil if orphan
    def get_parent? : Node?
      return nil unless alive?
      p = get_parent
      p.pointer.null? ? nil : p
    end

    # Returns the count of children belonging to this node
    def get_child_count(include_internal : Bool = false) : Int64
      check_alive!
      if @@mb_node_get_child_count.null?
        @@mb_node_get_child_count = Bridge.get_method_bind("Node", "get_child_count", 894402480_i64)
      end
      val_0 = include_internal ? 1_u8 : 0_u8
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_node_get_child_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end

    # Retrieves child at specified index
    def get_child(idx : Int, include_internal : Bool = false) : Node
      check_alive!
      if @@mb_node_get_child.null?
        @@mb_node_get_child = Bridge.get_method_bind("Node", "get_child", 541253412_i64)
      end
      val_0 = idx.to_i64
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = include_internal ? 1_u8 : 0_u8
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_node_get_child, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end

    # Retrieves child at specified index, or nil if not found
    def get_child?(idx : Int, include_internal : Bool = false) : Node?
      return nil unless alive?
      c = get_child(idx, include_internal)
      c.pointer.null? ? nil : c
    end

    # Queues this node for deletion at the end of the current frame
    def queue_free : Void
      return unless alive?
      if @@mb_node_queue_free.null?
        @@mb_node_queue_free = Bridge.get_method_bind("Node", "queue_free", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_node_queue_free, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end

    # Checks if this node is queued for deletion
    def is_queued_for_deletion : Bool
      return false unless alive?
      if @@mb_node_is_queued_for_deletion.null?
        @@mb_node_is_queued_for_deletion = Bridge.get_method_bind("Object", "is_queued_for_deletion", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_node_is_queued_for_deletion, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end

    # Returns true if the node is currently inside the active scene tree
    def is_inside_tree : Bool
      return false unless alive?
      if @@mb_node_is_inside_tree.null?
        @@mb_node_is_inside_tree = Bridge.get_method_bind("Node", "is_inside_tree", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_node_is_inside_tree, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
end

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

# Core math and transform value-type aliases
alias Vector2 = Godot::Vector2
alias Vector2i = Godot::Vector2i
alias Vector3 = Godot::Vector3
alias Vector3i = Godot::Vector3i
alias Rect2 = Godot::Rect2
alias Color = Godot::Color
alias Basis = Godot::Basis
alias Transform3D = Godot::Transform3D

# Top-level await macro for intuitive GDScript-like calling syntax
# Usage:
#   await(enemy.died)
#   await(enemy.died, timeout_sec: 2.0)
#   await(enemy, "died")
#   await(enemy, "died", timeout_sec: 2.0)
#   await(timer.timeout)
#   await(timer)
#   await(1.5)
#   await(2.seconds)
macro await(target, signal_name = nil, timeout_sec = nil)
  {% if signal_name != nil && timeout_sec != nil %}
    ::Godot.await({{target}}, {{signal_name}}, timeout_sec: {{timeout_sec}})
  {% elsif signal_name != nil %}
    ::Godot.await({{target}}, {{signal_name}})
  {% elsif timeout_sec != nil %}
    ::Godot.await({{target}}, timeout_sec: {{timeout_sec}})
  {% else %}
    ::Godot.await({{target}})
  {% end %}
end

module Godot
  {% for s in ["Performance", "Engine", "ProjectSettings", "OS", "Time", "ClassDB", "Input", "InputMap", "DisplayServer", "AudioServer", "RenderingServer", "PhysicsServer2D", "PhysicsServer3D", "NavigationServer2D", "NavigationServer3D", "ResourceLoader", "ResourceSaver"] %}
    class {{s.id}} < Godot::Object
      @@typed_instance : {{s.id}}? = nil
      def self.instance : {{s.id}}
        @@typed_instance ||= {{s.id}}.new(singleton_ptr)
      end
    end
  {% end %}

  # Singleton accessors
  def self.input : Input
    Input.instance
  end

  def self.engine : Engine
    Engine.instance
  end

  def self.os : OS
    OS.instance
  end

  def self.project_settings : ProjectSettings
    ProjectSettings.instance
  end

  def self.display_server : DisplayServer
    DisplayServer.instance
  end

  def self.audio_server : AudioServer
    AudioServer.instance
  end

  def self.performance : Performance
    Performance.instance
  end

  def self.resource_loader : ResourceLoader
    ResourceLoader.instance
  end

  def self.resource_saver : ResourceSaver
    ResourceSaver.instance
  end

  # Resource and Scene loading helpers
  def self.load(path : String, type_hint : String = "", cache_mode : Int64 = 0_i64) : Resource
    ptr = Bridge.resource_loader_load(path, type_hint, cache_mode)
    Resource.new(ptr)
  end

  def self.load_scene(path : String) : PackedScene
    load_as(PackedScene, path)
  end

  def self.instantiate_scene(path : String, type : T.class) : T forall T
    scene = load_scene(path)
    inst = scene.instantiate
    type.new(inst.pointer)
  end
end

module Godot
  class Input < Godot::Object
    def action_pressed?(action : String, exact_match : Bool = false) : Bool
      Bridge.is_action_pressed(action, exact_match)
    end

    def action_just_pressed?(action : String, exact_match : Bool = false) : Bool
      Bridge.is_action_just_pressed(action, exact_match)
    end

    def action_just_released?(action : String, exact_match : Bool = false) : Bool
      Bridge.is_action_just_released(action, exact_match)
    end

    def axis(negative_action : String, positive_action : String) : Float32
      Bridge.get_axis(negative_action, positive_action)
    end

    def self.action_pressed?(action : String, exact_match : Bool = false) : Bool
      Bridge.is_action_pressed(action, exact_match)
    end

    def self.action_just_pressed?(action : String, exact_match : Bool = false) : Bool
      Bridge.is_action_just_pressed(action, exact_match)
    end

    def self.action_just_released?(action : String, exact_match : Bool = false) : Bool
      Bridge.is_action_just_released(action, exact_match)
    end

    def self.axis(negative_action : String, positive_action : String) : Float32
      Bridge.get_axis(negative_action, positive_action)
    end
  end

  class SceneTree < MainLoop
    def get_first_node_in_group_as(type : T.class, group_name : String) : T? forall T
      return nil if @pointer.null?
      node = get_first_node_in_group(group_name)
      return nil if node.nil? || node.pointer.null?
      node.as?(T)
    end
  end
end

# Top-level math constructors
def vec2(x : Number, y : Number) : Vector2
  Vector2.new(x.to_f32, y.to_f32)
end

def vec3(x : Number, y : Number, z : Number) : Vector3
  Vector3.new(x.to_f32, y.to_f32, z.to_f32)
end




