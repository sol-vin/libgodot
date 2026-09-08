require "./spec_helper"

describe "LibGodot Concurrency & Thread Safety" do
  describe "Buffered Channels & Actor Pattern" do
	it "communicates safely across background OS threads via buffered channels" do
	  channel = Channel(Int32).new(10)

	  thread = Thread.new do
		(1..5).each do |num|
		  channel.send(num * 10)
		end
	  end

	  results = [] of Int32
	  5.times do
		results << channel.receive
	  end

	  thread.join
	  results.should eq([10, 20, 30, 40, 50])
	end
  end

  describe "Thread::Mutex Synchronization" do
	it "synchronizes concurrent access to shared data structures" do
	  mutex = ::Thread::Mutex.new
	  shared_list = [] of Int32

	  threads = (1..4).map do |thread_idx|
		Thread.new do
		  10.times do |item_idx|
			mutex.synchronize do
			  shared_list << (thread_idx * 100 + item_idx)
			end
		  end
		end
	  end

	  threads.each(&.join)
	  shared_list.size.should eq(40)
	end
  end

  describe "Fiber Cooperative Scheduling" do
	it "cooperatively yields execution between fibers" do
	  execution_log = [] of String

	  spawn do
		execution_log << "fiber_1_start"
		Fiber.yield
		execution_log << "fiber_1_end"
	  end

	  spawn do
		execution_log << "fiber_2_start"
		Fiber.yield
		execution_log << "fiber_2_end"
	  end

	  # Yield to let fibers execute
	  4.times { Fiber.yield }

	  execution_log.should contain("fiber_1_start")
	  execution_log.should contain("fiber_2_start")
	  execution_log.should contain("fiber_1_end")
	  execution_log.should contain("fiber_2_end")
	end
  end
end
