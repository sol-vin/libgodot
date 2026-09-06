# Generated gui classes
module Godot
  class Control < Godot::CanvasItem
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum FocusMode : Int64
      FocusNone = 0_i64
      FocusClick = 1_i64
      FocusAll = 2_i64
      FocusAccessibility = 3_i64
    end
    enum FocusBehaviorRecursive : Int64
      FocusBehaviorInherited = 0_i64
      FocusBehaviorDisabled = 1_i64
      FocusBehaviorEnabled = 2_i64
    end
    enum MouseBehaviorRecursive : Int64
      MouseBehaviorInherited = 0_i64
      MouseBehaviorDisabled = 1_i64
      MouseBehaviorEnabled = 2_i64
    end
    enum CursorShape : Int64
      CursorArrow = 0_i64
      CursorIbeam = 1_i64
      CursorPointingHand = 2_i64
      CursorCross = 3_i64
      CursorWait = 4_i64
      CursorBusy = 5_i64
      CursorDrag = 6_i64
      CursorCanDrop = 7_i64
      CursorForbidden = 8_i64
      CursorVsize = 9_i64
      CursorHsize = 10_i64
      CursorBdiagsize = 11_i64
      CursorFdiagsize = 12_i64
      CursorMove = 13_i64
      CursorVsplit = 14_i64
      CursorHsplit = 15_i64
      CursorHelp = 16_i64
    end
    enum LayoutPreset : Int64
      PresetTopLeft = 0_i64
      PresetTopRight = 1_i64
      PresetBottomLeft = 2_i64
      PresetBottomRight = 3_i64
      PresetCenterLeft = 4_i64
      PresetCenterTop = 5_i64
      PresetCenterRight = 6_i64
      PresetCenterBottom = 7_i64
      PresetCenter = 8_i64
      PresetLeftWide = 9_i64
      PresetTopWide = 10_i64
      PresetRightWide = 11_i64
      PresetBottomWide = 12_i64
      PresetVcenterWide = 13_i64
      PresetHcenterWide = 14_i64
      PresetFullRect = 15_i64
    end
    enum LayoutPresetMode : Int64
      PresetModeMinsize = 0_i64
      PresetModeKeepWidth = 1_i64
      PresetModeKeepHeight = 2_i64
      PresetModeKeepSize = 3_i64
    end
    enum SizeFlags : Int64
      SizeShrinkBegin = 0_i64
      SizeFill = 1_i64
      SizeExpand = 2_i64
      SizeExpandFill = 3_i64
      SizeShrinkCenter = 4_i64
      SizeShrinkEnd = 8_i64
      SizeMaximize = 16_i64
    end
    enum MouseFilter : Int64
      MouseFilterStop = 0_i64
      MouseFilterPass = 1_i64
      MouseFilterIgnore = 2_i64
    end
    enum GrowDirection : Int64
      GrowDirectionBegin = 0_i64
      GrowDirectionEnd = 1_i64
      GrowDirectionBoth = 2_i64
    end
    enum Anchor : Int64
      AnchorBegin = 0_i64
      AnchorEnd = 1_i64
    end
    enum LayoutDirection : Int64
      LayoutDirectionInherited = 0_i64
      LayoutDirectionApplicationLocale = 1_i64
      LayoutDirectionLtr = 2_i64
      LayoutDirectionRtl = 3_i64
      LayoutDirectionSystemLocale = 4_i64
      LayoutDirectionMax = 5_i64
      LayoutDirectionLocale = 1_i64
    end
    enum TextDirection : Int64
      TextDirectionInherited = 3_i64
      TextDirectionAuto = 0_i64
      TextDirectionLtr = 1_i64
      TextDirectionRtl = 2_i64
    end
    @@mb_accept_event : Void* = Pointer(Void).null
    def accept_event() : Void
      if @@mb_accept_event.null?
        @@mb_accept_event = Bridge.get_method_bind("Control", "accept_event", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_accept_event, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_maximum_size : Void* = Pointer(Void).null
    def get_maximum_size() : Vector2
      if @@mb_get_maximum_size.null?
        @@mb_get_maximum_size = Bridge.get_method_bind("Control", "get_maximum_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_maximum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_combined_maximum_size : Void* = Pointer(Void).null
    def get_combined_maximum_size() : Vector2
      if @@mb_get_combined_maximum_size.null?
        @@mb_get_combined_maximum_size = Bridge.get_method_bind("Control", "get_combined_maximum_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_combined_maximum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_minimum_size : Void* = Pointer(Void).null
    def get_minimum_size() : Vector2
      if @@mb_get_minimum_size.null?
        @@mb_get_minimum_size = Bridge.get_method_bind("Control", "get_minimum_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_minimum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_combined_minimum_size : Void* = Pointer(Void).null
    def get_combined_minimum_size() : Vector2
      if @@mb_get_combined_minimum_size.null?
        @@mb_get_combined_minimum_size = Bridge.get_method_bind("Control", "get_combined_minimum_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_combined_minimum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_propagate_maximum_size : Void* = Pointer(Void).null
    def set_propagate_maximum_size(enable : Bool) : Void
      if @@mb_set_propagate_maximum_size.null?
        @@mb_set_propagate_maximum_size = Bridge.get_method_bind("Control", "set_propagate_maximum_size", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_propagate_maximum_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_propagating_maximum_size : Void* = Pointer(Void).null
    def is_propagating_maximum_size() : Bool
      if @@mb_is_propagating_maximum_size.null?
        @@mb_is_propagating_maximum_size = Bridge.get_method_bind("Control", "is_propagating_maximum_size", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_propagating_maximum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_bound_minimum_size : Void* = Pointer(Void).null
    def get_bound_minimum_size() : Vector2
      if @@mb_get_bound_minimum_size.null?
        @@mb_get_bound_minimum_size = Bridge.get_method_bind("Control", "get_bound_minimum_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_bound_minimum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_anchors_preset : Void* = Pointer(Void).null
    def set_anchors_preset(preset : Int64, keep_offsets : Bool) : Void
      if @@mb_set_anchors_preset.null?
        @@mb_set_anchors_preset = Bridge.get_method_bind("Control", "set_anchors_preset", 509135270_i64)
      end
      val_0 = preset
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = keep_offsets
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_anchors_preset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_offsets_preset : Void* = Pointer(Void).null
    def set_offsets_preset(preset : Int64, resize_mode : Int64, margin : Int64) : Void
      if @@mb_set_offsets_preset.null?
        @@mb_set_offsets_preset = Bridge.get_method_bind("Control", "set_offsets_preset", 3724524307_i64)
      end
      val_0 = preset
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = resize_mode
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = margin
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_offsets_preset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_anchors_and_offsets_preset : Void* = Pointer(Void).null
    def set_anchors_and_offsets_preset(preset : Int64, resize_mode : Int64, margin : Int64) : Void
      if @@mb_set_anchors_and_offsets_preset.null?
        @@mb_set_anchors_and_offsets_preset = Bridge.get_method_bind("Control", "set_anchors_and_offsets_preset", 3724524307_i64)
      end
      val_0 = preset
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = resize_mode
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = margin
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_anchors_and_offsets_preset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_anchor : Void* = Pointer(Void).null
    def set_anchor(side : Int64, anchor : Float64, keep_offset : Bool, push_opposite_anchor : Bool) : Void
      if @@mb_set_anchor.null?
        @@mb_set_anchor = Bridge.get_method_bind("Control", "set_anchor", 2302782885_i64)
      end
      val_0 = side
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = anchor
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = keep_offset
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = push_opposite_anchor
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_anchor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_anchor : Void* = Pointer(Void).null
    def get_anchor(side : Int64) : Float64
      if @@mb_get_anchor.null?
        @@mb_get_anchor = Bridge.get_method_bind("Control", "get_anchor", 2869120046_i64)
      end
      val_0 = side
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_anchor, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset : Void* = Pointer(Void).null
    def set_offset(side : Int64, offset : Float64) : Void
      if @@mb_set_offset.null?
        @@mb_set_offset = Bridge.get_method_bind("Control", "set_offset", 4290182280_i64)
      end
      val_0 = side
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = offset
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset : Void* = Pointer(Void).null
    def get_offset(offset : Int64) : Float64
      if @@mb_get_offset.null?
        @@mb_get_offset = Bridge.get_method_bind("Control", "get_offset", 2869120046_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_offset, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_anchor_and_offset : Void* = Pointer(Void).null
    def set_anchor_and_offset(side : Int64, anchor : Float64, offset : Float64, push_opposite_anchor : Bool) : Void
      if @@mb_set_anchor_and_offset.null?
        @@mb_set_anchor_and_offset = Bridge.get_method_bind("Control", "set_anchor_and_offset", 4031722181_i64)
      end
      val_0 = side
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = anchor
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = push_opposite_anchor
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_anchor_and_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_begin : Void* = Pointer(Void).null
    def set_begin(position : Vector2) : Void
      if @@mb_set_begin.null?
        @@mb_set_begin = Bridge.get_method_bind("Control", "set_begin", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_begin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_end : Void* = Pointer(Void).null
    def set_end(position : Vector2) : Void
      if @@mb_set_end.null?
        @@mb_set_end = Bridge.get_method_bind("Control", "set_end", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_end, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_position : Void* = Pointer(Void).null
    def set_position(position : Vector2, keep_offsets : Bool) : Void
      if @@mb_set_position.null?
        @@mb_set_position = Bridge.get_method_bind("Control", "set_position", 2436320129_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = keep_offsets
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_size : Void* = Pointer(Void).null
    def set_size(size : Vector2, keep_offsets : Bool) : Void
      if @@mb_set_size.null?
        @@mb_set_size = Bridge.get_method_bind("Control", "set_size", 2436320129_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = keep_offsets
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reset_size : Void* = Pointer(Void).null
    def reset_size() : Void
      if @@mb_reset_size.null?
        @@mb_reset_size = Bridge.get_method_bind("Control", "reset_size", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reset_size, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_custom_maximum_size : Void* = Pointer(Void).null
    def set_custom_maximum_size(size : Vector2) : Void
      if @@mb_set_custom_maximum_size.null?
        @@mb_set_custom_maximum_size = Bridge.get_method_bind("Control", "set_custom_maximum_size", 743155724_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_maximum_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_custom_minimum_size : Void* = Pointer(Void).null
    def set_custom_minimum_size(size : Vector2) : Void
      if @@mb_set_custom_minimum_size.null?
        @@mb_set_custom_minimum_size = Bridge.get_method_bind("Control", "set_custom_minimum_size", 743155724_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_minimum_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_global_position : Void* = Pointer(Void).null
    def set_global_position(position : Vector2, keep_offsets : Bool) : Void
      if @@mb_set_global_position.null?
        @@mb_set_global_position = Bridge.get_method_bind("Control", "set_global_position", 2436320129_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = keep_offsets
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_global_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_rotation : Void* = Pointer(Void).null
    def set_rotation(radians : Float64) : Void
      if @@mb_set_rotation.null?
        @@mb_set_rotation = Bridge.get_method_bind("Control", "set_rotation", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_rotation_degrees : Void* = Pointer(Void).null
    def set_rotation_degrees(degrees : Float64) : Void
      if @@mb_set_rotation_degrees.null?
        @@mb_set_rotation_degrees = Bridge.get_method_bind("Control", "set_rotation_degrees", 373806689_i64)
      end
      val_0 = degrees
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rotation_degrees, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_scale : Void* = Pointer(Void).null
    def set_scale(scale : Vector2) : Void
      if @@mb_set_scale.null?
        @@mb_set_scale = Bridge.get_method_bind("Control", "set_scale", 743155724_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_pivot_offset : Void* = Pointer(Void).null
    def set_pivot_offset(pivot_offset : Vector2) : Void
      if @@mb_set_pivot_offset.null?
        @@mb_set_pivot_offset = Bridge.get_method_bind("Control", "set_pivot_offset", 743155724_i64)
      end
      val_0 = pivot_offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pivot_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_pivot_offset_ratio : Void* = Pointer(Void).null
    def set_pivot_offset_ratio(ratio : Vector2) : Void
      if @@mb_set_pivot_offset_ratio.null?
        @@mb_set_pivot_offset_ratio = Bridge.get_method_bind("Control", "set_pivot_offset_ratio", 743155724_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pivot_offset_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_begin : Void* = Pointer(Void).null
    def get_begin() : Vector2
      if @@mb_get_begin.null?
        @@mb_get_begin = Bridge.get_method_bind("Control", "get_begin", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_begin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_end : Void* = Pointer(Void).null
    def get_end() : Vector2
      if @@mb_get_end.null?
        @@mb_get_end = Bridge.get_method_bind("Control", "get_end", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_end, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_position : Void* = Pointer(Void).null
    def get_position() : Vector2
      if @@mb_get_position.null?
        @@mb_get_position = Bridge.get_method_bind("Control", "get_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_size : Void* = Pointer(Void).null
    def get_size() : Vector2
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("Control", "get_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rotation : Void* = Pointer(Void).null
    def get_rotation() : Float64
      if @@mb_get_rotation.null?
        @@mb_get_rotation = Bridge.get_method_bind("Control", "get_rotation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rotation_degrees : Void* = Pointer(Void).null
    def get_rotation_degrees() : Float64
      if @@mb_get_rotation_degrees.null?
        @@mb_get_rotation_degrees = Bridge.get_method_bind("Control", "get_rotation_degrees", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_rotation_degrees, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_scale : Void* = Pointer(Void).null
    def get_scale() : Vector2
      if @@mb_get_scale.null?
        @@mb_get_scale = Bridge.get_method_bind("Control", "get_scale", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_pivot_offset : Void* = Pointer(Void).null
    def get_pivot_offset() : Vector2
      if @@mb_get_pivot_offset.null?
        @@mb_get_pivot_offset = Bridge.get_method_bind("Control", "get_pivot_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_pivot_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_pivot_offset_ratio : Void* = Pointer(Void).null
    def get_pivot_offset_ratio() : Vector2
      if @@mb_get_pivot_offset_ratio.null?
        @@mb_get_pivot_offset_ratio = Bridge.get_method_bind("Control", "get_pivot_offset_ratio", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_pivot_offset_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_combined_pivot_offset : Void* = Pointer(Void).null
    def get_combined_pivot_offset() : Vector2
      if @@mb_get_combined_pivot_offset.null?
        @@mb_get_combined_pivot_offset = Bridge.get_method_bind("Control", "get_combined_pivot_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_combined_pivot_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_custom_maximum_size : Void* = Pointer(Void).null
    def get_custom_maximum_size() : Vector2
      if @@mb_get_custom_maximum_size.null?
        @@mb_get_custom_maximum_size = Bridge.get_method_bind("Control", "get_custom_maximum_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_custom_maximum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_custom_minimum_size : Void* = Pointer(Void).null
    def get_custom_minimum_size() : Vector2
      if @@mb_get_custom_minimum_size.null?
        @@mb_get_custom_minimum_size = Bridge.get_method_bind("Control", "get_custom_minimum_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_custom_minimum_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_parent_area_size : Void* = Pointer(Void).null
    def get_parent_area_size() : Vector2
      if @@mb_get_parent_area_size.null?
        @@mb_get_parent_area_size = Bridge.get_method_bind("Control", "get_parent_area_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_parent_area_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_global_position : Void* = Pointer(Void).null
    def get_global_position() : Vector2
      if @@mb_get_global_position.null?
        @@mb_get_global_position = Bridge.get_method_bind("Control", "get_global_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_global_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_screen_position : Void* = Pointer(Void).null
    def get_screen_position() : Vector2
      if @@mb_get_screen_position.null?
        @@mb_get_screen_position = Bridge.get_method_bind("Control", "get_screen_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_screen_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rect : Void* = Pointer(Void).null
    def get_rect() : Rect2
      if @@mb_get_rect.null?
        @@mb_get_rect = Bridge.get_method_bind("Control", "get_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_get_global_rect : Void* = Pointer(Void).null
    def get_global_rect() : Rect2
      if @@mb_get_global_rect.null?
        @@mb_get_global_rect = Bridge.get_method_bind("Control", "get_global_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_global_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_set_focus_mode : Void* = Pointer(Void).null
    def set_focus_mode(mode : Int64) : Void
      if @@mb_set_focus_mode.null?
        @@mb_set_focus_mode = Bridge.get_method_bind("Control", "set_focus_mode", 3232914922_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_focus_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_focus_mode : Void* = Pointer(Void).null
    def get_focus_mode() : Int64
      if @@mb_get_focus_mode.null?
        @@mb_get_focus_mode = Bridge.get_method_bind("Control", "get_focus_mode", 2132829277_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_focus_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_focus_mode_with_override : Void* = Pointer(Void).null
    def get_focus_mode_with_override() : Int64
      if @@mb_get_focus_mode_with_override.null?
        @@mb_get_focus_mode_with_override = Bridge.get_method_bind("Control", "get_focus_mode_with_override", 2132829277_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_focus_mode_with_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_focus_behavior_recursive : Void* = Pointer(Void).null
    def set_focus_behavior_recursive(focus_behavior_recursive : Int64) : Void
      if @@mb_set_focus_behavior_recursive.null?
        @@mb_set_focus_behavior_recursive = Bridge.get_method_bind("Control", "set_focus_behavior_recursive", 4256832521_i64)
      end
      val_0 = focus_behavior_recursive
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_focus_behavior_recursive, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_focus_behavior_recursive : Void* = Pointer(Void).null
    def get_focus_behavior_recursive() : Int64
      if @@mb_get_focus_behavior_recursive.null?
        @@mb_get_focus_behavior_recursive = Bridge.get_method_bind("Control", "get_focus_behavior_recursive", 2435707181_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_focus_behavior_recursive, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_focus : Void* = Pointer(Void).null
    def has_focus(ignore_hidden_focus : Bool) : Bool
      if @@mb_has_focus.null?
        @@mb_has_focus = Bridge.get_method_bind("Control", "has_focus", 3302206351_i64)
      end
      val_0 = ignore_hidden_focus
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_focus, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_grab_focus : Void* = Pointer(Void).null
    def grab_focus(hide_focus : Bool) : Void
      if @@mb_grab_focus.null?
        @@mb_grab_focus = Bridge.get_method_bind("Control", "grab_focus", 107499316_i64)
      end
      val_0 = hide_focus
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_grab_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_release_focus : Void* = Pointer(Void).null
    def release_focus() : Void
      if @@mb_release_focus.null?
        @@mb_release_focus = Bridge.get_method_bind("Control", "release_focus", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_release_focus, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_find_prev_valid_focus : Void* = Pointer(Void).null
    def find_prev_valid_focus() : Control
      if @@mb_find_prev_valid_focus.null?
        @@mb_find_prev_valid_focus = Bridge.get_method_bind("Control", "find_prev_valid_focus", 2783021301_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_prev_valid_focus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Control.new(ret_ptr)
    end
    @@mb_find_next_valid_focus : Void* = Pointer(Void).null
    def find_next_valid_focus() : Control
      if @@mb_find_next_valid_focus.null?
        @@mb_find_next_valid_focus = Bridge.get_method_bind("Control", "find_next_valid_focus", 2783021301_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_next_valid_focus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Control.new(ret_ptr)
    end
    @@mb_find_valid_focus_neighbor : Void* = Pointer(Void).null
    def find_valid_focus_neighbor(side : Int64) : Control
      if @@mb_find_valid_focus_neighbor.null?
        @@mb_find_valid_focus_neighbor = Bridge.get_method_bind("Control", "find_valid_focus_neighbor", 1543910170_i64)
      end
      val_0 = side
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_valid_focus_neighbor, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Control.new(ret_ptr)
    end
    @@mb_set_h_size_flags : Void* = Pointer(Void).null
    def set_h_size_flags(flags : Int64) : Void
      if @@mb_set_h_size_flags.null?
        @@mb_set_h_size_flags = Bridge.get_method_bind("Control", "set_h_size_flags", 394851643_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_h_size_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_h_size_flags : Void* = Pointer(Void).null
    def get_h_size_flags() : Int64
      if @@mb_get_h_size_flags.null?
        @@mb_get_h_size_flags = Bridge.get_method_bind("Control", "get_h_size_flags", 3781367401_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_h_size_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_stretch_ratio : Void* = Pointer(Void).null
    def set_stretch_ratio(ratio : Float64) : Void
      if @@mb_set_stretch_ratio.null?
        @@mb_set_stretch_ratio = Bridge.get_method_bind("Control", "set_stretch_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stretch_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stretch_ratio : Void* = Pointer(Void).null
    def get_stretch_ratio() : Float64
      if @@mb_get_stretch_ratio.null?
        @@mb_get_stretch_ratio = Bridge.get_method_bind("Control", "get_stretch_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_stretch_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_v_size_flags : Void* = Pointer(Void).null
    def set_v_size_flags(flags : Int64) : Void
      if @@mb_set_v_size_flags.null?
        @@mb_set_v_size_flags = Bridge.get_method_bind("Control", "set_v_size_flags", 394851643_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_size_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_size_flags : Void* = Pointer(Void).null
    def get_v_size_flags() : Int64
      if @@mb_get_v_size_flags.null?
        @@mb_get_v_size_flags = Bridge.get_method_bind("Control", "get_v_size_flags", 3781367401_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_v_size_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset_transform_enabled : Void* = Pointer(Void).null
    def set_offset_transform_enabled(enabled : Bool) : Void
      if @@mb_set_offset_transform_enabled.null?
        @@mb_set_offset_transform_enabled = Bridge.get_method_bind("Control", "set_offset_transform_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_offset_transform_enabled : Void* = Pointer(Void).null
    def is_offset_transform_enabled() : Bool
      if @@mb_is_offset_transform_enabled.null?
        @@mb_is_offset_transform_enabled = Bridge.get_method_bind("Control", "is_offset_transform_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_offset_transform_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_offset_transform_position : Void* = Pointer(Void).null
    def set_offset_transform_position(offset : Vector2) : Void
      if @@mb_set_offset_transform_position.null?
        @@mb_set_offset_transform_position = Bridge.get_method_bind("Control", "set_offset_transform_position", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset_transform_position : Void* = Pointer(Void).null
    def get_offset_transform_position() : Vector2
      if @@mb_get_offset_transform_position.null?
        @@mb_get_offset_transform_position = Bridge.get_method_bind("Control", "get_offset_transform_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset_transform_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset_transform_position_ratio : Void* = Pointer(Void).null
    def set_offset_transform_position_ratio(offset : Vector2) : Void
      if @@mb_set_offset_transform_position_ratio.null?
        @@mb_set_offset_transform_position_ratio = Bridge.get_method_bind("Control", "set_offset_transform_position_ratio", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_position_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset_transform_position_ratio : Void* = Pointer(Void).null
    def get_offset_transform_position_ratio() : Vector2
      if @@mb_get_offset_transform_position_ratio.null?
        @@mb_get_offset_transform_position_ratio = Bridge.get_method_bind("Control", "get_offset_transform_position_ratio", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset_transform_position_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset_transform_scale : Void* = Pointer(Void).null
    def set_offset_transform_scale(scale : Vector2) : Void
      if @@mb_set_offset_transform_scale.null?
        @@mb_set_offset_transform_scale = Bridge.get_method_bind("Control", "set_offset_transform_scale", 743155724_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset_transform_scale : Void* = Pointer(Void).null
    def get_offset_transform_scale() : Vector2
      if @@mb_get_offset_transform_scale.null?
        @@mb_get_offset_transform_scale = Bridge.get_method_bind("Control", "get_offset_transform_scale", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset_transform_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset_transform_rotation : Void* = Pointer(Void).null
    def set_offset_transform_rotation(rotation : Float64) : Void
      if @@mb_set_offset_transform_rotation.null?
        @@mb_set_offset_transform_rotation = Bridge.get_method_bind("Control", "set_offset_transform_rotation", 373806689_i64)
      end
      val_0 = rotation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset_transform_rotation : Void* = Pointer(Void).null
    def get_offset_transform_rotation() : Float64
      if @@mb_get_offset_transform_rotation.null?
        @@mb_get_offset_transform_rotation = Bridge.get_method_bind("Control", "get_offset_transform_rotation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_offset_transform_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset_transform_pivot : Void* = Pointer(Void).null
    def set_offset_transform_pivot(pivot : Vector2) : Void
      if @@mb_set_offset_transform_pivot.null?
        @@mb_set_offset_transform_pivot = Bridge.get_method_bind("Control", "set_offset_transform_pivot", 743155724_i64)
      end
      val_0 = pivot
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_pivot, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset_transform_pivot : Void* = Pointer(Void).null
    def get_offset_transform_pivot() : Vector2
      if @@mb_get_offset_transform_pivot.null?
        @@mb_get_offset_transform_pivot = Bridge.get_method_bind("Control", "get_offset_transform_pivot", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset_transform_pivot, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset_transform_pivot_ratio : Void* = Pointer(Void).null
    def set_offset_transform_pivot_ratio(pivot : Vector2) : Void
      if @@mb_set_offset_transform_pivot_ratio.null?
        @@mb_set_offset_transform_pivot_ratio = Bridge.get_method_bind("Control", "set_offset_transform_pivot_ratio", 743155724_i64)
      end
      val_0 = pivot
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_pivot_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset_transform_pivot_ratio : Void* = Pointer(Void).null
    def get_offset_transform_pivot_ratio() : Vector2
      if @@mb_get_offset_transform_pivot_ratio.null?
        @@mb_get_offset_transform_pivot_ratio = Bridge.get_method_bind("Control", "get_offset_transform_pivot_ratio", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset_transform_pivot_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset_transform_visual_only : Void* = Pointer(Void).null
    def set_offset_transform_visual_only(enabled : Bool) : Void
      if @@mb_set_offset_transform_visual_only.null?
        @@mb_set_offset_transform_visual_only = Bridge.get_method_bind("Control", "set_offset_transform_visual_only", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset_transform_visual_only, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_offset_transform_visual_only : Void* = Pointer(Void).null
    def is_offset_transform_visual_only() : Bool
      if @@mb_is_offset_transform_visual_only.null?
        @@mb_is_offset_transform_visual_only = Bridge.get_method_bind("Control", "is_offset_transform_visual_only", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_offset_transform_visual_only, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_theme : Void* = Pointer(Void).null
    def set_theme(theme : Theme) : Void
      if @@mb_set_theme.null?
        @@mb_set_theme = Bridge.get_method_bind("Control", "set_theme", 2326690814_i64)
      end
      val_0 = theme
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_theme, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_theme : Void* = Pointer(Void).null
    def get_theme() : Theme
      if @@mb_get_theme.null?
        @@mb_get_theme = Bridge.get_method_bind("Control", "get_theme", 3846893731_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_theme, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Theme.new(ret_ptr)
    end
    @@mb_set_theme_type_variation : Void* = Pointer(Void).null
    def set_theme_type_variation(theme_type : String) : Void
      if @@mb_set_theme_type_variation.null?
        @@mb_set_theme_type_variation = Bridge.get_method_bind("Control", "set_theme_type_variation", 3304788590_i64)
      end
      val_0 = theme_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_theme_type_variation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_theme_type_variation : Void* = Pointer(Void).null
    def get_theme_type_variation() : String
      if @@mb_get_theme_type_variation.null?
        @@mb_get_theme_type_variation = Bridge.get_method_bind("Control", "get_theme_type_variation", 2002593661_i64)
      end
      ""
    end
    @@mb_begin_bulk_theme_override : Void* = Pointer(Void).null
    def begin_bulk_theme_override() : Void
      if @@mb_begin_bulk_theme_override.null?
        @@mb_begin_bulk_theme_override = Bridge.get_method_bind("Control", "begin_bulk_theme_override", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_begin_bulk_theme_override, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_end_bulk_theme_override : Void* = Pointer(Void).null
    def end_bulk_theme_override() : Void
      if @@mb_end_bulk_theme_override.null?
        @@mb_end_bulk_theme_override = Bridge.get_method_bind("Control", "end_bulk_theme_override", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_end_bulk_theme_override, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_add_theme_icon_override : Void* = Pointer(Void).null
    def add_theme_icon_override(name : String, texture : Texture2D) : Void
      if @@mb_add_theme_icon_override.null?
        @@mb_add_theme_icon_override = Bridge.get_method_bind("Control", "add_theme_icon_override", 1373065600_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = texture
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_theme_icon_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_theme_stylebox_override : Void* = Pointer(Void).null
    def add_theme_stylebox_override(name : String, stylebox : StyleBox) : Void
      if @@mb_add_theme_stylebox_override.null?
        @@mb_add_theme_stylebox_override = Bridge.get_method_bind("Control", "add_theme_stylebox_override", 4188838905_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = stylebox
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_theme_stylebox_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_theme_font_override : Void* = Pointer(Void).null
    def add_theme_font_override(name : String, font : Font) : Void
      if @@mb_add_theme_font_override.null?
        @@mb_add_theme_font_override = Bridge.get_method_bind("Control", "add_theme_font_override", 3518018674_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = font
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_theme_font_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_theme_font_size_override : Void* = Pointer(Void).null
    def add_theme_font_size_override(name : String, font_size : Int64) : Void
      if @@mb_add_theme_font_size_override.null?
        @@mb_add_theme_font_size_override = Bridge.get_method_bind("Control", "add_theme_font_size_override", 2415702435_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = font_size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_theme_font_size_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_theme_color_override : Void* = Pointer(Void).null
    def add_theme_color_override(name : String, color : Color) : Void
      if @@mb_add_theme_color_override.null?
        @@mb_add_theme_color_override = Bridge.get_method_bind("Control", "add_theme_color_override", 4260178595_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_theme_color_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_theme_constant_override : Void* = Pointer(Void).null
    def add_theme_constant_override(name : String, constant : Int64) : Void
      if @@mb_add_theme_constant_override.null?
        @@mb_add_theme_constant_override = Bridge.get_method_bind("Control", "add_theme_constant_override", 2415702435_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = constant
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_theme_constant_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_theme_icon_override : Void* = Pointer(Void).null
    def remove_theme_icon_override(name : String) : Void
      if @@mb_remove_theme_icon_override.null?
        @@mb_remove_theme_icon_override = Bridge.get_method_bind("Control", "remove_theme_icon_override", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_theme_icon_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_theme_stylebox_override : Void* = Pointer(Void).null
    def remove_theme_stylebox_override(name : String) : Void
      if @@mb_remove_theme_stylebox_override.null?
        @@mb_remove_theme_stylebox_override = Bridge.get_method_bind("Control", "remove_theme_stylebox_override", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_theme_stylebox_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_theme_font_override : Void* = Pointer(Void).null
    def remove_theme_font_override(name : String) : Void
      if @@mb_remove_theme_font_override.null?
        @@mb_remove_theme_font_override = Bridge.get_method_bind("Control", "remove_theme_font_override", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_theme_font_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_theme_font_size_override : Void* = Pointer(Void).null
    def remove_theme_font_size_override(name : String) : Void
      if @@mb_remove_theme_font_size_override.null?
        @@mb_remove_theme_font_size_override = Bridge.get_method_bind("Control", "remove_theme_font_size_override", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_theme_font_size_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_theme_color_override : Void* = Pointer(Void).null
    def remove_theme_color_override(name : String) : Void
      if @@mb_remove_theme_color_override.null?
        @@mb_remove_theme_color_override = Bridge.get_method_bind("Control", "remove_theme_color_override", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_theme_color_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_theme_constant_override : Void* = Pointer(Void).null
    def remove_theme_constant_override(name : String) : Void
      if @@mb_remove_theme_constant_override.null?
        @@mb_remove_theme_constant_override = Bridge.get_method_bind("Control", "remove_theme_constant_override", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_theme_constant_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_theme_icon : Void* = Pointer(Void).null
    def get_theme_icon(name : String, theme_type : String) : Texture2D
      if @@mb_get_theme_icon.null?
        @@mb_get_theme_icon = Bridge.get_method_bind("Control", "get_theme_icon", 3163973443_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_theme_icon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_get_theme_stylebox : Void* = Pointer(Void).null
    def get_theme_stylebox(name : String, theme_type : String) : StyleBox
      if @@mb_get_theme_stylebox.null?
        @@mb_get_theme_stylebox = Bridge.get_method_bind("Control", "get_theme_stylebox", 604739069_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_theme_stylebox, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      StyleBox.new(ret_ptr)
    end
    @@mb_get_theme_font : Void* = Pointer(Void).null
    def get_theme_font(name : String, theme_type : String) : Font
      if @@mb_get_theme_font.null?
        @@mb_get_theme_font = Bridge.get_method_bind("Control", "get_theme_font", 2826986490_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_theme_font, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Font.new(ret_ptr)
    end
    @@mb_get_theme_font_size : Void* = Pointer(Void).null
    def get_theme_font_size(name : String, theme_type : String) : Int64
      if @@mb_get_theme_font_size.null?
        @@mb_get_theme_font_size = Bridge.get_method_bind("Control", "get_theme_font_size", 1327056374_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_theme_font_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_theme_color : Void* = Pointer(Void).null
    def get_theme_color(name : String, theme_type : String) : Color
      if @@mb_get_theme_color.null?
        @@mb_get_theme_color = Bridge.get_method_bind("Control", "get_theme_color", 2798751242_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Color.new
      Bridge.ptrcall(@@mb_get_theme_color, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_theme_constant : Void* = Pointer(Void).null
    def get_theme_constant(name : String, theme_type : String) : Int64
      if @@mb_get_theme_constant.null?
        @@mb_get_theme_constant = Bridge.get_method_bind("Control", "get_theme_constant", 1327056374_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_theme_constant, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_theme_icon_override : Void* = Pointer(Void).null
    def has_theme_icon_override(name : String) : Bool
      if @@mb_has_theme_icon_override.null?
        @@mb_has_theme_icon_override = Bridge.get_method_bind("Control", "has_theme_icon_override", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_icon_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_stylebox_override : Void* = Pointer(Void).null
    def has_theme_stylebox_override(name : String) : Bool
      if @@mb_has_theme_stylebox_override.null?
        @@mb_has_theme_stylebox_override = Bridge.get_method_bind("Control", "has_theme_stylebox_override", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_stylebox_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_font_override : Void* = Pointer(Void).null
    def has_theme_font_override(name : String) : Bool
      if @@mb_has_theme_font_override.null?
        @@mb_has_theme_font_override = Bridge.get_method_bind("Control", "has_theme_font_override", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_font_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_font_size_override : Void* = Pointer(Void).null
    def has_theme_font_size_override(name : String) : Bool
      if @@mb_has_theme_font_size_override.null?
        @@mb_has_theme_font_size_override = Bridge.get_method_bind("Control", "has_theme_font_size_override", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_font_size_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_color_override : Void* = Pointer(Void).null
    def has_theme_color_override(name : String) : Bool
      if @@mb_has_theme_color_override.null?
        @@mb_has_theme_color_override = Bridge.get_method_bind("Control", "has_theme_color_override", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_color_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_constant_override : Void* = Pointer(Void).null
    def has_theme_constant_override(name : String) : Bool
      if @@mb_has_theme_constant_override.null?
        @@mb_has_theme_constant_override = Bridge.get_method_bind("Control", "has_theme_constant_override", 2619796661_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_constant_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_icon : Void* = Pointer(Void).null
    def has_theme_icon(name : String, theme_type : String) : Bool
      if @@mb_has_theme_icon.null?
        @@mb_has_theme_icon = Bridge.get_method_bind("Control", "has_theme_icon", 866386512_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_icon, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_stylebox : Void* = Pointer(Void).null
    def has_theme_stylebox(name : String, theme_type : String) : Bool
      if @@mb_has_theme_stylebox.null?
        @@mb_has_theme_stylebox = Bridge.get_method_bind("Control", "has_theme_stylebox", 866386512_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_stylebox, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_font : Void* = Pointer(Void).null
    def has_theme_font(name : String, theme_type : String) : Bool
      if @@mb_has_theme_font.null?
        @@mb_has_theme_font = Bridge.get_method_bind("Control", "has_theme_font", 866386512_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_font, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_font_size : Void* = Pointer(Void).null
    def has_theme_font_size(name : String, theme_type : String) : Bool
      if @@mb_has_theme_font_size.null?
        @@mb_has_theme_font_size = Bridge.get_method_bind("Control", "has_theme_font_size", 866386512_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_font_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_color : Void* = Pointer(Void).null
    def has_theme_color(name : String, theme_type : String) : Bool
      if @@mb_has_theme_color.null?
        @@mb_has_theme_color = Bridge.get_method_bind("Control", "has_theme_color", 866386512_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_color, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_theme_constant : Void* = Pointer(Void).null
    def has_theme_constant(name : String, theme_type : String) : Bool
      if @@mb_has_theme_constant.null?
        @@mb_has_theme_constant = Bridge.get_method_bind("Control", "has_theme_constant", 866386512_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = theme_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_theme_constant, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_theme_default_base_scale : Void* = Pointer(Void).null
    def get_theme_default_base_scale() : Float64
      if @@mb_get_theme_default_base_scale.null?
        @@mb_get_theme_default_base_scale = Bridge.get_method_bind("Control", "get_theme_default_base_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_theme_default_base_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_theme_default_font : Void* = Pointer(Void).null
    def get_theme_default_font() : Font
      if @@mb_get_theme_default_font.null?
        @@mb_get_theme_default_font = Bridge.get_method_bind("Control", "get_theme_default_font", 3229501585_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_theme_default_font, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Font.new(ret_ptr)
    end
    @@mb_get_theme_default_font_size : Void* = Pointer(Void).null
    def get_theme_default_font_size() : Int64
      if @@mb_get_theme_default_font_size.null?
        @@mb_get_theme_default_font_size = Bridge.get_method_bind("Control", "get_theme_default_font_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_theme_default_font_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_parent_control : Void* = Pointer(Void).null
    def get_parent_control() : Control
      if @@mb_get_parent_control.null?
        @@mb_get_parent_control = Bridge.get_method_bind("Control", "get_parent_control", 2783021301_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_parent_control, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Control.new(ret_ptr)
    end
    @@mb_set_h_grow_direction : Void* = Pointer(Void).null
    def set_h_grow_direction(direction : Int64) : Void
      if @@mb_set_h_grow_direction.null?
        @@mb_set_h_grow_direction = Bridge.get_method_bind("Control", "set_h_grow_direction", 2022385301_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_h_grow_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_h_grow_direction : Void* = Pointer(Void).null
    def get_h_grow_direction() : Int64
      if @@mb_get_h_grow_direction.null?
        @@mb_get_h_grow_direction = Bridge.get_method_bind("Control", "get_h_grow_direction", 3635610155_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_h_grow_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_v_grow_direction : Void* = Pointer(Void).null
    def set_v_grow_direction(direction : Int64) : Void
      if @@mb_set_v_grow_direction.null?
        @@mb_set_v_grow_direction = Bridge.get_method_bind("Control", "set_v_grow_direction", 2022385301_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_grow_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_grow_direction : Void* = Pointer(Void).null
    def get_v_grow_direction() : Int64
      if @@mb_get_v_grow_direction.null?
        @@mb_get_v_grow_direction = Bridge.get_method_bind("Control", "get_v_grow_direction", 3635610155_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_v_grow_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tooltip_auto_translate_mode : Void* = Pointer(Void).null
    def set_tooltip_auto_translate_mode(mode : Int64) : Void
      if @@mb_set_tooltip_auto_translate_mode.null?
        @@mb_set_tooltip_auto_translate_mode = Bridge.get_method_bind("Control", "set_tooltip_auto_translate_mode", 776149714_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tooltip_auto_translate_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tooltip_auto_translate_mode : Void* = Pointer(Void).null
    def get_tooltip_auto_translate_mode() : Int64
      if @@mb_get_tooltip_auto_translate_mode.null?
        @@mb_get_tooltip_auto_translate_mode = Bridge.get_method_bind("Control", "get_tooltip_auto_translate_mode", 2498906432_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tooltip_auto_translate_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tooltip_text : Void* = Pointer(Void).null
    def set_tooltip_text(hint : String) : Void
      if @@mb_set_tooltip_text.null?
        @@mb_set_tooltip_text = Bridge.get_method_bind("Control", "set_tooltip_text", 83702148_i64)
      end
      val_0 = hint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tooltip_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tooltip_text : Void* = Pointer(Void).null
    def get_tooltip_text() : String
      if @@mb_get_tooltip_text.null?
        @@mb_get_tooltip_text = Bridge.get_method_bind("Control", "get_tooltip_text", 201670096_i64)
      end
      ""
    end
    @@mb_get_tooltip : Void* = Pointer(Void).null
    def get_tooltip(at_position : Vector2) : String
      if @@mb_get_tooltip.null?
        @@mb_get_tooltip = Bridge.get_method_bind("Control", "get_tooltip", 2895288280_i64)
      end
      val_0 = at_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_translation_context : Void* = Pointer(Void).null
    def set_translation_context(context : String) : Void
      if @@mb_set_translation_context.null?
        @@mb_set_translation_context = Bridge.get_method_bind("Control", "set_translation_context", 3304788590_i64)
      end
      val_0 = context
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_translation_context, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_translation_context : Void* = Pointer(Void).null
    def get_translation_context() : String
      if @@mb_get_translation_context.null?
        @@mb_get_translation_context = Bridge.get_method_bind("Control", "get_translation_context", 2002593661_i64)
      end
      ""
    end
    @@mb_set_default_cursor_shape : Void* = Pointer(Void).null
    def set_default_cursor_shape(shape : Int64) : Void
      if @@mb_set_default_cursor_shape.null?
        @@mb_set_default_cursor_shape = Bridge.get_method_bind("Control", "set_default_cursor_shape", 217062046_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_cursor_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_cursor_shape : Void* = Pointer(Void).null
    def get_default_cursor_shape() : Int64
      if @@mb_get_default_cursor_shape.null?
        @@mb_get_default_cursor_shape = Bridge.get_method_bind("Control", "get_default_cursor_shape", 2359535750_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_default_cursor_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_cursor_shape : Void* = Pointer(Void).null
    def get_cursor_shape(at_position : Vector2) : Int64
      if @@mb_get_cursor_shape.null?
        @@mb_get_cursor_shape = Bridge.get_method_bind("Control", "get_cursor_shape", 1395773853_i64)
      end
      val_0 = at_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_cursor_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_focus_neighbor : Void* = Pointer(Void).null
    def set_focus_neighbor(side : Int64, neighbor : NodePath) : Void
      if @@mb_set_focus_neighbor.null?
        @@mb_set_focus_neighbor = Bridge.get_method_bind("Control", "set_focus_neighbor", 2024461774_i64)
      end
      val_0 = side
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = neighbor
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_focus_neighbor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_focus_neighbor : Void* = Pointer(Void).null
    def get_focus_neighbor(side : Int64) : NodePath
      if @@mb_get_focus_neighbor.null?
        @@mb_get_focus_neighbor = Bridge.get_method_bind("Control", "get_focus_neighbor", 2757935761_i64)
      end
      val_0 = side
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_focus_neighbor, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_focus_next : Void* = Pointer(Void).null
    def set_focus_next(next_val : NodePath) : Void
      if @@mb_set_focus_next.null?
        @@mb_set_focus_next = Bridge.get_method_bind("Control", "set_focus_next", 1348162250_i64)
      end
      val_0 = next_val
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_focus_next, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_focus_next : Void* = Pointer(Void).null
    def get_focus_next() : NodePath
      if @@mb_get_focus_next.null?
        @@mb_get_focus_next = Bridge.get_method_bind("Control", "get_focus_next", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_focus_next, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_focus_previous : Void* = Pointer(Void).null
    def set_focus_previous(previous : NodePath) : Void
      if @@mb_set_focus_previous.null?
        @@mb_set_focus_previous = Bridge.get_method_bind("Control", "set_focus_previous", 1348162250_i64)
      end
      val_0 = previous
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_focus_previous, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_focus_previous : Void* = Pointer(Void).null
    def get_focus_previous() : NodePath
      if @@mb_get_focus_previous.null?
        @@mb_get_focus_previous = Bridge.get_method_bind("Control", "get_focus_previous", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_focus_previous, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_force_drag : Void* = Pointer(Void).null
    def force_drag(data : Void*, preview : Control) : Void
      if @@mb_force_drag.null?
        @@mb_force_drag = Bridge.get_method_bind("Control", "force_drag", 3191844692_i64)
      end
      val_0 = data
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = preview
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_force_drag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_drag : Void* = Pointer(Void).null
    def accessibility_drag() : Void
      if @@mb_accessibility_drag.null?
        @@mb_accessibility_drag = Bridge.get_method_bind("Control", "accessibility_drag", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_accessibility_drag, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_accessibility_drop : Void* = Pointer(Void).null
    def accessibility_drop() : Void
      if @@mb_accessibility_drop.null?
        @@mb_accessibility_drop = Bridge.get_method_bind("Control", "accessibility_drop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_accessibility_drop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_accessibility_name : Void* = Pointer(Void).null
    def set_accessibility_name(name : String) : Void
      if @@mb_set_accessibility_name.null?
        @@mb_set_accessibility_name = Bridge.get_method_bind("Control", "set_accessibility_name", 83702148_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_accessibility_name : Void* = Pointer(Void).null
    def get_accessibility_name() : String
      if @@mb_get_accessibility_name.null?
        @@mb_get_accessibility_name = Bridge.get_method_bind("Control", "get_accessibility_name", 201670096_i64)
      end
      ""
    end
    @@mb_set_accessibility_description : Void* = Pointer(Void).null
    def set_accessibility_description(description : String) : Void
      if @@mb_set_accessibility_description.null?
        @@mb_set_accessibility_description = Bridge.get_method_bind("Control", "set_accessibility_description", 83702148_i64)
      end
      val_0 = description
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_accessibility_description : Void* = Pointer(Void).null
    def get_accessibility_description() : String
      if @@mb_get_accessibility_description.null?
        @@mb_get_accessibility_description = Bridge.get_method_bind("Control", "get_accessibility_description", 201670096_i64)
      end
      ""
    end
    @@mb_set_accessibility_live : Void* = Pointer(Void).null
    def set_accessibility_live(mode : Int64) : Void
      if @@mb_set_accessibility_live.null?
        @@mb_set_accessibility_live = Bridge.get_method_bind("Control", "set_accessibility_live", 353443434_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_live, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_accessibility_live : Void* = Pointer(Void).null
    def get_accessibility_live() : Int64
      if @@mb_get_accessibility_live.null?
        @@mb_get_accessibility_live = Bridge.get_method_bind("Control", "get_accessibility_live", 2858591811_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_accessibility_live, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_accessibility_controls_nodes : Void* = Pointer(Void).null
    def set_accessibility_controls_nodes(node_path : Godot::Array) : Void
      if @@mb_set_accessibility_controls_nodes.null?
        @@mb_set_accessibility_controls_nodes = Bridge.get_method_bind("Control", "set_accessibility_controls_nodes", 381264803_i64)
      end
      arg_ptr_0 = node_path ? node_path.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_controls_nodes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_accessibility_controls_nodes : Void* = Pointer(Void).null
    def get_accessibility_controls_nodes() : Godot::Array
      if @@mb_get_accessibility_controls_nodes.null?
        @@mb_get_accessibility_controls_nodes = Bridge.get_method_bind("Control", "get_accessibility_controls_nodes", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_accessibility_controls_nodes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_accessibility_described_by_nodes : Void* = Pointer(Void).null
    def set_accessibility_described_by_nodes(node_path : Godot::Array) : Void
      if @@mb_set_accessibility_described_by_nodes.null?
        @@mb_set_accessibility_described_by_nodes = Bridge.get_method_bind("Control", "set_accessibility_described_by_nodes", 381264803_i64)
      end
      arg_ptr_0 = node_path ? node_path.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_described_by_nodes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_accessibility_described_by_nodes : Void* = Pointer(Void).null
    def get_accessibility_described_by_nodes() : Godot::Array
      if @@mb_get_accessibility_described_by_nodes.null?
        @@mb_get_accessibility_described_by_nodes = Bridge.get_method_bind("Control", "get_accessibility_described_by_nodes", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_accessibility_described_by_nodes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_accessibility_labeled_by_nodes : Void* = Pointer(Void).null
    def set_accessibility_labeled_by_nodes(node_path : Godot::Array) : Void
      if @@mb_set_accessibility_labeled_by_nodes.null?
        @@mb_set_accessibility_labeled_by_nodes = Bridge.get_method_bind("Control", "set_accessibility_labeled_by_nodes", 381264803_i64)
      end
      arg_ptr_0 = node_path ? node_path.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_labeled_by_nodes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_accessibility_labeled_by_nodes : Void* = Pointer(Void).null
    def get_accessibility_labeled_by_nodes() : Godot::Array
      if @@mb_get_accessibility_labeled_by_nodes.null?
        @@mb_get_accessibility_labeled_by_nodes = Bridge.get_method_bind("Control", "get_accessibility_labeled_by_nodes", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_accessibility_labeled_by_nodes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_accessibility_flow_to_nodes : Void* = Pointer(Void).null
    def set_accessibility_flow_to_nodes(node_path : Godot::Array) : Void
      if @@mb_set_accessibility_flow_to_nodes.null?
        @@mb_set_accessibility_flow_to_nodes = Bridge.get_method_bind("Control", "set_accessibility_flow_to_nodes", 381264803_i64)
      end
      arg_ptr_0 = node_path ? node_path.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_flow_to_nodes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_accessibility_flow_to_nodes : Void* = Pointer(Void).null
    def get_accessibility_flow_to_nodes() : Godot::Array
      if @@mb_get_accessibility_flow_to_nodes.null?
        @@mb_get_accessibility_flow_to_nodes = Bridge.get_method_bind("Control", "get_accessibility_flow_to_nodes", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_accessibility_flow_to_nodes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_mouse_filter : Void* = Pointer(Void).null
    def set_mouse_filter(filter : Int64) : Void
      if @@mb_set_mouse_filter.null?
        @@mb_set_mouse_filter = Bridge.get_method_bind("Control", "set_mouse_filter", 3891156122_i64)
      end
      val_0 = filter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mouse_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mouse_filter : Void* = Pointer(Void).null
    def get_mouse_filter() : Int64
      if @@mb_get_mouse_filter.null?
        @@mb_get_mouse_filter = Bridge.get_method_bind("Control", "get_mouse_filter", 1572545674_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_mouse_filter, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_mouse_filter_with_override : Void* = Pointer(Void).null
    def get_mouse_filter_with_override() : Int64
      if @@mb_get_mouse_filter_with_override.null?
        @@mb_get_mouse_filter_with_override = Bridge.get_method_bind("Control", "get_mouse_filter_with_override", 1572545674_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_mouse_filter_with_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_mouse_behavior_recursive : Void* = Pointer(Void).null
    def set_mouse_behavior_recursive(mouse_behavior_recursive : Int64) : Void
      if @@mb_set_mouse_behavior_recursive.null?
        @@mb_set_mouse_behavior_recursive = Bridge.get_method_bind("Control", "set_mouse_behavior_recursive", 849284636_i64)
      end
      val_0 = mouse_behavior_recursive
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mouse_behavior_recursive, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mouse_behavior_recursive : Void* = Pointer(Void).null
    def get_mouse_behavior_recursive() : Int64
      if @@mb_get_mouse_behavior_recursive.null?
        @@mb_get_mouse_behavior_recursive = Bridge.get_method_bind("Control", "get_mouse_behavior_recursive", 3779367402_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_mouse_behavior_recursive, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_force_pass_scroll_events : Void* = Pointer(Void).null
    def set_force_pass_scroll_events(force_pass_scroll_events : Bool) : Void
      if @@mb_set_force_pass_scroll_events.null?
        @@mb_set_force_pass_scroll_events = Bridge.get_method_bind("Control", "set_force_pass_scroll_events", 2586408642_i64)
      end
      val_0 = force_pass_scroll_events
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_force_pass_scroll_events, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_force_pass_scroll_events : Void* = Pointer(Void).null
    def is_force_pass_scroll_events() : Bool
      if @@mb_is_force_pass_scroll_events.null?
        @@mb_is_force_pass_scroll_events = Bridge.get_method_bind("Control", "is_force_pass_scroll_events", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_force_pass_scroll_events, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_clip_contents : Void* = Pointer(Void).null
    def set_clip_contents(enable : Bool) : Void
      if @@mb_set_clip_contents.null?
        @@mb_set_clip_contents = Bridge.get_method_bind("Control", "set_clip_contents", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_clip_contents, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_clipping_contents : Void* = Pointer(Void).null
    def is_clipping_contents() : Bool
      if @@mb_is_clipping_contents.null?
        @@mb_is_clipping_contents = Bridge.get_method_bind("Control", "is_clipping_contents", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_clipping_contents, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_grab_click_focus : Void* = Pointer(Void).null
    def grab_click_focus() : Void
      if @@mb_grab_click_focus.null?
        @@mb_grab_click_focus = Bridge.get_method_bind("Control", "grab_click_focus", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_grab_click_focus, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_drag_forwarding : Void* = Pointer(Void).null
    def set_drag_forwarding(drag_func : Void*, can_drop_func : Void*, drop_func : Void*) : Void
      if @@mb_set_drag_forwarding.null?
        @@mb_set_drag_forwarding = Bridge.get_method_bind("Control", "set_drag_forwarding", 1076571380_i64)
      end
      val_0 = drag_func
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = can_drop_func
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = drop_func
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_drag_forwarding, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_drag_preview : Void* = Pointer(Void).null
    def set_drag_preview(control : Control) : Void
      if @@mb_set_drag_preview.null?
        @@mb_set_drag_preview = Bridge.get_method_bind("Control", "set_drag_preview", 1496901182_i64)
      end
      val_0 = control
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_preview, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drag_successful : Void* = Pointer(Void).null
    def is_drag_successful() : Bool
      if @@mb_is_drag_successful.null?
        @@mb_is_drag_successful = Bridge.get_method_bind("Control", "is_drag_successful", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drag_successful, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_warp_mouse : Void* = Pointer(Void).null
    def warp_mouse(position : Vector2) : Void
      if @@mb_warp_mouse.null?
        @@mb_warp_mouse = Bridge.get_method_bind("Control", "warp_mouse", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_warp_mouse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_shortcut_context : Void* = Pointer(Void).null
    def set_shortcut_context(node : Node) : Void
      if @@mb_set_shortcut_context.null?
        @@mb_set_shortcut_context = Bridge.get_method_bind("Control", "set_shortcut_context", 1078189570_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shortcut_context, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shortcut_context : Void* = Pointer(Void).null
    def get_shortcut_context() : Node
      if @@mb_get_shortcut_context.null?
        @@mb_get_shortcut_context = Bridge.get_method_bind("Control", "get_shortcut_context", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_shortcut_context, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_update_maximum_size : Void* = Pointer(Void).null
    def update_maximum_size() : Void
      if @@mb_update_maximum_size.null?
        @@mb_update_maximum_size = Bridge.get_method_bind("Control", "update_maximum_size", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_update_maximum_size, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_update_minimum_size : Void* = Pointer(Void).null
    def update_minimum_size() : Void
      if @@mb_update_minimum_size.null?
        @@mb_update_minimum_size = Bridge.get_method_bind("Control", "update_minimum_size", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_update_minimum_size, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_layout_direction : Void* = Pointer(Void).null
    def set_layout_direction(direction : Int64) : Void
      if @@mb_set_layout_direction.null?
        @@mb_set_layout_direction = Bridge.get_method_bind("Control", "set_layout_direction", 3310692370_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_layout_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_layout_direction : Void* = Pointer(Void).null
    def get_layout_direction() : Int64
      if @@mb_get_layout_direction.null?
        @@mb_get_layout_direction = Bridge.get_method_bind("Control", "get_layout_direction", 1546772008_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_layout_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_layout_rtl : Void* = Pointer(Void).null
    def is_layout_rtl() : Bool
      if @@mb_is_layout_rtl.null?
        @@mb_is_layout_rtl = Bridge.get_method_bind("Control", "is_layout_rtl", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_layout_rtl, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_auto_translate : Void* = Pointer(Void).null
    def set_auto_translate(enable : Bool) : Void
      if @@mb_set_auto_translate.null?
        @@mb_set_auto_translate = Bridge.get_method_bind("Control", "set_auto_translate", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_translate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_auto_translating : Void* = Pointer(Void).null
    def is_auto_translating() : Bool
      if @@mb_is_auto_translating.null?
        @@mb_is_auto_translating = Bridge.get_method_bind("Control", "is_auto_translating", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_auto_translating, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_localize_numeral_system : Void* = Pointer(Void).null
    def set_localize_numeral_system(enable : Bool) : Void
      if @@mb_set_localize_numeral_system.null?
        @@mb_set_localize_numeral_system = Bridge.get_method_bind("Control", "set_localize_numeral_system", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_localize_numeral_system, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_localizing_numeral_system : Void* = Pointer(Void).null
    def is_localizing_numeral_system() : Bool
      if @@mb_is_localizing_numeral_system.null?
        @@mb_is_localizing_numeral_system = Bridge.get_method_bind("Control", "is_localizing_numeral_system", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_localizing_numeral_system, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class Container < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_queue_sort : Void* = Pointer(Void).null
    def queue_sort() : Void
      if @@mb_queue_sort.null?
        @@mb_queue_sort = Bridge.get_method_bind("Container", "queue_sort", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_queue_sort, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_fit_child_in_rect : Void* = Pointer(Void).null
    def fit_child_in_rect(child : Control, rect : Rect2) : Void
      if @@mb_fit_child_in_rect.null?
        @@mb_fit_child_in_rect = Bridge.get_method_bind("Container", "fit_child_in_rect", 1993438598_i64)
      end
      val_0 = child
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_fit_child_in_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_accessibility_region : Void* = Pointer(Void).null
    def set_accessibility_region(region : Bool) : Void
      if @@mb_set_accessibility_region.null?
        @@mb_set_accessibility_region = Bridge.get_method_bind("Container", "set_accessibility_region", 2586408642_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_accessibility_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_accessibility_region : Void* = Pointer(Void).null
    def is_accessibility_region() : Bool
      if @@mb_is_accessibility_region.null?
        @@mb_is_accessibility_region = Bridge.get_method_bind("Container", "is_accessibility_region", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_accessibility_region, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class BaseButton < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum DrawMode : Int64
      DrawNormal = 0_i64
      DrawPressed = 1_i64
      DrawHover = 2_i64
      DrawDisabled = 3_i64
      DrawHoverPressed = 4_i64
    end
    enum ActionMode : Int64
      ActionModeButtonPress = 0_i64
      ActionModeButtonRelease = 1_i64
    end
    @@mb_press : Void* = Pointer(Void).null
    def press() : Void
      if @@mb_press.null?
        @@mb_press = Bridge.get_method_bind("BaseButton", "press", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_press, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_pressed : Void* = Pointer(Void).null
    def set_pressed(pressed : Bool) : Void
      if @@mb_set_pressed.null?
        @@mb_set_pressed = Bridge.get_method_bind("BaseButton", "set_pressed", 2586408642_i64)
      end
      val_0 = pressed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pressed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_pressed_no_signal : Void* = Pointer(Void).null
    def set_pressed_no_signal(pressed : Bool) : Void
      if @@mb_set_pressed_no_signal.null?
        @@mb_set_pressed_no_signal = Bridge.get_method_bind("BaseButton", "set_pressed_no_signal", 2586408642_i64)
      end
      val_0 = pressed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pressed_no_signal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_pressed : Void* = Pointer(Void).null
    def is_pressed() : Bool
      if @@mb_is_pressed.null?
        @@mb_is_pressed = Bridge.get_method_bind("BaseButton", "is_pressed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_pressed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_hovered : Void* = Pointer(Void).null
    def is_hovered() : Bool
      if @@mb_is_hovered.null?
        @@mb_is_hovered = Bridge.get_method_bind("BaseButton", "is_hovered", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_hovered, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_toggle_mode : Void* = Pointer(Void).null
    def set_toggle_mode(enabled : Bool) : Void
      if @@mb_set_toggle_mode.null?
        @@mb_set_toggle_mode = Bridge.get_method_bind("BaseButton", "set_toggle_mode", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_toggle_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_toggle_mode : Void* = Pointer(Void).null
    def is_toggle_mode() : Bool
      if @@mb_is_toggle_mode.null?
        @@mb_is_toggle_mode = Bridge.get_method_bind("BaseButton", "is_toggle_mode", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_toggle_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shortcut_in_tooltip : Void* = Pointer(Void).null
    def set_shortcut_in_tooltip(enabled : Bool) : Void
      if @@mb_set_shortcut_in_tooltip.null?
        @@mb_set_shortcut_in_tooltip = Bridge.get_method_bind("BaseButton", "set_shortcut_in_tooltip", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shortcut_in_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shortcut_in_tooltip_enabled : Void* = Pointer(Void).null
    def is_shortcut_in_tooltip_enabled() : Bool
      if @@mb_is_shortcut_in_tooltip_enabled.null?
        @@mb_is_shortcut_in_tooltip_enabled = Bridge.get_method_bind("BaseButton", "is_shortcut_in_tooltip_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shortcut_in_tooltip_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_disabled : Void* = Pointer(Void).null
    def set_disabled(disabled : Bool) : Void
      if @@mb_set_disabled.null?
        @@mb_set_disabled = Bridge.get_method_bind("BaseButton", "set_disabled", 2586408642_i64)
      end
      val_0 = disabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_disabled : Void* = Pointer(Void).null
    def is_disabled() : Bool
      if @@mb_is_disabled.null?
        @@mb_is_disabled = Bridge.get_method_bind("BaseButton", "is_disabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_disabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_action_mode : Void* = Pointer(Void).null
    def set_action_mode(mode : Int64) : Void
      if @@mb_set_action_mode.null?
        @@mb_set_action_mode = Bridge.get_method_bind("BaseButton", "set_action_mode", 1985162088_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_action_mode : Void* = Pointer(Void).null
    def get_action_mode() : Int64
      if @@mb_get_action_mode.null?
        @@mb_get_action_mode = Bridge.get_method_bind("BaseButton", "get_action_mode", 2589712189_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_action_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_button_mask : Void* = Pointer(Void).null
    def set_button_mask(mask : Int64) : Void
      if @@mb_set_button_mask.null?
        @@mb_set_button_mask = Bridge.get_method_bind("BaseButton", "set_button_mask", 3950145251_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_button_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_button_mask : Void* = Pointer(Void).null
    def get_button_mask() : Int64
      if @@mb_get_button_mask.null?
        @@mb_get_button_mask = Bridge.get_method_bind("BaseButton", "get_button_mask", 2512161324_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_button_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_draw_mode : Void* = Pointer(Void).null
    def get_draw_mode() : Int64
      if @@mb_get_draw_mode.null?
        @@mb_get_draw_mode = Bridge.get_method_bind("BaseButton", "get_draw_mode", 2492721305_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_draw_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_keep_pressed_outside : Void* = Pointer(Void).null
    def set_keep_pressed_outside(enabled : Bool) : Void
      if @@mb_set_keep_pressed_outside.null?
        @@mb_set_keep_pressed_outside = Bridge.get_method_bind("BaseButton", "set_keep_pressed_outside", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_keep_pressed_outside, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_keep_pressed_outside : Void* = Pointer(Void).null
    def is_keep_pressed_outside() : Bool
      if @@mb_is_keep_pressed_outside.null?
        @@mb_is_keep_pressed_outside = Bridge.get_method_bind("BaseButton", "is_keep_pressed_outside", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_keep_pressed_outside, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shortcut_feedback : Void* = Pointer(Void).null
    def set_shortcut_feedback(enabled : Bool) : Void
      if @@mb_set_shortcut_feedback.null?
        @@mb_set_shortcut_feedback = Bridge.get_method_bind("BaseButton", "set_shortcut_feedback", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shortcut_feedback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shortcut_feedback : Void* = Pointer(Void).null
    def is_shortcut_feedback() : Bool
      if @@mb_is_shortcut_feedback.null?
        @@mb_is_shortcut_feedback = Bridge.get_method_bind("BaseButton", "is_shortcut_feedback", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shortcut_feedback, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shortcut : Void* = Pointer(Void).null
    def set_shortcut(shortcut : Shortcut) : Void
      if @@mb_set_shortcut.null?
        @@mb_set_shortcut = Bridge.get_method_bind("BaseButton", "set_shortcut", 857163497_i64)
      end
      val_0 = shortcut
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shortcut, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shortcut : Void* = Pointer(Void).null
    def get_shortcut() : Shortcut
      if @@mb_get_shortcut.null?
        @@mb_get_shortcut = Bridge.get_method_bind("BaseButton", "get_shortcut", 3415666916_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_shortcut, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Shortcut.new(ret_ptr)
    end
    @@mb_set_button_group : Void* = Pointer(Void).null
    def set_button_group(button_group : ButtonGroup) : Void
      if @@mb_set_button_group.null?
        @@mb_set_button_group = Bridge.get_method_bind("BaseButton", "set_button_group", 1794463739_i64)
      end
      val_0 = button_group
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_button_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_button_group : Void* = Pointer(Void).null
    def get_button_group() : ButtonGroup
      if @@mb_get_button_group.null?
        @@mb_get_button_group = Bridge.get_method_bind("BaseButton", "get_button_group", 281644053_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_button_group, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ButtonGroup.new(ret_ptr)
    end
  end
  class BoxContainer < Godot::Container
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum AlignmentMode : Int64
      AlignmentBegin = 0_i64
      AlignmentCenter = 1_i64
      AlignmentEnd = 2_i64
    end
    @@mb_add_spacer : Void* = Pointer(Void).null
    def add_spacer(begin_val : Bool) : Control
      if @@mb_add_spacer.null?
        @@mb_add_spacer = Bridge.get_method_bind("BoxContainer", "add_spacer", 1326660695_i64)
      end
      val_0 = begin_val
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_add_spacer, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Control.new(ret_ptr)
    end
    @@mb_set_alignment : Void* = Pointer(Void).null
    def set_alignment(alignment : Int64) : Void
      if @@mb_set_alignment.null?
        @@mb_set_alignment = Bridge.get_method_bind("BoxContainer", "set_alignment", 2456745134_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_alignment : Void* = Pointer(Void).null
    def get_alignment() : Int64
      if @@mb_get_alignment.null?
        @@mb_get_alignment = Bridge.get_method_bind("BoxContainer", "get_alignment", 1915476527_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vertical : Void* = Pointer(Void).null
    def set_vertical(vertical : Bool) : Void
      if @@mb_set_vertical.null?
        @@mb_set_vertical = Bridge.get_method_bind("BoxContainer", "set_vertical", 2586408642_i64)
      end
      val_0 = vertical
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertical, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_vertical : Void* = Pointer(Void).null
    def is_vertical() : Bool
      if @@mb_is_vertical.null?
        @@mb_is_vertical = Bridge.get_method_bind("BoxContainer", "is_vertical", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_vertical, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_reverse_sort : Void* = Pointer(Void).null
    def set_reverse_sort(reverse_sort : Bool) : Void
      if @@mb_set_reverse_sort.null?
        @@mb_set_reverse_sort = Bridge.get_method_bind("BoxContainer", "set_reverse_sort", 2586408642_i64)
      end
      val_0 = reverse_sort
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_reverse_sort, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_reverse_sort : Void* = Pointer(Void).null
    def is_reverse_sort() : Bool
      if @@mb_is_reverse_sort.null?
        @@mb_is_reverse_sort = Bridge.get_method_bind("BoxContainer", "is_reverse_sort", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_reverse_sort, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class Button < Godot::BaseButton
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_text : Void* = Pointer(Void).null
    def set_text(text : String) : Void
      if @@mb_set_text.null?
        @@mb_set_text = Bridge.get_method_bind("Button", "set_text", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text : Void* = Pointer(Void).null
    def get_text() : String
      if @@mb_get_text.null?
        @@mb_get_text = Bridge.get_method_bind("Button", "get_text", 201670096_i64)
      end
      ""
    end
    @@mb_set_text_overrun_behavior : Void* = Pointer(Void).null
    def set_text_overrun_behavior(overrun_behavior : Int64) : Void
      if @@mb_set_text_overrun_behavior.null?
        @@mb_set_text_overrun_behavior = Bridge.get_method_bind("Button", "set_text_overrun_behavior", 1008890932_i64)
      end
      val_0 = overrun_behavior
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_overrun_behavior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_overrun_behavior : Void* = Pointer(Void).null
    def get_text_overrun_behavior() : Int64
      if @@mb_get_text_overrun_behavior.null?
        @@mb_get_text_overrun_behavior = Bridge.get_method_bind("Button", "get_text_overrun_behavior", 3779142101_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_overrun_behavior, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autowrap_mode : Void* = Pointer(Void).null
    def set_autowrap_mode(autowrap_mode : Int64) : Void
      if @@mb_set_autowrap_mode.null?
        @@mb_set_autowrap_mode = Bridge.get_method_bind("Button", "set_autowrap_mode", 3289138044_i64)
      end
      val_0 = autowrap_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autowrap_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autowrap_mode : Void* = Pointer(Void).null
    def get_autowrap_mode() : Int64
      if @@mb_get_autowrap_mode.null?
        @@mb_get_autowrap_mode = Bridge.get_method_bind("Button", "get_autowrap_mode", 1549071663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_autowrap_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autowrap_trim_flags : Void* = Pointer(Void).null
    def set_autowrap_trim_flags(autowrap_trim_flags : Int64) : Void
      if @@mb_set_autowrap_trim_flags.null?
        @@mb_set_autowrap_trim_flags = Bridge.get_method_bind("Button", "set_autowrap_trim_flags", 2809697122_i64)
      end
      val_0 = autowrap_trim_flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autowrap_trim_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autowrap_trim_flags : Void* = Pointer(Void).null
    def get_autowrap_trim_flags() : Int64
      if @@mb_get_autowrap_trim_flags.null?
        @@mb_get_autowrap_trim_flags = Bridge.get_method_bind("Button", "get_autowrap_trim_flags", 2340632602_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_autowrap_trim_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_text_direction : Void* = Pointer(Void).null
    def set_text_direction(direction : Int64) : Void
      if @@mb_set_text_direction.null?
        @@mb_set_text_direction = Bridge.get_method_bind("Button", "set_text_direction", 119160795_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_direction : Void* = Pointer(Void).null
    def get_text_direction() : Int64
      if @@mb_get_text_direction.null?
        @@mb_get_text_direction = Bridge.get_method_bind("Button", "get_text_direction", 797257663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_language : Void* = Pointer(Void).null
    def set_language(language : String) : Void
      if @@mb_set_language.null?
        @@mb_set_language = Bridge.get_method_bind("Button", "set_language", 83702148_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_language : Void* = Pointer(Void).null
    def get_language() : String
      if @@mb_get_language.null?
        @@mb_get_language = Bridge.get_method_bind("Button", "get_language", 201670096_i64)
      end
      ""
    end
    @@mb_set_button_icon : Void* = Pointer(Void).null
    def set_button_icon(texture : Texture2D) : Void
      if @@mb_set_button_icon.null?
        @@mb_set_button_icon = Bridge.get_method_bind("Button", "set_button_icon", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_button_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_button_icon : Void* = Pointer(Void).null
    def get_button_icon() : Texture2D
      if @@mb_get_button_icon.null?
        @@mb_get_button_icon = Bridge.get_method_bind("Button", "get_button_icon", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_button_icon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_flat : Void* = Pointer(Void).null
    def set_flat(enabled : Bool) : Void
      if @@mb_set_flat.null?
        @@mb_set_flat = Bridge.get_method_bind("Button", "set_flat", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flat : Void* = Pointer(Void).null
    def is_flat() : Bool
      if @@mb_is_flat.null?
        @@mb_is_flat = Bridge.get_method_bind("Button", "is_flat", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flat, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_clip_text : Void* = Pointer(Void).null
    def set_clip_text(enabled : Bool) : Void
      if @@mb_set_clip_text.null?
        @@mb_set_clip_text = Bridge.get_method_bind("Button", "set_clip_text", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_clip_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_clip_text : Void* = Pointer(Void).null
    def get_clip_text() : Bool
      if @@mb_get_clip_text.null?
        @@mb_get_clip_text = Bridge.get_method_bind("Button", "get_clip_text", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_clip_text, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_text_alignment : Void* = Pointer(Void).null
    def set_text_alignment(alignment : Int64) : Void
      if @@mb_set_text_alignment.null?
        @@mb_set_text_alignment = Bridge.get_method_bind("Button", "set_text_alignment", 2312603777_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_alignment : Void* = Pointer(Void).null
    def get_text_alignment() : Int64
      if @@mb_get_text_alignment.null?
        @@mb_get_text_alignment = Bridge.get_method_bind("Button", "get_text_alignment", 341400642_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_icon_alignment : Void* = Pointer(Void).null
    def set_icon_alignment(icon_alignment : Int64) : Void
      if @@mb_set_icon_alignment.null?
        @@mb_set_icon_alignment = Bridge.get_method_bind("Button", "set_icon_alignment", 2312603777_i64)
      end
      val_0 = icon_alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_icon_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_icon_alignment : Void* = Pointer(Void).null
    def get_icon_alignment() : Int64
      if @@mb_get_icon_alignment.null?
        @@mb_get_icon_alignment = Bridge.get_method_bind("Button", "get_icon_alignment", 341400642_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_icon_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vertical_icon_alignment : Void* = Pointer(Void).null
    def set_vertical_icon_alignment(vertical_icon_alignment : Int64) : Void
      if @@mb_set_vertical_icon_alignment.null?
        @@mb_set_vertical_icon_alignment = Bridge.get_method_bind("Button", "set_vertical_icon_alignment", 1796458609_i64)
      end
      val_0 = vertical_icon_alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertical_icon_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vertical_icon_alignment : Void* = Pointer(Void).null
    def get_vertical_icon_alignment() : Int64
      if @@mb_get_vertical_icon_alignment.null?
        @@mb_get_vertical_icon_alignment = Bridge.get_method_bind("Button", "get_vertical_icon_alignment", 3274884059_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_vertical_icon_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_expand_icon : Void* = Pointer(Void).null
    def set_expand_icon(enabled : Bool) : Void
      if @@mb_set_expand_icon.null?
        @@mb_set_expand_icon = Bridge.get_method_bind("Button", "set_expand_icon", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_expand_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_expand_icon : Void* = Pointer(Void).null
    def is_expand_icon() : Bool
      if @@mb_is_expand_icon.null?
        @@mb_is_expand_icon = Bridge.get_method_bind("Button", "is_expand_icon", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_expand_icon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class TextEdit < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum MenuItems : Int64
      MenuCut = 0_i64
      MenuCopy = 1_i64
      MenuPaste = 2_i64
      MenuClear = 3_i64
      MenuSelectAll = 4_i64
      MenuUndo = 5_i64
      MenuRedo = 6_i64
      MenuSubmenuTextDir = 7_i64
      MenuDirInherited = 8_i64
      MenuDirAuto = 9_i64
      MenuDirLtr = 10_i64
      MenuDirRtl = 11_i64
      MenuDisplayUcc = 12_i64
      MenuSubmenuInsertUcc = 13_i64
      MenuInsertLrm = 14_i64
      MenuInsertRlm = 15_i64
      MenuInsertLre = 16_i64
      MenuInsertRle = 17_i64
      MenuInsertLro = 18_i64
      MenuInsertRlo = 19_i64
      MenuInsertPdf = 20_i64
      MenuInsertAlm = 21_i64
      MenuInsertLri = 22_i64
      MenuInsertRli = 23_i64
      MenuInsertFsi = 24_i64
      MenuInsertPdi = 25_i64
      MenuInsertZwj = 26_i64
      MenuInsertZwnj = 27_i64
      MenuInsertWj = 28_i64
      MenuInsertShy = 29_i64
      MenuEmojiAndSymbol = 30_i64
      MenuMax = 31_i64
    end
    enum EditAction : Int64
      ActionNone = 0_i64
      ActionTyping = 1_i64
      ActionBackspace = 2_i64
      ActionDelete = 3_i64
    end
    enum SearchFlags : Int64
      SearchMatchCase = 1_i64
      SearchWholeWords = 2_i64
      SearchBackwards = 4_i64
    end
    enum CaretType : Int64
      CaretTypeLine = 0_i64
      CaretTypeBlock = 1_i64
    end
    enum SelectionMode : Int64
      SelectionModeNone = 0_i64
      SelectionModeShift = 1_i64
      SelectionModePointer = 2_i64
      SelectionModeWord = 3_i64
      SelectionModeLine = 4_i64
    end
    enum LineWrappingMode : Int64
      LineWrappingNone = 0_i64
      LineWrappingBoundary = 1_i64
    end
    enum GutterType : Int64
      GutterTypeString = 0_i64
      GutterTypeIcon = 1_i64
      GutterTypeCustom = 2_i64
    end
    @@mb_has_ime_text : Void* = Pointer(Void).null
    def has_ime_text() : Bool
      if @@mb_has_ime_text.null?
        @@mb_has_ime_text = Bridge.get_method_bind("TextEdit", "has_ime_text", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_ime_text, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_cancel_ime : Void* = Pointer(Void).null
    def cancel_ime() : Void
      if @@mb_cancel_ime.null?
        @@mb_cancel_ime = Bridge.get_method_bind("TextEdit", "cancel_ime", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_cancel_ime, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_apply_ime : Void* = Pointer(Void).null
    def apply_ime() : Void
      if @@mb_apply_ime.null?
        @@mb_apply_ime = Bridge.get_method_bind("TextEdit", "apply_ime", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_apply_ime, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_editable : Void* = Pointer(Void).null
    def set_editable(enabled : Bool) : Void
      if @@mb_set_editable.null?
        @@mb_set_editable = Bridge.get_method_bind("TextEdit", "set_editable", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editable : Void* = Pointer(Void).null
    def is_editable() : Bool
      if @@mb_is_editable.null?
        @@mb_is_editable = Bridge.get_method_bind("TextEdit", "is_editable", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_text_direction : Void* = Pointer(Void).null
    def set_text_direction(direction : Int64) : Void
      if @@mb_set_text_direction.null?
        @@mb_set_text_direction = Bridge.get_method_bind("TextEdit", "set_text_direction", 119160795_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_direction : Void* = Pointer(Void).null
    def get_text_direction() : Int64
      if @@mb_get_text_direction.null?
        @@mb_get_text_direction = Bridge.get_method_bind("TextEdit", "get_text_direction", 797257663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_language : Void* = Pointer(Void).null
    def set_language(language : String) : Void
      if @@mb_set_language.null?
        @@mb_set_language = Bridge.get_method_bind("TextEdit", "set_language", 83702148_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_language : Void* = Pointer(Void).null
    def get_language() : String
      if @@mb_get_language.null?
        @@mb_get_language = Bridge.get_method_bind("TextEdit", "get_language", 201670096_i64)
      end
      ""
    end
    @@mb_set_structured_text_bidi_override : Void* = Pointer(Void).null
    def set_structured_text_bidi_override(parser : Int64) : Void
      if @@mb_set_structured_text_bidi_override.null?
        @@mb_set_structured_text_bidi_override = Bridge.get_method_bind("TextEdit", "set_structured_text_bidi_override", 55961453_i64)
      end
      val_0 = parser
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override : Void* = Pointer(Void).null
    def get_structured_text_bidi_override() : Int64
      if @@mb_get_structured_text_bidi_override.null?
        @@mb_get_structured_text_bidi_override = Bridge.get_method_bind("TextEdit", "get_structured_text_bidi_override", 3385126229_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def set_structured_text_bidi_override_options(args : Godot::Array) : Void
      if @@mb_set_structured_text_bidi_override_options.null?
        @@mb_set_structured_text_bidi_override_options = Bridge.get_method_bind("TextEdit", "set_structured_text_bidi_override_options", 381264803_i64)
      end
      arg_ptr_0 = args ? args.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override_options, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def get_structured_text_bidi_override_options() : Godot::Array
      if @@mb_get_structured_text_bidi_override_options.null?
        @@mb_get_structured_text_bidi_override_options = Bridge.get_method_bind("TextEdit", "get_structured_text_bidi_override_options", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override_options, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_tab_size : Void* = Pointer(Void).null
    def set_tab_size(size : Int64) : Void
      if @@mb_set_tab_size.null?
        @@mb_set_tab_size = Bridge.get_method_bind("TextEdit", "set_tab_size", 1286410249_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_size : Void* = Pointer(Void).null
    def get_tab_size() : Int64
      if @@mb_get_tab_size.null?
        @@mb_get_tab_size = Bridge.get_method_bind("TextEdit", "get_tab_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_indent_wrapped_lines : Void* = Pointer(Void).null
    def set_indent_wrapped_lines(enabled : Bool) : Void
      if @@mb_set_indent_wrapped_lines.null?
        @@mb_set_indent_wrapped_lines = Bridge.get_method_bind("TextEdit", "set_indent_wrapped_lines", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_indent_wrapped_lines, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_indent_wrapped_lines : Void* = Pointer(Void).null
    def is_indent_wrapped_lines() : Bool
      if @@mb_is_indent_wrapped_lines.null?
        @@mb_is_indent_wrapped_lines = Bridge.get_method_bind("TextEdit", "is_indent_wrapped_lines", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_indent_wrapped_lines, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tab_input_mode : Void* = Pointer(Void).null
    def set_tab_input_mode(enabled : Bool) : Void
      if @@mb_set_tab_input_mode.null?
        @@mb_set_tab_input_mode = Bridge.get_method_bind("TextEdit", "set_tab_input_mode", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_input_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_input_mode : Void* = Pointer(Void).null
    def get_tab_input_mode() : Bool
      if @@mb_get_tab_input_mode.null?
        @@mb_get_tab_input_mode = Bridge.get_method_bind("TextEdit", "get_tab_input_mode", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_tab_input_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_overtype_mode_enabled : Void* = Pointer(Void).null
    def set_overtype_mode_enabled(enabled : Bool) : Void
      if @@mb_set_overtype_mode_enabled.null?
        @@mb_set_overtype_mode_enabled = Bridge.get_method_bind("TextEdit", "set_overtype_mode_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_overtype_mode_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_overtype_mode_enabled : Void* = Pointer(Void).null
    def is_overtype_mode_enabled() : Bool
      if @@mb_is_overtype_mode_enabled.null?
        @@mb_is_overtype_mode_enabled = Bridge.get_method_bind("TextEdit", "is_overtype_mode_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_overtype_mode_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_context_menu_enabled : Void* = Pointer(Void).null
    def set_context_menu_enabled(enabled : Bool) : Void
      if @@mb_set_context_menu_enabled.null?
        @@mb_set_context_menu_enabled = Bridge.get_method_bind("TextEdit", "set_context_menu_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_context_menu_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_context_menu_enabled : Void* = Pointer(Void).null
    def is_context_menu_enabled() : Bool
      if @@mb_is_context_menu_enabled.null?
        @@mb_is_context_menu_enabled = Bridge.get_method_bind("TextEdit", "is_context_menu_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_context_menu_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_emoji_menu_enabled : Void* = Pointer(Void).null
    def set_emoji_menu_enabled(enable : Bool) : Void
      if @@mb_set_emoji_menu_enabled.null?
        @@mb_set_emoji_menu_enabled = Bridge.get_method_bind("TextEdit", "set_emoji_menu_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emoji_menu_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_emoji_menu_enabled : Void* = Pointer(Void).null
    def is_emoji_menu_enabled() : Bool
      if @@mb_is_emoji_menu_enabled.null?
        @@mb_is_emoji_menu_enabled = Bridge.get_method_bind("TextEdit", "is_emoji_menu_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_emoji_menu_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_backspace_deletes_composite_character_enabled : Void* = Pointer(Void).null
    def set_backspace_deletes_composite_character_enabled(enable : Bool) : Void
      if @@mb_set_backspace_deletes_composite_character_enabled.null?
        @@mb_set_backspace_deletes_composite_character_enabled = Bridge.get_method_bind("TextEdit", "set_backspace_deletes_composite_character_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_backspace_deletes_composite_character_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_backspace_deletes_composite_character_enabled : Void* = Pointer(Void).null
    def is_backspace_deletes_composite_character_enabled() : Bool
      if @@mb_is_backspace_deletes_composite_character_enabled.null?
        @@mb_is_backspace_deletes_composite_character_enabled = Bridge.get_method_bind("TextEdit", "is_backspace_deletes_composite_character_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_backspace_deletes_composite_character_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shortcut_keys_enabled : Void* = Pointer(Void).null
    def set_shortcut_keys_enabled(enabled : Bool) : Void
      if @@mb_set_shortcut_keys_enabled.null?
        @@mb_set_shortcut_keys_enabled = Bridge.get_method_bind("TextEdit", "set_shortcut_keys_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shortcut_keys_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shortcut_keys_enabled : Void* = Pointer(Void).null
    def is_shortcut_keys_enabled() : Bool
      if @@mb_is_shortcut_keys_enabled.null?
        @@mb_is_shortcut_keys_enabled = Bridge.get_method_bind("TextEdit", "is_shortcut_keys_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shortcut_keys_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_virtual_keyboard_enabled : Void* = Pointer(Void).null
    def set_virtual_keyboard_enabled(enabled : Bool) : Void
      if @@mb_set_virtual_keyboard_enabled.null?
        @@mb_set_virtual_keyboard_enabled = Bridge.get_method_bind("TextEdit", "set_virtual_keyboard_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_virtual_keyboard_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_virtual_keyboard_enabled : Void* = Pointer(Void).null
    def is_virtual_keyboard_enabled() : Bool
      if @@mb_is_virtual_keyboard_enabled.null?
        @@mb_is_virtual_keyboard_enabled = Bridge.get_method_bind("TextEdit", "is_virtual_keyboard_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_virtual_keyboard_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_virtual_keyboard_show_on_focus : Void* = Pointer(Void).null
    def set_virtual_keyboard_show_on_focus(show_on_focus : Bool) : Void
      if @@mb_set_virtual_keyboard_show_on_focus.null?
        @@mb_set_virtual_keyboard_show_on_focus = Bridge.get_method_bind("TextEdit", "set_virtual_keyboard_show_on_focus", 2586408642_i64)
      end
      val_0 = show_on_focus
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_virtual_keyboard_show_on_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_virtual_keyboard_show_on_focus : Void* = Pointer(Void).null
    def get_virtual_keyboard_show_on_focus() : Bool
      if @@mb_get_virtual_keyboard_show_on_focus.null?
        @@mb_get_virtual_keyboard_show_on_focus = Bridge.get_method_bind("TextEdit", "get_virtual_keyboard_show_on_focus", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_virtual_keyboard_show_on_focus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_middle_mouse_paste_enabled : Void* = Pointer(Void).null
    def set_middle_mouse_paste_enabled(enabled : Bool) : Void
      if @@mb_set_middle_mouse_paste_enabled.null?
        @@mb_set_middle_mouse_paste_enabled = Bridge.get_method_bind("TextEdit", "set_middle_mouse_paste_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_middle_mouse_paste_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_middle_mouse_paste_enabled : Void* = Pointer(Void).null
    def is_middle_mouse_paste_enabled() : Bool
      if @@mb_is_middle_mouse_paste_enabled.null?
        @@mb_is_middle_mouse_paste_enabled = Bridge.get_method_bind("TextEdit", "is_middle_mouse_paste_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_middle_mouse_paste_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_empty_selection_clipboard_enabled : Void* = Pointer(Void).null
    def set_empty_selection_clipboard_enabled(enabled : Bool) : Void
      if @@mb_set_empty_selection_clipboard_enabled.null?
        @@mb_set_empty_selection_clipboard_enabled = Bridge.get_method_bind("TextEdit", "set_empty_selection_clipboard_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_empty_selection_clipboard_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_empty_selection_clipboard_enabled : Void* = Pointer(Void).null
    def is_empty_selection_clipboard_enabled() : Bool
      if @@mb_is_empty_selection_clipboard_enabled.null?
        @@mb_is_empty_selection_clipboard_enabled = Bridge.get_method_bind("TextEdit", "is_empty_selection_clipboard_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_empty_selection_clipboard_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("TextEdit", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_text : Void* = Pointer(Void).null
    def set_text(text : String) : Void
      if @@mb_set_text.null?
        @@mb_set_text = Bridge.get_method_bind("TextEdit", "set_text", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text : Void* = Pointer(Void).null
    def get_text() : String
      if @@mb_get_text.null?
        @@mb_get_text = Bridge.get_method_bind("TextEdit", "get_text", 201670096_i64)
      end
      ""
    end
    @@mb_get_line_count : Void* = Pointer(Void).null
    def get_line_count() : Int64
      if @@mb_get_line_count.null?
        @@mb_get_line_count = Bridge.get_method_bind("TextEdit", "get_line_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_placeholder : Void* = Pointer(Void).null
    def set_placeholder(text : String) : Void
      if @@mb_set_placeholder.null?
        @@mb_set_placeholder = Bridge.get_method_bind("TextEdit", "set_placeholder", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_placeholder, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_placeholder : Void* = Pointer(Void).null
    def get_placeholder() : String
      if @@mb_get_placeholder.null?
        @@mb_get_placeholder = Bridge.get_method_bind("TextEdit", "get_placeholder", 201670096_i64)
      end
      ""
    end
    @@mb_set_line : Void* = Pointer(Void).null
    def set_line(line : Int64, new_text : String) : Void
      if @@mb_set_line.null?
        @@mb_set_line = Bridge.get_method_bind("TextEdit", "set_line", 501894301_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = new_text
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_line : Void* = Pointer(Void).null
    def get_line(line : Int64) : String
      if @@mb_get_line.null?
        @@mb_get_line = Bridge.get_method_bind("TextEdit", "get_line", 844755477_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_line_with_ime : Void* = Pointer(Void).null
    def get_line_with_ime(line : Int64) : String
      if @@mb_get_line_with_ime.null?
        @@mb_get_line_with_ime = Bridge.get_method_bind("TextEdit", "get_line_with_ime", 844755477_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_line_width : Void* = Pointer(Void).null
    def get_line_width(line : Int64, wrap_index : Int64) : Int64
      if @@mb_get_line_width.null?
        @@mb_get_line_width = Bridge.get_method_bind("TextEdit", "get_line_width", 688195400_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = wrap_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_width, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_height : Void* = Pointer(Void).null
    def get_line_height() : Int64
      if @@mb_get_line_height.null?
        @@mb_get_line_height = Bridge.get_method_bind("TextEdit", "get_line_height", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_indent_level : Void* = Pointer(Void).null
    def get_indent_level(line : Int64) : Int64
      if @@mb_get_indent_level.null?
        @@mb_get_indent_level = Bridge.get_method_bind("TextEdit", "get_indent_level", 923996154_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_indent_level, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_first_non_whitespace_column : Void* = Pointer(Void).null
    def get_first_non_whitespace_column(line : Int64) : Int64
      if @@mb_get_first_non_whitespace_column.null?
        @@mb_get_first_non_whitespace_column = Bridge.get_method_bind("TextEdit", "get_first_non_whitespace_column", 923996154_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_first_non_whitespace_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_swap_lines : Void* = Pointer(Void).null
    def swap_lines(from_line : Int64, to_line : Int64) : Void
      if @@mb_swap_lines.null?
        @@mb_swap_lines = Bridge.get_method_bind("TextEdit", "swap_lines", 3937882851_i64)
      end
      val_0 = from_line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_line
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_swap_lines, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_insert_line_at : Void* = Pointer(Void).null
    def insert_line_at(line : Int64, text : String) : Void
      if @@mb_insert_line_at.null?
        @@mb_insert_line_at = Bridge.get_method_bind("TextEdit", "insert_line_at", 501894301_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = text
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_insert_line_at, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_line_at : Void* = Pointer(Void).null
    def remove_line_at(line : Int64, move_carets_down : Bool) : Void
      if @@mb_remove_line_at.null?
        @@mb_remove_line_at = Bridge.get_method_bind("TextEdit", "remove_line_at", 972357352_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = move_carets_down
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_remove_line_at, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_insert_text_at_caret : Void* = Pointer(Void).null
    def insert_text_at_caret(text : String, caret_index : Int64) : Void
      if @@mb_insert_text_at_caret.null?
        @@mb_insert_text_at_caret = Bridge.get_method_bind("TextEdit", "insert_text_at_caret", 2697778442_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = caret_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_insert_text_at_caret, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_insert_text : Void* = Pointer(Void).null
    def insert_text(text : String, line : Int64, column : Int64, before_selection_begin : Bool, before_selection_end : Bool) : Void
      if @@mb_insert_text.null?
        @@mb_insert_text = Bridge.get_method_bind("TextEdit", "insert_text", 1881564334_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = line
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = column
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = before_selection_begin
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = before_selection_end
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_insert_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_text : Void* = Pointer(Void).null
    def remove_text(from_line : Int64, from_column : Int64, to_line : Int64, to_column : Int64) : Void
      if @@mb_remove_text.null?
        @@mb_remove_text = Bridge.get_method_bind("TextEdit", "remove_text", 4275841770_i64)
      end
      val_0 = from_line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_column
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_line
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_column
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_remove_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_last_unhidden_line : Void* = Pointer(Void).null
    def get_last_unhidden_line() : Int64
      if @@mb_get_last_unhidden_line.null?
        @@mb_get_last_unhidden_line = Bridge.get_method_bind("TextEdit", "get_last_unhidden_line", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_last_unhidden_line, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_next_visible_line_offset_from : Void* = Pointer(Void).null
    def get_next_visible_line_offset_from(line : Int64, visible_amount : Int64) : Int64
      if @@mb_get_next_visible_line_offset_from.null?
        @@mb_get_next_visible_line_offset_from = Bridge.get_method_bind("TextEdit", "get_next_visible_line_offset_from", 3175239445_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = visible_amount
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_next_visible_line_offset_from, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_next_visible_line_index_offset_from : Void* = Pointer(Void).null
    def get_next_visible_line_index_offset_from(line : Int64, wrap_index : Int64, visible_amount : Int64) : Vector2i
      if @@mb_get_next_visible_line_index_offset_from.null?
        @@mb_get_next_visible_line_index_offset_from = Bridge.get_method_bind("TextEdit", "get_next_visible_line_index_offset_from", 3386475622_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = wrap_index
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = visible_amount
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_next_visible_line_index_offset_from, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_backspace : Void* = Pointer(Void).null
    def backspace(caret_index : Int64) : Void
      if @@mb_backspace.null?
        @@mb_backspace = Bridge.get_method_bind("TextEdit", "backspace", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_backspace, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_cut : Void* = Pointer(Void).null
    def cut(caret_index : Int64) : Void
      if @@mb_cut.null?
        @@mb_cut = Bridge.get_method_bind("TextEdit", "cut", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_cut, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_copy : Void* = Pointer(Void).null
    def copy(caret_index : Int64) : Void
      if @@mb_copy.null?
        @@mb_copy = Bridge.get_method_bind("TextEdit", "copy", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_copy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_paste : Void* = Pointer(Void).null
    def paste(caret_index : Int64) : Void
      if @@mb_paste.null?
        @@mb_paste = Bridge.get_method_bind("TextEdit", "paste", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_paste, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_paste_primary_clipboard : Void* = Pointer(Void).null
    def paste_primary_clipboard(caret_index : Int64) : Void
      if @@mb_paste_primary_clipboard.null?
        @@mb_paste_primary_clipboard = Bridge.get_method_bind("TextEdit", "paste_primary_clipboard", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_paste_primary_clipboard, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_start_action : Void* = Pointer(Void).null
    def start_action(action : Int64) : Void
      if @@mb_start_action.null?
        @@mb_start_action = Bridge.get_method_bind("TextEdit", "start_action", 2834827583_i64)
      end
      val_0 = action
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_start_action, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_end_action : Void* = Pointer(Void).null
    def end_action() : Void
      if @@mb_end_action.null?
        @@mb_end_action = Bridge.get_method_bind("TextEdit", "end_action", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_end_action, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_begin_complex_operation : Void* = Pointer(Void).null
    def begin_complex_operation() : Void
      if @@mb_begin_complex_operation.null?
        @@mb_begin_complex_operation = Bridge.get_method_bind("TextEdit", "begin_complex_operation", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_begin_complex_operation, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_end_complex_operation : Void* = Pointer(Void).null
    def end_complex_operation() : Void
      if @@mb_end_complex_operation.null?
        @@mb_end_complex_operation = Bridge.get_method_bind("TextEdit", "end_complex_operation", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_end_complex_operation, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_has_undo : Void* = Pointer(Void).null
    def has_undo() : Bool
      if @@mb_has_undo.null?
        @@mb_has_undo = Bridge.get_method_bind("TextEdit", "has_undo", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_undo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_redo : Void* = Pointer(Void).null
    def has_redo() : Bool
      if @@mb_has_redo.null?
        @@mb_has_redo = Bridge.get_method_bind("TextEdit", "has_redo", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_redo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_undo : Void* = Pointer(Void).null
    def undo() : Void
      if @@mb_undo.null?
        @@mb_undo = Bridge.get_method_bind("TextEdit", "undo", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_undo, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_redo : Void* = Pointer(Void).null
    def redo_val() : Void
      if @@mb_redo.null?
        @@mb_redo = Bridge.get_method_bind("TextEdit", "redo", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_redo, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_clear_undo_history : Void* = Pointer(Void).null
    def clear_undo_history() : Void
      if @@mb_clear_undo_history.null?
        @@mb_clear_undo_history = Bridge.get_method_bind("TextEdit", "clear_undo_history", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_undo_history, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_tag_saved_version : Void* = Pointer(Void).null
    def tag_saved_version() : Void
      if @@mb_tag_saved_version.null?
        @@mb_tag_saved_version = Bridge.get_method_bind("TextEdit", "tag_saved_version", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_tag_saved_version, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_version : Void* = Pointer(Void).null
    def get_version() : Int64
      if @@mb_get_version.null?
        @@mb_get_version = Bridge.get_method_bind("TextEdit", "get_version", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_version, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_saved_version : Void* = Pointer(Void).null
    def get_saved_version() : Int64
      if @@mb_get_saved_version.null?
        @@mb_get_saved_version = Bridge.get_method_bind("TextEdit", "get_saved_version", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_saved_version, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_search_text : Void* = Pointer(Void).null
    def set_search_text(search_text : String) : Void
      if @@mb_set_search_text.null?
        @@mb_set_search_text = Bridge.get_method_bind("TextEdit", "set_search_text", 83702148_i64)
      end
      val_0 = search_text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_search_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_search_flags : Void* = Pointer(Void).null
    def set_search_flags(flags : Int64) : Void
      if @@mb_set_search_flags.null?
        @@mb_set_search_flags = Bridge.get_method_bind("TextEdit", "set_search_flags", 1286410249_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_search_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_search : Void* = Pointer(Void).null
    def search(text : String, flags : Int64, from_line : Int64, from_column : Int64) : Vector2i
      if @@mb_search.null?
        @@mb_search = Bridge.get_method_bind("TextEdit", "search", 1203739136_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flags
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_line
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = from_column
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_search, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_set_tooltip_request_func : Void* = Pointer(Void).null
    def set_tooltip_request_func(callback : Void*) : Void
      if @@mb_set_tooltip_request_func.null?
        @@mb_set_tooltip_request_func = Bridge.get_method_bind("TextEdit", "set_tooltip_request_func", 1611583062_i64)
      end
      val_0 = callback
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tooltip_request_func, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_local_mouse_pos : Void* = Pointer(Void).null
    def get_local_mouse_pos() : Vector2
      if @@mb_get_local_mouse_pos.null?
        @@mb_get_local_mouse_pos = Bridge.get_method_bind("TextEdit", "get_local_mouse_pos", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_local_mouse_pos, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_word_at_pos : Void* = Pointer(Void).null
    def get_word_at_pos(position : Vector2) : String
      if @@mb_get_word_at_pos.null?
        @@mb_get_word_at_pos = Bridge.get_method_bind("TextEdit", "get_word_at_pos", 3674420000_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_line_column_at_pos : Void* = Pointer(Void).null
    def get_line_column_at_pos(position : Vector2i, clamp_line : Bool, clamp_column : Bool) : Vector2i
      if @@mb_get_line_column_at_pos.null?
        @@mb_get_line_column_at_pos = Bridge.get_method_bind("TextEdit", "get_line_column_at_pos", 3472935744_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = clamp_line
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = clamp_column
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_line_column_at_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_get_pos_at_line_column : Void* = Pointer(Void).null
    def get_pos_at_line_column(line : Int64, column : Int64) : Vector2i
      if @@mb_get_pos_at_line_column.null?
        @@mb_get_pos_at_line_column = Bridge.get_method_bind("TextEdit", "get_pos_at_line_column", 410388347_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_pos_at_line_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_get_rect_at_line_column : Void* = Pointer(Void).null
    def get_rect_at_line_column(line : Int64, column : Int64) : Rect2i
      if @@mb_get_rect_at_line_column.null?
        @@mb_get_rect_at_line_column = Bridge.get_method_bind("TextEdit", "get_rect_at_line_column", 3256618057_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rect_at_line_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2i.new(ret_ptr)
    end
    @@mb_get_minimap_line_at_pos : Void* = Pointer(Void).null
    def get_minimap_line_at_pos(position : Vector2i) : Int64
      if @@mb_get_minimap_line_at_pos.null?
        @@mb_get_minimap_line_at_pos = Bridge.get_method_bind("TextEdit", "get_minimap_line_at_pos", 2485466453_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_minimap_line_at_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_dragging_cursor : Void* = Pointer(Void).null
    def is_dragging_cursor() : Bool
      if @@mb_is_dragging_cursor.null?
        @@mb_is_dragging_cursor = Bridge.get_method_bind("TextEdit", "is_dragging_cursor", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_dragging_cursor, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_mouse_over_selection : Void* = Pointer(Void).null
    def is_mouse_over_selection(edges : Bool, caret_index : Int64) : Bool
      if @@mb_is_mouse_over_selection.null?
        @@mb_is_mouse_over_selection = Bridge.get_method_bind("TextEdit", "is_mouse_over_selection", 1840282309_i64)
      end
      val_0 = edges
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = caret_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_mouse_over_selection, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_caret_type : Void* = Pointer(Void).null
    def set_caret_type(get_type : Int64) : Void
      if @@mb_set_caret_type.null?
        @@mb_set_caret_type = Bridge.get_method_bind("TextEdit", "set_caret_type", 1211596914_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caret_type : Void* = Pointer(Void).null
    def get_caret_type() : Int64
      if @@mb_get_caret_type.null?
        @@mb_get_caret_type = Bridge.get_method_bind("TextEdit", "get_caret_type", 2830252959_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caret_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_caret_blink_enabled : Void* = Pointer(Void).null
    def set_caret_blink_enabled(enable : Bool) : Void
      if @@mb_set_caret_blink_enabled.null?
        @@mb_set_caret_blink_enabled = Bridge.get_method_bind("TextEdit", "set_caret_blink_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_blink_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_caret_blink_enabled : Void* = Pointer(Void).null
    def is_caret_blink_enabled() : Bool
      if @@mb_is_caret_blink_enabled.null?
        @@mb_is_caret_blink_enabled = Bridge.get_method_bind("TextEdit", "is_caret_blink_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_caret_blink_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_caret_blink_interval : Void* = Pointer(Void).null
    def set_caret_blink_interval(interval : Float64) : Void
      if @@mb_set_caret_blink_interval.null?
        @@mb_set_caret_blink_interval = Bridge.get_method_bind("TextEdit", "set_caret_blink_interval", 373806689_i64)
      end
      val_0 = interval
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_blink_interval, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caret_blink_interval : Void* = Pointer(Void).null
    def get_caret_blink_interval() : Float64
      if @@mb_get_caret_blink_interval.null?
        @@mb_get_caret_blink_interval = Bridge.get_method_bind("TextEdit", "get_caret_blink_interval", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_caret_blink_interval, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_draw_caret_when_editable_disabled : Void* = Pointer(Void).null
    def set_draw_caret_when_editable_disabled(enable : Bool) : Void
      if @@mb_set_draw_caret_when_editable_disabled.null?
        @@mb_set_draw_caret_when_editable_disabled = Bridge.get_method_bind("TextEdit", "set_draw_caret_when_editable_disabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_caret_when_editable_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drawing_caret_when_editable_disabled : Void* = Pointer(Void).null
    def is_drawing_caret_when_editable_disabled() : Bool
      if @@mb_is_drawing_caret_when_editable_disabled.null?
        @@mb_is_drawing_caret_when_editable_disabled = Bridge.get_method_bind("TextEdit", "is_drawing_caret_when_editable_disabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drawing_caret_when_editable_disabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_move_caret_on_right_click_enabled : Void* = Pointer(Void).null
    def set_move_caret_on_right_click_enabled(enable : Bool) : Void
      if @@mb_set_move_caret_on_right_click_enabled.null?
        @@mb_set_move_caret_on_right_click_enabled = Bridge.get_method_bind("TextEdit", "set_move_caret_on_right_click_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_move_caret_on_right_click_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_move_caret_on_right_click_enabled : Void* = Pointer(Void).null
    def is_move_caret_on_right_click_enabled() : Bool
      if @@mb_is_move_caret_on_right_click_enabled.null?
        @@mb_is_move_caret_on_right_click_enabled = Bridge.get_method_bind("TextEdit", "is_move_caret_on_right_click_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_move_caret_on_right_click_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_caret_mid_grapheme_enabled : Void* = Pointer(Void).null
    def set_caret_mid_grapheme_enabled(enabled : Bool) : Void
      if @@mb_set_caret_mid_grapheme_enabled.null?
        @@mb_set_caret_mid_grapheme_enabled = Bridge.get_method_bind("TextEdit", "set_caret_mid_grapheme_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_mid_grapheme_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_caret_mid_grapheme_enabled : Void* = Pointer(Void).null
    def is_caret_mid_grapheme_enabled() : Bool
      if @@mb_is_caret_mid_grapheme_enabled.null?
        @@mb_is_caret_mid_grapheme_enabled = Bridge.get_method_bind("TextEdit", "is_caret_mid_grapheme_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_caret_mid_grapheme_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_multiple_carets_enabled : Void* = Pointer(Void).null
    def set_multiple_carets_enabled(enabled : Bool) : Void
      if @@mb_set_multiple_carets_enabled.null?
        @@mb_set_multiple_carets_enabled = Bridge.get_method_bind("TextEdit", "set_multiple_carets_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_multiple_carets_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_multiple_carets_enabled : Void* = Pointer(Void).null
    def is_multiple_carets_enabled() : Bool
      if @@mb_is_multiple_carets_enabled.null?
        @@mb_is_multiple_carets_enabled = Bridge.get_method_bind("TextEdit", "is_multiple_carets_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_multiple_carets_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_add_caret : Void* = Pointer(Void).null
    def add_caret(line : Int64, column : Int64) : Int64
      if @@mb_add_caret.null?
        @@mb_add_caret = Bridge.get_method_bind("TextEdit", "add_caret", 50157827_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_caret, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_caret : Void* = Pointer(Void).null
    def remove_caret(caret : Int64) : Void
      if @@mb_remove_caret.null?
        @@mb_remove_caret = Bridge.get_method_bind("TextEdit", "remove_caret", 1286410249_i64)
      end
      val_0 = caret
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_caret, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_secondary_carets : Void* = Pointer(Void).null
    def remove_secondary_carets() : Void
      if @@mb_remove_secondary_carets.null?
        @@mb_remove_secondary_carets = Bridge.get_method_bind("TextEdit", "remove_secondary_carets", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_remove_secondary_carets, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_caret_count : Void* = Pointer(Void).null
    def get_caret_count() : Int64
      if @@mb_get_caret_count.null?
        @@mb_get_caret_count = Bridge.get_method_bind("TextEdit", "get_caret_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caret_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_caret_at_carets : Void* = Pointer(Void).null
    def add_caret_at_carets(below : Bool) : Void
      if @@mb_add_caret_at_carets.null?
        @@mb_add_caret_at_carets = Bridge.get_method_bind("TextEdit", "add_caret_at_carets", 2586408642_i64)
      end
      val_0 = below
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_caret_at_carets, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_sorted_carets : Void* = Pointer(Void).null
    def get_sorted_carets(include_ignored_carets : Bool) : Void*
      if @@mb_get_sorted_carets.null?
        @@mb_get_sorted_carets = Bridge.get_method_bind("TextEdit", "get_sorted_carets", 2131714034_i64)
      end
      val_0 = include_ignored_carets
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_sorted_carets, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_collapse_carets : Void* = Pointer(Void).null
    def collapse_carets(from_line : Int64, from_column : Int64, to_line : Int64, to_column : Int64, inclusive : Bool) : Void
      if @@mb_collapse_carets.null?
        @@mb_collapse_carets = Bridge.get_method_bind("TextEdit", "collapse_carets", 228654177_i64)
      end
      val_0 = from_line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_column
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_line
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_column
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = inclusive
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_collapse_carets, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_merge_overlapping_carets : Void* = Pointer(Void).null
    def merge_overlapping_carets() : Void
      if @@mb_merge_overlapping_carets.null?
        @@mb_merge_overlapping_carets = Bridge.get_method_bind("TextEdit", "merge_overlapping_carets", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_merge_overlapping_carets, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_begin_multicaret_edit : Void* = Pointer(Void).null
    def begin_multicaret_edit() : Void
      if @@mb_begin_multicaret_edit.null?
        @@mb_begin_multicaret_edit = Bridge.get_method_bind("TextEdit", "begin_multicaret_edit", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_begin_multicaret_edit, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_end_multicaret_edit : Void* = Pointer(Void).null
    def end_multicaret_edit() : Void
      if @@mb_end_multicaret_edit.null?
        @@mb_end_multicaret_edit = Bridge.get_method_bind("TextEdit", "end_multicaret_edit", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_end_multicaret_edit, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_in_mulitcaret_edit : Void* = Pointer(Void).null
    def is_in_mulitcaret_edit() : Bool
      if @@mb_is_in_mulitcaret_edit.null?
        @@mb_is_in_mulitcaret_edit = Bridge.get_method_bind("TextEdit", "is_in_mulitcaret_edit", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_in_mulitcaret_edit, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_multicaret_edit_ignore_caret : Void* = Pointer(Void).null
    def multicaret_edit_ignore_caret(caret_index : Int64) : Bool
      if @@mb_multicaret_edit_ignore_caret.null?
        @@mb_multicaret_edit_ignore_caret = Bridge.get_method_bind("TextEdit", "multicaret_edit_ignore_caret", 1116898809_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_multicaret_edit_ignore_caret, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_caret_visible : Void* = Pointer(Void).null
    def is_caret_visible(caret_index : Int64) : Bool
      if @@mb_is_caret_visible.null?
        @@mb_is_caret_visible = Bridge.get_method_bind("TextEdit", "is_caret_visible", 1051549951_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_caret_visible, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_caret_draw_pos : Void* = Pointer(Void).null
    def get_caret_draw_pos(caret_index : Int64) : Vector2
      if @@mb_get_caret_draw_pos.null?
        @@mb_get_caret_draw_pos = Bridge.get_method_bind("TextEdit", "get_caret_draw_pos", 478253731_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_caret_draw_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_caret_line : Void* = Pointer(Void).null
    def set_caret_line(line : Int64, adjust_viewport : Bool, can_be_hidden : Bool, wrap_index : Int64, caret_index : Int64) : Void
      if @@mb_set_caret_line.null?
        @@mb_set_caret_line = Bridge.get_method_bind("TextEdit", "set_caret_line", 1302582944_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = adjust_viewport
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = can_be_hidden
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = wrap_index
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = caret_index
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_set_caret_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caret_line : Void* = Pointer(Void).null
    def get_caret_line(caret_index : Int64) : Int64
      if @@mb_get_caret_line.null?
        @@mb_get_caret_line = Bridge.get_method_bind("TextEdit", "get_caret_line", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caret_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_caret_column : Void* = Pointer(Void).null
    def set_caret_column(column : Int64, adjust_viewport : Bool, caret_index : Int64) : Void
      if @@mb_set_caret_column.null?
        @@mb_set_caret_column = Bridge.get_method_bind("TextEdit", "set_caret_column", 3796796178_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = adjust_viewport
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = caret_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_caret_column, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caret_column : Void* = Pointer(Void).null
    def get_caret_column(caret_index : Int64) : Int64
      if @@mb_get_caret_column.null?
        @@mb_get_caret_column = Bridge.get_method_bind("TextEdit", "get_caret_column", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caret_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_next_composite_character_column : Void* = Pointer(Void).null
    def get_next_composite_character_column(line : Int64, column : Int64) : Int64
      if @@mb_get_next_composite_character_column.null?
        @@mb_get_next_composite_character_column = Bridge.get_method_bind("TextEdit", "get_next_composite_character_column", 3175239445_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_next_composite_character_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_previous_composite_character_column : Void* = Pointer(Void).null
    def get_previous_composite_character_column(line : Int64, column : Int64) : Int64
      if @@mb_get_previous_composite_character_column.null?
        @@mb_get_previous_composite_character_column = Bridge.get_method_bind("TextEdit", "get_previous_composite_character_column", 3175239445_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_previous_composite_character_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_caret_wrap_index : Void* = Pointer(Void).null
    def get_caret_wrap_index(caret_index : Int64) : Int64
      if @@mb_get_caret_wrap_index.null?
        @@mb_get_caret_wrap_index = Bridge.get_method_bind("TextEdit", "get_caret_wrap_index", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caret_wrap_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_word_under_caret : Void* = Pointer(Void).null
    def get_word_under_caret(caret_index : Int64) : String
      if @@mb_get_word_under_caret.null?
        @@mb_get_word_under_caret = Bridge.get_method_bind("TextEdit", "get_word_under_caret", 3929349208_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_use_default_word_separators : Void* = Pointer(Void).null
    def set_use_default_word_separators(enabled : Bool) : Void
      if @@mb_set_use_default_word_separators.null?
        @@mb_set_use_default_word_separators = Bridge.get_method_bind("TextEdit", "set_use_default_word_separators", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_default_word_separators, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_default_word_separators_enabled : Void* = Pointer(Void).null
    def is_default_word_separators_enabled() : Bool
      if @@mb_is_default_word_separators_enabled.null?
        @@mb_is_default_word_separators_enabled = Bridge.get_method_bind("TextEdit", "is_default_word_separators_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_default_word_separators_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_use_custom_word_separators : Void* = Pointer(Void).null
    def set_use_custom_word_separators(enabled : Bool) : Void
      if @@mb_set_use_custom_word_separators.null?
        @@mb_set_use_custom_word_separators = Bridge.get_method_bind("TextEdit", "set_use_custom_word_separators", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_custom_word_separators, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_custom_word_separators_enabled : Void* = Pointer(Void).null
    def is_custom_word_separators_enabled() : Bool
      if @@mb_is_custom_word_separators_enabled.null?
        @@mb_is_custom_word_separators_enabled = Bridge.get_method_bind("TextEdit", "is_custom_word_separators_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_custom_word_separators_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_custom_word_separators : Void* = Pointer(Void).null
    def set_custom_word_separators(custom_word_separators : String) : Void
      if @@mb_set_custom_word_separators.null?
        @@mb_set_custom_word_separators = Bridge.get_method_bind("TextEdit", "set_custom_word_separators", 83702148_i64)
      end
      val_0 = custom_word_separators
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_word_separators, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_custom_word_separators : Void* = Pointer(Void).null
    def get_custom_word_separators() : String
      if @@mb_get_custom_word_separators.null?
        @@mb_get_custom_word_separators = Bridge.get_method_bind("TextEdit", "get_custom_word_separators", 201670096_i64)
      end
      ""
    end
    @@mb_set_selecting_enabled : Void* = Pointer(Void).null
    def set_selecting_enabled(enable : Bool) : Void
      if @@mb_set_selecting_enabled.null?
        @@mb_set_selecting_enabled = Bridge.get_method_bind("TextEdit", "set_selecting_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_selecting_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_selecting_enabled : Void* = Pointer(Void).null
    def is_selecting_enabled() : Bool
      if @@mb_is_selecting_enabled.null?
        @@mb_is_selecting_enabled = Bridge.get_method_bind("TextEdit", "is_selecting_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_selecting_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_deselect_on_focus_loss_enabled : Void* = Pointer(Void).null
    def set_deselect_on_focus_loss_enabled(enable : Bool) : Void
      if @@mb_set_deselect_on_focus_loss_enabled.null?
        @@mb_set_deselect_on_focus_loss_enabled = Bridge.get_method_bind("TextEdit", "set_deselect_on_focus_loss_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deselect_on_focus_loss_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_deselect_on_focus_loss_enabled : Void* = Pointer(Void).null
    def is_deselect_on_focus_loss_enabled() : Bool
      if @@mb_is_deselect_on_focus_loss_enabled.null?
        @@mb_is_deselect_on_focus_loss_enabled = Bridge.get_method_bind("TextEdit", "is_deselect_on_focus_loss_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_deselect_on_focus_loss_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drag_and_drop_selection_enabled : Void* = Pointer(Void).null
    def set_drag_and_drop_selection_enabled(enable : Bool) : Void
      if @@mb_set_drag_and_drop_selection_enabled.null?
        @@mb_set_drag_and_drop_selection_enabled = Bridge.get_method_bind("TextEdit", "set_drag_and_drop_selection_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_and_drop_selection_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drag_and_drop_selection_enabled : Void* = Pointer(Void).null
    def is_drag_and_drop_selection_enabled() : Bool
      if @@mb_is_drag_and_drop_selection_enabled.null?
        @@mb_is_drag_and_drop_selection_enabled = Bridge.get_method_bind("TextEdit", "is_drag_and_drop_selection_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drag_and_drop_selection_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_selection_mode : Void* = Pointer(Void).null
    def set_selection_mode(mode : Int64) : Void
      if @@mb_set_selection_mode.null?
        @@mb_set_selection_mode = Bridge.get_method_bind("TextEdit", "set_selection_mode", 1658801786_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_selection_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_selection_mode : Void* = Pointer(Void).null
    def get_selection_mode() : Int64
      if @@mb_get_selection_mode.null?
        @@mb_get_selection_mode = Bridge.get_method_bind("TextEdit", "get_selection_mode", 3750106938_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_select_all : Void* = Pointer(Void).null
    def select_all() : Void
      if @@mb_select_all.null?
        @@mb_select_all = Bridge.get_method_bind("TextEdit", "select_all", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_select_all, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_select_word_under_caret : Void* = Pointer(Void).null
    def select_word_under_caret(caret_index : Int64) : Void
      if @@mb_select_word_under_caret.null?
        @@mb_select_word_under_caret = Bridge.get_method_bind("TextEdit", "select_word_under_caret", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_select_word_under_caret, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_selection_for_next_occurrence : Void* = Pointer(Void).null
    def add_selection_for_next_occurrence() : Void
      if @@mb_add_selection_for_next_occurrence.null?
        @@mb_add_selection_for_next_occurrence = Bridge.get_method_bind("TextEdit", "add_selection_for_next_occurrence", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_add_selection_for_next_occurrence, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_skip_selection_for_next_occurrence : Void* = Pointer(Void).null
    def skip_selection_for_next_occurrence() : Void
      if @@mb_skip_selection_for_next_occurrence.null?
        @@mb_skip_selection_for_next_occurrence = Bridge.get_method_bind("TextEdit", "skip_selection_for_next_occurrence", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_skip_selection_for_next_occurrence, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_select : Void* = Pointer(Void).null
    def select_val(origin_line : Int64, origin_column : Int64, caret_line : Int64, caret_column : Int64, caret_index : Int64) : Void
      if @@mb_select.null?
        @@mb_select = Bridge.get_method_bind("TextEdit", "select", 2560984452_i64)
      end
      val_0 = origin_line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = origin_column
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = caret_line
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = caret_column
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = caret_index
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_select, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_selection : Void* = Pointer(Void).null
    def has_selection(caret_index : Int64) : Bool
      if @@mb_has_selection.null?
        @@mb_has_selection = Bridge.get_method_bind("TextEdit", "has_selection", 2824505868_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_selection, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_selected_text : Void* = Pointer(Void).null
    def get_selected_text(caret_index : Int64) : String
      if @@mb_get_selected_text.null?
        @@mb_get_selected_text = Bridge.get_method_bind("TextEdit", "get_selected_text", 2309358862_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_selection_at_line_column : Void* = Pointer(Void).null
    def get_selection_at_line_column(line : Int64, column : Int64, include_edges : Bool, only_selections : Bool) : Int64
      if @@mb_get_selection_at_line_column.null?
        @@mb_get_selection_at_line_column = Bridge.get_method_bind("TextEdit", "get_selection_at_line_column", 1810224333_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = include_edges
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = only_selections
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_at_line_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_ranges_from_carets : Void* = Pointer(Void).null
    def get_line_ranges_from_carets(only_selections : Bool, merge_adjacent : Bool) : Godot::Array
      if @@mb_get_line_ranges_from_carets.null?
        @@mb_get_line_ranges_from_carets = Bridge.get_method_bind("TextEdit", "get_line_ranges_from_carets", 2393089247_i64)
      end
      val_0 = only_selections
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = merge_adjacent
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_line_ranges_from_carets, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_selection_origin_line : Void* = Pointer(Void).null
    def get_selection_origin_line(caret_index : Int64) : Int64
      if @@mb_get_selection_origin_line.null?
        @@mb_get_selection_origin_line = Bridge.get_method_bind("TextEdit", "get_selection_origin_line", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_origin_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_origin_column : Void* = Pointer(Void).null
    def get_selection_origin_column(caret_index : Int64) : Int64
      if @@mb_get_selection_origin_column.null?
        @@mb_get_selection_origin_column = Bridge.get_method_bind("TextEdit", "get_selection_origin_column", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_origin_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_selection_origin_line : Void* = Pointer(Void).null
    def set_selection_origin_line(line : Int64, can_be_hidden : Bool, wrap_index : Int64, caret_index : Int64) : Void
      if @@mb_set_selection_origin_line.null?
        @@mb_set_selection_origin_line = Bridge.get_method_bind("TextEdit", "set_selection_origin_line", 195434140_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = can_be_hidden
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = wrap_index
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = caret_index
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_selection_origin_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_selection_origin_column : Void* = Pointer(Void).null
    def set_selection_origin_column(column : Int64, caret_index : Int64) : Void
      if @@mb_set_selection_origin_column.null?
        @@mb_set_selection_origin_column = Bridge.get_method_bind("TextEdit", "set_selection_origin_column", 2230941749_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = caret_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_selection_origin_column, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_selection_from_line : Void* = Pointer(Void).null
    def get_selection_from_line(caret_index : Int64) : Int64
      if @@mb_get_selection_from_line.null?
        @@mb_get_selection_from_line = Bridge.get_method_bind("TextEdit", "get_selection_from_line", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_from_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_from_column : Void* = Pointer(Void).null
    def get_selection_from_column(caret_index : Int64) : Int64
      if @@mb_get_selection_from_column.null?
        @@mb_get_selection_from_column = Bridge.get_method_bind("TextEdit", "get_selection_from_column", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_from_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_to_line : Void* = Pointer(Void).null
    def get_selection_to_line(caret_index : Int64) : Int64
      if @@mb_get_selection_to_line.null?
        @@mb_get_selection_to_line = Bridge.get_method_bind("TextEdit", "get_selection_to_line", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_to_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_to_column : Void* = Pointer(Void).null
    def get_selection_to_column(caret_index : Int64) : Int64
      if @@mb_get_selection_to_column.null?
        @@mb_get_selection_to_column = Bridge.get_method_bind("TextEdit", "get_selection_to_column", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_to_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_caret_after_selection_origin : Void* = Pointer(Void).null
    def is_caret_after_selection_origin(caret_index : Int64) : Bool
      if @@mb_is_caret_after_selection_origin.null?
        @@mb_is_caret_after_selection_origin = Bridge.get_method_bind("TextEdit", "is_caret_after_selection_origin", 1051549951_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_caret_after_selection_origin, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_deselect : Void* = Pointer(Void).null
    def deselect(caret_index : Int64) : Void
      if @@mb_deselect.null?
        @@mb_deselect = Bridge.get_method_bind("TextEdit", "deselect", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_deselect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_delete_selection : Void* = Pointer(Void).null
    def delete_selection(caret_index : Int64) : Void
      if @@mb_delete_selection.null?
        @@mb_delete_selection = Bridge.get_method_bind("TextEdit", "delete_selection", 1025054187_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_delete_selection, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_selection_handle_enabled : Void* = Pointer(Void).null
    def set_selection_handle_enabled(enable : Bool) : Void
      if @@mb_set_selection_handle_enabled.null?
        @@mb_set_selection_handle_enabled = Bridge.get_method_bind("TextEdit", "set_selection_handle_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_selection_handle_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_selection_handle_enabled : Void* = Pointer(Void).null
    def is_selection_handle_enabled() : Bool
      if @@mb_is_selection_handle_enabled.null?
        @@mb_is_selection_handle_enabled = Bridge.get_method_bind("TextEdit", "is_selection_handle_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_selection_handle_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_line_wrapping_mode : Void* = Pointer(Void).null
    def set_line_wrapping_mode(mode : Int64) : Void
      if @@mb_set_line_wrapping_mode.null?
        @@mb_set_line_wrapping_mode = Bridge.get_method_bind("TextEdit", "set_line_wrapping_mode", 2525115309_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_line_wrapping_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_line_wrapping_mode : Void* = Pointer(Void).null
    def get_line_wrapping_mode() : Int64
      if @@mb_get_line_wrapping_mode.null?
        @@mb_get_line_wrapping_mode = Bridge.get_method_bind("TextEdit", "get_line_wrapping_mode", 3562716114_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_wrapping_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autowrap_mode : Void* = Pointer(Void).null
    def set_autowrap_mode(autowrap_mode : Int64) : Void
      if @@mb_set_autowrap_mode.null?
        @@mb_set_autowrap_mode = Bridge.get_method_bind("TextEdit", "set_autowrap_mode", 3289138044_i64)
      end
      val_0 = autowrap_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autowrap_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autowrap_mode : Void* = Pointer(Void).null
    def get_autowrap_mode() : Int64
      if @@mb_get_autowrap_mode.null?
        @@mb_get_autowrap_mode = Bridge.get_method_bind("TextEdit", "get_autowrap_mode", 1549071663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_autowrap_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_line_wrapped : Void* = Pointer(Void).null
    def is_line_wrapped(line : Int64) : Bool
      if @@mb_is_line_wrapped.null?
        @@mb_is_line_wrapped = Bridge.get_method_bind("TextEdit", "is_line_wrapped", 1116898809_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_line_wrapped, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_line_wrap_count : Void* = Pointer(Void).null
    def get_line_wrap_count(line : Int64) : Int64
      if @@mb_get_line_wrap_count.null?
        @@mb_get_line_wrap_count = Bridge.get_method_bind("TextEdit", "get_line_wrap_count", 923996154_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_wrap_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_wrap_index_at_column : Void* = Pointer(Void).null
    def get_line_wrap_index_at_column(line : Int64, column : Int64) : Int64
      if @@mb_get_line_wrap_index_at_column.null?
        @@mb_get_line_wrap_index_at_column = Bridge.get_method_bind("TextEdit", "get_line_wrap_index_at_column", 3175239445_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_wrap_index_at_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_wrapped_text : Void* = Pointer(Void).null
    def get_line_wrapped_text(line : Int64) : Void*
      if @@mb_get_line_wrapped_text.null?
        @@mb_get_line_wrapped_text = Bridge.get_method_bind("TextEdit", "get_line_wrapped_text", 647634434_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_line_wrapped_text, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_smooth_scroll_enabled : Void* = Pointer(Void).null
    def set_smooth_scroll_enabled(enable : Bool) : Void
      if @@mb_set_smooth_scroll_enabled.null?
        @@mb_set_smooth_scroll_enabled = Bridge.get_method_bind("TextEdit", "set_smooth_scroll_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_smooth_scroll_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_smooth_scroll_enabled : Void* = Pointer(Void).null
    def is_smooth_scroll_enabled() : Bool
      if @@mb_is_smooth_scroll_enabled.null?
        @@mb_is_smooth_scroll_enabled = Bridge.get_method_bind("TextEdit", "is_smooth_scroll_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_smooth_scroll_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_v_scroll_bar : Void* = Pointer(Void).null
    def get_v_scroll_bar() : VScrollBar
      if @@mb_get_v_scroll_bar.null?
        @@mb_get_v_scroll_bar = Bridge.get_method_bind("TextEdit", "get_v_scroll_bar", 3226026593_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_v_scroll_bar, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VScrollBar.new(ret_ptr)
    end
    @@mb_get_h_scroll_bar : Void* = Pointer(Void).null
    def get_h_scroll_bar() : HScrollBar
      if @@mb_get_h_scroll_bar.null?
        @@mb_get_h_scroll_bar = Bridge.get_method_bind("TextEdit", "get_h_scroll_bar", 3774687988_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_h_scroll_bar, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      HScrollBar.new(ret_ptr)
    end
    @@mb_set_v_scroll : Void* = Pointer(Void).null
    def set_v_scroll(value : Float64) : Void
      if @@mb_set_v_scroll.null?
        @@mb_set_v_scroll = Bridge.get_method_bind("TextEdit", "set_v_scroll", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_scroll, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_scroll : Void* = Pointer(Void).null
    def get_v_scroll() : Float64
      if @@mb_get_v_scroll.null?
        @@mb_get_v_scroll = Bridge.get_method_bind("TextEdit", "get_v_scroll", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_v_scroll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_h_scroll : Void* = Pointer(Void).null
    def set_h_scroll(value : Int64) : Void
      if @@mb_set_h_scroll.null?
        @@mb_set_h_scroll = Bridge.get_method_bind("TextEdit", "set_h_scroll", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_h_scroll, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_h_scroll : Void* = Pointer(Void).null
    def get_h_scroll() : Int64
      if @@mb_get_h_scroll.null?
        @@mb_get_h_scroll = Bridge.get_method_bind("TextEdit", "get_h_scroll", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_h_scroll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_scroll_past_end_of_file_enabled : Void* = Pointer(Void).null
    def set_scroll_past_end_of_file_enabled(enable : Bool) : Void
      if @@mb_set_scroll_past_end_of_file_enabled.null?
        @@mb_set_scroll_past_end_of_file_enabled = Bridge.get_method_bind("TextEdit", "set_scroll_past_end_of_file_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_past_end_of_file_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_past_end_of_file_enabled : Void* = Pointer(Void).null
    def is_scroll_past_end_of_file_enabled() : Bool
      if @@mb_is_scroll_past_end_of_file_enabled.null?
        @@mb_is_scroll_past_end_of_file_enabled = Bridge.get_method_bind("TextEdit", "is_scroll_past_end_of_file_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_past_end_of_file_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_v_scroll_speed : Void* = Pointer(Void).null
    def set_v_scroll_speed(speed : Float64) : Void
      if @@mb_set_v_scroll_speed.null?
        @@mb_set_v_scroll_speed = Bridge.get_method_bind("TextEdit", "set_v_scroll_speed", 373806689_i64)
      end
      val_0 = speed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_scroll_speed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_scroll_speed : Void* = Pointer(Void).null
    def get_v_scroll_speed() : Float64
      if @@mb_get_v_scroll_speed.null?
        @@mb_get_v_scroll_speed = Bridge.get_method_bind("TextEdit", "get_v_scroll_speed", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_v_scroll_speed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fit_content_height_enabled : Void* = Pointer(Void).null
    def set_fit_content_height_enabled(enabled : Bool) : Void
      if @@mb_set_fit_content_height_enabled.null?
        @@mb_set_fit_content_height_enabled = Bridge.get_method_bind("TextEdit", "set_fit_content_height_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fit_content_height_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_fit_content_height_enabled : Void* = Pointer(Void).null
    def is_fit_content_height_enabled() : Bool
      if @@mb_is_fit_content_height_enabled.null?
        @@mb_is_fit_content_height_enabled = Bridge.get_method_bind("TextEdit", "is_fit_content_height_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_fit_content_height_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_fit_content_width_enabled : Void* = Pointer(Void).null
    def set_fit_content_width_enabled(enabled : Bool) : Void
      if @@mb_set_fit_content_width_enabled.null?
        @@mb_set_fit_content_width_enabled = Bridge.get_method_bind("TextEdit", "set_fit_content_width_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fit_content_width_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_fit_content_width_enabled : Void* = Pointer(Void).null
    def is_fit_content_width_enabled() : Bool
      if @@mb_is_fit_content_width_enabled.null?
        @@mb_is_fit_content_width_enabled = Bridge.get_method_bind("TextEdit", "is_fit_content_width_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_fit_content_width_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_scroll_pos_for_line : Void* = Pointer(Void).null
    def get_scroll_pos_for_line(line : Int64, wrap_index : Int64) : Float64
      if @@mb_get_scroll_pos_for_line.null?
        @@mb_get_scroll_pos_for_line = Bridge.get_method_bind("TextEdit", "get_scroll_pos_for_line", 3929084198_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = wrap_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_scroll_pos_for_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_line_as_first_visible : Void* = Pointer(Void).null
    def set_line_as_first_visible(line : Int64, wrap_index : Int64) : Void
      if @@mb_set_line_as_first_visible.null?
        @@mb_set_line_as_first_visible = Bridge.get_method_bind("TextEdit", "set_line_as_first_visible", 2230941749_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = wrap_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_line_as_first_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_first_visible_line : Void* = Pointer(Void).null
    def get_first_visible_line() : Int64
      if @@mb_get_first_visible_line.null?
        @@mb_get_first_visible_line = Bridge.get_method_bind("TextEdit", "get_first_visible_line", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_first_visible_line, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_line_in_viewport : Void* = Pointer(Void).null
    def is_line_in_viewport(line : Int64) : Bool
      if @@mb_is_line_in_viewport.null?
        @@mb_is_line_in_viewport = Bridge.get_method_bind("TextEdit", "is_line_in_viewport", 1116898809_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_line_in_viewport, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_line_as_center_visible : Void* = Pointer(Void).null
    def set_line_as_center_visible(line : Int64, wrap_index : Int64) : Void
      if @@mb_set_line_as_center_visible.null?
        @@mb_set_line_as_center_visible = Bridge.get_method_bind("TextEdit", "set_line_as_center_visible", 2230941749_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = wrap_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_line_as_center_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_line_as_last_visible : Void* = Pointer(Void).null
    def set_line_as_last_visible(line : Int64, wrap_index : Int64) : Void
      if @@mb_set_line_as_last_visible.null?
        @@mb_set_line_as_last_visible = Bridge.get_method_bind("TextEdit", "set_line_as_last_visible", 2230941749_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = wrap_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_line_as_last_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_last_full_visible_line : Void* = Pointer(Void).null
    def get_last_full_visible_line() : Int64
      if @@mb_get_last_full_visible_line.null?
        @@mb_get_last_full_visible_line = Bridge.get_method_bind("TextEdit", "get_last_full_visible_line", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_last_full_visible_line, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_last_full_visible_line_wrap_index : Void* = Pointer(Void).null
    def get_last_full_visible_line_wrap_index() : Int64
      if @@mb_get_last_full_visible_line_wrap_index.null?
        @@mb_get_last_full_visible_line_wrap_index = Bridge.get_method_bind("TextEdit", "get_last_full_visible_line_wrap_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_last_full_visible_line_wrap_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visible_line_count : Void* = Pointer(Void).null
    def get_visible_line_count() : Int64
      if @@mb_get_visible_line_count.null?
        @@mb_get_visible_line_count = Bridge.get_method_bind("TextEdit", "get_visible_line_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_line_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visible_line_count_in_range : Void* = Pointer(Void).null
    def get_visible_line_count_in_range(from_line : Int64, to_line : Int64) : Int64
      if @@mb_get_visible_line_count_in_range.null?
        @@mb_get_visible_line_count_in_range = Bridge.get_method_bind("TextEdit", "get_visible_line_count_in_range", 3175239445_i64)
      end
      val_0 = from_line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_line
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_line_count_in_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_total_visible_line_count : Void* = Pointer(Void).null
    def get_total_visible_line_count() : Int64
      if @@mb_get_total_visible_line_count.null?
        @@mb_get_total_visible_line_count = Bridge.get_method_bind("TextEdit", "get_total_visible_line_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_total_visible_line_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_adjust_viewport_to_caret : Void* = Pointer(Void).null
    def adjust_viewport_to_caret(caret_index : Int64) : Void
      if @@mb_adjust_viewport_to_caret.null?
        @@mb_adjust_viewport_to_caret = Bridge.get_method_bind("TextEdit", "adjust_viewport_to_caret", 1995695955_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_adjust_viewport_to_caret, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_center_viewport_to_caret : Void* = Pointer(Void).null
    def center_viewport_to_caret(caret_index : Int64) : Void
      if @@mb_center_viewport_to_caret.null?
        @@mb_center_viewport_to_caret = Bridge.get_method_bind("TextEdit", "center_viewport_to_caret", 1995695955_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_center_viewport_to_caret, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_draw_minimap : Void* = Pointer(Void).null
    def set_draw_minimap(enabled : Bool) : Void
      if @@mb_set_draw_minimap.null?
        @@mb_set_draw_minimap = Bridge.get_method_bind("TextEdit", "set_draw_minimap", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_minimap, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drawing_minimap : Void* = Pointer(Void).null
    def is_drawing_minimap() : Bool
      if @@mb_is_drawing_minimap.null?
        @@mb_is_drawing_minimap = Bridge.get_method_bind("TextEdit", "is_drawing_minimap", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drawing_minimap, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_minimap_width : Void* = Pointer(Void).null
    def set_minimap_width(width : Int64) : Void
      if @@mb_set_minimap_width.null?
        @@mb_set_minimap_width = Bridge.get_method_bind("TextEdit", "set_minimap_width", 1286410249_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_minimap_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_minimap_width : Void* = Pointer(Void).null
    def get_minimap_width() : Int64
      if @@mb_get_minimap_width.null?
        @@mb_get_minimap_width = Bridge.get_method_bind("TextEdit", "get_minimap_width", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_minimap_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_minimap_visible_lines : Void* = Pointer(Void).null
    def get_minimap_visible_lines() : Int64
      if @@mb_get_minimap_visible_lines.null?
        @@mb_get_minimap_visible_lines = Bridge.get_method_bind("TextEdit", "get_minimap_visible_lines", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_minimap_visible_lines, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_gutter : Void* = Pointer(Void).null
    def add_gutter(at : Int64) : Void
      if @@mb_add_gutter.null?
        @@mb_add_gutter = Bridge.get_method_bind("TextEdit", "add_gutter", 1025054187_i64)
      end
      val_0 = at
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_gutter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_gutter : Void* = Pointer(Void).null
    def remove_gutter(gutter : Int64) : Void
      if @@mb_remove_gutter.null?
        @@mb_remove_gutter = Bridge.get_method_bind("TextEdit", "remove_gutter", 1286410249_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_gutter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gutter_count : Void* = Pointer(Void).null
    def get_gutter_count() : Int64
      if @@mb_get_gutter_count.null?
        @@mb_get_gutter_count = Bridge.get_method_bind("TextEdit", "get_gutter_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_gutter_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gutter_name : Void* = Pointer(Void).null
    def set_gutter_name(gutter : Int64, name : String) : Void
      if @@mb_set_gutter_name.null?
        @@mb_set_gutter_name = Bridge.get_method_bind("TextEdit", "set_gutter_name", 501894301_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_gutter_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gutter_name : Void* = Pointer(Void).null
    def get_gutter_name(gutter : Int64) : String
      if @@mb_get_gutter_name.null?
        @@mb_get_gutter_name = Bridge.get_method_bind("TextEdit", "get_gutter_name", 844755477_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_gutter_type : Void* = Pointer(Void).null
    def set_gutter_type(gutter : Int64, get_type : Int64) : Void
      if @@mb_set_gutter_type.null?
        @@mb_set_gutter_type = Bridge.get_method_bind("TextEdit", "set_gutter_type", 1088959071_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_gutter_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gutter_type : Void* = Pointer(Void).null
    def get_gutter_type(gutter : Int64) : Int64
      if @@mb_get_gutter_type.null?
        @@mb_get_gutter_type = Bridge.get_method_bind("TextEdit", "get_gutter_type", 1159699127_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_gutter_type, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gutter_width : Void* = Pointer(Void).null
    def set_gutter_width(gutter : Int64, width : Int64) : Void
      if @@mb_set_gutter_width.null?
        @@mb_set_gutter_width = Bridge.get_method_bind("TextEdit", "set_gutter_width", 3937882851_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_gutter_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gutter_width : Void* = Pointer(Void).null
    def get_gutter_width(gutter : Int64) : Int64
      if @@mb_get_gutter_width.null?
        @@mb_get_gutter_width = Bridge.get_method_bind("TextEdit", "get_gutter_width", 923996154_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_gutter_width, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gutter_draw : Void* = Pointer(Void).null
    def set_gutter_draw(gutter : Int64, draw : Bool) : Void
      if @@mb_set_gutter_draw.null?
        @@mb_set_gutter_draw = Bridge.get_method_bind("TextEdit", "set_gutter_draw", 300928843_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = draw
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_gutter_draw, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_gutter_drawn : Void* = Pointer(Void).null
    def is_gutter_drawn(gutter : Int64) : Bool
      if @@mb_is_gutter_drawn.null?
        @@mb_is_gutter_drawn = Bridge.get_method_bind("TextEdit", "is_gutter_drawn", 1116898809_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_gutter_drawn, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_gutter_clickable : Void* = Pointer(Void).null
    def set_gutter_clickable(gutter : Int64, clickable : Bool) : Void
      if @@mb_set_gutter_clickable.null?
        @@mb_set_gutter_clickable = Bridge.get_method_bind("TextEdit", "set_gutter_clickable", 300928843_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = clickable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_gutter_clickable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_gutter_clickable : Void* = Pointer(Void).null
    def is_gutter_clickable(gutter : Int64) : Bool
      if @@mb_is_gutter_clickable.null?
        @@mb_is_gutter_clickable = Bridge.get_method_bind("TextEdit", "is_gutter_clickable", 1116898809_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_gutter_clickable, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_gutter_overwritable : Void* = Pointer(Void).null
    def set_gutter_overwritable(gutter : Int64, overwritable : Bool) : Void
      if @@mb_set_gutter_overwritable.null?
        @@mb_set_gutter_overwritable = Bridge.get_method_bind("TextEdit", "set_gutter_overwritable", 300928843_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = overwritable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_gutter_overwritable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_gutter_overwritable : Void* = Pointer(Void).null
    def is_gutter_overwritable(gutter : Int64) : Bool
      if @@mb_is_gutter_overwritable.null?
        @@mb_is_gutter_overwritable = Bridge.get_method_bind("TextEdit", "is_gutter_overwritable", 1116898809_i64)
      end
      val_0 = gutter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_gutter_overwritable, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_merge_gutters : Void* = Pointer(Void).null
    def merge_gutters(from_line : Int64, to_line : Int64) : Void
      if @@mb_merge_gutters.null?
        @@mb_merge_gutters = Bridge.get_method_bind("TextEdit", "merge_gutters", 3937882851_i64)
      end
      val_0 = from_line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_line
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_merge_gutters, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_gutter_custom_draw : Void* = Pointer(Void).null
    def set_gutter_custom_draw(column : Int64, draw_callback : Void*) : Void
      if @@mb_set_gutter_custom_draw.null?
        @@mb_set_gutter_custom_draw = Bridge.get_method_bind("TextEdit", "set_gutter_custom_draw", 957362965_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = draw_callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_gutter_custom_draw, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_total_gutter_width : Void* = Pointer(Void).null
    def get_total_gutter_width() : Int64
      if @@mb_get_total_gutter_width.null?
        @@mb_get_total_gutter_width = Bridge.get_method_bind("TextEdit", "get_total_gutter_width", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_total_gutter_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_line_gutter_metadata : Void* = Pointer(Void).null
    def set_line_gutter_metadata(line : Int64, gutter : Int64, metadata : Void*) : Void
      if @@mb_set_line_gutter_metadata.null?
        @@mb_set_line_gutter_metadata = Bridge.get_method_bind("TextEdit", "set_line_gutter_metadata", 2060538656_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = metadata
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_line_gutter_metadata, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_line_gutter_metadata : Void* = Pointer(Void).null
    def get_line_gutter_metadata(line : Int64, gutter : Int64) : Void*
      if @@mb_get_line_gutter_metadata.null?
        @@mb_get_line_gutter_metadata = Bridge.get_method_bind("TextEdit", "get_line_gutter_metadata", 678354945_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_line_gutter_metadata, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_line_gutter_text : Void* = Pointer(Void).null
    def set_line_gutter_text(line : Int64, gutter : Int64, text : String) : Void
      if @@mb_set_line_gutter_text.null?
        @@mb_set_line_gutter_text = Bridge.get_method_bind("TextEdit", "set_line_gutter_text", 2285447957_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = text
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_line_gutter_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_line_gutter_text : Void* = Pointer(Void).null
    def get_line_gutter_text(line : Int64, gutter : Int64) : String
      if @@mb_get_line_gutter_text.null?
        @@mb_get_line_gutter_text = Bridge.get_method_bind("TextEdit", "get_line_gutter_text", 1391810591_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_set_line_gutter_icon : Void* = Pointer(Void).null
    def set_line_gutter_icon(line : Int64, gutter : Int64, icon : Texture2D) : Void
      if @@mb_set_line_gutter_icon.null?
        @@mb_set_line_gutter_icon = Bridge.get_method_bind("TextEdit", "set_line_gutter_icon", 176101966_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = icon
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_line_gutter_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_line_gutter_icon : Void* = Pointer(Void).null
    def get_line_gutter_icon(line : Int64, gutter : Int64) : Texture2D
      if @@mb_get_line_gutter_icon.null?
        @@mb_get_line_gutter_icon = Bridge.get_method_bind("TextEdit", "get_line_gutter_icon", 2584904275_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_line_gutter_icon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_line_gutter_item_color : Void* = Pointer(Void).null
    def set_line_gutter_item_color(line : Int64, gutter : Int64, color : Color) : Void
      if @@mb_set_line_gutter_item_color.null?
        @@mb_set_line_gutter_item_color = Bridge.get_method_bind("TextEdit", "set_line_gutter_item_color", 3733378741_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = color
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_line_gutter_item_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_line_gutter_item_color : Void* = Pointer(Void).null
    def get_line_gutter_item_color(line : Int64, gutter : Int64) : Color
      if @@mb_get_line_gutter_item_color.null?
        @@mb_get_line_gutter_item_color = Bridge.get_method_bind("TextEdit", "get_line_gutter_item_color", 2165839948_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Color.new
      Bridge.ptrcall(@@mb_get_line_gutter_item_color, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_line_gutter_clickable : Void* = Pointer(Void).null
    def set_line_gutter_clickable(line : Int64, gutter : Int64, clickable : Bool) : Void
      if @@mb_set_line_gutter_clickable.null?
        @@mb_set_line_gutter_clickable = Bridge.get_method_bind("TextEdit", "set_line_gutter_clickable", 1383440665_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = clickable
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_line_gutter_clickable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_line_gutter_clickable : Void* = Pointer(Void).null
    def is_line_gutter_clickable(line : Int64, gutter : Int64) : Bool
      if @@mb_is_line_gutter_clickable.null?
        @@mb_is_line_gutter_clickable = Bridge.get_method_bind("TextEdit", "is_line_gutter_clickable", 2522259332_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gutter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_line_gutter_clickable, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_line_background_color : Void* = Pointer(Void).null
    def set_line_background_color(line : Int64, color : Color) : Void
      if @@mb_set_line_background_color.null?
        @@mb_set_line_background_color = Bridge.get_method_bind("TextEdit", "set_line_background_color", 2878471219_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_line_background_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_line_background_color : Void* = Pointer(Void).null
    def get_line_background_color(line : Int64) : Color
      if @@mb_get_line_background_color.null?
        @@mb_get_line_background_color = Bridge.get_method_bind("TextEdit", "get_line_background_color", 3457211756_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Color.new
      Bridge.ptrcall(@@mb_get_line_background_color, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_syntax_highlighter : Void* = Pointer(Void).null
    def set_syntax_highlighter(syntax_highlighter : SyntaxHighlighter) : Void
      if @@mb_set_syntax_highlighter.null?
        @@mb_set_syntax_highlighter = Bridge.get_method_bind("TextEdit", "set_syntax_highlighter", 2765644541_i64)
      end
      val_0 = syntax_highlighter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_syntax_highlighter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_syntax_highlighter : Void* = Pointer(Void).null
    def get_syntax_highlighter() : SyntaxHighlighter
      if @@mb_get_syntax_highlighter.null?
        @@mb_get_syntax_highlighter = Bridge.get_method_bind("TextEdit", "get_syntax_highlighter", 2721131626_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_syntax_highlighter, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      SyntaxHighlighter.new(ret_ptr)
    end
    @@mb_set_highlight_current_line : Void* = Pointer(Void).null
    def set_highlight_current_line(enabled : Bool) : Void
      if @@mb_set_highlight_current_line.null?
        @@mb_set_highlight_current_line = Bridge.get_method_bind("TextEdit", "set_highlight_current_line", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_highlight_current_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_highlight_current_line_enabled : Void* = Pointer(Void).null
    def is_highlight_current_line_enabled() : Bool
      if @@mb_is_highlight_current_line_enabled.null?
        @@mb_is_highlight_current_line_enabled = Bridge.get_method_bind("TextEdit", "is_highlight_current_line_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_highlight_current_line_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_highlight_all_occurrences : Void* = Pointer(Void).null
    def set_highlight_all_occurrences(enabled : Bool) : Void
      if @@mb_set_highlight_all_occurrences.null?
        @@mb_set_highlight_all_occurrences = Bridge.get_method_bind("TextEdit", "set_highlight_all_occurrences", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_highlight_all_occurrences, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_highlight_all_occurrences_enabled : Void* = Pointer(Void).null
    def is_highlight_all_occurrences_enabled() : Bool
      if @@mb_is_highlight_all_occurrences_enabled.null?
        @@mb_is_highlight_all_occurrences_enabled = Bridge.get_method_bind("TextEdit", "is_highlight_all_occurrences_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_highlight_all_occurrences_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_draw_control_chars : Void* = Pointer(Void).null
    def get_draw_control_chars() : Bool
      if @@mb_get_draw_control_chars.null?
        @@mb_get_draw_control_chars = Bridge.get_method_bind("TextEdit", "get_draw_control_chars", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_draw_control_chars, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_draw_control_chars : Void* = Pointer(Void).null
    def set_draw_control_chars(enabled : Bool) : Void
      if @@mb_set_draw_control_chars.null?
        @@mb_set_draw_control_chars = Bridge.get_method_bind("TextEdit", "set_draw_control_chars", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_control_chars, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_draw_tabs : Void* = Pointer(Void).null
    def set_draw_tabs(enabled : Bool) : Void
      if @@mb_set_draw_tabs.null?
        @@mb_set_draw_tabs = Bridge.get_method_bind("TextEdit", "set_draw_tabs", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_tabs, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drawing_tabs : Void* = Pointer(Void).null
    def is_drawing_tabs() : Bool
      if @@mb_is_drawing_tabs.null?
        @@mb_is_drawing_tabs = Bridge.get_method_bind("TextEdit", "is_drawing_tabs", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drawing_tabs, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_draw_spaces : Void* = Pointer(Void).null
    def set_draw_spaces(enabled : Bool) : Void
      if @@mb_set_draw_spaces.null?
        @@mb_set_draw_spaces = Bridge.get_method_bind("TextEdit", "set_draw_spaces", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_spaces, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drawing_spaces : Void* = Pointer(Void).null
    def is_drawing_spaces() : Bool
      if @@mb_is_drawing_spaces.null?
        @@mb_is_drawing_spaces = Bridge.get_method_bind("TextEdit", "is_drawing_spaces", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drawing_spaces, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_menu : Void* = Pointer(Void).null
    def get_menu() : PopupMenu
      if @@mb_get_menu.null?
        @@mb_get_menu = Bridge.get_method_bind("TextEdit", "get_menu", 229722558_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_menu, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PopupMenu.new(ret_ptr)
    end
    @@mb_is_menu_visible : Void* = Pointer(Void).null
    def is_menu_visible() : Bool
      if @@mb_is_menu_visible.null?
        @@mb_is_menu_visible = Bridge.get_method_bind("TextEdit", "is_menu_visible", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_menu_visible, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_menu_option : Void* = Pointer(Void).null
    def menu_option(option : Int64) : Void
      if @@mb_menu_option.null?
        @@mb_menu_option = Bridge.get_method_bind("TextEdit", "menu_option", 1286410249_i64)
      end
      val_0 = option
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_menu_option, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_adjust_carets_after_edit : Void* = Pointer(Void).null
    def adjust_carets_after_edit(caret : Int64, from_line : Int64, from_col : Int64, to_line : Int64, to_col : Int64) : Void
      if @@mb_adjust_carets_after_edit.null?
        @@mb_adjust_carets_after_edit = Bridge.get_method_bind("TextEdit", "adjust_carets_after_edit", 1770277138_i64)
      end
      val_0 = caret
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_line
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_col
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_line
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = to_col
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_adjust_carets_after_edit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caret_index_edit_order : Void* = Pointer(Void).null
    def get_caret_index_edit_order() : Void*
      if @@mb_get_caret_index_edit_order.null?
        @@mb_get_caret_index_edit_order = Bridge.get_method_bind("TextEdit", "get_caret_index_edit_order", 969006518_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_caret_index_edit_order, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_selection_line : Void* = Pointer(Void).null
    def get_selection_line(caret_index : Int64) : Int64
      if @@mb_get_selection_line.null?
        @@mb_get_selection_line = Bridge.get_method_bind("TextEdit", "get_selection_line", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_column : Void* = Pointer(Void).null
    def get_selection_column(caret_index : Int64) : Int64
      if @@mb_get_selection_column.null?
        @@mb_get_selection_column = Bridge.get_method_bind("TextEdit", "get_selection_column", 1591665591_i64)
      end
      val_0 = caret_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  class ColorRect < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_color : Void* = Pointer(Void).null
    def set_color(color : Color) : Void
      if @@mb_set_color.null?
        @@mb_set_color = Bridge.get_method_bind("ColorRect", "set_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color : Void* = Pointer(Void).null
    def get_color() : Color
      if @@mb_get_color.null?
        @@mb_get_color = Bridge.get_method_bind("ColorRect", "get_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class ScrollContainer < Godot::Container
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ScrollMode : Int64
      ScrollModeDisabled = 0_i64
      ScrollModeAuto = 1_i64
      ScrollModeShowAlways = 2_i64
      ScrollModeShowNever = 3_i64
      ScrollModeReserve = 4_i64
      ScrollModeMaximizeFirst = 5_i64
    end
    enum ScrollHintMode : Int64
      ScrollHintModeDisabled = 0_i64
      ScrollHintModeAll = 1_i64
      ScrollHintModeTopAndLeft = 2_i64
      ScrollHintModeBottomAndRight = 3_i64
    end
    @@mb_set_h_scroll : Void* = Pointer(Void).null
    def set_h_scroll(value : Int64) : Void
      if @@mb_set_h_scroll.null?
        @@mb_set_h_scroll = Bridge.get_method_bind("ScrollContainer", "set_h_scroll", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_h_scroll, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_h_scroll : Void* = Pointer(Void).null
    def get_h_scroll() : Int64
      if @@mb_get_h_scroll.null?
        @@mb_get_h_scroll = Bridge.get_method_bind("ScrollContainer", "get_h_scroll", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_h_scroll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_v_scroll : Void* = Pointer(Void).null
    def set_v_scroll(value : Int64) : Void
      if @@mb_set_v_scroll.null?
        @@mb_set_v_scroll = Bridge.get_method_bind("ScrollContainer", "set_v_scroll", 1286410249_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_scroll, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_scroll : Void* = Pointer(Void).null
    def get_v_scroll() : Int64
      if @@mb_get_v_scroll.null?
        @@mb_get_v_scroll = Bridge.get_method_bind("ScrollContainer", "get_v_scroll", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_v_scroll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_horizontal_custom_step : Void* = Pointer(Void).null
    def set_horizontal_custom_step(value : Float64) : Void
      if @@mb_set_horizontal_custom_step.null?
        @@mb_set_horizontal_custom_step = Bridge.get_method_bind("ScrollContainer", "set_horizontal_custom_step", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_horizontal_custom_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_horizontal_custom_step : Void* = Pointer(Void).null
    def get_horizontal_custom_step() : Float64
      if @@mb_get_horizontal_custom_step.null?
        @@mb_get_horizontal_custom_step = Bridge.get_method_bind("ScrollContainer", "get_horizontal_custom_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_horizontal_custom_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vertical_custom_step : Void* = Pointer(Void).null
    def set_vertical_custom_step(value : Float64) : Void
      if @@mb_set_vertical_custom_step.null?
        @@mb_set_vertical_custom_step = Bridge.get_method_bind("ScrollContainer", "set_vertical_custom_step", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertical_custom_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vertical_custom_step : Void* = Pointer(Void).null
    def get_vertical_custom_step() : Float64
      if @@mb_get_vertical_custom_step.null?
        @@mb_get_vertical_custom_step = Bridge.get_method_bind("ScrollContainer", "get_vertical_custom_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_vertical_custom_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_horizontal_scroll_mode : Void* = Pointer(Void).null
    def set_horizontal_scroll_mode(enable : Int64) : Void
      if @@mb_set_horizontal_scroll_mode.null?
        @@mb_set_horizontal_scroll_mode = Bridge.get_method_bind("ScrollContainer", "set_horizontal_scroll_mode", 2750506364_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_horizontal_scroll_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_horizontal_scroll_mode : Void* = Pointer(Void).null
    def get_horizontal_scroll_mode() : Int64
      if @@mb_get_horizontal_scroll_mode.null?
        @@mb_get_horizontal_scroll_mode = Bridge.get_method_bind("ScrollContainer", "get_horizontal_scroll_mode", 3987985145_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_horizontal_scroll_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vertical_scroll_mode : Void* = Pointer(Void).null
    def set_vertical_scroll_mode(enable : Int64) : Void
      if @@mb_set_vertical_scroll_mode.null?
        @@mb_set_vertical_scroll_mode = Bridge.get_method_bind("ScrollContainer", "set_vertical_scroll_mode", 2750506364_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertical_scroll_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vertical_scroll_mode : Void* = Pointer(Void).null
    def get_vertical_scroll_mode() : Int64
      if @@mb_get_vertical_scroll_mode.null?
        @@mb_get_vertical_scroll_mode = Bridge.get_method_bind("ScrollContainer", "get_vertical_scroll_mode", 3987985145_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_vertical_scroll_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_scroll_horizontal_by_default : Void* = Pointer(Void).null
    def set_scroll_horizontal_by_default(enable : Bool) : Void
      if @@mb_set_scroll_horizontal_by_default.null?
        @@mb_set_scroll_horizontal_by_default = Bridge.get_method_bind("ScrollContainer", "set_scroll_horizontal_by_default", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_horizontal_by_default, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_horizontal_by_default : Void* = Pointer(Void).null
    def is_scroll_horizontal_by_default() : Bool
      if @@mb_is_scroll_horizontal_by_default.null?
        @@mb_is_scroll_horizontal_by_default = Bridge.get_method_bind("ScrollContainer", "is_scroll_horizontal_by_default", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_horizontal_by_default, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_deadzone : Void* = Pointer(Void).null
    def set_deadzone(deadzone : Int64) : Void
      if @@mb_set_deadzone.null?
        @@mb_set_deadzone = Bridge.get_method_bind("ScrollContainer", "set_deadzone", 1286410249_i64)
      end
      val_0 = deadzone
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deadzone, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_deadzone : Void* = Pointer(Void).null
    def get_deadzone() : Int64
      if @@mb_get_deadzone.null?
        @@mb_get_deadzone = Bridge.get_method_bind("ScrollContainer", "get_deadzone", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_deadzone, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_scroll_hint_mode : Void* = Pointer(Void).null
    def set_scroll_hint_mode(scroll_hint_mode : Int64) : Void
      if @@mb_set_scroll_hint_mode.null?
        @@mb_set_scroll_hint_mode = Bridge.get_method_bind("ScrollContainer", "set_scroll_hint_mode", 578158943_i64)
      end
      val_0 = scroll_hint_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_hint_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scroll_hint_mode : Void* = Pointer(Void).null
    def get_scroll_hint_mode() : Int64
      if @@mb_get_scroll_hint_mode.null?
        @@mb_get_scroll_hint_mode = Bridge.get_method_bind("ScrollContainer", "get_scroll_hint_mode", 246835423_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_scroll_hint_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tile_scroll_hint : Void* = Pointer(Void).null
    def set_tile_scroll_hint(tile_scroll_hint : Bool) : Void
      if @@mb_set_tile_scroll_hint.null?
        @@mb_set_tile_scroll_hint = Bridge.get_method_bind("ScrollContainer", "set_tile_scroll_hint", 2586408642_i64)
      end
      val_0 = tile_scroll_hint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tile_scroll_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_hint_tiled : Void* = Pointer(Void).null
    def is_scroll_hint_tiled() : Bool
      if @@mb_is_scroll_hint_tiled.null?
        @@mb_is_scroll_hint_tiled = Bridge.get_method_bind("ScrollContainer", "is_scroll_hint_tiled", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_hint_tiled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_follow_focus : Void* = Pointer(Void).null
    def set_follow_focus(enabled : Bool) : Void
      if @@mb_set_follow_focus.null?
        @@mb_set_follow_focus = Bridge.get_method_bind("ScrollContainer", "set_follow_focus", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_follow_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_following_focus : Void* = Pointer(Void).null
    def is_following_focus() : Bool
      if @@mb_is_following_focus.null?
        @@mb_is_following_focus = Bridge.get_method_bind("ScrollContainer", "is_following_focus", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_following_focus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_h_scroll_bar : Void* = Pointer(Void).null
    def get_h_scroll_bar() : HScrollBar
      if @@mb_get_h_scroll_bar.null?
        @@mb_get_h_scroll_bar = Bridge.get_method_bind("ScrollContainer", "get_h_scroll_bar", 4004517983_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_h_scroll_bar, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      HScrollBar.new(ret_ptr)
    end
    @@mb_get_v_scroll_bar : Void* = Pointer(Void).null
    def get_v_scroll_bar() : VScrollBar
      if @@mb_get_v_scroll_bar.null?
        @@mb_get_v_scroll_bar = Bridge.get_method_bind("ScrollContainer", "get_v_scroll_bar", 2630340773_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_v_scroll_bar, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VScrollBar.new(ret_ptr)
    end
    @@mb_ensure_control_visible : Void* = Pointer(Void).null
    def ensure_control_visible(control : Control) : Void
      if @@mb_ensure_control_visible.null?
        @@mb_ensure_control_visible = Bridge.get_method_bind("ScrollContainer", "ensure_control_visible", 1496901182_i64)
      end
      val_0 = control
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_ensure_control_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_draw_focus_border : Void* = Pointer(Void).null
    def set_draw_focus_border(draw : Bool) : Void
      if @@mb_set_draw_focus_border.null?
        @@mb_set_draw_focus_border = Bridge.get_method_bind("ScrollContainer", "set_draw_focus_border", 2586408642_i64)
      end
      val_0 = draw
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_focus_border, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_draw_focus_border : Void* = Pointer(Void).null
    def get_draw_focus_border() : Bool
      if @@mb_get_draw_focus_border.null?
        @@mb_get_draw_focus_border = Bridge.get_method_bind("ScrollContainer", "get_draw_focus_border", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_draw_focus_border, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class Range < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_value : Void* = Pointer(Void).null
    def get_value() : Float64
      if @@mb_get_value.null?
        @@mb_get_value = Bridge.get_method_bind("Range", "get_value", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_value, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_min : Void* = Pointer(Void).null
    def get_min() : Float64
      if @@mb_get_min.null?
        @@mb_get_min = Bridge.get_method_bind("Range", "get_min", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_min, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_max : Void* = Pointer(Void).null
    def get_max() : Float64
      if @@mb_get_max.null?
        @@mb_get_max = Bridge.get_method_bind("Range", "get_max", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_max, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_step : Void* = Pointer(Void).null
    def get_step() : Float64
      if @@mb_get_step.null?
        @@mb_get_step = Bridge.get_method_bind("Range", "get_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_page : Void* = Pointer(Void).null
    def get_page() : Float64
      if @@mb_get_page.null?
        @@mb_get_page = Bridge.get_method_bind("Range", "get_page", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_page, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_as_ratio : Void* = Pointer(Void).null
    def get_as_ratio() : Float64
      if @@mb_get_as_ratio.null?
        @@mb_get_as_ratio = Bridge.get_method_bind("Range", "get_as_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_as_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_value : Void* = Pointer(Void).null
    def set_value(value : Float64) : Void
      if @@mb_set_value.null?
        @@mb_set_value = Bridge.get_method_bind("Range", "set_value", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_value_no_signal : Void* = Pointer(Void).null
    def set_value_no_signal(value : Float64) : Void
      if @@mb_set_value_no_signal.null?
        @@mb_set_value_no_signal = Bridge.get_method_bind("Range", "set_value_no_signal", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_value_no_signal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_min : Void* = Pointer(Void).null
    def set_min(minimum : Float64) : Void
      if @@mb_set_min.null?
        @@mb_set_min = Bridge.get_method_bind("Range", "set_min", 373806689_i64)
      end
      val_0 = minimum
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_max : Void* = Pointer(Void).null
    def set_max(maximum : Float64) : Void
      if @@mb_set_max.null?
        @@mb_set_max = Bridge.get_method_bind("Range", "set_max", 373806689_i64)
      end
      val_0 = maximum
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_step : Void* = Pointer(Void).null
    def set_step(step : Float64) : Void
      if @@mb_set_step.null?
        @@mb_set_step = Bridge.get_method_bind("Range", "set_step", 373806689_i64)
      end
      val_0 = step
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_page : Void* = Pointer(Void).null
    def set_page(pagesize : Float64) : Void
      if @@mb_set_page.null?
        @@mb_set_page = Bridge.get_method_bind("Range", "set_page", 373806689_i64)
      end
      val_0 = pagesize
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_page, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_as_ratio : Void* = Pointer(Void).null
    def set_as_ratio(value : Float64) : Void
      if @@mb_set_as_ratio.null?
        @@mb_set_as_ratio = Bridge.get_method_bind("Range", "set_as_ratio", 373806689_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_as_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_use_rounded_values : Void* = Pointer(Void).null
    def set_use_rounded_values(enabled : Bool) : Void
      if @@mb_set_use_rounded_values.null?
        @@mb_set_use_rounded_values = Bridge.get_method_bind("Range", "set_use_rounded_values", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_rounded_values, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_using_rounded_values : Void* = Pointer(Void).null
    def is_using_rounded_values() : Bool
      if @@mb_is_using_rounded_values.null?
        @@mb_is_using_rounded_values = Bridge.get_method_bind("Range", "is_using_rounded_values", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_using_rounded_values, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_exp_ratio : Void* = Pointer(Void).null
    def set_exp_ratio(enabled : Bool) : Void
      if @@mb_set_exp_ratio.null?
        @@mb_set_exp_ratio = Bridge.get_method_bind("Range", "set_exp_ratio", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exp_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_ratio_exp : Void* = Pointer(Void).null
    def is_ratio_exp() : Bool
      if @@mb_is_ratio_exp.null?
        @@mb_is_ratio_exp = Bridge.get_method_bind("Range", "is_ratio_exp", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_ratio_exp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_allow_greater : Void* = Pointer(Void).null
    def set_allow_greater(allow : Bool) : Void
      if @@mb_set_allow_greater.null?
        @@mb_set_allow_greater = Bridge.get_method_bind("Range", "set_allow_greater", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_greater, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_greater_allowed : Void* = Pointer(Void).null
    def is_greater_allowed() : Bool
      if @@mb_is_greater_allowed.null?
        @@mb_is_greater_allowed = Bridge.get_method_bind("Range", "is_greater_allowed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_greater_allowed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_allow_lesser : Void* = Pointer(Void).null
    def set_allow_lesser(allow : Bool) : Void
      if @@mb_set_allow_lesser.null?
        @@mb_set_allow_lesser = Bridge.get_method_bind("Range", "set_allow_lesser", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_lesser, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_lesser_allowed : Void* = Pointer(Void).null
    def is_lesser_allowed() : Bool
      if @@mb_is_lesser_allowed.null?
        @@mb_is_lesser_allowed = Bridge.get_method_bind("Range", "is_lesser_allowed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_lesser_allowed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_share : Void* = Pointer(Void).null
    def share(with : Node) : Void
      if @@mb_share.null?
        @@mb_share = Bridge.get_method_bind("Range", "share", 1078189570_i64)
      end
      arg_ptr_0 = with ? with.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_share, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_unshare : Void* = Pointer(Void).null
    def unshare() : Void
      if @@mb_unshare.null?
        @@mb_unshare = Bridge.get_method_bind("Range", "unshare", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_unshare, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
  end
  class EditorSpinSlider < Godot::Range
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ControlState : Int64
      ControlStateDefault = 0_i64
      ControlStatePreferSlider = 1_i64
      ControlStateHide = 2_i64
    end
    @@mb_set_label : Void* = Pointer(Void).null
    def set_label(label : String) : Void
      if @@mb_set_label.null?
        @@mb_set_label = Bridge.get_method_bind("EditorSpinSlider", "set_label", 83702148_i64)
      end
      val_0 = label
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_label, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_label : Void* = Pointer(Void).null
    def get_label() : String
      if @@mb_get_label.null?
        @@mb_get_label = Bridge.get_method_bind("EditorSpinSlider", "get_label", 201670096_i64)
      end
      ""
    end
    @@mb_set_suffix : Void* = Pointer(Void).null
    def set_suffix(suffix : String) : Void
      if @@mb_set_suffix.null?
        @@mb_set_suffix = Bridge.get_method_bind("EditorSpinSlider", "set_suffix", 83702148_i64)
      end
      val_0 = suffix
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_suffix, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_suffix : Void* = Pointer(Void).null
    def get_suffix() : String
      if @@mb_get_suffix.null?
        @@mb_get_suffix = Bridge.get_method_bind("EditorSpinSlider", "get_suffix", 201670096_i64)
      end
      ""
    end
    @@mb_set_read_only : Void* = Pointer(Void).null
    def set_read_only(read_only : Bool) : Void
      if @@mb_set_read_only.null?
        @@mb_set_read_only = Bridge.get_method_bind("EditorSpinSlider", "set_read_only", 2586408642_i64)
      end
      val_0 = read_only
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_read_only, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_read_only : Void* = Pointer(Void).null
    def is_read_only() : Bool
      if @@mb_is_read_only.null?
        @@mb_is_read_only = Bridge.get_method_bind("EditorSpinSlider", "is_read_only", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_read_only, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_flat : Void* = Pointer(Void).null
    def set_flat(flat : Bool) : Void
      if @@mb_set_flat.null?
        @@mb_set_flat = Bridge.get_method_bind("EditorSpinSlider", "set_flat", 2586408642_i64)
      end
      val_0 = flat
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flat : Void* = Pointer(Void).null
    def is_flat() : Bool
      if @@mb_is_flat.null?
        @@mb_is_flat = Bridge.get_method_bind("EditorSpinSlider", "is_flat", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flat, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_control_state : Void* = Pointer(Void).null
    def set_control_state(state : Int64) : Void
      if @@mb_set_control_state.null?
        @@mb_set_control_state = Bridge.get_method_bind("EditorSpinSlider", "set_control_state", 1324557109_i64)
      end
      val_0 = state
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_control_state, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_control_state : Void* = Pointer(Void).null
    def get_control_state() : Int64
      if @@mb_get_control_state.null?
        @@mb_get_control_state = Bridge.get_method_bind("EditorSpinSlider", "get_control_state", 3406006200_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_control_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hide_slider : Void* = Pointer(Void).null
    def set_hide_slider(hide_slider : Bool) : Void
      if @@mb_set_hide_slider.null?
        @@mb_set_hide_slider = Bridge.get_method_bind("EditorSpinSlider", "set_hide_slider", 2586408642_i64)
      end
      val_0 = hide_slider
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hide_slider, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_hiding_slider : Void* = Pointer(Void).null
    def is_hiding_slider() : Bool
      if @@mb_is_hiding_slider.null?
        @@mb_is_hiding_slider = Bridge.get_method_bind("EditorSpinSlider", "is_hiding_slider", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_hiding_slider, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_editing_integer : Void* = Pointer(Void).null
    def set_editing_integer(editing_integer : Bool) : Void
      if @@mb_set_editing_integer.null?
        @@mb_set_editing_integer = Bridge.get_method_bind("EditorSpinSlider", "set_editing_integer", 2586408642_i64)
      end
      val_0 = editing_integer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editing_integer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editing_integer : Void* = Pointer(Void).null
    def is_editing_integer() : Bool
      if @@mb_is_editing_integer.null?
        @@mb_is_editing_integer = Bridge.get_method_bind("EditorSpinSlider", "is_editing_integer", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editing_integer, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_deferred_drag_mode_enabled : Void* = Pointer(Void).null
    def set_deferred_drag_mode_enabled(enabled : Bool) : Void
      if @@mb_set_deferred_drag_mode_enabled.null?
        @@mb_set_deferred_drag_mode_enabled = Bridge.get_method_bind("EditorSpinSlider", "set_deferred_drag_mode_enabled", 3216645846_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deferred_drag_mode_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_deferred_drag_mode_enabled : Void* = Pointer(Void).null
    def is_deferred_drag_mode_enabled() : Bool
      if @@mb_is_deferred_drag_mode_enabled.null?
        @@mb_is_deferred_drag_mode_enabled = Bridge.get_method_bind("EditorSpinSlider", "is_deferred_drag_mode_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_deferred_drag_mode_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class GraphEdit < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum PanningScheme : Int64
      ScrollZooms = 0_i64
      ScrollPans = 1_i64
    end
    enum GridPattern : Int64
      GridPatternLines = 0_i64
      GridPatternDots = 1_i64
    end
    @@mb_connect_node : Void* = Pointer(Void).null
    def connect_node(from_node : String, from_port : Int64, to_node : String, to_port : Int64, keep_alive : Bool) : Int64
      if @@mb_connect_node.null?
        @@mb_connect_node = Bridge.get_method_bind("GraphEdit", "connect_node", 1376144231_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = keep_alive
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_connect_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_node_connected : Void* = Pointer(Void).null
    def is_node_connected(from_node : String, from_port : Int64, to_node : String, to_port : Int64) : Bool
      if @@mb_is_node_connected.null?
        @@mb_is_node_connected = Bridge.get_method_bind("GraphEdit", "is_node_connected", 4216241294_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_node_connected, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_disconnect_node : Void* = Pointer(Void).null
    def disconnect_node(from_node : String, from_port : Int64, to_node : String, to_port : Int64) : Void
      if @@mb_disconnect_node.null?
        @@mb_disconnect_node = Bridge.get_method_bind("GraphEdit", "disconnect_node", 1933654315_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_disconnect_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_connection_activity : Void* = Pointer(Void).null
    def set_connection_activity(from_node : String, from_port : Int64, to_node : String, to_port : Int64, amount : Float64) : Void
      if @@mb_set_connection_activity.null?
        @@mb_set_connection_activity = Bridge.get_method_bind("GraphEdit", "set_connection_activity", 1141899943_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to_node
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_port
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = amount
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_set_connection_activity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_connections : Void* = Pointer(Void).null
    def set_connections(connections : Godot::Array) : Void
      if @@mb_set_connections.null?
        @@mb_set_connections = Bridge.get_method_bind("GraphEdit", "set_connections", 381264803_i64)
      end
      arg_ptr_0 = connections ? connections.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_connections, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_connection_list : Void* = Pointer(Void).null
    def get_connection_list() : Godot::Array
      if @@mb_get_connection_list.null?
        @@mb_get_connection_list = Bridge.get_method_bind("GraphEdit", "get_connection_list", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_connection_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_connection_count : Void* = Pointer(Void).null
    def get_connection_count(from_node : String, from_port : Int64) : Int64
      if @@mb_get_connection_count.null?
        @@mb_get_connection_count = Bridge.get_method_bind("GraphEdit", "get_connection_count", 861718734_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from_port
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_connection_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_closest_connection_at_point : Void* = Pointer(Void).null
    def get_closest_connection_at_point(point : Vector2, max_distance : Float64) : Void*
      if @@mb_get_closest_connection_at_point.null?
        @@mb_get_closest_connection_at_point = Bridge.get_method_bind("GraphEdit", "get_closest_connection_at_point", 453879819_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = max_distance
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_closest_connection_at_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_connection_list_from_node : Void* = Pointer(Void).null
    def get_connection_list_from_node(node : String) : Godot::Array
      if @@mb_get_connection_list_from_node.null?
        @@mb_get_connection_list_from_node = Bridge.get_method_bind("GraphEdit", "get_connection_list_from_node", 3147814860_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_connection_list_from_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_connections_intersecting_with_rect : Void* = Pointer(Void).null
    def get_connections_intersecting_with_rect(rect : Rect2) : Godot::Array
      if @@mb_get_connections_intersecting_with_rect.null?
        @@mb_get_connections_intersecting_with_rect = Bridge.get_method_bind("GraphEdit", "get_connections_intersecting_with_rect", 2709748719_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_connections_intersecting_with_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_clear_connections : Void* = Pointer(Void).null
    def clear_connections() : Void
      if @@mb_clear_connections.null?
        @@mb_clear_connections = Bridge.get_method_bind("GraphEdit", "clear_connections", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_connections, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_force_connection_drag_end : Void* = Pointer(Void).null
    def force_connection_drag_end() : Void
      if @@mb_force_connection_drag_end.null?
        @@mb_force_connection_drag_end = Bridge.get_method_bind("GraphEdit", "force_connection_drag_end", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_connection_drag_end, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_scroll_offset : Void* = Pointer(Void).null
    def get_scroll_offset() : Vector2
      if @@mb_get_scroll_offset.null?
        @@mb_get_scroll_offset = Bridge.get_method_bind("GraphEdit", "get_scroll_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_scroll_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_scroll_offset : Void* = Pointer(Void).null
    def set_scroll_offset(offset : Vector2) : Void
      if @@mb_set_scroll_offset.null?
        @@mb_set_scroll_offset = Bridge.get_method_bind("GraphEdit", "set_scroll_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_valid_right_disconnect_type : Void* = Pointer(Void).null
    def add_valid_right_disconnect_type(get_type : Int64) : Void
      if @@mb_add_valid_right_disconnect_type.null?
        @@mb_add_valid_right_disconnect_type = Bridge.get_method_bind("GraphEdit", "add_valid_right_disconnect_type", 1286410249_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_valid_right_disconnect_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_valid_right_disconnect_type : Void* = Pointer(Void).null
    def remove_valid_right_disconnect_type(get_type : Int64) : Void
      if @@mb_remove_valid_right_disconnect_type.null?
        @@mb_remove_valid_right_disconnect_type = Bridge.get_method_bind("GraphEdit", "remove_valid_right_disconnect_type", 1286410249_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_valid_right_disconnect_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_valid_left_disconnect_type : Void* = Pointer(Void).null
    def add_valid_left_disconnect_type(get_type : Int64) : Void
      if @@mb_add_valid_left_disconnect_type.null?
        @@mb_add_valid_left_disconnect_type = Bridge.get_method_bind("GraphEdit", "add_valid_left_disconnect_type", 1286410249_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_valid_left_disconnect_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_valid_left_disconnect_type : Void* = Pointer(Void).null
    def remove_valid_left_disconnect_type(get_type : Int64) : Void
      if @@mb_remove_valid_left_disconnect_type.null?
        @@mb_remove_valid_left_disconnect_type = Bridge.get_method_bind("GraphEdit", "remove_valid_left_disconnect_type", 1286410249_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_valid_left_disconnect_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_valid_connection_type : Void* = Pointer(Void).null
    def add_valid_connection_type(from_type : Int64, to_type : Int64) : Void
      if @@mb_add_valid_connection_type.null?
        @@mb_add_valid_connection_type = Bridge.get_method_bind("GraphEdit", "add_valid_connection_type", 3937882851_i64)
      end
      val_0 = from_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_valid_connection_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_valid_connection_type : Void* = Pointer(Void).null
    def remove_valid_connection_type(from_type : Int64, to_type : Int64) : Void
      if @@mb_remove_valid_connection_type.null?
        @@mb_remove_valid_connection_type = Bridge.get_method_bind("GraphEdit", "remove_valid_connection_type", 3937882851_i64)
      end
      val_0 = from_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_remove_valid_connection_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_valid_connection_type : Void* = Pointer(Void).null
    def is_valid_connection_type(from_type : Int64, to_type : Int64) : Bool
      if @@mb_is_valid_connection_type.null?
        @@mb_is_valid_connection_type = Bridge.get_method_bind("GraphEdit", "is_valid_connection_type", 2522259332_i64)
      end
      val_0 = from_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_valid_connection_type, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_connection_line : Void* = Pointer(Void).null
    def get_connection_line(from_node : Vector2, to_node : Vector2) : Void*
      if @@mb_get_connection_line.null?
        @@mb_get_connection_line = Bridge.get_method_bind("GraphEdit", "get_connection_line", 3932192302_i64)
      end
      val_0 = from_node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_node
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_connection_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_attach_graph_element_to_frame : Void* = Pointer(Void).null
    def attach_graph_element_to_frame(element : String, frame : String) : Void
      if @@mb_attach_graph_element_to_frame.null?
        @@mb_attach_graph_element_to_frame = Bridge.get_method_bind("GraphEdit", "attach_graph_element_to_frame", 3740211285_i64)
      end
      val_0 = element
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = frame
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_attach_graph_element_to_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_detach_graph_element_from_frame : Void* = Pointer(Void).null
    def detach_graph_element_from_frame(element : String) : Void
      if @@mb_detach_graph_element_from_frame.null?
        @@mb_detach_graph_element_from_frame = Bridge.get_method_bind("GraphEdit", "detach_graph_element_from_frame", 3304788590_i64)
      end
      val_0 = element
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_detach_graph_element_from_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_element_frame : Void* = Pointer(Void).null
    def get_element_frame(element : String) : GraphFrame
      if @@mb_get_element_frame.null?
        @@mb_get_element_frame = Bridge.get_method_bind("GraphEdit", "get_element_frame", 988084372_i64)
      end
      val_0 = element
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_element_frame, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      GraphFrame.new(ret_ptr)
    end
    @@mb_get_attached_nodes_of_frame : Void* = Pointer(Void).null
    def get_attached_nodes_of_frame(frame : String) : Godot::Array
      if @@mb_get_attached_nodes_of_frame.null?
        @@mb_get_attached_nodes_of_frame = Bridge.get_method_bind("GraphEdit", "get_attached_nodes_of_frame", 689397652_i64)
      end
      val_0 = frame
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_attached_nodes_of_frame, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_panning_scheme : Void* = Pointer(Void).null
    def set_panning_scheme(scheme : Int64) : Void
      if @@mb_set_panning_scheme.null?
        @@mb_set_panning_scheme = Bridge.get_method_bind("GraphEdit", "set_panning_scheme", 18893313_i64)
      end
      val_0 = scheme
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_panning_scheme, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_panning_scheme : Void* = Pointer(Void).null
    def get_panning_scheme() : Int64
      if @@mb_get_panning_scheme.null?
        @@mb_get_panning_scheme = Bridge.get_method_bind("GraphEdit", "get_panning_scheme", 549924446_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_panning_scheme, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_zoom : Void* = Pointer(Void).null
    def set_zoom(zoom : Float64) : Void
      if @@mb_set_zoom.null?
        @@mb_set_zoom = Bridge.get_method_bind("GraphEdit", "set_zoom", 373806689_i64)
      end
      val_0 = zoom
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_zoom, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_zoom : Void* = Pointer(Void).null
    def get_zoom() : Float64
      if @@mb_get_zoom.null?
        @@mb_get_zoom = Bridge.get_method_bind("GraphEdit", "get_zoom", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_zoom, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_zoom_min : Void* = Pointer(Void).null
    def set_zoom_min(zoom_min : Float64) : Void
      if @@mb_set_zoom_min.null?
        @@mb_set_zoom_min = Bridge.get_method_bind("GraphEdit", "set_zoom_min", 373806689_i64)
      end
      val_0 = zoom_min
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_zoom_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_zoom_min : Void* = Pointer(Void).null
    def get_zoom_min() : Float64
      if @@mb_get_zoom_min.null?
        @@mb_get_zoom_min = Bridge.get_method_bind("GraphEdit", "get_zoom_min", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_zoom_min, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_zoom_max : Void* = Pointer(Void).null
    def set_zoom_max(zoom_max : Float64) : Void
      if @@mb_set_zoom_max.null?
        @@mb_set_zoom_max = Bridge.get_method_bind("GraphEdit", "set_zoom_max", 373806689_i64)
      end
      val_0 = zoom_max
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_zoom_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_zoom_max : Void* = Pointer(Void).null
    def get_zoom_max() : Float64
      if @@mb_get_zoom_max.null?
        @@mb_get_zoom_max = Bridge.get_method_bind("GraphEdit", "get_zoom_max", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_zoom_max, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_zoom_step : Void* = Pointer(Void).null
    def set_zoom_step(zoom_step : Float64) : Void
      if @@mb_set_zoom_step.null?
        @@mb_set_zoom_step = Bridge.get_method_bind("GraphEdit", "set_zoom_step", 373806689_i64)
      end
      val_0 = zoom_step
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_zoom_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_zoom_step : Void* = Pointer(Void).null
    def get_zoom_step() : Float64
      if @@mb_get_zoom_step.null?
        @@mb_get_zoom_step = Bridge.get_method_bind("GraphEdit", "get_zoom_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_zoom_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_show_grid : Void* = Pointer(Void).null
    def set_show_grid(enable : Bool) : Void
      if @@mb_set_show_grid.null?
        @@mb_set_show_grid = Bridge.get_method_bind("GraphEdit", "set_show_grid", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_grid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_grid : Void* = Pointer(Void).null
    def is_showing_grid() : Bool
      if @@mb_is_showing_grid.null?
        @@mb_is_showing_grid = Bridge.get_method_bind("GraphEdit", "is_showing_grid", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_grid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_grid_pattern : Void* = Pointer(Void).null
    def set_grid_pattern(pattern : Int64) : Void
      if @@mb_set_grid_pattern.null?
        @@mb_set_grid_pattern = Bridge.get_method_bind("GraphEdit", "set_grid_pattern", 1074098205_i64)
      end
      val_0 = pattern
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_grid_pattern, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_grid_pattern : Void* = Pointer(Void).null
    def get_grid_pattern() : Int64
      if @@mb_get_grid_pattern.null?
        @@mb_get_grid_pattern = Bridge.get_method_bind("GraphEdit", "get_grid_pattern", 1286127528_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_grid_pattern, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_snapping_enabled : Void* = Pointer(Void).null
    def set_snapping_enabled(enable : Bool) : Void
      if @@mb_set_snapping_enabled.null?
        @@mb_set_snapping_enabled = Bridge.get_method_bind("GraphEdit", "set_snapping_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_snapping_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_snapping_enabled : Void* = Pointer(Void).null
    def is_snapping_enabled() : Bool
      if @@mb_is_snapping_enabled.null?
        @@mb_is_snapping_enabled = Bridge.get_method_bind("GraphEdit", "is_snapping_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_snapping_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_snapping_distance : Void* = Pointer(Void).null
    def set_snapping_distance(pixels : Int64) : Void
      if @@mb_set_snapping_distance.null?
        @@mb_set_snapping_distance = Bridge.get_method_bind("GraphEdit", "set_snapping_distance", 1286410249_i64)
      end
      val_0 = pixels
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_snapping_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_snapping_distance : Void* = Pointer(Void).null
    def get_snapping_distance() : Int64
      if @@mb_get_snapping_distance.null?
        @@mb_get_snapping_distance = Bridge.get_method_bind("GraphEdit", "get_snapping_distance", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_snapping_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_connection_lines_curvature : Void* = Pointer(Void).null
    def set_connection_lines_curvature(curvature : Float64) : Void
      if @@mb_set_connection_lines_curvature.null?
        @@mb_set_connection_lines_curvature = Bridge.get_method_bind("GraphEdit", "set_connection_lines_curvature", 373806689_i64)
      end
      val_0 = curvature
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_connection_lines_curvature, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_connection_lines_curvature : Void* = Pointer(Void).null
    def get_connection_lines_curvature() : Float64
      if @@mb_get_connection_lines_curvature.null?
        @@mb_get_connection_lines_curvature = Bridge.get_method_bind("GraphEdit", "get_connection_lines_curvature", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_connection_lines_curvature, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_connection_lines_thickness : Void* = Pointer(Void).null
    def set_connection_lines_thickness(pixels : Float64) : Void
      if @@mb_set_connection_lines_thickness.null?
        @@mb_set_connection_lines_thickness = Bridge.get_method_bind("GraphEdit", "set_connection_lines_thickness", 373806689_i64)
      end
      val_0 = pixels
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_connection_lines_thickness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_connection_lines_thickness : Void* = Pointer(Void).null
    def get_connection_lines_thickness() : Float64
      if @@mb_get_connection_lines_thickness.null?
        @@mb_get_connection_lines_thickness = Bridge.get_method_bind("GraphEdit", "get_connection_lines_thickness", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_connection_lines_thickness, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_connection_lines_antialiased : Void* = Pointer(Void).null
    def set_connection_lines_antialiased(pixels : Bool) : Void
      if @@mb_set_connection_lines_antialiased.null?
        @@mb_set_connection_lines_antialiased = Bridge.get_method_bind("GraphEdit", "set_connection_lines_antialiased", 2586408642_i64)
      end
      val_0 = pixels
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_connection_lines_antialiased, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_connection_lines_antialiased : Void* = Pointer(Void).null
    def is_connection_lines_antialiased() : Bool
      if @@mb_is_connection_lines_antialiased.null?
        @@mb_is_connection_lines_antialiased = Bridge.get_method_bind("GraphEdit", "is_connection_lines_antialiased", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_connection_lines_antialiased, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_minimap_size : Void* = Pointer(Void).null
    def set_minimap_size(size : Vector2) : Void
      if @@mb_set_minimap_size.null?
        @@mb_set_minimap_size = Bridge.get_method_bind("GraphEdit", "set_minimap_size", 743155724_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_minimap_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_minimap_size : Void* = Pointer(Void).null
    def get_minimap_size() : Vector2
      if @@mb_get_minimap_size.null?
        @@mb_get_minimap_size = Bridge.get_method_bind("GraphEdit", "get_minimap_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_minimap_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_minimap_opacity : Void* = Pointer(Void).null
    def set_minimap_opacity(opacity : Float64) : Void
      if @@mb_set_minimap_opacity.null?
        @@mb_set_minimap_opacity = Bridge.get_method_bind("GraphEdit", "set_minimap_opacity", 373806689_i64)
      end
      val_0 = opacity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_minimap_opacity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_minimap_opacity : Void* = Pointer(Void).null
    def get_minimap_opacity() : Float64
      if @@mb_get_minimap_opacity.null?
        @@mb_get_minimap_opacity = Bridge.get_method_bind("GraphEdit", "get_minimap_opacity", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_minimap_opacity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_minimap_enabled : Void* = Pointer(Void).null
    def set_minimap_enabled(enable : Bool) : Void
      if @@mb_set_minimap_enabled.null?
        @@mb_set_minimap_enabled = Bridge.get_method_bind("GraphEdit", "set_minimap_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_minimap_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_minimap_enabled : Void* = Pointer(Void).null
    def is_minimap_enabled() : Bool
      if @@mb_is_minimap_enabled.null?
        @@mb_is_minimap_enabled = Bridge.get_method_bind("GraphEdit", "is_minimap_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_minimap_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_show_menu : Void* = Pointer(Void).null
    def set_show_menu(hidden : Bool) : Void
      if @@mb_set_show_menu.null?
        @@mb_set_show_menu = Bridge.get_method_bind("GraphEdit", "set_show_menu", 2586408642_i64)
      end
      val_0 = hidden
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_menu, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_menu : Void* = Pointer(Void).null
    def is_showing_menu() : Bool
      if @@mb_is_showing_menu.null?
        @@mb_is_showing_menu = Bridge.get_method_bind("GraphEdit", "is_showing_menu", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_menu, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_show_zoom_label : Void* = Pointer(Void).null
    def set_show_zoom_label(enable : Bool) : Void
      if @@mb_set_show_zoom_label.null?
        @@mb_set_show_zoom_label = Bridge.get_method_bind("GraphEdit", "set_show_zoom_label", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_zoom_label, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_zoom_label : Void* = Pointer(Void).null
    def is_showing_zoom_label() : Bool
      if @@mb_is_showing_zoom_label.null?
        @@mb_is_showing_zoom_label = Bridge.get_method_bind("GraphEdit", "is_showing_zoom_label", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_zoom_label, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_show_grid_buttons : Void* = Pointer(Void).null
    def set_show_grid_buttons(hidden : Bool) : Void
      if @@mb_set_show_grid_buttons.null?
        @@mb_set_show_grid_buttons = Bridge.get_method_bind("GraphEdit", "set_show_grid_buttons", 2586408642_i64)
      end
      val_0 = hidden
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_grid_buttons, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_grid_buttons : Void* = Pointer(Void).null
    def is_showing_grid_buttons() : Bool
      if @@mb_is_showing_grid_buttons.null?
        @@mb_is_showing_grid_buttons = Bridge.get_method_bind("GraphEdit", "is_showing_grid_buttons", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_grid_buttons, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_show_zoom_buttons : Void* = Pointer(Void).null
    def set_show_zoom_buttons(hidden : Bool) : Void
      if @@mb_set_show_zoom_buttons.null?
        @@mb_set_show_zoom_buttons = Bridge.get_method_bind("GraphEdit", "set_show_zoom_buttons", 2586408642_i64)
      end
      val_0 = hidden
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_zoom_buttons, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_zoom_buttons : Void* = Pointer(Void).null
    def is_showing_zoom_buttons() : Bool
      if @@mb_is_showing_zoom_buttons.null?
        @@mb_is_showing_zoom_buttons = Bridge.get_method_bind("GraphEdit", "is_showing_zoom_buttons", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_zoom_buttons, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_show_minimap_button : Void* = Pointer(Void).null
    def set_show_minimap_button(hidden : Bool) : Void
      if @@mb_set_show_minimap_button.null?
        @@mb_set_show_minimap_button = Bridge.get_method_bind("GraphEdit", "set_show_minimap_button", 2586408642_i64)
      end
      val_0 = hidden
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_minimap_button, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_minimap_button : Void* = Pointer(Void).null
    def is_showing_minimap_button() : Bool
      if @@mb_is_showing_minimap_button.null?
        @@mb_is_showing_minimap_button = Bridge.get_method_bind("GraphEdit", "is_showing_minimap_button", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_minimap_button, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_show_arrange_button : Void* = Pointer(Void).null
    def set_show_arrange_button(hidden : Bool) : Void
      if @@mb_set_show_arrange_button.null?
        @@mb_set_show_arrange_button = Bridge.get_method_bind("GraphEdit", "set_show_arrange_button", 2586408642_i64)
      end
      val_0 = hidden
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_arrange_button, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_arrange_button : Void* = Pointer(Void).null
    def is_showing_arrange_button() : Bool
      if @@mb_is_showing_arrange_button.null?
        @@mb_is_showing_arrange_button = Bridge.get_method_bind("GraphEdit", "is_showing_arrange_button", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_arrange_button, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_right_disconnects : Void* = Pointer(Void).null
    def set_right_disconnects(enable : Bool) : Void
      if @@mb_set_right_disconnects.null?
        @@mb_set_right_disconnects = Bridge.get_method_bind("GraphEdit", "set_right_disconnects", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_right_disconnects, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_right_disconnects_enabled : Void* = Pointer(Void).null
    def is_right_disconnects_enabled() : Bool
      if @@mb_is_right_disconnects_enabled.null?
        @@mb_is_right_disconnects_enabled = Bridge.get_method_bind("GraphEdit", "is_right_disconnects_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_right_disconnects_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_type_names : Void* = Pointer(Void).null
    def set_type_names(type_names : Void*) : Void
      if @@mb_set_type_names.null?
        @@mb_set_type_names = Bridge.get_method_bind("GraphEdit", "set_type_names", 4155329257_i64)
      end
      val_0 = type_names
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_type_names, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_type_names : Void* = Pointer(Void).null
    def get_type_names() : Void*
      if @@mb_get_type_names.null?
        @@mb_get_type_names = Bridge.get_method_bind("GraphEdit", "get_type_names", 3102165223_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_type_names, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_menu_hbox : Void* = Pointer(Void).null
    def get_menu_hbox() : HBoxContainer
      if @@mb_get_menu_hbox.null?
        @@mb_get_menu_hbox = Bridge.get_method_bind("GraphEdit", "get_menu_hbox", 3590609951_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_menu_hbox, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      HBoxContainer.new(ret_ptr)
    end
    @@mb_arrange_nodes : Void* = Pointer(Void).null
    def arrange_nodes() : Void
      if @@mb_arrange_nodes.null?
        @@mb_arrange_nodes = Bridge.get_method_bind("GraphEdit", "arrange_nodes", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_arrange_nodes, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_selected : Void* = Pointer(Void).null
    def set_selected(node : Node) : Void
      if @@mb_set_selected.null?
        @@mb_set_selected = Bridge.get_method_bind("GraphEdit", "set_selected", 1078189570_i64)
      end
      arg_ptr_0 = node ? node.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_selected, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class ScrollBar < Godot::Range
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_custom_step : Void* = Pointer(Void).null
    def set_custom_step(step : Float64) : Void
      if @@mb_set_custom_step.null?
        @@mb_set_custom_step = Bridge.get_method_bind("ScrollBar", "set_custom_step", 373806689_i64)
      end
      val_0 = step
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_custom_step : Void* = Pointer(Void).null
    def get_custom_step() : Float64
      if @@mb_get_custom_step.null?
        @@mb_get_custom_step = Bridge.get_method_bind("ScrollBar", "get_custom_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_custom_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Separator < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class Slider < Godot::Range
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum TickPosition : Int64
      TickPositionBottomRight = 0_i64
      TickPositionTopLeft = 1_i64
      TickPositionBoth = 2_i64
      TickPositionCenter = 3_i64
    end
    @@mb_set_ticks : Void* = Pointer(Void).null
    def set_ticks(count : Int64) : Void
      if @@mb_set_ticks.null?
        @@mb_set_ticks = Bridge.get_method_bind("Slider", "set_ticks", 1286410249_i64)
      end
      val_0 = count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_ticks, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ticks : Void* = Pointer(Void).null
    def get_ticks() : Int64
      if @@mb_get_ticks.null?
        @@mb_get_ticks = Bridge.get_method_bind("Slider", "get_ticks", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_ticks, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_ticks_on_borders : Void* = Pointer(Void).null
    def get_ticks_on_borders() : Bool
      if @@mb_get_ticks_on_borders.null?
        @@mb_get_ticks_on_borders = Bridge.get_method_bind("Slider", "get_ticks_on_borders", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_ticks_on_borders, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_ticks_on_borders : Void* = Pointer(Void).null
    def set_ticks_on_borders(ticks_on_border : Bool) : Void
      if @@mb_set_ticks_on_borders.null?
        @@mb_set_ticks_on_borders = Bridge.get_method_bind("Slider", "set_ticks_on_borders", 2586408642_i64)
      end
      val_0 = ticks_on_border
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_ticks_on_borders, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ticks_position : Void* = Pointer(Void).null
    def get_ticks_position() : Int64
      if @@mb_get_ticks_position.null?
        @@mb_get_ticks_position = Bridge.get_method_bind("Slider", "get_ticks_position", 3567635531_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_ticks_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_ticks_position : Void* = Pointer(Void).null
    def set_ticks_position(ticks_on_border : Int64) : Void
      if @@mb_set_ticks_position.null?
        @@mb_set_ticks_position = Bridge.get_method_bind("Slider", "set_ticks_position", 2952822224_i64)
      end
      val_0 = ticks_on_border
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_ticks_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_editable : Void* = Pointer(Void).null
    def set_editable(editable : Bool) : Void
      if @@mb_set_editable.null?
        @@mb_set_editable = Bridge.get_method_bind("Slider", "set_editable", 2586408642_i64)
      end
      val_0 = editable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editable : Void* = Pointer(Void).null
    def is_editable() : Bool
      if @@mb_is_editable.null?
        @@mb_is_editable = Bridge.get_method_bind("Slider", "is_editable", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_scrollable : Void* = Pointer(Void).null
    def set_scrollable(scrollable : Bool) : Void
      if @@mb_set_scrollable.null?
        @@mb_set_scrollable = Bridge.get_method_bind("Slider", "set_scrollable", 2586408642_i64)
      end
      val_0 = scrollable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scrollable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scrollable : Void* = Pointer(Void).null
    def is_scrollable() : Bool
      if @@mb_is_scrollable.null?
        @@mb_is_scrollable = Bridge.get_method_bind("Slider", "is_scrollable", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scrollable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class ItemList < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum IconMode : Int64
      IconModeTop = 0_i64
      IconModeLeft = 1_i64
    end
    enum SelectMode : Int64
      SelectSingle = 0_i64
      SelectMulti = 1_i64
      SelectToggle = 2_i64
    end
    enum ScrollHintMode : Int64
      ScrollHintModeDisabled = 0_i64
      ScrollHintModeBoth = 1_i64
      ScrollHintModeTop = 2_i64
      ScrollHintModeBottom = 3_i64
    end
    @@mb_add_item : Void* = Pointer(Void).null
    def add_item(text : String, icon : Texture2D, selectable : Bool) : Int64
      if @@mb_add_item.null?
        @@mb_add_item = Bridge.get_method_bind("ItemList", "add_item", 359861678_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = selectable
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_icon_item : Void* = Pointer(Void).null
    def add_icon_item(icon : Texture2D, selectable : Bool) : Int64
      if @@mb_add_icon_item.null?
        @@mb_add_icon_item = Bridge.get_method_bind("ItemList", "add_icon_item", 4256579627_i64)
      end
      val_0 = icon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = selectable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_add_icon_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_item_text : Void* = Pointer(Void).null
    def set_item_text(idx : Int64, text : String) : Void
      if @@mb_set_item_text.null?
        @@mb_set_item_text = Bridge.get_method_bind("ItemList", "set_item_text", 501894301_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = text
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_text : Void* = Pointer(Void).null
    def get_item_text(idx : Int64) : String
      if @@mb_get_item_text.null?
        @@mb_get_item_text = Bridge.get_method_bind("ItemList", "get_item_text", 844755477_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_item_icon : Void* = Pointer(Void).null
    def set_item_icon(idx : Int64, icon : Texture2D) : Void
      if @@mb_set_item_icon.null?
        @@mb_set_item_icon = Bridge.get_method_bind("ItemList", "set_item_icon", 666127730_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_icon : Void* = Pointer(Void).null
    def get_item_icon(idx : Int64) : Texture2D
      if @@mb_get_item_icon.null?
        @@mb_get_item_icon = Bridge.get_method_bind("ItemList", "get_item_icon", 3536238170_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_item_icon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_item_text_direction : Void* = Pointer(Void).null
    def set_item_text_direction(idx : Int64, direction : Int64) : Void
      if @@mb_set_item_text_direction.null?
        @@mb_set_item_text_direction = Bridge.get_method_bind("ItemList", "set_item_text_direction", 1707680378_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = direction
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_text_direction : Void* = Pointer(Void).null
    def get_item_text_direction(idx : Int64) : Int64
      if @@mb_get_item_text_direction.null?
        @@mb_get_item_text_direction = Bridge.get_method_bind("ItemList", "get_item_text_direction", 4235602388_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_item_text_direction, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_item_language : Void* = Pointer(Void).null
    def set_item_language(idx : Int64, language : String) : Void
      if @@mb_set_item_language.null?
        @@mb_set_item_language = Bridge.get_method_bind("ItemList", "set_item_language", 501894301_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_language : Void* = Pointer(Void).null
    def get_item_language(idx : Int64) : String
      if @@mb_get_item_language.null?
        @@mb_get_item_language = Bridge.get_method_bind("ItemList", "get_item_language", 844755477_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_item_auto_translate_mode : Void* = Pointer(Void).null
    def set_item_auto_translate_mode(idx : Int64, mode : Int64) : Void
      if @@mb_set_item_auto_translate_mode.null?
        @@mb_set_item_auto_translate_mode = Bridge.get_method_bind("ItemList", "set_item_auto_translate_mode", 287402019_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_auto_translate_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_auto_translate_mode : Void* = Pointer(Void).null
    def get_item_auto_translate_mode(idx : Int64) : Int64
      if @@mb_get_item_auto_translate_mode.null?
        @@mb_get_item_auto_translate_mode = Bridge.get_method_bind("ItemList", "get_item_auto_translate_mode", 906302372_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_item_auto_translate_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_item_icon_transposed : Void* = Pointer(Void).null
    def set_item_icon_transposed(idx : Int64, transposed : Bool) : Void
      if @@mb_set_item_icon_transposed.null?
        @@mb_set_item_icon_transposed = Bridge.get_method_bind("ItemList", "set_item_icon_transposed", 300928843_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transposed
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_icon_transposed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_item_icon_transposed : Void* = Pointer(Void).null
    def is_item_icon_transposed(idx : Int64) : Bool
      if @@mb_is_item_icon_transposed.null?
        @@mb_is_item_icon_transposed = Bridge.get_method_bind("ItemList", "is_item_icon_transposed", 1116898809_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_item_icon_transposed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_item_icon_region : Void* = Pointer(Void).null
    def set_item_icon_region(idx : Int64, rect : Rect2) : Void
      if @@mb_set_item_icon_region.null?
        @@mb_set_item_icon_region = Bridge.get_method_bind("ItemList", "set_item_icon_region", 1356297692_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_icon_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_icon_region : Void* = Pointer(Void).null
    def get_item_icon_region(idx : Int64) : Rect2
      if @@mb_get_item_icon_region.null?
        @@mb_get_item_icon_region = Bridge.get_method_bind("ItemList", "get_item_icon_region", 3327874267_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_item_icon_region, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_set_item_icon_modulate : Void* = Pointer(Void).null
    def set_item_icon_modulate(idx : Int64, modulate : Color) : Void
      if @@mb_set_item_icon_modulate.null?
        @@mb_set_item_icon_modulate = Bridge.get_method_bind("ItemList", "set_item_icon_modulate", 2878471219_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = modulate
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_icon_modulate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_icon_modulate : Void* = Pointer(Void).null
    def get_item_icon_modulate(idx : Int64) : Color
      if @@mb_get_item_icon_modulate.null?
        @@mb_get_item_icon_modulate = Bridge.get_method_bind("ItemList", "get_item_icon_modulate", 3457211756_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Color.new
      Bridge.ptrcall(@@mb_get_item_icon_modulate, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_item_selectable : Void* = Pointer(Void).null
    def set_item_selectable(idx : Int64, selectable : Bool) : Void
      if @@mb_set_item_selectable.null?
        @@mb_set_item_selectable = Bridge.get_method_bind("ItemList", "set_item_selectable", 300928843_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = selectable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_selectable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_item_selectable : Void* = Pointer(Void).null
    def is_item_selectable(idx : Int64) : Bool
      if @@mb_is_item_selectable.null?
        @@mb_is_item_selectable = Bridge.get_method_bind("ItemList", "is_item_selectable", 1116898809_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_item_selectable, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_item_disabled : Void* = Pointer(Void).null
    def set_item_disabled(idx : Int64, disabled : Bool) : Void
      if @@mb_set_item_disabled.null?
        @@mb_set_item_disabled = Bridge.get_method_bind("ItemList", "set_item_disabled", 300928843_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_item_disabled : Void* = Pointer(Void).null
    def is_item_disabled(idx : Int64) : Bool
      if @@mb_is_item_disabled.null?
        @@mb_is_item_disabled = Bridge.get_method_bind("ItemList", "is_item_disabled", 1116898809_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_item_disabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_item_metadata : Void* = Pointer(Void).null
    def set_item_metadata(idx : Int64, metadata : Void*) : Void
      if @@mb_set_item_metadata.null?
        @@mb_set_item_metadata = Bridge.get_method_bind("ItemList", "set_item_metadata", 2152698145_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = metadata
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_metadata, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_metadata : Void* = Pointer(Void).null
    def get_item_metadata(idx : Int64) : Void*
      if @@mb_get_item_metadata.null?
        @@mb_get_item_metadata = Bridge.get_method_bind("ItemList", "get_item_metadata", 4227898402_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_item_metadata, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_item_custom_bg_color : Void* = Pointer(Void).null
    def set_item_custom_bg_color(idx : Int64, custom_bg_color : Color) : Void
      if @@mb_set_item_custom_bg_color.null?
        @@mb_set_item_custom_bg_color = Bridge.get_method_bind("ItemList", "set_item_custom_bg_color", 2878471219_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = custom_bg_color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_custom_bg_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_custom_bg_color : Void* = Pointer(Void).null
    def get_item_custom_bg_color(idx : Int64) : Color
      if @@mb_get_item_custom_bg_color.null?
        @@mb_get_item_custom_bg_color = Bridge.get_method_bind("ItemList", "get_item_custom_bg_color", 3457211756_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Color.new
      Bridge.ptrcall(@@mb_get_item_custom_bg_color, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_item_custom_fg_color : Void* = Pointer(Void).null
    def set_item_custom_fg_color(idx : Int64, custom_fg_color : Color) : Void
      if @@mb_set_item_custom_fg_color.null?
        @@mb_set_item_custom_fg_color = Bridge.get_method_bind("ItemList", "set_item_custom_fg_color", 2878471219_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = custom_fg_color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_custom_fg_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_custom_fg_color : Void* = Pointer(Void).null
    def get_item_custom_fg_color(idx : Int64) : Color
      if @@mb_get_item_custom_fg_color.null?
        @@mb_get_item_custom_fg_color = Bridge.get_method_bind("ItemList", "get_item_custom_fg_color", 3457211756_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Color.new
      Bridge.ptrcall(@@mb_get_item_custom_fg_color, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_item_rect : Void* = Pointer(Void).null
    def get_item_rect(idx : Int64, expand : Bool) : Rect2
      if @@mb_get_item_rect.null?
        @@mb_get_item_rect = Bridge.get_method_bind("ItemList", "get_item_rect", 159227807_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = expand
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_item_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_set_item_tooltip_enabled : Void* = Pointer(Void).null
    def set_item_tooltip_enabled(idx : Int64, enable : Bool) : Void
      if @@mb_set_item_tooltip_enabled.null?
        @@mb_set_item_tooltip_enabled = Bridge.get_method_bind("ItemList", "set_item_tooltip_enabled", 300928843_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_tooltip_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_item_tooltip_enabled : Void* = Pointer(Void).null
    def is_item_tooltip_enabled(idx : Int64) : Bool
      if @@mb_is_item_tooltip_enabled.null?
        @@mb_is_item_tooltip_enabled = Bridge.get_method_bind("ItemList", "is_item_tooltip_enabled", 1116898809_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_item_tooltip_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_item_tooltip : Void* = Pointer(Void).null
    def set_item_tooltip(idx : Int64, tooltip : String) : Void
      if @@mb_set_item_tooltip.null?
        @@mb_set_item_tooltip = Bridge.get_method_bind("ItemList", "set_item_tooltip", 501894301_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_item_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_tooltip : Void* = Pointer(Void).null
    def get_item_tooltip(idx : Int64) : String
      if @@mb_get_item_tooltip.null?
        @@mb_get_item_tooltip = Bridge.get_method_bind("ItemList", "get_item_tooltip", 844755477_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_select : Void* = Pointer(Void).null
    def select_val(idx : Int64, single : Bool) : Void
      if @@mb_select.null?
        @@mb_select = Bridge.get_method_bind("ItemList", "select", 972357352_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = single
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_select, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_deselect : Void* = Pointer(Void).null
    def deselect(idx : Int64) : Void
      if @@mb_deselect.null?
        @@mb_deselect = Bridge.get_method_bind("ItemList", "deselect", 1286410249_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_deselect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_deselect_all : Void* = Pointer(Void).null
    def deselect_all() : Void
      if @@mb_deselect_all.null?
        @@mb_deselect_all = Bridge.get_method_bind("ItemList", "deselect_all", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_deselect_all, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_selected : Void* = Pointer(Void).null
    def is_selected(idx : Int64) : Bool
      if @@mb_is_selected.null?
        @@mb_is_selected = Bridge.get_method_bind("ItemList", "is_selected", 1116898809_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_selected, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_selected_items : Void* = Pointer(Void).null
    def get_selected_items() : Void*
      if @@mb_get_selected_items.null?
        @@mb_get_selected_items = Bridge.get_method_bind("ItemList", "get_selected_items", 969006518_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_selected_items, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_move_item : Void* = Pointer(Void).null
    def move_item(from_idx : Int64, to_idx : Int64) : Void
      if @@mb_move_item.null?
        @@mb_move_item = Bridge.get_method_bind("ItemList", "move_item", 3937882851_i64)
      end
      val_0 = from_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_item, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_item_count : Void* = Pointer(Void).null
    def set_item_count(count : Int64) : Void
      if @@mb_set_item_count.null?
        @@mb_set_item_count = Bridge.get_method_bind("ItemList", "set_item_count", 1286410249_i64)
      end
      val_0 = count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_item_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_count : Void* = Pointer(Void).null
    def get_item_count() : Int64
      if @@mb_get_item_count.null?
        @@mb_get_item_count = Bridge.get_method_bind("ItemList", "get_item_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_item_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_item : Void* = Pointer(Void).null
    def remove_item(idx : Int64) : Void
      if @@mb_remove_item.null?
        @@mb_remove_item = Bridge.get_method_bind("ItemList", "remove_item", 1286410249_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_item, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("ItemList", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_sort_items_by_text : Void* = Pointer(Void).null
    def sort_items_by_text() : Void
      if @@mb_sort_items_by_text.null?
        @@mb_sort_items_by_text = Bridge.get_method_bind("ItemList", "sort_items_by_text", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_sort_items_by_text, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_fixed_column_width : Void* = Pointer(Void).null
    def set_fixed_column_width(width : Int64) : Void
      if @@mb_set_fixed_column_width.null?
        @@mb_set_fixed_column_width = Bridge.get_method_bind("ItemList", "set_fixed_column_width", 1286410249_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fixed_column_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fixed_column_width : Void* = Pointer(Void).null
    def get_fixed_column_width() : Int64
      if @@mb_get_fixed_column_width.null?
        @@mb_get_fixed_column_width = Bridge.get_method_bind("ItemList", "get_fixed_column_width", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fixed_column_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_same_column_width : Void* = Pointer(Void).null
    def set_same_column_width(enable : Bool) : Void
      if @@mb_set_same_column_width.null?
        @@mb_set_same_column_width = Bridge.get_method_bind("ItemList", "set_same_column_width", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_same_column_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_same_column_width : Void* = Pointer(Void).null
    def is_same_column_width() : Bool
      if @@mb_is_same_column_width.null?
        @@mb_is_same_column_width = Bridge.get_method_bind("ItemList", "is_same_column_width", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_same_column_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_max_text_lines : Void* = Pointer(Void).null
    def set_max_text_lines(lines : Int64) : Void
      if @@mb_set_max_text_lines.null?
        @@mb_set_max_text_lines = Bridge.get_method_bind("ItemList", "set_max_text_lines", 1286410249_i64)
      end
      val_0 = lines
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_text_lines, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_text_lines : Void* = Pointer(Void).null
    def get_max_text_lines() : Int64
      if @@mb_get_max_text_lines.null?
        @@mb_get_max_text_lines = Bridge.get_method_bind("ItemList", "get_max_text_lines", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_text_lines, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_columns : Void* = Pointer(Void).null
    def set_max_columns(amount : Int64) : Void
      if @@mb_set_max_columns.null?
        @@mb_set_max_columns = Bridge.get_method_bind("ItemList", "set_max_columns", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_columns, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_columns : Void* = Pointer(Void).null
    def get_max_columns() : Int64
      if @@mb_get_max_columns.null?
        @@mb_get_max_columns = Bridge.get_method_bind("ItemList", "get_max_columns", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_columns, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_select_mode : Void* = Pointer(Void).null
    def set_select_mode(mode : Int64) : Void
      if @@mb_set_select_mode.null?
        @@mb_set_select_mode = Bridge.get_method_bind("ItemList", "set_select_mode", 928267388_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_select_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_select_mode : Void* = Pointer(Void).null
    def get_select_mode() : Int64
      if @@mb_get_select_mode.null?
        @@mb_get_select_mode = Bridge.get_method_bind("ItemList", "get_select_mode", 1191945842_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_select_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_icon_mode : Void* = Pointer(Void).null
    def set_icon_mode(mode : Int64) : Void
      if @@mb_set_icon_mode.null?
        @@mb_set_icon_mode = Bridge.get_method_bind("ItemList", "set_icon_mode", 2025053633_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_icon_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_icon_mode : Void* = Pointer(Void).null
    def get_icon_mode() : Int64
      if @@mb_get_icon_mode.null?
        @@mb_get_icon_mode = Bridge.get_method_bind("ItemList", "get_icon_mode", 3353929232_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_icon_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fixed_icon_size : Void* = Pointer(Void).null
    def set_fixed_icon_size(size : Vector2i) : Void
      if @@mb_set_fixed_icon_size.null?
        @@mb_set_fixed_icon_size = Bridge.get_method_bind("ItemList", "set_fixed_icon_size", 1130785943_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fixed_icon_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fixed_icon_size : Void* = Pointer(Void).null
    def get_fixed_icon_size() : Vector2i
      if @@mb_get_fixed_icon_size.null?
        @@mb_get_fixed_icon_size = Bridge.get_method_bind("ItemList", "get_fixed_icon_size", 3690982128_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_fixed_icon_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_set_icon_scale : Void* = Pointer(Void).null
    def set_icon_scale(scale : Float64) : Void
      if @@mb_set_icon_scale.null?
        @@mb_set_icon_scale = Bridge.get_method_bind("ItemList", "set_icon_scale", 373806689_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_icon_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_icon_scale : Void* = Pointer(Void).null
    def get_icon_scale() : Float64
      if @@mb_get_icon_scale.null?
        @@mb_get_icon_scale = Bridge.get_method_bind("ItemList", "get_icon_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_icon_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_allow_rmb_select : Void* = Pointer(Void).null
    def set_allow_rmb_select(allow : Bool) : Void
      if @@mb_set_allow_rmb_select.null?
        @@mb_set_allow_rmb_select = Bridge.get_method_bind("ItemList", "set_allow_rmb_select", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_rmb_select, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_allow_rmb_select : Void* = Pointer(Void).null
    def get_allow_rmb_select() : Bool
      if @@mb_get_allow_rmb_select.null?
        @@mb_get_allow_rmb_select = Bridge.get_method_bind("ItemList", "get_allow_rmb_select", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_allow_rmb_select, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_allow_reselect : Void* = Pointer(Void).null
    def set_allow_reselect(allow : Bool) : Void
      if @@mb_set_allow_reselect.null?
        @@mb_set_allow_reselect = Bridge.get_method_bind("ItemList", "set_allow_reselect", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_reselect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_allow_reselect : Void* = Pointer(Void).null
    def get_allow_reselect() : Bool
      if @@mb_get_allow_reselect.null?
        @@mb_get_allow_reselect = Bridge.get_method_bind("ItemList", "get_allow_reselect", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_allow_reselect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_allow_search : Void* = Pointer(Void).null
    def set_allow_search(allow : Bool) : Void
      if @@mb_set_allow_search.null?
        @@mb_set_allow_search = Bridge.get_method_bind("ItemList", "set_allow_search", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_search, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_allow_search : Void* = Pointer(Void).null
    def get_allow_search() : Bool
      if @@mb_get_allow_search.null?
        @@mb_get_allow_search = Bridge.get_method_bind("ItemList", "get_allow_search", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_allow_search, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_auto_width : Void* = Pointer(Void).null
    def set_auto_width(enable : Bool) : Void
      if @@mb_set_auto_width.null?
        @@mb_set_auto_width = Bridge.get_method_bind("ItemList", "set_auto_width", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_auto_width : Void* = Pointer(Void).null
    def has_auto_width() : Bool
      if @@mb_has_auto_width.null?
        @@mb_has_auto_width = Bridge.get_method_bind("ItemList", "has_auto_width", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_auto_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_auto_height : Void* = Pointer(Void).null
    def set_auto_height(enable : Bool) : Void
      if @@mb_set_auto_height.null?
        @@mb_set_auto_height = Bridge.get_method_bind("ItemList", "set_auto_height", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_height, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_auto_height : Void* = Pointer(Void).null
    def has_auto_height() : Bool
      if @@mb_has_auto_height.null?
        @@mb_has_auto_height = Bridge.get_method_bind("ItemList", "has_auto_height", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_auto_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_anything_selected : Void* = Pointer(Void).null
    def is_anything_selected() : Bool
      if @@mb_is_anything_selected.null?
        @@mb_is_anything_selected = Bridge.get_method_bind("ItemList", "is_anything_selected", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_anything_selected, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_item_at_position : Void* = Pointer(Void).null
    def get_item_at_position(position : Vector2, exact : Bool) : Int64
      if @@mb_get_item_at_position.null?
        @@mb_get_item_at_position = Bridge.get_method_bind("ItemList", "get_item_at_position", 2300324924_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = exact
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_item_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_ensure_current_is_visible : Void* = Pointer(Void).null
    def ensure_current_is_visible() : Void
      if @@mb_ensure_current_is_visible.null?
        @@mb_ensure_current_is_visible = Bridge.get_method_bind("ItemList", "ensure_current_is_visible", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_ensure_current_is_visible, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_center_on_current : Void* = Pointer(Void).null
    def center_on_current(center_verically : Bool, center_horizontally : Bool) : Void
      if @@mb_center_on_current.null?
        @@mb_center_on_current = Bridge.get_method_bind("ItemList", "center_on_current", 3058350285_i64)
      end
      val_0 = center_verically
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = center_horizontally
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_center_on_current, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_scroll_bar : Void* = Pointer(Void).null
    def get_v_scroll_bar() : VScrollBar
      if @@mb_get_v_scroll_bar.null?
        @@mb_get_v_scroll_bar = Bridge.get_method_bind("ItemList", "get_v_scroll_bar", 2630340773_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_v_scroll_bar, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VScrollBar.new(ret_ptr)
    end
    @@mb_get_h_scroll_bar : Void* = Pointer(Void).null
    def get_h_scroll_bar() : HScrollBar
      if @@mb_get_h_scroll_bar.null?
        @@mb_get_h_scroll_bar = Bridge.get_method_bind("ItemList", "get_h_scroll_bar", 4004517983_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_h_scroll_bar, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      HScrollBar.new(ret_ptr)
    end
    @@mb_set_scroll_hint_mode : Void* = Pointer(Void).null
    def set_scroll_hint_mode(scroll_hint_mode : Int64) : Void
      if @@mb_set_scroll_hint_mode.null?
        @@mb_set_scroll_hint_mode = Bridge.get_method_bind("ItemList", "set_scroll_hint_mode", 2917787337_i64)
      end
      val_0 = scroll_hint_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_hint_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scroll_hint_mode : Void* = Pointer(Void).null
    def get_scroll_hint_mode() : Int64
      if @@mb_get_scroll_hint_mode.null?
        @@mb_get_scroll_hint_mode = Bridge.get_method_bind("ItemList", "get_scroll_hint_mode", 2522227939_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_scroll_hint_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tile_scroll_hint : Void* = Pointer(Void).null
    def set_tile_scroll_hint(tile_scroll_hint : Bool) : Void
      if @@mb_set_tile_scroll_hint.null?
        @@mb_set_tile_scroll_hint = Bridge.get_method_bind("ItemList", "set_tile_scroll_hint", 2586408642_i64)
      end
      val_0 = tile_scroll_hint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tile_scroll_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_hint_tiled : Void* = Pointer(Void).null
    def is_scroll_hint_tiled() : Bool
      if @@mb_is_scroll_hint_tiled.null?
        @@mb_is_scroll_hint_tiled = Bridge.get_method_bind("ItemList", "is_scroll_hint_tiled", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_hint_tiled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_text_overrun_behavior : Void* = Pointer(Void).null
    def set_text_overrun_behavior(overrun_behavior : Int64) : Void
      if @@mb_set_text_overrun_behavior.null?
        @@mb_set_text_overrun_behavior = Bridge.get_method_bind("ItemList", "set_text_overrun_behavior", 1008890932_i64)
      end
      val_0 = overrun_behavior
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_overrun_behavior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_overrun_behavior : Void* = Pointer(Void).null
    def get_text_overrun_behavior() : Int64
      if @@mb_get_text_overrun_behavior.null?
        @@mb_get_text_overrun_behavior = Bridge.get_method_bind("ItemList", "get_text_overrun_behavior", 3779142101_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_overrun_behavior, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_wraparound_items : Void* = Pointer(Void).null
    def set_wraparound_items(enable : Bool) : Void
      if @@mb_set_wraparound_items.null?
        @@mb_set_wraparound_items = Bridge.get_method_bind("ItemList", "set_wraparound_items", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_wraparound_items, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_wraparound_items : Void* = Pointer(Void).null
    def has_wraparound_items() : Bool
      if @@mb_has_wraparound_items.null?
        @@mb_has_wraparound_items = Bridge.get_method_bind("ItemList", "has_wraparound_items", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_wraparound_items, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_force_update_list_size : Void* = Pointer(Void).null
    def force_update_list_size() : Void
      if @@mb_force_update_list_size.null?
        @@mb_force_update_list_size = Bridge.get_method_bind("ItemList", "force_update_list_size", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_update_list_size, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
  end
  class Label < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_horizontal_alignment : Void* = Pointer(Void).null
    def set_horizontal_alignment(alignment : Int64) : Void
      if @@mb_set_horizontal_alignment.null?
        @@mb_set_horizontal_alignment = Bridge.get_method_bind("Label", "set_horizontal_alignment", 2312603777_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_horizontal_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_horizontal_alignment : Void* = Pointer(Void).null
    def get_horizontal_alignment() : Int64
      if @@mb_get_horizontal_alignment.null?
        @@mb_get_horizontal_alignment = Bridge.get_method_bind("Label", "get_horizontal_alignment", 341400642_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_horizontal_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vertical_alignment : Void* = Pointer(Void).null
    def set_vertical_alignment(alignment : Int64) : Void
      if @@mb_set_vertical_alignment.null?
        @@mb_set_vertical_alignment = Bridge.get_method_bind("Label", "set_vertical_alignment", 1796458609_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertical_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vertical_alignment : Void* = Pointer(Void).null
    def get_vertical_alignment() : Int64
      if @@mb_get_vertical_alignment.null?
        @@mb_get_vertical_alignment = Bridge.get_method_bind("Label", "get_vertical_alignment", 3274884059_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_vertical_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_text : Void* = Pointer(Void).null
    def set_text(text : String) : Void
      if @@mb_set_text.null?
        @@mb_set_text = Bridge.get_method_bind("Label", "set_text", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text : Void* = Pointer(Void).null
    def get_text() : String
      if @@mb_get_text.null?
        @@mb_get_text = Bridge.get_method_bind("Label", "get_text", 201670096_i64)
      end
      ""
    end
    @@mb_set_label_settings : Void* = Pointer(Void).null
    def set_label_settings(settings : LabelSettings) : Void
      if @@mb_set_label_settings.null?
        @@mb_set_label_settings = Bridge.get_method_bind("Label", "set_label_settings", 1030653839_i64)
      end
      val_0 = settings
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_label_settings, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_label_settings : Void* = Pointer(Void).null
    def get_label_settings() : LabelSettings
      if @@mb_get_label_settings.null?
        @@mb_get_label_settings = Bridge.get_method_bind("Label", "get_label_settings", 826676056_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_label_settings, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      LabelSettings.new(ret_ptr)
    end
    @@mb_set_text_direction : Void* = Pointer(Void).null
    def set_text_direction(direction : Int64) : Void
      if @@mb_set_text_direction.null?
        @@mb_set_text_direction = Bridge.get_method_bind("Label", "set_text_direction", 119160795_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_direction : Void* = Pointer(Void).null
    def get_text_direction() : Int64
      if @@mb_get_text_direction.null?
        @@mb_get_text_direction = Bridge.get_method_bind("Label", "get_text_direction", 797257663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_language : Void* = Pointer(Void).null
    def set_language(language : String) : Void
      if @@mb_set_language.null?
        @@mb_set_language = Bridge.get_method_bind("Label", "set_language", 83702148_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_language : Void* = Pointer(Void).null
    def get_language() : String
      if @@mb_get_language.null?
        @@mb_get_language = Bridge.get_method_bind("Label", "get_language", 201670096_i64)
      end
      ""
    end
    @@mb_set_paragraph_separator : Void* = Pointer(Void).null
    def set_paragraph_separator(paragraph_separator : String) : Void
      if @@mb_set_paragraph_separator.null?
        @@mb_set_paragraph_separator = Bridge.get_method_bind("Label", "set_paragraph_separator", 83702148_i64)
      end
      val_0 = paragraph_separator
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_paragraph_separator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_paragraph_separator : Void* = Pointer(Void).null
    def get_paragraph_separator() : String
      if @@mb_get_paragraph_separator.null?
        @@mb_get_paragraph_separator = Bridge.get_method_bind("Label", "get_paragraph_separator", 201670096_i64)
      end
      ""
    end
    @@mb_set_autowrap_mode : Void* = Pointer(Void).null
    def set_autowrap_mode(autowrap_mode : Int64) : Void
      if @@mb_set_autowrap_mode.null?
        @@mb_set_autowrap_mode = Bridge.get_method_bind("Label", "set_autowrap_mode", 3289138044_i64)
      end
      val_0 = autowrap_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autowrap_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autowrap_mode : Void* = Pointer(Void).null
    def get_autowrap_mode() : Int64
      if @@mb_get_autowrap_mode.null?
        @@mb_get_autowrap_mode = Bridge.get_method_bind("Label", "get_autowrap_mode", 1549071663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_autowrap_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autowrap_trim_flags : Void* = Pointer(Void).null
    def set_autowrap_trim_flags(autowrap_trim_flags : Int64) : Void
      if @@mb_set_autowrap_trim_flags.null?
        @@mb_set_autowrap_trim_flags = Bridge.get_method_bind("Label", "set_autowrap_trim_flags", 2809697122_i64)
      end
      val_0 = autowrap_trim_flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autowrap_trim_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autowrap_trim_flags : Void* = Pointer(Void).null
    def get_autowrap_trim_flags() : Int64
      if @@mb_get_autowrap_trim_flags.null?
        @@mb_get_autowrap_trim_flags = Bridge.get_method_bind("Label", "get_autowrap_trim_flags", 2340632602_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_autowrap_trim_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_justification_flags : Void* = Pointer(Void).null
    def set_justification_flags(justification_flags : Int64) : Void
      if @@mb_set_justification_flags.null?
        @@mb_set_justification_flags = Bridge.get_method_bind("Label", "set_justification_flags", 2877345813_i64)
      end
      val_0 = justification_flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_justification_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_justification_flags : Void* = Pointer(Void).null
    def get_justification_flags() : Int64
      if @@mb_get_justification_flags.null?
        @@mb_get_justification_flags = Bridge.get_method_bind("Label", "get_justification_flags", 1583363614_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_justification_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_clip_text : Void* = Pointer(Void).null
    def set_clip_text(enable : Bool) : Void
      if @@mb_set_clip_text.null?
        @@mb_set_clip_text = Bridge.get_method_bind("Label", "set_clip_text", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_clip_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_clipping_text : Void* = Pointer(Void).null
    def is_clipping_text() : Bool
      if @@mb_is_clipping_text.null?
        @@mb_is_clipping_text = Bridge.get_method_bind("Label", "is_clipping_text", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_clipping_text, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tab_stops : Void* = Pointer(Void).null
    def set_tab_stops(tab_stops : Void*) : Void
      if @@mb_set_tab_stops.null?
        @@mb_set_tab_stops = Bridge.get_method_bind("Label", "set_tab_stops", 2899603908_i64)
      end
      val_0 = tab_stops
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_stops, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_stops : Void* = Pointer(Void).null
    def get_tab_stops() : Void*
      if @@mb_get_tab_stops.null?
        @@mb_get_tab_stops = Bridge.get_method_bind("Label", "get_tab_stops", 675695659_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tab_stops, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_text_overrun_behavior : Void* = Pointer(Void).null
    def set_text_overrun_behavior(overrun_behavior : Int64) : Void
      if @@mb_set_text_overrun_behavior.null?
        @@mb_set_text_overrun_behavior = Bridge.get_method_bind("Label", "set_text_overrun_behavior", 1008890932_i64)
      end
      val_0 = overrun_behavior
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_overrun_behavior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_overrun_behavior : Void* = Pointer(Void).null
    def get_text_overrun_behavior() : Int64
      if @@mb_get_text_overrun_behavior.null?
        @@mb_get_text_overrun_behavior = Bridge.get_method_bind("Label", "get_text_overrun_behavior", 3779142101_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_overrun_behavior, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_ellipsis_char : Void* = Pointer(Void).null
    def set_ellipsis_char(char : String) : Void
      if @@mb_set_ellipsis_char.null?
        @@mb_set_ellipsis_char = Bridge.get_method_bind("Label", "set_ellipsis_char", 83702148_i64)
      end
      val_0 = char
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_ellipsis_char, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ellipsis_char : Void* = Pointer(Void).null
    def get_ellipsis_char() : String
      if @@mb_get_ellipsis_char.null?
        @@mb_get_ellipsis_char = Bridge.get_method_bind("Label", "get_ellipsis_char", 201670096_i64)
      end
      ""
    end
    @@mb_set_uppercase : Void* = Pointer(Void).null
    def set_uppercase(enable : Bool) : Void
      if @@mb_set_uppercase.null?
        @@mb_set_uppercase = Bridge.get_method_bind("Label", "set_uppercase", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_uppercase, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_uppercase : Void* = Pointer(Void).null
    def is_uppercase() : Bool
      if @@mb_is_uppercase.null?
        @@mb_is_uppercase = Bridge.get_method_bind("Label", "is_uppercase", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_uppercase, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_line_height : Void* = Pointer(Void).null
    def get_line_height(line : Int64) : Int64
      if @@mb_get_line_height.null?
        @@mb_get_line_height = Bridge.get_method_bind("Label", "get_line_height", 181039630_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_height, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_count : Void* = Pointer(Void).null
    def get_line_count() : Int64
      if @@mb_get_line_count.null?
        @@mb_get_line_count = Bridge.get_method_bind("Label", "get_line_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visible_line_count : Void* = Pointer(Void).null
    def get_visible_line_count() : Int64
      if @@mb_get_visible_line_count.null?
        @@mb_get_visible_line_count = Bridge.get_method_bind("Label", "get_visible_line_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_line_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_total_character_count : Void* = Pointer(Void).null
    def get_total_character_count() : Int64
      if @@mb_get_total_character_count.null?
        @@mb_get_total_character_count = Bridge.get_method_bind("Label", "get_total_character_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_total_character_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_visible_characters : Void* = Pointer(Void).null
    def set_visible_characters(amount : Int64) : Void
      if @@mb_set_visible_characters.null?
        @@mb_set_visible_characters = Bridge.get_method_bind("Label", "set_visible_characters", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visible_characters, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_visible_characters : Void* = Pointer(Void).null
    def get_visible_characters() : Int64
      if @@mb_get_visible_characters.null?
        @@mb_get_visible_characters = Bridge.get_method_bind("Label", "get_visible_characters", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_characters, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visible_characters_behavior : Void* = Pointer(Void).null
    def get_visible_characters_behavior() : Int64
      if @@mb_get_visible_characters_behavior.null?
        @@mb_get_visible_characters_behavior = Bridge.get_method_bind("Label", "get_visible_characters_behavior", 258789322_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_characters_behavior, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_visible_characters_behavior : Void* = Pointer(Void).null
    def set_visible_characters_behavior(behavior : Int64) : Void
      if @@mb_set_visible_characters_behavior.null?
        @@mb_set_visible_characters_behavior = Bridge.get_method_bind("Label", "set_visible_characters_behavior", 3383839701_i64)
      end
      val_0 = behavior
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visible_characters_behavior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_visible_ratio : Void* = Pointer(Void).null
    def set_visible_ratio(ratio : Float64) : Void
      if @@mb_set_visible_ratio.null?
        @@mb_set_visible_ratio = Bridge.get_method_bind("Label", "set_visible_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visible_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_visible_ratio : Void* = Pointer(Void).null
    def get_visible_ratio() : Float64
      if @@mb_get_visible_ratio.null?
        @@mb_get_visible_ratio = Bridge.get_method_bind("Label", "get_visible_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_visible_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_lines_skipped : Void* = Pointer(Void).null
    def set_lines_skipped(lines_skipped : Int64) : Void
      if @@mb_set_lines_skipped.null?
        @@mb_set_lines_skipped = Bridge.get_method_bind("Label", "set_lines_skipped", 1286410249_i64)
      end
      val_0 = lines_skipped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_lines_skipped, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_lines_skipped : Void* = Pointer(Void).null
    def get_lines_skipped() : Int64
      if @@mb_get_lines_skipped.null?
        @@mb_get_lines_skipped = Bridge.get_method_bind("Label", "get_lines_skipped", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_lines_skipped, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_lines_visible : Void* = Pointer(Void).null
    def set_max_lines_visible(lines_visible : Int64) : Void
      if @@mb_set_max_lines_visible.null?
        @@mb_set_max_lines_visible = Bridge.get_method_bind("Label", "set_max_lines_visible", 1286410249_i64)
      end
      val_0 = lines_visible
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_lines_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_lines_visible : Void* = Pointer(Void).null
    def get_max_lines_visible() : Int64
      if @@mb_get_max_lines_visible.null?
        @@mb_get_max_lines_visible = Bridge.get_method_bind("Label", "get_max_lines_visible", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_lines_visible, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_structured_text_bidi_override : Void* = Pointer(Void).null
    def set_structured_text_bidi_override(parser : Int64) : Void
      if @@mb_set_structured_text_bidi_override.null?
        @@mb_set_structured_text_bidi_override = Bridge.get_method_bind("Label", "set_structured_text_bidi_override", 55961453_i64)
      end
      val_0 = parser
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override : Void* = Pointer(Void).null
    def get_structured_text_bidi_override() : Int64
      if @@mb_get_structured_text_bidi_override.null?
        @@mb_get_structured_text_bidi_override = Bridge.get_method_bind("Label", "get_structured_text_bidi_override", 3385126229_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def set_structured_text_bidi_override_options(args : Godot::Array) : Void
      if @@mb_set_structured_text_bidi_override_options.null?
        @@mb_set_structured_text_bidi_override_options = Bridge.get_method_bind("Label", "set_structured_text_bidi_override_options", 381264803_i64)
      end
      arg_ptr_0 = args ? args.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override_options, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def get_structured_text_bidi_override_options() : Godot::Array
      if @@mb_get_structured_text_bidi_override_options.null?
        @@mb_get_structured_text_bidi_override_options = Bridge.get_method_bind("Label", "get_structured_text_bidi_override_options", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override_options, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_resize_font_to_fit : Void* = Pointer(Void).null
    def set_resize_font_to_fit(enabled : Bool) : Void
      if @@mb_set_resize_font_to_fit.null?
        @@mb_set_resize_font_to_fit = Bridge.get_method_bind("Label", "set_resize_font_to_fit", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_resize_font_to_fit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_resize_font_to_fit_enabled : Void* = Pointer(Void).null
    def is_resize_font_to_fit_enabled() : Bool
      if @@mb_is_resize_font_to_fit_enabled.null?
        @@mb_is_resize_font_to_fit_enabled = Bridge.get_method_bind("Label", "is_resize_font_to_fit_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_resize_font_to_fit_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_minimum_font_size : Void* = Pointer(Void).null
    def set_minimum_font_size(size : Int64) : Void
      if @@mb_set_minimum_font_size.null?
        @@mb_set_minimum_font_size = Bridge.get_method_bind("Label", "set_minimum_font_size", 1286410249_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_minimum_font_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_minimum_font_size : Void* = Pointer(Void).null
    def get_minimum_font_size() : Int64
      if @@mb_get_minimum_font_size.null?
        @@mb_get_minimum_font_size = Bridge.get_method_bind("Label", "get_minimum_font_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_minimum_font_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_maximum_font_size : Void* = Pointer(Void).null
    def set_maximum_font_size(size : Int64) : Void
      if @@mb_set_maximum_font_size.null?
        @@mb_set_maximum_font_size = Bridge.get_method_bind("Label", "set_maximum_font_size", 1286410249_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_maximum_font_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_maximum_font_size : Void* = Pointer(Void).null
    def get_maximum_font_size() : Int64
      if @@mb_get_maximum_font_size.null?
        @@mb_get_maximum_font_size = Bridge.get_method_bind("Label", "get_maximum_font_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_maximum_font_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rendered_font_size : Void* = Pointer(Void).null
    def get_rendered_font_size() : Int64
      if @@mb_get_rendered_font_size.null?
        @@mb_get_rendered_font_size = Bridge.get_method_bind("Label", "get_rendered_font_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rendered_font_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_character_bounds : Void* = Pointer(Void).null
    def get_character_bounds(pos : Int64) : Rect2
      if @@mb_get_character_bounds.null?
        @@mb_get_character_bounds = Bridge.get_method_bind("Label", "get_character_bounds", 3327874267_i64)
      end
      val_0 = pos
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_character_bounds, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
  end
  class LineEdit < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum MenuItems : Int64
      MenuCut = 0_i64
      MenuCopy = 1_i64
      MenuPaste = 2_i64
      MenuClear = 3_i64
      MenuSelectAll = 4_i64
      MenuUndo = 5_i64
      MenuRedo = 6_i64
      MenuSubmenuTextDir = 7_i64
      MenuDirInherited = 8_i64
      MenuDirAuto = 9_i64
      MenuDirLtr = 10_i64
      MenuDirRtl = 11_i64
      MenuDisplayUcc = 12_i64
      MenuSubmenuInsertUcc = 13_i64
      MenuInsertLrm = 14_i64
      MenuInsertRlm = 15_i64
      MenuInsertLre = 16_i64
      MenuInsertRle = 17_i64
      MenuInsertLro = 18_i64
      MenuInsertRlo = 19_i64
      MenuInsertPdf = 20_i64
      MenuInsertAlm = 21_i64
      MenuInsertLri = 22_i64
      MenuInsertRli = 23_i64
      MenuInsertFsi = 24_i64
      MenuInsertPdi = 25_i64
      MenuInsertZwj = 26_i64
      MenuInsertZwnj = 27_i64
      MenuInsertWj = 28_i64
      MenuInsertShy = 29_i64
      MenuEmojiAndSymbol = 30_i64
      MenuMax = 31_i64
    end
    enum VirtualKeyboardType : Int64
      KeyboardTypeDefault = 0_i64
      KeyboardTypeMultiline = 1_i64
      KeyboardTypeNumber = 2_i64
      KeyboardTypeNumberDecimal = 3_i64
      KeyboardTypePhone = 4_i64
      KeyboardTypeEmailAddress = 5_i64
      KeyboardTypePassword = 6_i64
      KeyboardTypeUrl = 7_i64
    end
    enum ExpandMode : Int64
      ExpandModeOriginalSize = 0_i64
      ExpandModeFitToText = 1_i64
      ExpandModeFitToLineEdit = 2_i64
    end
    @@mb_has_ime_text : Void* = Pointer(Void).null
    def has_ime_text() : Bool
      if @@mb_has_ime_text.null?
        @@mb_has_ime_text = Bridge.get_method_bind("LineEdit", "has_ime_text", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_ime_text, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_cancel_ime : Void* = Pointer(Void).null
    def cancel_ime() : Void
      if @@mb_cancel_ime.null?
        @@mb_cancel_ime = Bridge.get_method_bind("LineEdit", "cancel_ime", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_cancel_ime, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_apply_ime : Void* = Pointer(Void).null
    def apply_ime() : Void
      if @@mb_apply_ime.null?
        @@mb_apply_ime = Bridge.get_method_bind("LineEdit", "apply_ime", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_apply_ime, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_horizontal_alignment : Void* = Pointer(Void).null
    def set_horizontal_alignment(alignment : Int64) : Void
      if @@mb_set_horizontal_alignment.null?
        @@mb_set_horizontal_alignment = Bridge.get_method_bind("LineEdit", "set_horizontal_alignment", 2312603777_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_horizontal_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_horizontal_alignment : Void* = Pointer(Void).null
    def get_horizontal_alignment() : Int64
      if @@mb_get_horizontal_alignment.null?
        @@mb_get_horizontal_alignment = Bridge.get_method_bind("LineEdit", "get_horizontal_alignment", 341400642_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_horizontal_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_edit : Void* = Pointer(Void).null
    def edit(hide_focus : Bool) : Void
      if @@mb_edit.null?
        @@mb_edit = Bridge.get_method_bind("LineEdit", "edit", 107499316_i64)
      end
      val_0 = hide_focus
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_edit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_unedit : Void* = Pointer(Void).null
    def unedit() : Void
      if @@mb_unedit.null?
        @@mb_unedit = Bridge.get_method_bind("LineEdit", "unedit", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_unedit, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_editing : Void* = Pointer(Void).null
    def is_editing() : Bool
      if @@mb_is_editing.null?
        @@mb_is_editing = Bridge.get_method_bind("LineEdit", "is_editing", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_keep_editing_on_text_submit : Void* = Pointer(Void).null
    def set_keep_editing_on_text_submit(enable : Bool) : Void
      if @@mb_set_keep_editing_on_text_submit.null?
        @@mb_set_keep_editing_on_text_submit = Bridge.get_method_bind("LineEdit", "set_keep_editing_on_text_submit", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_keep_editing_on_text_submit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editing_kept_on_text_submit : Void* = Pointer(Void).null
    def is_editing_kept_on_text_submit() : Bool
      if @@mb_is_editing_kept_on_text_submit.null?
        @@mb_is_editing_kept_on_text_submit = Bridge.get_method_bind("LineEdit", "is_editing_kept_on_text_submit", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editing_kept_on_text_submit, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("LineEdit", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_select : Void* = Pointer(Void).null
    def select_val(from : Int64, to : Int64) : Void
      if @@mb_select.null?
        @@mb_select = Bridge.get_method_bind("LineEdit", "select", 1328111411_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_select, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_select_all : Void* = Pointer(Void).null
    def select_all() : Void
      if @@mb_select_all.null?
        @@mb_select_all = Bridge.get_method_bind("LineEdit", "select_all", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_select_all, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_deselect : Void* = Pointer(Void).null
    def deselect() : Void
      if @@mb_deselect.null?
        @@mb_deselect = Bridge.get_method_bind("LineEdit", "deselect", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_deselect, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_has_undo : Void* = Pointer(Void).null
    def has_undo() : Bool
      if @@mb_has_undo.null?
        @@mb_has_undo = Bridge.get_method_bind("LineEdit", "has_undo", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_undo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_redo : Void* = Pointer(Void).null
    def has_redo() : Bool
      if @@mb_has_redo.null?
        @@mb_has_redo = Bridge.get_method_bind("LineEdit", "has_redo", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_redo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_selection : Void* = Pointer(Void).null
    def has_selection() : Bool
      if @@mb_has_selection.null?
        @@mb_has_selection = Bridge.get_method_bind("LineEdit", "has_selection", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_selection, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_selected_text : Void* = Pointer(Void).null
    def get_selected_text() : String
      if @@mb_get_selected_text.null?
        @@mb_get_selected_text = Bridge.get_method_bind("LineEdit", "get_selected_text", 2841200299_i64)
      end
      ""
    end
    @@mb_get_selection_from_column : Void* = Pointer(Void).null
    def get_selection_from_column() : Int64
      if @@mb_get_selection_from_column.null?
        @@mb_get_selection_from_column = Bridge.get_method_bind("LineEdit", "get_selection_from_column", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_from_column, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_to_column : Void* = Pointer(Void).null
    def get_selection_to_column() : Int64
      if @@mb_get_selection_to_column.null?
        @@mb_get_selection_to_column = Bridge.get_method_bind("LineEdit", "get_selection_to_column", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_to_column, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_text : Void* = Pointer(Void).null
    def set_text(text : String) : Void
      if @@mb_set_text.null?
        @@mb_set_text = Bridge.get_method_bind("LineEdit", "set_text", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text : Void* = Pointer(Void).null
    def get_text() : String
      if @@mb_get_text.null?
        @@mb_get_text = Bridge.get_method_bind("LineEdit", "get_text", 201670096_i64)
      end
      ""
    end
    @@mb_get_draw_control_chars : Void* = Pointer(Void).null
    def get_draw_control_chars() : Bool
      if @@mb_get_draw_control_chars.null?
        @@mb_get_draw_control_chars = Bridge.get_method_bind("LineEdit", "get_draw_control_chars", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_draw_control_chars, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_draw_control_chars : Void* = Pointer(Void).null
    def set_draw_control_chars(enable : Bool) : Void
      if @@mb_set_draw_control_chars.null?
        @@mb_set_draw_control_chars = Bridge.get_method_bind("LineEdit", "set_draw_control_chars", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_control_chars, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_text_direction : Void* = Pointer(Void).null
    def set_text_direction(direction : Int64) : Void
      if @@mb_set_text_direction.null?
        @@mb_set_text_direction = Bridge.get_method_bind("LineEdit", "set_text_direction", 119160795_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_direction : Void* = Pointer(Void).null
    def get_text_direction() : Int64
      if @@mb_get_text_direction.null?
        @@mb_get_text_direction = Bridge.get_method_bind("LineEdit", "get_text_direction", 797257663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_language : Void* = Pointer(Void).null
    def set_language(language : String) : Void
      if @@mb_set_language.null?
        @@mb_set_language = Bridge.get_method_bind("LineEdit", "set_language", 83702148_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_language : Void* = Pointer(Void).null
    def get_language() : String
      if @@mb_get_language.null?
        @@mb_get_language = Bridge.get_method_bind("LineEdit", "get_language", 201670096_i64)
      end
      ""
    end
    @@mb_set_structured_text_bidi_override : Void* = Pointer(Void).null
    def set_structured_text_bidi_override(parser : Int64) : Void
      if @@mb_set_structured_text_bidi_override.null?
        @@mb_set_structured_text_bidi_override = Bridge.get_method_bind("LineEdit", "set_structured_text_bidi_override", 55961453_i64)
      end
      val_0 = parser
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override : Void* = Pointer(Void).null
    def get_structured_text_bidi_override() : Int64
      if @@mb_get_structured_text_bidi_override.null?
        @@mb_get_structured_text_bidi_override = Bridge.get_method_bind("LineEdit", "get_structured_text_bidi_override", 3385126229_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def set_structured_text_bidi_override_options(args : Godot::Array) : Void
      if @@mb_set_structured_text_bidi_override_options.null?
        @@mb_set_structured_text_bidi_override_options = Bridge.get_method_bind("LineEdit", "set_structured_text_bidi_override_options", 381264803_i64)
      end
      arg_ptr_0 = args ? args.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override_options, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def get_structured_text_bidi_override_options() : Godot::Array
      if @@mb_get_structured_text_bidi_override_options.null?
        @@mb_get_structured_text_bidi_override_options = Bridge.get_method_bind("LineEdit", "get_structured_text_bidi_override_options", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override_options, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_placeholder : Void* = Pointer(Void).null
    def set_placeholder(text : String) : Void
      if @@mb_set_placeholder.null?
        @@mb_set_placeholder = Bridge.get_method_bind("LineEdit", "set_placeholder", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_placeholder, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_placeholder : Void* = Pointer(Void).null
    def get_placeholder() : String
      if @@mb_get_placeholder.null?
        @@mb_get_placeholder = Bridge.get_method_bind("LineEdit", "get_placeholder", 201670096_i64)
      end
      ""
    end
    @@mb_set_caret_column : Void* = Pointer(Void).null
    def set_caret_column(position : Int64) : Void
      if @@mb_set_caret_column.null?
        @@mb_set_caret_column = Bridge.get_method_bind("LineEdit", "set_caret_column", 1286410249_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_column, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caret_column : Void* = Pointer(Void).null
    def get_caret_column() : Int64
      if @@mb_get_caret_column.null?
        @@mb_get_caret_column = Bridge.get_method_bind("LineEdit", "get_caret_column", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_caret_column, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_next_composite_character_column : Void* = Pointer(Void).null
    def get_next_composite_character_column(column : Int64) : Int64
      if @@mb_get_next_composite_character_column.null?
        @@mb_get_next_composite_character_column = Bridge.get_method_bind("LineEdit", "get_next_composite_character_column", 923996154_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_next_composite_character_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_previous_composite_character_column : Void* = Pointer(Void).null
    def get_previous_composite_character_column(column : Int64) : Int64
      if @@mb_get_previous_composite_character_column.null?
        @@mb_get_previous_composite_character_column = Bridge.get_method_bind("LineEdit", "get_previous_composite_character_column", 923996154_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_previous_composite_character_column, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_scroll_offset : Void* = Pointer(Void).null
    def get_scroll_offset() : Float64
      if @@mb_get_scroll_offset.null?
        @@mb_get_scroll_offset = Bridge.get_method_bind("LineEdit", "get_scroll_offset", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_scroll_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_expand_to_text_length_enabled : Void* = Pointer(Void).null
    def set_expand_to_text_length_enabled(enabled : Bool) : Void
      if @@mb_set_expand_to_text_length_enabled.null?
        @@mb_set_expand_to_text_length_enabled = Bridge.get_method_bind("LineEdit", "set_expand_to_text_length_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_expand_to_text_length_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_expand_to_text_length_enabled : Void* = Pointer(Void).null
    def is_expand_to_text_length_enabled() : Bool
      if @@mb_is_expand_to_text_length_enabled.null?
        @@mb_is_expand_to_text_length_enabled = Bridge.get_method_bind("LineEdit", "is_expand_to_text_length_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_expand_to_text_length_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_caret_blink_enabled : Void* = Pointer(Void).null
    def set_caret_blink_enabled(enabled : Bool) : Void
      if @@mb_set_caret_blink_enabled.null?
        @@mb_set_caret_blink_enabled = Bridge.get_method_bind("LineEdit", "set_caret_blink_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_blink_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_caret_blink_enabled : Void* = Pointer(Void).null
    def is_caret_blink_enabled() : Bool
      if @@mb_is_caret_blink_enabled.null?
        @@mb_is_caret_blink_enabled = Bridge.get_method_bind("LineEdit", "is_caret_blink_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_caret_blink_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_caret_mid_grapheme_enabled : Void* = Pointer(Void).null
    def set_caret_mid_grapheme_enabled(enabled : Bool) : Void
      if @@mb_set_caret_mid_grapheme_enabled.null?
        @@mb_set_caret_mid_grapheme_enabled = Bridge.get_method_bind("LineEdit", "set_caret_mid_grapheme_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_mid_grapheme_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_caret_mid_grapheme_enabled : Void* = Pointer(Void).null
    def is_caret_mid_grapheme_enabled() : Bool
      if @@mb_is_caret_mid_grapheme_enabled.null?
        @@mb_is_caret_mid_grapheme_enabled = Bridge.get_method_bind("LineEdit", "is_caret_mid_grapheme_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_caret_mid_grapheme_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_caret_force_displayed : Void* = Pointer(Void).null
    def set_caret_force_displayed(enabled : Bool) : Void
      if @@mb_set_caret_force_displayed.null?
        @@mb_set_caret_force_displayed = Bridge.get_method_bind("LineEdit", "set_caret_force_displayed", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_force_displayed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_caret_force_displayed : Void* = Pointer(Void).null
    def is_caret_force_displayed() : Bool
      if @@mb_is_caret_force_displayed.null?
        @@mb_is_caret_force_displayed = Bridge.get_method_bind("LineEdit", "is_caret_force_displayed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_caret_force_displayed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_caret_blink_interval : Void* = Pointer(Void).null
    def set_caret_blink_interval(interval : Float64) : Void
      if @@mb_set_caret_blink_interval.null?
        @@mb_set_caret_blink_interval = Bridge.get_method_bind("LineEdit", "set_caret_blink_interval", 373806689_i64)
      end
      val_0 = interval
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_caret_blink_interval, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_caret_blink_interval : Void* = Pointer(Void).null
    def get_caret_blink_interval() : Float64
      if @@mb_get_caret_blink_interval.null?
        @@mb_get_caret_blink_interval = Bridge.get_method_bind("LineEdit", "get_caret_blink_interval", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_caret_blink_interval, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_length : Void* = Pointer(Void).null
    def set_max_length(chars : Int64) : Void
      if @@mb_set_max_length.null?
        @@mb_set_max_length = Bridge.get_method_bind("LineEdit", "set_max_length", 1286410249_i64)
      end
      val_0 = chars
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_length : Void* = Pointer(Void).null
    def get_max_length() : Int64
      if @@mb_get_max_length.null?
        @@mb_get_max_length = Bridge.get_method_bind("LineEdit", "get_max_length", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_insert_text_at_caret : Void* = Pointer(Void).null
    def insert_text_at_caret(text : String) : Void
      if @@mb_insert_text_at_caret.null?
        @@mb_insert_text_at_caret = Bridge.get_method_bind("LineEdit", "insert_text_at_caret", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_insert_text_at_caret, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_delete_char_at_caret : Void* = Pointer(Void).null
    def delete_char_at_caret() : Void
      if @@mb_delete_char_at_caret.null?
        @@mb_delete_char_at_caret = Bridge.get_method_bind("LineEdit", "delete_char_at_caret", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_delete_char_at_caret, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_delete_text : Void* = Pointer(Void).null
    def delete_text(from_column : Int64, to_column : Int64) : Void
      if @@mb_delete_text.null?
        @@mb_delete_text = Bridge.get_method_bind("LineEdit", "delete_text", 3937882851_i64)
      end
      val_0 = from_column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_delete_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_editable : Void* = Pointer(Void).null
    def set_editable(enabled : Bool) : Void
      if @@mb_set_editable.null?
        @@mb_set_editable = Bridge.get_method_bind("LineEdit", "set_editable", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editable : Void* = Pointer(Void).null
    def is_editable() : Bool
      if @@mb_is_editable.null?
        @@mb_is_editable = Bridge.get_method_bind("LineEdit", "is_editable", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_secret : Void* = Pointer(Void).null
    def set_secret(enabled : Bool) : Void
      if @@mb_set_secret.null?
        @@mb_set_secret = Bridge.get_method_bind("LineEdit", "set_secret", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_secret, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_secret : Void* = Pointer(Void).null
    def is_secret() : Bool
      if @@mb_is_secret.null?
        @@mb_is_secret = Bridge.get_method_bind("LineEdit", "is_secret", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_secret, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_secret_character : Void* = Pointer(Void).null
    def set_secret_character(character : String) : Void
      if @@mb_set_secret_character.null?
        @@mb_set_secret_character = Bridge.get_method_bind("LineEdit", "set_secret_character", 83702148_i64)
      end
      val_0 = character
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_secret_character, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_secret_character : Void* = Pointer(Void).null
    def get_secret_character() : String
      if @@mb_get_secret_character.null?
        @@mb_get_secret_character = Bridge.get_method_bind("LineEdit", "get_secret_character", 201670096_i64)
      end
      ""
    end
    @@mb_menu_option : Void* = Pointer(Void).null
    def menu_option(option : Int64) : Void
      if @@mb_menu_option.null?
        @@mb_menu_option = Bridge.get_method_bind("LineEdit", "menu_option", 1286410249_i64)
      end
      val_0 = option
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_menu_option, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_menu : Void* = Pointer(Void).null
    def get_menu() : PopupMenu
      if @@mb_get_menu.null?
        @@mb_get_menu = Bridge.get_method_bind("LineEdit", "get_menu", 229722558_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_menu, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PopupMenu.new(ret_ptr)
    end
    @@mb_is_menu_visible : Void* = Pointer(Void).null
    def is_menu_visible() : Bool
      if @@mb_is_menu_visible.null?
        @@mb_is_menu_visible = Bridge.get_method_bind("LineEdit", "is_menu_visible", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_menu_visible, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_context_menu_enabled : Void* = Pointer(Void).null
    def set_context_menu_enabled(enable : Bool) : Void
      if @@mb_set_context_menu_enabled.null?
        @@mb_set_context_menu_enabled = Bridge.get_method_bind("LineEdit", "set_context_menu_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_context_menu_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_context_menu_enabled : Void* = Pointer(Void).null
    def is_context_menu_enabled() : Bool
      if @@mb_is_context_menu_enabled.null?
        @@mb_is_context_menu_enabled = Bridge.get_method_bind("LineEdit", "is_context_menu_enabled", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_context_menu_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_emoji_menu_enabled : Void* = Pointer(Void).null
    def set_emoji_menu_enabled(enable : Bool) : Void
      if @@mb_set_emoji_menu_enabled.null?
        @@mb_set_emoji_menu_enabled = Bridge.get_method_bind("LineEdit", "set_emoji_menu_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emoji_menu_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_emoji_menu_enabled : Void* = Pointer(Void).null
    def is_emoji_menu_enabled() : Bool
      if @@mb_is_emoji_menu_enabled.null?
        @@mb_is_emoji_menu_enabled = Bridge.get_method_bind("LineEdit", "is_emoji_menu_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_emoji_menu_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_backspace_deletes_composite_character_enabled : Void* = Pointer(Void).null
    def set_backspace_deletes_composite_character_enabled(enable : Bool) : Void
      if @@mb_set_backspace_deletes_composite_character_enabled.null?
        @@mb_set_backspace_deletes_composite_character_enabled = Bridge.get_method_bind("LineEdit", "set_backspace_deletes_composite_character_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_backspace_deletes_composite_character_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_backspace_deletes_composite_character_enabled : Void* = Pointer(Void).null
    def is_backspace_deletes_composite_character_enabled() : Bool
      if @@mb_is_backspace_deletes_composite_character_enabled.null?
        @@mb_is_backspace_deletes_composite_character_enabled = Bridge.get_method_bind("LineEdit", "is_backspace_deletes_composite_character_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_backspace_deletes_composite_character_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_virtual_keyboard_enabled : Void* = Pointer(Void).null
    def set_virtual_keyboard_enabled(enable : Bool) : Void
      if @@mb_set_virtual_keyboard_enabled.null?
        @@mb_set_virtual_keyboard_enabled = Bridge.get_method_bind("LineEdit", "set_virtual_keyboard_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_virtual_keyboard_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_virtual_keyboard_enabled : Void* = Pointer(Void).null
    def is_virtual_keyboard_enabled() : Bool
      if @@mb_is_virtual_keyboard_enabled.null?
        @@mb_is_virtual_keyboard_enabled = Bridge.get_method_bind("LineEdit", "is_virtual_keyboard_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_virtual_keyboard_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_virtual_keyboard_show_on_focus : Void* = Pointer(Void).null
    def set_virtual_keyboard_show_on_focus(show_on_focus : Bool) : Void
      if @@mb_set_virtual_keyboard_show_on_focus.null?
        @@mb_set_virtual_keyboard_show_on_focus = Bridge.get_method_bind("LineEdit", "set_virtual_keyboard_show_on_focus", 2586408642_i64)
      end
      val_0 = show_on_focus
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_virtual_keyboard_show_on_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_virtual_keyboard_show_on_focus : Void* = Pointer(Void).null
    def get_virtual_keyboard_show_on_focus() : Bool
      if @@mb_get_virtual_keyboard_show_on_focus.null?
        @@mb_get_virtual_keyboard_show_on_focus = Bridge.get_method_bind("LineEdit", "get_virtual_keyboard_show_on_focus", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_virtual_keyboard_show_on_focus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_virtual_keyboard_type : Void* = Pointer(Void).null
    def set_virtual_keyboard_type(get_type : Int64) : Void
      if @@mb_set_virtual_keyboard_type.null?
        @@mb_set_virtual_keyboard_type = Bridge.get_method_bind("LineEdit", "set_virtual_keyboard_type", 2696893573_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_virtual_keyboard_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_virtual_keyboard_type : Void* = Pointer(Void).null
    def get_virtual_keyboard_type() : Int64
      if @@mb_get_virtual_keyboard_type.null?
        @@mb_get_virtual_keyboard_type = Bridge.get_method_bind("LineEdit", "get_virtual_keyboard_type", 1928699316_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_virtual_keyboard_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_clear_button_enabled : Void* = Pointer(Void).null
    def set_clear_button_enabled(enable : Bool) : Void
      if @@mb_set_clear_button_enabled.null?
        @@mb_set_clear_button_enabled = Bridge.get_method_bind("LineEdit", "set_clear_button_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_clear_button_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_clear_button_enabled : Void* = Pointer(Void).null
    def is_clear_button_enabled() : Bool
      if @@mb_is_clear_button_enabled.null?
        @@mb_is_clear_button_enabled = Bridge.get_method_bind("LineEdit", "is_clear_button_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_clear_button_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shortcut_keys_enabled : Void* = Pointer(Void).null
    def set_shortcut_keys_enabled(enable : Bool) : Void
      if @@mb_set_shortcut_keys_enabled.null?
        @@mb_set_shortcut_keys_enabled = Bridge.get_method_bind("LineEdit", "set_shortcut_keys_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shortcut_keys_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shortcut_keys_enabled : Void* = Pointer(Void).null
    def is_shortcut_keys_enabled() : Bool
      if @@mb_is_shortcut_keys_enabled.null?
        @@mb_is_shortcut_keys_enabled = Bridge.get_method_bind("LineEdit", "is_shortcut_keys_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shortcut_keys_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_middle_mouse_paste_enabled : Void* = Pointer(Void).null
    def set_middle_mouse_paste_enabled(enable : Bool) : Void
      if @@mb_set_middle_mouse_paste_enabled.null?
        @@mb_set_middle_mouse_paste_enabled = Bridge.get_method_bind("LineEdit", "set_middle_mouse_paste_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_middle_mouse_paste_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_middle_mouse_paste_enabled : Void* = Pointer(Void).null
    def is_middle_mouse_paste_enabled() : Bool
      if @@mb_is_middle_mouse_paste_enabled.null?
        @@mb_is_middle_mouse_paste_enabled = Bridge.get_method_bind("LineEdit", "is_middle_mouse_paste_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_middle_mouse_paste_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_selecting_enabled : Void* = Pointer(Void).null
    def set_selecting_enabled(enable : Bool) : Void
      if @@mb_set_selecting_enabled.null?
        @@mb_set_selecting_enabled = Bridge.get_method_bind("LineEdit", "set_selecting_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_selecting_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_selecting_enabled : Void* = Pointer(Void).null
    def is_selecting_enabled() : Bool
      if @@mb_is_selecting_enabled.null?
        @@mb_is_selecting_enabled = Bridge.get_method_bind("LineEdit", "is_selecting_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_selecting_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_deselect_on_focus_loss_enabled : Void* = Pointer(Void).null
    def set_deselect_on_focus_loss_enabled(enable : Bool) : Void
      if @@mb_set_deselect_on_focus_loss_enabled.null?
        @@mb_set_deselect_on_focus_loss_enabled = Bridge.get_method_bind("LineEdit", "set_deselect_on_focus_loss_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deselect_on_focus_loss_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_deselect_on_focus_loss_enabled : Void* = Pointer(Void).null
    def is_deselect_on_focus_loss_enabled() : Bool
      if @@mb_is_deselect_on_focus_loss_enabled.null?
        @@mb_is_deselect_on_focus_loss_enabled = Bridge.get_method_bind("LineEdit", "is_deselect_on_focus_loss_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_deselect_on_focus_loss_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drag_and_drop_selection_enabled : Void* = Pointer(Void).null
    def set_drag_and_drop_selection_enabled(enable : Bool) : Void
      if @@mb_set_drag_and_drop_selection_enabled.null?
        @@mb_set_drag_and_drop_selection_enabled = Bridge.get_method_bind("LineEdit", "set_drag_and_drop_selection_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_and_drop_selection_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drag_and_drop_selection_enabled : Void* = Pointer(Void).null
    def is_drag_and_drop_selection_enabled() : Bool
      if @@mb_is_drag_and_drop_selection_enabled.null?
        @@mb_is_drag_and_drop_selection_enabled = Bridge.get_method_bind("LineEdit", "is_drag_and_drop_selection_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drag_and_drop_selection_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_right_icon : Void* = Pointer(Void).null
    def set_right_icon(icon : Texture2D) : Void
      if @@mb_set_right_icon.null?
        @@mb_set_right_icon = Bridge.get_method_bind("LineEdit", "set_right_icon", 4051416890_i64)
      end
      val_0 = icon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_right_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_right_icon : Void* = Pointer(Void).null
    def get_right_icon() : Texture2D
      if @@mb_get_right_icon.null?
        @@mb_get_right_icon = Bridge.get_method_bind("LineEdit", "get_right_icon", 255860311_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_right_icon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_icon_expand_mode : Void* = Pointer(Void).null
    def set_icon_expand_mode(mode : Int64) : Void
      if @@mb_set_icon_expand_mode.null?
        @@mb_set_icon_expand_mode = Bridge.get_method_bind("LineEdit", "set_icon_expand_mode", 3019903192_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_icon_expand_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_icon_expand_mode : Void* = Pointer(Void).null
    def get_icon_expand_mode() : Int64
      if @@mb_get_icon_expand_mode.null?
        @@mb_get_icon_expand_mode = Bridge.get_method_bind("LineEdit", "get_icon_expand_mode", 3273584435_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_icon_expand_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_right_icon_scale : Void* = Pointer(Void).null
    def set_right_icon_scale(scale : Float64) : Void
      if @@mb_set_right_icon_scale.null?
        @@mb_set_right_icon_scale = Bridge.get_method_bind("LineEdit", "set_right_icon_scale", 373806689_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_right_icon_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_right_icon_scale : Void* = Pointer(Void).null
    def get_right_icon_scale() : Float64
      if @@mb_get_right_icon_scale.null?
        @@mb_get_right_icon_scale = Bridge.get_method_bind("LineEdit", "get_right_icon_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_right_icon_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_flat : Void* = Pointer(Void).null
    def set_flat(enabled : Bool) : Void
      if @@mb_set_flat.null?
        @@mb_set_flat = Bridge.get_method_bind("LineEdit", "set_flat", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flat : Void* = Pointer(Void).null
    def is_flat() : Bool
      if @@mb_is_flat.null?
        @@mb_is_flat = Bridge.get_method_bind("LineEdit", "is_flat", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flat, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_select_all_on_focus : Void* = Pointer(Void).null
    def set_select_all_on_focus(enabled : Bool) : Void
      if @@mb_set_select_all_on_focus.null?
        @@mb_set_select_all_on_focus = Bridge.get_method_bind("LineEdit", "set_select_all_on_focus", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_select_all_on_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_select_all_on_focus : Void* = Pointer(Void).null
    def is_select_all_on_focus() : Bool
      if @@mb_is_select_all_on_focus.null?
        @@mb_is_select_all_on_focus = Bridge.get_method_bind("LineEdit", "is_select_all_on_focus", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_select_all_on_focus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class MenuBar < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_switch_on_hover : Void* = Pointer(Void).null
    def set_switch_on_hover(enable : Bool) : Void
      if @@mb_set_switch_on_hover.null?
        @@mb_set_switch_on_hover = Bridge.get_method_bind("MenuBar", "set_switch_on_hover", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_switch_on_hover, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_switch_on_hover : Void* = Pointer(Void).null
    def is_switch_on_hover() : Bool
      if @@mb_is_switch_on_hover.null?
        @@mb_is_switch_on_hover = Bridge.get_method_bind("MenuBar", "is_switch_on_hover", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_switch_on_hover, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_disable_shortcuts : Void* = Pointer(Void).null
    def set_disable_shortcuts(disabled : Bool) : Void
      if @@mb_set_disable_shortcuts.null?
        @@mb_set_disable_shortcuts = Bridge.get_method_bind("MenuBar", "set_disable_shortcuts", 2586408642_i64)
      end
      val_0 = disabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_disable_shortcuts, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_prefer_global_menu : Void* = Pointer(Void).null
    def set_prefer_global_menu(enabled : Bool) : Void
      if @@mb_set_prefer_global_menu.null?
        @@mb_set_prefer_global_menu = Bridge.get_method_bind("MenuBar", "set_prefer_global_menu", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_prefer_global_menu, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_prefer_global_menu : Void* = Pointer(Void).null
    def is_prefer_global_menu() : Bool
      if @@mb_is_prefer_global_menu.null?
        @@mb_is_prefer_global_menu = Bridge.get_method_bind("MenuBar", "is_prefer_global_menu", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_prefer_global_menu, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_native_menu : Void* = Pointer(Void).null
    def is_native_menu() : Bool
      if @@mb_is_native_menu.null?
        @@mb_is_native_menu = Bridge.get_method_bind("MenuBar", "is_native_menu", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_native_menu, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_menu_count : Void* = Pointer(Void).null
    def get_menu_count() : Int64
      if @@mb_get_menu_count.null?
        @@mb_get_menu_count = Bridge.get_method_bind("MenuBar", "get_menu_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_menu_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_text_direction : Void* = Pointer(Void).null
    def set_text_direction(direction : Int64) : Void
      if @@mb_set_text_direction.null?
        @@mb_set_text_direction = Bridge.get_method_bind("MenuBar", "set_text_direction", 119160795_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_direction : Void* = Pointer(Void).null
    def get_text_direction() : Int64
      if @@mb_get_text_direction.null?
        @@mb_get_text_direction = Bridge.get_method_bind("MenuBar", "get_text_direction", 797257663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_language : Void* = Pointer(Void).null
    def set_language(language : String) : Void
      if @@mb_set_language.null?
        @@mb_set_language = Bridge.get_method_bind("MenuBar", "set_language", 83702148_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_language : Void* = Pointer(Void).null
    def get_language() : String
      if @@mb_get_language.null?
        @@mb_get_language = Bridge.get_method_bind("MenuBar", "get_language", 201670096_i64)
      end
      ""
    end
    @@mb_set_flat : Void* = Pointer(Void).null
    def set_flat(enabled : Bool) : Void
      if @@mb_set_flat.null?
        @@mb_set_flat = Bridge.get_method_bind("MenuBar", "set_flat", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flat : Void* = Pointer(Void).null
    def is_flat() : Bool
      if @@mb_is_flat.null?
        @@mb_is_flat = Bridge.get_method_bind("MenuBar", "is_flat", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flat, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_start_index : Void* = Pointer(Void).null
    def set_start_index(enabled : Int64) : Void
      if @@mb_set_start_index.null?
        @@mb_set_start_index = Bridge.get_method_bind("MenuBar", "set_start_index", 1286410249_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_start_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_start_index : Void* = Pointer(Void).null
    def get_start_index() : Int64
      if @@mb_get_start_index.null?
        @@mb_get_start_index = Bridge.get_method_bind("MenuBar", "get_start_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_start_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_menu_title : Void* = Pointer(Void).null
    def set_menu_title(menu : Int64, title : String) : Void
      if @@mb_set_menu_title.null?
        @@mb_set_menu_title = Bridge.get_method_bind("MenuBar", "set_menu_title", 501894301_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = title
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_menu_title, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_menu_title : Void* = Pointer(Void).null
    def get_menu_title(menu : Int64) : String
      if @@mb_get_menu_title.null?
        @@mb_get_menu_title = Bridge.get_method_bind("MenuBar", "get_menu_title", 844755477_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_menu_tooltip : Void* = Pointer(Void).null
    def set_menu_tooltip(menu : Int64, tooltip : String) : Void
      if @@mb_set_menu_tooltip.null?
        @@mb_set_menu_tooltip = Bridge.get_method_bind("MenuBar", "set_menu_tooltip", 501894301_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_menu_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_menu_tooltip : Void* = Pointer(Void).null
    def get_menu_tooltip(menu : Int64) : String
      if @@mb_get_menu_tooltip.null?
        @@mb_get_menu_tooltip = Bridge.get_method_bind("MenuBar", "get_menu_tooltip", 844755477_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_menu_disabled : Void* = Pointer(Void).null
    def set_menu_disabled(menu : Int64, disabled : Bool) : Void
      if @@mb_set_menu_disabled.null?
        @@mb_set_menu_disabled = Bridge.get_method_bind("MenuBar", "set_menu_disabled", 300928843_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_menu_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_menu_disabled : Void* = Pointer(Void).null
    def is_menu_disabled(menu : Int64) : Bool
      if @@mb_is_menu_disabled.null?
        @@mb_is_menu_disabled = Bridge.get_method_bind("MenuBar", "is_menu_disabled", 1116898809_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_menu_disabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_menu_hidden : Void* = Pointer(Void).null
    def set_menu_hidden(menu : Int64, hidden : Bool) : Void
      if @@mb_set_menu_hidden.null?
        @@mb_set_menu_hidden = Bridge.get_method_bind("MenuBar", "set_menu_hidden", 300928843_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = hidden
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_menu_hidden, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_menu_hidden : Void* = Pointer(Void).null
    def is_menu_hidden(menu : Int64) : Bool
      if @@mb_is_menu_hidden.null?
        @@mb_is_menu_hidden = Bridge.get_method_bind("MenuBar", "is_menu_hidden", 1116898809_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_menu_hidden, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_menu_popup : Void* = Pointer(Void).null
    def get_menu_popup(menu : Int64) : PopupMenu
      if @@mb_get_menu_popup.null?
        @@mb_get_menu_popup = Bridge.get_method_bind("MenuBar", "get_menu_popup", 2100501353_i64)
      end
      val_0 = menu
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_menu_popup, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      PopupMenu.new(ret_ptr)
    end
  end
  class NinePatchRect < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum AxisStretchMode : Int64
      AxisStretchModeStretch = 0_i64
      AxisStretchModeTile = 1_i64
      AxisStretchModeTileFit = 2_i64
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("NinePatchRect", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("NinePatchRect", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_patch_margin : Void* = Pointer(Void).null
    def set_patch_margin(margin : Int64, value : Int64) : Void
      if @@mb_set_patch_margin.null?
        @@mb_set_patch_margin = Bridge.get_method_bind("NinePatchRect", "set_patch_margin", 437707142_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_patch_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_patch_margin : Void* = Pointer(Void).null
    def get_patch_margin(margin : Int64) : Int64
      if @@mb_get_patch_margin.null?
        @@mb_get_patch_margin = Bridge.get_method_bind("NinePatchRect", "get_patch_margin", 1983885014_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_patch_margin, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_region_rect : Void* = Pointer(Void).null
    def set_region_rect(rect : Rect2) : Void
      if @@mb_set_region_rect.null?
        @@mb_set_region_rect = Bridge.get_method_bind("NinePatchRect", "set_region_rect", 2046264180_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_region_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_region_rect : Void* = Pointer(Void).null
    def get_region_rect() : Rect2
      if @@mb_get_region_rect.null?
        @@mb_get_region_rect = Bridge.get_method_bind("NinePatchRect", "get_region_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_region_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_set_draw_center : Void* = Pointer(Void).null
    def set_draw_center(draw_center : Bool) : Void
      if @@mb_set_draw_center.null?
        @@mb_set_draw_center = Bridge.get_method_bind("NinePatchRect", "set_draw_center", 2586408642_i64)
      end
      val_0 = draw_center
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_center, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_draw_center_enabled : Void* = Pointer(Void).null
    def is_draw_center_enabled() : Bool
      if @@mb_is_draw_center_enabled.null?
        @@mb_is_draw_center_enabled = Bridge.get_method_bind("NinePatchRect", "is_draw_center_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_draw_center_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_h_axis_stretch_mode : Void* = Pointer(Void).null
    def set_h_axis_stretch_mode(mode : Int64) : Void
      if @@mb_set_h_axis_stretch_mode.null?
        @@mb_set_h_axis_stretch_mode = Bridge.get_method_bind("NinePatchRect", "set_h_axis_stretch_mode", 3219608417_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_h_axis_stretch_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_h_axis_stretch_mode : Void* = Pointer(Void).null
    def get_h_axis_stretch_mode() : Int64
      if @@mb_get_h_axis_stretch_mode.null?
        @@mb_get_h_axis_stretch_mode = Bridge.get_method_bind("NinePatchRect", "get_h_axis_stretch_mode", 3317113799_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_h_axis_stretch_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_v_axis_stretch_mode : Void* = Pointer(Void).null
    def set_v_axis_stretch_mode(mode : Int64) : Void
      if @@mb_set_v_axis_stretch_mode.null?
        @@mb_set_v_axis_stretch_mode = Bridge.get_method_bind("NinePatchRect", "set_v_axis_stretch_mode", 3219608417_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_axis_stretch_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_axis_stretch_mode : Void* = Pointer(Void).null
    def get_v_axis_stretch_mode() : Int64
      if @@mb_get_v_axis_stretch_mode.null?
        @@mb_get_v_axis_stretch_mode = Bridge.get_method_bind("NinePatchRect", "get_v_axis_stretch_mode", 3317113799_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_v_axis_stretch_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Panel < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class ProgressBar < Godot::Range
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum FillMode : Int64
      FillBeginToEnd = 0_i64
      FillEndToBegin = 1_i64
      FillTopToBottom = 2_i64
      FillBottomToTop = 3_i64
    end
    @@mb_set_fill_mode : Void* = Pointer(Void).null
    def set_fill_mode(mode : Int64) : Void
      if @@mb_set_fill_mode.null?
        @@mb_set_fill_mode = Bridge.get_method_bind("ProgressBar", "set_fill_mode", 1286410249_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fill_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fill_mode : Void* = Pointer(Void).null
    def get_fill_mode() : Int64
      if @@mb_get_fill_mode.null?
        @@mb_get_fill_mode = Bridge.get_method_bind("ProgressBar", "get_fill_mode", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fill_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_show_percentage : Void* = Pointer(Void).null
    def set_show_percentage(visible : Bool) : Void
      if @@mb_set_show_percentage.null?
        @@mb_set_show_percentage = Bridge.get_method_bind("ProgressBar", "set_show_percentage", 2586408642_i64)
      end
      val_0 = visible
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_percentage, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_percentage_shown : Void* = Pointer(Void).null
    def is_percentage_shown() : Bool
      if @@mb_is_percentage_shown.null?
        @@mb_is_percentage_shown = Bridge.get_method_bind("ProgressBar", "is_percentage_shown", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_percentage_shown, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_indeterminate : Void* = Pointer(Void).null
    def set_indeterminate(indeterminate : Bool) : Void
      if @@mb_set_indeterminate.null?
        @@mb_set_indeterminate = Bridge.get_method_bind("ProgressBar", "set_indeterminate", 2586408642_i64)
      end
      val_0 = indeterminate
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_indeterminate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_indeterminate : Void* = Pointer(Void).null
    def is_indeterminate() : Bool
      if @@mb_is_indeterminate.null?
        @@mb_is_indeterminate = Bridge.get_method_bind("ProgressBar", "is_indeterminate", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_indeterminate, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_editor_preview_indeterminate : Void* = Pointer(Void).null
    def set_editor_preview_indeterminate(preview_indeterminate : Bool) : Void
      if @@mb_set_editor_preview_indeterminate.null?
        @@mb_set_editor_preview_indeterminate = Bridge.get_method_bind("ProgressBar", "set_editor_preview_indeterminate", 2586408642_i64)
      end
      val_0 = preview_indeterminate
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editor_preview_indeterminate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editor_preview_indeterminate_enabled : Void* = Pointer(Void).null
    def is_editor_preview_indeterminate_enabled() : Bool
      if @@mb_is_editor_preview_indeterminate_enabled.null?
        @@mb_is_editor_preview_indeterminate_enabled = Bridge.get_method_bind("ProgressBar", "is_editor_preview_indeterminate_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editor_preview_indeterminate_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class ReferenceRect < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_border_color : Void* = Pointer(Void).null
    def get_border_color() : Color
      if @@mb_get_border_color.null?
        @@mb_get_border_color = Bridge.get_method_bind("ReferenceRect", "get_border_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_border_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_border_color : Void* = Pointer(Void).null
    def set_border_color(color : Color) : Void
      if @@mb_set_border_color.null?
        @@mb_set_border_color = Bridge.get_method_bind("ReferenceRect", "set_border_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_border_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_border_width : Void* = Pointer(Void).null
    def get_border_width() : Float64
      if @@mb_get_border_width.null?
        @@mb_get_border_width = Bridge.get_method_bind("ReferenceRect", "get_border_width", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_border_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_border_width : Void* = Pointer(Void).null
    def set_border_width(width : Float64) : Void
      if @@mb_set_border_width.null?
        @@mb_set_border_width = Bridge.get_method_bind("ReferenceRect", "set_border_width", 373806689_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_border_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_editor_only : Void* = Pointer(Void).null
    def get_editor_only() : Bool
      if @@mb_get_editor_only.null?
        @@mb_get_editor_only = Bridge.get_method_bind("ReferenceRect", "get_editor_only", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_editor_only, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_editor_only : Void* = Pointer(Void).null
    def set_editor_only(enabled : Bool) : Void
      if @@mb_set_editor_only.null?
        @@mb_set_editor_only = Bridge.get_method_bind("ReferenceRect", "set_editor_only", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editor_only, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class RichTextLabel < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ListType : Int64
      ListNumbers = 0_i64
      ListLetters = 1_i64
      ListRoman = 2_i64
      ListDots = 3_i64
    end
    enum MenuItems : Int64
      MenuCopy = 0_i64
      MenuSelectAll = 1_i64
      MenuMax = 2_i64
    end
    enum MetaUnderline : Int64
      MetaUnderlineNever = 0_i64
      MetaUnderlineAlways = 1_i64
      MetaUnderlineOnHover = 2_i64
    end
    enum ImageUpdateMask : Int64
      UpdateTexture = 1_i64
      UpdateSize = 2_i64
      UpdateColor = 4_i64
      UpdateAlignment = 8_i64
      UpdateRegion = 16_i64
      UpdatePad = 32_i64
      UpdateTooltip = 64_i64
      UpdateWidthUnit = 128_i64
    end
    enum ImageUnit : Int64
      ImageUnitPixel = 0_i64
      ImageUnitPercent = 1_i64
      ImageUnitEm = 2_i64
    end
    @@mb_get_parsed_text : Void* = Pointer(Void).null
    def get_parsed_text() : String
      if @@mb_get_parsed_text.null?
        @@mb_get_parsed_text = Bridge.get_method_bind("RichTextLabel", "get_parsed_text", 201670096_i64)
      end
      ""
    end
    @@mb_add_text : Void* = Pointer(Void).null
    def add_text(text : String) : Void
      if @@mb_add_text.null?
        @@mb_add_text = Bridge.get_method_bind("RichTextLabel", "add_text", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_text : Void* = Pointer(Void).null
    def set_text(text : String) : Void
      if @@mb_set_text.null?
        @@mb_set_text = Bridge.get_method_bind("RichTextLabel", "set_text", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_hr : Void* = Pointer(Void).null
    def add_hr(width : Int64, height : Int64, color : Color, alignment : Int64, width_in_percent : Bool, height_in_percent : Bool) : Void
      if @@mb_add_hr.null?
        @@mb_add_hr = Bridge.get_method_bind("RichTextLabel", "add_hr", 16816895_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = height
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = color
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = alignment
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = width_in_percent
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = height_in_percent
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_add_hr, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_image : Void* = Pointer(Void).null
    def add_image(image : Texture2D, width : Float64, height : Float64, color : Color, inline_align : Int64, region : Rect2, key : Void*, pad : Bool, tooltip : String, width_unit : Int64, height_unit : Int64, alt_text : String) : Void
      if @@mb_add_image.null?
        @@mb_add_image = Bridge.get_method_bind("RichTextLabel", "add_image", 1980227702_i64)
      end
      val_0 = image
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = height
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = color
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = inline_align
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = region
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = key
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = pad
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = tooltip
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = width_unit
      arg_9 = pointerof(val_9).as(Void*)
      val_10 = height_unit
      arg_10 = pointerof(val_10).as(Void*)
      val_11 = alt_text
      arg_11 = pointerof(val_11).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10, arg_11]
      Bridge.ptrcall(@@mb_add_image, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_image : Void* = Pointer(Void).null
    def update_image(key : Void*, mask : Int64, image : Texture2D, width : Float64, height : Float64, color : Color, inline_align : Int64, region : Rect2, pad : Bool, tooltip : String, width_unit : Int64, height_unit : Int64) : Void
      if @@mb_update_image.null?
        @@mb_update_image = Bridge.get_method_bind("RichTextLabel", "update_image", 202998225_i64)
      end
      val_0 = key
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = image
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = width
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = height
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = color
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = inline_align
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = region
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = pad
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = tooltip
      arg_9 = pointerof(val_9).as(Void*)
      val_10 = width_unit
      arg_10 = pointerof(val_10).as(Void*)
      val_11 = height_unit
      arg_11 = pointerof(val_11).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10, arg_11]
      Bridge.ptrcall(@@mb_update_image, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_newline : Void* = Pointer(Void).null
    def newline() : Void
      if @@mb_newline.null?
        @@mb_newline = Bridge.get_method_bind("RichTextLabel", "newline", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_newline, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_remove_paragraph : Void* = Pointer(Void).null
    def remove_paragraph(paragraph : Int64, no_invalidate : Bool) : Bool
      if @@mb_remove_paragraph.null?
        @@mb_remove_paragraph = Bridge.get_method_bind("RichTextLabel", "remove_paragraph", 3262369265_i64)
      end
      val_0 = paragraph
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = no_invalidate
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_remove_paragraph, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_invalidate_paragraph : Void* = Pointer(Void).null
    def invalidate_paragraph(paragraph : Int64) : Bool
      if @@mb_invalidate_paragraph.null?
        @@mb_invalidate_paragraph = Bridge.get_method_bind("RichTextLabel", "invalidate_paragraph", 3067735520_i64)
      end
      val_0 = paragraph
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_invalidate_paragraph, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_push_font : Void* = Pointer(Void).null
    def push_font(font : Font, font_size : Int64) : Void
      if @@mb_push_font.null?
        @@mb_push_font = Bridge.get_method_bind("RichTextLabel", "push_font", 2347424842_i64)
      end
      val_0 = font
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = font_size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_push_font, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_font_size : Void* = Pointer(Void).null
    def push_font_size(font_size : Int64) : Void
      if @@mb_push_font_size.null?
        @@mb_push_font_size = Bridge.get_method_bind("RichTextLabel", "push_font_size", 1286410249_i64)
      end
      val_0 = font_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_font_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_normal : Void* = Pointer(Void).null
    def push_normal() : Void
      if @@mb_push_normal.null?
        @@mb_push_normal = Bridge.get_method_bind("RichTextLabel", "push_normal", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_push_normal, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_push_bold : Void* = Pointer(Void).null
    def push_bold() : Void
      if @@mb_push_bold.null?
        @@mb_push_bold = Bridge.get_method_bind("RichTextLabel", "push_bold", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_push_bold, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_push_bold_italics : Void* = Pointer(Void).null
    def push_bold_italics() : Void
      if @@mb_push_bold_italics.null?
        @@mb_push_bold_italics = Bridge.get_method_bind("RichTextLabel", "push_bold_italics", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_push_bold_italics, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_push_italics : Void* = Pointer(Void).null
    def push_italics() : Void
      if @@mb_push_italics.null?
        @@mb_push_italics = Bridge.get_method_bind("RichTextLabel", "push_italics", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_push_italics, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_push_mono : Void* = Pointer(Void).null
    def push_mono() : Void
      if @@mb_push_mono.null?
        @@mb_push_mono = Bridge.get_method_bind("RichTextLabel", "push_mono", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_push_mono, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_push_color : Void* = Pointer(Void).null
    def push_color(color : Color) : Void
      if @@mb_push_color.null?
        @@mb_push_color = Bridge.get_method_bind("RichTextLabel", "push_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_outline_size : Void* = Pointer(Void).null
    def push_outline_size(outline_size : Int64) : Void
      if @@mb_push_outline_size.null?
        @@mb_push_outline_size = Bridge.get_method_bind("RichTextLabel", "push_outline_size", 1286410249_i64)
      end
      val_0 = outline_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_outline_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_outline_color : Void* = Pointer(Void).null
    def push_outline_color(color : Color) : Void
      if @@mb_push_outline_color.null?
        @@mb_push_outline_color = Bridge.get_method_bind("RichTextLabel", "push_outline_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_outline_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_paragraph : Void* = Pointer(Void).null
    def push_paragraph(alignment : Int64, base_direction : Int64, language : String, st_parser : Int64, justification_flags : Int64, tab_stops : Void*) : Void
      if @@mb_push_paragraph.null?
        @@mb_push_paragraph = Bridge.get_method_bind("RichTextLabel", "push_paragraph", 3089306873_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = base_direction
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = language
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = st_parser
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = justification_flags
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = tab_stops
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_push_paragraph, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_indent : Void* = Pointer(Void).null
    def push_indent(level : Int64) : Void
      if @@mb_push_indent.null?
        @@mb_push_indent = Bridge.get_method_bind("RichTextLabel", "push_indent", 1286410249_i64)
      end
      val_0 = level
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_indent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_list : Void* = Pointer(Void).null
    def push_list(level : Int64, get_type : Int64, capitalize : Bool, bullet : String) : Void
      if @@mb_push_list.null?
        @@mb_push_list = Bridge.get_method_bind("RichTextLabel", "push_list", 3017143144_i64)
      end
      val_0 = level
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = capitalize
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = bullet
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_push_list, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_meta : Void* = Pointer(Void).null
    def push_meta(data : Void*, underline_mode : Int64, tooltip : String) : Void
      if @@mb_push_meta.null?
        @@mb_push_meta = Bridge.get_method_bind("RichTextLabel", "push_meta", 3765356747_i64)
      end
      val_0 = data
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = underline_mode
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = tooltip
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_push_meta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_hint : Void* = Pointer(Void).null
    def push_hint(description : String) : Void
      if @@mb_push_hint.null?
        @@mb_push_hint = Bridge.get_method_bind("RichTextLabel", "push_hint", 83702148_i64)
      end
      val_0 = description
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_language : Void* = Pointer(Void).null
    def push_language(language : String) : Void
      if @@mb_push_language.null?
        @@mb_push_language = Bridge.get_method_bind("RichTextLabel", "push_language", 83702148_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_underline : Void* = Pointer(Void).null
    def push_underline(color : Color) : Void
      if @@mb_push_underline.null?
        @@mb_push_underline = Bridge.get_method_bind("RichTextLabel", "push_underline", 1458098034_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_underline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_strikethrough : Void* = Pointer(Void).null
    def push_strikethrough(color : Color) : Void
      if @@mb_push_strikethrough.null?
        @@mb_push_strikethrough = Bridge.get_method_bind("RichTextLabel", "push_strikethrough", 1458098034_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_strikethrough, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_table : Void* = Pointer(Void).null
    def push_table(columns : Int64, inline_align : Int64, align_to_row : Int64, name : String) : Void
      if @@mb_push_table.null?
        @@mb_push_table = Bridge.get_method_bind("RichTextLabel", "push_table", 3426862026_i64)
      end
      val_0 = columns
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = inline_align
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = align_to_row
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = name
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_push_table, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_dropcap : Void* = Pointer(Void).null
    def push_dropcap(string : String, font : Font, size : Int64, dropcap_margins : Rect2, color : Color, outline_size : Int64, outline_color : Color) : Void
      if @@mb_push_dropcap.null?
        @@mb_push_dropcap = Bridge.get_method_bind("RichTextLabel", "push_dropcap", 4061635501_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = font
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = size
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = dropcap_margins
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = color
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = outline_size
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = outline_color
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      Bridge.ptrcall(@@mb_push_dropcap, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_table_column_expand : Void* = Pointer(Void).null
    def set_table_column_expand(column : Int64, expand : Bool, ratio : Int64, shrink : Bool) : Void
      if @@mb_set_table_column_expand.null?
        @@mb_set_table_column_expand = Bridge.get_method_bind("RichTextLabel", "set_table_column_expand", 117236061_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = expand
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = ratio
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = shrink
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_table_column_expand, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_table_column_name : Void* = Pointer(Void).null
    def set_table_column_name(column : Int64, name : String) : Void
      if @@mb_set_table_column_name.null?
        @@mb_set_table_column_name = Bridge.get_method_bind("RichTextLabel", "set_table_column_name", 501894301_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_table_column_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_cell_row_background_color : Void* = Pointer(Void).null
    def set_cell_row_background_color(odd_row_bg : Color, even_row_bg : Color) : Void
      if @@mb_set_cell_row_background_color.null?
        @@mb_set_cell_row_background_color = Bridge.get_method_bind("RichTextLabel", "set_cell_row_background_color", 3465483165_i64)
      end
      val_0 = odd_row_bg
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = even_row_bg
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_cell_row_background_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_cell_border_color : Void* = Pointer(Void).null
    def set_cell_border_color(color : Color) : Void
      if @@mb_set_cell_border_color.null?
        @@mb_set_cell_border_color = Bridge.get_method_bind("RichTextLabel", "set_cell_border_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cell_border_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_cell_size_override : Void* = Pointer(Void).null
    def set_cell_size_override(min_size : Vector2, max_size : Vector2) : Void
      if @@mb_set_cell_size_override.null?
        @@mb_set_cell_size_override = Bridge.get_method_bind("RichTextLabel", "set_cell_size_override", 3108078480_i64)
      end
      val_0 = min_size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = max_size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_cell_size_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_cell_padding : Void* = Pointer(Void).null
    def set_cell_padding(padding : Rect2) : Void
      if @@mb_set_cell_padding.null?
        @@mb_set_cell_padding = Bridge.get_method_bind("RichTextLabel", "set_cell_padding", 2046264180_i64)
      end
      val_0 = padding
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cell_padding, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_cell : Void* = Pointer(Void).null
    def push_cell() : Void
      if @@mb_push_cell.null?
        @@mb_push_cell = Bridge.get_method_bind("RichTextLabel", "push_cell", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_push_cell, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_push_fgcolor : Void* = Pointer(Void).null
    def push_fgcolor(fgcolor : Color) : Void
      if @@mb_push_fgcolor.null?
        @@mb_push_fgcolor = Bridge.get_method_bind("RichTextLabel", "push_fgcolor", 2920490490_i64)
      end
      val_0 = fgcolor
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_fgcolor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_bgcolor : Void* = Pointer(Void).null
    def push_bgcolor(bgcolor : Color) : Void
      if @@mb_push_bgcolor.null?
        @@mb_push_bgcolor = Bridge.get_method_bind("RichTextLabel", "push_bgcolor", 2920490490_i64)
      end
      val_0 = bgcolor
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_push_bgcolor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_customfx : Void* = Pointer(Void).null
    def push_customfx(effect : RichTextEffect, env : Void*) : Void
      if @@mb_push_customfx.null?
        @@mb_push_customfx = Bridge.get_method_bind("RichTextLabel", "push_customfx", 2337942958_i64)
      end
      val_0 = effect
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = env
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_push_customfx, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_push_context : Void* = Pointer(Void).null
    def push_context() : Void
      if @@mb_push_context.null?
        @@mb_push_context = Bridge.get_method_bind("RichTextLabel", "push_context", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_push_context, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_pop_context : Void* = Pointer(Void).null
    def pop_context() : Void
      if @@mb_pop_context.null?
        @@mb_pop_context = Bridge.get_method_bind("RichTextLabel", "pop_context", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_pop_context, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_pop : Void* = Pointer(Void).null
    def pop() : Void
      if @@mb_pop.null?
        @@mb_pop = Bridge.get_method_bind("RichTextLabel", "pop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_pop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_pop_all : Void* = Pointer(Void).null
    def pop_all() : Void
      if @@mb_pop_all.null?
        @@mb_pop_all = Bridge.get_method_bind("RichTextLabel", "pop_all", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_pop_all, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("RichTextLabel", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_structured_text_bidi_override : Void* = Pointer(Void).null
    def set_structured_text_bidi_override(parser : Int64) : Void
      if @@mb_set_structured_text_bidi_override.null?
        @@mb_set_structured_text_bidi_override = Bridge.get_method_bind("RichTextLabel", "set_structured_text_bidi_override", 55961453_i64)
      end
      val_0 = parser
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override : Void* = Pointer(Void).null
    def get_structured_text_bidi_override() : Int64
      if @@mb_get_structured_text_bidi_override.null?
        @@mb_get_structured_text_bidi_override = Bridge.get_method_bind("RichTextLabel", "get_structured_text_bidi_override", 3385126229_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def set_structured_text_bidi_override_options(args : Godot::Array) : Void
      if @@mb_set_structured_text_bidi_override_options.null?
        @@mb_set_structured_text_bidi_override_options = Bridge.get_method_bind("RichTextLabel", "set_structured_text_bidi_override_options", 381264803_i64)
      end
      arg_ptr_0 = args ? args.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_structured_text_bidi_override_options, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_structured_text_bidi_override_options : Void* = Pointer(Void).null
    def get_structured_text_bidi_override_options() : Godot::Array
      if @@mb_get_structured_text_bidi_override_options.null?
        @@mb_get_structured_text_bidi_override_options = Bridge.get_method_bind("RichTextLabel", "get_structured_text_bidi_override_options", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_structured_text_bidi_override_options, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_text_direction : Void* = Pointer(Void).null
    def set_text_direction(direction : Int64) : Void
      if @@mb_set_text_direction.null?
        @@mb_set_text_direction = Bridge.get_method_bind("RichTextLabel", "set_text_direction", 119160795_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text_direction : Void* = Pointer(Void).null
    def get_text_direction() : Int64
      if @@mb_get_text_direction.null?
        @@mb_get_text_direction = Bridge.get_method_bind("RichTextLabel", "get_text_direction", 797257663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_text_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_language : Void* = Pointer(Void).null
    def set_language(language : String) : Void
      if @@mb_set_language.null?
        @@mb_set_language = Bridge.get_method_bind("RichTextLabel", "set_language", 83702148_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_language : Void* = Pointer(Void).null
    def get_language() : String
      if @@mb_get_language.null?
        @@mb_get_language = Bridge.get_method_bind("RichTextLabel", "get_language", 201670096_i64)
      end
      ""
    end
    @@mb_set_horizontal_alignment : Void* = Pointer(Void).null
    def set_horizontal_alignment(alignment : Int64) : Void
      if @@mb_set_horizontal_alignment.null?
        @@mb_set_horizontal_alignment = Bridge.get_method_bind("RichTextLabel", "set_horizontal_alignment", 2312603777_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_horizontal_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_horizontal_alignment : Void* = Pointer(Void).null
    def get_horizontal_alignment() : Int64
      if @@mb_get_horizontal_alignment.null?
        @@mb_get_horizontal_alignment = Bridge.get_method_bind("RichTextLabel", "get_horizontal_alignment", 341400642_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_horizontal_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vertical_alignment : Void* = Pointer(Void).null
    def set_vertical_alignment(alignment : Int64) : Void
      if @@mb_set_vertical_alignment.null?
        @@mb_set_vertical_alignment = Bridge.get_method_bind("RichTextLabel", "set_vertical_alignment", 1796458609_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertical_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vertical_alignment : Void* = Pointer(Void).null
    def get_vertical_alignment() : Int64
      if @@mb_get_vertical_alignment.null?
        @@mb_get_vertical_alignment = Bridge.get_method_bind("RichTextLabel", "get_vertical_alignment", 3274884059_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_vertical_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_justification_flags : Void* = Pointer(Void).null
    def set_justification_flags(justification_flags : Int64) : Void
      if @@mb_set_justification_flags.null?
        @@mb_set_justification_flags = Bridge.get_method_bind("RichTextLabel", "set_justification_flags", 2877345813_i64)
      end
      val_0 = justification_flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_justification_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_justification_flags : Void* = Pointer(Void).null
    def get_justification_flags() : Int64
      if @@mb_get_justification_flags.null?
        @@mb_get_justification_flags = Bridge.get_method_bind("RichTextLabel", "get_justification_flags", 1583363614_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_justification_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tab_stops : Void* = Pointer(Void).null
    def set_tab_stops(tab_stops : Void*) : Void
      if @@mb_set_tab_stops.null?
        @@mb_set_tab_stops = Bridge.get_method_bind("RichTextLabel", "set_tab_stops", 2899603908_i64)
      end
      val_0 = tab_stops
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_stops, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_stops : Void* = Pointer(Void).null
    def get_tab_stops() : Void*
      if @@mb_get_tab_stops.null?
        @@mb_get_tab_stops = Bridge.get_method_bind("RichTextLabel", "get_tab_stops", 675695659_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tab_stops, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_autowrap_mode : Void* = Pointer(Void).null
    def set_autowrap_mode(autowrap_mode : Int64) : Void
      if @@mb_set_autowrap_mode.null?
        @@mb_set_autowrap_mode = Bridge.get_method_bind("RichTextLabel", "set_autowrap_mode", 3289138044_i64)
      end
      val_0 = autowrap_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autowrap_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autowrap_mode : Void* = Pointer(Void).null
    def get_autowrap_mode() : Int64
      if @@mb_get_autowrap_mode.null?
        @@mb_get_autowrap_mode = Bridge.get_method_bind("RichTextLabel", "get_autowrap_mode", 1549071663_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_autowrap_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autowrap_trim_flags : Void* = Pointer(Void).null
    def set_autowrap_trim_flags(autowrap_trim_flags : Int64) : Void
      if @@mb_set_autowrap_trim_flags.null?
        @@mb_set_autowrap_trim_flags = Bridge.get_method_bind("RichTextLabel", "set_autowrap_trim_flags", 2809697122_i64)
      end
      val_0 = autowrap_trim_flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autowrap_trim_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autowrap_trim_flags : Void* = Pointer(Void).null
    def get_autowrap_trim_flags() : Int64
      if @@mb_get_autowrap_trim_flags.null?
        @@mb_get_autowrap_trim_flags = Bridge.get_method_bind("RichTextLabel", "get_autowrap_trim_flags", 2340632602_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_autowrap_trim_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_meta_underline : Void* = Pointer(Void).null
    def set_meta_underline(enable : Bool) : Void
      if @@mb_set_meta_underline.null?
        @@mb_set_meta_underline = Bridge.get_method_bind("RichTextLabel", "set_meta_underline", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_meta_underline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_meta_underlined : Void* = Pointer(Void).null
    def is_meta_underlined() : Bool
      if @@mb_is_meta_underlined.null?
        @@mb_is_meta_underlined = Bridge.get_method_bind("RichTextLabel", "is_meta_underlined", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_meta_underlined, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_hint_underline : Void* = Pointer(Void).null
    def set_hint_underline(enable : Bool) : Void
      if @@mb_set_hint_underline.null?
        @@mb_set_hint_underline = Bridge.get_method_bind("RichTextLabel", "set_hint_underline", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hint_underline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_hint_underlined : Void* = Pointer(Void).null
    def is_hint_underlined() : Bool
      if @@mb_is_hint_underlined.null?
        @@mb_is_hint_underlined = Bridge.get_method_bind("RichTextLabel", "is_hint_underlined", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_hint_underlined, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_scroll_active : Void* = Pointer(Void).null
    def set_scroll_active(active : Bool) : Void
      if @@mb_set_scroll_active.null?
        @@mb_set_scroll_active = Bridge.get_method_bind("RichTextLabel", "set_scroll_active", 2586408642_i64)
      end
      val_0 = active
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_active : Void* = Pointer(Void).null
    def is_scroll_active() : Bool
      if @@mb_is_scroll_active.null?
        @@mb_is_scroll_active = Bridge.get_method_bind("RichTextLabel", "is_scroll_active", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_active, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_scroll_follow_visible_characters : Void* = Pointer(Void).null
    def set_scroll_follow_visible_characters(follow : Bool) : Void
      if @@mb_set_scroll_follow_visible_characters.null?
        @@mb_set_scroll_follow_visible_characters = Bridge.get_method_bind("RichTextLabel", "set_scroll_follow_visible_characters", 2586408642_i64)
      end
      val_0 = follow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_follow_visible_characters, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_following_visible_characters : Void* = Pointer(Void).null
    def is_scroll_following_visible_characters() : Bool
      if @@mb_is_scroll_following_visible_characters.null?
        @@mb_is_scroll_following_visible_characters = Bridge.get_method_bind("RichTextLabel", "is_scroll_following_visible_characters", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_following_visible_characters, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_scroll_follow : Void* = Pointer(Void).null
    def set_scroll_follow(follow : Bool) : Void
      if @@mb_set_scroll_follow.null?
        @@mb_set_scroll_follow = Bridge.get_method_bind("RichTextLabel", "set_scroll_follow", 2586408642_i64)
      end
      val_0 = follow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_follow, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_following : Void* = Pointer(Void).null
    def is_scroll_following() : Bool
      if @@mb_is_scroll_following.null?
        @@mb_is_scroll_following = Bridge.get_method_bind("RichTextLabel", "is_scroll_following", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_following, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_v_scroll_bar : Void* = Pointer(Void).null
    def get_v_scroll_bar() : VScrollBar
      if @@mb_get_v_scroll_bar.null?
        @@mb_get_v_scroll_bar = Bridge.get_method_bind("RichTextLabel", "get_v_scroll_bar", 2630340773_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_v_scroll_bar, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VScrollBar.new(ret_ptr)
    end
    @@mb_scroll_to_line : Void* = Pointer(Void).null
    def scroll_to_line(line : Int64) : Void
      if @@mb_scroll_to_line.null?
        @@mb_scroll_to_line = Bridge.get_method_bind("RichTextLabel", "scroll_to_line", 1286410249_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_scroll_to_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_scroll_to_paragraph : Void* = Pointer(Void).null
    def scroll_to_paragraph(paragraph : Int64) : Void
      if @@mb_scroll_to_paragraph.null?
        @@mb_scroll_to_paragraph = Bridge.get_method_bind("RichTextLabel", "scroll_to_paragraph", 1286410249_i64)
      end
      val_0 = paragraph
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_scroll_to_paragraph, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_scroll_to_selection : Void* = Pointer(Void).null
    def scroll_to_selection() : Void
      if @@mb_scroll_to_selection.null?
        @@mb_scroll_to_selection = Bridge.get_method_bind("RichTextLabel", "scroll_to_selection", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_scroll_to_selection, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_tab_size : Void* = Pointer(Void).null
    def set_tab_size(spaces : Int64) : Void
      if @@mb_set_tab_size.null?
        @@mb_set_tab_size = Bridge.get_method_bind("RichTextLabel", "set_tab_size", 1286410249_i64)
      end
      val_0 = spaces
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_size : Void* = Pointer(Void).null
    def get_tab_size() : Int64
      if @@mb_get_tab_size.null?
        @@mb_get_tab_size = Bridge.get_method_bind("RichTextLabel", "get_tab_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fit_content : Void* = Pointer(Void).null
    def set_fit_content(enabled : Bool) : Void
      if @@mb_set_fit_content.null?
        @@mb_set_fit_content = Bridge.get_method_bind("RichTextLabel", "set_fit_content", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fit_content, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_fit_content_enabled : Void* = Pointer(Void).null
    def is_fit_content_enabled() : Bool
      if @@mb_is_fit_content_enabled.null?
        @@mb_is_fit_content_enabled = Bridge.get_method_bind("RichTextLabel", "is_fit_content_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_fit_content_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_resize_font_to_fit : Void* = Pointer(Void).null
    def set_resize_font_to_fit(enabled : Bool) : Void
      if @@mb_set_resize_font_to_fit.null?
        @@mb_set_resize_font_to_fit = Bridge.get_method_bind("RichTextLabel", "set_resize_font_to_fit", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_resize_font_to_fit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_resize_font_to_fit_enabled : Void* = Pointer(Void).null
    def is_resize_font_to_fit_enabled() : Bool
      if @@mb_is_resize_font_to_fit_enabled.null?
        @@mb_is_resize_font_to_fit_enabled = Bridge.get_method_bind("RichTextLabel", "is_resize_font_to_fit_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_resize_font_to_fit_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_minimum_font_size : Void* = Pointer(Void).null
    def set_minimum_font_size(size : Int64) : Void
      if @@mb_set_minimum_font_size.null?
        @@mb_set_minimum_font_size = Bridge.get_method_bind("RichTextLabel", "set_minimum_font_size", 1286410249_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_minimum_font_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_minimum_font_size : Void* = Pointer(Void).null
    def get_minimum_font_size() : Int64
      if @@mb_get_minimum_font_size.null?
        @@mb_get_minimum_font_size = Bridge.get_method_bind("RichTextLabel", "get_minimum_font_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_minimum_font_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_maximum_font_size : Void* = Pointer(Void).null
    def set_maximum_font_size(size : Int64) : Void
      if @@mb_set_maximum_font_size.null?
        @@mb_set_maximum_font_size = Bridge.get_method_bind("RichTextLabel", "set_maximum_font_size", 1286410249_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_maximum_font_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_maximum_font_size : Void* = Pointer(Void).null
    def get_maximum_font_size() : Int64
      if @@mb_get_maximum_font_size.null?
        @@mb_get_maximum_font_size = Bridge.get_method_bind("RichTextLabel", "get_maximum_font_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_maximum_font_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rendered_font_size : Void* = Pointer(Void).null
    def get_rendered_font_size() : Int64
      if @@mb_get_rendered_font_size.null?
        @@mb_get_rendered_font_size = Bridge.get_method_bind("RichTextLabel", "get_rendered_font_size", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rendered_font_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_selection_enabled : Void* = Pointer(Void).null
    def set_selection_enabled(enabled : Bool) : Void
      if @@mb_set_selection_enabled.null?
        @@mb_set_selection_enabled = Bridge.get_method_bind("RichTextLabel", "set_selection_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_selection_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_selection_enabled : Void* = Pointer(Void).null
    def is_selection_enabled() : Bool
      if @@mb_is_selection_enabled.null?
        @@mb_is_selection_enabled = Bridge.get_method_bind("RichTextLabel", "is_selection_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_selection_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_context_menu_enabled : Void* = Pointer(Void).null
    def set_context_menu_enabled(enabled : Bool) : Void
      if @@mb_set_context_menu_enabled.null?
        @@mb_set_context_menu_enabled = Bridge.get_method_bind("RichTextLabel", "set_context_menu_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_context_menu_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_context_menu_enabled : Void* = Pointer(Void).null
    def is_context_menu_enabled() : Bool
      if @@mb_is_context_menu_enabled.null?
        @@mb_is_context_menu_enabled = Bridge.get_method_bind("RichTextLabel", "is_context_menu_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_context_menu_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shortcut_keys_enabled : Void* = Pointer(Void).null
    def set_shortcut_keys_enabled(enabled : Bool) : Void
      if @@mb_set_shortcut_keys_enabled.null?
        @@mb_set_shortcut_keys_enabled = Bridge.get_method_bind("RichTextLabel", "set_shortcut_keys_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shortcut_keys_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shortcut_keys_enabled : Void* = Pointer(Void).null
    def is_shortcut_keys_enabled() : Bool
      if @@mb_is_shortcut_keys_enabled.null?
        @@mb_is_shortcut_keys_enabled = Bridge.get_method_bind("RichTextLabel", "is_shortcut_keys_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shortcut_keys_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_deselect_on_focus_loss_enabled : Void* = Pointer(Void).null
    def set_deselect_on_focus_loss_enabled(enable : Bool) : Void
      if @@mb_set_deselect_on_focus_loss_enabled.null?
        @@mb_set_deselect_on_focus_loss_enabled = Bridge.get_method_bind("RichTextLabel", "set_deselect_on_focus_loss_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deselect_on_focus_loss_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_deselect_on_focus_loss_enabled : Void* = Pointer(Void).null
    def is_deselect_on_focus_loss_enabled() : Bool
      if @@mb_is_deselect_on_focus_loss_enabled.null?
        @@mb_is_deselect_on_focus_loss_enabled = Bridge.get_method_bind("RichTextLabel", "is_deselect_on_focus_loss_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_deselect_on_focus_loss_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drag_and_drop_selection_enabled : Void* = Pointer(Void).null
    def set_drag_and_drop_selection_enabled(enable : Bool) : Void
      if @@mb_set_drag_and_drop_selection_enabled.null?
        @@mb_set_drag_and_drop_selection_enabled = Bridge.get_method_bind("RichTextLabel", "set_drag_and_drop_selection_enabled", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_and_drop_selection_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drag_and_drop_selection_enabled : Void* = Pointer(Void).null
    def is_drag_and_drop_selection_enabled() : Bool
      if @@mb_is_drag_and_drop_selection_enabled.null?
        @@mb_is_drag_and_drop_selection_enabled = Bridge.get_method_bind("RichTextLabel", "is_drag_and_drop_selection_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drag_and_drop_selection_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_selection_from : Void* = Pointer(Void).null
    def get_selection_from() : Int64
      if @@mb_get_selection_from.null?
        @@mb_get_selection_from = Bridge.get_method_bind("RichTextLabel", "get_selection_from", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_from, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_to : Void* = Pointer(Void).null
    def get_selection_to() : Int64
      if @@mb_get_selection_to.null?
        @@mb_get_selection_to = Bridge.get_method_bind("RichTextLabel", "get_selection_to", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selection_to, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_selection_line_offset : Void* = Pointer(Void).null
    def get_selection_line_offset() : Float64
      if @@mb_get_selection_line_offset.null?
        @@mb_get_selection_line_offset = Bridge.get_method_bind("RichTextLabel", "get_selection_line_offset", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_selection_line_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_select_all : Void* = Pointer(Void).null
    def select_all() : Void
      if @@mb_select_all.null?
        @@mb_select_all = Bridge.get_method_bind("RichTextLabel", "select_all", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_select_all, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_selected_text : Void* = Pointer(Void).null
    def get_selected_text() : String
      if @@mb_get_selected_text.null?
        @@mb_get_selected_text = Bridge.get_method_bind("RichTextLabel", "get_selected_text", 201670096_i64)
      end
      ""
    end
    @@mb_deselect : Void* = Pointer(Void).null
    def deselect() : Void
      if @@mb_deselect.null?
        @@mb_deselect = Bridge.get_method_bind("RichTextLabel", "deselect", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_deselect, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_parse_bbcode : Void* = Pointer(Void).null
    def parse_bbcode(bbcode : String) : Void
      if @@mb_parse_bbcode.null?
        @@mb_parse_bbcode = Bridge.get_method_bind("RichTextLabel", "parse_bbcode", 83702148_i64)
      end
      val_0 = bbcode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_parse_bbcode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_append_text : Void* = Pointer(Void).null
    def append_text(bbcode : String) : Void
      if @@mb_append_text.null?
        @@mb_append_text = Bridge.get_method_bind("RichTextLabel", "append_text", 83702148_i64)
      end
      val_0 = bbcode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_append_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_text : Void* = Pointer(Void).null
    def get_text() : String
      if @@mb_get_text.null?
        @@mb_get_text = Bridge.get_method_bind("RichTextLabel", "get_text", 201670096_i64)
      end
      ""
    end
    @@mb_is_ready : Void* = Pointer(Void).null
    def is_ready() : Bool
      if @@mb_is_ready.null?
        @@mb_is_ready = Bridge.get_method_bind("RichTextLabel", "is_ready", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_ready, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_finished : Void* = Pointer(Void).null
    def is_finished() : Bool
      if @@mb_is_finished.null?
        @@mb_is_finished = Bridge.get_method_bind("RichTextLabel", "is_finished", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_finished, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_threaded : Void* = Pointer(Void).null
    def set_threaded(threaded : Bool) : Void
      if @@mb_set_threaded.null?
        @@mb_set_threaded = Bridge.get_method_bind("RichTextLabel", "set_threaded", 2586408642_i64)
      end
      val_0 = threaded
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_threaded, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_threaded : Void* = Pointer(Void).null
    def is_threaded() : Bool
      if @@mb_is_threaded.null?
        @@mb_is_threaded = Bridge.get_method_bind("RichTextLabel", "is_threaded", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_threaded, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_progress_bar_delay : Void* = Pointer(Void).null
    def set_progress_bar_delay(delay_ms : Int64) : Void
      if @@mb_set_progress_bar_delay.null?
        @@mb_set_progress_bar_delay = Bridge.get_method_bind("RichTextLabel", "set_progress_bar_delay", 1286410249_i64)
      end
      val_0 = delay_ms
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_progress_bar_delay, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_progress_bar_delay : Void* = Pointer(Void).null
    def get_progress_bar_delay() : Int64
      if @@mb_get_progress_bar_delay.null?
        @@mb_get_progress_bar_delay = Bridge.get_method_bind("RichTextLabel", "get_progress_bar_delay", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_progress_bar_delay, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_visible_characters : Void* = Pointer(Void).null
    def set_visible_characters(amount : Int64) : Void
      if @@mb_set_visible_characters.null?
        @@mb_set_visible_characters = Bridge.get_method_bind("RichTextLabel", "set_visible_characters", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visible_characters, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_visible_characters : Void* = Pointer(Void).null
    def get_visible_characters() : Int64
      if @@mb_get_visible_characters.null?
        @@mb_get_visible_characters = Bridge.get_method_bind("RichTextLabel", "get_visible_characters", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_characters, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visible_characters_behavior : Void* = Pointer(Void).null
    def get_visible_characters_behavior() : Int64
      if @@mb_get_visible_characters_behavior.null?
        @@mb_get_visible_characters_behavior = Bridge.get_method_bind("RichTextLabel", "get_visible_characters_behavior", 258789322_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_characters_behavior, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_visible_characters_behavior : Void* = Pointer(Void).null
    def set_visible_characters_behavior(behavior : Int64) : Void
      if @@mb_set_visible_characters_behavior.null?
        @@mb_set_visible_characters_behavior = Bridge.get_method_bind("RichTextLabel", "set_visible_characters_behavior", 3383839701_i64)
      end
      val_0 = behavior
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visible_characters_behavior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_visible_ratio : Void* = Pointer(Void).null
    def set_visible_ratio(ratio : Float64) : Void
      if @@mb_set_visible_ratio.null?
        @@mb_set_visible_ratio = Bridge.get_method_bind("RichTextLabel", "set_visible_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visible_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_visible_ratio : Void* = Pointer(Void).null
    def get_visible_ratio() : Float64
      if @@mb_get_visible_ratio.null?
        @@mb_get_visible_ratio = Bridge.get_method_bind("RichTextLabel", "get_visible_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_visible_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_character_line : Void* = Pointer(Void).null
    def get_character_line(character : Int64) : Int64
      if @@mb_get_character_line.null?
        @@mb_get_character_line = Bridge.get_method_bind("RichTextLabel", "get_character_line", 3744713108_i64)
      end
      val_0 = character
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_character_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_character_paragraph : Void* = Pointer(Void).null
    def get_character_paragraph(character : Int64) : Int64
      if @@mb_get_character_paragraph.null?
        @@mb_get_character_paragraph = Bridge.get_method_bind("RichTextLabel", "get_character_paragraph", 3744713108_i64)
      end
      val_0 = character
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_character_paragraph, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_total_character_count : Void* = Pointer(Void).null
    def get_total_character_count() : Int64
      if @@mb_get_total_character_count.null?
        @@mb_get_total_character_count = Bridge.get_method_bind("RichTextLabel", "get_total_character_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_total_character_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_bbcode : Void* = Pointer(Void).null
    def set_use_bbcode(enable : Bool) : Void
      if @@mb_set_use_bbcode.null?
        @@mb_set_use_bbcode = Bridge.get_method_bind("RichTextLabel", "set_use_bbcode", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_bbcode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_using_bbcode : Void* = Pointer(Void).null
    def is_using_bbcode() : Bool
      if @@mb_is_using_bbcode.null?
        @@mb_is_using_bbcode = Bridge.get_method_bind("RichTextLabel", "is_using_bbcode", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_using_bbcode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_line_count : Void* = Pointer(Void).null
    def get_line_count() : Int64
      if @@mb_get_line_count.null?
        @@mb_get_line_count = Bridge.get_method_bind("RichTextLabel", "get_line_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_range : Void* = Pointer(Void).null
    def get_line_range(line : Int64) : Vector2i
      if @@mb_get_line_range.null?
        @@mb_get_line_range = Bridge.get_method_bind("RichTextLabel", "get_line_range", 3665014314_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_line_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_get_visible_line_count : Void* = Pointer(Void).null
    def get_visible_line_count() : Int64
      if @@mb_get_visible_line_count.null?
        @@mb_get_visible_line_count = Bridge.get_method_bind("RichTextLabel", "get_visible_line_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_line_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_paragraph_count : Void* = Pointer(Void).null
    def get_paragraph_count() : Int64
      if @@mb_get_paragraph_count.null?
        @@mb_get_paragraph_count = Bridge.get_method_bind("RichTextLabel", "get_paragraph_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_paragraph_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visible_paragraph_count : Void* = Pointer(Void).null
    def get_visible_paragraph_count() : Int64
      if @@mb_get_visible_paragraph_count.null?
        @@mb_get_visible_paragraph_count = Bridge.get_method_bind("RichTextLabel", "get_visible_paragraph_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visible_paragraph_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_content_height : Void* = Pointer(Void).null
    def get_content_height() : Int64
      if @@mb_get_content_height.null?
        @@mb_get_content_height = Bridge.get_method_bind("RichTextLabel", "get_content_height", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_content_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_content_width : Void* = Pointer(Void).null
    def get_content_width() : Int64
      if @@mb_get_content_width.null?
        @@mb_get_content_width = Bridge.get_method_bind("RichTextLabel", "get_content_width", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_content_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_height : Void* = Pointer(Void).null
    def get_line_height(line : Int64) : Int64
      if @@mb_get_line_height.null?
        @@mb_get_line_height = Bridge.get_method_bind("RichTextLabel", "get_line_height", 923996154_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_height, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_line_width : Void* = Pointer(Void).null
    def get_line_width(line : Int64) : Int64
      if @@mb_get_line_width.null?
        @@mb_get_line_width = Bridge.get_method_bind("RichTextLabel", "get_line_width", 923996154_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_line_width, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visible_content_rect : Void* = Pointer(Void).null
    def get_visible_content_rect() : Rect2i
      if @@mb_get_visible_content_rect.null?
        @@mb_get_visible_content_rect = Bridge.get_method_bind("RichTextLabel", "get_visible_content_rect", 410525958_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_visible_content_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2i.new(ret_ptr)
    end
    @@mb_get_line_offset : Void* = Pointer(Void).null
    def get_line_offset(line : Int64) : Float64
      if @@mb_get_line_offset.null?
        @@mb_get_line_offset = Bridge.get_method_bind("RichTextLabel", "get_line_offset", 4025615559_i64)
      end
      val_0 = line
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_line_offset, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_paragraph_offset : Void* = Pointer(Void).null
    def get_paragraph_offset(paragraph : Int64) : Float64
      if @@mb_get_paragraph_offset.null?
        @@mb_get_paragraph_offset = Bridge.get_method_bind("RichTextLabel", "get_paragraph_offset", 4025615559_i64)
      end
      val_0 = paragraph
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_paragraph_offset, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_parse_expressions_for_values : Void* = Pointer(Void).null
    def parse_expressions_for_values(expressions : Void*) : Void*
      if @@mb_parse_expressions_for_values.null?
        @@mb_parse_expressions_for_values = Bridge.get_method_bind("RichTextLabel", "parse_expressions_for_values", 1522900837_i64)
      end
      val_0 = expressions
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_parse_expressions_for_values, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_effects : Void* = Pointer(Void).null
    def set_effects(effects : Godot::Array) : Void
      if @@mb_set_effects.null?
        @@mb_set_effects = Bridge.get_method_bind("RichTextLabel", "set_effects", 381264803_i64)
      end
      arg_ptr_0 = effects ? effects.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_effects, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_effects : Void* = Pointer(Void).null
    def get_effects() : Godot::Array
      if @@mb_get_effects.null?
        @@mb_get_effects = Bridge.get_method_bind("RichTextLabel", "get_effects", 2915620761_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_effects, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_install_effect : Void* = Pointer(Void).null
    def install_effect(effect : Void*) : Void
      if @@mb_install_effect.null?
        @@mb_install_effect = Bridge.get_method_bind("RichTextLabel", "install_effect", 1114965689_i64)
      end
      val_0 = effect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_install_effect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reload_effects : Void* = Pointer(Void).null
    def reload_effects() : Void
      if @@mb_reload_effects.null?
        @@mb_reload_effects = Bridge.get_method_bind("RichTextLabel", "reload_effects", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reload_effects, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_menu : Void* = Pointer(Void).null
    def get_menu() : PopupMenu
      if @@mb_get_menu.null?
        @@mb_get_menu = Bridge.get_method_bind("RichTextLabel", "get_menu", 229722558_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_menu, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PopupMenu.new(ret_ptr)
    end
    @@mb_is_menu_visible : Void* = Pointer(Void).null
    def is_menu_visible() : Bool
      if @@mb_is_menu_visible.null?
        @@mb_is_menu_visible = Bridge.get_method_bind("RichTextLabel", "is_menu_visible", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_menu_visible, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_menu_option : Void* = Pointer(Void).null
    def menu_option(option : Int64) : Void
      if @@mb_menu_option.null?
        @@mb_menu_option = Bridge.get_method_bind("RichTextLabel", "menu_option", 1286410249_i64)
      end
      val_0 = option
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_menu_option, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class SpinBox < Godot::Range
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_horizontal_alignment : Void* = Pointer(Void).null
    def set_horizontal_alignment(alignment : Int64) : Void
      if @@mb_set_horizontal_alignment.null?
        @@mb_set_horizontal_alignment = Bridge.get_method_bind("SpinBox", "set_horizontal_alignment", 2312603777_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_horizontal_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_horizontal_alignment : Void* = Pointer(Void).null
    def get_horizontal_alignment() : Int64
      if @@mb_get_horizontal_alignment.null?
        @@mb_get_horizontal_alignment = Bridge.get_method_bind("SpinBox", "get_horizontal_alignment", 341400642_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_horizontal_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_suffix : Void* = Pointer(Void).null
    def set_suffix(suffix : String) : Void
      if @@mb_set_suffix.null?
        @@mb_set_suffix = Bridge.get_method_bind("SpinBox", "set_suffix", 83702148_i64)
      end
      val_0 = suffix
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_suffix, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_suffix : Void* = Pointer(Void).null
    def get_suffix() : String
      if @@mb_get_suffix.null?
        @@mb_get_suffix = Bridge.get_method_bind("SpinBox", "get_suffix", 201670096_i64)
      end
      ""
    end
    @@mb_set_prefix : Void* = Pointer(Void).null
    def set_prefix(prefix : String) : Void
      if @@mb_set_prefix.null?
        @@mb_set_prefix = Bridge.get_method_bind("SpinBox", "set_prefix", 83702148_i64)
      end
      val_0 = prefix
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_prefix, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_prefix : Void* = Pointer(Void).null
    def get_prefix() : String
      if @@mb_get_prefix.null?
        @@mb_get_prefix = Bridge.get_method_bind("SpinBox", "get_prefix", 201670096_i64)
      end
      ""
    end
    @@mb_set_editable : Void* = Pointer(Void).null
    def set_editable(enabled : Bool) : Void
      if @@mb_set_editable.null?
        @@mb_set_editable = Bridge.get_method_bind("SpinBox", "set_editable", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_custom_arrow_step : Void* = Pointer(Void).null
    def set_custom_arrow_step(arrow_step : Float64) : Void
      if @@mb_set_custom_arrow_step.null?
        @@mb_set_custom_arrow_step = Bridge.get_method_bind("SpinBox", "set_custom_arrow_step", 373806689_i64)
      end
      val_0 = arrow_step
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_arrow_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_custom_arrow_step : Void* = Pointer(Void).null
    def get_custom_arrow_step() : Float64
      if @@mb_get_custom_arrow_step.null?
        @@mb_get_custom_arrow_step = Bridge.get_method_bind("SpinBox", "get_custom_arrow_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_custom_arrow_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_custom_arrow_round : Void* = Pointer(Void).null
    def set_custom_arrow_round(round : Bool) : Void
      if @@mb_set_custom_arrow_round.null?
        @@mb_set_custom_arrow_round = Bridge.get_method_bind("SpinBox", "set_custom_arrow_round", 2586408642_i64)
      end
      val_0 = round
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_arrow_round, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_custom_arrow_rounding : Void* = Pointer(Void).null
    def is_custom_arrow_rounding() : Bool
      if @@mb_is_custom_arrow_rounding.null?
        @@mb_is_custom_arrow_rounding = Bridge.get_method_bind("SpinBox", "is_custom_arrow_rounding", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_custom_arrow_rounding, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_editable : Void* = Pointer(Void).null
    def is_editable() : Bool
      if @@mb_is_editable.null?
        @@mb_is_editable = Bridge.get_method_bind("SpinBox", "is_editable", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_update_on_text_changed : Void* = Pointer(Void).null
    def set_update_on_text_changed(enabled : Bool) : Void
      if @@mb_set_update_on_text_changed.null?
        @@mb_set_update_on_text_changed = Bridge.get_method_bind("SpinBox", "set_update_on_text_changed", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_update_on_text_changed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_update_on_text_changed : Void* = Pointer(Void).null
    def get_update_on_text_changed() : Bool
      if @@mb_get_update_on_text_changed.null?
        @@mb_get_update_on_text_changed = Bridge.get_method_bind("SpinBox", "get_update_on_text_changed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_update_on_text_changed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_select_all_on_focus : Void* = Pointer(Void).null
    def set_select_all_on_focus(enabled : Bool) : Void
      if @@mb_set_select_all_on_focus.null?
        @@mb_set_select_all_on_focus = Bridge.get_method_bind("SpinBox", "set_select_all_on_focus", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_select_all_on_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_select_all_on_focus : Void* = Pointer(Void).null
    def is_select_all_on_focus() : Bool
      if @@mb_is_select_all_on_focus.null?
        @@mb_is_select_all_on_focus = Bridge.get_method_bind("SpinBox", "is_select_all_on_focus", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_select_all_on_focus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_apply : Void* = Pointer(Void).null
    def apply() : Void
      if @@mb_apply.null?
        @@mb_apply = Bridge.get_method_bind("SpinBox", "apply", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_apply, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_line_edit : Void* = Pointer(Void).null
    def get_line_edit() : LineEdit
      if @@mb_get_line_edit.null?
        @@mb_get_line_edit = Bridge.get_method_bind("SpinBox", "get_line_edit", 4071694264_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_line_edit, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      LineEdit.new(ret_ptr)
    end
  end
  class TabBar < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum AlignmentMode : Int64
      AlignmentLeft = 0_i64
      AlignmentCenter = 1_i64
      AlignmentRight = 2_i64
      AlignmentMax = 3_i64
    end
    enum SizingMode : Int64
      TabSizingFitContent = 0_i64
      TabSizingUniform = 1_i64
      TabSizingJustify = 2_i64
      TabSizingExpand = 3_i64
      TabSizingMax = 4_i64
    end
    enum CloseButtonDisplayPolicy : Int64
      CloseButtonShowNever = 0_i64
      CloseButtonShowActiveOnly = 1_i64
      CloseButtonShowAlways = 2_i64
      CloseButtonMax = 3_i64
    end
    @@mb_set_tab_count : Void* = Pointer(Void).null
    def set_tab_count(count : Int64) : Void
      if @@mb_set_tab_count.null?
        @@mb_set_tab_count = Bridge.get_method_bind("TabBar", "set_tab_count", 1286410249_i64)
      end
      val_0 = count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_count : Void* = Pointer(Void).null
    def get_tab_count() : Int64
      if @@mb_get_tab_count.null?
        @@mb_get_tab_count = Bridge.get_method_bind("TabBar", "get_tab_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_current_tab : Void* = Pointer(Void).null
    def set_current_tab(tab_idx : Int64) : Void
      if @@mb_set_current_tab.null?
        @@mb_set_current_tab = Bridge.get_method_bind("TabBar", "set_current_tab", 1286410249_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_current_tab, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_current_tab : Void* = Pointer(Void).null
    def get_current_tab() : Int64
      if @@mb_get_current_tab.null?
        @@mb_get_current_tab = Bridge.get_method_bind("TabBar", "get_current_tab", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_current_tab, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_previous_tab : Void* = Pointer(Void).null
    def get_previous_tab() : Int64
      if @@mb_get_previous_tab.null?
        @@mb_get_previous_tab = Bridge.get_method_bind("TabBar", "get_previous_tab", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_previous_tab, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_select_previous_available : Void* = Pointer(Void).null
    def select_previous_available() : Bool
      if @@mb_select_previous_available.null?
        @@mb_select_previous_available = Bridge.get_method_bind("TabBar", "select_previous_available", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_select_previous_available, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_select_next_available : Void* = Pointer(Void).null
    def select_next_available() : Bool
      if @@mb_select_next_available.null?
        @@mb_select_next_available = Bridge.get_method_bind("TabBar", "select_next_available", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_select_next_available, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tab_title : Void* = Pointer(Void).null
    def set_tab_title(tab_idx : Int64, title : String) : Void
      if @@mb_set_tab_title.null?
        @@mb_set_tab_title = Bridge.get_method_bind("TabBar", "set_tab_title", 501894301_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = title
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_title, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_title : Void* = Pointer(Void).null
    def get_tab_title(tab_idx : Int64) : String
      if @@mb_get_tab_title.null?
        @@mb_get_tab_title = Bridge.get_method_bind("TabBar", "get_tab_title", 844755477_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_tab_tooltip : Void* = Pointer(Void).null
    def set_tab_tooltip(tab_idx : Int64, tooltip : String) : Void
      if @@mb_set_tab_tooltip.null?
        @@mb_set_tab_tooltip = Bridge.get_method_bind("TabBar", "set_tab_tooltip", 501894301_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_tooltip : Void* = Pointer(Void).null
    def get_tab_tooltip(tab_idx : Int64) : String
      if @@mb_get_tab_tooltip.null?
        @@mb_get_tab_tooltip = Bridge.get_method_bind("TabBar", "get_tab_tooltip", 844755477_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_tab_text_direction : Void* = Pointer(Void).null
    def set_tab_text_direction(tab_idx : Int64, direction : Int64) : Void
      if @@mb_set_tab_text_direction.null?
        @@mb_set_tab_text_direction = Bridge.get_method_bind("TabBar", "set_tab_text_direction", 1707680378_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = direction
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_text_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_text_direction : Void* = Pointer(Void).null
    def get_tab_text_direction(tab_idx : Int64) : Int64
      if @@mb_get_tab_text_direction.null?
        @@mb_get_tab_text_direction = Bridge.get_method_bind("TabBar", "get_tab_text_direction", 4235602388_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_text_direction, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tab_language : Void* = Pointer(Void).null
    def set_tab_language(tab_idx : Int64, language : String) : Void
      if @@mb_set_tab_language.null?
        @@mb_set_tab_language = Bridge.get_method_bind("TabBar", "set_tab_language", 501894301_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_language : Void* = Pointer(Void).null
    def get_tab_language(tab_idx : Int64) : String
      if @@mb_get_tab_language.null?
        @@mb_get_tab_language = Bridge.get_method_bind("TabBar", "get_tab_language", 844755477_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_tab_icon : Void* = Pointer(Void).null
    def set_tab_icon(tab_idx : Int64, icon : Texture2D) : Void
      if @@mb_set_tab_icon.null?
        @@mb_set_tab_icon = Bridge.get_method_bind("TabBar", "set_tab_icon", 666127730_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_icon : Void* = Pointer(Void).null
    def get_tab_icon(tab_idx : Int64) : Texture2D
      if @@mb_get_tab_icon.null?
        @@mb_get_tab_icon = Bridge.get_method_bind("TabBar", "get_tab_icon", 3536238170_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tab_icon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_tab_icon_max_width : Void* = Pointer(Void).null
    def set_tab_icon_max_width(tab_idx : Int64, width : Int64) : Void
      if @@mb_set_tab_icon_max_width.null?
        @@mb_set_tab_icon_max_width = Bridge.get_method_bind("TabBar", "set_tab_icon_max_width", 3937882851_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_icon_max_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_icon_max_width : Void* = Pointer(Void).null
    def get_tab_icon_max_width(tab_idx : Int64) : Int64
      if @@mb_get_tab_icon_max_width.null?
        @@mb_get_tab_icon_max_width = Bridge.get_method_bind("TabBar", "get_tab_icon_max_width", 923996154_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_icon_max_width, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tab_button_icon : Void* = Pointer(Void).null
    def set_tab_button_icon(tab_idx : Int64, icon : Texture2D) : Void
      if @@mb_set_tab_button_icon.null?
        @@mb_set_tab_button_icon = Bridge.get_method_bind("TabBar", "set_tab_button_icon", 666127730_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_button_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_button_icon : Void* = Pointer(Void).null
    def get_tab_button_icon(tab_idx : Int64) : Texture2D
      if @@mb_get_tab_button_icon.null?
        @@mb_get_tab_button_icon = Bridge.get_method_bind("TabBar", "get_tab_button_icon", 3536238170_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tab_button_icon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_tab_disabled : Void* = Pointer(Void).null
    def set_tab_disabled(tab_idx : Int64, disabled : Bool) : Void
      if @@mb_set_tab_disabled.null?
        @@mb_set_tab_disabled = Bridge.get_method_bind("TabBar", "set_tab_disabled", 300928843_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_tab_disabled : Void* = Pointer(Void).null
    def is_tab_disabled(tab_idx : Int64) : Bool
      if @@mb_is_tab_disabled.null?
        @@mb_is_tab_disabled = Bridge.get_method_bind("TabBar", "is_tab_disabled", 1116898809_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_tab_disabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tab_hidden : Void* = Pointer(Void).null
    def set_tab_hidden(tab_idx : Int64, hidden : Bool) : Void
      if @@mb_set_tab_hidden.null?
        @@mb_set_tab_hidden = Bridge.get_method_bind("TabBar", "set_tab_hidden", 300928843_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = hidden
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_hidden, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_tab_hidden : Void* = Pointer(Void).null
    def is_tab_hidden(tab_idx : Int64) : Bool
      if @@mb_is_tab_hidden.null?
        @@mb_is_tab_hidden = Bridge.get_method_bind("TabBar", "is_tab_hidden", 1116898809_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_tab_hidden, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tab_metadata : Void* = Pointer(Void).null
    def set_tab_metadata(tab_idx : Int64, metadata : Void*) : Void
      if @@mb_set_tab_metadata.null?
        @@mb_set_tab_metadata = Bridge.get_method_bind("TabBar", "set_tab_metadata", 2152698145_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = metadata
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_tab_metadata, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_metadata : Void* = Pointer(Void).null
    def get_tab_metadata(tab_idx : Int64) : Void*
      if @@mb_get_tab_metadata.null?
        @@mb_get_tab_metadata = Bridge.get_method_bind("TabBar", "get_tab_metadata", 4227898402_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tab_metadata, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_remove_tab : Void* = Pointer(Void).null
    def remove_tab(tab_idx : Int64) : Void
      if @@mb_remove_tab.null?
        @@mb_remove_tab = Bridge.get_method_bind("TabBar", "remove_tab", 1286410249_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_tab, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_tab : Void* = Pointer(Void).null
    def add_tab(title : String, icon : Texture2D) : Void
      if @@mb_add_tab.null?
        @@mb_add_tab = Bridge.get_method_bind("TabBar", "add_tab", 1465444425_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_tab, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_idx_at_point : Void* = Pointer(Void).null
    def get_tab_idx_at_point(point : Vector2) : Int64
      if @@mb_get_tab_idx_at_point.null?
        @@mb_get_tab_idx_at_point = Bridge.get_method_bind("TabBar", "get_tab_idx_at_point", 3820158470_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_idx_at_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tab_alignment : Void* = Pointer(Void).null
    def set_tab_alignment(alignment : Int64) : Void
      if @@mb_set_tab_alignment.null?
        @@mb_set_tab_alignment = Bridge.get_method_bind("TabBar", "set_tab_alignment", 2413632353_i64)
      end
      val_0 = alignment
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_alignment : Void* = Pointer(Void).null
    def get_tab_alignment() : Int64
      if @@mb_get_tab_alignment.null?
        @@mb_get_tab_alignment = Bridge.get_method_bind("TabBar", "get_tab_alignment", 2178122193_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_alignment, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tab_sizing : Void* = Pointer(Void).null
    def set_tab_sizing(tab_sizing : Int64) : Void
      if @@mb_set_tab_sizing.null?
        @@mb_set_tab_sizing = Bridge.get_method_bind("TabBar", "set_tab_sizing", 3891044528_i64)
      end
      val_0 = tab_sizing
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_sizing, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_sizing : Void* = Pointer(Void).null
    def get_tab_sizing() : Int64
      if @@mb_get_tab_sizing.null?
        @@mb_get_tab_sizing = Bridge.get_method_bind("TabBar", "get_tab_sizing", 2145546792_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_sizing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_clip_tabs : Void* = Pointer(Void).null
    def set_clip_tabs(clip_tabs : Bool) : Void
      if @@mb_set_clip_tabs.null?
        @@mb_set_clip_tabs = Bridge.get_method_bind("TabBar", "set_clip_tabs", 2586408642_i64)
      end
      val_0 = clip_tabs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_clip_tabs, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_clip_tabs : Void* = Pointer(Void).null
    def get_clip_tabs() : Bool
      if @@mb_get_clip_tabs.null?
        @@mb_get_clip_tabs = Bridge.get_method_bind("TabBar", "get_clip_tabs", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_clip_tabs, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_tab_offset : Void* = Pointer(Void).null
    def get_tab_offset() : Int64
      if @@mb_get_tab_offset.null?
        @@mb_get_tab_offset = Bridge.get_method_bind("TabBar", "get_tab_offset", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_offset_buttons_visible : Void* = Pointer(Void).null
    def get_offset_buttons_visible() : Bool
      if @@mb_get_offset_buttons_visible.null?
        @@mb_get_offset_buttons_visible = Bridge.get_method_bind("TabBar", "get_offset_buttons_visible", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_offset_buttons_visible, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_ensure_tab_visible : Void* = Pointer(Void).null
    def ensure_tab_visible(idx : Int64) : Void
      if @@mb_ensure_tab_visible.null?
        @@mb_ensure_tab_visible = Bridge.get_method_bind("TabBar", "ensure_tab_visible", 1286410249_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_ensure_tab_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_rect : Void* = Pointer(Void).null
    def get_tab_rect(tab_idx : Int64) : Rect2
      if @@mb_get_tab_rect.null?
        @@mb_get_tab_rect = Bridge.get_method_bind("TabBar", "get_tab_rect", 3327874267_i64)
      end
      val_0 = tab_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tab_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_move_tab : Void* = Pointer(Void).null
    def move_tab(from : Int64, to : Int64) : Void
      if @@mb_move_tab.null?
        @@mb_move_tab = Bridge.get_method_bind("TabBar", "move_tab", 3937882851_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_tab, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_close_with_middle_mouse : Void* = Pointer(Void).null
    def set_close_with_middle_mouse(enabled : Bool) : Void
      if @@mb_set_close_with_middle_mouse.null?
        @@mb_set_close_with_middle_mouse = Bridge.get_method_bind("TabBar", "set_close_with_middle_mouse", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_close_with_middle_mouse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_close_with_middle_mouse : Void* = Pointer(Void).null
    def get_close_with_middle_mouse() : Bool
      if @@mb_get_close_with_middle_mouse.null?
        @@mb_get_close_with_middle_mouse = Bridge.get_method_bind("TabBar", "get_close_with_middle_mouse", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_close_with_middle_mouse, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tab_close_display_policy : Void* = Pointer(Void).null
    def set_tab_close_display_policy(policy : Int64) : Void
      if @@mb_set_tab_close_display_policy.null?
        @@mb_set_tab_close_display_policy = Bridge.get_method_bind("TabBar", "set_tab_close_display_policy", 2212906737_i64)
      end
      val_0 = policy
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tab_close_display_policy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tab_close_display_policy : Void* = Pointer(Void).null
    def get_tab_close_display_policy() : Int64
      if @@mb_get_tab_close_display_policy.null?
        @@mb_get_tab_close_display_policy = Bridge.get_method_bind("TabBar", "get_tab_close_display_policy", 2956568028_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tab_close_display_policy, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_tab_width : Void* = Pointer(Void).null
    def set_max_tab_width(width : Int64) : Void
      if @@mb_set_max_tab_width.null?
        @@mb_set_max_tab_width = Bridge.get_method_bind("TabBar", "set_max_tab_width", 1286410249_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_tab_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_tab_width : Void* = Pointer(Void).null
    def get_max_tab_width() : Int64
      if @@mb_get_max_tab_width.null?
        @@mb_get_max_tab_width = Bridge.get_method_bind("TabBar", "get_max_tab_width", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_tab_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_scrolling_enabled : Void* = Pointer(Void).null
    def set_scrolling_enabled(enabled : Bool) : Void
      if @@mb_set_scrolling_enabled.null?
        @@mb_set_scrolling_enabled = Bridge.get_method_bind("TabBar", "set_scrolling_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scrolling_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scrolling_enabled : Void* = Pointer(Void).null
    def get_scrolling_enabled() : Bool
      if @@mb_get_scrolling_enabled.null?
        @@mb_get_scrolling_enabled = Bridge.get_method_bind("TabBar", "get_scrolling_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_scrolling_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drag_to_rearrange_enabled : Void* = Pointer(Void).null
    def set_drag_to_rearrange_enabled(enabled : Bool) : Void
      if @@mb_set_drag_to_rearrange_enabled.null?
        @@mb_set_drag_to_rearrange_enabled = Bridge.get_method_bind("TabBar", "set_drag_to_rearrange_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_to_rearrange_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_drag_to_rearrange_enabled : Void* = Pointer(Void).null
    def get_drag_to_rearrange_enabled() : Bool
      if @@mb_get_drag_to_rearrange_enabled.null?
        @@mb_get_drag_to_rearrange_enabled = Bridge.get_method_bind("TabBar", "get_drag_to_rearrange_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_drag_to_rearrange_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_switch_on_drag_hover : Void* = Pointer(Void).null
    def set_switch_on_drag_hover(enabled : Bool) : Void
      if @@mb_set_switch_on_drag_hover.null?
        @@mb_set_switch_on_drag_hover = Bridge.get_method_bind("TabBar", "set_switch_on_drag_hover", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_switch_on_drag_hover, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_switch_on_drag_hover : Void* = Pointer(Void).null
    def get_switch_on_drag_hover() : Bool
      if @@mb_get_switch_on_drag_hover.null?
        @@mb_get_switch_on_drag_hover = Bridge.get_method_bind("TabBar", "get_switch_on_drag_hover", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_switch_on_drag_hover, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_tabs_rearrange_group : Void* = Pointer(Void).null
    def set_tabs_rearrange_group(group_id : Int64) : Void
      if @@mb_set_tabs_rearrange_group.null?
        @@mb_set_tabs_rearrange_group = Bridge.get_method_bind("TabBar", "set_tabs_rearrange_group", 1286410249_i64)
      end
      val_0 = group_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tabs_rearrange_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tabs_rearrange_group : Void* = Pointer(Void).null
    def get_tabs_rearrange_group() : Int64
      if @@mb_get_tabs_rearrange_group.null?
        @@mb_get_tabs_rearrange_group = Bridge.get_method_bind("TabBar", "get_tabs_rearrange_group", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_tabs_rearrange_group, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_scroll_to_selected : Void* = Pointer(Void).null
    def set_scroll_to_selected(enabled : Bool) : Void
      if @@mb_set_scroll_to_selected.null?
        @@mb_set_scroll_to_selected = Bridge.get_method_bind("TabBar", "set_scroll_to_selected", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_to_selected, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scroll_to_selected : Void* = Pointer(Void).null
    def get_scroll_to_selected() : Bool
      if @@mb_get_scroll_to_selected.null?
        @@mb_get_scroll_to_selected = Bridge.get_method_bind("TabBar", "get_scroll_to_selected", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_scroll_to_selected, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_select_with_rmb : Void* = Pointer(Void).null
    def set_select_with_rmb(enabled : Bool) : Void
      if @@mb_set_select_with_rmb.null?
        @@mb_set_select_with_rmb = Bridge.get_method_bind("TabBar", "set_select_with_rmb", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_select_with_rmb, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_select_with_rmb : Void* = Pointer(Void).null
    def get_select_with_rmb() : Bool
      if @@mb_get_select_with_rmb.null?
        @@mb_get_select_with_rmb = Bridge.get_method_bind("TabBar", "get_select_with_rmb", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_select_with_rmb, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_deselect_enabled : Void* = Pointer(Void).null
    def set_deselect_enabled(enabled : Bool) : Void
      if @@mb_set_deselect_enabled.null?
        @@mb_set_deselect_enabled = Bridge.get_method_bind("TabBar", "set_deselect_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deselect_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_deselect_enabled : Void* = Pointer(Void).null
    def get_deselect_enabled() : Bool
      if @@mb_get_deselect_enabled.null?
        @@mb_get_deselect_enabled = Bridge.get_method_bind("TabBar", "get_deselect_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_deselect_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_clear_tabs : Void* = Pointer(Void).null
    def clear_tabs() : Void
      if @@mb_clear_tabs.null?
        @@mb_clear_tabs = Bridge.get_method_bind("TabBar", "clear_tabs", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_tabs, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
  end
  class TextureProgressBar < Godot::Range
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum FillMode : Int64
      FillLeftToRight = 0_i64
      FillRightToLeft = 1_i64
      FillTopToBottom = 2_i64
      FillBottomToTop = 3_i64
      FillClockwise = 4_i64
      FillCounterClockwise = 5_i64
      FillBilinearLeftAndRight = 6_i64
      FillBilinearTopAndBottom = 7_i64
      FillClockwiseAndCounterClockwise = 8_i64
    end
    @@mb_set_under_texture : Void* = Pointer(Void).null
    def set_under_texture(tex : Texture2D) : Void
      if @@mb_set_under_texture.null?
        @@mb_set_under_texture = Bridge.get_method_bind("TextureProgressBar", "set_under_texture", 4051416890_i64)
      end
      val_0 = tex
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_under_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_under_texture : Void* = Pointer(Void).null
    def get_under_texture() : Texture2D
      if @@mb_get_under_texture.null?
        @@mb_get_under_texture = Bridge.get_method_bind("TextureProgressBar", "get_under_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_under_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_progress_texture : Void* = Pointer(Void).null
    def set_progress_texture(tex : Texture2D) : Void
      if @@mb_set_progress_texture.null?
        @@mb_set_progress_texture = Bridge.get_method_bind("TextureProgressBar", "set_progress_texture", 4051416890_i64)
      end
      val_0 = tex
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_progress_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_progress_texture : Void* = Pointer(Void).null
    def get_progress_texture() : Texture2D
      if @@mb_get_progress_texture.null?
        @@mb_get_progress_texture = Bridge.get_method_bind("TextureProgressBar", "get_progress_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_progress_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_over_texture : Void* = Pointer(Void).null
    def set_over_texture(tex : Texture2D) : Void
      if @@mb_set_over_texture.null?
        @@mb_set_over_texture = Bridge.get_method_bind("TextureProgressBar", "set_over_texture", 4051416890_i64)
      end
      val_0 = tex
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_over_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_over_texture : Void* = Pointer(Void).null
    def get_over_texture() : Texture2D
      if @@mb_get_over_texture.null?
        @@mb_get_over_texture = Bridge.get_method_bind("TextureProgressBar", "get_over_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_over_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_fill_mode : Void* = Pointer(Void).null
    def set_fill_mode(mode : Int64) : Void
      if @@mb_set_fill_mode.null?
        @@mb_set_fill_mode = Bridge.get_method_bind("TextureProgressBar", "set_fill_mode", 1286410249_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fill_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fill_mode : Void* = Pointer(Void).null
    def get_fill_mode() : Int64
      if @@mb_get_fill_mode.null?
        @@mb_get_fill_mode = Bridge.get_method_bind("TextureProgressBar", "get_fill_mode", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fill_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tint_under : Void* = Pointer(Void).null
    def set_tint_under(tint : Color) : Void
      if @@mb_set_tint_under.null?
        @@mb_set_tint_under = Bridge.get_method_bind("TextureProgressBar", "set_tint_under", 2920490490_i64)
      end
      val_0 = tint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tint_under, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tint_under : Void* = Pointer(Void).null
    def get_tint_under() : Color
      if @@mb_get_tint_under.null?
        @@mb_get_tint_under = Bridge.get_method_bind("TextureProgressBar", "get_tint_under", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_tint_under, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tint_progress : Void* = Pointer(Void).null
    def set_tint_progress(tint : Color) : Void
      if @@mb_set_tint_progress.null?
        @@mb_set_tint_progress = Bridge.get_method_bind("TextureProgressBar", "set_tint_progress", 2920490490_i64)
      end
      val_0 = tint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tint_progress, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tint_progress : Void* = Pointer(Void).null
    def get_tint_progress() : Color
      if @@mb_get_tint_progress.null?
        @@mb_get_tint_progress = Bridge.get_method_bind("TextureProgressBar", "get_tint_progress", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_tint_progress, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tint_over : Void* = Pointer(Void).null
    def set_tint_over(tint : Color) : Void
      if @@mb_set_tint_over.null?
        @@mb_set_tint_over = Bridge.get_method_bind("TextureProgressBar", "set_tint_over", 2920490490_i64)
      end
      val_0 = tint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tint_over, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tint_over : Void* = Pointer(Void).null
    def get_tint_over() : Color
      if @@mb_get_tint_over.null?
        @@mb_get_tint_over = Bridge.get_method_bind("TextureProgressBar", "get_tint_over", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_tint_over, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture_progress_offset : Void* = Pointer(Void).null
    def set_texture_progress_offset(offset : Vector2) : Void
      if @@mb_set_texture_progress_offset.null?
        @@mb_set_texture_progress_offset = Bridge.get_method_bind("TextureProgressBar", "set_texture_progress_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_progress_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_progress_offset : Void* = Pointer(Void).null
    def get_texture_progress_offset() : Vector2
      if @@mb_get_texture_progress_offset.null?
        @@mb_get_texture_progress_offset = Bridge.get_method_bind("TextureProgressBar", "get_texture_progress_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_texture_progress_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_radial_initial_angle : Void* = Pointer(Void).null
    def set_radial_initial_angle(mode : Float64) : Void
      if @@mb_set_radial_initial_angle.null?
        @@mb_set_radial_initial_angle = Bridge.get_method_bind("TextureProgressBar", "set_radial_initial_angle", 373806689_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_radial_initial_angle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_radial_initial_angle : Void* = Pointer(Void).null
    def get_radial_initial_angle() : Float64
      if @@mb_get_radial_initial_angle.null?
        @@mb_get_radial_initial_angle = Bridge.get_method_bind("TextureProgressBar", "get_radial_initial_angle", 191475506_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_radial_initial_angle, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_radial_center_offset : Void* = Pointer(Void).null
    def set_radial_center_offset(mode : Vector2) : Void
      if @@mb_set_radial_center_offset.null?
        @@mb_set_radial_center_offset = Bridge.get_method_bind("TextureProgressBar", "set_radial_center_offset", 743155724_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_radial_center_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_radial_center_offset : Void* = Pointer(Void).null
    def get_radial_center_offset() : Vector2
      if @@mb_get_radial_center_offset.null?
        @@mb_get_radial_center_offset = Bridge.get_method_bind("TextureProgressBar", "get_radial_center_offset", 1497962370_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_radial_center_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fill_degrees : Void* = Pointer(Void).null
    def set_fill_degrees(mode : Float64) : Void
      if @@mb_set_fill_degrees.null?
        @@mb_set_fill_degrees = Bridge.get_method_bind("TextureProgressBar", "set_fill_degrees", 373806689_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fill_degrees, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fill_degrees : Void* = Pointer(Void).null
    def get_fill_degrees() : Float64
      if @@mb_get_fill_degrees.null?
        @@mb_get_fill_degrees = Bridge.get_method_bind("TextureProgressBar", "get_fill_degrees", 191475506_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_fill_degrees, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_stretch_margin : Void* = Pointer(Void).null
    def set_stretch_margin(margin : Int64, value : Int64) : Void
      if @@mb_set_stretch_margin.null?
        @@mb_set_stretch_margin = Bridge.get_method_bind("TextureProgressBar", "set_stretch_margin", 437707142_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_stretch_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stretch_margin : Void* = Pointer(Void).null
    def get_stretch_margin(margin : Int64) : Int64
      if @@mb_get_stretch_margin.null?
        @@mb_get_stretch_margin = Bridge.get_method_bind("TextureProgressBar", "get_stretch_margin", 1983885014_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_stretch_margin, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_nine_patch_stretch : Void* = Pointer(Void).null
    def set_nine_patch_stretch(stretch : Bool) : Void
      if @@mb_set_nine_patch_stretch.null?
        @@mb_set_nine_patch_stretch = Bridge.get_method_bind("TextureProgressBar", "set_nine_patch_stretch", 2586408642_i64)
      end
      val_0 = stretch
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_nine_patch_stretch, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_nine_patch_stretch : Void* = Pointer(Void).null
    def get_nine_patch_stretch() : Bool
      if @@mb_get_nine_patch_stretch.null?
        @@mb_get_nine_patch_stretch = Bridge.get_method_bind("TextureProgressBar", "get_nine_patch_stretch", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_nine_patch_stretch, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class TextureRect < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ExpandMode : Int64
      ExpandKeepSize = 0_i64
      ExpandIgnoreSize = 1_i64
      ExpandFitWidth = 2_i64
      ExpandFitWidthProportional = 3_i64
      ExpandFitHeight = 4_i64
      ExpandFitHeightProportional = 5_i64
    end
    enum StretchMode : Int64
      StretchScale = 0_i64
      StretchTile = 1_i64
      StretchKeep = 2_i64
      StretchKeepCentered = 3_i64
      StretchKeepAspect = 4_i64
      StretchKeepAspectCentered = 5_i64
      StretchKeepAspectCovered = 6_i64
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("TextureRect", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("TextureRect", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_expand_mode : Void* = Pointer(Void).null
    def set_expand_mode(expand_mode : Int64) : Void
      if @@mb_set_expand_mode.null?
        @@mb_set_expand_mode = Bridge.get_method_bind("TextureRect", "set_expand_mode", 1870766882_i64)
      end
      val_0 = expand_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_expand_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_expand_mode : Void* = Pointer(Void).null
    def get_expand_mode() : Int64
      if @@mb_get_expand_mode.null?
        @@mb_get_expand_mode = Bridge.get_method_bind("TextureRect", "get_expand_mode", 3863824733_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_expand_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_flip_h : Void* = Pointer(Void).null
    def set_flip_h(enable : Bool) : Void
      if @@mb_set_flip_h.null?
        @@mb_set_flip_h = Bridge.get_method_bind("TextureRect", "set_flip_h", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flip_h, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flipped_h : Void* = Pointer(Void).null
    def is_flipped_h() : Bool
      if @@mb_is_flipped_h.null?
        @@mb_is_flipped_h = Bridge.get_method_bind("TextureRect", "is_flipped_h", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flipped_h, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_flip_v : Void* = Pointer(Void).null
    def set_flip_v(enable : Bool) : Void
      if @@mb_set_flip_v.null?
        @@mb_set_flip_v = Bridge.get_method_bind("TextureRect", "set_flip_v", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flip_v, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flipped_v : Void* = Pointer(Void).null
    def is_flipped_v() : Bool
      if @@mb_is_flipped_v.null?
        @@mb_is_flipped_v = Bridge.get_method_bind("TextureRect", "is_flipped_v", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flipped_v, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_stretch_mode : Void* = Pointer(Void).null
    def set_stretch_mode(stretch_mode : Int64) : Void
      if @@mb_set_stretch_mode.null?
        @@mb_set_stretch_mode = Bridge.get_method_bind("TextureRect", "set_stretch_mode", 58788729_i64)
      end
      val_0 = stretch_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stretch_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stretch_mode : Void* = Pointer(Void).null
    def get_stretch_mode() : Int64
      if @@mb_get_stretch_mode.null?
        @@mb_get_stretch_mode = Bridge.get_method_bind("TextureRect", "get_stretch_mode", 346396079_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_stretch_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Tree < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum SelectMode : Int64
      SelectSingle = 0_i64
      SelectRow = 1_i64
      SelectMulti = 2_i64
    end
    enum DropModeFlags : Int64
      DropModeDisabled = 0_i64
      DropModeOnItem = 1_i64
      DropModeInbetween = 2_i64
    end
    enum ScrollHintMode : Int64
      ScrollHintModeDisabled = 0_i64
      ScrollHintModeBoth = 1_i64
      ScrollHintModeTop = 2_i64
      ScrollHintModeBottom = 3_i64
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("Tree", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_create_item : Void* = Pointer(Void).null
    def create_item(parent : TreeItem, index : Int64) : TreeItem
      if @@mb_create_item.null?
        @@mb_create_item = Bridge.get_method_bind("Tree", "create_item", 528467046_i64)
      end
      val_0 = parent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      TreeItem.new(ret_ptr)
    end
    @@mb_get_root : Void* = Pointer(Void).null
    def get_root() : TreeItem
      if @@mb_get_root.null?
        @@mb_get_root = Bridge.get_method_bind("Tree", "get_root", 1514277247_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_root, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      TreeItem.new(ret_ptr)
    end
    @@mb_set_column_custom_minimum_width : Void* = Pointer(Void).null
    def set_column_custom_minimum_width(column : Int64, min_width : Int64) : Void
      if @@mb_set_column_custom_minimum_width.null?
        @@mb_set_column_custom_minimum_width = Bridge.get_method_bind("Tree", "set_column_custom_minimum_width", 3937882851_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min_width
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_custom_minimum_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_column_expand : Void* = Pointer(Void).null
    def set_column_expand(column : Int64, expand : Bool) : Void
      if @@mb_set_column_expand.null?
        @@mb_set_column_expand = Bridge.get_method_bind("Tree", "set_column_expand", 300928843_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = expand
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_expand, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_column_expand_ratio : Void* = Pointer(Void).null
    def set_column_expand_ratio(column : Int64, ratio : Int64) : Void
      if @@mb_set_column_expand_ratio.null?
        @@mb_set_column_expand_ratio = Bridge.get_method_bind("Tree", "set_column_expand_ratio", 3937882851_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = ratio
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_expand_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_column_clip_content : Void* = Pointer(Void).null
    def set_column_clip_content(column : Int64, enable : Bool) : Void
      if @@mb_set_column_clip_content.null?
        @@mb_set_column_clip_content = Bridge.get_method_bind("Tree", "set_column_clip_content", 300928843_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_clip_content, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_column_expanding : Void* = Pointer(Void).null
    def is_column_expanding(column : Int64) : Bool
      if @@mb_is_column_expanding.null?
        @@mb_is_column_expanding = Bridge.get_method_bind("Tree", "is_column_expanding", 1116898809_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_column_expanding, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_column_clipping_content : Void* = Pointer(Void).null
    def is_column_clipping_content(column : Int64) : Bool
      if @@mb_is_column_clipping_content.null?
        @@mb_is_column_clipping_content = Bridge.get_method_bind("Tree", "is_column_clipping_content", 1116898809_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_column_clipping_content, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_column_expand_ratio : Void* = Pointer(Void).null
    def get_column_expand_ratio(column : Int64) : Int64
      if @@mb_get_column_expand_ratio.null?
        @@mb_get_column_expand_ratio = Bridge.get_method_bind("Tree", "get_column_expand_ratio", 923996154_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_column_expand_ratio, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_column_width : Void* = Pointer(Void).null
    def get_column_width(column : Int64) : Int64
      if @@mb_get_column_width.null?
        @@mb_get_column_width = Bridge.get_method_bind("Tree", "get_column_width", 923996154_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_column_width, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_custom_drawing_canvas_item : Void* = Pointer(Void).null
    def get_custom_drawing_canvas_item() : Int64
      if @@mb_get_custom_drawing_canvas_item.null?
        @@mb_get_custom_drawing_canvas_item = Bridge.get_method_bind("Tree", "get_custom_drawing_canvas_item", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_custom_drawing_canvas_item, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hide_root : Void* = Pointer(Void).null
    def set_hide_root(enable : Bool) : Void
      if @@mb_set_hide_root.null?
        @@mb_set_hide_root = Bridge.get_method_bind("Tree", "set_hide_root", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hide_root, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_root_hidden : Void* = Pointer(Void).null
    def is_root_hidden() : Bool
      if @@mb_is_root_hidden.null?
        @@mb_is_root_hidden = Bridge.get_method_bind("Tree", "is_root_hidden", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_root_hidden, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_next_selected : Void* = Pointer(Void).null
    def get_next_selected(from : TreeItem) : TreeItem
      if @@mb_get_next_selected.null?
        @@mb_get_next_selected = Bridge.get_method_bind("Tree", "get_next_selected", 873446299_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_next_selected, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      TreeItem.new(ret_ptr)
    end
    @@mb_get_selected : Void* = Pointer(Void).null
    def get_selected() : TreeItem
      if @@mb_get_selected.null?
        @@mb_get_selected = Bridge.get_method_bind("Tree", "get_selected", 1514277247_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_selected, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      TreeItem.new(ret_ptr)
    end
    @@mb_set_selected : Void* = Pointer(Void).null
    def set_selected(item : TreeItem, column : Int64) : Void
      if @@mb_set_selected.null?
        @@mb_set_selected = Bridge.get_method_bind("Tree", "set_selected", 2662547442_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_selected, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_selected_column : Void* = Pointer(Void).null
    def get_selected_column() : Int64
      if @@mb_get_selected_column.null?
        @@mb_get_selected_column = Bridge.get_method_bind("Tree", "get_selected_column", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_selected_column, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_pressed_button : Void* = Pointer(Void).null
    def get_pressed_button() : Int64
      if @@mb_get_pressed_button.null?
        @@mb_get_pressed_button = Bridge.get_method_bind("Tree", "get_pressed_button", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_pressed_button, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_select_mode : Void* = Pointer(Void).null
    def set_select_mode(mode : Int64) : Void
      if @@mb_set_select_mode.null?
        @@mb_set_select_mode = Bridge.get_method_bind("Tree", "set_select_mode", 3223887270_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_select_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_select_mode : Void* = Pointer(Void).null
    def get_select_mode() : Int64
      if @@mb_get_select_mode.null?
        @@mb_get_select_mode = Bridge.get_method_bind("Tree", "get_select_mode", 100748571_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_select_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_deselect_all : Void* = Pointer(Void).null
    def deselect_all() : Void
      if @@mb_deselect_all.null?
        @@mb_deselect_all = Bridge.get_method_bind("Tree", "deselect_all", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_deselect_all, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_columns : Void* = Pointer(Void).null
    def set_columns(amount : Int64) : Void
      if @@mb_set_columns.null?
        @@mb_set_columns = Bridge.get_method_bind("Tree", "set_columns", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_columns, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_columns : Void* = Pointer(Void).null
    def get_columns() : Int64
      if @@mb_get_columns.null?
        @@mb_get_columns = Bridge.get_method_bind("Tree", "get_columns", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_columns, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_edited : Void* = Pointer(Void).null
    def get_edited() : TreeItem
      if @@mb_get_edited.null?
        @@mb_get_edited = Bridge.get_method_bind("Tree", "get_edited", 1514277247_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_edited, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      TreeItem.new(ret_ptr)
    end
    @@mb_get_edited_column : Void* = Pointer(Void).null
    def get_edited_column() : Int64
      if @@mb_get_edited_column.null?
        @@mb_get_edited_column = Bridge.get_method_bind("Tree", "get_edited_column", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_edited_column, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_edit_selected : Void* = Pointer(Void).null
    def edit_selected(force_edit : Bool) : Bool
      if @@mb_edit_selected.null?
        @@mb_edit_selected = Bridge.get_method_bind("Tree", "edit_selected", 2595650253_i64)
      end
      val_0 = force_edit
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_edit_selected, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_custom_popup_rect : Void* = Pointer(Void).null
    def get_custom_popup_rect() : Rect2
      if @@mb_get_custom_popup_rect.null?
        @@mb_get_custom_popup_rect = Bridge.get_method_bind("Tree", "get_custom_popup_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_custom_popup_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_get_item_area_rect : Void* = Pointer(Void).null
    def get_item_area_rect(item : TreeItem, column : Int64, button_index : Int64) : Rect2
      if @@mb_get_item_area_rect.null?
        @@mb_get_item_area_rect = Bridge.get_method_bind("Tree", "get_item_area_rect", 47968679_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = column
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = button_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_item_area_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_get_item_at_position : Void* = Pointer(Void).null
    def get_item_at_position(position : Vector2) : TreeItem
      if @@mb_get_item_at_position.null?
        @@mb_get_item_at_position = Bridge.get_method_bind("Tree", "get_item_at_position", 4193340126_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_item_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      TreeItem.new(ret_ptr)
    end
    @@mb_get_column_at_position : Void* = Pointer(Void).null
    def get_column_at_position(position : Vector2) : Int64
      if @@mb_get_column_at_position.null?
        @@mb_get_column_at_position = Bridge.get_method_bind("Tree", "get_column_at_position", 3820158470_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_column_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_drop_section_at_position : Void* = Pointer(Void).null
    def get_drop_section_at_position(position : Vector2) : Int64
      if @@mb_get_drop_section_at_position.null?
        @@mb_get_drop_section_at_position = Bridge.get_method_bind("Tree", "get_drop_section_at_position", 3820158470_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_drop_section_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_button_id_at_position : Void* = Pointer(Void).null
    def get_button_id_at_position(position : Vector2) : Int64
      if @@mb_get_button_id_at_position.null?
        @@mb_get_button_id_at_position = Bridge.get_method_bind("Tree", "get_button_id_at_position", 3820158470_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_button_id_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_ensure_cursor_is_visible : Void* = Pointer(Void).null
    def ensure_cursor_is_visible() : Void
      if @@mb_ensure_cursor_is_visible.null?
        @@mb_ensure_cursor_is_visible = Bridge.get_method_bind("Tree", "ensure_cursor_is_visible", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_ensure_cursor_is_visible, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_column_titles_visible : Void* = Pointer(Void).null
    def set_column_titles_visible(visible : Bool) : Void
      if @@mb_set_column_titles_visible.null?
        @@mb_set_column_titles_visible = Bridge.get_method_bind("Tree", "set_column_titles_visible", 2586408642_i64)
      end
      val_0 = visible
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_column_titles_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_are_column_titles_visible : Void* = Pointer(Void).null
    def are_column_titles_visible() : Bool
      if @@mb_are_column_titles_visible.null?
        @@mb_are_column_titles_visible = Bridge.get_method_bind("Tree", "are_column_titles_visible", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_are_column_titles_visible, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_column_title : Void* = Pointer(Void).null
    def set_column_title(column : Int64, title : String) : Void
      if @@mb_set_column_title.null?
        @@mb_set_column_title = Bridge.get_method_bind("Tree", "set_column_title", 501894301_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = title
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_title, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_column_title : Void* = Pointer(Void).null
    def get_column_title(column : Int64) : String
      if @@mb_get_column_title.null?
        @@mb_get_column_title = Bridge.get_method_bind("Tree", "get_column_title", 844755477_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_column_title_tooltip_text : Void* = Pointer(Void).null
    def set_column_title_tooltip_text(column : Int64, tooltip_text : String) : Void
      if @@mb_set_column_title_tooltip_text.null?
        @@mb_set_column_title_tooltip_text = Bridge.get_method_bind("Tree", "set_column_title_tooltip_text", 501894301_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip_text
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_title_tooltip_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_column_title_tooltip_text : Void* = Pointer(Void).null
    def get_column_title_tooltip_text(column : Int64) : String
      if @@mb_get_column_title_tooltip_text.null?
        @@mb_get_column_title_tooltip_text = Bridge.get_method_bind("Tree", "get_column_title_tooltip_text", 844755477_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_column_title_alignment : Void* = Pointer(Void).null
    def set_column_title_alignment(column : Int64, title_alignment : Int64) : Void
      if @@mb_set_column_title_alignment.null?
        @@mb_set_column_title_alignment = Bridge.get_method_bind("Tree", "set_column_title_alignment", 3276431499_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = title_alignment
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_title_alignment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_column_title_alignment : Void* = Pointer(Void).null
    def get_column_title_alignment(column : Int64) : Int64
      if @@mb_get_column_title_alignment.null?
        @@mb_get_column_title_alignment = Bridge.get_method_bind("Tree", "get_column_title_alignment", 4171562184_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_column_title_alignment, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_column_title_direction : Void* = Pointer(Void).null
    def set_column_title_direction(column : Int64, direction : Int64) : Void
      if @@mb_set_column_title_direction.null?
        @@mb_set_column_title_direction = Bridge.get_method_bind("Tree", "set_column_title_direction", 1707680378_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = direction
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_title_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_column_title_direction : Void* = Pointer(Void).null
    def get_column_title_direction(column : Int64) : Int64
      if @@mb_get_column_title_direction.null?
        @@mb_get_column_title_direction = Bridge.get_method_bind("Tree", "get_column_title_direction", 4235602388_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_column_title_direction, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_column_title_language : Void* = Pointer(Void).null
    def set_column_title_language(column : Int64, language : String) : Void
      if @@mb_set_column_title_language.null?
        @@mb_set_column_title_language = Bridge.get_method_bind("Tree", "set_column_title_language", 501894301_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_column_title_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_column_title_language : Void* = Pointer(Void).null
    def get_column_title_language(column : Int64) : String
      if @@mb_get_column_title_language.null?
        @@mb_get_column_title_language = Bridge.get_method_bind("Tree", "get_column_title_language", 844755477_i64)
      end
      val_0 = column
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_scroll : Void* = Pointer(Void).null
    def get_scroll() : Vector2
      if @@mb_get_scroll.null?
        @@mb_get_scroll = Bridge.get_method_bind("Tree", "get_scroll", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_scroll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_scroll_to_item : Void* = Pointer(Void).null
    def scroll_to_item(item : TreeItem, center_on_item : Bool) : Void
      if @@mb_scroll_to_item.null?
        @@mb_scroll_to_item = Bridge.get_method_bind("Tree", "scroll_to_item", 1314737213_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = center_on_item
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_scroll_to_item, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_h_scroll_enabled : Void* = Pointer(Void).null
    def set_h_scroll_enabled(h_scroll : Bool) : Void
      if @@mb_set_h_scroll_enabled.null?
        @@mb_set_h_scroll_enabled = Bridge.get_method_bind("Tree", "set_h_scroll_enabled", 2586408642_i64)
      end
      val_0 = h_scroll
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_h_scroll_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_h_scroll_enabled : Void* = Pointer(Void).null
    def is_h_scroll_enabled() : Bool
      if @@mb_is_h_scroll_enabled.null?
        @@mb_is_h_scroll_enabled = Bridge.get_method_bind("Tree", "is_h_scroll_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_h_scroll_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_v_scroll_enabled : Void* = Pointer(Void).null
    def set_v_scroll_enabled(h_scroll : Bool) : Void
      if @@mb_set_v_scroll_enabled.null?
        @@mb_set_v_scroll_enabled = Bridge.get_method_bind("Tree", "set_v_scroll_enabled", 2586408642_i64)
      end
      val_0 = h_scroll
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_scroll_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_v_scroll_enabled : Void* = Pointer(Void).null
    def is_v_scroll_enabled() : Bool
      if @@mb_is_v_scroll_enabled.null?
        @@mb_is_v_scroll_enabled = Bridge.get_method_bind("Tree", "is_v_scroll_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_v_scroll_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_scroll_hint_mode : Void* = Pointer(Void).null
    def set_scroll_hint_mode(scroll_hint_mode : Int64) : Void
      if @@mb_set_scroll_hint_mode.null?
        @@mb_set_scroll_hint_mode = Bridge.get_method_bind("Tree", "set_scroll_hint_mode", 415911924_i64)
      end
      val_0 = scroll_hint_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_hint_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scroll_hint_mode : Void* = Pointer(Void).null
    def get_scroll_hint_mode() : Int64
      if @@mb_get_scroll_hint_mode.null?
        @@mb_get_scroll_hint_mode = Bridge.get_method_bind("Tree", "get_scroll_hint_mode", 553087187_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_scroll_hint_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tile_scroll_hint : Void* = Pointer(Void).null
    def set_tile_scroll_hint(tile_scroll_hint : Bool) : Void
      if @@mb_set_tile_scroll_hint.null?
        @@mb_set_tile_scroll_hint = Bridge.get_method_bind("Tree", "set_tile_scroll_hint", 2586408642_i64)
      end
      val_0 = tile_scroll_hint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tile_scroll_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_scroll_hint_tiled : Void* = Pointer(Void).null
    def is_scroll_hint_tiled() : Bool
      if @@mb_is_scroll_hint_tiled.null?
        @@mb_is_scroll_hint_tiled = Bridge.get_method_bind("Tree", "is_scroll_hint_tiled", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_scroll_hint_tiled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_hide_folding : Void* = Pointer(Void).null
    def set_hide_folding(hide : Bool) : Void
      if @@mb_set_hide_folding.null?
        @@mb_set_hide_folding = Bridge.get_method_bind("Tree", "set_hide_folding", 2586408642_i64)
      end
      val_0 = hide
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hide_folding, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_folding_hidden : Void* = Pointer(Void).null
    def is_folding_hidden() : Bool
      if @@mb_is_folding_hidden.null?
        @@mb_is_folding_hidden = Bridge.get_method_bind("Tree", "is_folding_hidden", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_folding_hidden, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_enable_recursive_folding : Void* = Pointer(Void).null
    def set_enable_recursive_folding(enable : Bool) : Void
      if @@mb_set_enable_recursive_folding.null?
        @@mb_set_enable_recursive_folding = Bridge.get_method_bind("Tree", "set_enable_recursive_folding", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_recursive_folding, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_recursive_folding_enabled : Void* = Pointer(Void).null
    def is_recursive_folding_enabled() : Bool
      if @@mb_is_recursive_folding_enabled.null?
        @@mb_is_recursive_folding_enabled = Bridge.get_method_bind("Tree", "is_recursive_folding_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_recursive_folding_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_enable_drag_unfolding : Void* = Pointer(Void).null
    def set_enable_drag_unfolding(enable : Bool) : Void
      if @@mb_set_enable_drag_unfolding.null?
        @@mb_set_enable_drag_unfolding = Bridge.get_method_bind("Tree", "set_enable_drag_unfolding", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_drag_unfolding, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drag_unfolding_enabled : Void* = Pointer(Void).null
    def is_drag_unfolding_enabled() : Bool
      if @@mb_is_drag_unfolding_enabled.null?
        @@mb_is_drag_unfolding_enabled = Bridge.get_method_bind("Tree", "is_drag_unfolding_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drag_unfolding_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drop_mode_flags : Void* = Pointer(Void).null
    def set_drop_mode_flags(flags : Int64) : Void
      if @@mb_set_drop_mode_flags.null?
        @@mb_set_drop_mode_flags = Bridge.get_method_bind("Tree", "set_drop_mode_flags", 1286410249_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drop_mode_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_drop_mode_flags : Void* = Pointer(Void).null
    def get_drop_mode_flags() : Int64
      if @@mb_get_drop_mode_flags.null?
        @@mb_get_drop_mode_flags = Bridge.get_method_bind("Tree", "get_drop_mode_flags", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_drop_mode_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_allow_rmb_select : Void* = Pointer(Void).null
    def set_allow_rmb_select(allow : Bool) : Void
      if @@mb_set_allow_rmb_select.null?
        @@mb_set_allow_rmb_select = Bridge.get_method_bind("Tree", "set_allow_rmb_select", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_rmb_select, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_allow_rmb_select : Void* = Pointer(Void).null
    def get_allow_rmb_select() : Bool
      if @@mb_get_allow_rmb_select.null?
        @@mb_get_allow_rmb_select = Bridge.get_method_bind("Tree", "get_allow_rmb_select", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_allow_rmb_select, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_allow_reselect : Void* = Pointer(Void).null
    def set_allow_reselect(allow : Bool) : Void
      if @@mb_set_allow_reselect.null?
        @@mb_set_allow_reselect = Bridge.get_method_bind("Tree", "set_allow_reselect", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_reselect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_allow_reselect : Void* = Pointer(Void).null
    def get_allow_reselect() : Bool
      if @@mb_get_allow_reselect.null?
        @@mb_get_allow_reselect = Bridge.get_method_bind("Tree", "get_allow_reselect", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_allow_reselect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_allow_search : Void* = Pointer(Void).null
    def set_allow_search(allow : Bool) : Void
      if @@mb_set_allow_search.null?
        @@mb_set_allow_search = Bridge.get_method_bind("Tree", "set_allow_search", 2586408642_i64)
      end
      val_0 = allow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_allow_search, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_allow_search : Void* = Pointer(Void).null
    def get_allow_search() : Bool
      if @@mb_get_allow_search.null?
        @@mb_get_allow_search = Bridge.get_method_bind("Tree", "get_allow_search", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_allow_search, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_auto_tooltip : Void* = Pointer(Void).null
    def set_auto_tooltip(enable : Bool) : Void
      if @@mb_set_auto_tooltip.null?
        @@mb_set_auto_tooltip = Bridge.get_method_bind("Tree", "set_auto_tooltip", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_auto_tooltip_enabled : Void* = Pointer(Void).null
    def is_auto_tooltip_enabled() : Bool
      if @@mb_is_auto_tooltip_enabled.null?
        @@mb_is_auto_tooltip_enabled = Bridge.get_method_bind("Tree", "is_auto_tooltip_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_auto_tooltip_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class VideoStreamPlayer < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_stream : Void* = Pointer(Void).null
    def set_stream(stream : VideoStream) : Void
      if @@mb_set_stream.null?
        @@mb_set_stream = Bridge.get_method_bind("VideoStreamPlayer", "set_stream", 2317102564_i64)
      end
      val_0 = stream
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stream, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stream : Void* = Pointer(Void).null
    def get_stream() : VideoStream
      if @@mb_get_stream.null?
        @@mb_get_stream = Bridge.get_method_bind("VideoStreamPlayer", "get_stream", 438621487_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_stream, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      VideoStream.new(ret_ptr)
    end
    @@mb_play : Void* = Pointer(Void).null
    def play() : Void
      if @@mb_play.null?
        @@mb_play = Bridge.get_method_bind("VideoStreamPlayer", "play", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_play, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_stop : Void* = Pointer(Void).null
    def stop() : Void
      if @@mb_stop.null?
        @@mb_stop = Bridge.get_method_bind("VideoStreamPlayer", "stop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_stop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_playing : Void* = Pointer(Void).null
    def is_playing() : Bool
      if @@mb_is_playing.null?
        @@mb_is_playing = Bridge.get_method_bind("VideoStreamPlayer", "is_playing", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_playing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_paused : Void* = Pointer(Void).null
    def set_paused(paused : Bool) : Void
      if @@mb_set_paused.null?
        @@mb_set_paused = Bridge.get_method_bind("VideoStreamPlayer", "set_paused", 2586408642_i64)
      end
      val_0 = paused
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_paused, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_paused : Void* = Pointer(Void).null
    def is_paused() : Bool
      if @@mb_is_paused.null?
        @@mb_is_paused = Bridge.get_method_bind("VideoStreamPlayer", "is_paused", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_paused, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_loop : Void* = Pointer(Void).null
    def set_loop(loop : Bool) : Void
      if @@mb_set_loop.null?
        @@mb_set_loop = Bridge.get_method_bind("VideoStreamPlayer", "set_loop", 2586408642_i64)
      end
      val_0 = loop
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_loop, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_loop : Void* = Pointer(Void).null
    def has_loop() : Bool
      if @@mb_has_loop.null?
        @@mb_has_loop = Bridge.get_method_bind("VideoStreamPlayer", "has_loop", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_loop, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_volume : Void* = Pointer(Void).null
    def set_volume(volume : Float64) : Void
      if @@mb_set_volume.null?
        @@mb_set_volume = Bridge.get_method_bind("VideoStreamPlayer", "set_volume", 373806689_i64)
      end
      val_0 = volume
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_volume, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_volume : Void* = Pointer(Void).null
    def get_volume() : Float64
      if @@mb_get_volume.null?
        @@mb_get_volume = Bridge.get_method_bind("VideoStreamPlayer", "get_volume", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_volume, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_volume_db : Void* = Pointer(Void).null
    def set_volume_db(db : Float64) : Void
      if @@mb_set_volume_db.null?
        @@mb_set_volume_db = Bridge.get_method_bind("VideoStreamPlayer", "set_volume_db", 373806689_i64)
      end
      val_0 = db
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_volume_db, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_volume_db : Void* = Pointer(Void).null
    def get_volume_db() : Float64
      if @@mb_get_volume_db.null?
        @@mb_get_volume_db = Bridge.get_method_bind("VideoStreamPlayer", "get_volume_db", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_volume_db, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_speed_scale : Void* = Pointer(Void).null
    def set_speed_scale(speed_scale : Float64) : Void
      if @@mb_set_speed_scale.null?
        @@mb_set_speed_scale = Bridge.get_method_bind("VideoStreamPlayer", "set_speed_scale", 373806689_i64)
      end
      val_0 = speed_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_speed_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_speed_scale : Void* = Pointer(Void).null
    def get_speed_scale() : Float64
      if @@mb_get_speed_scale.null?
        @@mb_get_speed_scale = Bridge.get_method_bind("VideoStreamPlayer", "get_speed_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_speed_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_audio_track : Void* = Pointer(Void).null
    def set_audio_track(track : Int64) : Void
      if @@mb_set_audio_track.null?
        @@mb_set_audio_track = Bridge.get_method_bind("VideoStreamPlayer", "set_audio_track", 1286410249_i64)
      end
      val_0 = track
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_audio_track, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_audio_track : Void* = Pointer(Void).null
    def get_audio_track() : Int64
      if @@mb_get_audio_track.null?
        @@mb_get_audio_track = Bridge.get_method_bind("VideoStreamPlayer", "get_audio_track", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_audio_track, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_stream_name : Void* = Pointer(Void).null
    def get_stream_name() : String
      if @@mb_get_stream_name.null?
        @@mb_get_stream_name = Bridge.get_method_bind("VideoStreamPlayer", "get_stream_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_stream_length : Void* = Pointer(Void).null
    def get_stream_length() : Float64
      if @@mb_get_stream_length.null?
        @@mb_get_stream_length = Bridge.get_method_bind("VideoStreamPlayer", "get_stream_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_stream_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_stream_position : Void* = Pointer(Void).null
    def set_stream_position(position : Float64) : Void
      if @@mb_set_stream_position.null?
        @@mb_set_stream_position = Bridge.get_method_bind("VideoStreamPlayer", "set_stream_position", 373806689_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stream_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stream_position : Void* = Pointer(Void).null
    def get_stream_position() : Float64
      if @@mb_get_stream_position.null?
        @@mb_get_stream_position = Bridge.get_method_bind("VideoStreamPlayer", "get_stream_position", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_stream_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autoplay : Void* = Pointer(Void).null
    def set_autoplay(enabled : Bool) : Void
      if @@mb_set_autoplay.null?
        @@mb_set_autoplay = Bridge.get_method_bind("VideoStreamPlayer", "set_autoplay", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autoplay, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_autoplay : Void* = Pointer(Void).null
    def has_autoplay() : Bool
      if @@mb_has_autoplay.null?
        @@mb_has_autoplay = Bridge.get_method_bind("VideoStreamPlayer", "has_autoplay", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_autoplay, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_expand : Void* = Pointer(Void).null
    def set_expand(enable : Bool) : Void
      if @@mb_set_expand.null?
        @@mb_set_expand = Bridge.get_method_bind("VideoStreamPlayer", "set_expand", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_expand, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_expand : Void* = Pointer(Void).null
    def has_expand() : Bool
      if @@mb_has_expand.null?
        @@mb_has_expand = Bridge.get_method_bind("VideoStreamPlayer", "has_expand", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_expand, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_buffering_msec : Void* = Pointer(Void).null
    def set_buffering_msec(msec : Int64) : Void
      if @@mb_set_buffering_msec.null?
        @@mb_set_buffering_msec = Bridge.get_method_bind("VideoStreamPlayer", "set_buffering_msec", 1286410249_i64)
      end
      val_0 = msec
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_buffering_msec, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_buffering_msec : Void* = Pointer(Void).null
    def get_buffering_msec() : Int64
      if @@mb_get_buffering_msec.null?
        @@mb_get_buffering_msec = Bridge.get_method_bind("VideoStreamPlayer", "get_buffering_msec", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_buffering_msec, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bus : Void* = Pointer(Void).null
    def set_bus(bus : String) : Void
      if @@mb_set_bus.null?
        @@mb_set_bus = Bridge.get_method_bind("VideoStreamPlayer", "set_bus", 3304788590_i64)
      end
      val_0 = bus
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus : Void* = Pointer(Void).null
    def get_bus() : String
      if @@mb_get_bus.null?
        @@mb_get_bus = Bridge.get_method_bind("VideoStreamPlayer", "get_bus", 2002593661_i64)
      end
      ""
    end
    @@mb_get_video_texture : Void* = Pointer(Void).null
    def get_video_texture() : Texture2D
      if @@mb_get_video_texture.null?
        @@mb_get_video_texture = Bridge.get_method_bind("VideoStreamPlayer", "get_video_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_video_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
  end
  class VirtualJoystick < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum JoystickMode : Int64
      JoystickFixed = 0_i64
      JoystickDynamic = 1_i64
      JoystickFollowing = 2_i64
    end
    enum VisibilityMode : Int64
      VisibilityAlways = 0_i64
      VisibilityWhenTouched = 1_i64
    end
    @@mb_set_joystick_mode : Void* = Pointer(Void).null
    def set_joystick_mode(mode : Int64) : Void
      if @@mb_set_joystick_mode.null?
        @@mb_set_joystick_mode = Bridge.get_method_bind("VirtualJoystick", "set_joystick_mode", 1316760817_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joystick_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joystick_mode : Void* = Pointer(Void).null
    def get_joystick_mode() : Int64
      if @@mb_get_joystick_mode.null?
        @@mb_get_joystick_mode = Bridge.get_method_bind("VirtualJoystick", "get_joystick_mode", 2694680530_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_joystick_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_joystick_size : Void* = Pointer(Void).null
    def set_joystick_size(size : Float64) : Void
      if @@mb_set_joystick_size.null?
        @@mb_set_joystick_size = Bridge.get_method_bind("VirtualJoystick", "set_joystick_size", 373806689_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joystick_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joystick_size : Void* = Pointer(Void).null
    def get_joystick_size() : Float64
      if @@mb_get_joystick_size.null?
        @@mb_get_joystick_size = Bridge.get_method_bind("VirtualJoystick", "get_joystick_size", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_joystick_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_tip_size : Void* = Pointer(Void).null
    def set_tip_size(size : Float64) : Void
      if @@mb_set_tip_size.null?
        @@mb_set_tip_size = Bridge.get_method_bind("VirtualJoystick", "set_tip_size", 373806689_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tip_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tip_size : Void* = Pointer(Void).null
    def get_tip_size() : Float64
      if @@mb_get_tip_size.null?
        @@mb_get_tip_size = Bridge.get_method_bind("VirtualJoystick", "get_tip_size", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_tip_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_deadzone_ratio : Void* = Pointer(Void).null
    def set_deadzone_ratio(ratio : Float64) : Void
      if @@mb_set_deadzone_ratio.null?
        @@mb_set_deadzone_ratio = Bridge.get_method_bind("VirtualJoystick", "set_deadzone_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_deadzone_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_deadzone_ratio : Void* = Pointer(Void).null
    def get_deadzone_ratio() : Float64
      if @@mb_get_deadzone_ratio.null?
        @@mb_get_deadzone_ratio = Bridge.get_method_bind("VirtualJoystick", "get_deadzone_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_deadzone_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_clampzone_ratio : Void* = Pointer(Void).null
    def set_clampzone_ratio(ratio : Float64) : Void
      if @@mb_set_clampzone_ratio.null?
        @@mb_set_clampzone_ratio = Bridge.get_method_bind("VirtualJoystick", "set_clampzone_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_clampzone_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_clampzone_ratio : Void* = Pointer(Void).null
    def get_clampzone_ratio() : Float64
      if @@mb_get_clampzone_ratio.null?
        @@mb_get_clampzone_ratio = Bridge.get_method_bind("VirtualJoystick", "get_clampzone_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_clampzone_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_initial_offset_ratio : Void* = Pointer(Void).null
    def set_initial_offset_ratio(ratio : Vector2) : Void
      if @@mb_set_initial_offset_ratio.null?
        @@mb_set_initial_offset_ratio = Bridge.get_method_bind("VirtualJoystick", "set_initial_offset_ratio", 743155724_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_initial_offset_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_initial_offset_ratio : Void* = Pointer(Void).null
    def get_initial_offset_ratio() : Vector2
      if @@mb_get_initial_offset_ratio.null?
        @@mb_get_initial_offset_ratio = Bridge.get_method_bind("VirtualJoystick", "get_initial_offset_ratio", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_initial_offset_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_action_left : Void* = Pointer(Void).null
    def set_action_left(action : String) : Void
      if @@mb_set_action_left.null?
        @@mb_set_action_left = Bridge.get_method_bind("VirtualJoystick", "set_action_left", 3304788590_i64)
      end
      val_0 = action
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_left, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_action_left : Void* = Pointer(Void).null
    def get_action_left() : String
      if @@mb_get_action_left.null?
        @@mb_get_action_left = Bridge.get_method_bind("VirtualJoystick", "get_action_left", 2002593661_i64)
      end
      ""
    end
    @@mb_set_action_right : Void* = Pointer(Void).null
    def set_action_right(action : String) : Void
      if @@mb_set_action_right.null?
        @@mb_set_action_right = Bridge.get_method_bind("VirtualJoystick", "set_action_right", 3304788590_i64)
      end
      val_0 = action
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_right, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_action_right : Void* = Pointer(Void).null
    def get_action_right() : String
      if @@mb_get_action_right.null?
        @@mb_get_action_right = Bridge.get_method_bind("VirtualJoystick", "get_action_right", 2002593661_i64)
      end
      ""
    end
    @@mb_set_action_up : Void* = Pointer(Void).null
    def set_action_up(action : String) : Void
      if @@mb_set_action_up.null?
        @@mb_set_action_up = Bridge.get_method_bind("VirtualJoystick", "set_action_up", 3304788590_i64)
      end
      val_0 = action
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_up, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_action_up : Void* = Pointer(Void).null
    def get_action_up() : String
      if @@mb_get_action_up.null?
        @@mb_get_action_up = Bridge.get_method_bind("VirtualJoystick", "get_action_up", 2002593661_i64)
      end
      ""
    end
    @@mb_set_action_down : Void* = Pointer(Void).null
    def set_action_down(action : String) : Void
      if @@mb_set_action_down.null?
        @@mb_set_action_down = Bridge.get_method_bind("VirtualJoystick", "set_action_down", 3304788590_i64)
      end
      val_0 = action
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_action_down, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_action_down : Void* = Pointer(Void).null
    def get_action_down() : String
      if @@mb_get_action_down.null?
        @@mb_get_action_down = Bridge.get_method_bind("VirtualJoystick", "get_action_down", 2002593661_i64)
      end
      ""
    end
    @@mb_set_visibility_mode : Void* = Pointer(Void).null
    def set_visibility_mode(mode : Int64) : Void
      if @@mb_set_visibility_mode.null?
        @@mb_set_visibility_mode = Bridge.get_method_bind("VirtualJoystick", "set_visibility_mode", 2638298545_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visibility_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_visibility_mode : Void* = Pointer(Void).null
    def get_visibility_mode() : Int64
      if @@mb_get_visibility_mode.null?
        @@mb_get_visibility_mode = Bridge.get_method_bind("VirtualJoystick", "get_visibility_mode", 3530872950_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_visibility_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
end
