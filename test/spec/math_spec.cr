require "./spec_helper"

describe "Godot Math & Spatial Primitives" do
  describe "Vector2" do
    it "performs addition and subtraction" do
      v1 = Vector2.new(2.0, 3.0)
      v2 = Vector2.new(4.0, 1.0)
      (v1 + v2).should eq(Vector2.new(6.0_f32, 4.0_f32))
      (v1 - v2).should eq(Vector2.new(-2.0_f32, 2.0_f32))
    end

    it "performs scalar multiplication and division" do
      v = Vector2.new(3.0, 6.0)
      (v * 2).should eq(Vector2.new(6.0_f32, 12.0_f32))
      (v / 3).should eq(Vector2.new(1.0_f32, 2.0_f32))
    end

    it "calculates length and length_squared" do
      v = Vector2.new(3.0, 4.0)
      v.length_squared.should eq(25.0_f32)
      v.length.should eq(5.0_f32)
    end

    it "calculates dot product" do
      v1 = Vector2.new(1.0, 2.0)
      v2 = Vector2.new(3.0, 4.0)
      v1.dot(v2).should eq(11.0_f32)
    end

    it "normalizes non-zero vectors" do
      v = Vector2.new(0.0, 5.0).normalized
      v.x.should eq(0.0_f32)
      v.y.should eq(1.0_f32)
    end

    it "provides standard direction constants" do
      Vector2::ZERO.should eq(Vector2.new(0.0_f32, 0.0_f32))
      Vector2::UP.should eq(Vector2.new(0.0_f32, -1.0_f32))
      Vector2::DOWN.should eq(Vector2.new(0.0_f32, 1.0_f32))
      Vector2::RIGHT.should eq(Vector2.new(1.0_f32, 0.0_f32))
    end
  end

  describe "Vector2i" do
    it "performs integer coordinates addition and scaling" do
      v1 = Vector2i.new(10, 20)
      v2 = Vector2i.new(5, -5)
      (v1 + v2).should eq(Vector2i.new(15, 15))
      (v1 * 2).should eq(Vector2i.new(20, 40))
    end
  end

  describe "Vector3" do
    it "performs vector addition, subtraction and scaling" do
      v1 = Vector3.new(1.0, 2.0, 3.0)
      v2 = Vector3.new(4.0, 5.0, 6.0)
      (v1 + v2).should eq(Vector3.new(5.0_f32, 7.0_f32, 9.0_f32))
      (v1 - v2).should eq(Vector3.new(-3.0_f32, -3.0_f32, -3.0_f32))
      (v1 * 2).should eq(Vector3.new(2.0_f32, 4.0_f32, 6.0_f32))
    end

    it "calculates dot product" do
      v1 = Vector3.new(1.0, 2.0, 3.0)
      v2 = Vector3.new(4.0, 5.0, 6.0)
      v1.dot(v2).should eq(32.0_f32)
    end

    it "calculates cross product" do
      cross = Vector3::UP.cross(Vector3::RIGHT)
      cross.z.should eq(-1.0_f32)
    end

    it "calculates length and normalization" do
      v = Vector3.new(0.0, 0.0, 10.0)
      v.length.should eq(10.0_f32)
      v.normalized.should eq(Vector3.new(0.0_f32, 0.0_f32, 1.0_f32))
    end

    it "provides standard 3D constants" do
      Vector3::ZERO.should eq(Vector3.new(0.0_f32, 0.0_f32, 0.0_f32))
      Vector3::UP.should eq(Vector3.new(0.0_f32, 1.0_f32, 0.0_f32))
      Vector3::RIGHT.should eq(Vector3.new(1.0_f32, 0.0_f32, 0.0_f32))
    end
  end

  describe "Vector3i" do
    it "handles discrete 3D voxel arithmetic" do
      v1 = Vector3i.new(1, 2, 3)
      v2 = Vector3i.new(10, 20, 30)
      (v1 + v2).should eq(Vector3i.new(11, 22, 33))
      (v2 - v1).should eq(Vector3i.new(9, 18, 27))
    end
  end

  describe "Color" do
    it "initializes RGBA channels with default 1.0" do
      c = Color.new
      c.r.should eq(1.0_f32)
      c.g.should eq(1.0_f32)
      c.b.should eq(1.0_f32)
      c.a.should eq(1.0_f32)
    end

    it "initializes custom color values" do
      c = Color.new(0.5, 0.25, 0.75, 0.9)
      c.r.should eq(0.5_f32)
      c.g.should eq(0.25_f32)
      c.b.should eq(0.75_f32)
      c.a.should eq(0.9_f32)
    end

    it "provides basic palette constants" do
      Color::WHITE.r.should eq(1.0_f32)
      Color::BLACK.r.should eq(0.0_f32)
      Color::RED.r.should eq(1.0_f32)
      Color::RED.g.should eq(0.0_f32)
      Color::GREEN.g.should eq(1.0_f32)
      Color::BLUE.b.should eq(1.0_f32)
    end
  end

  describe "Rect2" do
    it "initializes position and size" do
      r = Rect2.new(10.0, 20.0, 100.0, 200.0)
      r.position.x.should eq(10.0_f32)
      r.position.y.should eq(20.0_f32)
      r.size.x.should eq(100.0_f32)
      r.size.y.should eq(200.0_f32)
    end
  end

  describe "Basis & Transform3D" do
    it "creates identity Basis matrix" do
      b = Basis.new
      b.x.should eq(Vector3.new(1.0_f32, 0.0_f32, 0.0_f32))
      b.y.should eq(Vector3.new(0.0_f32, 1.0_f32, 0.0_f32))
      b.z.should eq(Vector3.new(0.0_f32, 0.0_f32, 1.0_f32))
    end

    it "multiplies Basis by Vector3" do
      b = Basis.new
      v = Vector3.new(3.0_f32, 4.0_f32, 5.0_f32)
      (b * v).should eq(v)
    end

    it "initializes Transform3D with basis and origin" do
      t = Transform3D.new
      t.origin.should eq(Vector3::ZERO)
      t.basis.x.should eq(Vector3.new(1.0_f32, 0.0_f32, 0.0_f32))
    end
  end

  describe "Math.move_toward" do
    it "interpolates toward target without overshooting" do
      res1 = Math.move_toward(0.0_f32, 10.0_f32, 3.0_f32)
      res1.should eq(3.0_f32)

      res2 = Math.move_toward(9.0_f32, 10.0_f32, 3.0_f32)
      res2.should eq(10.0_f32)

      res3 = Math.move_toward(10.0_f32, 0.0_f32, 4.0_f32)
      res3.should eq(6.0_f32)
    end
  end
end
