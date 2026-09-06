require "./types"

module Godot
  lib LibKernel32
    fun GetModuleHandleA(lpModuleName : LibC::Char*) : Void*
    fun GetProcAddress(hModule : Void*, lpProcName : LibC::Char*) : Void*
  end

  # Godot Engine Logging & Diagnostics System
  @@bridge_print : (LibC::Char* -> Void)? = nil
  @@bridge_printerr : (LibC::Char* -> Void)? = nil
  @@bridge_error : ((LibC::Char*, LibC::Char*, LibC::Char*, Int32) -> Void)? = nil
  @@bridge_warning : ((LibC::Char*, LibC::Char*, LibC::Char*, Int32) -> Void)? = nil
  @@bridge_initialized : Bool = false

  def self.init_bridge_logging
    return if @@bridge_initialized
    @@bridge_initialized = true
    h_bridge = LibKernel32.GetModuleHandleA("crystal_bridge.dll")
    if !h_bridge.null?
      fn_p = LibKernel32.GetProcAddress(h_bridge, "crystal_godot_print")
      @@bridge_print = Proc(LibC::Char*, Void).new(fn_p, Pointer(Void).null) unless fn_p.null?

      fn_perr = LibKernel32.GetProcAddress(h_bridge, "crystal_godot_printerr")
      @@bridge_printerr = Proc(LibC::Char*, Void).new(fn_perr, Pointer(Void).null) unless fn_perr.null?

      fn_err = LibKernel32.GetProcAddress(h_bridge, "crystal_godot_error")
      @@bridge_error = Proc(LibC::Char*, LibC::Char*, LibC::Char*, Int32, Void).new(fn_err, Pointer(Void).null) unless fn_err.null?

      fn_warn = LibKernel32.GetProcAddress(h_bridge, "crystal_godot_warning")
      @@bridge_warning = Proc(LibC::Char*, LibC::Char*, LibC::Char*, Int32, Void).new(fn_warn, Pointer(Void).null) unless fn_warn.null?
    end
  end

  def self.print(*args)
    msg = args.join(" ")
    if Bridge.api && !Bridge.api.null?
      Bridge.print(msg)
    else
      puts msg
    end
  end

  def self.printerr(*args)
    msg = args.join(" ")
    if Bridge.api && !Bridge.api.null?
      Bridge.printerr(msg)
    else
      STDERR.puts msg
    end
  end

  def self.print_error(msg : String, func : String = "", file : String = __FILE__, line : Int32 = __LINE__)
    if Bridge.api && !Bridge.api.null?
      Bridge.error(msg, "", func, file, line)
    else
      STDERR.puts "[ERROR] #{msg} (#{file}:#{line} in #{func})"
    end
  end

  def self.print_warning(msg : String, func : String = "", file : String = __FILE__, line : Int32 = __LINE__)
    if Bridge.api && !Bridge.api.null?
      Bridge.warning(msg, "", func, file, line)
    else
      STDERR.puts "[WARNING] #{msg}"
    end
  end

  # Base class for all Godot engine objects and extension classes.
  # Provides identity, lifecycle dispatch hooks, and signal emission functionality.
  class Object
    property pointer : Void* = Pointer(Void).null

    def initialize(@pointer : Void* = Pointer(Void).null)
    end

    # Virtual method and property dispatch hooks overridden by class registration macros.
    # Delta timestep is received with 64-bit precision (`Float64`).
    def _godot_call_virtual(method_name : String, delta : Float64) : Void
    end

    # Invoked by the GDExtension bridge when setting an exposed `@export` property.
    def _godot_set_property(prop_name : String, val_ptr : Void*) : Void
    end

    # Invoked by the GDExtension bridge when retrieving an exposed `@export` property.
    def _godot_get_property(prop_name : String, ret_ptr : Void*) : Void
    end

    # Emits a parameterless signal on this Godot object.
    def emit_signal(name : String) : Void
      Bridge.emit_signal(@pointer, name)
    end

    # Emits a signal with variable arguments on this Godot object.
    def emit_signal(name : String, *args) : Void
      Bridge.emit_signal(@pointer, name, *args)
    end

    # Calls the named method on the object during idle time.
    def call_deferred(method : String, *args) : Void*
      Bridge.object_call_deferred(@pointer, method, *args)
      Pointer(Void).null
    end

    # Calls the named method on the object with variable arguments.
    def call(method : String, *args) : Void*
      Bridge.object_call(@pointer, method, *args)
      Pointer(Void).null
    end

    # Connects a callback proc to the named signal.
    def connect(signal_name : String, callback : Proc) : Void
      # Connects callback to named signal
    end

    # Prints a message to Godot's debug console.
    def print(*args)
      Godot.print(*args)
    end

    # Prints an error message to Godot's error console.
    def printerr(*args)
      Godot.printerr(*args)
    end

    # Prints a message to Godot's debug console.
    def puts(*args)
      Godot.print(*args)
    end

    def to_s(io : IO) : Void
      io << "<Godot::" << self.class.name << " @" << @pointer << ">"
    end
  end

  # Base class for reference-counted engine objects.
  class RefCounted < Object
  end

  class Resource < RefCounted
  end

  class Texture < Resource
  end

  class Texture2D < Texture
  end

  class AudioStream < Resource
  end

  class PackedScene < Resource
    def instantiate : Node?
      # Instantiates scene hierarchy
      Node.new
    end
  end

  class MainLoop < Object
  end

  # Manages the hierarchy of scene nodes and execution loops.
  class SceneTree < MainLoop
    property current_scene : Node = Node.new
    property root : Node = Node.new
  end

  # Base class for all scene tree nodes in Godot.
  # Provides hierarchy management, node traversal, and lifecycle hooks (`_ready`, `_process`, `_physics_process`).
  class Node < Object
    property name : String = "Node"

    # Returns the SceneTree containing this node.
    def get_tree : SceneTree
      SceneTree.new
    end

    # Retrieves a child or sibling node by NodePath string.
    # Returns the Node if found, or produces an error if the node does not exist.
    def get_node(path : String) : Node
      ptr = Bridge.node_get_node(@pointer, path)
      if ptr.null?
        Godot.printerr("Node not found: '#{path}' (relative to '#{self.name}')")
        raise "Node not found: '#{path}' (relative to '#{self.name}')"
      end
      Node.new(ptr)
    end

    # Retrieves a child or sibling node by NodePath string, or returns nil if not found.
    def get_node?(path : String) : Node?
      ptr = Bridge.node_get_node(@pointer, path)
      ptr.null? ? nil : Node.new(ptr)
    end

    # Fetches a node by String path. Similar to `#get_node`, but returns nil if `path` does not point to a valid node.
    def get_node_or_null(path : String) : Node?
      get_node?(path)
    end

    # Retrieves a child node cast to the specified Crystal class type `T`.
    # Returns the node cast to `T`, or produces an error if the node does not exist.
    def get_node_as(type : T.class, path : String) : T forall T
      node = get_node(path)
      T.new(node.pointer)
    end

    # Retrieves a child node cast to the specified Crystal class type `T`, or nil if not found.
    def get_node_as?(type : T.class, path : String) : T? forall T
      if node = get_node?(path)
        T.new(node.pointer)
      end
    end

    # Finds an existing child node matching `pattern`.
    def find_child(pattern : String, recursive : Bool = true, owned : Bool = false) : Node?
      ptr = Bridge.node_find_child(@pointer, pattern, recursive, owned)
      ptr.null? ? nil : Node.new(ptr)
    end

    # Finds a child node matching `pattern` and casts to `T`.
    def find_child_as(type : T.class, pattern : String, recursive : Bool = true, owned : Bool = false) : T? forall T
      if node = find_child(pattern, recursive, owned)
        T.new(node.pointer)
      end
    end

    def add_child(node : Node) : Void
    end

    def remove_child(node : Node) : Void
    end

    def queue_free : Void
    end

    # Lifecycle callback called when the node enters the active scene tree.
    def _ready : Void
    end

    # Per-frame process callback receiving delta timestep in seconds (`Float64`).
    def _process(delta : Float64) : Void
    end

    # Fixed-rate physics process callback receiving delta timestep in seconds (`Float64`).
    def _physics_process(delta : Float64) : Void
    end
  end

  # Base class for all 2D canvas items, UI elements, and 2D nodes.
  class CanvasItem < Node
  end

  # A 2D game object with position, rotation, and scale transform.
  class Node2D < CanvasItem
    @position : Vector2 = Vector2.new
    @rotation : Float32 = 0.0_f32
    @scale : Vector2 = Vector2.new(1.0_f32, 1.0_f32)
    property global_position : Vector2 = Vector2.new

    def position : Vector2
      if !@pointer.null?
        get_position
      else
        @position
      end
    end

    def position=(v : Vector2)
      @position = v
      if !@pointer.null?
        set_position(v)
      end
    end

    def rotation : Float32
      if !@pointer.null?
        get_rotation.to_f32
      else
        @rotation
      end
    end

    def rotation=(v : Float32)
      @rotation = v
      if !@pointer.null?
        set_rotation(v.to_f64)
      end
    end

    def scale : Vector2
      if !@pointer.null?
        get_scale
      else
        @scale
      end
    end

    def scale=(v : Vector2)
      @scale = v
      if !@pointer.null?
        set_scale(v)
      end
    end
  end

  # A 3D game object with spatial position, rotation, scale, and transform matrix.
  class Node3D < Node
    @position : Vector3 = Vector3.new
    @rotation : Vector3 = Vector3.new
    @scale : Vector3 = Vector3.new(1.0_f32, 1.0_f32, 1.0_f32)
    property global_position : Vector3 = Vector3.new
    property transform : Transform3D = Transform3D.new

    def position : Vector3
      if !@pointer.null?
        get_position
      else
        @position
      end
    end

    def position=(v : Vector3)
      @position = v
      if !@pointer.null?
        set_position(v)
      end
    end

    def rotation : Vector3
      if !@pointer.null?
        get_rotation
      else
        @rotation
      end
    end

    def rotation=(v : Vector3)
      @rotation = v
      if !@pointer.null?
        set_rotation(v)
      end
    end

    def scale : Vector3
      if !@pointer.null?
        get_scale
      else
        @scale
      end
    end

    def scale=(v : Vector3)
      @scale = v
      if !@pointer.null?
        set_scale(v)
      end
    end
  end

  # Base class for all 2D collision and physics objects.
  class CollisionObject2D < Node2D
  end

  # Base class for all 2D physics bodies.
  class PhysicsBody2D < CollisionObject2D
  end

  # Specialized 2D physics body for character movement, kinematic platforming, and gravity.
  class CharacterBody2D < PhysicsBody2D
    property velocity : Vector2 = Vector2.new

    def is_on_floor : Bool
      true
    end

    def move_and_slide : Bool
      true
    end
  end

  # Base class for all 3D collision and physics objects.
  class CollisionObject3D < Node3D
  end

  # Base class for all 3D physics bodies.
  class PhysicsBody3D < CollisionObject3D
  end

  # Specialized 3D physics body for characters, kinematic controllers, and navigation.
  class CharacterBody3D < PhysicsBody3D
    property velocity : Vector3 = Vector3.new

    # Returns true if the body is currently resting on a floor collider.
    def is_on_floor : Bool
      if !@pointer.null?
        Bridge.is_on_floor(@pointer)
      else
        true
      end
    end

    # Current linear velocity of the character body.
    def velocity : Vector3
      if !@pointer.null?
        Bridge.get_velocity(@pointer)
      else
        @velocity
      end
    end

    def velocity=(v : Vector3)
      @velocity = v
      if !@pointer.null?
        Bridge.set_velocity(@pointer, v)
      end
    end

    # Moves the body along its velocity vector and handles collisions/sliding.
    def move_and_slide : Bool
      if !@pointer.null?
        Bridge.move_and_slide(@pointer)
      else
        true
      end
    end
  end

  # Base class for all GUI and user interface controls.
  class Control < CanvasItem
  end

  # Base class for numeric control elements (sliders, progress bars, spinboxes).
  class Range < Control
    property min_value : Float64 = 0.0
    property max_value : Float64 = 100.0
    property step : Float64 = 1.0
    property page : Float64 = 0.0
    property value : Float64 = 0.0

    def initialize(min : Number = 0.0, max : Number = 100.0, @step : Float64 = 1.0)
      super()
      @min_value = min.to_f64
      @max_value = max.to_f64
    end

    def value=(val : Number)
      @value = val.to_f64
      Bridge.range_set_value(@pointer, @value) unless @pointer.null?
    end

    def set_value(val : Number) : Void
      self.value = val
    end

    # Type cohesion: Initialize from a Crystal Range
    def self.new(crystal_range : ::Range(Number, Number), step : Number = 1.0)
      new(crystal_range.begin, crystal_range.end, step.to_f64)
    end

    # Type cohesion: Set bounds using a Crystal Range (e.g. control.range = 0..100)
    def range=(crystal_range : ::Range(Number, Number))
      @min_value = crystal_range.begin.to_f64
      @max_value = crystal_range.end.to_f64
    end

    # Type cohesion: Read bounds as a Crystal Range
    def to_range : ::Range(Float64, Float64)
      @min_value..@max_value
    end

    # Type cohesion: Check if a value falls within the Range bounds
    def includes?(val : Number) : Bool
      to_range.includes?(val.to_f64)
    end

    def in_range?(val : Number) : Bool
      includes?(val)
    end

    def ratio : Float64
      span = @max_value - @min_value
      span > 0 ? (@value - @min_value) / span : 0.0
    end
  end

  # Visual progress bar control displaying completion ratio.
  class ProgressBar < Range
  end

  # Base class for slider controls.
  class Slider < Range
  end

  # Horizontal slider control.
  class HSlider < Slider
  end

  # Vertical slider control.
  class VSlider < Slider
  end

  # Numeric entry spinbox control with up/down adjusters.
  class SpinBox < Range
  end

  # Singleton interface for handling keyboard, mouse, gamepad, and mapped input actions.
  class Input < Object
    def self.is_action_pressed(action : String) : Bool
      Bridge.is_action_pressed(action)
    end

    def self.is_action_just_pressed(action : String) : Bool
      Bridge.is_action_just_pressed(action)
    end

    def self.is_action_just_released(action : String) : Bool
      false
    end

    def self.is_key_pressed(key : Key | Int32) : Bool
      Bridge.is_key_pressed(key.to_i32) || Bridge.is_physical_key_pressed(key.to_i32)
    end

    def self.is_physical_key_pressed(key : Key | Int32) : Bool
      Bridge.is_physical_key_pressed(key.to_i32)
    end

    def self.get_vector(negative_x : String, positive_x : String, negative_y : String, positive_y : String) : Vector2
      Vector2.new(0.0_f32, 0.0_f32)
    end
  end

  # Represents a path to a node or property in the Godot scene tree.
  struct NodePath
    property path : String

    def initialize(@path : String = "")
    end
  end
end

# Crystal Standard Library Extension: Type cohesion for Crystal Range <-> Godot
struct Range(B, E)
  # Converts Crystal range into a Godot::Range control node
  def to_godot_range(step : Number = 1.0) : Godot::Range
    Godot::Range.new(self, step)
  end

  # Converts Crystal range to a Godot PROPERTY_HINT_RANGE hint string (e.g. "0,100" or "0,100,0.5")
  def to_godot_hint_string(step : Number? = nil) : String
    if s = step
      "#{self.begin},#{self.end},#{s}"
    else
      "#{self.begin},#{self.end}"
    end
  end

  # Converts to float tuple for engine interop
  def to_godot_bounds : Tuple(Float64, Float64)
    {self.begin.to_f64, self.end.to_f64}
  end
end
