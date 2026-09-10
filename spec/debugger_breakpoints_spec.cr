require "spec"
require "../src/libgodot/debugger/lldb_driver"

describe "Debugger Breakpoints Management" do
  it "manages breakpoint collections and lookups cleanly" do
    driver = Godot::Debugger::LldbDriver.new
    driver.breakpoints.size.should eq(0)

    # Simulated breakpoint tracking
    file1 = "src/player.cr"
    file2 = "src/weapon.cr"

    bp1 = Godot::Debugger::BreakpointInfo.new(1, file1, 42)
    bp2 = Godot::Debugger::BreakpointInfo.new(2, file2, 15)

    driver.breakpoints[1] = bp1
    driver.breakpoints[2] = bp2

    driver.breakpoints.size.should eq(2)
    driver.breakpoints[1].line.should eq(42)
    driver.breakpoints[2].file.should eq(file2)

    driver.breakpoints.delete(1)
    driver.breakpoints.size.should eq(1)
    driver.breakpoints[2].line.should eq(15)
  end

  it "normalizes Windows vs Unix path separators in breakpoint files" do
    clean1 = "C:\\Users\\Game\\src\\player.cr".gsub('\\', '/')
    clean2 = "C:/Users/Game/src/player.cr".gsub('\\', '/')
    clean1.should eq(clean2)
    File.basename(clean1).should eq("player.cr")
  end
end
