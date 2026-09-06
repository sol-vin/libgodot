require "./gdextension_interface"

module LibGodot
  @[Link("libgodot")]
  lib C
    # LibGodot 4.6+ Core Entry Points
    fun libgodot_create_godot_instance = libgodot_create_godot_instance(
      argc : Int32,
      argv : UInt8**,
      init_func : Void*
    ) : GDExtensionObjectPtr

    fun libgodot_destroy_godot_instance = libgodot_destroy_godot_instance(
      godot_instance : GDExtensionObjectPtr
    ) : Void
  end

  # Dynamically loaded table for flexible runtime resolution on Windows
  class DynamicLoader
    getter? loaded : Bool = false
    getter dll_path : String = ""
    @handle : Void* = Pointer(Void).null

    alias CreateFn = (Int32, UInt8**, GDExtensionInitializationFunction) -> GDExtensionObjectPtr
    alias DestroyFn = (GDExtensionObjectPtr) -> Void

    @create_instance_fn : CreateFn? = nil
    @destroy_instance_fn : DestroyFn? = nil

    def initialize(dll_path : String = "godot.windows.template_debug.x86_64.dll")
      load(dll_path)
    end

    lib Kernel32
      fun LoadLibraryA(name : UInt8*) : Void*
      fun GetProcAddress(module_handle : Void*, proc_name : UInt8*) : Void*
      fun FreeLibrary(module_handle : Void*) : Int32
      fun GetLastError : UInt32
    end

    def load(path : String) : Bool
      @dll_path = path
      @handle = Kernel32.LoadLibraryA(path.to_unsafe)
      if @handle.null?
        # Try alternate names
        alternates = [
          "libgodot.dll",
          "godot.dll",
          "bin/libgodot.windows.template_debug.x86_64.dll",
          "bin/godot.windows.template_debug.x86_64.dll",
          "godot-src/bin/godot.windows.template_debug.x86_64.dll"
        ]
        alternates.each do |alt|
          @handle = Kernel32.LoadLibraryA(alt.to_unsafe)
          break unless @handle.null?
        end
      end

      return false if @handle.null?

      create_proc = Kernel32.GetProcAddress(@handle, "libgodot_create_godot_instance".to_unsafe)
      destroy_proc = Kernel32.GetProcAddress(@handle, "libgodot_destroy_godot_instance".to_unsafe)

      return false if create_proc.null? || destroy_proc.null?

      @create_instance_fn = Proc(Int32, UInt8**, GDExtensionInitializationFunction, GDExtensionObjectPtr).new(create_proc, Pointer(Void).null)
      @destroy_instance_fn = Proc(GDExtensionObjectPtr, Void).new(destroy_proc, Pointer(Void).null)
      @loaded = true
      true
    end

    def create_godot_instance(argc : Int32, argv : UInt8**, init_func : GDExtensionInitializationFunction) : GDExtensionObjectPtr
      if fn = @create_instance_fn
        fn.call(argc, argv, init_func)
      else
        Pointer(Void).null
      end
    end

    def destroy_godot_instance(instance : GDExtensionObjectPtr) : Void
      if fn = @destroy_instance_fn
        fn.call(instance)
      end
    end
  end
end
