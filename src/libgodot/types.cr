module Godot
  # 2-element structure that can be used to represent 2D coordinates or vectors with 32-bit floating point precision.
  struct Vector2
    property x : Float32
    property y : Float32

    def initialize(@x : Float32 = 0.0_f32, @y : Float32 = 0.0_f32)
    end

    def self.new(x : Number, y : Number)
      new(x.to_f32, y.to_f32)
    end

    def +(other : Vector2) : Vector2
      Vector2.new(@x + other.x, @y + other.y)
    end

    def -(other : Vector2) : Vector2
      Vector2.new(@x - other.x, @y - other.y)
    end

    def *(scalar : Number) : Vector2
      s = scalar.to_f32
      Vector2.new(@x * s, @y * s)
    end

    def /(scalar : Number) : Vector2
      s = scalar.to_f32
      Vector2.new(@x / s, @y / s)
    end

    def length_squared : Float32
      @x * @x + @y * @y
    end

    def length : Float32
      Math.sqrt(length_squared)
    end

    def normalized : Vector2
      l = length
      l > 0.00001_f32 ? self / l : Vector2.new(0.0_f32, 0.0_f32)
    end

    def dot(other : Vector2) : Float32
      @x * other.x + @y * other.y
    end

    def to_s(io : IO) : Void
      io << "(" << @x << ", " << @y << ")"
    end

    ZERO = Vector2.new(0.0_f32, 0.0_f32)
    ONE  = Vector2.new(1.0_f32, 1.0_f32)
    UP   = Vector2.new(0.0_f32, -1.0_f32)
    DOWN = Vector2.new(0.0_f32, 1.0_f32)
    LEFT = Vector2.new(-1.0_f32, 0.0_f32)
    RIGHT= Vector2.new(1.0_f32, 0.0_f32)
  end

  # 2-element structure that can be used to represent 2D grid coordinates or discrete positions with 32-bit integers.
  struct Vector2i
    property x : Int32
    property y : Int32

    def initialize(@x : Int32 = 0, @y : Int32 = 0)
    end

    def initialize(pointer : Void*)
      ptr = pointerof(pointer).as(Int32*)
      @x = ptr[0]
      @y = ptr[1]
    end

    def self.new(x : Number, y : Number)
      new(x.to_i32, y.to_i32)
    end

    def +(other : Vector2i) : Vector2i
      Vector2i.new(@x + other.x, @y + other.y)
    end

    def -(other : Vector2i) : Vector2i
      Vector2i.new(@x - other.x, @y - other.y)
    end

    def *(scalar : Number) : Vector2i
      s = scalar.to_i32
      Vector2i.new(@x * s, @y * s)
    end

    def to_s(io : IO) : Void
      io << "(" << @x << ", " << @y << ")"
    end

    ZERO = Vector2i.new(0, 0)
    ONE  = Vector2i.new(1, 1)
  end

  # 3-element structure that can be used to represent 3D coordinates or vectors with 32-bit floating point precision.
  struct Vector3
    property x : Float32
    property y : Float32
    property z : Float32

    def initialize(@x : Float32 = 0.0_f32, @y : Float32 = 0.0_f32, @z : Float32 = 0.0_f32)
    end

    def self.new(x : Number, y : Number, z : Number)
      new(x.to_f32, y.to_f32, z.to_f32)
    end

    def +(other : Vector3) : Vector3
      Vector3.new(@x + other.x, @y + other.y, @z + other.z)
    end

    def -(other : Vector3) : Vector3
      Vector3.new(@x - other.x, @y - other.y, @z - other.z)
    end

    def *(scalar : Number) : Vector3
      s = scalar.to_f32
      Vector3.new(@x * s, @y * s, @z * s)
    end

    def /(scalar : Number) : Vector3
      s = scalar.to_f32
      Vector3.new(@x / s, @y / s, @z / s)
    end

    def length_squared : Float32
      @x * @x + @y * @y + @z * @z
    end

    def length : Float32
      Math.sqrt(length_squared)
    end

    def normalized : Vector3
      l = length
      l > 0.00001_f32 ? self / l : Vector3.new(0.0_f32, 0.0_f32, 0.0_f32)
    end

    def dot(other : Vector3) : Float32
      @x * other.x + @y * other.y + @z * other.z
    end

    def cross(other : Vector3) : Vector3
      Vector3.new(
        @y * other.z - @z * other.y,
        @z * other.x - @x * other.z,
        @x * other.y - @y * other.x
      )
    end

    def to_s(io : IO) : Void
      io << "(" << @x << ", " << @y << ", " << @z << ")"
    end

    # Common constants
    ZERO = Vector3.new(0.0_f32, 0.0_f32, 0.0_f32)
    ONE  = Vector3.new(1.0_f32, 1.0_f32, 1.0_f32)
    UP   = Vector3.new(0.0_f32, 1.0_f32, 0.0_f32)
    DOWN = Vector3.new(0.0_f32, -1.0_f32, 0.0_f32)
    LEFT = Vector3.new(-1.0_f32, 0.0_f32, 0.0_f32)
    RIGHT= Vector3.new(1.0_f32, 0.0_f32, 0.0_f32)
  end

  # 3-element structure that can be used to represent 3D grid coordinates or discrete voxels with 32-bit integers.
  struct Vector3i
    property x : Int32
    property y : Int32
    property z : Int32

    def initialize(@x : Int32 = 0, @y : Int32 = 0, @z : Int32 = 0)
    end

    def initialize(pointer : Void*)
      ptr = pointerof(pointer).as(Int32*)
      @x = ptr[0]
      @y = ptr[1]
      @z = 0
    end

    def self.new(x : Number, y : Number, z : Number)
      new(x.to_i32, y.to_i32, z.to_i32)
    end

    def +(other : Vector3i) : Vector3i
      Vector3i.new(@x + other.x, @y + other.y, @z + other.z)
    end

    def -(other : Vector3i) : Vector3i
      Vector3i.new(@x - other.x, @y - other.y, @z - other.z)
    end

    def *(scalar : Number) : Vector3i
      s = scalar.to_i32
      Vector3i.new(@x * s, @y * s, @z * s)
    end

    def to_s(io : IO) : Void
      io << "(" << @x << ", " << @y << ", " << @z << ")"
    end

    ZERO = Vector3i.new(0, 0, 0)
    ONE  = Vector3i.new(1, 1, 1)
  end

  # 2D axis-aligned bounding box defined by a position and size.
  struct Rect2
    property position : Vector2
    property size : Vector2

    def initialize(@position : Vector2 = Vector2.new, @size : Vector2 = Vector2.new)
    end

    def initialize(pointer : Void*)
      @position = Vector2.new
      @size = Vector2.new
    end

    def initialize(x : Number, y : Number, width : Number, height : Number)
      @position = Vector2.new(x.to_f32, y.to_f32)
      @size = Vector2.new(width.to_f32, height.to_f32)
    end

    def to_s(io : IO) : Void
      io << "[P: " << @position << ", S: " << @size << "]"
    end
  end

  # A color represented in RGBA format with 32-bit floating point precision per channel.
  struct Color
    property r : Float32
    property g : Float32
    property b : Float32
    property a : Float32

    def initialize(@r : Float32 = 1.0_f32, @g : Float32 = 1.0_f32, @b : Float32 = 1.0_f32, @a : Float32 = 1.0_f32)
    end

    def self.new(r : Number, g : Number, b : Number, a : Number = 1.0)
      new(r.to_f32, g.to_f32, b.to_f32, a.to_f32)
    end

    WHITE = Color.new(1.0_f32, 1.0_f32, 1.0_f32, 1.0_f32)
    BLACK = Color.new(0.0_f32, 0.0_f32, 0.0_f32, 1.0_f32)
    RED   = Color.new(1.0_f32, 0.0_f32, 0.0_f32, 1.0_f32)
    GREEN = Color.new(0.0_f32, 1.0_f32, 0.0_f32, 1.0_f32)
    BLUE  = Color.new(0.0_f32, 0.0_f32, 1.0_f32, 1.0_f32)
  end

  # A 3x3 matrix used for 3D rotation and scale.
  struct Basis
    property x : Vector3
    property y : Vector3
    property z : Vector3

    def initialize(
      @x : Vector3 = Vector3.new(1.0_f32, 0.0_f32, 0.0_f32),
      @y : Vector3 = Vector3.new(0.0_f32, 1.0_f32, 0.0_f32),
      @z : Vector3 = Vector3.new(0.0_f32, 0.0_f32, 1.0_f32)
    )
    end

    def *(vec : Vector3) : Vector3
      Vector3.new(
        @x.x * vec.x + @y.x * vec.y + @z.x * vec.z,
        @x.y * vec.x + @y.y * vec.y + @z.y * vec.z,
        @x.z * vec.x + @y.z * vec.y + @z.z * vec.z
      )
    end
  end

  # A 3x4 matrix (Basis + origin) used for 3D affine transformations.
  struct Transform3D
    property basis : Basis
    property origin : Vector3

    def initialize(@basis : Basis = Basis.new, @origin : Vector3 = Vector3.new)
    end
  end
end

module Math
  # Moves `from` toward `to` by the given `delta` amount, never exceeding `to`.
  def self.move_toward(from : Float32, to : Float32, delta : Float32) : Float32
    if (to - from).abs <= delta
      to
    else
      from + (to - from).sign * delta
    end
  end

  # Moves `from` toward `to` by the given `delta` amount with 64-bit precision, never exceeding `to`.
  def self.move_toward(from : Float64, to : Float64, delta : Float64) : Float64
    if (to - from).abs <= delta
      to
    else
      from + (to - from).sign * delta
    end
  end
end
