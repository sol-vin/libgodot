module Godot
  # Loader connecting .cr files in Godot's FileSystem dock to CrystalScript resources.
  @[Tool]
  node ResourceFormatLoaderCrystal < ResourceFormatLoader do
    @@instance : ResourceFormatLoaderCrystal? = nil

    def self.instance : ResourceFormatLoaderCrystal
      @@instance ||= new
    end

    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
      init_ref
      @@instance = self
    end

    def self.clear_instance : Void
      @@instance = nil
    end

    def get_recognized_extensions : Array(String)
      ["cr"]
    end

    def handles_type(typename : String) : Bool
      typename == "Script" || typename == "CrystalScript" || typename == "Resource"
    end

    def get_resource_type(path : String) : String
      path.ends_with?(".cr") ? "CrystalScript" : ""
    end

    # Resolves a virtual path (res:// or user://) or relative path to a readable file on disk
    def self.resolve_file_path(target_path : String) : String
      return "" if target_path.empty?

      if target_path.starts_with?("res://") || target_path.starts_with?("user://")
        if !Godot::ProjectSettings.singleton_ptr.null?
          ps = Godot::ProjectSettings.new(Godot::ProjectSettings.singleton_ptr)
          global_path = ps.call_str("globalize_path", target_path).gsub('\\', '/')
          return global_path if !global_path.empty? && Godot::SystemIO.file_exists?(global_path)
        end
        stripped = target_path.sub(/^(res|user):\/\//, "")
        return stripped if Godot::SystemIO.file_exists?(stripped)
      end

      return target_path if Godot::SystemIO.file_exists?(target_path)
      ""
    end

    def load(path : String, original_path : String = "") : CrystalScript?
      target_path = original_path.empty? ? path : original_path
      resolved = ResourceFormatLoaderCrystal.resolve_file_path(target_path)
      code = resolved.empty? ? "" : Godot::SystemIO.read_file(resolved)

      script = Godot.create(Godot::CrystalScript)
      if script
        script.set_script_path(target_path)
        script.set_source_code(code)
        script
      else
        nil
      end
    end

    def self._godot_has_virtual_method(method_name : String) : Bool
      case method_name
      when "_get_recognized_extensions", "_recognize_path", "_handles_type", "_get_resource_type", "_load"
        true
      else
        false
      end
    end

    def _godot_call_virtual_with_data(method_name : String, args : Void**, ret : Void*) : Void
      case method_name
      when "_get_recognized_extensions"
        Bridge.ret_packed_string_array(ret, ["cr"])
      when "_recognize_path"
        path = Bridge.arg_to_string(args[0])
        ret.as(UInt8*).value = path.ends_with?(".cr") ? 1_u8 : 0_u8
      when "_handles_type"
        typename = Bridge.arg_to_string_name(args[0])
        handles = (typename == "Script" || typename == "CrystalScript" || typename == "Resource" || typename.empty?)
        ret.as(UInt8*).value = handles ? 1_u8 : 0_u8
      when "_get_resource_type"
        path = Bridge.arg_to_string(args[0])
        Bridge.ret_string(ret, path.ends_with?(".cr") ? "CrystalScript" : "")
      when "_load"
        path = Bridge.arg_to_string(args[0])
        orig_path = Bridge.arg_to_string(args[1])
        target_path = orig_path.empty? ? path : orig_path

        resolved = ResourceFormatLoaderCrystal.resolve_file_path(target_path)
        code = resolved.empty? ? "" : Godot::SystemIO.read_file(resolved)

        script = Godot.create(Godot::CrystalScript)
        if script
          script.set_script_path(target_path)
          script.set_source_code(code)
          Bridge.ret_variant_object(ret, script.pointer)
          script.unreference
        else
          Bridge.ret_variant_nil(ret)
        end
      else
        super
      end
    end
  end

  # Saver that persists modified CrystalScript source code back to .cr files on disk
  @[Tool]
  node ResourceFormatSaverCrystal < ResourceFormatSaver do
    @@instance : ResourceFormatSaverCrystal? = nil

    def self.instance : ResourceFormatSaverCrystal
      @@instance ||= new
    end

    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
      init_ref
      @@instance = self
    end

    def self.clear_instance : Void
      @@instance = nil
    end

    def recognize(type : String) : Bool
      type == "CrystalScript" || type == "Script"
    end

    def get_recognized_extensions : Array(String)
      ["cr"]
    end

    def self.resolve_save_path(target_path : String) : String
      return "" if target_path.empty?

      if target_path.starts_with?("res://") || target_path.starts_with?("user://")
        if !Godot::ProjectSettings.singleton_ptr.null?
          ps = Godot::ProjectSettings.new(Godot::ProjectSettings.singleton_ptr)
          global_path = ps.call_str("globalize_path", target_path).gsub('\\', '/')
          return global_path unless global_path.empty?
        end
        return target_path.sub(/^(res|user):\/\//, "")
      end

      target_path
    end

    def save(script : CrystalScript, path : String) : Int32
      fs_path = ResourceFormatSaverCrystal.resolve_save_path(path)
      if Godot::SystemIO.write_file(fs_path, script.source_code)
        0_i32
      else
        1_i32
      end
    end

    def self._godot_has_virtual_method(method_name : String) : Bool
      case method_name
      when "_recognize", "_get_recognized_extensions", "_save"
        true
      else
        false
      end
    end

    def _godot_call_virtual_with_data(method_name : String, args : Void**, ret : Void*) : Void
      case method_name
      when "_recognize"
        res_ptr = args[0].as(Void**).value
        recognize = false
        if !res_ptr.null?
          if inst = Bridge.find_alive_instance(res_ptr)
            recognize = inst.is_a?(CrystalScript)
          else
            c_name = Bridge.object_call_ret_string(res_ptr, "get_class")
            recognize = (c_name == "CrystalScript")
          end
        end
        ret.as(UInt8*).value = recognize ? 1_u8 : 0_u8
      when "_get_recognized_extensions"
        Bridge.ret_packed_string_array(ret, ["cr"])
      when "_save"
        res_ptr = args[0].as(Void**).value
        path = Bridge.arg_to_string(args[1])
        fs_path = ResourceFormatSaverCrystal.resolve_save_path(path)

        code = ""
        if !res_ptr.null?
          if inst = Bridge.find_alive_instance(res_ptr)
            if script = inst.as?(CrystalScript)
              code = script.source_code
            end
          end

          # Fallback: attempt direct engine reflection call to get_source_code
          if code.empty?
            code = Bridge.object_call_ret_string(res_ptr, "get_source_code")
          end
        end

        # Safety guard against catastrophic file truncation:
        # If code could not be resolved or is empty, but the target file already exists and has content,
        # refuse to overwrite with an empty string!
        if code.empty? && !fs_path.empty? && Godot::SystemIO.file_exists?(fs_path)
          existing_len = Godot::SystemIO.file_size(fs_path)
          if existing_len > 0
            Godot.printerr("[ResourceFormatSaverCrystal] Refusing to overwrite #{path} with empty content (source code unresolved)")
            ret.as(Int32*).value = 1_i32 # ERR_FILE_CANT_WRITE
            return
          end
        end

        if !fs_path.empty? && Godot::SystemIO.write_file(fs_path, code)
          ret.as(Int32*).value = 0_i32 # OK
        else
          Godot.printerr("[ResourceFormatSaverCrystal] Failed to save #{path}")
          ret.as(Int32*).value = 1_i32 # ERR_FILE_CANT_WRITE
        end
      else
        super
      end
    end
  end
end
