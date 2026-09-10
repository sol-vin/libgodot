# =============================================================================
# LibGodot - Crystal LLDB Session Tab UI
# =============================================================================
# Embedded directly into Godot's Debugger bottom dock for each active session
# via EditorDebuggerSession#add_session_tab.
# Provides interactive LLDB console, execution stepping controls, call stack tree,
# role identification (Server / Client), and multiplayer lockstep break toggle.

require "../../libgodot"
require "../../libgodot/debugger/lldb_driver"

module Godot
  @[Tool]
  node CrystalLldbSessionTab < VBoxContainer do
    property session_id : Int32 = 0
    property target_pid : Int64 = 0_i64
    property role_name : String = "Instance"
    property lockstep_enabled : Bool = true
  end

  class CrystalLldbSessionTab
    @status_label : Label? = nil
    @role_badge : Label? = nil
    @btn_attach : Button? = nil
    @btn_continue : Button? = nil
    @btn_pause : Button? = nil
    @btn_step_over : Button? = nil
    @btn_step_in : Button? = nil
    @btn_step_out : Button? = nil
    @chk_lockstep : CheckBox? = nil

    @console_log : RichTextLabel? = nil
    @command_input : LineEdit? = nil
    @stack_tree : Tree? = nil
    @breakpoints_tree : Tree? = nil

    @driver : Debugger::LldbDriver? = nil
    @on_command_callback : Proc(String, Nil)? = nil
    @on_frame_select_callback : Proc(Debugger::StackFrame, Nil)? = nil
    @on_lockstep_toggle_callback : Proc(Bool, Nil)? = nil
    @on_attach_request : Proc(Nil)? = nil

    def setup(session_id : Int32, role : String = "Instance", driver : Debugger::LldbDriver? = nil) : Void
      @session_id = session_id
      @role_name = role
      @driver = driver
      self.name = "Crystal LLDB"

      call("set_h_size_flags", 3_i64) # SIZE_EXPAND_FILL
      call("set_v_size_flags", 3_i64) # SIZE_EXPAND_FILL

      build_ui
      update_status("Detached", false)
    end

    def set_on_command(&block : String -> Nil) : Void
      @on_command_callback = block
    end

    def set_on_frame_select(&block : Debugger::StackFrame -> Nil) : Void
      @on_frame_select_callback = block
    end

    def set_on_lockstep_toggle(&block : Bool -> Nil) : Void
      @on_lockstep_toggle_callback = block
    end

    def set_on_attach_request(&block : -> Nil) : Void
      @on_attach_request = block
    end

    # Appends text output into the interactive LLDB console
    def append_console(text : String) : Void
      if log = @console_log
        log.call("append_text", text)
      end
    end

    # Updates status indicator and button enabled states
    def update_status(status_text : String, is_attached : Bool, is_paused : Bool = false) : Void
      if lbl = @status_label
        icon = is_attached ? (is_paused ? "⏸ " : "▶ ") : "○ "
        lbl.call("set_text", "#{icon}#{status_text}")
      end

      if btn = @btn_attach
        btn.call("set_text", is_attached ? "Detach" : "Attach")
      end

      if btn = @btn_continue
        btn.call("set_disabled", !is_attached || !is_paused)
      end
      if btn = @btn_pause
        btn.call("set_disabled", !is_attached || is_paused)
      end
      if btn = @btn_step_over
        btn.call("set_disabled", !is_attached || !is_paused)
      end
      if btn = @btn_step_in
        btn.call("set_disabled", !is_attached || !is_paused)
      end
      if btn = @btn_step_out
        btn.call("set_disabled", !is_attached || !is_paused)
      end
    end

    # Updates the multiplayer role badge (e.g. Server, Client 1)
    def update_role(role : String, pid : Int64) : Void
      @role_name = role
      @target_pid = pid
      if badge = @role_badge
        badge.call("set_text", "[#{role.upcase} - PID: #{pid}]")
      end
    end

    # Populates call stack frames tree
    def update_stack_frames(frames : Array(Debugger::StackFrame)) : Void
      tree = @stack_tree
      return unless tree

      tree.call("clear")
      root = tree.call_obj("create_item")
      return unless root

      frames.each do |frame|
        item = tree.call_obj("create_item", root)
        next unless item
        text = "##{frame.index} #{frame.function}"
        if !frame.file.empty?
          text += " at #{File.basename(frame.file)}:#{frame.line}"
        end
        item.call("set_text", 0, text)
        item.call("set_metadata", 0, "#{frame.file}::#{frame.line}")
      end
    end

    private def build_ui : Void
      # -----------------------------------------------------------------------
      # Top Toolbar
      # -----------------------------------------------------------------------
      toolbar = Godot.create(Godot::HBoxContainer)
      return unless toolbar
      toolbar.call("add_theme_constant_override", "separation", 8)
      call("add_child", toolbar)

      # Role Badge
      badge = Godot.create(Godot::Label)
      if badge
        badge.call("set_text", "[#{@role_name.upcase}]")
        toolbar.call("add_child", badge)
        @role_badge = badge
      end

      # Status Label
      status = Godot.create(Godot::Label)
      if status
        status.call("set_text", "○ Detached")
        toolbar.call("add_child", status)
        @status_label = status
      end

      sep1 = Godot.create(Godot::VSeparator)
      toolbar.call("add_child", sep1) if sep1

      # Attach / Detach Button
      btn_att = Godot.create(Godot::Button)
      if btn_att
        btn_att.call("set_text", "Attach")
        btn_att.connect("pressed") do |_args|
          if cb = @on_attach_request
            cb.call
          end
        end
        toolbar.call("add_child", btn_att)
        @btn_attach = btn_att
      end

      # Execution Buttons
      btn_cont = Godot.create(Godot::Button)
      if btn_cont
        btn_cont.call("set_text", "Continue (F5)")
        btn_cont.call("set_tooltip_text", "Resume target execution (process continue)")
        btn_cont.connect("pressed") { |_| @driver.try(&.continue_exec) }
        toolbar.call("add_child", btn_cont)
        @btn_continue = btn_cont
      end

      btn_p = Godot.create(Godot::Button)
      if btn_p
        btn_p.call("set_text", "Pause")
        btn_p.call("set_tooltip_text", "Interrupt target execution (process interrupt)")
        btn_p.connect("pressed") { |_| @driver.try(&.interrupt_exec) }
        toolbar.call("add_child", btn_p)
        @btn_pause = btn_p
      end

      btn_so = Godot.create(Godot::Button)
      if btn_so
        btn_so.call("set_text", "Step Over (F10)")
        btn_so.connect("pressed") { |_| @driver.try(&.step_over) }
        toolbar.call("add_child", btn_so)
        @btn_step_over = btn_so
      end

      btn_si = Godot.create(Godot::Button)
      if btn_si
        btn_si.call("set_text", "Step In (F11)")
        btn_si.connect("pressed") { |_| @driver.try(&.step_into) }
        toolbar.call("add_child", btn_si)
        @btn_step_in = btn_si
      end

      btn_sou = Godot.create(Godot::Button)
      if btn_sou
        btn_sou.call("set_text", "Step Out")
        btn_sou.connect("pressed") { |_| @driver.try(&.step_out) }
        toolbar.call("add_child", btn_sou)
        @btn_step_out = btn_sou
      end

      sep2 = Godot.create(Godot::VSeparator)
      toolbar.call("add_child", sep2) if sep2

      # Multiplayer Lockstep Break Checkbox
      chk = Godot.create(Godot::CheckBox)
      if chk
        chk.call("set_text", "Lockstep Peers on Break")
        chk.call("set_pressed", true)
        chk.call("set_tooltip_text", "When this instance breaks, automatically pause all other multiplayer instances to prevent heartbeat timeouts and desync.")
        chk.connect("toggled") do |args|
          val = (args.first? == "true" || args.first? == "1")
          @lockstep_enabled = val
          if cb = @on_lockstep_toggle_callback
            cb.call(val)
          end
        end
        toolbar.call("add_child", chk)
        @chk_lockstep = chk
      end

      # -----------------------------------------------------------------------
      # Main Area Split (Console on Left, Stack Tree on Right)
      # -----------------------------------------------------------------------
      split = Godot.create(Godot::HSplitContainer)
      return unless split
      split.call("set_h_size_flags", 3)
      split.call("set_v_size_flags", 3)
      call("add_child", split)

      # Left Column: LLDB Console
      console_box = Godot.create(Godot::VBoxContainer)
      if console_box
        console_box.call("set_h_size_flags", 3)
        console_box.call("set_v_size_flags", 3)
        split.call("add_child", console_box)

        # Output Log
        log = Godot.create(Godot::RichTextLabel)
        if log
          log.call("set_h_size_flags", 3)
          log.call("set_v_size_flags", 3)
          log.call("set_scroll_follow", true)
          log.call("set_selection_enabled", true)
          console_box.call("add_child", log)
          @console_log = log
        end

        # Command Input Bar
        input_bar = Godot.create(Godot::HBoxContainer)
        if input_bar
          input_bar.call("set_h_size_flags", 3)
          console_box.call("add_child", input_bar)

          cmd_line = Godot.create(Godot::LineEdit)
          if cmd_line
            cmd_line.call("set_h_size_flags", 3)
            cmd_line.call("set_placeholder_text", "Enter LLDB command (e.g. 'p @health', 'thread backtrace', 'frame variable')...")
            cmd_line.connect("text_submitted") do |args|
              submit_current_command
            end
            input_bar.call("add_child", cmd_line)
            @command_input = cmd_line
          end

          btn_send = Godot.create(Godot::Button)
          if btn_send
            btn_send.call("set_text", "Execute")
            btn_send.connect("pressed") do |_args|
              submit_current_command
            end
            input_bar.call("add_child", btn_send)
          end
        end
      end

      # Right Column: Call Stack & Frame Inspector
      stack_box = Godot.create(Godot::VBoxContainer)
      if stack_box
        stack_box.call("set_custom_minimum_size", Vector2.new(280.0_f32, 100.0_f32))
        stack_box.call("set_v_size_flags", 3)
        split.call("add_child", stack_box)

        lbl_stack = Godot.create(Godot::Label)
        if lbl_stack
          lbl_stack.call("set_text", "Call Stack Frames")
          stack_box.call("add_child", lbl_stack)
        end

        tree = Godot.create(Godot::Tree)
        if tree
          tree.call("set_h_size_flags", 3)
          tree.call("set_v_size_flags", 3)
          tree.call("set_hide_root", true)
          tree.connect("item_selected") do |_args|
            on_tree_item_selected
          end
          stack_box.call("add_child", tree)
          @stack_tree = tree
        end
      end
    end

    private def submit_current_command : Void
      line = @command_input
      return unless line

      cmd = line.call_str("get_text").strip
      return if cmd.empty?

      append_console("(lldb) #{cmd}\n")
      line.call("set_text", "")

      if cb = @on_command_callback
        cb.call(cmd)
      elsif driver = @driver
        driver.send_command(cmd)
      end
    end

    private def on_tree_item_selected : Void
      tree = @stack_tree
      return unless tree

      selected = tree.call_obj("get_selected")
      return unless selected

      meta = selected.call_str("get_metadata", 0)
      if !meta.empty? && meta.includes?("::")
        parts = meta.split("::")
        file = parts[0]
        line_num = parts[1].to_i32 rescue 0
        frame = Debugger::StackFrame.new(0, selected.call_str("get_text", 0), file, line_num)
        if cb = @on_frame_select_callback
          cb.call(frame)
        end
      end
    end
  end
end
