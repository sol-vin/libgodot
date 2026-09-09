lib LibSystemIO
  fun fopen(filename : LibC::Char*, mode : LibC::Char*) : Void*
  fun fclose(stream : Void*) : LibC::Int
  fun fread(ptr : Void*, size : LibC::SizeT, n : LibC::SizeT, stream : Void*) : LibC::SizeT
  fun fwrite(ptr : Void*, size : LibC::SizeT, n : LibC::SizeT, stream : Void*) : LibC::SizeT
  fun fseek(stream : Void*, offset : LibC::Long, whence : LibC::Int) : LibC::Int
  fun ftell(stream : Void*) : LibC::Long
  fun remove(filename : LibC::Char*) : LibC::Int
end

module Godot
  # Low-level CRT file I/O that operates safely on alien/engine threads
  # without depending on Crystal's IOCP event loop or Thread/Fiber runtime state.
  module SystemIO
    SEEK_SET = 0
    SEEK_END = 2

    # Reads the entire content of a file from disk into a Crystal String
    def self.read_file(path : String) : String
      return "" if path.empty?
      fp = LibSystemIO.fopen(path.to_unsafe, "rb".to_unsafe)
      return "" if fp.null?

      LibSystemIO.fseek(fp, 0_i32, SEEK_END)
      size = LibSystemIO.ftell(fp)
      LibSystemIO.fseek(fp, 0_i32, SEEK_SET)
      if size <= 0
        LibSystemIO.fclose(fp)
        return ""
      end

      buf = Pointer(UInt8).malloc(size + 1)
      read_bytes = LibSystemIO.fread(buf.as(Void*), 1_u64, size.to_u64, fp)
      LibSystemIO.fclose(fp)
      buf[read_bytes] = 0_u8
      String.new(buf, read_bytes.to_i32)
    end

    # Writes the entire content string to a file on disk
    def self.write_file(path : String, content : String) : Bool
      return false if path.empty?
      fp = LibSystemIO.fopen(path.to_unsafe, "wb".to_unsafe)
      return false if fp.null?

      written = LibSystemIO.fwrite(content.to_unsafe.as(Void*), 1_u64, content.bytesize.to_u64, fp)
      LibSystemIO.fclose(fp)
      written == content.bytesize.to_u64
    end

    # Returns true if the file exists on disk and can be opened for reading
    def self.file_exists?(path : String) : Bool
      return false if path.empty?
      fp = LibSystemIO.fopen(path.to_unsafe, "rb".to_unsafe)
      if !fp.null?
        LibSystemIO.fclose(fp)
        true
      else
        false
      end
    end

    # Returns the size of the file in bytes, or -1 if the file cannot be opened
    def self.file_size(path : String) : Int64
      return -1_i64 if path.empty?
      fp = LibSystemIO.fopen(path.to_unsafe, "rb".to_unsafe)
      return -1_i64 if fp.null?

      LibSystemIO.fseek(fp, 0_i32, SEEK_END)
      size = LibSystemIO.ftell(fp).to_i64
      LibSystemIO.fclose(fp)
      size
    end

    # Deletes a file on disk
    def self.delete_file(path : String) : Bool
      return false if path.empty?
      LibSystemIO.remove(path.to_unsafe) == 0
    end
  end
end
