module Godot
  # Loader connecting .cr files in Godot's FileSystem dock to CrystalScript resources.
  @[Tool]
  node ResourceFormatLoaderCrystal < ResourceFormatLoader do
    tool

    @@instance : ResourceFormatLoaderCrystal? = nil

    def self.instance : ResourceFormatLoaderCrystal
      @@instance ||= new
    end

    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
      @@instance = self
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

    def load(path : String, original_path : String = "") : CrystalScript?
      target_path = original_path.empty? ? path : original_path
      fs_path = target_path.starts_with?("res://") ? target_path.sub("res://", "") : target_path
      code = ""
      if Godot::SystemIO.file_exists?(fs_path)
        code = Godot::SystemIO.read_file(fs_path)
      elsif Godot::SystemIO.file_exists?(target_path)
        code = Godot::SystemIO.read_file(target_path)
      elsif Godot::SystemIO.file_exists?("test/#{fs_path}")
        code = Godot::SystemIO.read_file("test/#{fs_path}")
      elsif Godot::SystemIO.file_exists?("../test/#{fs_path}")
        code = Godot::SystemIO.read_file("../test/#{fs_path}")
      end

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

        fs_path = target_path.starts_with?("res://") ? target_path.sub("res://", "") : target_path
        code = ""
        if Godot::SystemIO.file_exists?(fs_path)
          code = Godot::SystemIO.read_file(fs_path)
        elsif Godot::SystemIO.file_exists?(target_path)
          code = Godot::SystemIO.read_file(target_path)
        elsif Godot::SystemIO.file_exists?("test/#{fs_path}")
          code = Godot::SystemIO.read_file("test/#{fs_path}")
        elsif Godot::SystemIO.file_exists?("../test/#{fs_path}")
          code = Godot::SystemIO.read_file("../test/#{fs_path}")
        end

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
    tool

    @@instance : ResourceFormatSaverCrystal? = nil

    def self.instance : ResourceFormatSaverCrystal
      @@instance ||= new
    end

    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
      @@instance = self
    end

    def recognize(type : String) : Bool
      type == "CrystalScript" || type == "Script"
    end

    def get_recognized_extensions : Array(String)
      ["cr"]
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
        fs_path = path.starts_with?("res://") ? path.sub("res://", "") : path

        code = ""
        if inst = Bridge.find_alive_instance(res_ptr)
          if script = inst.as?(CrystalScript)
            code = script.source_code
          end
        end

        if Godot::SystemIO.write_file(fs_path, code)
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
