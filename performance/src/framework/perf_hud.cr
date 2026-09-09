# =============================================================================
# LibGodot Performance Benchmark - Standardized Visual Performance Monitor
# =============================================================================

require "../../../src/libgodot"
require "./perf_metrics"
require "./perf_base"

module PerfFramework
  # Graph renderer for a single metric line using Line2D with dynamic viewport scaling
  class MetricGraphView
    getter container : Godot::PanelContainer
    getter graph_area : Godot::Control
    getter line : Godot::Line2D
    getter title_label : Godot::Label
    getter value_label : Godot::Label
    getter color : Godot::Color
    getter max_samples : Int32

    def initialize(parent : Godot::Node, title : String, color : Godot::Color, max_samples : Int32 = 80)
      @color = color
      @max_samples = max_samples

      @container = Godot.create(Godot::PanelContainer)
      @container.set_h_size_flags(3_i64) # SIZE_EXPAND_FILL
      @container.set_v_size_flags(3_i64) # SIZE_EXPAND_FILL
      @container.set_custom_minimum_size(Godot::Vector2.new(180.0, 115.0))
      parent.add_child(@container)

      vbox = Godot.create(Godot::VBoxContainer)
      vbox.set_h_size_flags(3_i64)
      vbox.set_v_size_flags(3_i64)
      @container.add_child(vbox)

      # Title & Value Header
      header = Godot.create(Godot::HBoxContainer)
      header.set_h_size_flags(3_i64)
      vbox.add_child(header)

      @title_label = Godot.create(Godot::Label)
      @title_label.call("set_text", title)
      header.add_child(@title_label)

      spacer = Godot.create(Godot::Control)
      spacer.set_h_size_flags(3_i64)
      header.add_child(spacer)

      @value_label = Godot.create(Godot::Label)
      @value_label.call("set_text", "---")
      header.add_child(@value_label)

      # Graph Canvas
      @graph_area = Godot.create(Godot::Control)
      @graph_area.set_h_size_flags(3_i64)
      @graph_area.set_v_size_flags(3_i64)
      @graph_area.set_custom_minimum_size(Godot::Vector2.new(140.0, 60.0))
      vbox.add_child(@graph_area)

      # Plot line
      @line = Godot.create(Godot::Line2D)
      @line.set_width(2.0)
      @line.set_default_color(color)
      @graph_area.add_child(@line)
    end

    def update(samples : Array(Float64), current_text : String, min_val : Float64? = nil, max_val : Float64? = nil)
      @value_label.call("set_text", current_text)
      @line.clear_points

      return if samples.empty?

      actual_min = min_val || samples.min
      actual_max = max_val || samples.max
      actual_max = actual_min + 0.001 if (actual_max - actual_min).abs < 0.0001

      # Calculate dynamically scaled width and height based on the current window size
      area_size = @graph_area.get_size
      graph_w = area_size.x > 30.0 ? (area_size.x - 4.0) : 240.0
      graph_h = area_size.y > 20.0 ? (area_size.y - 4.0) : 60.0
      step_x = graph_w / @max_samples.to_f64

      samples.each_with_index do |val, idx|
        norm = (val - actual_min) / (actual_max - actual_min)
        norm = norm.clamp(0.0, 1.0)
        px = (idx * step_x).to_f32 + 2.0_f32
        py = (graph_h - (norm * graph_h)).to_f32 + 2.0_f32
        @line.add_point(Godot::Vector2.new(px, py), -1_i64)
      end
    end
  end

  @[Tool]
  node PerfHUD < Godot::Control do
    property active_test : PerfBase?
    property sampler : MetricsSampler = MetricsSampler.new
    property on_return_menu : Proc(Void)?

    @samples_fps = Array(Float64).new(100)
    @samples_frame_time = Array(Float64).new(100)
    @samples_ram = Array(Float64).new(100)
    @samples_gc = Array(Float64).new(100)
    @samples_objects = Array(Float64).new(100)
    @samples_nodes = Array(Float64).new(100)

    @graph_cpu : MetricGraphView?
    @graph_ram : MetricGraphView?
    @graph_objects : MetricGraphView?
    @graph_fps : MetricGraphView?

    @lbl_title : Godot::Label?
    @lbl_status : Godot::Label?
    @lbl_duration : Godot::Label?
    @lbl_warning : Godot::Label?
    @progress_bar : Godot::ProgressBar?
    @graphs_box : Godot::HBoxContainer?
    @hud_minimized : Bool = false
    @sample_timer : Float64 = 0.0

    def _ready : Void
      build_ui
    end

    def build_ui : Void
      # Dock dynamically to top with margins that stretch across entire window
      set_anchors_preset(10_i64, false) # PRESET_TOP_WIDE
      set_anchor(0_i64, 0.0, false, false) # Left
      set_anchor(1_i64, 0.0, false, false) # Top
      set_anchor(2_i64, 1.0, false, false) # Right
      set_anchor(3_i64, 0.0, false, false) # Bottom
      set_offset(0_i64, 16.0)  # Left margin
      set_offset(1_i64, 10.0)  # Top margin
      set_offset(2_i64, -16.0) # Right margin
      set_offset(3_i64, 195.0) # Height
      set_h_size_flags(3_i64) # SIZE_EXPAND_FILL

      # Root Panel Container matching full PerfHUD bounds
      root_panel = Godot.create(Godot::PanelContainer)
      root_panel.set_anchors_preset(15_i64, false) # PRESET_FULL_RECT
      root_panel.set_h_size_flags(3_i64)
      root_panel.set_v_size_flags(3_i64)
      add_child(root_panel)

      vbox = Godot.create(Godot::VBoxContainer)
      vbox.set_h_size_flags(3_i64)
      vbox.set_v_size_flags(3_i64)
      root_panel.add_child(vbox)

      # Top Bar: Title, Duration Badge, Warning Badge, and Action Buttons
      top_bar = Godot.create(Godot::HBoxContainer)
      top_bar.set_h_size_flags(3_i64)
      vbox.add_child(top_bar)

      @lbl_title = Godot.create(Godot::Label)
      @lbl_title.not_nil!.call("set_text", "LibGodot Performance Monitor")
      top_bar.add_child(@lbl_title.not_nil!)

      # Spacer
      spacer = Godot.create(Godot::Control)
      spacer.set_h_size_flags(3_i64) # SizeFlags::ExpandFill
      top_bar.add_child(spacer)

      @lbl_status = Godot.create(Godot::Label)
      @lbl_status.not_nil!.call("set_text", "[STANDBY]")
      top_bar.add_child(@lbl_status.not_nil!)

      @lbl_duration = Godot.create(Godot::Label)
      @lbl_duration.not_nil!.call("set_text", "Mode: --")
      top_bar.add_child(@lbl_duration.not_nil!)

      @lbl_warning = Godot.create(Godot::Label)
      @lbl_warning.not_nil!.call("set_text", "")
      top_bar.add_child(@lbl_warning.not_nil!)

      # Action Buttons
      btn_gc = Godot.create(Godot::Button)
      btn_gc.call("set_text", "♻ Force GC")
      btn_gc.connect("pressed") do
        GC.collect
        @sampler.reset_baseline
        Godot.print("[PerfHUD] Forced Boehm GC cycle and reset baseline.")
      end
      top_bar.add_child(btn_gc)

      btn_pause = Godot.create(Godot::Button)
      btn_pause.call("set_text", "⏸ Pause")
      btn_pause.connect("pressed") do
        if test = @active_test
          test.toggle_pause
          btn_pause.call("set_text", test.is_paused ? "▶ Resume" : "⏸ Pause")
        end
      end
      top_bar.add_child(btn_pause)

      btn_toggle = Godot.create(Godot::Button)
      btn_toggle.call("set_text", "👁 HUD")
      btn_toggle.connect("pressed") do
        toggle_hud
      end
      top_bar.add_child(btn_toggle)

      btn_back = Godot.create(Godot::Button)
      btn_back.call("set_text", "⎋ Menu (Esc)")
      btn_back.connect("pressed") do
        return_to_menu
      end
      top_bar.add_child(btn_back)

      # Finite Progress Bar
      @progress_bar = Godot.create(Godot::ProgressBar)
      @progress_bar.not_nil!.set_h_size_flags(3_i64)
      @progress_bar.not_nil!.set_custom_minimum_size(Godot::Vector2.new(0.0, 6.0))
      @progress_bar.not_nil!.set_show_percentage(false)
      @progress_bar.not_nil!.set_visible(false)
      vbox.add_child(@progress_bar.not_nil!)

      # 4 Synchronized Charts Grid (expands equally across window width)
      @graphs_box = Godot.create(Godot::HBoxContainer)
      @graphs_box.not_nil!.set_h_size_flags(3_i64)
      @graphs_box.not_nil!.set_v_size_flags(3_i64)
      vbox.add_child(@graphs_box.not_nil!)

      # Graph 1: CPU & Frame Time
      @graph_cpu = MetricGraphView.new(
        @graphs_box.not_nil!,
        "CPU / Process",
        Godot::Color.new(0.3, 0.9, 0.5, 1.0) # Emerald
      )

      # Graph 2: RAM & GC Heap
      @graph_ram = MetricGraphView.new(
        @graphs_box.not_nil!,
        "Engine RAM / GC",
        Godot::Color.new(0.2, 0.8, 1.0, 1.0) # Cyan
      )

      # Graph 3: ObjectDB & Nodes
      @graph_objects = MetricGraphView.new(
        @graphs_box.not_nil!,
        "Objects & Nodes",
        Godot::Color.new(1.0, 0.6, 0.2, 1.0) # Amber
      )

      # Graph 4: FPS & Stability
      @graph_fps = MetricGraphView.new(
        @graphs_box.not_nil!,
        "FPS & Stability",
        Godot::Color.new(0.7, 1.0, 0.3, 1.0) # Lime
      )
    end

    def attach_test(test : PerfBase) : Void
      @active_test = test
      if lbl = @lbl_title
        lbl.call("set_text", "Stress Test: #{test.test_name}")
      end
    end

    def detach_test : Void
      @active_test = nil
      if lbl = @lbl_title
        lbl.call("set_text", "LibGodot Performance Monitor")
      end
      if lbl_s = @lbl_status
        lbl_s.call("set_text", "[STANDBY]")
      end
      if lbl_d = @lbl_duration
        lbl_d.call("set_text", "Mode: --")
      end
      if pb = @progress_bar
        pb.set_visible(false)
      end
    end

    def toggle_hud : Void
      @hud_minimized = !@hud_minimized
      if box = @graphs_box
        box.set_visible(!@hud_minimized)
      end
    end

    def return_to_menu : Void
      if test = @active_test
        test.stop_and_teardown
      end
      detach_test
      if cb = @on_return_menu
        cb.call
      else
        tree = get_tree
        unless tree.pointer.null?
          tree.call("change_scene_to_file", "res://scenes/perf_main.tscn")
        end
      end
    end

    def _process(delta : Float64) : Void
      @sample_timer += delta
      return if @sample_timer < 0.05 # Sample at ~20Hz for clean rolling charts

      @sample_timer = 0.0
      snap = @sampler.sample_now

      # Push samples to history arrays
      push_sample(@samples_fps, snap.fps)
      push_sample(@samples_frame_time, snap.frame_time_ms)
      push_sample(@samples_ram, snap.static_ram_mb)
      push_sample(@samples_gc, snap.crystal_gc_mb)
      push_sample(@samples_objects, snap.object_count.to_f64)
      push_sample(@samples_nodes, snap.node_count.to_f64)

      # Update Charts
      if g_cpu = @graph_cpu
        g_cpu.update(
          @samples_frame_time,
          "#{snap.frame_time_ms.round(1)} ms",
          min_val: 0.0,
          max_val: 33.3
        )
      end

      if g_ram = @graph_ram
        delta_mb = @sampler.ram_delta_mb
        delta_str = delta_mb >= 0 ? "+#{delta_mb.round(1)}" : "#{delta_mb.round(1)}"
        g_ram.update(
          @samples_ram,
          "#{snap.static_ram_mb.round(1)} MB (Δ #{delta_str})",
          min_val: @sampler.baseline.static_ram_mb * 0.9
        )
      end

      if g_obj = @graph_objects
        g_obj.update(
          @samples_objects,
          "Obj: #{snap.object_count} | Node: #{snap.node_count}"
        )
      end

      if g_fps = @graph_fps
        g_fps.update(
          @samples_fps,
          "#{snap.fps.round(0).to_i} FPS",
          min_val: 0.0,
          max_val: 144.0
        )
      end

      # Orphan node leak alert
      if lbl_w = @lbl_warning
        if snap.orphan_count > 0
          lbl_w.call("set_text", " ⚠️ #{snap.orphan_count} ORPHAN NODES ")
        else
          lbl_w.call("set_text", "")
        end
      end

      # Update Active Test Status & Duration
      if test = @active_test
        if lbl_s = @lbl_status
          lbl_s.call("set_text", test.is_paused ? "[PAUSED]" : (test.is_running ? "[RUNNING]" : "[FINISHED]"))
        end

        if lbl_d = @lbl_duration
          if test.is_infinite
            lbl_d.call("set_text", "Mode: [ ∞ Infinite ]  Elapsed: #{test.elapsed_time.round(1)}s (Cycles: #{test.completed_cycles})")
          else
            target_dur = test.finite_duration
            lbl_d.call("set_text", "Mode: [ Finite ]  #{test.elapsed_time.round(1)}s / #{target_dur.round(1)}s (Cycles: #{test.completed_cycles})")
          end
        end

        # Progress bar update
        if pb = @progress_bar
          if test.is_infinite || !test.is_running
            pb.set_visible(false)
          else
            pb.set_visible(true)
            pct = (test.elapsed_time / test.finite_duration) * 100.0
            pb.set_value(pct.clamp(0.0, 100.0))
          end
        end
      end
    end

    private def push_sample(arr : Array(Float64), val : Float64) : Void
      arr << val
      arr.shift if arr.size > 80
    end
  end
end
