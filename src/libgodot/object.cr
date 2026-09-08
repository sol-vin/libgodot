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

  # Returns true if the code is currently executing inside the Godot Editor
  def self.editor_hint? : Bool
    engine = Bridge.get_singleton("Engine")
    return false if engine.null?
    mb = Bridge.get_method_bind("Engine", "is_editor_hint", 36873697_i64)
    return false if mb.null?
    ret = 0_u8
    Bridge.ptrcall(mb, engine, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
    ret != 0_u8
  end

  # Loads a resource from the given path (e.g. "res://scenes/my_scene.tscn")
  def self.load(path : String, type_hint : String = "", cache_mode : Int64 = 0_i64) : Resource
    ptr = Bridge.resource_loader_load(path, type_hint, cache_mode)
    Resource.new(ptr)
  end

  # Preloads/loads a resource from the given path
  def self.preload(path : String) : Resource
    self.load(path)
  end

  # Loads a resource and casts to the given Crystal resource class (e.g. PackedScene)
  def self.load_as(type : T.class, path : String, type_hint : String = "", cache_mode : Int64 = 0_i64) : T forall T
    res = self.load(path, type_hint, cache_mode)
    T.new(res.pointer)
  end

  # Constructs a new native Godot engine object of the given class name (e.g. "Node2D", "MeshInstance3D", "BoxMesh")
  def self.create(class_name : String) : Node
    ptr = Bridge.construct_object(class_name)
    Node.new(ptr)
  end

  # Constructs a new native Godot engine object and wraps it in the given Crystal class
  def self.create(type : T.class) : T forall T
    class_name = {{ T.name.stringify.split("::").last }}
    ptr = Bridge.construct_object(class_name)
    if inst = Bridge.find_alive_instance(ptr)
      if casted = inst.as?(T)
        return casted
      end
    end
    T.new(ptr)
  end

  # Raised when an operation is attempted on a Godot Object that has been deleted or freed.
  class DisposedObjectError < Exception
    getter instance_id : UInt64
    def initialize(@instance_id : UInt64 = 0_u64, msg : String? = nil)
      message = msg || "Attempted to operate on a deleted or freed Godot Object (instance ID: #{@instance_id})"
      super(message)
    end
  end

  # Represents an active signal subscription or awaiter
  class SignalSubscription
    getter target_id : UInt64
    getter signal_name : String
    getter? completed : Bool = false
    getter args : Array(String) = Array(String).new
    getter callback : Proc(Array(String), Void)?

    def initialize(@target_id : UInt64, @signal_name : String, @callback : Proc(Array(String), Void)? = nil)
    end

    def trigger(signal_args : Array(String)) : Void
      @completed = true
      @args = signal_args
      if cb = @callback
        begin
          cb.call(signal_args)
        rescue ex
          Godot.printerr("[CrystalSignal] Error executing callback for '#{@signal_name}' on #{target_id}: #{ex.message}\n#{ex.backtrace.join("\n")}")
        end
      end
    end
  end

  class_getter signal_subs = Hash(Tuple(UInt64, String), Array(SignalSubscription)).new
  class_getter signal_subs_mutex = ::Thread::Mutex.new

  # Subscribes an awaiter or callback to a signal on a target object instance ID
  def self.subscribe_signal(target_id : UInt64, signal_name : String, callback : Proc(Array(String), Void)? = nil) : SignalSubscription
    sub = SignalSubscription.new(target_id, signal_name, callback)
    key = {target_id, signal_name}
    signal_subs_mutex.synchronize do
      list = signal_subs[key] ||= Array(SignalSubscription).new
      list << sub
    end
    sub
  end

  # Unsubscribes a signal subscription
  def self.unsubscribe_signal(sub : SignalSubscription) : Void
    key = {sub.target_id, sub.signal_name}
    signal_subs_mutex.synchronize do
      if list = signal_subs[key]?
        list.delete(sub)
        signal_subs.delete(key) if list.empty?
      end
    end
  end

  # Cleans up all signal subscriptions associated with a target instance ID
  def self.clear_signal_subscriptions(target_id : UInt64) : Void
    return if target_id == 0
    signal_subs_mutex.synchronize do
      signal_subs.reject! { |(tid, _), _| tid == target_id }
    end
  end

  # Notifies active subscribers that a signal has fired on an object
  def self.notify_signal(target_id : UInt64, signal_name : String, args : Array(String)) : Void
    return if target_id == 0
    key = {target_id, signal_name}
    subs_to_notify = nil
    signal_subs_mutex.synchronize do
      if list = signal_subs[key]?
        subs_to_notify = list.dup
      end
    end
    subs_to_notify.try(&.each(&.trigger(args)))
  end

  # Cooperatively awaits until the named signal is emitted on the target object.
  # Returns the emitted arguments as an Array(String).
  # If the target object is freed while awaiting, raises Godot::DisposedObjectError.
  def self.await(target : Godot::Object, signal_name : String, timeout_sec : Float64? = nil) : Array(String)
    target.check_alive!
    target_id = target.signal_target_id
    sub = subscribe_signal(target_id, signal_name)
    if !target.pointer.null? && target.instance_id > 0
      Bridge.object_connect_signal(target.pointer, signal_name)
    end
    start_time = ::Time.instant
    begin
      while !sub.completed?
        # Dead-pointer validation: fail fast if target was destroyed
        if !target.alive?
          raise DisposedObjectError.new(target_id, "Target object was destroyed while awaiting signal '#{signal_name}'")
        end
        if timeout = timeout_sec
          if (::Time.instant - start_time).total_seconds >= timeout
            break
          end
        end
        Fiber.yield
      end
      sub.args
    ensure
      unsubscribe_signal(sub)
    end
  end

  # Cooperatively pauses execution for the given duration in seconds.
  # Safe for use in cooperative fibers without blocking the Godot main loop.
  def self.await(seconds : Number) : Void
    start_time = ::Time.instant
    target_sec = seconds.to_f64
    while (::Time.instant - start_time).total_seconds < target_sec
      Fiber.yield
    end
  end

  # Cooperatively pauses execution for the given Time::Span duration.
  def self.await(span : ::Time::Span) : Void
    await(span.total_seconds)
  end

  # Represents a signal bound to a specific Godot object instance.
  # Enables first-class signal handling, inspection, connection, emission, and non-blocking `await`.
  #
  # Examples:
  # ```crystal
  # await(enemy.died)
  # await(enemy.died, timeout_sec: 2.0)
  # enemy.died.await
  # enemy.health_changed.connect { |args| puts "Health: #{args}" }
  # ```
  class BoundSignal
    getter target : Godot::Object
    getter name : String

    def initialize(@target : Godot::Object, @name : String)
    end

    # Returns the target's 64-bit instance ID (or Crystal object_id for unparented Crystal nodes)
    def target_id : UInt64
      @target.signal_target_id
    end

    # Returns true if the bound object is still alive in ObjectDB
    def alive? : Bool
      @target.alive?
    end

    # Cooperatively awaits this signal without blocking the engine main loop.
    # Returns the emitted arguments as an Array(String).
    def await(timeout_sec : Float64? = nil) : Array(String)
      Godot.await(@target, @name, timeout_sec)
    end

    # Cooperatively awaits this signal with timeout in seconds
    def await(timeout_sec : Number) : Array(String)
      Godot.await(@target, @name, timeout_sec.to_f64)
    end

    # Connects a callback proc to this signal
    def connect(callback : Proc(Array(String), Void)) : SignalSubscription
      @target.connect(@name, callback)
    end

    # Connects a callback block to this signal
    def connect(&block : Array(String) -> Void) : SignalSubscription
      @target.connect(@name, &block)
    end

    # Connects a one-shot callback block that automatically disconnects after firing once
    def connect_one_shot(&block : Array(String) -> Void) : SignalSubscription
      sub : SignalSubscription? = nil
      actual_sub = connect do |args|
        begin
          block.call(args)
        ensure
          sub.try { |s| Godot.unsubscribe_signal(s) }
        end
      end
      sub = actual_sub
      actual_sub
    end

    # Connects this signal to a method call on a target object by symbol name
    def connect(listener_target : Godot::Object, method_name : Symbol) : SignalSubscription
      connect do |_args|
        listener_target.call(method_name.to_s)
      end
    end

    # Disconnects all active subscriptions for this signal on the target
    def disconnect : Void
      @target.disconnect(@name)
    end

    # Emits this signal on the target object
    def emit(*args) : Void
      @target.emit_signal(@name, *args)
    end

    def to_s(io : IO) : Void
      io << "#<Godot::BoundSignal @" << @name << " on " << @target.class.name << " (id: " << target_id << ")>"
    end
  end

  alias Signal = BoundSignal

  # Cooperatively awaits a bound signal.
  # Usage:
  #   args = Godot.await(enemy.died)
  #   args = Godot.await(enemy.died, timeout_sec: 3.0)
  def self.await(signal : Godot::BoundSignal, timeout_sec : Float64? = nil) : Array(String)
    signal.await(timeout_sec)
  end

  # Cooperatively awaits a bound signal with timeout.
  def self.await(signal : Godot::BoundSignal, timeout_sec : Number) : Array(String)
    signal.await(timeout_sec.to_f64)
  end

  # Cooperatively awaits a signal on a target object with numeric timeout.
  def self.await(target : Godot::Object, signal_name : String, timeout_sec : Number) : Array(String)
    await(target, signal_name, timeout_sec.to_f64)
  end

  # Base class for all Godot engine objects and extension classes.
  # Provides identity, lifecycle dispatch hooks, and signal emission functionality.
  class Object
    property pointer : Void* = Pointer(Void).null
    getter instance_id : UInt64 = 0_u64
    getter? destroyed : Bool = false

    def initialize(@pointer : Void* = Pointer(Void).null)
      if !@pointer.null?
        @instance_id = Bridge.object_get_instance_id(@pointer)
      end
    end

    def pointer=(val : Void*)
      @pointer = val
      if !@pointer.null?
        @instance_id = Bridge.object_get_instance_id(@pointer)
      else
        @instance_id = 0_u64
      end
    end

    # Identifier used for signal routing and lifecycle tracking (engine instance ID or Crystal object_id)
    def signal_target_id : UInt64
      @instance_id > 0 ? @instance_id : object_id
    end

    # Returns true if this object instance is still alive and valid in Godot's ObjectDB
    def alive? : Bool
      return false if @destroyed
      if @instance_id > 0
        Bridge.is_instance_valid(@instance_id)
      else
        !@destroyed
      end
    end

    def is_valid? : Bool
      alive?
    end

    def destroyed? : Bool
      @destroyed || !alive?
    end

    # Returns true if running inside the Godot Editor
    def editor_hint? : Bool
      Godot.editor_hint?
    end

    # Validates that the underlying engine object is still alive before executing bridge calls.
    # Raises `DisposedObjectError` if the object was destroyed by GDScript, engine, or Crystal.
    def check_alive! : Void
      if @destroyed || (@instance_id > 0 && !Bridge.is_instance_valid(@instance_id))
        @pointer = Pointer(Void).null
        raise DisposedObjectError.new(@instance_id)
      end
    end

    # Destroys this Object in the Godot engine and invalidates the Crystal pointer.
    def destroy : Void
      @destroyed = true
      Godot.clear_signal_subscriptions(signal_target_id)
      if !@pointer.null?
        target_ptr = @pointer
        @pointer = Pointer(Void).null
        Bridge.object_destroy(target_ptr)
      end
    end

    # Destroys this Object in the Godot engine (alias to #destroy).
    def free : Void
      destroy
    end

    # Checks if a 64-bit instance ID is currently valid in Godot's ObjectDB
    def self.is_instance_id_valid(id : Int | UInt64) : Bool
      Bridge.is_instance_valid(id.to_u64)
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

    # Checks if this object class overrides a generic virtual method.
    def self._godot_has_virtual_method(method_name : String) : Bool
      false
    end

    # Dispatches generic virtual methods with raw arguments and return buffer.
    def _godot_call_virtual_with_data(method_name : String, args : Void**, ret : Void*) : Void
    end

    # Emits a parameterless signal on this Godot object.
    def emit_signal(name : String) : Void
      check_alive!
      Godot.notify_signal(signal_target_id, name, [] of String)
      Bridge.emit_signal(@pointer, name) unless @pointer.null?
    end

    # Emits a signal with variable arguments on this Godot object.
    def emit_signal(name : String, *args) : Void
      check_alive!
      str_args = args.map(&.to_s).to_a
      Godot.notify_signal(signal_target_id, name, str_args)
      Bridge.emit_signal(@pointer, name, *args) unless @pointer.null?
    end

    # Cooperatively awaits a signal emitted on this object.
    def await_signal(signal_name : String, timeout_sec : Float64? = nil) : Array(String)
      Godot.await(self, signal_name, timeout_sec)
    end

    # Returns a bound signal representation for the named signal.
    # Enables idiomatic usage: `enemy.signal("died").await` or `button.signal("pressed").connect { ... }`.
    def signal(name : String) : Godot::BoundSignal
      Godot::BoundSignal.new(self, name)
    end

    # Calls the named method on the object during idle time.
    def call_deferred(method : String, *args) : Void*
      check_alive!
      Bridge.object_call_deferred(@pointer, method, *args)
      Pointer(Void).null
    end

    # Calls the named method on the object with variable arguments.
    def call(method : String, *args) : Void*
      check_alive!
      Bridge.object_call(@pointer, method, *args)
      Pointer(Void).null
    end

    # Calls the named method and returns an Object/Node (or nil if null)
    def call_obj(method : String, *args) : Node?
      check_alive!
      ptr = Bridge.object_call_ret_object(@pointer, method, *args)
      ptr.null? ? nil : Node.new(ptr)
    end

    # Calls the named method and returns the result cast to T (or nil if null)
    def call_obj_as(type : T.class, method : String, *args) : T? forall T
      check_alive!
      ptr = Bridge.object_call_ret_object(@pointer, method, *args)
      ptr.null? ? nil : T.new(ptr)
    end

    # Calls the named method and returns the result as Int64
    def call_i64(method : String, *args) : Int64
      check_alive!
      Bridge.object_call_ret_int(@pointer, method, *args)
    end

    # Calls the named method and returns the result as Float64
    def call_f64(method : String, *args) : Float64
      check_alive!
      Bridge.object_call_ret_float(@pointer, method, *args)
    end

    # Calls the named method and returns the result as Bool
    def call_bool(method : String, *args) : Bool
      check_alive!
      Bridge.object_call_ret_bool(@pointer, method, *args)
    end

    # Calls the named method and returns the result as String
    def call_str(method : String, *args) : String
      check_alive!
      Bridge.object_call_ret_string(@pointer, method, *args)
    end

    # Connects a callback proc to the named signal.
    def connect(signal_name : String, callback : Proc(Array(String), Void)) : SignalSubscription
      check_alive!
      sub = Godot.subscribe_signal(signal_target_id, signal_name, callback)
      if !@pointer.null? && @instance_id > 0
        Bridge.object_connect_signal(@pointer, signal_name)
      end
      sub
    end

    # Connects a callback block to the named signal.
    def connect(signal_name : String, &block : Array(String) -> Void) : SignalSubscription
      check_alive!
      sub = Godot.subscribe_signal(signal_target_id, signal_name, block)
      if !@pointer.null? && @instance_id > 0
        Bridge.object_connect_signal(@pointer, signal_name)
      end
      sub
    end

    # Connects a one-shot callback block to the named signal.
    def connect_one_shot(signal_name : String, &block : Array(String) -> Void) : SignalSubscription
      signal(signal_name).connect_one_shot(&block)
    end

    # Connects the named signal to a method call on a listener target by symbol name.
    def connect(signal_name : String, listener_target : Godot::Object, method_name : Symbol) : SignalSubscription
      signal(signal_name).connect(listener_target, method_name)
    end

    # Disconnects all signal subscriptions for the named signal on this object.
    def disconnect(signal_name : String) : Void
      key = {signal_target_id, signal_name}
      Godot.signal_subs_mutex.synchronize do
        Godot.signal_subs.delete(key)
      end
      if !@pointer.null? && @instance_id > 0
        Bridge.object_disconnect_signal(@pointer, signal_name)
      end
    end

    # Returns true if this object or its registered class defines the given signal.
    def has_signal?(signal_name : String) : Bool
      check_alive!
      class_name = self.class.name.split("::").last
      if entry = Godot::ClassRegistry.find(class_name)
        return true if entry.signals.any? { |s| s.name == signal_name }
      end
      key = {signal_target_id, signal_name}
      Godot.signal_subs_mutex.synchronize do
        return true if Godot.signal_subs.has_key?(key)
      end
      false
    end

    # Returns the count of active subscriptions for the given signal on this object.
    def signal_connection_count(signal_name : String) : Int32
      key = {signal_target_id, signal_name}
      Godot.signal_subs_mutex.synchronize do
        if list = Godot.signal_subs[key]?
          list.size
        else
          0
        end
      end
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
      io << "<Godot::" << self.class.name << " #" << @instance_id << " @" << @pointer << ">"
    end
  end

  # Base class for reference-counted engine objects.
  class RefCounted < Object
    @@mb_ref_init_ref : Void* = Pointer(Void).null
    @@mb_ref_reference : Void* = Pointer(Void).null
    @@mb_ref_unreference : Void* = Pointer(Void).null
    @@mb_ref_get_reference_count : Void* = Pointer(Void).null

    def init_ref : Bool
      check_alive!
      if @@mb_ref_init_ref.null?
        @@mb_ref_init_ref = Bridge.get_method_bind("RefCounted", "init_ref", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_ref_init_ref, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end

    def reference : Bool
      check_alive!
      if @@mb_ref_reference.null?
        @@mb_ref_reference = Bridge.get_method_bind("RefCounted", "reference", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_ref_reference, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end

    def unreference : Bool
      return false if !alive?
      if @@mb_ref_unreference.null?
        @@mb_ref_unreference = Bridge.get_method_bind("RefCounted", "unreference", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_ref_unreference, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end

    def get_reference_count : Int64
      check_alive!
      if @@mb_ref_get_reference_count.null?
        @@mb_ref_get_reference_count = Bridge.get_method_bind("RefCounted", "get_reference_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_ref_get_reference_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
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
    # Instantiates the scene's node hierarchy.
    def instantiate(edit_state : Int64 = 0_i64) : Node
      ptr = Bridge.packed_scene_instantiate(@pointer, edit_state)
      Node.new(ptr)
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
    @name : String = "Node"

    def name : String
      if @pointer.null?
        @name
      else
        godot_name = Bridge.node_get_name(@pointer)
        godot_name.empty? ? @name : godot_name
      end
    end

    def name=(val : String)
      @name = val
      if !@pointer.null?
        self.call("set_name", val)
      end
    end

    # Returns the SceneTree containing this node.
    def get_tree : SceneTree
      SceneTree.new
    end

    # Retrieves a child or sibling node by NodePath string.
    # Returns the Node if found, or produces an error if the node does not exist.
    def get_node(path : String) : Node
      ptr = Bridge.node_get_node(@pointer, path)
      if ptr.null?
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

    def initialize(pointer : Void*)
      @path = ""
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

# Global convenience helper to load resources from Godot VFS
def load(path : String, type_hint : String = "", cache_mode : Int64 = 0_i64) : Godot::Resource
  Godot.load(path, type_hint, cache_mode)
end

# Global convenience helper to preload resources from Godot VFS
def preload(path : String) : Godot::Resource
  Godot.preload(path)
end
