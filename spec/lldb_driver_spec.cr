require "spec"
require "../src/libgodot/debugger/lldb_driver"

describe Godot::Debugger::LldbDriver do
  it "parses LLDB breakpoint stop event lines" do
    driver = Godot::Debugger::LldbDriver.new
    line = "* thread #1, stop reason = breakpoint 1.1\n    frame #0: 0x00007ff812345678 game.dll`Player#_physics_process(self=0x1234) at player.cr:42:5"
    info = driver.parse_stop_info(line)

    info.reason.should eq(Godot::Debugger::StopReason::Breakpoint)
    frame = info.frame
    frame.should_not be_nil
    if f = frame
      f.index.should eq(0)
      f.function.should contain("Player#_physics_process")
      f.file.should eq("player.cr")
      f.line.should eq(42)
    end
  end

  it "parses LLDB signal / exception stop events" do
    driver = Godot::Debugger::LldbDriver.new
    line = "* thread #2, stop reason = signal SIGSEGV: invalid address (fault address: 0x0)"
    info = driver.parse_stop_info(line)
    info.reason.should eq(Godot::Debugger::StopReason::Signal)
  end

  it "parses LLDB step stop events" do
    driver = Godot::Debugger::LldbDriver.new
    line = "* thread #1, stop reason = step over"
    info = driver.parse_stop_info(line)
    info.reason.should eq(Godot::Debugger::StopReason::Step)
  end

  it "parses LLDB user interrupt stop events" do
    driver = Godot::Debugger::LldbDriver.new
    line = "* thread #1, stop reason = interrupt"
    info = driver.parse_stop_info(line)
    info.reason.should eq(Godot::Debugger::StopReason::UserInterrupt)
  end

  it "handles frame formatting to string" do
    frame = Godot::Debugger::StackFrame.new(0, "Hero#attack", "src/hero.cr", 88)
    frame.to_s.should eq("0: Hero#attack at src/hero.cr:88")
  end

  it "initializes breakpoint info with correct defaults" do
    bp = Godot::Debugger::BreakpointInfo.new(1, "src/player.cr", 25)
    bp.id.should eq(1)
    bp.file.should eq("src/player.cr")
    bp.line.should eq(25)
    bp.hit_count.should eq(0)
    bp.enabled.should be_true
    bp.resolved.should be_false
  end
end
