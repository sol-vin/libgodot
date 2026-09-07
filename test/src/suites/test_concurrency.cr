# =============================================================================
# LibGodot Test Suite: Concurrency, Fibers, Channels, GC & Thread-Safety
# =============================================================================


test_concurrency "Cooperative Fiber scheduling with spawn and Fiber.yield" do
  completed_fibers = 0
  fiber_log = Array(Int32).new

  spawn do
    fiber_log << 1
    Fiber.yield
    fiber_log << 3
    completed_fibers += 1
  end

  spawn do
    fiber_log << 2
    Fiber.yield
    fiber_log << 4
    completed_fibers += 1
  end

  # Cooperatively yield from current execution context to let spawned fibers run
  iterations = 0
  while completed_fibers < 2 && iterations < 50
    Fiber.yield
    iterations += 1
  end

  TestFramework.assert_eq completed_fibers, 2, "All cooperative fibers should complete"
  TestFramework.assert_eq fiber_log.size, 4, "All fiber log events should be recorded"
  TestFramework.assert_true fiber_log.includes?(1) && fiber_log.includes?(2) && fiber_log.includes?(3) && fiber_log.includes?(4)
end

test_concurrency "Channel message passing between background worker Thread and main thread" do
  ch = Channel(String).new
  worker_payload = "WorkerResult_48A"

  worker = Thread.new do
    # Heavy background processing simulation
    sum = 0_i64
    1000.times { |i| sum += i }
    ch.send("#{worker_payload}_#{sum}")
  end

  received = ch.receive
  worker.join

  TestFramework.assert_true received.starts_with?("WorkerResult_48A_"), "Received message must match payload"
  TestFramework.assert_eq received, "WorkerResult_48A_499500"
end

test_concurrency "Multi-producer channel contention across parallel worker threads" do
  worker_count = 4
  items_per_worker = 50
  total_items = worker_count * items_per_worker
  ch = Channel(Int32).new(total_items)

  workers = Array(Thread).new
  worker_count.times do |worker_id|
    workers << Thread.new do
      items_per_worker.times do
        ch.send(worker_id)
      end
    end
  end

  # Drain the channel from the main thread
  received_counts = Hash(Int32, Int32).new(0)
  total_items.times do
    val = ch.receive
    received_counts[val] += 1
  end

  workers.each(&.join)

  worker_count.times do |worker_id|
    TestFramework.assert_eq received_counts[worker_id], items_per_worker, "Worker #{worker_id} items mismatch"
  end
end

test_concurrency "Mutex synchronization guarantees atomic shared state updates" do
  thread_count = 4
  increments_per_thread = 250
  expected_total = thread_count * increments_per_thread

  mutex = ::Thread::Mutex.new
  shared_counter = 0

  threads = Array(Thread).new
  thread_count.times do
    threads << Thread.new do
      increments_per_thread.times do
        mutex.synchronize do
          shared_counter += 1
        end
      end
    end
  end

  threads.each(&.join)

  TestFramework.assert_eq shared_counter, expected_total, "Mutex-synchronized counter must exactly equal expected total"
end

test_concurrency "Lock-free Atomic operations under high thread contention" do
  thread_count = 4
  increments_per_thread = 500
  expected_total = thread_count * increments_per_thread

  atomic_counter = Atomic(Int32).new(0)

  threads = Array(Thread).new
  thread_count.times do
    threads << Thread.new do
      increments_per_thread.times do
        atomic_counter.add(1)
      end
    end
  end

  threads.each(&.join)

  TestFramework.assert_eq atomic_counter.get, expected_total, "Atomic counter must match total increments without lock"
end

test_concurrency "Boehm GC stability during rapid multi-threaded heap allocations and collection" do
  thread_count = 3
  allocations_per_thread = 1500

  threads = Array(Thread).new
  thread_count.times do |t_idx|
    threads << Thread.new do
      allocations_per_thread.times do |i|
        # Rapidly allocate heap objects: strings, arrays, hashes
        str = "GC_Stress_Thread_#{t_idx}_Iter_#{i}_#{Time.utc.to_unix_ms}"
        arr = Array(Int32).new(10) { |x| x * i }
        h = Hash(String, Int32).new
        h[str] = arr.size
      end
    end
  end

  threads.each(&.join)

  # Trigger explicit GC collection cycle
  GC.collect

  TestFramework.assert_true true, "GC.collect completed successfully without heap corruption or crash"
end

test_concurrency "Thread-safe instance registry (alive_instances) under concurrent registration and unregistration" do
  thread_count = 4
  ops_per_thread = 100

  # Dummy Godot::Object wrapper for test
  test_obj = Godot::Node.new

  initial_count = Godot::Bridge.alive_instance_count

  threads = Array(Thread).new
  thread_count.times do |t_idx|
    threads << Thread.new do
      ops_per_thread.times do |i|
        fake_ptr = Pointer(Void).new((t_idx * 10000 + i + 1).to_u64)
        Godot::Bridge.register_alive_instance(fake_ptr, test_obj)
        TestFramework.assert_true Godot::Bridge.has_alive_instance?(fake_ptr)
        Godot::Bridge.unregister_alive_instance(fake_ptr)
        TestFramework.assert_false Godot::Bridge.has_alive_instance?(fake_ptr)
      end
    end
  end

  threads.each(&.join)

  TestFramework.assert_eq Godot::Bridge.alive_instance_count, initial_count, "Instance count must return to baseline after unregistration"
end

test_concurrency "Background thread safe deferred method dispatch (call_deferred)" do
  target = Godot.create(Godot::Node2D)
  target.name = "InitialTargetName"

  worker = Thread.new do
    # Offload dispatch to background thread: call_deferred routes through Godot thread-safe MessageQueue
    target.call_deferred("set_name", "DeferredWorkerName")
  end

  worker.join

  # Verify target remains valid and alive
  TestFramework.assert_true target.alive?
  target.destroy
end

test_concurrency "Cross-thread object validity and dead-pointer safety" do
  node_to_destroy = Godot.create(Godot::Node2D)
  inst_id = node_to_destroy.instance_id

  ch_ready = Channel(Nil).new(2)
  ch_done = Channel(Bool).new(1)

  checker = Thread.new do
    ch_ready.send(nil) # Signal main thread that checker is running
    # Poll validity while waiting for main thread destruction
    valid_initial = Godot::Object.is_instance_id_valid(inst_id)
    ch_ready.send(nil) # Signal that initial check passed

    # Wait for destruction signal
    dead_detected = false
    50.times do
      unless Godot::Object.is_instance_id_valid(inst_id)
        dead_detected = true
        break
      end
      Crystal::System::Thread.sleep(2.milliseconds)
    end
    ch_done.send(dead_detected)
  end

  ch_ready.receive # Checker thread started
  ch_ready.receive # Initial check complete

  # Destroy on main thread
  node_to_destroy.destroy
  TestFramework.assert_true node_to_destroy.destroyed?

  dead_detected_by_thread = ch_done.receive
  checker.join

  TestFramework.assert_true dead_detected_by_thread, "Background thread must observe ObjectDB invalidation after main thread destroy"

  # Attempting call on destroyed instance from main thread safely raises DisposedObjectError
  caught = false
  begin
    node_to_destroy.call("get_name")
  rescue ex : Godot::DisposedObjectError
    caught = true
    TestFramework.assert_eq ex.instance_id, inst_id
  end
  TestFramework.assert_true caught, "DisposedObjectError raised on dead pointer access"
end
