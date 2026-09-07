require "spec"
require "../src/main"

describe MainNode do
  it "registers with Godot ClassRegistry" do
    entry = Godot::ClassRegistry.find("MainNode")
    entry.should_not be_nil
    entry.not_nil!.parent_name.should eq("Node3D")
  end

  it "declares exported properties" do
    entry = Godot::ClassRegistry.find("MainNode")
    props = entry.not_nil!.properties.map(&.name)
    props.should contain("rotation_speed")
  end

  it "declares custom signals" do
    entry = Godot::ClassRegistry.find("MainNode")
    sigs = entry.not_nil!.signals.map(&.name)
    sigs.should contain("initialized")
  end
end
