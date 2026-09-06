# Generated core classes
module Godot
  class Object < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ConnectFlags : Int64
      ConnectDeferred = 1_i64
      ConnectPersist = 2_i64
      ConnectOneShot = 4_i64
      ConnectReferenceCounted = 8_i64
      ConnectAppendSourceObject = 16_i64
    end
    @@mb_get_class : Void* = Pointer(Void).null
    def get_class() : String
      if @@mb_get_class.null?
        @@mb_get_class = Bridge.get_method_bind("Object", "get_class", 201670096_i64)
      end
      ""
    end
    @@mb_is_class : Void* = Pointer(Void).null
    def is_class(godot_class : String) : Bool
      if @@mb_is_class.null?
        @@mb_is_class = Bridge.get_method_bind("Object", "is_class", 2619796661_i64)
      end
      val_0 = godot_class
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_class, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set : Void* = Pointer(Void).null
    def set(property : String, value : Void*) : Void
      if @@mb_set.null?
        @@mb_set = Bridge.get_method_bind("Object", "set", 3776071444_i64)
      end
      val_0 = property
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get : Void* = Pointer(Void).null
    def get(property : String) : Void*
      if @@mb_get.null?
        @@mb_get = Bridge.get_method_bind("Object", "get", 2760726917_i64)
      end
      val_0 = property
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_indexed : Void* = Pointer(Void).null
    def set_indexed(property_path : NodePath, value : Void*) : Void
      if @@mb_set_indexed.null?
        @@mb_set_indexed = Bridge.get_method_bind("Object", "set_indexed", 3500910842_i64)
      end
      val_0 = property_path
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_indexed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_indexed : Void* = Pointer(Void).null
    def get_indexed(property_path : NodePath) : Void*
      if @@mb_get_indexed.null?
        @@mb_get_indexed = Bridge.get_method_bind("Object", "get_indexed", 4006125091_i64)
      end
      val_0 = property_path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_indexed, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_property_list : Void* = Pointer(Void).null
    def get_property_list() : Godot::Array
      if @@mb_get_property_list.null?
        @@mb_get_property_list = Bridge.get_method_bind("Object", "get_property_list", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_property_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_method_list : Void* = Pointer(Void).null
    def get_method_list() : Godot::Array
      if @@mb_get_method_list.null?
        @@mb_get_method_list = Bridge.get_method_bind("Object", "get_method_list", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_method_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_property_can_revert : Void* = Pointer(Void).null
    def property_can_revert(property : String) : Bool
      if @@mb_property_can_revert.null?
        @@mb_property_can_revert = Bridge.get_method_bind("Object", "property_can_revert", 2619796661_i64)
      end
      val_0 = property
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_property_can_revert, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_property_get_revert : Void* = Pointer(Void).null
    def property_get_revert(property : String) : Void*
      if @@mb_property_get_revert.null?
        @@mb_property_get_revert = Bridge.get_method_bind("Object", "property_get_revert", 2760726917_i64)
      end
      val_0 = property
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_property_get_revert, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_notification : Void* = Pointer(Void).null
    def notification(what : Int64, reversed : Bool) : Void
      if @@mb_notification.null?
        @@mb_notification = Bridge.get_method_bind("Object", "notification", 4023243586_i64)
      end
      val_0 = what
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = reversed
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_notification, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_to_string : Void* = Pointer(Void).null
    def to_string() : String
      if @@mb_to_string.null?
        @@mb_to_string = Bridge.get_method_bind("Object", "to_string", 2841200299_i64)
      end
      ""
    end
    @@mb_get_instance_id : Void* = Pointer(Void).null
    def get_instance_id() : Int64
      if @@mb_get_instance_id.null?
        @@mb_get_instance_id = Bridge.get_method_bind("Object", "get_instance_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_instance_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_script : Void* = Pointer(Void).null
    def set_script(script : Void*) : Void
      if @@mb_set_script.null?
        @@mb_set_script = Bridge.get_method_bind("Object", "set_script", 1114965689_i64)
      end
      val_0 = script
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_script, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_script : Void* = Pointer(Void).null
    def get_script() : Void*
      if @@mb_get_script.null?
        @@mb_get_script = Bridge.get_method_bind("Object", "get_script", 1214101251_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_script, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_meta : Void* = Pointer(Void).null
    def set_meta(name : String, value : Void*) : Void
      if @@mb_set_meta.null?
        @@mb_set_meta = Bridge.get_method_bind("Object", "set_meta", 3776071444_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_meta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_meta : Void* = Pointer(Void).null
    def remove_meta(name : String) : Void
      if @@mb_remove_meta.null?
        @@mb_remove_meta = Bridge.get_method_bind("Object", "remove_meta", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_meta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_meta : Void* = Pointer(Void).null
    def get_meta(name : String, default : Void*) : Void*
      if @@mb_get_meta.null?
        @@mb_get_meta = Bridge.get_method_bind("Object", "get_meta", 3990617847_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = default
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_meta, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_has_meta : Void* = Pointer(Void).null
    def has_meta(name : String) : Bool
      if @@mb_has_meta.null?
        @@mb_has_meta = Bridge.get_method_bind("Object", "has_meta", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_meta, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_meta_list : Void* = Pointer(Void).null
    def get_meta_list() : Godot::Array
      if @@mb_get_meta_list.null?
        @@mb_get_meta_list = Bridge.get_method_bind("Object", "get_meta_list", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_meta_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_add_user_signal : Void* = Pointer(Void).null
    def add_user_signal(signal : String, arguments : Godot::Array) : Void
      if @@mb_add_user_signal.null?
        @@mb_add_user_signal = Bridge.get_method_bind("Object", "add_user_signal", 85656714_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = arguments ? arguments.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_user_signal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_user_signal : Void* = Pointer(Void).null
    def has_user_signal(signal : String) : Bool
      if @@mb_has_user_signal.null?
        @@mb_has_user_signal = Bridge.get_method_bind("Object", "has_user_signal", 2619796661_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_user_signal, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_remove_user_signal : Void* = Pointer(Void).null
    def remove_user_signal(signal : String) : Void
      if @@mb_remove_user_signal.null?
        @@mb_remove_user_signal = Bridge.get_method_bind("Object", "remove_user_signal", 3304788590_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_user_signal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_emit_signal : Void* = Pointer(Void).null
    def emit_signal(signal : String) : Int64
      if @@mb_emit_signal.null?
        @@mb_emit_signal = Bridge.get_method_bind("Object", "emit_signal", 4047867050_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_emit_signal, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_call : Void* = Pointer(Void).null
    def call(method : String) : Void*
      if @@mb_call.null?
        @@mb_call = Bridge.get_method_bind("Object", "call", 3400424181_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_call, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_call_deferred : Void* = Pointer(Void).null
    def call_deferred(method : String) : Void*
      if @@mb_call_deferred.null?
        @@mb_call_deferred = Bridge.get_method_bind("Object", "call_deferred", 3400424181_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_call_deferred, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_deferred : Void* = Pointer(Void).null
    def set_deferred(property : String, value : Void*) : Void
      if @@mb_set_deferred.null?
        @@mb_set_deferred = Bridge.get_method_bind("Object", "set_deferred", 3776071444_i64)
      end
      val_0 = property
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_deferred, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_callv : Void* = Pointer(Void).null
    def callv(method : String, arg_array : Godot::Array) : Void*
      if @@mb_callv.null?
        @@mb_callv = Bridge.get_method_bind("Object", "callv", 1260104456_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = arg_array ? arg_array.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_callv, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_has_method : Void* = Pointer(Void).null
    def has_method(method : String) : Bool
      if @@mb_has_method.null?
        @@mb_has_method = Bridge.get_method_bind("Object", "has_method", 2619796661_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_method, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_method_argument_count : Void* = Pointer(Void).null
    def get_method_argument_count(method : String) : Int64
      if @@mb_get_method_argument_count.null?
        @@mb_get_method_argument_count = Bridge.get_method_bind("Object", "get_method_argument_count", 2458036349_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_method_argument_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_signal : Void* = Pointer(Void).null
    def has_signal(signal : String) : Bool
      if @@mb_has_signal.null?
        @@mb_has_signal = Bridge.get_method_bind("Object", "has_signal", 2619796661_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_signal, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_signal_list : Void* = Pointer(Void).null
    def get_signal_list() : Godot::Array
      if @@mb_get_signal_list.null?
        @@mb_get_signal_list = Bridge.get_method_bind("Object", "get_signal_list", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_signal_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_signal_connection_list : Void* = Pointer(Void).null
    def get_signal_connection_list(signal : String) : Godot::Array
      if @@mb_get_signal_connection_list.null?
        @@mb_get_signal_connection_list = Bridge.get_method_bind("Object", "get_signal_connection_list", 3147814860_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_signal_connection_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_incoming_connections : Void* = Pointer(Void).null
    def get_incoming_connections() : Godot::Array
      if @@mb_get_incoming_connections.null?
        @@mb_get_incoming_connections = Bridge.get_method_bind("Object", "get_incoming_connections", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_incoming_connections, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_connect : Void* = Pointer(Void).null
    def connect(signal : String, callable : Void*, flags : Int64) : Int64
      if @@mb_connect.null?
        @@mb_connect = Bridge.get_method_bind("Object", "connect", 1518946055_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = flags
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_connect, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_disconnect : Void* = Pointer(Void).null
    def disconnect(signal : String, callable : Void*) : Void
      if @@mb_disconnect.null?
        @@mb_disconnect = Bridge.get_method_bind("Object", "disconnect", 1874754934_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_disconnect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_connected : Void* = Pointer(Void).null
    def is_connected(signal : String, callable : Void*) : Bool
      if @@mb_is_connected.null?
        @@mb_is_connected = Bridge.get_method_bind("Object", "is_connected", 768136979_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_connected, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_connections : Void* = Pointer(Void).null
    def has_connections(signal : String) : Bool
      if @@mb_has_connections.null?
        @@mb_has_connections = Bridge.get_method_bind("Object", "has_connections", 2619796661_i64)
      end
      val_0 = signal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_connections, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_block_signals : Void* = Pointer(Void).null
    def set_block_signals(enable : Bool) : Void
      if @@mb_set_block_signals.null?
        @@mb_set_block_signals = Bridge.get_method_bind("Object", "set_block_signals", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_block_signals, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_blocking_signals : Void* = Pointer(Void).null
    def is_blocking_signals() : Bool
      if @@mb_is_blocking_signals.null?
        @@mb_is_blocking_signals = Bridge.get_method_bind("Object", "is_blocking_signals", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_blocking_signals, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_notify_property_list_changed : Void* = Pointer(Void).null
    def notify_property_list_changed() : Void
      if @@mb_notify_property_list_changed.null?
        @@mb_notify_property_list_changed = Bridge.get_method_bind("Object", "notify_property_list_changed", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_notify_property_list_changed, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_message_translation : Void* = Pointer(Void).null
    def set_message_translation(enable : Bool) : Void
      if @@mb_set_message_translation.null?
        @@mb_set_message_translation = Bridge.get_method_bind("Object", "set_message_translation", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_message_translation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_can_translate_messages : Void* = Pointer(Void).null
    def can_translate_messages() : Bool
      if @@mb_can_translate_messages.null?
        @@mb_can_translate_messages = Bridge.get_method_bind("Object", "can_translate_messages", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_can_translate_messages, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_tr : Void* = Pointer(Void).null
    def tr(message : String, context : String) : String
      if @@mb_tr.null?
        @@mb_tr = Bridge.get_method_bind("Object", "tr", 1195764410_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = context
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_tr_n : Void* = Pointer(Void).null
    def tr_n(message : String, plural_message : String, n : Int64, context : String) : String
      if @@mb_tr_n.null?
        @@mb_tr_n = Bridge.get_method_bind("Object", "tr_n", 162698058_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = plural_message
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = n
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = context
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ""
    end
    @@mb_get_translation_domain : Void* = Pointer(Void).null
    def get_translation_domain() : String
      if @@mb_get_translation_domain.null?
        @@mb_get_translation_domain = Bridge.get_method_bind("Object", "get_translation_domain", 2002593661_i64)
      end
      ""
    end
    @@mb_set_translation_domain : Void* = Pointer(Void).null
    def set_translation_domain(domain : String) : Void
      if @@mb_set_translation_domain.null?
        @@mb_set_translation_domain = Bridge.get_method_bind("Object", "set_translation_domain", 3304788590_i64)
      end
      val_0 = domain
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_translation_domain, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_queued_for_deletion : Void* = Pointer(Void).null
    def is_queued_for_deletion() : Bool
      if @@mb_is_queued_for_deletion.null?
        @@mb_is_queued_for_deletion = Bridge.get_method_bind("Object", "is_queued_for_deletion", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_queued_for_deletion, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_cancel_free : Void* = Pointer(Void).null
    def cancel_free() : Void
      if @@mb_cancel_free.null?
        @@mb_cancel_free = Bridge.get_method_bind("Object", "cancel_free", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_cancel_free, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
  end
  class RefCounted < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_init_ref : Void* = Pointer(Void).null
    def init_ref() : Bool
      if @@mb_init_ref.null?
        @@mb_init_ref = Bridge.get_method_bind("RefCounted", "init_ref", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_init_ref, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_reference : Void* = Pointer(Void).null
    def reference() : Bool
      if @@mb_reference.null?
        @@mb_reference = Bridge.get_method_bind("RefCounted", "reference", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_reference, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_unreference : Void* = Pointer(Void).null
    def unreference() : Bool
      if @@mb_unreference.null?
        @@mb_unreference = Bridge.get_method_bind("RefCounted", "unreference", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_unreference, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_reference_count : Void* = Pointer(Void).null
    def get_reference_count() : Int64
      if @@mb_get_reference_count.null?
        @@mb_get_reference_count = Bridge.get_method_bind("RefCounted", "get_reference_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_reference_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Node < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ProcessMode : Int64
      ProcessModeInherit = 0_i64
      ProcessModePausable = 1_i64
      ProcessModeWhenPaused = 2_i64
      ProcessModeAlways = 3_i64
      ProcessModeDisabled = 4_i64
    end
    enum ProcessThreadGroup : Int64
      ProcessThreadGroupInherit = 0_i64
      ProcessThreadGroupMainThread = 1_i64
      ProcessThreadGroupSubThread = 2_i64
    end
    enum ProcessThreadMessages : Int64
      FlagProcessThreadMessages = 1_i64
      FlagProcessThreadMessagesPhysics = 2_i64
      FlagProcessThreadMessagesAll = 3_i64
    end
    enum PhysicsInterpolationMode : Int64
      PhysicsInterpolationModeInherit = 0_i64
      PhysicsInterpolationModeOn = 1_i64
      PhysicsInterpolationModeOff = 2_i64
    end
    enum DuplicateFlags : Int64
      DuplicateSignals = 1_i64
      DuplicateGroups = 2_i64
      DuplicateScripts = 4_i64
      DuplicateUseInstantiation = 8_i64
      DuplicateInternalState = 16_i64
      DuplicateDefault = 15_i64
    end
    enum InternalMode : Int64
      InternalModeDisabled = 0_i64
      InternalModeFront = 1_i64
      InternalModeBack = 2_i64
    end
    enum AutoTranslateMode : Int64
      AutoTranslateModeInherit = 0_i64
      AutoTranslateModeAlways = 1_i64
      AutoTranslateModeDisabled = 2_i64
    end
    @@mb_print_orphan_nodes : Void* = Pointer(Void).null
    def print_orphan_nodes() : Void
      if @@mb_print_orphan_nodes.null?
        @@mb_print_orphan_nodes = Bridge.get_method_bind("Node", "print_orphan_nodes", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_print_orphan_nodes, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_orphan_node_ids : Void* = Pointer(Void).null
    def get_orphan_node_ids() : Godot::Array
      if @@mb_get_orphan_node_ids.null?
        @@mb_get_orphan_node_ids = Bridge.get_method_bind("Node", "get_orphan_node_ids", 2915620761_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_orphan_node_ids, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_add_sibling : Void* = Pointer(Void).null
    def add_sibling(sibling : Node, force_readable_name : Bool) : Void
      if @@mb_add_sibling.null?
        @@mb_add_sibling = Bridge.get_method_bind("Node", "add_sibling", 2570952461_i64)
      end
      arg_ptr_0 = sibling ? sibling.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = force_readable_name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_sibling, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_name : Void* = Pointer(Void).null
    def set_name(name : String) : Void
      if @@mb_set_name.null?
        @@mb_set_name = Bridge.get_method_bind("Node", "set_name", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_name : Void* = Pointer(Void).null
    def get_name() : String
      if @@mb_get_name.null?
        @@mb_get_name = Bridge.get_method_bind("Node", "get_name", 2002593661_i64)
      end
      ""
    end
    @@mb_add_child : Void* = Pointer(Void).null
    def add_child(node : Node, force_readable_name : Bool, internal : Int64) : Void
      if @@mb_add_child.null?
        @@mb_add_child = Bridge.get_method_bind("Node", "add_child", 3863233950_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = force_readable_name
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = internal
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_child, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_child : Void* = Pointer(Void).null
    def remove_child(node : Node) : Void
      if @@mb_remove_child.null?
        @@mb_remove_child = Bridge.get_method_bind("Node", "remove_child", 1078189570_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_child, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reparent : Void* = Pointer(Void).null
    def reparent(new_parent : Node, keep_global_transform : Bool) : Void
      if @@mb_reparent.null?
        @@mb_reparent = Bridge.get_method_bind("Node", "reparent", 3685795103_i64)
      end
      arg_ptr_0 = new_parent ? new_parent.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = keep_global_transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reparent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_child_count : Void* = Pointer(Void).null
    def get_child_count(include_internal : Bool) : Int64
      if @@mb_get_child_count.null?
        @@mb_get_child_count = Bridge.get_method_bind("Node", "get_child_count", 894402480_i64)
      end
      val_0 = include_internal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_child_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_children : Void* = Pointer(Void).null
    def get_children(include_internal : Bool) : Godot::Array
      if @@mb_get_children.null?
        @@mb_get_children = Bridge.get_method_bind("Node", "get_children", 873284517_i64)
      end
      val_0 = include_internal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_children, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_child : Void* = Pointer(Void).null
    def get_child(idx : Int64, include_internal : Bool) : Node
      if @@mb_get_child.null?
        @@mb_get_child = Bridge.get_method_bind("Node", "get_child", 541253412_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = include_internal
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_child, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_has_node : Void* = Pointer(Void).null
    def has_node(path : NodePath) : Bool
      if @@mb_has_node.null?
        @@mb_has_node = Bridge.get_method_bind("Node", "has_node", 861721659_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_node : Void* = Pointer(Void).null
    def get_node(path : NodePath) : Node
      if @@mb_get_node.null?
        @@mb_get_node = Bridge.get_method_bind("Node", "get_node", 2734337346_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_get_node_or_null : Void* = Pointer(Void).null
    def get_node_or_null(path : NodePath) : Node
      if @@mb_get_node_or_null.null?
        @@mb_get_node_or_null = Bridge.get_method_bind("Node", "get_node_or_null", 2734337346_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_or_null, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_get_parent : Void* = Pointer(Void).null
    def get_parent() : Node
      if @@mb_get_parent.null?
        @@mb_get_parent = Bridge.get_method_bind("Node", "get_parent", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_parent, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_find_child : Void* = Pointer(Void).null
    def find_child(pattern : String, recursive : Bool, owned : Bool) : Node
      if @@mb_find_child.null?
        @@mb_find_child = Bridge.get_method_bind("Node", "find_child", 2008217037_i64)
      end
      val_0 = pattern
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = recursive
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = owned
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_child, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_find_children : Void* = Pointer(Void).null
    def find_children(pattern : String, get_type : String, recursive : Bool, owned : Bool) : Godot::Array
      if @@mb_find_children.null?
        @@mb_find_children = Bridge.get_method_bind("Node", "find_children", 2560337219_i64)
      end
      val_0 = pattern
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = recursive
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = owned
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_children, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_find_parent : Void* = Pointer(Void).null
    def find_parent(pattern : String) : Node
      if @@mb_find_parent.null?
        @@mb_find_parent = Bridge.get_method_bind("Node", "find_parent", 1140089439_i64)
      end
      val_0 = pattern
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_parent, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_has_node_and_resource : Void* = Pointer(Void).null
    def has_node_and_resource(path : NodePath) : Bool
      if @@mb_has_node_and_resource.null?
        @@mb_has_node_and_resource = Bridge.get_method_bind("Node", "has_node_and_resource", 861721659_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_node_and_resource, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_node_and_resource : Void* = Pointer(Void).null
    def get_node_and_resource(path : NodePath) : Godot::Array
      if @@mb_get_node_and_resource.null?
        @@mb_get_node_and_resource = Bridge.get_method_bind("Node", "get_node_and_resource", 502563882_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_and_resource, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_is_inside_tree : Void* = Pointer(Void).null
    def is_inside_tree() : Bool
      if @@mb_is_inside_tree.null?
        @@mb_is_inside_tree = Bridge.get_method_bind("Node", "is_inside_tree", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_inside_tree, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_part_of_edited_scene : Void* = Pointer(Void).null
    def is_part_of_edited_scene() : Bool
      if @@mb_is_part_of_edited_scene.null?
        @@mb_is_part_of_edited_scene = Bridge.get_method_bind("Node", "is_part_of_edited_scene", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_part_of_edited_scene, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_ancestor_of : Void* = Pointer(Void).null
    def is_ancestor_of(node : Node) : Bool
      if @@mb_is_ancestor_of.null?
        @@mb_is_ancestor_of = Bridge.get_method_bind("Node", "is_ancestor_of", 3093956946_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_ancestor_of, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_greater_than : Void* = Pointer(Void).null
    def is_greater_than(node : Node) : Bool
      if @@mb_is_greater_than.null?
        @@mb_is_greater_than = Bridge.get_method_bind("Node", "is_greater_than", 3093956946_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_greater_than, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_path : Void* = Pointer(Void).null
    def get_path() : NodePath
      if @@mb_get_path.null?
        @@mb_get_path = Bridge.get_method_bind("Node", "get_path", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_get_path_to : Void* = Pointer(Void).null
    def get_path_to(node : Node, use_unique_path : Bool) : NodePath
      if @@mb_get_path_to.null?
        @@mb_get_path_to = Bridge.get_method_bind("Node", "get_path_to", 498846349_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = use_unique_path
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_path_to, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_add_to_group : Void* = Pointer(Void).null
    def add_to_group(group : String, persistent : Bool) : Void
      if @@mb_add_to_group.null?
        @@mb_add_to_group = Bridge.get_method_bind("Node", "add_to_group", 3683006648_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = persistent
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_to_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_from_group : Void* = Pointer(Void).null
    def remove_from_group(group : String) : Void
      if @@mb_remove_from_group.null?
        @@mb_remove_from_group = Bridge.get_method_bind("Node", "remove_from_group", 3304788590_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_from_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_in_group : Void* = Pointer(Void).null
    def is_in_group(group : String) : Bool
      if @@mb_is_in_group.null?
        @@mb_is_in_group = Bridge.get_method_bind("Node", "is_in_group", 2619796661_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_in_group, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_move_child : Void* = Pointer(Void).null
    def move_child(child_node : Node, to_index : Int64) : Void
      if @@mb_move_child.null?
        @@mb_move_child = Bridge.get_method_bind("Node", "move_child", 3315886247_i64)
      end
      arg_ptr_0 = child_node ? child_node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = to_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_child, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_groups : Void* = Pointer(Void).null
    def get_groups() : Godot::Array
      if @@mb_get_groups.null?
        @@mb_get_groups = Bridge.get_method_bind("Node", "get_groups", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_groups, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_owner : Void* = Pointer(Void).null
    def set_owner(owner : Node) : Void
      if @@mb_set_owner.null?
        @@mb_set_owner = Bridge.get_method_bind("Node", "set_owner", 1078189570_i64)
      end
      arg_ptr_0 = owner ? owner.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_owner, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_owner : Void* = Pointer(Void).null
    def get_owner() : Node
      if @@mb_get_owner.null?
        @@mb_get_owner = Bridge.get_method_bind("Node", "get_owner", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_owner, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_get_index : Void* = Pointer(Void).null
    def get_index(include_internal : Bool) : Int64
      if @@mb_get_index.null?
        @@mb_get_index = Bridge.get_method_bind("Node", "get_index", 894402480_i64)
      end
      val_0 = include_internal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_print_tree : Void* = Pointer(Void).null
    def print_tree() : Void
      if @@mb_print_tree.null?
        @@mb_print_tree = Bridge.get_method_bind("Node", "print_tree", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_print_tree, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_print_tree_pretty : Void* = Pointer(Void).null
    def print_tree_pretty() : Void
      if @@mb_print_tree_pretty.null?
        @@mb_print_tree_pretty = Bridge.get_method_bind("Node", "print_tree_pretty", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_print_tree_pretty, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_tree_string : Void* = Pointer(Void).null
    def get_tree_string() : String
      if @@mb_get_tree_string.null?
        @@mb_get_tree_string = Bridge.get_method_bind("Node", "get_tree_string", 2841200299_i64)
      end
      ""
    end
    @@mb_get_tree_string_pretty : Void* = Pointer(Void).null
    def get_tree_string_pretty() : String
      if @@mb_get_tree_string_pretty.null?
        @@mb_get_tree_string_pretty = Bridge.get_method_bind("Node", "get_tree_string_pretty", 2841200299_i64)
      end
      ""
    end
    @@mb_set_scene_file_path : Void* = Pointer(Void).null
    def set_scene_file_path(scene_file_path : String) : Void
      if @@mb_set_scene_file_path.null?
        @@mb_set_scene_file_path = Bridge.get_method_bind("Node", "set_scene_file_path", 83702148_i64)
      end
      val_0 = scene_file_path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scene_file_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scene_file_path : Void* = Pointer(Void).null
    def get_scene_file_path() : String
      if @@mb_get_scene_file_path.null?
        @@mb_get_scene_file_path = Bridge.get_method_bind("Node", "get_scene_file_path", 201670096_i64)
      end
      ""
    end
    @@mb_propagate_notification : Void* = Pointer(Void).null
    def propagate_notification(what : Int64) : Void
      if @@mb_propagate_notification.null?
        @@mb_propagate_notification = Bridge.get_method_bind("Node", "propagate_notification", 1286410249_i64)
      end
      val_0 = what
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_propagate_notification, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_propagate_call : Void* = Pointer(Void).null
    def propagate_call(method : String, args : Godot::Array, parent_first : Bool) : Void
      if @@mb_propagate_call.null?
        @@mb_propagate_call = Bridge.get_method_bind("Node", "propagate_call", 1871007965_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = args ? args.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      val_2 = parent_first
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_propagate_call, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_physics_process : Void* = Pointer(Void).null
    def set_physics_process(enable : Bool) : Void
      if @@mb_set_physics_process.null?
        @@mb_set_physics_process = Bridge.get_method_bind("Node", "set_physics_process", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physics_process, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_physics_process_delta_time : Void* = Pointer(Void).null
    def get_physics_process_delta_time() : Float64
      if @@mb_get_physics_process_delta_time.null?
        @@mb_get_physics_process_delta_time = Bridge.get_method_bind("Node", "get_physics_process_delta_time", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_physics_process_delta_time, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_physics_processing : Void* = Pointer(Void).null
    def is_physics_processing() : Bool
      if @@mb_is_physics_processing.null?
        @@mb_is_physics_processing = Bridge.get_method_bind("Node", "is_physics_processing", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_physics_processing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_process_delta_time : Void* = Pointer(Void).null
    def get_process_delta_time() : Float64
      if @@mb_get_process_delta_time.null?
        @@mb_get_process_delta_time = Bridge.get_method_bind("Node", "get_process_delta_time", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_process_delta_time, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_process : Void* = Pointer(Void).null
    def set_process(enable : Bool) : Void
      if @@mb_set_process.null?
        @@mb_set_process = Bridge.get_method_bind("Node", "set_process", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_process_priority : Void* = Pointer(Void).null
    def set_process_priority(priority : Int64) : Void
      if @@mb_set_process_priority.null?
        @@mb_set_process_priority = Bridge.get_method_bind("Node", "set_process_priority", 1286410249_i64)
      end
      val_0 = priority
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_process_priority : Void* = Pointer(Void).null
    def get_process_priority() : Int64
      if @@mb_get_process_priority.null?
        @@mb_get_process_priority = Bridge.get_method_bind("Node", "get_process_priority", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_priority, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_physics_process_priority : Void* = Pointer(Void).null
    def set_physics_process_priority(priority : Int64) : Void
      if @@mb_set_physics_process_priority.null?
        @@mb_set_physics_process_priority = Bridge.get_method_bind("Node", "set_physics_process_priority", 1286410249_i64)
      end
      val_0 = priority
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physics_process_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_physics_process_priority : Void* = Pointer(Void).null
    def get_physics_process_priority() : Int64
      if @@mb_get_physics_process_priority.null?
        @@mb_get_physics_process_priority = Bridge.get_method_bind("Node", "get_physics_process_priority", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_physics_process_priority, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_processing : Void* = Pointer(Void).null
    def is_processing() : Bool
      if @@mb_is_processing.null?
        @@mb_is_processing = Bridge.get_method_bind("Node", "is_processing", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_processing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_input : Void* = Pointer(Void).null
    def set_process_input(enable : Bool) : Void
      if @@mb_set_process_input.null?
        @@mb_set_process_input = Bridge.get_method_bind("Node", "set_process_input", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_input, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_processing_input : Void* = Pointer(Void).null
    def is_processing_input() : Bool
      if @@mb_is_processing_input.null?
        @@mb_is_processing_input = Bridge.get_method_bind("Node", "is_processing_input", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_processing_input, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_shortcut_input : Void* = Pointer(Void).null
    def set_process_shortcut_input(enable : Bool) : Void
      if @@mb_set_process_shortcut_input.null?
        @@mb_set_process_shortcut_input = Bridge.get_method_bind("Node", "set_process_shortcut_input", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_shortcut_input, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_processing_shortcut_input : Void* = Pointer(Void).null
    def is_processing_shortcut_input() : Bool
      if @@mb_is_processing_shortcut_input.null?
        @@mb_is_processing_shortcut_input = Bridge.get_method_bind("Node", "is_processing_shortcut_input", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_processing_shortcut_input, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_unhandled_input : Void* = Pointer(Void).null
    def set_process_unhandled_input(enable : Bool) : Void
      if @@mb_set_process_unhandled_input.null?
        @@mb_set_process_unhandled_input = Bridge.get_method_bind("Node", "set_process_unhandled_input", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_unhandled_input, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_processing_unhandled_input : Void* = Pointer(Void).null
    def is_processing_unhandled_input() : Bool
      if @@mb_is_processing_unhandled_input.null?
        @@mb_is_processing_unhandled_input = Bridge.get_method_bind("Node", "is_processing_unhandled_input", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_processing_unhandled_input, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_unhandled_key_input : Void* = Pointer(Void).null
    def set_process_unhandled_key_input(enable : Bool) : Void
      if @@mb_set_process_unhandled_key_input.null?
        @@mb_set_process_unhandled_key_input = Bridge.get_method_bind("Node", "set_process_unhandled_key_input", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_unhandled_key_input, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_processing_unhandled_key_input : Void* = Pointer(Void).null
    def is_processing_unhandled_key_input() : Bool
      if @@mb_is_processing_unhandled_key_input.null?
        @@mb_is_processing_unhandled_key_input = Bridge.get_method_bind("Node", "is_processing_unhandled_key_input", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_processing_unhandled_key_input, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_mode : Void* = Pointer(Void).null
    def set_process_mode(mode : Int64) : Void
      if @@mb_set_process_mode.null?
        @@mb_set_process_mode = Bridge.get_method_bind("Node", "set_process_mode", 1841290486_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_process_mode : Void* = Pointer(Void).null
    def get_process_mode() : Int64
      if @@mb_get_process_mode.null?
        @@mb_get_process_mode = Bridge.get_method_bind("Node", "get_process_mode", 739966102_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_can_process : Void* = Pointer(Void).null
    def can_process() : Bool
      if @@mb_can_process.null?
        @@mb_can_process = Bridge.get_method_bind("Node", "can_process", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_can_process, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_thread_group : Void* = Pointer(Void).null
    def set_process_thread_group(mode : Int64) : Void
      if @@mb_set_process_thread_group.null?
        @@mb_set_process_thread_group = Bridge.get_method_bind("Node", "set_process_thread_group", 2275442745_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_thread_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_process_thread_group : Void* = Pointer(Void).null
    def get_process_thread_group() : Int64
      if @@mb_get_process_thread_group.null?
        @@mb_get_process_thread_group = Bridge.get_method_bind("Node", "get_process_thread_group", 1866404740_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_thread_group, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_process_thread_messages : Void* = Pointer(Void).null
    def set_process_thread_messages(flags : Int64) : Void
      if @@mb_set_process_thread_messages.null?
        @@mb_set_process_thread_messages = Bridge.get_method_bind("Node", "set_process_thread_messages", 1357280998_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_thread_messages, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_process_thread_messages : Void* = Pointer(Void).null
    def get_process_thread_messages() : Int64
      if @@mb_get_process_thread_messages.null?
        @@mb_get_process_thread_messages = Bridge.get_method_bind("Node", "get_process_thread_messages", 4228993612_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_thread_messages, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_process_thread_group_order : Void* = Pointer(Void).null
    def set_process_thread_group_order(order : Int64) : Void
      if @@mb_set_process_thread_group_order.null?
        @@mb_set_process_thread_group_order = Bridge.get_method_bind("Node", "set_process_thread_group_order", 1286410249_i64)
      end
      val_0 = order
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_thread_group_order, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_process_thread_group_order : Void* = Pointer(Void).null
    def get_process_thread_group_order() : Int64
      if @@mb_get_process_thread_group_order.null?
        @@mb_get_process_thread_group_order = Bridge.get_method_bind("Node", "get_process_thread_group_order", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_thread_group_order, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_queue_accessibility_update : Void* = Pointer(Void).null
    def queue_accessibility_update() : Void
      if @@mb_queue_accessibility_update.null?
        @@mb_queue_accessibility_update = Bridge.get_method_bind("Node", "queue_accessibility_update", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_queue_accessibility_update, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_accessibility_element : Void* = Pointer(Void).null
    def get_accessibility_element() : Int64
      if @@mb_get_accessibility_element.null?
        @@mb_get_accessibility_element = Bridge.get_method_bind("Node", "get_accessibility_element", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_accessibility_element, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_display_folded : Void* = Pointer(Void).null
    def set_display_folded(fold : Bool) : Void
      if @@mb_set_display_folded.null?
        @@mb_set_display_folded = Bridge.get_method_bind("Node", "set_display_folded", 2586408642_i64)
      end
      val_0 = fold
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_display_folded, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_displayed_folded : Void* = Pointer(Void).null
    def is_displayed_folded() : Bool
      if @@mb_is_displayed_folded.null?
        @@mb_is_displayed_folded = Bridge.get_method_bind("Node", "is_displayed_folded", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_displayed_folded, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_internal : Void* = Pointer(Void).null
    def set_process_internal(enable : Bool) : Void
      if @@mb_set_process_internal.null?
        @@mb_set_process_internal = Bridge.get_method_bind("Node", "set_process_internal", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_internal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_processing_internal : Void* = Pointer(Void).null
    def is_processing_internal() : Bool
      if @@mb_is_processing_internal.null?
        @@mb_is_processing_internal = Bridge.get_method_bind("Node", "is_processing_internal", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_processing_internal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_physics_process_internal : Void* = Pointer(Void).null
    def set_physics_process_internal(enable : Bool) : Void
      if @@mb_set_physics_process_internal.null?
        @@mb_set_physics_process_internal = Bridge.get_method_bind("Node", "set_physics_process_internal", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physics_process_internal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_physics_processing_internal : Void* = Pointer(Void).null
    def is_physics_processing_internal() : Bool
      if @@mb_is_physics_processing_internal.null?
        @@mb_is_physics_processing_internal = Bridge.get_method_bind("Node", "is_physics_processing_internal", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_physics_processing_internal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_physics_interpolation_mode : Void* = Pointer(Void).null
    def set_physics_interpolation_mode(mode : Int64) : Void
      if @@mb_set_physics_interpolation_mode.null?
        @@mb_set_physics_interpolation_mode = Bridge.get_method_bind("Node", "set_physics_interpolation_mode", 3202404928_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physics_interpolation_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_physics_interpolation_mode : Void* = Pointer(Void).null
    def get_physics_interpolation_mode() : Int64
      if @@mb_get_physics_interpolation_mode.null?
        @@mb_get_physics_interpolation_mode = Bridge.get_method_bind("Node", "get_physics_interpolation_mode", 2920385216_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_physics_interpolation_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_physics_interpolated : Void* = Pointer(Void).null
    def is_physics_interpolated() : Bool
      if @@mb_is_physics_interpolated.null?
        @@mb_is_physics_interpolated = Bridge.get_method_bind("Node", "is_physics_interpolated", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_physics_interpolated, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_physics_interpolated_and_enabled : Void* = Pointer(Void).null
    def is_physics_interpolated_and_enabled() : Bool
      if @@mb_is_physics_interpolated_and_enabled.null?
        @@mb_is_physics_interpolated_and_enabled = Bridge.get_method_bind("Node", "is_physics_interpolated_and_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_physics_interpolated_and_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_reset_physics_interpolation : Void* = Pointer(Void).null
    def reset_physics_interpolation() : Void
      if @@mb_reset_physics_interpolation.null?
        @@mb_reset_physics_interpolation = Bridge.get_method_bind("Node", "reset_physics_interpolation", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reset_physics_interpolation, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_auto_translate_mode : Void* = Pointer(Void).null
    def set_auto_translate_mode(mode : Int64) : Void
      if @@mb_set_auto_translate_mode.null?
        @@mb_set_auto_translate_mode = Bridge.get_method_bind("Node", "set_auto_translate_mode", 776149714_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_translate_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_auto_translate_mode : Void* = Pointer(Void).null
    def get_auto_translate_mode() : Int64
      if @@mb_get_auto_translate_mode.null?
        @@mb_get_auto_translate_mode = Bridge.get_method_bind("Node", "get_auto_translate_mode", 2498906432_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_auto_translate_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_can_auto_translate : Void* = Pointer(Void).null
    def can_auto_translate() : Bool
      if @@mb_can_auto_translate.null?
        @@mb_can_auto_translate = Bridge.get_method_bind("Node", "can_auto_translate", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_can_auto_translate, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_translation_domain_inherited : Void* = Pointer(Void).null
    def set_translation_domain_inherited() : Void
      if @@mb_set_translation_domain_inherited.null?
        @@mb_set_translation_domain_inherited = Bridge.get_method_bind("Node", "set_translation_domain_inherited", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_set_translation_domain_inherited, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_window : Void* = Pointer(Void).null
    def get_window() : Window
      if @@mb_get_window.null?
        @@mb_get_window = Bridge.get_method_bind("Node", "get_window", 1757182445_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_window, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Window.new(ret_ptr)
    end
    @@mb_get_last_exclusive_window : Void* = Pointer(Void).null
    def get_last_exclusive_window() : Window
      if @@mb_get_last_exclusive_window.null?
        @@mb_get_last_exclusive_window = Bridge.get_method_bind("Node", "get_last_exclusive_window", 1757182445_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_last_exclusive_window, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Window.new(ret_ptr)
    end
    @@mb_get_tree : Void* = Pointer(Void).null
    def get_tree() : SceneTree
      if @@mb_get_tree.null?
        @@mb_get_tree = Bridge.get_method_bind("Node", "get_tree", 2958820483_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tree, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      SceneTree.new(ret_ptr)
    end
    @@mb_create_tween : Void* = Pointer(Void).null
    def create_tween() : Tween
      if @@mb_create_tween.null?
        @@mb_create_tween = Bridge.get_method_bind("Node", "create_tween", 3426978995_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_tween, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Tween.new(ret_ptr)
    end
    @@mb_duplicate : Void* = Pointer(Void).null
    def duplicate(flags : Int64) : Node
      if @@mb_duplicate.null?
        @@mb_duplicate = Bridge.get_method_bind("Node", "duplicate", 3511555459_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_duplicate, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_replace_by : Void* = Pointer(Void).null
    def replace_by(node : Node, keep_groups : Bool) : Void
      if @@mb_replace_by.null?
        @@mb_replace_by = Bridge.get_method_bind("Node", "replace_by", 2570952461_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = keep_groups
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_replace_by, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_scene_instance_load_placeholder : Void* = Pointer(Void).null
    def set_scene_instance_load_placeholder(load_placeholder : Bool) : Void
      if @@mb_set_scene_instance_load_placeholder.null?
        @@mb_set_scene_instance_load_placeholder = Bridge.get_method_bind("Node", "set_scene_instance_load_placeholder", 2586408642_i64)
      end
      val_0 = load_placeholder
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scene_instance_load_placeholder, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scene_instance_load_placeholder : Void* = Pointer(Void).null
    def get_scene_instance_load_placeholder() : Bool
      if @@mb_get_scene_instance_load_placeholder.null?
        @@mb_get_scene_instance_load_placeholder = Bridge.get_method_bind("Node", "get_scene_instance_load_placeholder", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_scene_instance_load_placeholder, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_editable_instance : Void* = Pointer(Void).null
    def set_editable_instance(node : Node, is_editable : Bool) : Void
      if @@mb_set_editable_instance.null?
        @@mb_set_editable_instance = Bridge.get_method_bind("Node", "set_editable_instance", 2731852923_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = is_editable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_editable_instance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editable_instance : Void* = Pointer(Void).null
    def is_editable_instance(node : Node) : Bool
      if @@mb_is_editable_instance.null?
        @@mb_is_editable_instance = Bridge.get_method_bind("Node", "is_editable_instance", 3093956946_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editable_instance, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_viewport : Void* = Pointer(Void).null
    def get_viewport() : Viewport
      if @@mb_get_viewport.null?
        @@mb_get_viewport = Bridge.get_method_bind("Node", "get_viewport", 3596683776_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_viewport, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Viewport.new(ret_ptr)
    end
    @@mb_queue_free : Void* = Pointer(Void).null
    def queue_free() : Void
      if @@mb_queue_free.null?
        @@mb_queue_free = Bridge.get_method_bind("Node", "queue_free", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_queue_free, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_request_ready : Void* = Pointer(Void).null
    def request_ready() : Void
      if @@mb_request_ready.null?
        @@mb_request_ready = Bridge.get_method_bind("Node", "request_ready", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_request_ready, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_node_ready : Void* = Pointer(Void).null
    def is_node_ready() : Bool
      if @@mb_is_node_ready.null?
        @@mb_is_node_ready = Bridge.get_method_bind("Node", "is_node_ready", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_node_ready, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_multiplayer_authority : Void* = Pointer(Void).null
    def set_multiplayer_authority(id : Int64, recursive : Bool) : Void
      if @@mb_set_multiplayer_authority.null?
        @@mb_set_multiplayer_authority = Bridge.get_method_bind("Node", "set_multiplayer_authority", 972357352_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = recursive
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_multiplayer_authority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_multiplayer_authority : Void* = Pointer(Void).null
    def get_multiplayer_authority() : Int64
      if @@mb_get_multiplayer_authority.null?
        @@mb_get_multiplayer_authority = Bridge.get_method_bind("Node", "get_multiplayer_authority", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_multiplayer_authority, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_multiplayer_authority : Void* = Pointer(Void).null
    def is_multiplayer_authority() : Bool
      if @@mb_is_multiplayer_authority.null?
        @@mb_is_multiplayer_authority = Bridge.get_method_bind("Node", "is_multiplayer_authority", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_multiplayer_authority, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_multiplayer : Void* = Pointer(Void).null
    def get_multiplayer() : MultiplayerAPI
      if @@mb_get_multiplayer.null?
        @@mb_get_multiplayer = Bridge.get_method_bind("Node", "get_multiplayer", 406750475_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_multiplayer, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      MultiplayerAPI.new(ret_ptr)
    end
    @@mb_rpc_config : Void* = Pointer(Void).null
    def rpc_config(method : String, config : Void*) : Void
      if @@mb_rpc_config.null?
        @@mb_rpc_config = Bridge.get_method_bind("Node", "rpc_config", 3776071444_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = config
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_rpc_config, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node_rpc_config : Void* = Pointer(Void).null
    def get_node_rpc_config() : Void*
      if @@mb_get_node_rpc_config.null?
        @@mb_get_node_rpc_config = Bridge.get_method_bind("Node", "get_node_rpc_config", 1214101251_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_rpc_config, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_editor_description : Void* = Pointer(Void).null
    def set_editor_description(editor_description : String) : Void
      if @@mb_set_editor_description.null?
        @@mb_set_editor_description = Bridge.get_method_bind("Node", "set_editor_description", 83702148_i64)
      end
      val_0 = editor_description
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editor_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_editor_description : Void* = Pointer(Void).null
    def get_editor_description() : String
      if @@mb_get_editor_description.null?
        @@mb_get_editor_description = Bridge.get_method_bind("Node", "get_editor_description", 201670096_i64)
      end
      ""
    end
    @@mb_set_unique_name_in_owner : Void* = Pointer(Void).null
    def set_unique_name_in_owner(enable : Bool) : Void
      if @@mb_set_unique_name_in_owner.null?
        @@mb_set_unique_name_in_owner = Bridge.get_method_bind("Node", "set_unique_name_in_owner", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_unique_name_in_owner, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_unique_name_in_owner : Void* = Pointer(Void).null
    def is_unique_name_in_owner() : Bool
      if @@mb_is_unique_name_in_owner.null?
        @@mb_is_unique_name_in_owner = Bridge.get_method_bind("Node", "is_unique_name_in_owner", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_unique_name_in_owner, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_atr : Void* = Pointer(Void).null
    def atr(message : String, context : String) : String
      if @@mb_atr.null?
        @@mb_atr = Bridge.get_method_bind("Node", "atr", 3344478075_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = context
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_atr_n : Void* = Pointer(Void).null
    def atr_n(message : String, plural_message : String, n : Int64, context : String) : String
      if @@mb_atr_n.null?
        @@mb_atr_n = Bridge.get_method_bind("Node", "atr_n", 259354841_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = plural_message
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = n
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = context
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ""
    end
    @@mb_rpc : Void* = Pointer(Void).null
    def rpc(method : String) : Int64
      if @@mb_rpc.null?
        @@mb_rpc = Bridge.get_method_bind("Node", "rpc", 4047867050_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_rpc, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_rpc_id : Void* = Pointer(Void).null
    def rpc_id(peer_id : Int64, method : String) : Int64
      if @@mb_rpc_id.null?
        @@mb_rpc_id = Bridge.get_method_bind("Node", "rpc_id", 361499283_i64)
      end
      val_0 = peer_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = method
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_rpc_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_update_configuration_warnings : Void* = Pointer(Void).null
    def update_configuration_warnings() : Void
      if @@mb_update_configuration_warnings.null?
        @@mb_update_configuration_warnings = Bridge.get_method_bind("Node", "update_configuration_warnings", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_update_configuration_warnings, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_call_deferred_thread_group : Void* = Pointer(Void).null
    def call_deferred_thread_group(method : String) : Void*
      if @@mb_call_deferred_thread_group.null?
        @@mb_call_deferred_thread_group = Bridge.get_method_bind("Node", "call_deferred_thread_group", 3400424181_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_call_deferred_thread_group, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_deferred_thread_group : Void* = Pointer(Void).null
    def set_deferred_thread_group(property : String, value : Void*) : Void
      if @@mb_set_deferred_thread_group.null?
        @@mb_set_deferred_thread_group = Bridge.get_method_bind("Node", "set_deferred_thread_group", 3776071444_i64)
      end
      val_0 = property
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_deferred_thread_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_notify_deferred_thread_group : Void* = Pointer(Void).null
    def notify_deferred_thread_group(what : Int64) : Void
      if @@mb_notify_deferred_thread_group.null?
        @@mb_notify_deferred_thread_group = Bridge.get_method_bind("Node", "notify_deferred_thread_group", 1286410249_i64)
      end
      val_0 = what
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_notify_deferred_thread_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_call_thread_safe : Void* = Pointer(Void).null
    def call_thread_safe(method : String) : Void*
      if @@mb_call_thread_safe.null?
        @@mb_call_thread_safe = Bridge.get_method_bind("Node", "call_thread_safe", 3400424181_i64)
      end
      val_0 = method
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_call_thread_safe, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_thread_safe : Void* = Pointer(Void).null
    def set_thread_safe(property : String, value : Void*) : Void
      if @@mb_set_thread_safe.null?
        @@mb_set_thread_safe = Bridge.get_method_bind("Node", "set_thread_safe", 3776071444_i64)
      end
      val_0 = property
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_thread_safe, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_notify_thread_safe : Void* = Pointer(Void).null
    def notify_thread_safe(what : Int64) : Void
      if @@mb_notify_thread_safe.null?
        @@mb_notify_thread_safe = Bridge.get_method_bind("Node", "notify_thread_safe", 1286410249_i64)
      end
      val_0 = what
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_notify_thread_safe, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class Resource < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum DeepDuplicateMode : Int64
      DeepDuplicateNone = 0_i64
      DeepDuplicateInternal = 1_i64
      DeepDuplicateAll = 2_i64
    end
    @@mb_set_path : Void* = Pointer(Void).null
    def set_path(path : String) : Void
      if @@mb_set_path.null?
        @@mb_set_path = Bridge.get_method_bind("Resource", "set_path", 83702148_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_take_over_path : Void* = Pointer(Void).null
    def take_over_path(path : String) : Void
      if @@mb_take_over_path.null?
        @@mb_take_over_path = Bridge.get_method_bind("Resource", "take_over_path", 83702148_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_take_over_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path : Void* = Pointer(Void).null
    def get_path() : String
      if @@mb_get_path.null?
        @@mb_get_path = Bridge.get_method_bind("Resource", "get_path", 201670096_i64)
      end
      ""
    end
    @@mb_set_path_cache : Void* = Pointer(Void).null
    def set_path_cache(path : String) : Void
      if @@mb_set_path_cache.null?
        @@mb_set_path_cache = Bridge.get_method_bind("Resource", "set_path_cache", 83702148_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_cache, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_name : Void* = Pointer(Void).null
    def set_name(name : String) : Void
      if @@mb_set_name.null?
        @@mb_set_name = Bridge.get_method_bind("Resource", "set_name", 83702148_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_name : Void* = Pointer(Void).null
    def get_name() : String
      if @@mb_get_name.null?
        @@mb_get_name = Bridge.get_method_bind("Resource", "get_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_rid : Void* = Pointer(Void).null
    def get_rid() : Int64
      if @@mb_get_rid.null?
        @@mb_get_rid = Bridge.get_method_bind("Resource", "get_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_local_to_scene : Void* = Pointer(Void).null
    def set_local_to_scene(enable : Bool) : Void
      if @@mb_set_local_to_scene.null?
        @@mb_set_local_to_scene = Bridge.get_method_bind("Resource", "set_local_to_scene", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_local_to_scene, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_local_to_scene : Void* = Pointer(Void).null
    def is_local_to_scene() : Bool
      if @@mb_is_local_to_scene.null?
        @@mb_is_local_to_scene = Bridge.get_method_bind("Resource", "is_local_to_scene", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_local_to_scene, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_local_scene : Void* = Pointer(Void).null
    def get_local_scene() : Node
      if @@mb_get_local_scene.null?
        @@mb_get_local_scene = Bridge.get_method_bind("Resource", "get_local_scene", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_local_scene, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_setup_local_to_scene : Void* = Pointer(Void).null
    def setup_local_to_scene() : Void
      if @@mb_setup_local_to_scene.null?
        @@mb_setup_local_to_scene = Bridge.get_method_bind("Resource", "setup_local_to_scene", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_setup_local_to_scene, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_reset_state : Void* = Pointer(Void).null
    def reset_state() : Void
      if @@mb_reset_state.null?
        @@mb_reset_state = Bridge.get_method_bind("Resource", "reset_state", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reset_state, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_id_for_path : Void* = Pointer(Void).null
    def set_id_for_path(path : String, id : String) : Void
      if @@mb_set_id_for_path.null?
        @@mb_set_id_for_path = Bridge.get_method_bind("Resource", "set_id_for_path", 3186203200_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_id_for_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_id_for_path : Void* = Pointer(Void).null
    def get_id_for_path(path : String) : String
      if @@mb_get_id_for_path.null?
        @@mb_get_id_for_path = Bridge.get_method_bind("Resource", "get_id_for_path", 3135753539_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_is_built_in : Void* = Pointer(Void).null
    def is_built_in() : Bool
      if @@mb_is_built_in.null?
        @@mb_is_built_in = Bridge.get_method_bind("Resource", "is_built_in", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_built_in, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_generate_scene_unique_id : Void* = Pointer(Void).null
    def generate_scene_unique_id() : String
      if @@mb_generate_scene_unique_id.null?
        @@mb_generate_scene_unique_id = Bridge.get_method_bind("Resource", "generate_scene_unique_id", 2841200299_i64)
      end
      ""
    end
    @@mb_set_scene_unique_id : Void* = Pointer(Void).null
    def set_scene_unique_id(id : String) : Void
      if @@mb_set_scene_unique_id.null?
        @@mb_set_scene_unique_id = Bridge.get_method_bind("Resource", "set_scene_unique_id", 83702148_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scene_unique_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scene_unique_id : Void* = Pointer(Void).null
    def get_scene_unique_id() : String
      if @@mb_get_scene_unique_id.null?
        @@mb_get_scene_unique_id = Bridge.get_method_bind("Resource", "get_scene_unique_id", 201670096_i64)
      end
      ""
    end
    @@mb_emit_changed : Void* = Pointer(Void).null
    def emit_changed() : Void
      if @@mb_emit_changed.null?
        @@mb_emit_changed = Bridge.get_method_bind("Resource", "emit_changed", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_emit_changed, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_duplicate : Void* = Pointer(Void).null
    def duplicate(deep : Bool) : Resource
      if @@mb_duplicate.null?
        @@mb_duplicate = Bridge.get_method_bind("Resource", "duplicate", 482882304_i64)
      end
      val_0 = deep
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_duplicate, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Resource.new(ret_ptr)
    end
    @@mb_duplicate_deep : Void* = Pointer(Void).null
    def duplicate_deep(deep_subresources_mode : Int64) : Resource
      if @@mb_duplicate_deep.null?
        @@mb_duplicate_deep = Bridge.get_method_bind("Resource", "duplicate_deep", 905779109_i64)
      end
      val_0 = deep_subresources_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_duplicate_deep, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Resource.new(ret_ptr)
    end
    @@mb_copy_from_resource : Void* = Pointer(Void).null
    def copy_from_resource(resource : Resource) : Int64
      if @@mb_copy_from_resource.null?
        @@mb_copy_from_resource = Bridge.get_method_bind("Resource", "copy_from_resource", 3338311164_i64)
      end
      arg_ptr_0 = resource ? resource.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_copy_from_resource, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  class MainLoop < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class SceneTree < Godot::MainLoop
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum GroupCallFlags : Int64
      GroupCallDefault = 0_i64
      GroupCallReverse = 1_i64
      GroupCallDeferred = 2_i64
      GroupCallUnique = 4_i64
    end
    @@mb_get_root : Void* = Pointer(Void).null
    def get_root() : Window
      if @@mb_get_root.null?
        @@mb_get_root = Bridge.get_method_bind("SceneTree", "get_root", 1757182445_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_root, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Window.new(ret_ptr)
    end
    @@mb_has_group : Void* = Pointer(Void).null
    def has_group(name : String) : Bool
      if @@mb_has_group.null?
        @@mb_has_group = Bridge.get_method_bind("SceneTree", "has_group", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_group, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_accessibility_enabled : Void* = Pointer(Void).null
    def is_accessibility_enabled() : Bool
      if @@mb_is_accessibility_enabled.null?
        @@mb_is_accessibility_enabled = Bridge.get_method_bind("SceneTree", "is_accessibility_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_accessibility_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_accessibility_supported : Void* = Pointer(Void).null
    def is_accessibility_supported() : Bool
      if @@mb_is_accessibility_supported.null?
        @@mb_is_accessibility_supported = Bridge.get_method_bind("SceneTree", "is_accessibility_supported", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_accessibility_supported, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_auto_accept_quit : Void* = Pointer(Void).null
    def is_auto_accept_quit() : Bool
      if @@mb_is_auto_accept_quit.null?
        @@mb_is_auto_accept_quit = Bridge.get_method_bind("SceneTree", "is_auto_accept_quit", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_auto_accept_quit, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_auto_accept_quit : Void* = Pointer(Void).null
    def set_auto_accept_quit(enabled : Bool) : Void
      if @@mb_set_auto_accept_quit.null?
        @@mb_set_auto_accept_quit = Bridge.get_method_bind("SceneTree", "set_auto_accept_quit", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_accept_quit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_quit_on_go_back : Void* = Pointer(Void).null
    def is_quit_on_go_back() : Bool
      if @@mb_is_quit_on_go_back.null?
        @@mb_is_quit_on_go_back = Bridge.get_method_bind("SceneTree", "is_quit_on_go_back", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_quit_on_go_back, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_quit_on_go_back : Void* = Pointer(Void).null
    def set_quit_on_go_back(enabled : Bool) : Void
      if @@mb_set_quit_on_go_back.null?
        @@mb_set_quit_on_go_back = Bridge.get_method_bind("SceneTree", "set_quit_on_go_back", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_quit_on_go_back, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_debug_collisions_hint : Void* = Pointer(Void).null
    def set_debug_collisions_hint(enable : Bool) : Void
      if @@mb_set_debug_collisions_hint.null?
        @@mb_set_debug_collisions_hint = Bridge.get_method_bind("SceneTree", "set_debug_collisions_hint", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_collisions_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_debugging_collisions_hint : Void* = Pointer(Void).null
    def is_debugging_collisions_hint() : Bool
      if @@mb_is_debugging_collisions_hint.null?
        @@mb_is_debugging_collisions_hint = Bridge.get_method_bind("SceneTree", "is_debugging_collisions_hint", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_debugging_collisions_hint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_debug_paths_hint : Void* = Pointer(Void).null
    def set_debug_paths_hint(enable : Bool) : Void
      if @@mb_set_debug_paths_hint.null?
        @@mb_set_debug_paths_hint = Bridge.get_method_bind("SceneTree", "set_debug_paths_hint", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_paths_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_debugging_paths_hint : Void* = Pointer(Void).null
    def is_debugging_paths_hint() : Bool
      if @@mb_is_debugging_paths_hint.null?
        @@mb_is_debugging_paths_hint = Bridge.get_method_bind("SceneTree", "is_debugging_paths_hint", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_debugging_paths_hint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_debug_navigation_hint : Void* = Pointer(Void).null
    def set_debug_navigation_hint(enable : Bool) : Void
      if @@mb_set_debug_navigation_hint.null?
        @@mb_set_debug_navigation_hint = Bridge.get_method_bind("SceneTree", "set_debug_navigation_hint", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_navigation_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_debugging_navigation_hint : Void* = Pointer(Void).null
    def is_debugging_navigation_hint() : Bool
      if @@mb_is_debugging_navigation_hint.null?
        @@mb_is_debugging_navigation_hint = Bridge.get_method_bind("SceneTree", "is_debugging_navigation_hint", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_debugging_navigation_hint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_edited_scene_root : Void* = Pointer(Void).null
    def set_edited_scene_root(scene : Node) : Void
      if @@mb_set_edited_scene_root.null?
        @@mb_set_edited_scene_root = Bridge.get_method_bind("SceneTree", "set_edited_scene_root", 1078189570_i64)
      end
      arg_ptr_0 = scene ? scene.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_edited_scene_root, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_edited_scene_root : Void* = Pointer(Void).null
    def get_edited_scene_root() : Node
      if @@mb_get_edited_scene_root.null?
        @@mb_get_edited_scene_root = Bridge.get_method_bind("SceneTree", "get_edited_scene_root", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_edited_scene_root, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_set_pause : Void* = Pointer(Void).null
    def set_pause(enable : Bool) : Void
      if @@mb_set_pause.null?
        @@mb_set_pause = Bridge.get_method_bind("SceneTree", "set_pause", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pause, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_paused : Void* = Pointer(Void).null
    def is_paused() : Bool
      if @@mb_is_paused.null?
        @@mb_is_paused = Bridge.get_method_bind("SceneTree", "is_paused", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_paused, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_create_timer : Void* = Pointer(Void).null
    def create_timer(time_sec : Float64, process_always : Bool, process_in_physics : Bool, ignore_time_scale : Bool) : SceneTreeTimer
      if @@mb_create_timer.null?
        @@mb_create_timer = Bridge.get_method_bind("SceneTree", "create_timer", 2709170273_i64)
      end
      val_0 = time_sec
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = process_always
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = process_in_physics
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = ignore_time_scale
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_timer, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      SceneTreeTimer.new(ret_ptr)
    end
    @@mb_create_tween : Void* = Pointer(Void).null
    def create_tween() : Tween
      if @@mb_create_tween.null?
        @@mb_create_tween = Bridge.get_method_bind("SceneTree", "create_tween", 3426978995_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_tween, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Tween.new(ret_ptr)
    end
    @@mb_get_processed_tweens : Void* = Pointer(Void).null
    def get_processed_tweens() : Godot::Array
      if @@mb_get_processed_tweens.null?
        @@mb_get_processed_tweens = Bridge.get_method_bind("SceneTree", "get_processed_tweens", 2915620761_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_processed_tweens, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_node_count : Void* = Pointer(Void).null
    def get_node_count() : Int64
      if @@mb_get_node_count.null?
        @@mb_get_node_count = Bridge.get_method_bind("SceneTree", "get_node_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_node_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_frame : Void* = Pointer(Void).null
    def get_frame() : Int64
      if @@mb_get_frame.null?
        @@mb_get_frame = Bridge.get_method_bind("SceneTree", "get_frame", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_frame, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_quit : Void* = Pointer(Void).null
    def quit(exit_code : Int64) : Void
      if @@mb_quit.null?
        @@mb_quit = Bridge.get_method_bind("SceneTree", "quit", 1995695955_i64)
      end
      val_0 = exit_code
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_quit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_physics_interpolation_enabled : Void* = Pointer(Void).null
    def set_physics_interpolation_enabled(enabled : Bool) : Void
      if @@mb_set_physics_interpolation_enabled.null?
        @@mb_set_physics_interpolation_enabled = Bridge.get_method_bind("SceneTree", "set_physics_interpolation_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physics_interpolation_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_physics_interpolation_enabled : Void* = Pointer(Void).null
    def is_physics_interpolation_enabled() : Bool
      if @@mb_is_physics_interpolation_enabled.null?
        @@mb_is_physics_interpolation_enabled = Bridge.get_method_bind("SceneTree", "is_physics_interpolation_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_physics_interpolation_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_queue_delete : Void* = Pointer(Void).null
    def queue_delete(obj : Godot::Object) : Void
      if @@mb_queue_delete.null?
        @@mb_queue_delete = Bridge.get_method_bind("SceneTree", "queue_delete", 3975164845_i64)
      end
      arg_ptr_0 = obj ? obj.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_queue_delete, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_call_group_flags : Void* = Pointer(Void).null
    def call_group_flags(flags : Int64, group : String, method : String) : Void
      if @@mb_call_group_flags.null?
        @@mb_call_group_flags = Bridge.get_method_bind("SceneTree", "call_group_flags", 1527739229_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = group
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = method
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_call_group_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_notify_group_flags : Void* = Pointer(Void).null
    def notify_group_flags(call_flags : Int64, group : String, notification : Int64) : Void
      if @@mb_notify_group_flags.null?
        @@mb_notify_group_flags = Bridge.get_method_bind("SceneTree", "notify_group_flags", 1245489420_i64)
      end
      val_0 = call_flags
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = group
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = notification
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_notify_group_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_group_flags : Void* = Pointer(Void).null
    def set_group_flags(call_flags : Int64, group : String, property : String, value : Void*) : Void
      if @@mb_set_group_flags.null?
        @@mb_set_group_flags = Bridge.get_method_bind("SceneTree", "set_group_flags", 3497599527_i64)
      end
      val_0 = call_flags
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = group
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = property
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = value
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_group_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_call_group : Void* = Pointer(Void).null
    def call_group(group : String, method : String) : Void
      if @@mb_call_group.null?
        @@mb_call_group = Bridge.get_method_bind("SceneTree", "call_group", 1257962832_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = method
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_call_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_notify_group : Void* = Pointer(Void).null
    def notify_group(group : String, notification : Int64) : Void
      if @@mb_notify_group.null?
        @@mb_notify_group = Bridge.get_method_bind("SceneTree", "notify_group", 2415702435_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = notification
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_notify_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_group : Void* = Pointer(Void).null
    def set_group(group : String, property : String, value : Void*) : Void
      if @@mb_set_group.null?
        @@mb_set_group = Bridge.get_method_bind("SceneTree", "set_group", 1279312029_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = property
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_nodes_in_group : Void* = Pointer(Void).null
    def get_nodes_in_group(group : String) : Godot::Array
      if @@mb_get_nodes_in_group.null?
        @@mb_get_nodes_in_group = Bridge.get_method_bind("SceneTree", "get_nodes_in_group", 689397652_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_nodes_in_group, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_first_node_in_group : Void* = Pointer(Void).null
    def get_first_node_in_group(group : String) : Node
      if @@mb_get_first_node_in_group.null?
        @@mb_get_first_node_in_group = Bridge.get_method_bind("SceneTree", "get_first_node_in_group", 4071044623_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_first_node_in_group, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_get_node_count_in_group : Void* = Pointer(Void).null
    def get_node_count_in_group(group : String) : Int64
      if @@mb_get_node_count_in_group.null?
        @@mb_get_node_count_in_group = Bridge.get_method_bind("SceneTree", "get_node_count_in_group", 2458036349_i64)
      end
      val_0 = group
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_node_count_in_group, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_current_scene : Void* = Pointer(Void).null
    def set_current_scene(child_node : Node) : Void
      if @@mb_set_current_scene.null?
        @@mb_set_current_scene = Bridge.get_method_bind("SceneTree", "set_current_scene", 1078189570_i64)
      end
      arg_ptr_0 = child_node ? child_node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_current_scene, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_current_scene : Void* = Pointer(Void).null
    def get_current_scene() : Node
      if @@mb_get_current_scene.null?
        @@mb_get_current_scene = Bridge.get_method_bind("SceneTree", "get_current_scene", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_current_scene, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_change_scene_to_file : Void* = Pointer(Void).null
    def change_scene_to_file(path : String) : Int64
      if @@mb_change_scene_to_file.null?
        @@mb_change_scene_to_file = Bridge.get_method_bind("SceneTree", "change_scene_to_file", 166001499_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_change_scene_to_file, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_change_scene_to_packed : Void* = Pointer(Void).null
    def change_scene_to_packed(packed_scene : PackedScene) : Int64
      if @@mb_change_scene_to_packed.null?
        @@mb_change_scene_to_packed = Bridge.get_method_bind("SceneTree", "change_scene_to_packed", 107349098_i64)
      end
      val_0 = packed_scene
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_change_scene_to_packed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_change_scene_to_node : Void* = Pointer(Void).null
    def change_scene_to_node(node : Node) : Int64
      if @@mb_change_scene_to_node.null?
        @@mb_change_scene_to_node = Bridge.get_method_bind("SceneTree", "change_scene_to_node", 2584678054_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_change_scene_to_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_reload_current_scene : Void* = Pointer(Void).null
    def reload_current_scene() : Int64
      if @@mb_reload_current_scene.null?
        @@mb_reload_current_scene = Bridge.get_method_bind("SceneTree", "reload_current_scene", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_reload_current_scene, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_unload_current_scene : Void* = Pointer(Void).null
    def unload_current_scene() : Void
      if @@mb_unload_current_scene.null?
        @@mb_unload_current_scene = Bridge.get_method_bind("SceneTree", "unload_current_scene", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_unload_current_scene, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_multiplayer : Void* = Pointer(Void).null
    def set_multiplayer(multiplayer : MultiplayerAPI, root_path : NodePath) : Void
      if @@mb_set_multiplayer.null?
        @@mb_set_multiplayer = Bridge.get_method_bind("SceneTree", "set_multiplayer", 2385607013_i64)
      end
      val_0 = multiplayer
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = root_path
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_multiplayer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_multiplayer : Void* = Pointer(Void).null
    def get_multiplayer(for_path : NodePath) : MultiplayerAPI
      if @@mb_get_multiplayer.null?
        @@mb_get_multiplayer = Bridge.get_method_bind("SceneTree", "get_multiplayer", 3453401404_i64)
      end
      val_0 = for_path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_multiplayer, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      MultiplayerAPI.new(ret_ptr)
    end
    @@mb_set_multiplayer_poll_enabled : Void* = Pointer(Void).null
    def set_multiplayer_poll_enabled(enabled : Bool) : Void
      if @@mb_set_multiplayer_poll_enabled.null?
        @@mb_set_multiplayer_poll_enabled = Bridge.get_method_bind("SceneTree", "set_multiplayer_poll_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_multiplayer_poll_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_multiplayer_poll_enabled : Void* = Pointer(Void).null
    def is_multiplayer_poll_enabled() : Bool
      if @@mb_is_multiplayer_poll_enabled.null?
        @@mb_is_multiplayer_poll_enabled = Bridge.get_method_bind("SceneTree", "is_multiplayer_poll_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_multiplayer_poll_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
end
