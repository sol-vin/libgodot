require "./spec_helper"

describe "LibGodot Core & Node DSL" do
  describe "ClassRegistry" do
    it "registers declared nodes in ClassRegistry" do
      entries = Godot::ClassRegistry.entries
      entries.size.should be >= 2

      camera_entry = entries.find { |e| e.class_name == "SpecCameraRig" }
      camera_entry.should_not be_nil
      camera_entry.not_nil!.parent_name.should eq("Node")

      player_entry = entries.find { |e| e.class_name == "SpecPlayer" }
      player_entry.should_not be_nil
      player_entry.not_nil!.parent_name.should eq("CharacterBody3D")
    end

    it "registers exported properties in ClassRegistry entries" do
      player_entry = Godot::ClassRegistry.entries.find { |e| e.class_name == "SpecPlayer" }.not_nil!
      speed_prop = player_entry.properties.find { |p| p.name == "speed" }
      speed_prop.should_not be_nil

      health_prop = player_entry.properties.find { |p| p.name == "max_health" }
      health_prop.should_not be_nil
    end

    it "registers custom signals in ClassRegistry entries" do
      player_entry = Godot::ClassRegistry.entries.find { |e| e.class_name == "SpecPlayer" }.not_nil!
      health_sig = player_entry.signals.find { |s| s.name == "health_changed" }
      health_sig.should_not be_nil
      health_sig.not_nil!.args.size.should eq(2)

      died_sig = player_entry.signals.find { |s| s.name == "died" }
      died_sig.should_not be_nil
      died_sig.not_nil!.args.size.should eq(0)
    end
  end

  describe "Node Instantiation & Properties" do
    it "initializes nodes with default property values" do
      player = SpecPlayer.new
      player.speed.should eq(300.0_f32)
      player.max_health.should eq(100)
    end

    it "allows updating property values" do
      player = SpecPlayer.new
      player.speed = 450.0_f32
      player.speed.should eq(450.0_f32)

      player.max_health = 200
      player.max_health.should eq(200)
    end
  end

  describe "Range Type Cohesion" do
    it "initializes custom Range sliders with bounds" do
      slider = SpecCustomSlider.new(0..100)
      slider.min_value.should eq(0.0)
      slider.max_value.should eq(100.0)
    end

    it "supports range assignment and queries" do
      slider = SpecCustomSlider.new(0..100)
      slider.range = 25..75
      slider.to_range.should eq(25.0..75.0)
      slider.includes?(50).should be_true
      slider.includes?(10).should be_false
    end

    it "generates Godot hint strings from Range" do
      hint = (0.0..100.0).to_godot_hint_string(0.5)
      hint.should eq("0.0,100.0,0.5")
    end

    it "extracts bounds tuples from Range" do
      bounds = (10..50).to_godot_bounds
      bounds.should eq({10.0, 50.0})
    end
  end

  describe "Node Hierarchy & Path Navigation" do
    it "raises an exception when get_node receives an invalid path" do
      test_node = Godot::Node.new
      expect_raises(Exception, /Node not found/) do
        test_node.get_node("non_existent_node")
      end
    end

    it "returns nil when get_node? receives an invalid path" do
      test_node = Godot::Node.new
      test_node.get_node?("non_existent_node").should be_nil
    end

    it "returns nil when get_node_or_null receives an invalid path" do
      test_node = Godot::Node.new
      test_node.get_node_or_null("non_existent_node").should be_nil
    end
  end
end
