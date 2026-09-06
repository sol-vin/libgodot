module Godot
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
  end

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

  struct Transform3D
    property basis : Basis
    property origin : Vector3

    def initialize(@basis : Basis = Basis.new, @origin : Vector3 = Vector3.new)
    end
  end
end

module Math
  def self.move_toward(from : Float32, to : Float32, delta : Float32) : Float32
    if (to - from).abs <= delta
      to
    else
      from + (to - from).sign * delta
    end
  end

  def self.move_toward(from : Float64, to : Float64, delta : Float64) : Float64
    if (to - from).abs <= delta
      to
    else
      from + (to - from).sign * delta
    end
  end
end
