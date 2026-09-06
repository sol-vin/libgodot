module Godot
  lib LibBridge
    struct CrystalPropertyDesc
      name : LibC::Char*
      type_name : LibC::Char*
      variant_type : Int32
      hint : UInt32
      hint_string : LibC::Char*
      usage : UInt32
    end

    struct CrystalSignalArgDesc
      name : LibC::Char*
      variant_type : Int32
    end

    struct CrystalSignalDesc
      name : LibC::Char*
      arg_count : Int32
      args : CrystalSignalArgDesc[8]
    end

    struct CrystalClassDesc
      name : LibC::Char*
      parent_name : LibC::Char*
      is_virtual : Bool
      is_abstract : Bool
      has_ready : Bool
      has_process : Bool
      has_physics_process : Bool

      create_instance : (CrystalClassDesc*, Void* -> Void*)
      free_instance : (Void* -> Void)
      call_virtual : (Void*, LibC::Char*, Float32 -> Void)
      set_property : (Void*, LibC::Char*, Void* -> Void)
      get_property : (Void*, LibC::Char*, Void* -> Void)

      property_count : Int32
      properties : CrystalPropertyDesc[32]

      signal_count : Int32
      signals : CrystalSignalDesc[16]
    end

    struct BridgeAPI
      register_class : (CrystalClassDesc* -> Int32)
      get_method_bind : (LibC::Char*, LibC::Char*, Int64 -> Void*)
      method_bind_ptrcall : (Void*, Void*, Void**, Void* -> Void)
      get_singleton : (LibC::Char* -> Void*)
      make_string_name : (LibC::Char* -> Void*)
      free_string_name : (Void* -> Void)
      type_from_variant : (Int32, Void*, Void* -> Void)
      variant_from_type : (Int32, Void*, Void* -> Void)
      log_print : (LibC::Char* -> Void)
      log_error : (LibC::Char*, LibC::Char*, LibC::Char*, LibC::Char*, Int32 -> Void)
      log_warning : (LibC::Char*, LibC::Char*, LibC::Char*, LibC::Char*, Int32 -> Void)
    end
  end

  module Bridge
    @@api : LibBridge::BridgeAPI* = Pointer(LibBridge::BridgeAPI).null

    # Method Binds Cache
    @@mb_cb3d_move_and_slide : Void* = Pointer(Void).null
    @@mb_cb3d_is_on_floor : Void* = Pointer(Void).null
    @@mb_cb3d_get_velocity : Void* = Pointer(Void).null
    @@mb_cb3d_set_velocity : Void* = Pointer(Void).null

    @@singleton_input : Void* = Pointer(Void).null
    @@mb_input_is_key_pressed : Void* = Pointer(Void).null
    @@mb_input_is_action_just_pressed : Void* = Pointer(Void).null
    @@mb_input_is_action_pressed : Void* = Pointer(Void).null

    # Retain descriptions so their C strings and descriptors stay alive in memory
    @@registered_descs = Array(LibBridge::CrystalClassDesc).new

    def self.api : LibBridge::BridgeAPI*
      @@api
    end

    def self.init(api : LibBridge::BridgeAPI*)
      @@api = api
      print "[CrystalBridge] Initializing Crystal runtime from game.dll..."

      # Cache CharacterBody3D Method Binds
      print "[CrystalBridge] Step 1: Getting CharacterBody3D method binds..."
      if !api.value.get_method_bind.pointer.null?
        @@mb_cb3d_move_and_slide = api.value.get_method_bind.call("CharacterBody3D".to_unsafe, "move_and_slide".to_unsafe, 2240911060_i64)
        print "[CrystalBridge]   move_and_slide: #{@@mb_cb3d_move_and_slide}"
        @@mb_cb3d_is_on_floor = api.value.get_method_bind.call("CharacterBody3D".to_unsafe, "is_on_floor".to_unsafe, 36873697_i64)
        print "[CrystalBridge]   is_on_floor: #{@@mb_cb3d_is_on_floor}"
        @@mb_cb3d_get_velocity = api.value.get_method_bind.call("CharacterBody3D".to_unsafe, "get_velocity".to_unsafe, 3360562783_i64)
        print "[CrystalBridge]   get_velocity: #{@@mb_cb3d_get_velocity}"
        @@mb_cb3d_set_velocity = api.value.get_method_bind.call("CharacterBody3D".to_unsafe, "set_velocity".to_unsafe, 3460891852_i64)
        print "[CrystalBridge]   set_velocity: #{@@mb_cb3d_set_velocity}"
      end

      # Cache Input Singleton and Method Binds
      print "[CrystalBridge] Step 2: Getting Input singleton..."
      if !api.value.get_singleton.pointer.null?
        @@singleton_input = api.value.get_singleton.call("Input".to_unsafe)
        print "[CrystalBridge]   singleton_input: #{@@singleton_input}"
      end

      if !api.value.get_method_bind.pointer.null?
        @@mb_input_is_key_pressed = api.value.get_method_bind.call("Input".to_unsafe, "is_key_pressed".to_unsafe, 1938909964_i64)
        print "[CrystalBridge]   is_key_pressed: #{@@mb_input_is_key_pressed}"
        @@mb_input_is_action_just_pressed = api.value.get_method_bind.call("Input".to_unsafe, "is_action_just_pressed".to_unsafe, 1558498928_i64)
        print "[CrystalBridge]   is_action_just_pressed: #{@@mb_input_is_action_just_pressed}"
        @@mb_input_is_action_pressed = api.value.get_method_bind.call("Input".to_unsafe, "is_action_pressed".to_unsafe, 1558498928_i64)
        print "[CrystalBridge]   is_action_pressed: #{@@mb_input_is_action_pressed}"
      end

      # Callbacks for C host
      create_fn = ->(desc : LibBridge::CrystalClassDesc*, godot_obj : Void*) : Void* {
        class_name = String.new(desc.value.name)
        if entry = Godot::ClassRegistry.find(class_name)
          inst = entry.create_proc.call(godot_obj)
          inst.pointer = godot_obj
          return Box(Godot::Object).box(inst)
        end
        Pointer(Void).null
      }

      free_fn = ->(crystal_inst : Void*) {
        # Instance will be collected by GC once Godot drops pointer
      }

      virtual_fn = ->(crystal_inst : Void*, method_name : LibC::Char*, delta : Float32) {
        if !crystal_inst.null?
          inst = Box(Godot::Object).unbox(crystal_inst)
          inst._godot_call_virtual(String.new(method_name), delta)
        end
      }

      set_prop_fn = ->(crystal_inst : Void*, prop_name : LibC::Char*, val_ptr : Void*) {
        if !crystal_inst.null?
          inst = Box(Godot::Object).unbox(crystal_inst)
          inst._godot_set_property(String.new(prop_name), val_ptr)
        end
      }

      get_prop_fn = ->(crystal_inst : Void*, prop_name : LibC::Char*, ret_ptr : Void*) {
        if !crystal_inst.null?
          inst = Box(Godot::Object).unbox(crystal_inst)
          inst._godot_get_property(String.new(prop_name), ret_ptr)
        end
      }

      # Register every class defined in Crystal
      print "[CrystalBridge] Step 3: ClassRegistry has #{Godot::ClassRegistry.entries.size} entries"
      Godot::ClassRegistry.entries.each do |entry|
        print "[CrystalBridge]   Registering entry: #{entry.class_name} < #{entry.parent_name} (props=#{entry.properties.size}, sigs=#{entry.signals.size})..."
        # Populate properties StaticArray
        props = StaticArray(LibBridge::CrystalPropertyDesc, 32).new(LibBridge::CrystalPropertyDesc.new)
        entry.properties.each_with_index do |p, idx|
          break if idx >= 32
          item = LibBridge::CrystalPropertyDesc.new
          item.name = p.name.to_unsafe
          item.type_name = p.type_name.to_unsafe
          item.variant_type = p.variant_type
          item.hint = p.hint
          item.hint_string = p.hint_string.to_unsafe
          item.usage = p.usage
          props[idx] = item
        end

        # Populate signals StaticArray
        sigs = StaticArray(LibBridge::CrystalSignalDesc, 16).new(LibBridge::CrystalSignalDesc.new)
        entry.signals.each_with_index do |s, idx|
          break if idx >= 16
          sig_item = LibBridge::CrystalSignalDesc.new
          sig_item.name = s.name.to_unsafe
          sig_item.arg_count = s.args.size
          args_arr = StaticArray(LibBridge::CrystalSignalArgDesc, 8).new(LibBridge::CrystalSignalArgDesc.new)
          s.args.each_with_index do |a, aidx|
            break if aidx >= 8
            arg_item = LibBridge::CrystalSignalArgDesc.new
            arg_item.name = a.name.to_unsafe
            arg_item.variant_type = a.variant_type
            args_arr[aidx] = arg_item
          end
          sig_item.args = args_arr
          sigs[idx] = sig_item
        end

        desc = LibBridge::CrystalClassDesc.new
        desc.name = entry.class_name.to_unsafe
        desc.parent_name = entry.parent_name.to_unsafe
        desc.is_virtual = false
        desc.is_abstract = false
        desc.has_ready = entry.has_ready
        desc.has_process = entry.has_process
        desc.has_physics_process = entry.has_physics_process

        desc.create_instance = create_fn
        desc.free_instance = free_fn
        desc.call_virtual = virtual_fn
        desc.set_property = set_prop_fn
        desc.get_property = get_prop_fn

        desc.property_count = [entry.properties.size, 32].min
        desc.properties = props

        desc.signal_count = [entry.signals.size, 16].min
        desc.signals = sigs

        desc_ptr = Pointer(LibBridge::CrystalClassDesc).malloc(1)
        desc_ptr.value = desc

        print "[CrystalBridge]   Calling api.register_class for #{entry.class_name}..."
        api.value.register_class.call(desc_ptr)
        print "[CrystalBridge]   Done registering #{entry.class_name}!"
      end

      print "[CrystalBridge] Successfully registered #{Godot::ClassRegistry.entries.size} Crystal classes with Godot!"
    end

    # Engine Logging Helpers
    def self.print(msg : String) : Void
      if !@@api.null? && !@@api.value.log_print.pointer.null?
        @@api.value.log_print.call(msg.to_unsafe)
      else
        puts msg
      end
    end

    def self.printerr(msg : String) : Void
      if !@@api.null? && !@@api.value.log_error.pointer.null?
        @@api.value.log_error.call(msg.to_unsafe, "".to_unsafe, "".to_unsafe, "".to_unsafe, 0)
      else
        STDERR.puts msg
      end
    end

    def self.error(desc : String, msg : String = "", func : String = "", file : String = "", line : Int32 = 0) : Void
      if !@@api.null? && !@@api.value.log_error.pointer.null?
        @@api.value.log_error.call(desc.to_unsafe, msg.to_unsafe, func.to_unsafe, file.to_unsafe, line)
      else
        STDERR.puts "[ERROR] #{desc}: #{msg} (#{file}:#{line} in #{func})"
      end
    end

    def self.warning(desc : String, msg : String = "", func : String = "", file : String = "", line : Int32 = 0) : Void
      if !@@api.null? && !@@api.value.log_warning.pointer.null?
        @@api.value.log_warning.call(desc.to_unsafe, msg.to_unsafe, func.to_unsafe, file.to_unsafe, line)
      else
        STDERR.puts "[WARNING] #{desc}: #{msg}"
      end
    end

    # Engine Method Calls
    def self.is_on_floor(godot_obj : Void*) : Bool
      return true if godot_obj.null? || @@mb_cb3d_is_on_floor.null? || @@api.null?
      ret = 0_u8
      @@api.value.method_bind_ptrcall.call(@@mb_cb3d_is_on_floor, godot_obj, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end

    def self.get_velocity(godot_obj : Void*) : Vector3
      return Vector3.new if godot_obj.null? || @@mb_cb3d_get_velocity.null? || @@api.null?
      vec = Vector3.new
      @@api.value.method_bind_ptrcall.call(@@mb_cb3d_get_velocity, godot_obj, Pointer(Pointer(Void)).null, pointerof(vec).as(Void*))
      vec
    end

    def self.set_velocity(godot_obj : Void*, v : Vector3) : Void
      return if godot_obj.null? || @@mb_cb3d_set_velocity.null? || @@api.null?
      val = v
      arg = pointerof(val).as(Void*)
      args = pointerof(arg)
      @@api.value.method_bind_ptrcall.call(@@mb_cb3d_set_velocity, godot_obj, args, Pointer(Void).null)
    end

    def self.move_and_slide(godot_obj : Void*) : Bool
      return true if godot_obj.null? || @@mb_cb3d_move_and_slide.null? || @@api.null?
      ret = 0_u8
      @@api.value.method_bind_ptrcall.call(@@mb_cb3d_move_and_slide, godot_obj, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end

    def self.is_key_pressed(key : Int32) : Bool
      return false if @@singleton_input.null? || @@mb_input_is_key_pressed.null? || @@api.null?
      k = key.to_i64
      arg = pointerof(k).as(Void*)
      args = pointerof(arg)
      ret = 0_u8
      @@api.value.method_bind_ptrcall.call(@@mb_input_is_key_pressed, @@singleton_input, args, pointerof(ret).as(Void*))
      ret != 0_u8
    end

    def self.is_action_just_pressed(action : String) : Bool
      return false if @@singleton_input.null? || @@mb_input_is_action_just_pressed.null? || @@api.null?
      sn = @@api.value.make_string_name.call(action.to_unsafe)
      exact = 0_u8
      arg0 = sn
      arg1 = pointerof(exact).as(Void*)
      args = [arg0, arg1]
      ret = 0_u8
      @@api.value.method_bind_ptrcall.call(@@mb_input_is_action_just_pressed, @@singleton_input, args.to_unsafe, pointerof(ret).as(Void*))
      @@api.value.free_string_name.call(sn)
      ret != 0_u8
    end

    def self.is_action_pressed(action : String) : Bool
      return false if @@singleton_input.null? || @@mb_input_is_action_pressed.null? || @@api.null?
      sn = @@api.value.make_string_name.call(action.to_unsafe)
      exact = 0_u8
      arg0 = sn
      arg1 = pointerof(exact).as(Void*)
      args = [arg0, arg1]
      ret = 0_u8
      @@api.value.method_bind_ptrcall.call(@@mb_input_is_action_pressed, @@singleton_input, args.to_unsafe, pointerof(ret).as(Void*))
      @@api.value.free_string_name.call(sn)
      ret != 0_u8
    end
  end
end

lib LibCrystalMain
  @[Raises]
  fun __crystal_main(argc : Int32, argv : UInt8**) : Void
end

# C ABI Entry point called by crystal_bridge.dll when game.dll is loaded
fun crystal_godot_init(api : Godot::LibBridge::BridgeAPI*) : Void
  GC.init
  Crystal.init_runtime
  dummy_arg = "game.dll".to_unsafe
  dummy_argv = pointerof(dummy_arg)
  LibCrystalMain.__crystal_main(1, dummy_argv)
  Godot::Bridge.init(api)
end
