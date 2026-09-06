# Generated servers classes
module Godot
  class AccessibilityServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum AccessibilityRole : Int64
      RoleUnknown = 0_i64
      RoleDefaultButton = 1_i64
      RoleAudio = 2_i64
      RoleVideo = 3_i64
      RoleStaticText = 4_i64
      RoleContainer = 5_i64
      RolePanel = 6_i64
      RoleButton = 7_i64
      RoleLink = 8_i64
      RoleCheckBox = 9_i64
      RoleRadioButton = 10_i64
      RoleCheckButton = 11_i64
      RoleScrollBar = 12_i64
      RoleScrollView = 13_i64
      RoleSplitter = 14_i64
      RoleSlider = 15_i64
      RoleSpinButton = 16_i64
      RoleProgressIndicator = 17_i64
      RoleTextField = 18_i64
      RoleMultilineTextField = 19_i64
      RoleColorPicker = 20_i64
      RoleTable = 21_i64
      RoleCell = 22_i64
      RoleRow = 23_i64
      RoleRowGroup = 24_i64
      RoleRowHeader = 25_i64
      RoleColumnHeader = 26_i64
      RoleTree = 27_i64
      RoleTreeItem = 28_i64
      RoleList = 29_i64
      RoleListItem = 30_i64
      RoleListBox = 31_i64
      RoleListBoxOption = 32_i64
      RoleTabBar = 33_i64
      RoleTab = 34_i64
      RoleTabPanel = 35_i64
      RoleMenuBar = 36_i64
      RoleMenu = 37_i64
      RoleMenuItem = 38_i64
      RoleMenuItemCheckBox = 39_i64
      RoleMenuItemRadio = 40_i64
      RoleImage = 41_i64
      RoleWindow = 42_i64
      RoleTitleBar = 43_i64
      RoleDialog = 44_i64
      RoleTooltip = 45_i64
      RoleRegion = 46_i64
      RoleTextRun = 47_i64
    end
    enum AccessibilityPopupType : Int64
      PopupMenu = 0_i64
      PopupList = 1_i64
      PopupTree = 2_i64
      PopupDialog = 3_i64
    end
    enum AccessibilityFlags : Int64
      FlagHidden = 0_i64
      FlagMultiselectable = 1_i64
      FlagRequired = 2_i64
      FlagVisited = 3_i64
      FlagBusy = 4_i64
      FlagModal = 5_i64
      FlagTouchPassthrough = 6_i64
      FlagReadonly = 7_i64
      FlagDisabled = 8_i64
      FlagClipsChildren = 9_i64
    end
    enum AccessibilityAction : Int64
      ActionClick = 0_i64
      ActionFocus = 1_i64
      ActionBlur = 2_i64
      ActionCollapse = 3_i64
      ActionExpand = 4_i64
      ActionDecrement = 5_i64
      ActionIncrement = 6_i64
      ActionHideTooltip = 7_i64
      ActionShowTooltip = 8_i64
      ActionSetTextSelection = 9_i64
      ActionReplaceSelectedText = 10_i64
      ActionScrollBackward = 11_i64
      ActionScrollDown = 12_i64
      ActionScrollForward = 13_i64
      ActionScrollLeft = 14_i64
      ActionScrollRight = 15_i64
      ActionScrollUp = 16_i64
      ActionScrollIntoView = 17_i64
      ActionScrollToPoint = 18_i64
      ActionSetScrollOffset = 19_i64
      ActionSetValue = 20_i64
      ActionShowContextMenu = 21_i64
      ActionCustom = 22_i64
    end
    enum AccessibilityLiveMode : Int64
      LiveOff = 0_i64
      LivePolite = 1_i64
      LiveAssertive = 2_i64
    end
    enum AccessibilityScrollUnit : Int64
      ScrollUnitItem = 0_i64
      ScrollUnitPage = 1_i64
    end
    enum AccessibilityScrollHint : Int64
      ScrollHintTopLeft = 0_i64
      ScrollHintBottomRight = 1_i64
      ScrollHintTopEdge = 2_i64
      ScrollHintBottomEdge = 3_i64
      ScrollHintLeftEdge = 4_i64
      ScrollHintRightEdge = 5_i64
    end
    @@mb_is_supported : Void* = Pointer(Void).null
    def is_supported() : Bool
      if @@mb_is_supported.null?
        @@mb_is_supported = Bridge.get_method_bind("AccessibilityServer", "is_supported", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_supported, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_create_element : Void* = Pointer(Void).null
    def create_element(window_id : Int64, role : Int64) : Int64
      if @@mb_create_element.null?
        @@mb_create_element = Bridge.get_method_bind("AccessibilityServer", "create_element", 3846965249_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = role
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_element, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_create_sub_element : Void* = Pointer(Void).null
    def create_sub_element(parent_rid : Int64, role : Int64, insert_pos : Int64) : Int64
      if @@mb_create_sub_element.null?
        @@mb_create_sub_element = Bridge.get_method_bind("AccessibilityServer", "create_sub_element", 1151690429_i64)
      end
      val_0 = parent_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = role
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = insert_pos
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_sub_element, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_create_sub_text_edit_elements : Void* = Pointer(Void).null
    def create_sub_text_edit_elements(parent_rid : Int64, shaped_text : Int64, min_height : Float64, insert_pos : Int64, is_last_line : Bool) : Int64
      if @@mb_create_sub_text_edit_elements.null?
        @@mb_create_sub_text_edit_elements = Bridge.get_method_bind("AccessibilityServer", "create_sub_text_edit_elements", 2702009895_i64)
      end
      val_0 = parent_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shaped_text
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = min_height
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = insert_pos
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = is_last_line
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_sub_text_edit_elements, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_element : Void* = Pointer(Void).null
    def has_element(id : Int64) : Bool
      if @@mb_has_element.null?
        @@mb_has_element = Bridge.get_method_bind("AccessibilityServer", "has_element", 4155700596_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_element, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_free_element : Void* = Pointer(Void).null
    def free_element(id : Int64) : Void
      if @@mb_free_element.null?
        @@mb_free_element = Bridge.get_method_bind("AccessibilityServer", "free_element", 2722037293_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_free_element, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_element_set_meta : Void* = Pointer(Void).null
    def element_set_meta(id : Int64, meta : Void*) : Void
      if @@mb_element_set_meta.null?
        @@mb_element_set_meta = Bridge.get_method_bind("AccessibilityServer", "element_set_meta", 3175752987_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = meta
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_element_set_meta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_element_get_meta : Void* = Pointer(Void).null
    def element_get_meta(id : Int64) : Void*
      if @@mb_element_get_meta.null?
        @@mb_element_get_meta = Bridge.get_method_bind("AccessibilityServer", "element_get_meta", 4171304767_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_element_get_meta, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_window_rect : Void* = Pointer(Void).null
    def set_window_rect(window_id : Int64, rect_out : Rect2, rect_in : Rect2) : Void
      if @@mb_set_window_rect.null?
        @@mb_set_window_rect = Bridge.get_method_bind("AccessibilityServer", "set_window_rect", 2386961724_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect_out
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = rect_in
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_window_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_window_focused : Void* = Pointer(Void).null
    def set_window_focused(window_id : Int64, focused : Bool) : Void
      if @@mb_set_window_focused.null?
        @@mb_set_window_focused = Bridge.get_method_bind("AccessibilityServer", "set_window_focused", 300928843_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = focused
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_window_focused, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_focus : Void* = Pointer(Void).null
    def update_set_focus(id : Int64) : Void
      if @@mb_update_set_focus.null?
        @@mb_update_set_focus = Bridge.get_method_bind("AccessibilityServer", "update_set_focus", 2722037293_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_update_set_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_window_root : Void* = Pointer(Void).null
    def get_window_root(window_id : Int64) : Int64
      if @@mb_get_window_root.null?
        @@mb_get_window_root = Bridge.get_method_bind("AccessibilityServer", "get_window_root", 495598643_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_window_root, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_update_set_role : Void* = Pointer(Void).null
    def update_set_role(id : Int64, role : Int64) : Void
      if @@mb_update_set_role.null?
        @@mb_update_set_role = Bridge.get_method_bind("AccessibilityServer", "update_set_role", 3747886520_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = role
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_role, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_name : Void* = Pointer(Void).null
    def update_set_name(id : Int64, name : String) : Void
      if @@mb_update_set_name.null?
        @@mb_update_set_name = Bridge.get_method_bind("AccessibilityServer", "update_set_name", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_braille_label : Void* = Pointer(Void).null
    def update_set_braille_label(id : Int64, name : String) : Void
      if @@mb_update_set_braille_label.null?
        @@mb_update_set_braille_label = Bridge.get_method_bind("AccessibilityServer", "update_set_braille_label", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_braille_label, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_braille_role_description : Void* = Pointer(Void).null
    def update_set_braille_role_description(id : Int64, description : String) : Void
      if @@mb_update_set_braille_role_description.null?
        @@mb_update_set_braille_role_description = Bridge.get_method_bind("AccessibilityServer", "update_set_braille_role_description", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_braille_role_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_extra_info : Void* = Pointer(Void).null
    def update_set_extra_info(id : Int64, name : String) : Void
      if @@mb_update_set_extra_info.null?
        @@mb_update_set_extra_info = Bridge.get_method_bind("AccessibilityServer", "update_set_extra_info", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_extra_info, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_description : Void* = Pointer(Void).null
    def update_set_description(id : Int64, description : String) : Void
      if @@mb_update_set_description.null?
        @@mb_update_set_description = Bridge.get_method_bind("AccessibilityServer", "update_set_description", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_value : Void* = Pointer(Void).null
    def update_set_value(id : Int64, value : String) : Void
      if @@mb_update_set_value.null?
        @@mb_update_set_value = Bridge.get_method_bind("AccessibilityServer", "update_set_value", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_tooltip : Void* = Pointer(Void).null
    def update_set_tooltip(id : Int64, tooltip : String) : Void
      if @@mb_update_set_tooltip.null?
        @@mb_update_set_tooltip = Bridge.get_method_bind("AccessibilityServer", "update_set_tooltip", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_bounds : Void* = Pointer(Void).null
    def update_set_bounds(id : Int64, rect : Rect2) : Void
      if @@mb_update_set_bounds.null?
        @@mb_update_set_bounds = Bridge.get_method_bind("AccessibilityServer", "update_set_bounds", 1378122625_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_bounds, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_transform : Void* = Pointer(Void).null
    def update_set_transform(id : Int64, transform : Transform2D) : Void
      if @@mb_update_set_transform.null?
        @@mb_update_set_transform = Bridge.get_method_bind("AccessibilityServer", "update_set_transform", 1246044741_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_child : Void* = Pointer(Void).null
    def update_add_child(id : Int64, child_id : Int64) : Void
      if @@mb_update_add_child.null?
        @@mb_update_add_child = Bridge.get_method_bind("AccessibilityServer", "update_add_child", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = child_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_add_child, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_related_controls : Void* = Pointer(Void).null
    def update_add_related_controls(id : Int64, related_id : Int64) : Void
      if @@mb_update_add_related_controls.null?
        @@mb_update_add_related_controls = Bridge.get_method_bind("AccessibilityServer", "update_add_related_controls", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_add_related_controls, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_related_details : Void* = Pointer(Void).null
    def update_add_related_details(id : Int64, related_id : Int64) : Void
      if @@mb_update_add_related_details.null?
        @@mb_update_add_related_details = Bridge.get_method_bind("AccessibilityServer", "update_add_related_details", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_add_related_details, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_related_described_by : Void* = Pointer(Void).null
    def update_add_related_described_by(id : Int64, related_id : Int64) : Void
      if @@mb_update_add_related_described_by.null?
        @@mb_update_add_related_described_by = Bridge.get_method_bind("AccessibilityServer", "update_add_related_described_by", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_add_related_described_by, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_related_flow_to : Void* = Pointer(Void).null
    def update_add_related_flow_to(id : Int64, related_id : Int64) : Void
      if @@mb_update_add_related_flow_to.null?
        @@mb_update_add_related_flow_to = Bridge.get_method_bind("AccessibilityServer", "update_add_related_flow_to", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_add_related_flow_to, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_related_labeled_by : Void* = Pointer(Void).null
    def update_add_related_labeled_by(id : Int64, related_id : Int64) : Void
      if @@mb_update_add_related_labeled_by.null?
        @@mb_update_add_related_labeled_by = Bridge.get_method_bind("AccessibilityServer", "update_add_related_labeled_by", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_add_related_labeled_by, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_related_radio_group : Void* = Pointer(Void).null
    def update_add_related_radio_group(id : Int64, related_id : Int64) : Void
      if @@mb_update_add_related_radio_group.null?
        @@mb_update_add_related_radio_group = Bridge.get_method_bind("AccessibilityServer", "update_add_related_radio_group", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_add_related_radio_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_active_descendant : Void* = Pointer(Void).null
    def update_set_active_descendant(id : Int64, other_id : Int64) : Void
      if @@mb_update_set_active_descendant.null?
        @@mb_update_set_active_descendant = Bridge.get_method_bind("AccessibilityServer", "update_set_active_descendant", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_active_descendant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_next_on_line : Void* = Pointer(Void).null
    def update_set_next_on_line(id : Int64, other_id : Int64) : Void
      if @@mb_update_set_next_on_line.null?
        @@mb_update_set_next_on_line = Bridge.get_method_bind("AccessibilityServer", "update_set_next_on_line", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_next_on_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_previous_on_line : Void* = Pointer(Void).null
    def update_set_previous_on_line(id : Int64, other_id : Int64) : Void
      if @@mb_update_set_previous_on_line.null?
        @@mb_update_set_previous_on_line = Bridge.get_method_bind("AccessibilityServer", "update_set_previous_on_line", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_previous_on_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_member_of : Void* = Pointer(Void).null
    def update_set_member_of(id : Int64, group_id : Int64) : Void
      if @@mb_update_set_member_of.null?
        @@mb_update_set_member_of = Bridge.get_method_bind("AccessibilityServer", "update_set_member_of", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = group_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_member_of, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_in_page_link_target : Void* = Pointer(Void).null
    def update_set_in_page_link_target(id : Int64, other_id : Int64) : Void
      if @@mb_update_set_in_page_link_target.null?
        @@mb_update_set_in_page_link_target = Bridge.get_method_bind("AccessibilityServer", "update_set_in_page_link_target", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_in_page_link_target, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_error_message : Void* = Pointer(Void).null
    def update_set_error_message(id : Int64, other_id : Int64) : Void
      if @@mb_update_set_error_message.null?
        @@mb_update_set_error_message = Bridge.get_method_bind("AccessibilityServer", "update_set_error_message", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_error_message, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_live : Void* = Pointer(Void).null
    def update_set_live(id : Int64, live : Int64) : Void
      if @@mb_update_set_live.null?
        @@mb_update_set_live = Bridge.get_method_bind("AccessibilityServer", "update_set_live", 2993365237_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = live
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_live, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_action : Void* = Pointer(Void).null
    def update_add_action(id : Int64, action : Int64, callable : Void*) : Void
      if @@mb_update_add_action.null?
        @@mb_update_add_action = Bridge.get_method_bind("AccessibilityServer", "update_add_action", 3960092835_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = action
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callable
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_add_action, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_add_custom_action : Void* = Pointer(Void).null
    def update_add_custom_action(id : Int64, action_id : Int64, action_description : String) : Void
      if @@mb_update_add_custom_action.null?
        @@mb_update_add_custom_action = Bridge.get_method_bind("AccessibilityServer", "update_add_custom_action", 4153150897_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = action_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = action_description
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_add_custom_action, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_table_row_count : Void* = Pointer(Void).null
    def update_set_table_row_count(id : Int64, count : Int64) : Void
      if @@mb_update_set_table_row_count.null?
        @@mb_update_set_table_row_count = Bridge.get_method_bind("AccessibilityServer", "update_set_table_row_count", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_table_row_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_table_column_count : Void* = Pointer(Void).null
    def update_set_table_column_count(id : Int64, count : Int64) : Void
      if @@mb_update_set_table_column_count.null?
        @@mb_update_set_table_column_count = Bridge.get_method_bind("AccessibilityServer", "update_set_table_column_count", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_table_column_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_table_row_index : Void* = Pointer(Void).null
    def update_set_table_row_index(id : Int64, index : Int64) : Void
      if @@mb_update_set_table_row_index.null?
        @@mb_update_set_table_row_index = Bridge.get_method_bind("AccessibilityServer", "update_set_table_row_index", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_table_row_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_table_column_index : Void* = Pointer(Void).null
    def update_set_table_column_index(id : Int64, index : Int64) : Void
      if @@mb_update_set_table_column_index.null?
        @@mb_update_set_table_column_index = Bridge.get_method_bind("AccessibilityServer", "update_set_table_column_index", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_table_column_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_table_cell_position : Void* = Pointer(Void).null
    def update_set_table_cell_position(id : Int64, row_index : Int64, column_index : Int64) : Void
      if @@mb_update_set_table_cell_position.null?
        @@mb_update_set_table_cell_position = Bridge.get_method_bind("AccessibilityServer", "update_set_table_cell_position", 4288446313_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = row_index
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = column_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_set_table_cell_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_table_cell_span : Void* = Pointer(Void).null
    def update_set_table_cell_span(id : Int64, row_span : Int64, column_span : Int64) : Void
      if @@mb_update_set_table_cell_span.null?
        @@mb_update_set_table_cell_span = Bridge.get_method_bind("AccessibilityServer", "update_set_table_cell_span", 4288446313_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = row_span
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = column_span
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_set_table_cell_span, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_list_item_count : Void* = Pointer(Void).null
    def update_set_list_item_count(id : Int64, size : Int64) : Void
      if @@mb_update_set_list_item_count.null?
        @@mb_update_set_list_item_count = Bridge.get_method_bind("AccessibilityServer", "update_set_list_item_count", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_list_item_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_list_item_index : Void* = Pointer(Void).null
    def update_set_list_item_index(id : Int64, index : Int64) : Void
      if @@mb_update_set_list_item_index.null?
        @@mb_update_set_list_item_index = Bridge.get_method_bind("AccessibilityServer", "update_set_list_item_index", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_list_item_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_list_item_level : Void* = Pointer(Void).null
    def update_set_list_item_level(id : Int64, level : Int64) : Void
      if @@mb_update_set_list_item_level.null?
        @@mb_update_set_list_item_level = Bridge.get_method_bind("AccessibilityServer", "update_set_list_item_level", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = level
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_list_item_level, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_list_item_selected : Void* = Pointer(Void).null
    def update_set_list_item_selected(id : Int64, selected : Bool) : Void
      if @@mb_update_set_list_item_selected.null?
        @@mb_update_set_list_item_selected = Bridge.get_method_bind("AccessibilityServer", "update_set_list_item_selected", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = selected
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_list_item_selected, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_list_item_expanded : Void* = Pointer(Void).null
    def update_set_list_item_expanded(id : Int64, expanded : Bool) : Void
      if @@mb_update_set_list_item_expanded.null?
        @@mb_update_set_list_item_expanded = Bridge.get_method_bind("AccessibilityServer", "update_set_list_item_expanded", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = expanded
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_list_item_expanded, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_popup_type : Void* = Pointer(Void).null
    def update_set_popup_type(id : Int64, popup : Int64) : Void
      if @@mb_update_set_popup_type.null?
        @@mb_update_set_popup_type = Bridge.get_method_bind("AccessibilityServer", "update_set_popup_type", 690307634_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = popup
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_popup_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_checked : Void* = Pointer(Void).null
    def update_set_checked(id : Int64, checekd : Bool) : Void
      if @@mb_update_set_checked.null?
        @@mb_update_set_checked = Bridge.get_method_bind("AccessibilityServer", "update_set_checked", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = checekd
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_checked, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_num_value : Void* = Pointer(Void).null
    def update_set_num_value(id : Int64, position : Float64) : Void
      if @@mb_update_set_num_value.null?
        @@mb_update_set_num_value = Bridge.get_method_bind("AccessibilityServer", "update_set_num_value", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_num_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_num_range : Void* = Pointer(Void).null
    def update_set_num_range(id : Int64, min : Float64, max : Float64) : Void
      if @@mb_update_set_num_range.null?
        @@mb_update_set_num_range = Bridge.get_method_bind("AccessibilityServer", "update_set_num_range", 2513314492_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_set_num_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_num_step : Void* = Pointer(Void).null
    def update_set_num_step(id : Int64, step : Float64) : Void
      if @@mb_update_set_num_step.null?
        @@mb_update_set_num_step = Bridge.get_method_bind("AccessibilityServer", "update_set_num_step", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = step
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_num_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_num_jump : Void* = Pointer(Void).null
    def update_set_num_jump(id : Int64, jump : Float64) : Void
      if @@mb_update_set_num_jump.null?
        @@mb_update_set_num_jump = Bridge.get_method_bind("AccessibilityServer", "update_set_num_jump", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = jump
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_num_jump, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_scroll_x : Void* = Pointer(Void).null
    def update_set_scroll_x(id : Int64, position : Float64) : Void
      if @@mb_update_set_scroll_x.null?
        @@mb_update_set_scroll_x = Bridge.get_method_bind("AccessibilityServer", "update_set_scroll_x", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_scroll_x, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_scroll_x_range : Void* = Pointer(Void).null
    def update_set_scroll_x_range(id : Int64, min : Float64, max : Float64) : Void
      if @@mb_update_set_scroll_x_range.null?
        @@mb_update_set_scroll_x_range = Bridge.get_method_bind("AccessibilityServer", "update_set_scroll_x_range", 2513314492_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_set_scroll_x_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_scroll_y : Void* = Pointer(Void).null
    def update_set_scroll_y(id : Int64, position : Float64) : Void
      if @@mb_update_set_scroll_y.null?
        @@mb_update_set_scroll_y = Bridge.get_method_bind("AccessibilityServer", "update_set_scroll_y", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_scroll_y, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_scroll_y_range : Void* = Pointer(Void).null
    def update_set_scroll_y_range(id : Int64, min : Float64, max : Float64) : Void
      if @@mb_update_set_scroll_y_range.null?
        @@mb_update_set_scroll_y_range = Bridge.get_method_bind("AccessibilityServer", "update_set_scroll_y_range", 2513314492_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_set_scroll_y_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_text_decorations : Void* = Pointer(Void).null
    def update_set_text_decorations(id : Int64, underline : Bool, strikethrough : Bool, overline : Bool, color : Color) : Void
      if @@mb_update_set_text_decorations.null?
        @@mb_update_set_text_decorations = Bridge.get_method_bind("AccessibilityServer", "update_set_text_decorations", 457503484_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = underline
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = strikethrough
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = overline
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = color
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_update_set_text_decorations, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_text_align : Void* = Pointer(Void).null
    def update_set_text_align(id : Int64, align : Int64) : Void
      if @@mb_update_set_text_align.null?
        @@mb_update_set_text_align = Bridge.get_method_bind("AccessibilityServer", "update_set_text_align", 3725995085_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = align
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_text_align, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_text_selection : Void* = Pointer(Void).null
    def update_set_text_selection(id : Int64, text_start_id : Int64, start_char : Int64, text_end_id : Int64, end_char : Int64) : Void
      if @@mb_update_set_text_selection.null?
        @@mb_update_set_text_selection = Bridge.get_method_bind("AccessibilityServer", "update_set_text_selection", 3119144029_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = text_start_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = start_char
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = text_end_id
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = end_char
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_update_set_text_selection, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_flag : Void* = Pointer(Void).null
    def update_set_flag(id : Int64, flag : Int64, value : Bool) : Void
      if @@mb_update_set_flag.null?
        @@mb_update_set_flag = Bridge.get_method_bind("AccessibilityServer", "update_set_flag", 1473043386_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flag
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_update_set_flag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_classname : Void* = Pointer(Void).null
    def update_set_classname(id : Int64, classname : String) : Void
      if @@mb_update_set_classname.null?
        @@mb_update_set_classname = Bridge.get_method_bind("AccessibilityServer", "update_set_classname", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = classname
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_classname, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_placeholder : Void* = Pointer(Void).null
    def update_set_placeholder(id : Int64, placeholder : String) : Void
      if @@mb_update_set_placeholder.null?
        @@mb_update_set_placeholder = Bridge.get_method_bind("AccessibilityServer", "update_set_placeholder", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = placeholder
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_placeholder, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_language : Void* = Pointer(Void).null
    def update_set_language(id : Int64, language : String) : Void
      if @@mb_update_set_language.null?
        @@mb_update_set_language = Bridge.get_method_bind("AccessibilityServer", "update_set_language", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_text_orientation : Void* = Pointer(Void).null
    def update_set_text_orientation(id : Int64, vertical : Bool) : Void
      if @@mb_update_set_text_orientation.null?
        @@mb_update_set_text_orientation = Bridge.get_method_bind("AccessibilityServer", "update_set_text_orientation", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertical
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_text_orientation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_list_orientation : Void* = Pointer(Void).null
    def update_set_list_orientation(id : Int64, vertical : Bool) : Void
      if @@mb_update_set_list_orientation.null?
        @@mb_update_set_list_orientation = Bridge.get_method_bind("AccessibilityServer", "update_set_list_orientation", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertical
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_list_orientation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_shortcut : Void* = Pointer(Void).null
    def update_set_shortcut(id : Int64, shortcut : String) : Void
      if @@mb_update_set_shortcut.null?
        @@mb_update_set_shortcut = Bridge.get_method_bind("AccessibilityServer", "update_set_shortcut", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shortcut
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_shortcut, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_url : Void* = Pointer(Void).null
    def update_set_url(id : Int64, url : String) : Void
      if @@mb_update_set_url.null?
        @@mb_update_set_url = Bridge.get_method_bind("AccessibilityServer", "update_set_url", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = url
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_url, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_role_description : Void* = Pointer(Void).null
    def update_set_role_description(id : Int64, description : String) : Void
      if @@mb_update_set_role_description.null?
        @@mb_update_set_role_description = Bridge.get_method_bind("AccessibilityServer", "update_set_role_description", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_role_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_state_description : Void* = Pointer(Void).null
    def update_set_state_description(id : Int64, description : String) : Void
      if @@mb_update_set_state_description.null?
        @@mb_update_set_state_description = Bridge.get_method_bind("AccessibilityServer", "update_set_state_description", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_state_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_color_value : Void* = Pointer(Void).null
    def update_set_color_value(id : Int64, color : Color) : Void
      if @@mb_update_set_color_value.null?
        @@mb_update_set_color_value = Bridge.get_method_bind("AccessibilityServer", "update_set_color_value", 2948539648_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_color_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_background_color : Void* = Pointer(Void).null
    def update_set_background_color(id : Int64, color : Color) : Void
      if @@mb_update_set_background_color.null?
        @@mb_update_set_background_color = Bridge.get_method_bind("AccessibilityServer", "update_set_background_color", 2948539648_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_background_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_update_set_foreground_color : Void* = Pointer(Void).null
    def update_set_foreground_color(id : Int64, color : Color) : Void
      if @@mb_update_set_foreground_color.null?
        @@mb_update_set_foreground_color = Bridge.get_method_bind("AccessibilityServer", "update_set_foreground_color", 2948539648_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_update_set_foreground_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class AudioServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum SpeakerMode : Int64
      SpeakerModeStereo = 0_i64
      SpeakerSurround31 = 1_i64
      SpeakerSurround51 = 2_i64
      SpeakerSurround71 = 3_i64
    end
    enum PlaybackType : Int64
      PlaybackTypeDefault = 0_i64
      PlaybackTypeStream = 1_i64
      PlaybackTypeSample = 2_i64
      PlaybackTypeMax = 3_i64
    end
    @@mb_set_bus_count : Void* = Pointer(Void).null
    def set_bus_count(amount : Int64) : Void
      if @@mb_set_bus_count.null?
        @@mb_set_bus_count = Bridge.get_method_bind("AudioServer", "set_bus_count", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bus_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus_count : Void* = Pointer(Void).null
    def get_bus_count() : Int64
      if @@mb_get_bus_count.null?
        @@mb_get_bus_count = Bridge.get_method_bind("AudioServer", "get_bus_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bus_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_bus : Void* = Pointer(Void).null
    def remove_bus(index : Int64) : Void
      if @@mb_remove_bus.null?
        @@mb_remove_bus = Bridge.get_method_bind("AudioServer", "remove_bus", 1286410249_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_bus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_bus : Void* = Pointer(Void).null
    def add_bus(at_position : Int64) : Void
      if @@mb_add_bus.null?
        @@mb_add_bus = Bridge.get_method_bind("AudioServer", "add_bus", 1025054187_i64)
      end
      val_0 = at_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_bus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_move_bus : Void* = Pointer(Void).null
    def move_bus(index : Int64, to_index : Int64) : Void
      if @@mb_move_bus.null?
        @@mb_move_bus = Bridge.get_method_bind("AudioServer", "move_bus", 3937882851_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_bus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_bus_name : Void* = Pointer(Void).null
    def set_bus_name(bus_idx : Int64, name : String) : Void
      if @@mb_set_bus_name.null?
        @@mb_set_bus_name = Bridge.get_method_bind("AudioServer", "set_bus_name", 501894301_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bus_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus_name : Void* = Pointer(Void).null
    def get_bus_name(bus_idx : Int64) : String
      if @@mb_get_bus_name.null?
        @@mb_get_bus_name = Bridge.get_method_bind("AudioServer", "get_bus_name", 844755477_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_bus_index : Void* = Pointer(Void).null
    def get_bus_index(bus_name : String) : Int64
      if @@mb_get_bus_index.null?
        @@mb_get_bus_index = Bridge.get_method_bind("AudioServer", "get_bus_index", 2458036349_i64)
      end
      val_0 = bus_name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bus_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_bus_channels : Void* = Pointer(Void).null
    def get_bus_channels(bus_idx : Int64) : Int64
      if @@mb_get_bus_channels.null?
        @@mb_get_bus_channels = Bridge.get_method_bind("AudioServer", "get_bus_channels", 923996154_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bus_channels, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bus_volume_db : Void* = Pointer(Void).null
    def set_bus_volume_db(bus_idx : Int64, volume_db : Float64) : Void
      if @@mb_set_bus_volume_db.null?
        @@mb_set_bus_volume_db = Bridge.get_method_bind("AudioServer", "set_bus_volume_db", 1602489585_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = volume_db
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bus_volume_db, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus_volume_db : Void* = Pointer(Void).null
    def get_bus_volume_db(bus_idx : Int64) : Float64
      if @@mb_get_bus_volume_db.null?
        @@mb_get_bus_volume_db = Bridge.get_method_bind("AudioServer", "get_bus_volume_db", 2339986948_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bus_volume_db, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bus_volume_linear : Void* = Pointer(Void).null
    def set_bus_volume_linear(bus_idx : Int64, volume_linear : Float64) : Void
      if @@mb_set_bus_volume_linear.null?
        @@mb_set_bus_volume_linear = Bridge.get_method_bind("AudioServer", "set_bus_volume_linear", 1602489585_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = volume_linear
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bus_volume_linear, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus_volume_linear : Void* = Pointer(Void).null
    def get_bus_volume_linear(bus_idx : Int64) : Float64
      if @@mb_get_bus_volume_linear.null?
        @@mb_get_bus_volume_linear = Bridge.get_method_bind("AudioServer", "get_bus_volume_linear", 2339986948_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bus_volume_linear, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bus_send : Void* = Pointer(Void).null
    def set_bus_send(bus_idx : Int64, send : String) : Void
      if @@mb_set_bus_send.null?
        @@mb_set_bus_send = Bridge.get_method_bind("AudioServer", "set_bus_send", 3780747571_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = send
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bus_send, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus_send : Void* = Pointer(Void).null
    def get_bus_send(bus_idx : Int64) : String
      if @@mb_get_bus_send.null?
        @@mb_get_bus_send = Bridge.get_method_bind("AudioServer", "get_bus_send", 659327637_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_set_bus_solo : Void* = Pointer(Void).null
    def set_bus_solo(bus_idx : Int64, enable : Bool) : Void
      if @@mb_set_bus_solo.null?
        @@mb_set_bus_solo = Bridge.get_method_bind("AudioServer", "set_bus_solo", 300928843_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bus_solo, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_bus_solo : Void* = Pointer(Void).null
    def is_bus_solo(bus_idx : Int64) : Bool
      if @@mb_is_bus_solo.null?
        @@mb_is_bus_solo = Bridge.get_method_bind("AudioServer", "is_bus_solo", 1116898809_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_bus_solo, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_bus_mute : Void* = Pointer(Void).null
    def set_bus_mute(bus_idx : Int64, enable : Bool) : Void
      if @@mb_set_bus_mute.null?
        @@mb_set_bus_mute = Bridge.get_method_bind("AudioServer", "set_bus_mute", 300928843_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bus_mute, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_bus_mute : Void* = Pointer(Void).null
    def is_bus_mute(bus_idx : Int64) : Bool
      if @@mb_is_bus_mute.null?
        @@mb_is_bus_mute = Bridge.get_method_bind("AudioServer", "is_bus_mute", 1116898809_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_bus_mute, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_bus_bypass_effects : Void* = Pointer(Void).null
    def set_bus_bypass_effects(bus_idx : Int64, enable : Bool) : Void
      if @@mb_set_bus_bypass_effects.null?
        @@mb_set_bus_bypass_effects = Bridge.get_method_bind("AudioServer", "set_bus_bypass_effects", 300928843_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bus_bypass_effects, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_bus_bypassing_effects : Void* = Pointer(Void).null
    def is_bus_bypassing_effects(bus_idx : Int64) : Bool
      if @@mb_is_bus_bypassing_effects.null?
        @@mb_is_bus_bypassing_effects = Bridge.get_method_bind("AudioServer", "is_bus_bypassing_effects", 1116898809_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_bus_bypassing_effects, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_add_bus_effect : Void* = Pointer(Void).null
    def add_bus_effect(bus_idx : Int64, effect : AudioEffect, at_position : Int64) : Void
      if @@mb_add_bus_effect.null?
        @@mb_add_bus_effect = Bridge.get_method_bind("AudioServer", "add_bus_effect", 4068819785_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = at_position
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_bus_effect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_bus_effect : Void* = Pointer(Void).null
    def remove_bus_effect(bus_idx : Int64, effect_idx : Int64) : Void
      if @@mb_remove_bus_effect.null?
        @@mb_remove_bus_effect = Bridge.get_method_bind("AudioServer", "remove_bus_effect", 3937882851_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effect_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_remove_bus_effect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus_effect_count : Void* = Pointer(Void).null
    def get_bus_effect_count(bus_idx : Int64) : Int64
      if @@mb_get_bus_effect_count.null?
        @@mb_get_bus_effect_count = Bridge.get_method_bind("AudioServer", "get_bus_effect_count", 3744713108_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bus_effect_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_bus_effect : Void* = Pointer(Void).null
    def get_bus_effect(bus_idx : Int64, effect_idx : Int64) : AudioEffect
      if @@mb_get_bus_effect.null?
        @@mb_get_bus_effect = Bridge.get_method_bind("AudioServer", "get_bus_effect", 726064442_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effect_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bus_effect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      AudioEffect.new(ret_ptr)
    end
    @@mb_get_bus_effect_instance : Void* = Pointer(Void).null
    def get_bus_effect_instance(bus_idx : Int64, effect_idx : Int64, channel : Int64) : AudioEffectInstance
      if @@mb_get_bus_effect_instance.null?
        @@mb_get_bus_effect_instance = Bridge.get_method_bind("AudioServer", "get_bus_effect_instance", 1829771234_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effect_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = channel
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bus_effect_instance, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      AudioEffectInstance.new(ret_ptr)
    end
    @@mb_swap_bus_effects : Void* = Pointer(Void).null
    def swap_bus_effects(bus_idx : Int64, effect_idx : Int64, by_effect_idx : Int64) : Void
      if @@mb_swap_bus_effects.null?
        @@mb_swap_bus_effects = Bridge.get_method_bind("AudioServer", "swap_bus_effects", 1649997291_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effect_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = by_effect_idx
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_swap_bus_effects, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_bus_effect_enabled : Void* = Pointer(Void).null
    def set_bus_effect_enabled(bus_idx : Int64, effect_idx : Int64, enabled : Bool) : Void
      if @@mb_set_bus_effect_enabled.null?
        @@mb_set_bus_effect_enabled = Bridge.get_method_bind("AudioServer", "set_bus_effect_enabled", 1383440665_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effect_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = enabled
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_set_bus_effect_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_bus_effect_enabled : Void* = Pointer(Void).null
    def is_bus_effect_enabled(bus_idx : Int64, effect_idx : Int64) : Bool
      if @@mb_is_bus_effect_enabled.null?
        @@mb_is_bus_effect_enabled = Bridge.get_method_bind("AudioServer", "is_bus_effect_enabled", 2522259332_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effect_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_bus_effect_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_bus_peak_volume_left_db : Void* = Pointer(Void).null
    def get_bus_peak_volume_left_db(bus_idx : Int64, channel : Int64) : Float64
      if @@mb_get_bus_peak_volume_left_db.null?
        @@mb_get_bus_peak_volume_left_db = Bridge.get_method_bind("AudioServer", "get_bus_peak_volume_left_db", 3085491603_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = channel
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bus_peak_volume_left_db, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_bus_peak_volume_right_db : Void* = Pointer(Void).null
    def get_bus_peak_volume_right_db(bus_idx : Int64, channel : Int64) : Float64
      if @@mb_get_bus_peak_volume_right_db.null?
        @@mb_get_bus_peak_volume_right_db = Bridge.get_method_bind("AudioServer", "get_bus_peak_volume_right_db", 3085491603_i64)
      end
      val_0 = bus_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = channel
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bus_peak_volume_right_db, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_playback_speed_scale : Void* = Pointer(Void).null
    def set_playback_speed_scale(scale : Float64) : Void
      if @@mb_set_playback_speed_scale.null?
        @@mb_set_playback_speed_scale = Bridge.get_method_bind("AudioServer", "set_playback_speed_scale", 373806689_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_playback_speed_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_playback_speed_scale : Void* = Pointer(Void).null
    def get_playback_speed_scale() : Float64
      if @@mb_get_playback_speed_scale.null?
        @@mb_get_playback_speed_scale = Bridge.get_method_bind("AudioServer", "get_playback_speed_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_playback_speed_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_lock : Void* = Pointer(Void).null
    def lock() : Void
      if @@mb_lock.null?
        @@mb_lock = Bridge.get_method_bind("AudioServer", "lock", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_lock, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_unlock : Void* = Pointer(Void).null
    def unlock() : Void
      if @@mb_unlock.null?
        @@mb_unlock = Bridge.get_method_bind("AudioServer", "unlock", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_unlock, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_speaker_mode : Void* = Pointer(Void).null
    def get_speaker_mode() : Int64
      if @@mb_get_speaker_mode.null?
        @@mb_get_speaker_mode = Bridge.get_method_bind("AudioServer", "get_speaker_mode", 2549190337_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_speaker_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_mix_rate : Void* = Pointer(Void).null
    def get_mix_rate() : Float64
      if @@mb_get_mix_rate.null?
        @@mb_get_mix_rate = Bridge.get_method_bind("AudioServer", "get_mix_rate", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_mix_rate, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_input_mix_rate : Void* = Pointer(Void).null
    def get_input_mix_rate() : Float64
      if @@mb_get_input_mix_rate.null?
        @@mb_get_input_mix_rate = Bridge.get_method_bind("AudioServer", "get_input_mix_rate", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_input_mix_rate, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_driver_name : Void* = Pointer(Void).null
    def get_driver_name() : String
      if @@mb_get_driver_name.null?
        @@mb_get_driver_name = Bridge.get_method_bind("AudioServer", "get_driver_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_output_device_list : Void* = Pointer(Void).null
    def get_output_device_list() : Void*
      if @@mb_get_output_device_list.null?
        @@mb_get_output_device_list = Bridge.get_method_bind("AudioServer", "get_output_device_list", 2981934095_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_output_device_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_output_device : Void* = Pointer(Void).null
    def get_output_device() : String
      if @@mb_get_output_device.null?
        @@mb_get_output_device = Bridge.get_method_bind("AudioServer", "get_output_device", 2841200299_i64)
      end
      ""
    end
    @@mb_set_output_device : Void* = Pointer(Void).null
    def set_output_device(name : String) : Void
      if @@mb_set_output_device.null?
        @@mb_set_output_device = Bridge.get_method_bind("AudioServer", "set_output_device", 83702148_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_output_device, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_time_to_next_mix : Void* = Pointer(Void).null
    def get_time_to_next_mix() : Float64
      if @@mb_get_time_to_next_mix.null?
        @@mb_get_time_to_next_mix = Bridge.get_method_bind("AudioServer", "get_time_to_next_mix", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_time_to_next_mix, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_time_since_last_mix : Void* = Pointer(Void).null
    def get_time_since_last_mix() : Float64
      if @@mb_get_time_since_last_mix.null?
        @@mb_get_time_since_last_mix = Bridge.get_method_bind("AudioServer", "get_time_since_last_mix", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_time_since_last_mix, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_output_latency : Void* = Pointer(Void).null
    def get_output_latency() : Float64
      if @@mb_get_output_latency.null?
        @@mb_get_output_latency = Bridge.get_method_bind("AudioServer", "get_output_latency", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_output_latency, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_input_device_list : Void* = Pointer(Void).null
    def get_input_device_list() : Void*
      if @@mb_get_input_device_list.null?
        @@mb_get_input_device_list = Bridge.get_method_bind("AudioServer", "get_input_device_list", 2981934095_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_input_device_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_input_device : Void* = Pointer(Void).null
    def get_input_device() : String
      if @@mb_get_input_device.null?
        @@mb_get_input_device = Bridge.get_method_bind("AudioServer", "get_input_device", 2841200299_i64)
      end
      ""
    end
    @@mb_set_input_device : Void* = Pointer(Void).null
    def set_input_device(name : String) : Void
      if @@mb_set_input_device.null?
        @@mb_set_input_device = Bridge.get_method_bind("AudioServer", "set_input_device", 83702148_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_input_device, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_input_device_active : Void* = Pointer(Void).null
    def set_input_device_active(active : Bool) : Int64
      if @@mb_set_input_device_active.null?
        @@mb_set_input_device_active = Bridge.get_method_bind("AudioServer", "set_input_device_active", 1413768114_i64)
      end
      val_0 = active
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_set_input_device_active, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_input_frames_available : Void* = Pointer(Void).null
    def get_input_frames_available() : Int64
      if @@mb_get_input_frames_available.null?
        @@mb_get_input_frames_available = Bridge.get_method_bind("AudioServer", "get_input_frames_available", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_input_frames_available, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_input_buffer_length_frames : Void* = Pointer(Void).null
    def get_input_buffer_length_frames() : Int64
      if @@mb_get_input_buffer_length_frames.null?
        @@mb_get_input_buffer_length_frames = Bridge.get_method_bind("AudioServer", "get_input_buffer_length_frames", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_input_buffer_length_frames, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_input_frames : Void* = Pointer(Void).null
    def get_input_frames(frames : Int64) : Void*
      if @@mb_get_input_frames.null?
        @@mb_get_input_frames = Bridge.get_method_bind("AudioServer", "get_input_frames", 2649534757_i64)
      end
      val_0 = frames
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_input_frames, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_bus_layout : Void* = Pointer(Void).null
    def set_bus_layout(bus_layout : AudioBusLayout) : Void
      if @@mb_set_bus_layout.null?
        @@mb_set_bus_layout = Bridge.get_method_bind("AudioServer", "set_bus_layout", 3319058824_i64)
      end
      val_0 = bus_layout
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bus_layout, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_generate_bus_layout : Void* = Pointer(Void).null
    def generate_bus_layout() : AudioBusLayout
      if @@mb_generate_bus_layout.null?
        @@mb_generate_bus_layout = Bridge.get_method_bind("AudioServer", "generate_bus_layout", 3769973890_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_generate_bus_layout, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      AudioBusLayout.new(ret_ptr)
    end
    @@mb_set_enable_tagging_used_audio_streams : Void* = Pointer(Void).null
    def set_enable_tagging_used_audio_streams(enable : Bool) : Void
      if @@mb_set_enable_tagging_used_audio_streams.null?
        @@mb_set_enable_tagging_used_audio_streams = Bridge.get_method_bind("AudioServer", "set_enable_tagging_used_audio_streams", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_tagging_used_audio_streams, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_stream_registered_as_sample : Void* = Pointer(Void).null
    def is_stream_registered_as_sample(stream : AudioStream) : Bool
      if @@mb_is_stream_registered_as_sample.null?
        @@mb_is_stream_registered_as_sample = Bridge.get_method_bind("AudioServer", "is_stream_registered_as_sample", 500225754_i64)
      end
      val_0 = stream
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_stream_registered_as_sample, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_register_stream_as_sample : Void* = Pointer(Void).null
    def register_stream_as_sample(stream : AudioStream) : Void
      if @@mb_register_stream_as_sample.null?
        @@mb_register_stream_as_sample = Bridge.get_method_bind("AudioServer", "register_stream_as_sample", 2210767741_i64)
      end
      val_0 = stream
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_register_stream_as_sample, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class CameraServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum FeedImage : Int64
      FeedRgbaImage = 0_i64
      FeedYcbcrImage = 0_i64
      FeedYImage = 0_i64
      FeedCbcrImage = 1_i64
    end
    @@mb_set_monitoring_feeds : Void* = Pointer(Void).null
    def set_monitoring_feeds(is_monitoring_feeds : Bool) : Void
      if @@mb_set_monitoring_feeds.null?
        @@mb_set_monitoring_feeds = Bridge.get_method_bind("CameraServer", "set_monitoring_feeds", 2586408642_i64)
      end
      val_0 = is_monitoring_feeds
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_monitoring_feeds, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_monitoring_feeds : Void* = Pointer(Void).null
    def is_monitoring_feeds() : Bool
      if @@mb_is_monitoring_feeds.null?
        @@mb_is_monitoring_feeds = Bridge.get_method_bind("CameraServer", "is_monitoring_feeds", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_monitoring_feeds, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_feed : Void* = Pointer(Void).null
    def get_feed(index : Int64) : CameraFeed
      if @@mb_get_feed.null?
        @@mb_get_feed = Bridge.get_method_bind("CameraServer", "get_feed", 361927068_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_feed, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      CameraFeed.new(ret_ptr)
    end
    @@mb_get_feed_count : Void* = Pointer(Void).null
    def get_feed_count() : Int64
      if @@mb_get_feed_count.null?
        @@mb_get_feed_count = Bridge.get_method_bind("CameraServer", "get_feed_count", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_feed_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_feeds : Void* = Pointer(Void).null
    def feeds() : Godot::Array
      if @@mb_feeds.null?
        @@mb_feeds = Bridge.get_method_bind("CameraServer", "feeds", 2915620761_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_feeds, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_add_feed : Void* = Pointer(Void).null
    def add_feed(feed : CameraFeed) : Void
      if @@mb_add_feed.null?
        @@mb_add_feed = Bridge.get_method_bind("CameraServer", "add_feed", 3204782488_i64)
      end
      val_0 = feed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_feed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_feed : Void* = Pointer(Void).null
    def remove_feed(feed : CameraFeed) : Void
      if @@mb_remove_feed.null?
        @@mb_remove_feed = Bridge.get_method_bind("CameraServer", "remove_feed", 3204782488_i64)
      end
      val_0 = feed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_feed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class DTLSServer < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_setup : Void* = Pointer(Void).null
    def setup(server_options : TLSOptions) : Int64
      if @@mb_setup.null?
        @@mb_setup = Bridge.get_method_bind("DTLSServer", "setup", 1262296096_i64)
      end
      val_0 = server_options
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_setup, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_take_connection : Void* = Pointer(Void).null
    def take_connection(udp_peer : PacketPeerUDP) : PacketPeerDTLS
      if @@mb_take_connection.null?
        @@mb_take_connection = Bridge.get_method_bind("DTLSServer", "take_connection", 3946580474_i64)
      end
      val_0 = udp_peer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_take_connection, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      PacketPeerDTLS.new(ret_ptr)
    end
  end
  class DisplayServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Feature : Int64
      FeatureGlobalMenu = 0_i64
      FeatureSubwindows = 1_i64
      FeatureTouchscreen = 2_i64
      FeatureMouse = 3_i64
      FeatureMouseWarp = 4_i64
      FeatureClipboard = 5_i64
      FeatureVirtualKeyboard = 6_i64
      FeatureCursorShape = 7_i64
      FeatureCustomCursorShape = 8_i64
      FeatureNativeDialog = 9_i64
      FeatureIme = 10_i64
      FeatureWindowTransparency = 11_i64
      FeatureHidpi = 12_i64
      FeatureIcon = 13_i64
      FeatureNativeIcon = 14_i64
      FeatureOrientation = 15_i64
      FeatureSwapBuffers = 16_i64
      FeatureClipboardPrimary = 18_i64
      FeatureTextToSpeech = 19_i64
      FeatureExtendToTitle = 20_i64
      FeatureScreenCapture = 21_i64
      FeatureStatusIndicator = 22_i64
      FeatureNativeHelp = 23_i64
      FeatureNativeDialogInput = 24_i64
      FeatureNativeDialogFile = 25_i64
      FeatureNativeDialogFileExtra = 26_i64
      FeatureWindowDrag = 27_i64
      FeatureScreenExcludeFromCapture = 28_i64
      FeatureWindowEmbedding = 29_i64
      FeatureNativeDialogFileMime = 30_i64
      FeatureEmojiAndSymbolPicker = 31_i64
      FeatureNativeColorPicker = 32_i64
      FeatureSelfFittingWindows = 33_i64
      FeatureAccessibilityScreenReader = 34_i64
      FeatureHdrOutput = 35_i64
      FeaturePipMode = 36_i64
    end
    enum AccessibilityRole : Int64
      RoleUnknown = 0_i64
      RoleDefaultButton = 1_i64
      RoleAudio = 2_i64
      RoleVideo = 3_i64
      RoleStaticText = 4_i64
      RoleContainer = 5_i64
      RolePanel = 6_i64
      RoleButton = 7_i64
      RoleLink = 8_i64
      RoleCheckBox = 9_i64
      RoleRadioButton = 10_i64
      RoleCheckButton = 11_i64
      RoleScrollBar = 12_i64
      RoleScrollView = 13_i64
      RoleSplitter = 14_i64
      RoleSlider = 15_i64
      RoleSpinButton = 16_i64
      RoleProgressIndicator = 17_i64
      RoleTextField = 18_i64
      RoleMultilineTextField = 19_i64
      RoleColorPicker = 20_i64
      RoleTable = 21_i64
      RoleCell = 22_i64
      RoleRow = 23_i64
      RoleRowGroup = 24_i64
      RoleRowHeader = 25_i64
      RoleColumnHeader = 26_i64
      RoleTree = 27_i64
      RoleTreeItem = 28_i64
      RoleList = 29_i64
      RoleListItem = 30_i64
      RoleListBox = 31_i64
      RoleListBoxOption = 32_i64
      RoleTabBar = 33_i64
      RoleTab = 34_i64
      RoleTabPanel = 35_i64
      RoleMenuBar = 36_i64
      RoleMenu = 37_i64
      RoleMenuItem = 38_i64
      RoleMenuItemCheckBox = 39_i64
      RoleMenuItemRadio = 40_i64
      RoleImage = 41_i64
      RoleWindow = 42_i64
      RoleTitleBar = 43_i64
      RoleDialog = 44_i64
      RoleTooltip = 45_i64
      RoleRegion = 46_i64
      RoleTextRun = 47_i64
    end
    enum AccessibilityPopupType : Int64
      PopupMenu = 0_i64
      PopupList = 1_i64
      PopupTree = 2_i64
      PopupDialog = 3_i64
    end
    enum AccessibilityFlags : Int64
      FlagHidden = 0_i64
      FlagMultiselectable = 1_i64
      FlagRequired = 2_i64
      FlagVisited = 3_i64
      FlagBusy = 4_i64
      FlagModal = 5_i64
      FlagTouchPassthrough = 6_i64
      FlagReadonly = 7_i64
      FlagDisabled = 8_i64
      FlagClipsChildren = 9_i64
    end
    enum AccessibilityAction : Int64
      ActionClick = 0_i64
      ActionFocus = 1_i64
      ActionBlur = 2_i64
      ActionCollapse = 3_i64
      ActionExpand = 4_i64
      ActionDecrement = 5_i64
      ActionIncrement = 6_i64
      ActionHideTooltip = 7_i64
      ActionShowTooltip = 8_i64
      ActionSetTextSelection = 9_i64
      ActionReplaceSelectedText = 10_i64
      ActionScrollBackward = 11_i64
      ActionScrollDown = 12_i64
      ActionScrollForward = 13_i64
      ActionScrollLeft = 14_i64
      ActionScrollRight = 15_i64
      ActionScrollUp = 16_i64
      ActionScrollIntoView = 17_i64
      ActionScrollToPoint = 18_i64
      ActionSetScrollOffset = 19_i64
      ActionSetValue = 20_i64
      ActionShowContextMenu = 21_i64
      ActionCustom = 22_i64
    end
    enum AccessibilityLiveMode : Int64
      LiveOff = 0_i64
      LivePolite = 1_i64
      LiveAssertive = 2_i64
    end
    enum AccessibilityScrollUnit : Int64
      ScrollUnitItem = 0_i64
      ScrollUnitPage = 1_i64
    end
    enum AccessibilityScrollHint : Int64
      ScrollHintTopLeft = 0_i64
      ScrollHintBottomRight = 1_i64
      ScrollHintTopEdge = 2_i64
      ScrollHintBottomEdge = 3_i64
      ScrollHintLeftEdge = 4_i64
      ScrollHintRightEdge = 5_i64
    end
    enum MouseMode : Int64
      MouseModeVisible = 0_i64
      MouseModeHidden = 1_i64
      MouseModeCaptured = 2_i64
      MouseModeConfined = 3_i64
      MouseModeConfinedHidden = 4_i64
      MouseModeMax = 5_i64
    end
    enum ScreenOrientation : Int64
      ScreenLandscape = 0_i64
      ScreenPortrait = 1_i64
      ScreenReverseLandscape = 2_i64
      ScreenReversePortrait = 3_i64
      ScreenSensorLandscape = 4_i64
      ScreenSensorPortrait = 5_i64
      ScreenSensor = 6_i64
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
      CursorMax = 17_i64
    end
    enum FileDialogMode : Int64
      FileDialogModeOpenFile = 0_i64
      FileDialogModeOpenFiles = 1_i64
      FileDialogModeOpenDir = 2_i64
      FileDialogModeOpenAny = 3_i64
      FileDialogModeSaveFile = 4_i64
    end
    enum WindowMode : Int64
      WindowModeWindowed = 0_i64
      WindowModeMinimized = 1_i64
      WindowModeMaximized = 2_i64
      WindowModeFullscreen = 3_i64
      WindowModeExclusiveFullscreen = 4_i64
    end
    enum ProgressState : Int64
      ProgressStateNoprogress = 0_i64
      ProgressStateIndeterminate = 1_i64
      ProgressStateNormal = 2_i64
      ProgressStateError = 3_i64
      ProgressStatePaused = 4_i64
    end
    enum WindowFlags : Int64
      WindowFlagResizeDisabled = 0_i64
      WindowFlagBorderless = 1_i64
      WindowFlagAlwaysOnTop = 2_i64
      WindowFlagTransparent = 3_i64
      WindowFlagNoFocus = 4_i64
      WindowFlagPopup = 5_i64
      WindowFlagExtendToTitle = 6_i64
      WindowFlagMousePassthrough = 7_i64
      WindowFlagSharpCorners = 8_i64
      WindowFlagExcludeFromCapture = 9_i64
      WindowFlagPopupWmHint = 10_i64
      WindowFlagMinimizeDisabled = 11_i64
      WindowFlagMaximizeDisabled = 12_i64
      WindowFlagMax = 13_i64
    end
    enum WindowEvent : Int64
      WindowEventMouseEnter = 0_i64
      WindowEventMouseExit = 1_i64
      WindowEventFocusIn = 2_i64
      WindowEventFocusOut = 3_i64
      WindowEventCloseRequest = 4_i64
      WindowEventGoBackRequest = 5_i64
      WindowEventDpiChange = 6_i64
      WindowEventTitlebarChange = 7_i64
      WindowEventForceClose = 8_i64
      WindowEventOutputMaxLinearValueChanged = 9_i64
    end
    enum WindowResizeEdge : Int64
      WindowEdgeTopLeft = 0_i64
      WindowEdgeTop = 1_i64
      WindowEdgeTopRight = 2_i64
      WindowEdgeLeft = 3_i64
      WindowEdgeRight = 4_i64
      WindowEdgeBottomLeft = 5_i64
      WindowEdgeBottom = 6_i64
      WindowEdgeBottomRight = 7_i64
      WindowEdgeMax = 8_i64
    end
    enum NotificationStatus : Int64
      NotificationActivated = 0_i64
      NotificationDismissed = 1_i64
      NotificationFailed = 2_i64
    end
    enum VSyncMode : Int64
      VsyncDisabled = 0_i64
      VsyncEnabled = 1_i64
      VsyncAdaptive = 2_i64
      VsyncMailbox = 3_i64
    end
    enum HandleType : Int64
      DisplayHandle = 0_i64
      WindowHandle = 1_i64
      WindowView = 2_i64
      OpenglContext = 3_i64
      EglDisplay = 4_i64
      EglConfig = 5_i64
      GlxVisualid = 6_i64
      GlxFbconfig = 7_i64
    end
    enum TTSUtteranceEvent : Int64
      TtsUtteranceStarted = 0_i64
      TtsUtteranceEnded = 1_i64
      TtsUtteranceCanceled = 2_i64
      TtsUtteranceBoundary = 3_i64
    end
    @@mb_has_feature : Void* = Pointer(Void).null
    def has_feature(feature : Int64) : Bool
      if @@mb_has_feature.null?
        @@mb_has_feature = Bridge.get_method_bind("DisplayServer", "has_feature", 334065950_i64)
      end
      val_0 = feature
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_feature, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_name : Void* = Pointer(Void).null
    def get_name() : String
      if @@mb_get_name.null?
        @@mb_get_name = Bridge.get_method_bind("DisplayServer", "get_name", 201670096_i64)
      end
      ""
    end
    @@mb_help_set_search_callbacks : Void* = Pointer(Void).null
    def help_set_search_callbacks(search_callback : Void*, action_callback : Void*) : Void
      if @@mb_help_set_search_callbacks.null?
        @@mb_help_set_search_callbacks = Bridge.get_method_bind("DisplayServer", "help_set_search_callbacks", 1687350599_i64)
      end
      val_0 = search_callback
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = action_callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_help_set_search_callbacks, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_popup_callbacks : Void* = Pointer(Void).null
    def global_menu_set_popup_callbacks(menu_root : String, open_callback : Void*, close_callback : Void*) : Void
      if @@mb_global_menu_set_popup_callbacks.null?
        @@mb_global_menu_set_popup_callbacks = Bridge.get_method_bind("DisplayServer", "global_menu_set_popup_callbacks", 3893727526_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = open_callback
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = close_callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_popup_callbacks, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_add_submenu_item : Void* = Pointer(Void).null
    def global_menu_add_submenu_item(menu_root : String, label : String, submenu : String, index : Int64) : Int64
      if @@mb_global_menu_add_submenu_item.null?
        @@mb_global_menu_add_submenu_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_submenu_item", 2828985934_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = label
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = submenu
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = index
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_submenu_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_item : Void* = Pointer(Void).null
    def global_menu_add_item(menu_root : String, label : String, callback : Void*, key_callback : Void*, tag : Void*, accelerator : Int64, index : Int64) : Int64
      if @@mb_global_menu_add_item.null?
        @@mb_global_menu_add_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_item", 3616842746_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = label
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = key_callback
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = tag
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = accelerator
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = index
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_check_item : Void* = Pointer(Void).null
    def global_menu_add_check_item(menu_root : String, label : String, callback : Void*, key_callback : Void*, tag : Void*, accelerator : Int64, index : Int64) : Int64
      if @@mb_global_menu_add_check_item.null?
        @@mb_global_menu_add_check_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_check_item", 3616842746_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = label
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = key_callback
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = tag
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = accelerator
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = index
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_check_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_icon_item : Void* = Pointer(Void).null
    def global_menu_add_icon_item(menu_root : String, icon : Texture2D, label : String, callback : Void*, key_callback : Void*, tag : Void*, accelerator : Int64, index : Int64) : Int64
      if @@mb_global_menu_add_icon_item.null?
        @@mb_global_menu_add_icon_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_icon_item", 3867083847_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = label
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = callback
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = key_callback
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = tag
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = accelerator
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = index
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_icon_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_icon_check_item : Void* = Pointer(Void).null
    def global_menu_add_icon_check_item(menu_root : String, icon : Texture2D, label : String, callback : Void*, key_callback : Void*, tag : Void*, accelerator : Int64, index : Int64) : Int64
      if @@mb_global_menu_add_icon_check_item.null?
        @@mb_global_menu_add_icon_check_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_icon_check_item", 3867083847_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = label
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = callback
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = key_callback
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = tag
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = accelerator
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = index
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_icon_check_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_radio_check_item : Void* = Pointer(Void).null
    def global_menu_add_radio_check_item(menu_root : String, label : String, callback : Void*, key_callback : Void*, tag : Void*, accelerator : Int64, index : Int64) : Int64
      if @@mb_global_menu_add_radio_check_item.null?
        @@mb_global_menu_add_radio_check_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_radio_check_item", 3616842746_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = label
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = key_callback
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = tag
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = accelerator
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = index
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_radio_check_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_icon_radio_check_item : Void* = Pointer(Void).null
    def global_menu_add_icon_radio_check_item(menu_root : String, icon : Texture2D, label : String, callback : Void*, key_callback : Void*, tag : Void*, accelerator : Int64, index : Int64) : Int64
      if @@mb_global_menu_add_icon_radio_check_item.null?
        @@mb_global_menu_add_icon_radio_check_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_icon_radio_check_item", 3867083847_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = label
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = callback
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = key_callback
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = tag
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = accelerator
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = index
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_icon_radio_check_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_multistate_item : Void* = Pointer(Void).null
    def global_menu_add_multistate_item(menu_root : String, label : String, max_states : Int64, default_state : Int64, callback : Void*, key_callback : Void*, tag : Void*, accelerator : Int64, index : Int64) : Int64
      if @@mb_global_menu_add_multistate_item.null?
        @@mb_global_menu_add_multistate_item = Bridge.get_method_bind("DisplayServer", "global_menu_add_multistate_item", 3297554655_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = label
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max_states
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = default_state
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = callback
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = key_callback
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = tag
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = accelerator
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = index
      arg_8 = pointerof(val_8).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_multistate_item, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_add_separator : Void* = Pointer(Void).null
    def global_menu_add_separator(menu_root : String, index : Int64) : Int64
      if @@mb_global_menu_add_separator.null?
        @@mb_global_menu_add_separator = Bridge.get_method_bind("DisplayServer", "global_menu_add_separator", 3214812433_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_add_separator, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_get_item_index_from_text : Void* = Pointer(Void).null
    def global_menu_get_item_index_from_text(menu_root : String, text : String) : Int64
      if @@mb_global_menu_get_item_index_from_text.null?
        @@mb_global_menu_get_item_index_from_text = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_index_from_text", 2878152881_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = text
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_get_item_index_from_text, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_get_item_index_from_tag : Void* = Pointer(Void).null
    def global_menu_get_item_index_from_tag(menu_root : String, tag : Void*) : Int64
      if @@mb_global_menu_get_item_index_from_tag.null?
        @@mb_global_menu_get_item_index_from_tag = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_index_from_tag", 2941063483_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tag
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_get_item_index_from_tag, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_is_item_checked : Void* = Pointer(Void).null
    def global_menu_is_item_checked(menu_root : String, idx : Int64) : Bool
      if @@mb_global_menu_is_item_checked.null?
        @@mb_global_menu_is_item_checked = Bridge.get_method_bind("DisplayServer", "global_menu_is_item_checked", 3511468594_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_global_menu_is_item_checked, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_global_menu_is_item_checkable : Void* = Pointer(Void).null
    def global_menu_is_item_checkable(menu_root : String, idx : Int64) : Bool
      if @@mb_global_menu_is_item_checkable.null?
        @@mb_global_menu_is_item_checkable = Bridge.get_method_bind("DisplayServer", "global_menu_is_item_checkable", 3511468594_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_global_menu_is_item_checkable, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_global_menu_is_item_radio_checkable : Void* = Pointer(Void).null
    def global_menu_is_item_radio_checkable(menu_root : String, idx : Int64) : Bool
      if @@mb_global_menu_is_item_radio_checkable.null?
        @@mb_global_menu_is_item_radio_checkable = Bridge.get_method_bind("DisplayServer", "global_menu_is_item_radio_checkable", 3511468594_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_global_menu_is_item_radio_checkable, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_global_menu_get_item_callback : Void* = Pointer(Void).null
    def global_menu_get_item_callback(menu_root : String, idx : Int64) : Void*
      if @@mb_global_menu_get_item_callback.null?
        @@mb_global_menu_get_item_callback = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_callback", 748666903_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_global_menu_get_item_callback, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_global_menu_get_item_key_callback : Void* = Pointer(Void).null
    def global_menu_get_item_key_callback(menu_root : String, idx : Int64) : Void*
      if @@mb_global_menu_get_item_key_callback.null?
        @@mb_global_menu_get_item_key_callback = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_key_callback", 748666903_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_global_menu_get_item_key_callback, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_global_menu_get_item_tag : Void* = Pointer(Void).null
    def global_menu_get_item_tag(menu_root : String, idx : Int64) : Void*
      if @@mb_global_menu_get_item_tag.null?
        @@mb_global_menu_get_item_tag = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_tag", 330672633_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_global_menu_get_item_tag, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_global_menu_get_item_text : Void* = Pointer(Void).null
    def global_menu_get_item_text(menu_root : String, idx : Int64) : String
      if @@mb_global_menu_get_item_text.null?
        @@mb_global_menu_get_item_text = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_text", 591067909_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_global_menu_get_item_submenu : Void* = Pointer(Void).null
    def global_menu_get_item_submenu(menu_root : String, idx : Int64) : String
      if @@mb_global_menu_get_item_submenu.null?
        @@mb_global_menu_get_item_submenu = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_submenu", 591067909_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_global_menu_get_item_accelerator : Void* = Pointer(Void).null
    def global_menu_get_item_accelerator(menu_root : String, idx : Int64) : Int64
      if @@mb_global_menu_get_item_accelerator.null?
        @@mb_global_menu_get_item_accelerator = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_accelerator", 936065394_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_get_item_accelerator, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_is_item_disabled : Void* = Pointer(Void).null
    def global_menu_is_item_disabled(menu_root : String, idx : Int64) : Bool
      if @@mb_global_menu_is_item_disabled.null?
        @@mb_global_menu_is_item_disabled = Bridge.get_method_bind("DisplayServer", "global_menu_is_item_disabled", 3511468594_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_global_menu_is_item_disabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_global_menu_is_item_hidden : Void* = Pointer(Void).null
    def global_menu_is_item_hidden(menu_root : String, idx : Int64) : Bool
      if @@mb_global_menu_is_item_hidden.null?
        @@mb_global_menu_is_item_hidden = Bridge.get_method_bind("DisplayServer", "global_menu_is_item_hidden", 3511468594_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_global_menu_is_item_hidden, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_global_menu_get_item_tooltip : Void* = Pointer(Void).null
    def global_menu_get_item_tooltip(menu_root : String, idx : Int64) : String
      if @@mb_global_menu_get_item_tooltip.null?
        @@mb_global_menu_get_item_tooltip = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_tooltip", 591067909_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_global_menu_get_item_state : Void* = Pointer(Void).null
    def global_menu_get_item_state(menu_root : String, idx : Int64) : Int64
      if @@mb_global_menu_get_item_state.null?
        @@mb_global_menu_get_item_state = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_state", 3422818498_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_get_item_state, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_get_item_max_states : Void* = Pointer(Void).null
    def global_menu_get_item_max_states(menu_root : String, idx : Int64) : Int64
      if @@mb_global_menu_get_item_max_states.null?
        @@mb_global_menu_get_item_max_states = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_max_states", 3422818498_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_get_item_max_states, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_get_item_icon : Void* = Pointer(Void).null
    def global_menu_get_item_icon(menu_root : String, idx : Int64) : Texture2D
      if @@mb_global_menu_get_item_icon.null?
        @@mb_global_menu_get_item_icon = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_icon", 3591713183_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_global_menu_get_item_icon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_global_menu_get_item_indentation_level : Void* = Pointer(Void).null
    def global_menu_get_item_indentation_level(menu_root : String, idx : Int64) : Int64
      if @@mb_global_menu_get_item_indentation_level.null?
        @@mb_global_menu_get_item_indentation_level = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_indentation_level", 3422818498_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_get_item_indentation_level, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_set_item_checked : Void* = Pointer(Void).null
    def global_menu_set_item_checked(menu_root : String, idx : Int64, checked : Bool) : Void
      if @@mb_global_menu_set_item_checked.null?
        @@mb_global_menu_set_item_checked = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_checked", 4108344793_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = checked
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_checked, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_checkable : Void* = Pointer(Void).null
    def global_menu_set_item_checkable(menu_root : String, idx : Int64, checkable : Bool) : Void
      if @@mb_global_menu_set_item_checkable.null?
        @@mb_global_menu_set_item_checkable = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_checkable", 4108344793_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = checkable
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_checkable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_radio_checkable : Void* = Pointer(Void).null
    def global_menu_set_item_radio_checkable(menu_root : String, idx : Int64, checkable : Bool) : Void
      if @@mb_global_menu_set_item_radio_checkable.null?
        @@mb_global_menu_set_item_radio_checkable = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_radio_checkable", 4108344793_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = checkable
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_radio_checkable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_callback : Void* = Pointer(Void).null
    def global_menu_set_item_callback(menu_root : String, idx : Int64, callback : Void*) : Void
      if @@mb_global_menu_set_item_callback.null?
        @@mb_global_menu_set_item_callback = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_callback", 3809915389_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_hover_callbacks : Void* = Pointer(Void).null
    def global_menu_set_item_hover_callbacks(menu_root : String, idx : Int64, callback : Void*) : Void
      if @@mb_global_menu_set_item_hover_callbacks.null?
        @@mb_global_menu_set_item_hover_callbacks = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_hover_callbacks", 3809915389_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_hover_callbacks, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_key_callback : Void* = Pointer(Void).null
    def global_menu_set_item_key_callback(menu_root : String, idx : Int64, key_callback : Void*) : Void
      if @@mb_global_menu_set_item_key_callback.null?
        @@mb_global_menu_set_item_key_callback = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_key_callback", 3809915389_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = key_callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_key_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_tag : Void* = Pointer(Void).null
    def global_menu_set_item_tag(menu_root : String, idx : Int64, tag : Void*) : Void
      if @@mb_global_menu_set_item_tag.null?
        @@mb_global_menu_set_item_tag = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_tag", 453659863_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = tag
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_tag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_text : Void* = Pointer(Void).null
    def global_menu_set_item_text(menu_root : String, idx : Int64, text : String) : Void
      if @@mb_global_menu_set_item_text.null?
        @@mb_global_menu_set_item_text = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_text", 965966136_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = text
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_text, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_submenu : Void* = Pointer(Void).null
    def global_menu_set_item_submenu(menu_root : String, idx : Int64, submenu : String) : Void
      if @@mb_global_menu_set_item_submenu.null?
        @@mb_global_menu_set_item_submenu = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_submenu", 965966136_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = submenu
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_submenu, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_accelerator : Void* = Pointer(Void).null
    def global_menu_set_item_accelerator(menu_root : String, idx : Int64, keycode : Int64) : Void
      if @@mb_global_menu_set_item_accelerator.null?
        @@mb_global_menu_set_item_accelerator = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_accelerator", 566943293_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = keycode
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_accelerator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_disabled : Void* = Pointer(Void).null
    def global_menu_set_item_disabled(menu_root : String, idx : Int64, disabled : Bool) : Void
      if @@mb_global_menu_set_item_disabled.null?
        @@mb_global_menu_set_item_disabled = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_disabled", 4108344793_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = disabled
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_hidden : Void* = Pointer(Void).null
    def global_menu_set_item_hidden(menu_root : String, idx : Int64, hidden : Bool) : Void
      if @@mb_global_menu_set_item_hidden.null?
        @@mb_global_menu_set_item_hidden = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_hidden", 4108344793_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = hidden
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_hidden, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_tooltip : Void* = Pointer(Void).null
    def global_menu_set_item_tooltip(menu_root : String, idx : Int64, tooltip : String) : Void
      if @@mb_global_menu_set_item_tooltip.null?
        @@mb_global_menu_set_item_tooltip = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_tooltip", 965966136_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = tooltip
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_state : Void* = Pointer(Void).null
    def global_menu_set_item_state(menu_root : String, idx : Int64, state : Int64) : Void
      if @@mb_global_menu_set_item_state.null?
        @@mb_global_menu_set_item_state = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_state", 3474840532_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = state
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_state, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_max_states : Void* = Pointer(Void).null
    def global_menu_set_item_max_states(menu_root : String, idx : Int64, max_states : Int64) : Void
      if @@mb_global_menu_set_item_max_states.null?
        @@mb_global_menu_set_item_max_states = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_max_states", 3474840532_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max_states
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_max_states, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_icon : Void* = Pointer(Void).null
    def global_menu_set_item_icon(menu_root : String, idx : Int64, icon : Texture2D) : Void
      if @@mb_global_menu_set_item_icon.null?
        @@mb_global_menu_set_item_icon = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_icon", 3201338066_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = icon
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_set_item_indentation_level : Void* = Pointer(Void).null
    def global_menu_set_item_indentation_level(menu_root : String, idx : Int64, level : Int64) : Void
      if @@mb_global_menu_set_item_indentation_level.null?
        @@mb_global_menu_set_item_indentation_level = Bridge.get_method_bind("DisplayServer", "global_menu_set_item_indentation_level", 3474840532_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = level
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_menu_set_item_indentation_level, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_get_item_count : Void* = Pointer(Void).null
    def global_menu_get_item_count(menu_root : String) : Int64
      if @@mb_global_menu_get_item_count.null?
        @@mb_global_menu_get_item_count = Bridge.get_method_bind("DisplayServer", "global_menu_get_item_count", 1321353865_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_menu_get_item_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_global_menu_remove_item : Void* = Pointer(Void).null
    def global_menu_remove_item(menu_root : String, idx : Int64) : Void
      if @@mb_global_menu_remove_item.null?
        @@mb_global_menu_remove_item = Bridge.get_method_bind("DisplayServer", "global_menu_remove_item", 2956805083_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_global_menu_remove_item, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_clear : Void* = Pointer(Void).null
    def global_menu_clear(menu_root : String) : Void
      if @@mb_global_menu_clear.null?
        @@mb_global_menu_clear = Bridge.get_method_bind("DisplayServer", "global_menu_clear", 83702148_i64)
      end
      val_0 = menu_root
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_global_menu_clear, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_menu_get_system_menu_roots : Void* = Pointer(Void).null
    def global_menu_get_system_menu_roots() : Void*
      if @@mb_global_menu_get_system_menu_roots.null?
        @@mb_global_menu_get_system_menu_roots = Bridge.get_method_bind("DisplayServer", "global_menu_get_system_menu_roots", 3102165223_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_global_menu_get_system_menu_roots, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_tts_is_speaking : Void* = Pointer(Void).null
    def tts_is_speaking() : Bool
      if @@mb_tts_is_speaking.null?
        @@mb_tts_is_speaking = Bridge.get_method_bind("DisplayServer", "tts_is_speaking", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_tts_is_speaking, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_tts_is_paused : Void* = Pointer(Void).null
    def tts_is_paused() : Bool
      if @@mb_tts_is_paused.null?
        @@mb_tts_is_paused = Bridge.get_method_bind("DisplayServer", "tts_is_paused", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_tts_is_paused, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_tts_get_voices : Void* = Pointer(Void).null
    def tts_get_voices() : Godot::Array
      if @@mb_tts_get_voices.null?
        @@mb_tts_get_voices = Bridge.get_method_bind("DisplayServer", "tts_get_voices", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_tts_get_voices, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_tts_get_voices_for_language : Void* = Pointer(Void).null
    def tts_get_voices_for_language(language : String) : Void*
      if @@mb_tts_get_voices_for_language.null?
        @@mb_tts_get_voices_for_language = Bridge.get_method_bind("DisplayServer", "tts_get_voices_for_language", 4291131558_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_tts_get_voices_for_language, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_tts_speak : Void* = Pointer(Void).null
    def tts_speak(text : String, voice : String, volume : Int64, pitch : Float64, rate : Float64, utterance_id : Int64, interrupt : Bool) : Void
      if @@mb_tts_speak.null?
        @@mb_tts_speak = Bridge.get_method_bind("DisplayServer", "tts_speak", 903992738_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = voice
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = volume
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = pitch
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = rate
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = utterance_id
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = interrupt
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      Bridge.ptrcall(@@mb_tts_speak, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_tts_pause : Void* = Pointer(Void).null
    def tts_pause() : Void
      if @@mb_tts_pause.null?
        @@mb_tts_pause = Bridge.get_method_bind("DisplayServer", "tts_pause", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_tts_pause, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_tts_resume : Void* = Pointer(Void).null
    def tts_resume() : Void
      if @@mb_tts_resume.null?
        @@mb_tts_resume = Bridge.get_method_bind("DisplayServer", "tts_resume", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_tts_resume, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_tts_stop : Void* = Pointer(Void).null
    def tts_stop() : Void
      if @@mb_tts_stop.null?
        @@mb_tts_stop = Bridge.get_method_bind("DisplayServer", "tts_stop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_tts_stop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_tts_set_utterance_callback : Void* = Pointer(Void).null
    def tts_set_utterance_callback(event : Int64, callable : Void*) : Void
      if @@mb_tts_set_utterance_callback.null?
        @@mb_tts_set_utterance_callback = Bridge.get_method_bind("DisplayServer", "tts_set_utterance_callback", 109679083_i64)
      end
      val_0 = event
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_tts_set_utterance_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_dark_mode_supported : Void* = Pointer(Void).null
    def is_dark_mode_supported() : Bool
      if @@mb_is_dark_mode_supported.null?
        @@mb_is_dark_mode_supported = Bridge.get_method_bind("DisplayServer", "is_dark_mode_supported", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_dark_mode_supported, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_dark_mode : Void* = Pointer(Void).null
    def is_dark_mode() : Bool
      if @@mb_is_dark_mode.null?
        @@mb_is_dark_mode = Bridge.get_method_bind("DisplayServer", "is_dark_mode", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_dark_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_accent_color : Void* = Pointer(Void).null
    def get_accent_color() : Color
      if @@mb_get_accent_color.null?
        @@mb_get_accent_color = Bridge.get_method_bind("DisplayServer", "get_accent_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_accent_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_base_color : Void* = Pointer(Void).null
    def get_base_color() : Color
      if @@mb_get_base_color.null?
        @@mb_get_base_color = Bridge.get_method_bind("DisplayServer", "get_base_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_base_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_system_theme_change_callback : Void* = Pointer(Void).null
    def set_system_theme_change_callback(callable : Void*) : Void
      if @@mb_set_system_theme_change_callback.null?
        @@mb_set_system_theme_change_callback = Bridge.get_method_bind("DisplayServer", "set_system_theme_change_callback", 1611583062_i64)
      end
      val_0 = callable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_system_theme_change_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mouse_set_mode : Void* = Pointer(Void).null
    def mouse_set_mode(mouse_mode : Int64) : Void
      if @@mb_mouse_set_mode.null?
        @@mb_mouse_set_mode = Bridge.get_method_bind("DisplayServer", "mouse_set_mode", 348288463_i64)
      end
      val_0 = mouse_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_mouse_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mouse_get_mode : Void* = Pointer(Void).null
    def mouse_get_mode() : Int64
      if @@mb_mouse_get_mode.null?
        @@mb_mouse_get_mode = Bridge.get_method_bind("DisplayServer", "mouse_get_mode", 1353961651_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_mouse_get_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_warp_mouse : Void* = Pointer(Void).null
    def warp_mouse(position : Vector2i) : Void
      if @@mb_warp_mouse.null?
        @@mb_warp_mouse = Bridge.get_method_bind("DisplayServer", "warp_mouse", 1130785943_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_warp_mouse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mouse_get_position : Void* = Pointer(Void).null
    def mouse_get_position() : Vector2i
      if @@mb_mouse_get_position.null?
        @@mb_mouse_get_position = Bridge.get_method_bind("DisplayServer", "mouse_get_position", 3690982128_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_mouse_get_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_mouse_get_button_state : Void* = Pointer(Void).null
    def mouse_get_button_state() : Int64
      if @@mb_mouse_get_button_state.null?
        @@mb_mouse_get_button_state = Bridge.get_method_bind("DisplayServer", "mouse_get_button_state", 2512161324_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_mouse_get_button_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_clipboard_set : Void* = Pointer(Void).null
    def clipboard_set(clipboard : String) : Void
      if @@mb_clipboard_set.null?
        @@mb_clipboard_set = Bridge.get_method_bind("DisplayServer", "clipboard_set", 83702148_i64)
      end
      val_0 = clipboard
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_clipboard_set, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clipboard_get : Void* = Pointer(Void).null
    def clipboard_get() : String
      if @@mb_clipboard_get.null?
        @@mb_clipboard_get = Bridge.get_method_bind("DisplayServer", "clipboard_get", 201670096_i64)
      end
      ""
    end
    @@mb_clipboard_get_image : Void* = Pointer(Void).null
    def clipboard_get_image() : Image
      if @@mb_clipboard_get_image.null?
        @@mb_clipboard_get_image = Bridge.get_method_bind("DisplayServer", "clipboard_get_image", 4190603485_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_clipboard_get_image, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_clipboard_has : Void* = Pointer(Void).null
    def clipboard_has() : Bool
      if @@mb_clipboard_has.null?
        @@mb_clipboard_has = Bridge.get_method_bind("DisplayServer", "clipboard_has", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_clipboard_has, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_clipboard_has_image : Void* = Pointer(Void).null
    def clipboard_has_image() : Bool
      if @@mb_clipboard_has_image.null?
        @@mb_clipboard_has_image = Bridge.get_method_bind("DisplayServer", "clipboard_has_image", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_clipboard_has_image, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_clipboard_set_primary : Void* = Pointer(Void).null
    def clipboard_set_primary(clipboard_primary : String) : Void
      if @@mb_clipboard_set_primary.null?
        @@mb_clipboard_set_primary = Bridge.get_method_bind("DisplayServer", "clipboard_set_primary", 83702148_i64)
      end
      val_0 = clipboard_primary
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_clipboard_set_primary, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clipboard_get_primary : Void* = Pointer(Void).null
    def clipboard_get_primary() : String
      if @@mb_clipboard_get_primary.null?
        @@mb_clipboard_get_primary = Bridge.get_method_bind("DisplayServer", "clipboard_get_primary", 201670096_i64)
      end
      ""
    end
    @@mb_get_display_cutouts : Void* = Pointer(Void).null
    def get_display_cutouts(screen : Int64) : Godot::Array
      if @@mb_get_display_cutouts.null?
        @@mb_get_display_cutouts = Bridge.get_method_bind("DisplayServer", "get_display_cutouts", 1388654637_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_display_cutouts, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_display_safe_area : Void* = Pointer(Void).null
    def get_display_safe_area(screen : Int64) : Rect2i
      if @@mb_get_display_safe_area.null?
        @@mb_get_display_safe_area = Bridge.get_method_bind("DisplayServer", "get_display_safe_area", 2439012528_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_display_safe_area, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2i.new(ret_ptr)
    end
    @@mb_get_screen_count : Void* = Pointer(Void).null
    def get_screen_count() : Int64
      if @@mb_get_screen_count.null?
        @@mb_get_screen_count = Bridge.get_method_bind("DisplayServer", "get_screen_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_screen_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_primary_screen : Void* = Pointer(Void).null
    def get_primary_screen() : Int64
      if @@mb_get_primary_screen.null?
        @@mb_get_primary_screen = Bridge.get_method_bind("DisplayServer", "get_primary_screen", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_primary_screen, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_keyboard_focus_screen : Void* = Pointer(Void).null
    def get_keyboard_focus_screen() : Int64
      if @@mb_get_keyboard_focus_screen.null?
        @@mb_get_keyboard_focus_screen = Bridge.get_method_bind("DisplayServer", "get_keyboard_focus_screen", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_keyboard_focus_screen, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_screen_from_rect : Void* = Pointer(Void).null
    def get_screen_from_rect(rect : Rect2) : Int64
      if @@mb_get_screen_from_rect.null?
        @@mb_get_screen_from_rect = Bridge.get_method_bind("DisplayServer", "get_screen_from_rect", 741354659_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_screen_from_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_screen_get_position : Void* = Pointer(Void).null
    def screen_get_position(screen : Int64) : Vector2i
      if @@mb_screen_get_position.null?
        @@mb_screen_get_position = Bridge.get_method_bind("DisplayServer", "screen_get_position", 1725937825_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_screen_get_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_screen_get_size : Void* = Pointer(Void).null
    def screen_get_size(screen : Int64) : Vector2i
      if @@mb_screen_get_size.null?
        @@mb_screen_get_size = Bridge.get_method_bind("DisplayServer", "screen_get_size", 1725937825_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_screen_get_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_screen_get_usable_rect : Void* = Pointer(Void).null
    def screen_get_usable_rect(screen : Int64) : Rect2i
      if @@mb_screen_get_usable_rect.null?
        @@mb_screen_get_usable_rect = Bridge.get_method_bind("DisplayServer", "screen_get_usable_rect", 2439012528_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_screen_get_usable_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2i.new(ret_ptr)
    end
    @@mb_screen_get_dpi : Void* = Pointer(Void).null
    def screen_get_dpi(screen : Int64) : Int64
      if @@mb_screen_get_dpi.null?
        @@mb_screen_get_dpi = Bridge.get_method_bind("DisplayServer", "screen_get_dpi", 181039630_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_screen_get_dpi, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_screen_get_scale : Void* = Pointer(Void).null
    def screen_get_scale(screen : Int64) : Float64
      if @@mb_screen_get_scale.null?
        @@mb_screen_get_scale = Bridge.get_method_bind("DisplayServer", "screen_get_scale", 909105437_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_screen_get_scale, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_touchscreen_available : Void* = Pointer(Void).null
    def is_touchscreen_available() : Bool
      if @@mb_is_touchscreen_available.null?
        @@mb_is_touchscreen_available = Bridge.get_method_bind("DisplayServer", "is_touchscreen_available", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_touchscreen_available, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_screen_get_max_scale : Void* = Pointer(Void).null
    def screen_get_max_scale() : Float64
      if @@mb_screen_get_max_scale.null?
        @@mb_screen_get_max_scale = Bridge.get_method_bind("DisplayServer", "screen_get_max_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_screen_get_max_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_screen_get_refresh_rate : Void* = Pointer(Void).null
    def screen_get_refresh_rate(screen : Int64) : Float64
      if @@mb_screen_get_refresh_rate.null?
        @@mb_screen_get_refresh_rate = Bridge.get_method_bind("DisplayServer", "screen_get_refresh_rate", 909105437_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_screen_get_refresh_rate, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_screen_get_pixel : Void* = Pointer(Void).null
    def screen_get_pixel(position : Vector2i) : Color
      if @@mb_screen_get_pixel.null?
        @@mb_screen_get_pixel = Bridge.get_method_bind("DisplayServer", "screen_get_pixel", 1532707496_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Color.new
      Bridge.ptrcall(@@mb_screen_get_pixel, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_screen_get_image : Void* = Pointer(Void).null
    def screen_get_image(screen : Int64) : Image
      if @@mb_screen_get_image.null?
        @@mb_screen_get_image = Bridge.get_method_bind("DisplayServer", "screen_get_image", 3813388802_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_screen_get_image, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_screen_get_image_rect : Void* = Pointer(Void).null
    def screen_get_image_rect(rect : Rect2i) : Image
      if @@mb_screen_get_image_rect.null?
        @@mb_screen_get_image_rect = Bridge.get_method_bind("DisplayServer", "screen_get_image_rect", 2601441065_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_screen_get_image_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_screen_set_orientation : Void* = Pointer(Void).null
    def screen_set_orientation(orientation : Int64, screen : Int64) : Void
      if @@mb_screen_set_orientation.null?
        @@mb_screen_set_orientation = Bridge.get_method_bind("DisplayServer", "screen_set_orientation", 2211511631_i64)
      end
      val_0 = orientation
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = screen
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_screen_set_orientation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_screen_get_orientation : Void* = Pointer(Void).null
    def screen_get_orientation(screen : Int64) : Int64
      if @@mb_screen_get_orientation.null?
        @@mb_screen_get_orientation = Bridge.get_method_bind("DisplayServer", "screen_get_orientation", 133818562_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_screen_get_orientation, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_screen_set_keep_on : Void* = Pointer(Void).null
    def screen_set_keep_on(enable : Bool) : Void
      if @@mb_screen_set_keep_on.null?
        @@mb_screen_set_keep_on = Bridge.get_method_bind("DisplayServer", "screen_set_keep_on", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_screen_set_keep_on, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_screen_is_kept_on : Void* = Pointer(Void).null
    def screen_is_kept_on() : Bool
      if @@mb_screen_is_kept_on.null?
        @@mb_screen_is_kept_on = Bridge.get_method_bind("DisplayServer", "screen_is_kept_on", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_screen_is_kept_on, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_window_list : Void* = Pointer(Void).null
    def get_window_list() : Void*
      if @@mb_get_window_list.null?
        @@mb_get_window_list = Bridge.get_method_bind("DisplayServer", "get_window_list", 1930428628_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_window_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_window_at_screen_position : Void* = Pointer(Void).null
    def get_window_at_screen_position(position : Vector2i) : Int64
      if @@mb_get_window_at_screen_position.null?
        @@mb_get_window_at_screen_position = Bridge.get_method_bind("DisplayServer", "get_window_at_screen_position", 2485466453_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_window_at_screen_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_get_native_handle : Void* = Pointer(Void).null
    def window_get_native_handle(handle_type : Int64, window_id : Int64) : Int64
      if @@mb_window_get_native_handle.null?
        @@mb_window_get_native_handle = Bridge.get_method_bind("DisplayServer", "window_get_native_handle", 1096425680_i64)
      end
      val_0 = handle_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_window_get_native_handle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_get_active_popup : Void* = Pointer(Void).null
    def window_get_active_popup() : Int64
      if @@mb_window_get_active_popup.null?
        @@mb_window_get_active_popup = Bridge.get_method_bind("DisplayServer", "window_get_active_popup", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_window_get_active_popup, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_set_popup_safe_rect : Void* = Pointer(Void).null
    def window_set_popup_safe_rect(window : Int64, rect : Rect2i) : Void
      if @@mb_window_set_popup_safe_rect.null?
        @@mb_window_set_popup_safe_rect = Bridge.get_method_bind("DisplayServer", "window_set_popup_safe_rect", 3317281434_i64)
      end
      val_0 = window
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_popup_safe_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_popup_safe_rect : Void* = Pointer(Void).null
    def window_get_popup_safe_rect(window : Int64) : Rect2i
      if @@mb_window_get_popup_safe_rect.null?
        @@mb_window_get_popup_safe_rect = Bridge.get_method_bind("DisplayServer", "window_get_popup_safe_rect", 2161169500_i64)
      end
      val_0 = window
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_popup_safe_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2i.new(ret_ptr)
    end
    @@mb_window_set_title : Void* = Pointer(Void).null
    def window_set_title(title : String, window_id : Int64) : Void
      if @@mb_window_set_title.null?
        @@mb_window_set_title = Bridge.get_method_bind("DisplayServer", "window_set_title", 441246282_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_title, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_title_size : Void* = Pointer(Void).null
    def window_get_title_size(title : String, window_id : Int64) : Vector2i
      if @@mb_window_get_title_size.null?
        @@mb_window_get_title_size = Bridge.get_method_bind("DisplayServer", "window_get_title_size", 2925301799_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_title_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_window_set_mouse_passthrough : Void* = Pointer(Void).null
    def window_set_mouse_passthrough(region : Void*, window_id : Int64) : Void
      if @@mb_window_set_mouse_passthrough.null?
        @@mb_window_set_mouse_passthrough = Bridge.get_method_bind("DisplayServer", "window_set_mouse_passthrough", 1993637420_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_mouse_passthrough, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_current_screen : Void* = Pointer(Void).null
    def window_get_current_screen(window_id : Int64) : Int64
      if @@mb_window_get_current_screen.null?
        @@mb_window_get_current_screen = Bridge.get_method_bind("DisplayServer", "window_get_current_screen", 1591665591_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_window_get_current_screen, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_set_current_screen : Void* = Pointer(Void).null
    def window_set_current_screen(screen : Int64, window_id : Int64) : Void
      if @@mb_window_set_current_screen.null?
        @@mb_window_set_current_screen = Bridge.get_method_bind("DisplayServer", "window_set_current_screen", 2230941749_i64)
      end
      val_0 = screen
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_current_screen, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_position : Void* = Pointer(Void).null
    def window_get_position(window_id : Int64) : Vector2i
      if @@mb_window_get_position.null?
        @@mb_window_get_position = Bridge.get_method_bind("DisplayServer", "window_get_position", 763922886_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_window_get_position_with_decorations : Void* = Pointer(Void).null
    def window_get_position_with_decorations(window_id : Int64) : Vector2i
      if @@mb_window_get_position_with_decorations.null?
        @@mb_window_get_position_with_decorations = Bridge.get_method_bind("DisplayServer", "window_get_position_with_decorations", 763922886_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_position_with_decorations, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_window_set_position : Void* = Pointer(Void).null
    def window_set_position(position : Vector2i, window_id : Int64) : Void
      if @@mb_window_set_position.null?
        @@mb_window_set_position = Bridge.get_method_bind("DisplayServer", "window_set_position", 2019273902_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_size : Void* = Pointer(Void).null
    def window_get_size(window_id : Int64) : Vector2i
      if @@mb_window_get_size.null?
        @@mb_window_get_size = Bridge.get_method_bind("DisplayServer", "window_get_size", 763922886_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_window_set_size : Void* = Pointer(Void).null
    def window_set_size(size : Vector2i, window_id : Int64) : Void
      if @@mb_window_set_size.null?
        @@mb_window_set_size = Bridge.get_method_bind("DisplayServer", "window_set_size", 2019273902_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_rect_changed_callback : Void* = Pointer(Void).null
    def window_set_rect_changed_callback(callback : Void*, window_id : Int64) : Void
      if @@mb_window_set_rect_changed_callback.null?
        @@mb_window_set_rect_changed_callback = Bridge.get_method_bind("DisplayServer", "window_set_rect_changed_callback", 1091192925_i64)
      end
      val_0 = callback
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_rect_changed_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_window_event_callback : Void* = Pointer(Void).null
    def window_set_window_event_callback(callback : Void*, window_id : Int64) : Void
      if @@mb_window_set_window_event_callback.null?
        @@mb_window_set_window_event_callback = Bridge.get_method_bind("DisplayServer", "window_set_window_event_callback", 1091192925_i64)
      end
      val_0 = callback
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_window_event_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_input_event_callback : Void* = Pointer(Void).null
    def window_set_input_event_callback(callback : Void*, window_id : Int64) : Void
      if @@mb_window_set_input_event_callback.null?
        @@mb_window_set_input_event_callback = Bridge.get_method_bind("DisplayServer", "window_set_input_event_callback", 1091192925_i64)
      end
      val_0 = callback
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_input_event_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_input_text_callback : Void* = Pointer(Void).null
    def window_set_input_text_callback(callback : Void*, window_id : Int64) : Void
      if @@mb_window_set_input_text_callback.null?
        @@mb_window_set_input_text_callback = Bridge.get_method_bind("DisplayServer", "window_set_input_text_callback", 1091192925_i64)
      end
      val_0 = callback
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_input_text_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_drop_files_callback : Void* = Pointer(Void).null
    def window_set_drop_files_callback(callback : Void*, window_id : Int64) : Void
      if @@mb_window_set_drop_files_callback.null?
        @@mb_window_set_drop_files_callback = Bridge.get_method_bind("DisplayServer", "window_set_drop_files_callback", 1091192925_i64)
      end
      val_0 = callback
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_drop_files_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_attached_instance_id : Void* = Pointer(Void).null
    def window_get_attached_instance_id(window_id : Int64) : Int64
      if @@mb_window_get_attached_instance_id.null?
        @@mb_window_get_attached_instance_id = Bridge.get_method_bind("DisplayServer", "window_get_attached_instance_id", 1591665591_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_window_get_attached_instance_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_get_max_size : Void* = Pointer(Void).null
    def window_get_max_size(window_id : Int64) : Vector2i
      if @@mb_window_get_max_size.null?
        @@mb_window_get_max_size = Bridge.get_method_bind("DisplayServer", "window_get_max_size", 763922886_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_max_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_window_set_max_size : Void* = Pointer(Void).null
    def window_set_max_size(max_size : Vector2i, window_id : Int64) : Void
      if @@mb_window_set_max_size.null?
        @@mb_window_set_max_size = Bridge.get_method_bind("DisplayServer", "window_set_max_size", 2019273902_i64)
      end
      val_0 = max_size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_max_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_min_size : Void* = Pointer(Void).null
    def window_get_min_size(window_id : Int64) : Vector2i
      if @@mb_window_get_min_size.null?
        @@mb_window_get_min_size = Bridge.get_method_bind("DisplayServer", "window_get_min_size", 763922886_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_min_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_window_set_min_size : Void* = Pointer(Void).null
    def window_set_min_size(min_size : Vector2i, window_id : Int64) : Void
      if @@mb_window_set_min_size.null?
        @@mb_window_set_min_size = Bridge.get_method_bind("DisplayServer", "window_set_min_size", 2019273902_i64)
      end
      val_0 = min_size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_min_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_size_with_decorations : Void* = Pointer(Void).null
    def window_get_size_with_decorations(window_id : Int64) : Vector2i
      if @@mb_window_get_size_with_decorations.null?
        @@mb_window_get_size_with_decorations = Bridge.get_method_bind("DisplayServer", "window_get_size_with_decorations", 763922886_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_size_with_decorations, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_window_get_mode : Void* = Pointer(Void).null
    def window_get_mode(window_id : Int64) : Int64
      if @@mb_window_get_mode.null?
        @@mb_window_get_mode = Bridge.get_method_bind("DisplayServer", "window_get_mode", 2185728461_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_window_get_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_set_mode : Void* = Pointer(Void).null
    def window_set_mode(mode : Int64, window_id : Int64) : Void
      if @@mb_window_set_mode.null?
        @@mb_window_set_mode = Bridge.get_method_bind("DisplayServer", "window_set_mode", 1319965401_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_flag : Void* = Pointer(Void).null
    def window_set_flag(flag : Int64, enabled : Bool, window_id : Int64) : Void
      if @@mb_window_set_flag.null?
        @@mb_window_set_flag = Bridge.get_method_bind("DisplayServer", "window_set_flag", 254894155_i64)
      end
      val_0 = flag
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = window_id
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_window_set_flag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_flag : Void* = Pointer(Void).null
    def window_get_flag(flag : Int64, window_id : Int64) : Bool
      if @@mb_window_get_flag.null?
        @@mb_window_get_flag = Bridge.get_method_bind("DisplayServer", "window_get_flag", 802816991_i64)
      end
      val_0 = flag
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_get_flag, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_set_icon : Void* = Pointer(Void).null
    def window_set_icon(icon : Image, window_id : Int64) : Void
      if @@mb_window_set_icon.null?
        @@mb_window_set_icon = Bridge.get_method_bind("DisplayServer", "window_set_icon", 2457502155_i64)
      end
      val_0 = icon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_window_buttons_offset : Void* = Pointer(Void).null
    def window_set_window_buttons_offset(offset : Vector2i, window_id : Int64) : Void
      if @@mb_window_set_window_buttons_offset.null?
        @@mb_window_set_window_buttons_offset = Bridge.get_method_bind("DisplayServer", "window_set_window_buttons_offset", 2019273902_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_window_buttons_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_safe_title_margins : Void* = Pointer(Void).null
    def window_get_safe_title_margins(window_id : Int64) : Vector3i
      if @@mb_window_get_safe_title_margins.null?
        @@mb_window_get_safe_title_margins = Bridge.get_method_bind("DisplayServer", "window_get_safe_title_margins", 2295066620_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_window_get_safe_title_margins, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector3i.new(ret_ptr)
    end
    @@mb_window_request_attention : Void* = Pointer(Void).null
    def window_request_attention(window_id : Int64) : Void
      if @@mb_window_request_attention.null?
        @@mb_window_request_attention = Bridge.get_method_bind("DisplayServer", "window_request_attention", 1995695955_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_window_request_attention, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_taskbar_progress_value : Void* = Pointer(Void).null
    def window_set_taskbar_progress_value(value : Float64, window_id : Int64) : Void
      if @@mb_window_set_taskbar_progress_value.null?
        @@mb_window_set_taskbar_progress_value = Bridge.get_method_bind("DisplayServer", "window_set_taskbar_progress_value", 3506631519_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_taskbar_progress_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_taskbar_progress_state : Void* = Pointer(Void).null
    def window_set_taskbar_progress_state(state : Int64, window_id : Int64) : Void
      if @@mb_window_set_taskbar_progress_state.null?
        @@mb_window_set_taskbar_progress_state = Bridge.get_method_bind("DisplayServer", "window_set_taskbar_progress_state", 4119882768_i64)
      end
      val_0 = state
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_taskbar_progress_state, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_move_to_foreground : Void* = Pointer(Void).null
    def window_move_to_foreground(window_id : Int64) : Void
      if @@mb_window_move_to_foreground.null?
        @@mb_window_move_to_foreground = Bridge.get_method_bind("DisplayServer", "window_move_to_foreground", 1995695955_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_window_move_to_foreground, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_is_focused : Void* = Pointer(Void).null
    def window_is_focused(window_id : Int64) : Bool
      if @@mb_window_is_focused.null?
        @@mb_window_is_focused = Bridge.get_method_bind("DisplayServer", "window_is_focused", 1051549951_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_is_focused, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_can_draw : Void* = Pointer(Void).null
    def window_can_draw(window_id : Int64) : Bool
      if @@mb_window_can_draw.null?
        @@mb_window_can_draw = Bridge.get_method_bind("DisplayServer", "window_can_draw", 1051549951_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_can_draw, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_set_transient : Void* = Pointer(Void).null
    def window_set_transient(window_id : Int64, parent_window_id : Int64) : Void
      if @@mb_window_set_transient.null?
        @@mb_window_set_transient = Bridge.get_method_bind("DisplayServer", "window_set_transient", 3937882851_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parent_window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_transient, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_exclusive : Void* = Pointer(Void).null
    def window_set_exclusive(window_id : Int64, exclusive : Bool) : Void
      if @@mb_window_set_exclusive.null?
        @@mb_window_set_exclusive = Bridge.get_method_bind("DisplayServer", "window_set_exclusive", 300928843_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = exclusive
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_exclusive, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_ime_active : Void* = Pointer(Void).null
    def window_set_ime_active(active : Bool, window_id : Int64) : Void
      if @@mb_window_set_ime_active.null?
        @@mb_window_set_ime_active = Bridge.get_method_bind("DisplayServer", "window_set_ime_active", 1661950165_i64)
      end
      val_0 = active
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_ime_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_ime_position : Void* = Pointer(Void).null
    def window_set_ime_position(position : Vector2i, window_id : Int64) : Void
      if @@mb_window_set_ime_position.null?
        @@mb_window_set_ime_position = Bridge.get_method_bind("DisplayServer", "window_set_ime_position", 2019273902_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_ime_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_vsync_mode : Void* = Pointer(Void).null
    def window_set_vsync_mode(vsync_mode : Int64, window_id : Int64) : Void
      if @@mb_window_set_vsync_mode.null?
        @@mb_window_set_vsync_mode = Bridge.get_method_bind("DisplayServer", "window_set_vsync_mode", 2179333492_i64)
      end
      val_0 = vsync_mode
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_vsync_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_vsync_mode : Void* = Pointer(Void).null
    def window_get_vsync_mode(window_id : Int64) : Int64
      if @@mb_window_get_vsync_mode.null?
        @@mb_window_get_vsync_mode = Bridge.get_method_bind("DisplayServer", "window_get_vsync_mode", 578873795_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_window_get_vsync_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_is_hdr_output_supported : Void* = Pointer(Void).null
    def window_is_hdr_output_supported(window_id : Int64) : Bool
      if @@mb_window_is_hdr_output_supported.null?
        @@mb_window_is_hdr_output_supported = Bridge.get_method_bind("DisplayServer", "window_is_hdr_output_supported", 1051549951_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_is_hdr_output_supported, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_request_hdr_output : Void* = Pointer(Void).null
    def window_request_hdr_output(enable : Bool, window_id : Int64) : Void
      if @@mb_window_request_hdr_output.null?
        @@mb_window_request_hdr_output = Bridge.get_method_bind("DisplayServer", "window_request_hdr_output", 1661950165_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_request_hdr_output, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_is_hdr_output_requested : Void* = Pointer(Void).null
    def window_is_hdr_output_requested(window_id : Int64) : Bool
      if @@mb_window_is_hdr_output_requested.null?
        @@mb_window_is_hdr_output_requested = Bridge.get_method_bind("DisplayServer", "window_is_hdr_output_requested", 1051549951_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_is_hdr_output_requested, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_is_hdr_output_enabled : Void* = Pointer(Void).null
    def window_is_hdr_output_enabled(window_id : Int64) : Bool
      if @@mb_window_is_hdr_output_enabled.null?
        @@mb_window_is_hdr_output_enabled = Bridge.get_method_bind("DisplayServer", "window_is_hdr_output_enabled", 1051549951_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_is_hdr_output_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_set_hdr_output_reference_luminance : Void* = Pointer(Void).null
    def window_set_hdr_output_reference_luminance(reference_luminance : Float64, window_id : Int64) : Void
      if @@mb_window_set_hdr_output_reference_luminance.null?
        @@mb_window_set_hdr_output_reference_luminance = Bridge.get_method_bind("DisplayServer", "window_set_hdr_output_reference_luminance", 3506631519_i64)
      end
      val_0 = reference_luminance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_hdr_output_reference_luminance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_hdr_output_reference_luminance : Void* = Pointer(Void).null
    def window_get_hdr_output_reference_luminance(window_id : Int64) : Float64
      if @@mb_window_get_hdr_output_reference_luminance.null?
        @@mb_window_get_hdr_output_reference_luminance = Bridge.get_method_bind("DisplayServer", "window_get_hdr_output_reference_luminance", 218038398_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_window_get_hdr_output_reference_luminance, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_get_hdr_output_current_reference_luminance : Void* = Pointer(Void).null
    def window_get_hdr_output_current_reference_luminance(window_id : Int64) : Float64
      if @@mb_window_get_hdr_output_current_reference_luminance.null?
        @@mb_window_get_hdr_output_current_reference_luminance = Bridge.get_method_bind("DisplayServer", "window_get_hdr_output_current_reference_luminance", 218038398_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_window_get_hdr_output_current_reference_luminance, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_set_hdr_output_max_luminance : Void* = Pointer(Void).null
    def window_set_hdr_output_max_luminance(max_luminance : Float64, window_id : Int64) : Void
      if @@mb_window_set_hdr_output_max_luminance.null?
        @@mb_window_set_hdr_output_max_luminance = Bridge.get_method_bind("DisplayServer", "window_set_hdr_output_max_luminance", 3506631519_i64)
      end
      val_0 = max_luminance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_set_hdr_output_max_luminance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_get_hdr_output_max_luminance : Void* = Pointer(Void).null
    def window_get_hdr_output_max_luminance(window_id : Int64) : Float64
      if @@mb_window_get_hdr_output_max_luminance.null?
        @@mb_window_get_hdr_output_max_luminance = Bridge.get_method_bind("DisplayServer", "window_get_hdr_output_max_luminance", 218038398_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_window_get_hdr_output_max_luminance, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_get_hdr_output_current_max_luminance : Void* = Pointer(Void).null
    def window_get_hdr_output_current_max_luminance(window_id : Int64) : Float64
      if @@mb_window_get_hdr_output_current_max_luminance.null?
        @@mb_window_get_hdr_output_current_max_luminance = Bridge.get_method_bind("DisplayServer", "window_get_hdr_output_current_max_luminance", 218038398_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_window_get_hdr_output_current_max_luminance, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_get_output_max_linear_value : Void* = Pointer(Void).null
    def window_get_output_max_linear_value(window_id : Int64) : Float64
      if @@mb_window_get_output_max_linear_value.null?
        @@mb_window_get_output_max_linear_value = Bridge.get_method_bind("DisplayServer", "window_get_output_max_linear_value", 218038398_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_window_get_output_max_linear_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_window_is_maximize_allowed : Void* = Pointer(Void).null
    def window_is_maximize_allowed(window_id : Int64) : Bool
      if @@mb_window_is_maximize_allowed.null?
        @@mb_window_is_maximize_allowed = Bridge.get_method_bind("DisplayServer", "window_is_maximize_allowed", 1051549951_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_is_maximize_allowed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_maximize_on_title_dbl_click : Void* = Pointer(Void).null
    def window_maximize_on_title_dbl_click() : Bool
      if @@mb_window_maximize_on_title_dbl_click.null?
        @@mb_window_maximize_on_title_dbl_click = Bridge.get_method_bind("DisplayServer", "window_maximize_on_title_dbl_click", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_maximize_on_title_dbl_click, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_minimize_on_title_dbl_click : Void* = Pointer(Void).null
    def window_minimize_on_title_dbl_click() : Bool
      if @@mb_window_minimize_on_title_dbl_click.null?
        @@mb_window_minimize_on_title_dbl_click = Bridge.get_method_bind("DisplayServer", "window_minimize_on_title_dbl_click", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_window_minimize_on_title_dbl_click, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_window_start_drag : Void* = Pointer(Void).null
    def window_start_drag(window_id : Int64) : Void
      if @@mb_window_start_drag.null?
        @@mb_window_start_drag = Bridge.get_method_bind("DisplayServer", "window_start_drag", 1995695955_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_window_start_drag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_start_resize : Void* = Pointer(Void).null
    def window_start_resize(edge : Int64, window_id : Int64) : Void
      if @@mb_window_start_resize.null?
        @@mb_window_start_resize = Bridge.get_method_bind("DisplayServer", "window_start_resize", 4009722312_i64)
      end
      val_0 = edge
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_window_start_resize, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_window_set_color : Void* = Pointer(Void).null
    def window_set_color(color : Color) : Void
      if @@mb_window_set_color.null?
        @@mb_window_set_color = Bridge.get_method_bind("DisplayServer", "window_set_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_window_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_should_increase_contrast : Void* = Pointer(Void).null
    def accessibility_should_increase_contrast() : Int64
      if @@mb_accessibility_should_increase_contrast.null?
        @@mb_accessibility_should_increase_contrast = Bridge.get_method_bind("DisplayServer", "accessibility_should_increase_contrast", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_should_increase_contrast, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_should_reduce_animation : Void* = Pointer(Void).null
    def accessibility_should_reduce_animation() : Int64
      if @@mb_accessibility_should_reduce_animation.null?
        @@mb_accessibility_should_reduce_animation = Bridge.get_method_bind("DisplayServer", "accessibility_should_reduce_animation", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_should_reduce_animation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_should_reduce_transparency : Void* = Pointer(Void).null
    def accessibility_should_reduce_transparency() : Int64
      if @@mb_accessibility_should_reduce_transparency.null?
        @@mb_accessibility_should_reduce_transparency = Bridge.get_method_bind("DisplayServer", "accessibility_should_reduce_transparency", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_should_reduce_transparency, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_screen_reader_active : Void* = Pointer(Void).null
    def accessibility_screen_reader_active() : Int64
      if @@mb_accessibility_screen_reader_active.null?
        @@mb_accessibility_screen_reader_active = Bridge.get_method_bind("DisplayServer", "accessibility_screen_reader_active", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_screen_reader_active, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_create_element : Void* = Pointer(Void).null
    def accessibility_create_element(window_id : Int64, role : Int64) : Int64
      if @@mb_accessibility_create_element.null?
        @@mb_accessibility_create_element = Bridge.get_method_bind("DisplayServer", "accessibility_create_element", 2968347744_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = role
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_create_element, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_create_sub_element : Void* = Pointer(Void).null
    def accessibility_create_sub_element(parent_rid : Int64, role : Int64, insert_pos : Int64) : Int64
      if @@mb_accessibility_create_sub_element.null?
        @@mb_accessibility_create_sub_element = Bridge.get_method_bind("DisplayServer", "accessibility_create_sub_element", 1949948826_i64)
      end
      val_0 = parent_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = role
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = insert_pos
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_create_sub_element, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_create_sub_text_edit_elements : Void* = Pointer(Void).null
    def accessibility_create_sub_text_edit_elements(parent_rid : Int64, shaped_text : Int64, min_height : Float64, insert_pos : Int64, is_last_line : Bool) : Int64
      if @@mb_accessibility_create_sub_text_edit_elements.null?
        @@mb_accessibility_create_sub_text_edit_elements = Bridge.get_method_bind("DisplayServer", "accessibility_create_sub_text_edit_elements", 2702009895_i64)
      end
      val_0 = parent_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shaped_text
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = min_height
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = insert_pos
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = is_last_line
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_create_sub_text_edit_elements, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_has_element : Void* = Pointer(Void).null
    def accessibility_has_element(id : Int64) : Bool
      if @@mb_accessibility_has_element.null?
        @@mb_accessibility_has_element = Bridge.get_method_bind("DisplayServer", "accessibility_has_element", 4155700596_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_accessibility_has_element, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_accessibility_free_element : Void* = Pointer(Void).null
    def accessibility_free_element(id : Int64) : Void
      if @@mb_accessibility_free_element.null?
        @@mb_accessibility_free_element = Bridge.get_method_bind("DisplayServer", "accessibility_free_element", 2722037293_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_accessibility_free_element, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_element_set_meta : Void* = Pointer(Void).null
    def accessibility_element_set_meta(id : Int64, meta : Void*) : Void
      if @@mb_accessibility_element_set_meta.null?
        @@mb_accessibility_element_set_meta = Bridge.get_method_bind("DisplayServer", "accessibility_element_set_meta", 3175752987_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = meta
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_element_set_meta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_element_get_meta : Void* = Pointer(Void).null
    def accessibility_element_get_meta(id : Int64) : Void*
      if @@mb_accessibility_element_get_meta.null?
        @@mb_accessibility_element_get_meta = Bridge.get_method_bind("DisplayServer", "accessibility_element_get_meta", 4171304767_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_accessibility_element_get_meta, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_accessibility_set_window_rect : Void* = Pointer(Void).null
    def accessibility_set_window_rect(window_id : Int64, rect_out : Rect2, rect_in : Rect2) : Void
      if @@mb_accessibility_set_window_rect.null?
        @@mb_accessibility_set_window_rect = Bridge.get_method_bind("DisplayServer", "accessibility_set_window_rect", 2386961724_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect_out
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = rect_in
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_set_window_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_set_window_focused : Void* = Pointer(Void).null
    def accessibility_set_window_focused(window_id : Int64, focused : Bool) : Void
      if @@mb_accessibility_set_window_focused.null?
        @@mb_accessibility_set_window_focused = Bridge.get_method_bind("DisplayServer", "accessibility_set_window_focused", 300928843_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = focused
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_set_window_focused, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_focus : Void* = Pointer(Void).null
    def accessibility_update_set_focus(id : Int64) : Void
      if @@mb_accessibility_update_set_focus.null?
        @@mb_accessibility_update_set_focus = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_focus", 2722037293_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_accessibility_update_set_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_get_window_root : Void* = Pointer(Void).null
    def accessibility_get_window_root(window_id : Int64) : Int64
      if @@mb_accessibility_get_window_root.null?
        @@mb_accessibility_get_window_root = Bridge.get_method_bind("DisplayServer", "accessibility_get_window_root", 495598643_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_accessibility_get_window_root, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_accessibility_update_set_role : Void* = Pointer(Void).null
    def accessibility_update_set_role(id : Int64, role : Int64) : Void
      if @@mb_accessibility_update_set_role.null?
        @@mb_accessibility_update_set_role = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_role", 3352768215_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = role
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_role, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_name : Void* = Pointer(Void).null
    def accessibility_update_set_name(id : Int64, name : String) : Void
      if @@mb_accessibility_update_set_name.null?
        @@mb_accessibility_update_set_name = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_name", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_extra_info : Void* = Pointer(Void).null
    def accessibility_update_set_extra_info(id : Int64, name : String) : Void
      if @@mb_accessibility_update_set_extra_info.null?
        @@mb_accessibility_update_set_extra_info = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_extra_info", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_extra_info, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_description : Void* = Pointer(Void).null
    def accessibility_update_set_description(id : Int64, description : String) : Void
      if @@mb_accessibility_update_set_description.null?
        @@mb_accessibility_update_set_description = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_description", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_value : Void* = Pointer(Void).null
    def accessibility_update_set_value(id : Int64, value : String) : Void
      if @@mb_accessibility_update_set_value.null?
        @@mb_accessibility_update_set_value = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_value", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_tooltip : Void* = Pointer(Void).null
    def accessibility_update_set_tooltip(id : Int64, tooltip : String) : Void
      if @@mb_accessibility_update_set_tooltip.null?
        @@mb_accessibility_update_set_tooltip = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_tooltip", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_bounds : Void* = Pointer(Void).null
    def accessibility_update_set_bounds(id : Int64, rect : Rect2) : Void
      if @@mb_accessibility_update_set_bounds.null?
        @@mb_accessibility_update_set_bounds = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_bounds", 1378122625_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_bounds, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_transform : Void* = Pointer(Void).null
    def accessibility_update_set_transform(id : Int64, transform : Transform2D) : Void
      if @@mb_accessibility_update_set_transform.null?
        @@mb_accessibility_update_set_transform = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_transform", 1246044741_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_child : Void* = Pointer(Void).null
    def accessibility_update_add_child(id : Int64, child_id : Int64) : Void
      if @@mb_accessibility_update_add_child.null?
        @@mb_accessibility_update_add_child = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_child", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = child_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_add_child, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_related_controls : Void* = Pointer(Void).null
    def accessibility_update_add_related_controls(id : Int64, related_id : Int64) : Void
      if @@mb_accessibility_update_add_related_controls.null?
        @@mb_accessibility_update_add_related_controls = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_related_controls", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_add_related_controls, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_related_details : Void* = Pointer(Void).null
    def accessibility_update_add_related_details(id : Int64, related_id : Int64) : Void
      if @@mb_accessibility_update_add_related_details.null?
        @@mb_accessibility_update_add_related_details = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_related_details", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_add_related_details, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_related_described_by : Void* = Pointer(Void).null
    def accessibility_update_add_related_described_by(id : Int64, related_id : Int64) : Void
      if @@mb_accessibility_update_add_related_described_by.null?
        @@mb_accessibility_update_add_related_described_by = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_related_described_by", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_add_related_described_by, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_related_flow_to : Void* = Pointer(Void).null
    def accessibility_update_add_related_flow_to(id : Int64, related_id : Int64) : Void
      if @@mb_accessibility_update_add_related_flow_to.null?
        @@mb_accessibility_update_add_related_flow_to = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_related_flow_to", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_add_related_flow_to, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_related_labeled_by : Void* = Pointer(Void).null
    def accessibility_update_add_related_labeled_by(id : Int64, related_id : Int64) : Void
      if @@mb_accessibility_update_add_related_labeled_by.null?
        @@mb_accessibility_update_add_related_labeled_by = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_related_labeled_by", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_add_related_labeled_by, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_related_radio_group : Void* = Pointer(Void).null
    def accessibility_update_add_related_radio_group(id : Int64, related_id : Int64) : Void
      if @@mb_accessibility_update_add_related_radio_group.null?
        @@mb_accessibility_update_add_related_radio_group = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_related_radio_group", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = related_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_add_related_radio_group, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_active_descendant : Void* = Pointer(Void).null
    def accessibility_update_set_active_descendant(id : Int64, other_id : Int64) : Void
      if @@mb_accessibility_update_set_active_descendant.null?
        @@mb_accessibility_update_set_active_descendant = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_active_descendant", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_active_descendant, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_next_on_line : Void* = Pointer(Void).null
    def accessibility_update_set_next_on_line(id : Int64, other_id : Int64) : Void
      if @@mb_accessibility_update_set_next_on_line.null?
        @@mb_accessibility_update_set_next_on_line = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_next_on_line", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_next_on_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_previous_on_line : Void* = Pointer(Void).null
    def accessibility_update_set_previous_on_line(id : Int64, other_id : Int64) : Void
      if @@mb_accessibility_update_set_previous_on_line.null?
        @@mb_accessibility_update_set_previous_on_line = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_previous_on_line", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_previous_on_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_member_of : Void* = Pointer(Void).null
    def accessibility_update_set_member_of(id : Int64, group_id : Int64) : Void
      if @@mb_accessibility_update_set_member_of.null?
        @@mb_accessibility_update_set_member_of = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_member_of", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = group_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_member_of, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_in_page_link_target : Void* = Pointer(Void).null
    def accessibility_update_set_in_page_link_target(id : Int64, other_id : Int64) : Void
      if @@mb_accessibility_update_set_in_page_link_target.null?
        @@mb_accessibility_update_set_in_page_link_target = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_in_page_link_target", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_in_page_link_target, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_error_message : Void* = Pointer(Void).null
    def accessibility_update_set_error_message(id : Int64, other_id : Int64) : Void
      if @@mb_accessibility_update_set_error_message.null?
        @@mb_accessibility_update_set_error_message = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_error_message", 395945892_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = other_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_error_message, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_live : Void* = Pointer(Void).null
    def accessibility_update_set_live(id : Int64, live : Int64) : Void
      if @@mb_accessibility_update_set_live.null?
        @@mb_accessibility_update_set_live = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_live", 2683302212_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = live
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_live, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_action : Void* = Pointer(Void).null
    def accessibility_update_add_action(id : Int64, action : Int64, callable : Void*) : Void
      if @@mb_accessibility_update_add_action.null?
        @@mb_accessibility_update_add_action = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_action", 2898696987_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = action
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callable
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_add_action, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_add_custom_action : Void* = Pointer(Void).null
    def accessibility_update_add_custom_action(id : Int64, action_id : Int64, action_description : String) : Void
      if @@mb_accessibility_update_add_custom_action.null?
        @@mb_accessibility_update_add_custom_action = Bridge.get_method_bind("DisplayServer", "accessibility_update_add_custom_action", 4153150897_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = action_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = action_description
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_add_custom_action, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_table_row_count : Void* = Pointer(Void).null
    def accessibility_update_set_table_row_count(id : Int64, count : Int64) : Void
      if @@mb_accessibility_update_set_table_row_count.null?
        @@mb_accessibility_update_set_table_row_count = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_table_row_count", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_table_row_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_table_column_count : Void* = Pointer(Void).null
    def accessibility_update_set_table_column_count(id : Int64, count : Int64) : Void
      if @@mb_accessibility_update_set_table_column_count.null?
        @@mb_accessibility_update_set_table_column_count = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_table_column_count", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_table_column_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_table_row_index : Void* = Pointer(Void).null
    def accessibility_update_set_table_row_index(id : Int64, index : Int64) : Void
      if @@mb_accessibility_update_set_table_row_index.null?
        @@mb_accessibility_update_set_table_row_index = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_table_row_index", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_table_row_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_table_column_index : Void* = Pointer(Void).null
    def accessibility_update_set_table_column_index(id : Int64, index : Int64) : Void
      if @@mb_accessibility_update_set_table_column_index.null?
        @@mb_accessibility_update_set_table_column_index = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_table_column_index", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_table_column_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_table_cell_position : Void* = Pointer(Void).null
    def accessibility_update_set_table_cell_position(id : Int64, row_index : Int64, column_index : Int64) : Void
      if @@mb_accessibility_update_set_table_cell_position.null?
        @@mb_accessibility_update_set_table_cell_position = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_table_cell_position", 4288446313_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = row_index
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = column_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_set_table_cell_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_table_cell_span : Void* = Pointer(Void).null
    def accessibility_update_set_table_cell_span(id : Int64, row_span : Int64, column_span : Int64) : Void
      if @@mb_accessibility_update_set_table_cell_span.null?
        @@mb_accessibility_update_set_table_cell_span = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_table_cell_span", 4288446313_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = row_span
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = column_span
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_set_table_cell_span, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_list_item_count : Void* = Pointer(Void).null
    def accessibility_update_set_list_item_count(id : Int64, size : Int64) : Void
      if @@mb_accessibility_update_set_list_item_count.null?
        @@mb_accessibility_update_set_list_item_count = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_list_item_count", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_list_item_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_list_item_index : Void* = Pointer(Void).null
    def accessibility_update_set_list_item_index(id : Int64, index : Int64) : Void
      if @@mb_accessibility_update_set_list_item_index.null?
        @@mb_accessibility_update_set_list_item_index = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_list_item_index", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_list_item_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_list_item_level : Void* = Pointer(Void).null
    def accessibility_update_set_list_item_level(id : Int64, level : Int64) : Void
      if @@mb_accessibility_update_set_list_item_level.null?
        @@mb_accessibility_update_set_list_item_level = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_list_item_level", 3411492887_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = level
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_list_item_level, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_list_item_selected : Void* = Pointer(Void).null
    def accessibility_update_set_list_item_selected(id : Int64, selected : Bool) : Void
      if @@mb_accessibility_update_set_list_item_selected.null?
        @@mb_accessibility_update_set_list_item_selected = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_list_item_selected", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = selected
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_list_item_selected, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_list_item_expanded : Void* = Pointer(Void).null
    def accessibility_update_set_list_item_expanded(id : Int64, expanded : Bool) : Void
      if @@mb_accessibility_update_set_list_item_expanded.null?
        @@mb_accessibility_update_set_list_item_expanded = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_list_item_expanded", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = expanded
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_list_item_expanded, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_popup_type : Void* = Pointer(Void).null
    def accessibility_update_set_popup_type(id : Int64, popup : Int64) : Void
      if @@mb_accessibility_update_set_popup_type.null?
        @@mb_accessibility_update_set_popup_type = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_popup_type", 2040885448_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = popup
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_popup_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_checked : Void* = Pointer(Void).null
    def accessibility_update_set_checked(id : Int64, checekd : Bool) : Void
      if @@mb_accessibility_update_set_checked.null?
        @@mb_accessibility_update_set_checked = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_checked", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = checekd
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_checked, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_num_value : Void* = Pointer(Void).null
    def accessibility_update_set_num_value(id : Int64, position : Float64) : Void
      if @@mb_accessibility_update_set_num_value.null?
        @@mb_accessibility_update_set_num_value = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_num_value", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_num_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_num_range : Void* = Pointer(Void).null
    def accessibility_update_set_num_range(id : Int64, min : Float64, max : Float64) : Void
      if @@mb_accessibility_update_set_num_range.null?
        @@mb_accessibility_update_set_num_range = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_num_range", 2513314492_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_set_num_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_num_step : Void* = Pointer(Void).null
    def accessibility_update_set_num_step(id : Int64, step : Float64) : Void
      if @@mb_accessibility_update_set_num_step.null?
        @@mb_accessibility_update_set_num_step = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_num_step", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = step
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_num_step, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_num_jump : Void* = Pointer(Void).null
    def accessibility_update_set_num_jump(id : Int64, jump : Float64) : Void
      if @@mb_accessibility_update_set_num_jump.null?
        @@mb_accessibility_update_set_num_jump = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_num_jump", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = jump
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_num_jump, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_scroll_x : Void* = Pointer(Void).null
    def accessibility_update_set_scroll_x(id : Int64, position : Float64) : Void
      if @@mb_accessibility_update_set_scroll_x.null?
        @@mb_accessibility_update_set_scroll_x = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_scroll_x", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_scroll_x, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_scroll_x_range : Void* = Pointer(Void).null
    def accessibility_update_set_scroll_x_range(id : Int64, min : Float64, max : Float64) : Void
      if @@mb_accessibility_update_set_scroll_x_range.null?
        @@mb_accessibility_update_set_scroll_x_range = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_scroll_x_range", 2513314492_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_set_scroll_x_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_scroll_y : Void* = Pointer(Void).null
    def accessibility_update_set_scroll_y(id : Int64, position : Float64) : Void
      if @@mb_accessibility_update_set_scroll_y.null?
        @@mb_accessibility_update_set_scroll_y = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_scroll_y", 1794382983_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_scroll_y, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_scroll_y_range : Void* = Pointer(Void).null
    def accessibility_update_set_scroll_y_range(id : Int64, min : Float64, max : Float64) : Void
      if @@mb_accessibility_update_set_scroll_y_range.null?
        @@mb_accessibility_update_set_scroll_y_range = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_scroll_y_range", 2513314492_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_set_scroll_y_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_text_decorations : Void* = Pointer(Void).null
    def accessibility_update_set_text_decorations(id : Int64, underline : Bool, strikethrough : Bool, overline : Bool) : Void
      if @@mb_accessibility_update_set_text_decorations.null?
        @@mb_accessibility_update_set_text_decorations = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_text_decorations", 1672422386_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = underline
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = strikethrough
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = overline
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_accessibility_update_set_text_decorations, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_text_align : Void* = Pointer(Void).null
    def accessibility_update_set_text_align(id : Int64, align : Int64) : Void
      if @@mb_accessibility_update_set_text_align.null?
        @@mb_accessibility_update_set_text_align = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_text_align", 3725995085_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = align
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_text_align, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_text_selection : Void* = Pointer(Void).null
    def accessibility_update_set_text_selection(id : Int64, text_start_id : Int64, start_char : Int64, text_end_id : Int64, end_char : Int64) : Void
      if @@mb_accessibility_update_set_text_selection.null?
        @@mb_accessibility_update_set_text_selection = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_text_selection", 3119144029_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = text_start_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = start_char
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = text_end_id
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = end_char
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_accessibility_update_set_text_selection, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_flag : Void* = Pointer(Void).null
    def accessibility_update_set_flag(id : Int64, flag : Int64, value : Bool) : Void
      if @@mb_accessibility_update_set_flag.null?
        @@mb_accessibility_update_set_flag = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_flag", 3758675396_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flag
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_accessibility_update_set_flag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_classname : Void* = Pointer(Void).null
    def accessibility_update_set_classname(id : Int64, classname : String) : Void
      if @@mb_accessibility_update_set_classname.null?
        @@mb_accessibility_update_set_classname = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_classname", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = classname
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_classname, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_placeholder : Void* = Pointer(Void).null
    def accessibility_update_set_placeholder(id : Int64, placeholder : String) : Void
      if @@mb_accessibility_update_set_placeholder.null?
        @@mb_accessibility_update_set_placeholder = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_placeholder", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = placeholder
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_placeholder, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_language : Void* = Pointer(Void).null
    def accessibility_update_set_language(id : Int64, language : String) : Void
      if @@mb_accessibility_update_set_language.null?
        @@mb_accessibility_update_set_language = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_language", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_language, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_text_orientation : Void* = Pointer(Void).null
    def accessibility_update_set_text_orientation(id : Int64, vertical : Bool) : Void
      if @@mb_accessibility_update_set_text_orientation.null?
        @@mb_accessibility_update_set_text_orientation = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_text_orientation", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertical
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_text_orientation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_list_orientation : Void* = Pointer(Void).null
    def accessibility_update_set_list_orientation(id : Int64, vertical : Bool) : Void
      if @@mb_accessibility_update_set_list_orientation.null?
        @@mb_accessibility_update_set_list_orientation = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_list_orientation", 1265174801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertical
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_list_orientation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_shortcut : Void* = Pointer(Void).null
    def accessibility_update_set_shortcut(id : Int64, shortcut : String) : Void
      if @@mb_accessibility_update_set_shortcut.null?
        @@mb_accessibility_update_set_shortcut = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_shortcut", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shortcut
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_shortcut, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_url : Void* = Pointer(Void).null
    def accessibility_update_set_url(id : Int64, url : String) : Void
      if @@mb_accessibility_update_set_url.null?
        @@mb_accessibility_update_set_url = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_url", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = url
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_url, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_role_description : Void* = Pointer(Void).null
    def accessibility_update_set_role_description(id : Int64, description : String) : Void
      if @@mb_accessibility_update_set_role_description.null?
        @@mb_accessibility_update_set_role_description = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_role_description", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_role_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_state_description : Void* = Pointer(Void).null
    def accessibility_update_set_state_description(id : Int64, description : String) : Void
      if @@mb_accessibility_update_set_state_description.null?
        @@mb_accessibility_update_set_state_description = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_state_description", 2726140452_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_state_description, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_color_value : Void* = Pointer(Void).null
    def accessibility_update_set_color_value(id : Int64, color : Color) : Void
      if @@mb_accessibility_update_set_color_value.null?
        @@mb_accessibility_update_set_color_value = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_color_value", 2948539648_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_color_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_background_color : Void* = Pointer(Void).null
    def accessibility_update_set_background_color(id : Int64, color : Color) : Void
      if @@mb_accessibility_update_set_background_color.null?
        @@mb_accessibility_update_set_background_color = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_background_color", 2948539648_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_background_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_accessibility_update_set_foreground_color : Void* = Pointer(Void).null
    def accessibility_update_set_foreground_color(id : Int64, color : Color) : Void
      if @@mb_accessibility_update_set_foreground_color.null?
        @@mb_accessibility_update_set_foreground_color = Bridge.get_method_bind("DisplayServer", "accessibility_update_set_foreground_color", 2948539648_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_accessibility_update_set_foreground_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_ime_get_selection : Void* = Pointer(Void).null
    def ime_get_selection() : Vector2i
      if @@mb_ime_get_selection.null?
        @@mb_ime_get_selection = Bridge.get_method_bind("DisplayServer", "ime_get_selection", 3690982128_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_ime_get_selection, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_ime_get_text : Void* = Pointer(Void).null
    def ime_get_text() : String
      if @@mb_ime_get_text.null?
        @@mb_ime_get_text = Bridge.get_method_bind("DisplayServer", "ime_get_text", 201670096_i64)
      end
      ""
    end
    @@mb_virtual_keyboard_show : Void* = Pointer(Void).null
    def virtual_keyboard_show(existing_text : String, position : Rect2, get_type : Int64, max_length : Int64, cursor_start : Int64, cursor_end : Int64) : Void
      if @@mb_virtual_keyboard_show.null?
        @@mb_virtual_keyboard_show = Bridge.get_method_bind("DisplayServer", "virtual_keyboard_show", 3042891259_i64)
      end
      val_0 = existing_text
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = get_type
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = max_length
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = cursor_start
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = cursor_end
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_virtual_keyboard_show, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_virtual_keyboard_hide : Void* = Pointer(Void).null
    def virtual_keyboard_hide() : Void
      if @@mb_virtual_keyboard_hide.null?
        @@mb_virtual_keyboard_hide = Bridge.get_method_bind("DisplayServer", "virtual_keyboard_hide", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_virtual_keyboard_hide, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_virtual_keyboard_get_height : Void* = Pointer(Void).null
    def virtual_keyboard_get_height() : Int64
      if @@mb_virtual_keyboard_get_height.null?
        @@mb_virtual_keyboard_get_height = Bridge.get_method_bind("DisplayServer", "virtual_keyboard_get_height", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_virtual_keyboard_get_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_hardware_keyboard : Void* = Pointer(Void).null
    def has_hardware_keyboard() : Bool
      if @@mb_has_hardware_keyboard.null?
        @@mb_has_hardware_keyboard = Bridge.get_method_bind("DisplayServer", "has_hardware_keyboard", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_hardware_keyboard, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_hardware_keyboard_connection_change_callback : Void* = Pointer(Void).null
    def set_hardware_keyboard_connection_change_callback(callable : Void*) : Void
      if @@mb_set_hardware_keyboard_connection_change_callback.null?
        @@mb_set_hardware_keyboard_connection_change_callback = Bridge.get_method_bind("DisplayServer", "set_hardware_keyboard_connection_change_callback", 1611583062_i64)
      end
      val_0 = callable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hardware_keyboard_connection_change_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_cursor_set_shape : Void* = Pointer(Void).null
    def cursor_set_shape(shape : Int64) : Void
      if @@mb_cursor_set_shape.null?
        @@mb_cursor_set_shape = Bridge.get_method_bind("DisplayServer", "cursor_set_shape", 2026291549_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_cursor_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_cursor_get_shape : Void* = Pointer(Void).null
    def cursor_get_shape() : Int64
      if @@mb_cursor_get_shape.null?
        @@mb_cursor_get_shape = Bridge.get_method_bind("DisplayServer", "cursor_get_shape", 1087724927_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_cursor_get_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_cursor_set_custom_image : Void* = Pointer(Void).null
    def cursor_set_custom_image(cursor : Resource, shape : Int64, hotspot : Vector2) : Void
      if @@mb_cursor_set_custom_image.null?
        @@mb_cursor_set_custom_image = Bridge.get_method_bind("DisplayServer", "cursor_set_custom_image", 1816663697_i64)
      end
      arg_ptr_0 = cursor ? cursor.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = shape
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = hotspot
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_cursor_set_custom_image, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_send_toast_notification : Void* = Pointer(Void).null
    def send_toast_notification(title : String, text : String, image : Texture2D, callback : Void*) : Int64
      if @@mb_send_toast_notification.null?
        @@mb_send_toast_notification = Bridge.get_method_bind("DisplayServer", "send_toast_notification", 3914862447_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = text
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = image
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = callback
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_i64
      Bridge.ptrcall(@@mb_send_toast_notification, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_hide_toast_notification : Void* = Pointer(Void).null
    def hide_toast_notification(id : Int64) : Void
      if @@mb_hide_toast_notification.null?
        @@mb_hide_toast_notification = Bridge.get_method_bind("DisplayServer", "hide_toast_notification", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_hide_toast_notification, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_swap_cancel_ok : Void* = Pointer(Void).null
    def get_swap_cancel_ok() : Bool
      if @@mb_get_swap_cancel_ok.null?
        @@mb_get_swap_cancel_ok = Bridge.get_method_bind("DisplayServer", "get_swap_cancel_ok", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_swap_cancel_ok, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_enable_for_stealing_focus : Void* = Pointer(Void).null
    def enable_for_stealing_focus(process_id : Int64) : Void
      if @@mb_enable_for_stealing_focus.null?
        @@mb_enable_for_stealing_focus = Bridge.get_method_bind("DisplayServer", "enable_for_stealing_focus", 1286410249_i64)
      end
      val_0 = process_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_enable_for_stealing_focus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_dialog_show : Void* = Pointer(Void).null
    def dialog_show(title : String, description : String, buttons : Void*, callback : Void*) : Int64
      if @@mb_dialog_show.null?
        @@mb_dialog_show = Bridge.get_method_bind("DisplayServer", "dialog_show", 4115553226_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = buttons
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = callback
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_i64
      Bridge.ptrcall(@@mb_dialog_show, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_dialog_input_text : Void* = Pointer(Void).null
    def dialog_input_text(title : String, description : String, existing_text : String, callback : Void*) : Int64
      if @@mb_dialog_input_text.null?
        @@mb_dialog_input_text = Bridge.get_method_bind("DisplayServer", "dialog_input_text", 3088703427_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = description
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = existing_text
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = callback
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_i64
      Bridge.ptrcall(@@mb_dialog_input_text, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_file_dialog_show : Void* = Pointer(Void).null
    def file_dialog_show(title : String, current_directory : String, filename : String, show_hidden : Bool, mode : Int64, filters : Void*, callback : Void*, parent_window_id : Int64) : Int64
      if @@mb_file_dialog_show.null?
        @@mb_file_dialog_show = Bridge.get_method_bind("DisplayServer", "file_dialog_show", 1386825884_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = current_directory
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = filename
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = show_hidden
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = mode
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = filters
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = callback
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = parent_window_id
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      ret = 0_i64
      Bridge.ptrcall(@@mb_file_dialog_show, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_file_dialog_with_options_show : Void* = Pointer(Void).null
    def file_dialog_with_options_show(title : String, current_directory : String, root : String, filename : String, show_hidden : Bool, mode : Int64, filters : Void*, options : Godot::Array, callback : Void*, parent_window_id : Int64) : Int64
      if @@mb_file_dialog_with_options_show.null?
        @@mb_file_dialog_with_options_show = Bridge.get_method_bind("DisplayServer", "file_dialog_with_options_show", 1448789813_i64)
      end
      val_0 = title
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = current_directory
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = root
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = filename
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = show_hidden
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = mode
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = filters
      arg_6 = pointerof(val_6).as(Void*)
      arg_ptr_7 = options ? options.pointer : Pointer(Void).null
      arg_7 = pointerof(arg_ptr_7).as(Void*)
      val_8 = callback
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = parent_window_id
      arg_9 = pointerof(val_9).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9]
      ret = 0_i64
      Bridge.ptrcall(@@mb_file_dialog_with_options_show, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_beep : Void* = Pointer(Void).null
    def beep() : Void
      if @@mb_beep.null?
        @@mb_beep = Bridge.get_method_bind("DisplayServer", "beep", 4051624405_i64)
      end
      Bridge.ptrcall(@@mb_beep, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_keyboard_get_layout_count : Void* = Pointer(Void).null
    def keyboard_get_layout_count() : Int64
      if @@mb_keyboard_get_layout_count.null?
        @@mb_keyboard_get_layout_count = Bridge.get_method_bind("DisplayServer", "keyboard_get_layout_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_keyboard_get_layout_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_keyboard_get_current_layout : Void* = Pointer(Void).null
    def keyboard_get_current_layout() : Int64
      if @@mb_keyboard_get_current_layout.null?
        @@mb_keyboard_get_current_layout = Bridge.get_method_bind("DisplayServer", "keyboard_get_current_layout", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_keyboard_get_current_layout, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_keyboard_set_current_layout : Void* = Pointer(Void).null
    def keyboard_set_current_layout(index : Int64) : Void
      if @@mb_keyboard_set_current_layout.null?
        @@mb_keyboard_set_current_layout = Bridge.get_method_bind("DisplayServer", "keyboard_set_current_layout", 1286410249_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_keyboard_set_current_layout, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_keyboard_get_layout_language : Void* = Pointer(Void).null
    def keyboard_get_layout_language(index : Int64) : String
      if @@mb_keyboard_get_layout_language.null?
        @@mb_keyboard_get_layout_language = Bridge.get_method_bind("DisplayServer", "keyboard_get_layout_language", 844755477_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_keyboard_get_layout_name : Void* = Pointer(Void).null
    def keyboard_get_layout_name(index : Int64) : String
      if @@mb_keyboard_get_layout_name.null?
        @@mb_keyboard_get_layout_name = Bridge.get_method_bind("DisplayServer", "keyboard_get_layout_name", 844755477_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_keyboard_get_keycode_from_physical : Void* = Pointer(Void).null
    def keyboard_get_keycode_from_physical(keycode : Int64) : Int64
      if @@mb_keyboard_get_keycode_from_physical.null?
        @@mb_keyboard_get_keycode_from_physical = Bridge.get_method_bind("DisplayServer", "keyboard_get_keycode_from_physical", 3447613187_i64)
      end
      val_0 = keycode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_keyboard_get_keycode_from_physical, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_keyboard_get_label_from_physical : Void* = Pointer(Void).null
    def keyboard_get_label_from_physical(keycode : Int64) : Int64
      if @@mb_keyboard_get_label_from_physical.null?
        @@mb_keyboard_get_label_from_physical = Bridge.get_method_bind("DisplayServer", "keyboard_get_label_from_physical", 3447613187_i64)
      end
      val_0 = keycode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_keyboard_get_label_from_physical, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_show_emoji_and_symbol_picker : Void* = Pointer(Void).null
    def show_emoji_and_symbol_picker() : Void
      if @@mb_show_emoji_and_symbol_picker.null?
        @@mb_show_emoji_and_symbol_picker = Bridge.get_method_bind("DisplayServer", "show_emoji_and_symbol_picker", 4051624405_i64)
      end
      Bridge.ptrcall(@@mb_show_emoji_and_symbol_picker, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_color_picker : Void* = Pointer(Void).null
    def color_picker(callback : Void*) : Bool
      if @@mb_color_picker.null?
        @@mb_color_picker = Bridge.get_method_bind("DisplayServer", "color_picker", 151643214_i64)
      end
      val_0 = callback
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_color_picker, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_process_events : Void* = Pointer(Void).null
    def process_events() : Void
      if @@mb_process_events.null?
        @@mb_process_events = Bridge.get_method_bind("DisplayServer", "process_events", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_process_events, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_force_process_and_drop_events : Void* = Pointer(Void).null
    def force_process_and_drop_events() : Void
      if @@mb_force_process_and_drop_events.null?
        @@mb_force_process_and_drop_events = Bridge.get_method_bind("DisplayServer", "force_process_and_drop_events", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_process_and_drop_events, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_native_icon : Void* = Pointer(Void).null
    def set_native_icon(filename : String) : Void
      if @@mb_set_native_icon.null?
        @@mb_set_native_icon = Bridge.get_method_bind("DisplayServer", "set_native_icon", 83702148_i64)
      end
      val_0 = filename
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_native_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_icon : Void* = Pointer(Void).null
    def set_icon(image : Image) : Void
      if @@mb_set_icon.null?
        @@mb_set_icon = Bridge.get_method_bind("DisplayServer", "set_icon", 532598488_i64)
      end
      val_0 = image
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_create_status_indicator : Void* = Pointer(Void).null
    def create_status_indicator(icon : Texture2D, tooltip : String, callback : Void*) : Int64
      if @@mb_create_status_indicator.null?
        @@mb_create_status_indicator = Bridge.get_method_bind("DisplayServer", "create_status_indicator", 1904285171_i64)
      end
      val_0 = icon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_status_indicator, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_status_indicator_set_icon : Void* = Pointer(Void).null
    def status_indicator_set_icon(id : Int64, icon : Texture2D) : Void
      if @@mb_status_indicator_set_icon.null?
        @@mb_status_indicator_set_icon = Bridge.get_method_bind("DisplayServer", "status_indicator_set_icon", 666127730_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = icon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_status_indicator_set_icon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_status_indicator_set_tooltip : Void* = Pointer(Void).null
    def status_indicator_set_tooltip(id : Int64, tooltip : String) : Void
      if @@mb_status_indicator_set_tooltip.null?
        @@mb_status_indicator_set_tooltip = Bridge.get_method_bind("DisplayServer", "status_indicator_set_tooltip", 501894301_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tooltip
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_status_indicator_set_tooltip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_status_indicator_set_menu : Void* = Pointer(Void).null
    def status_indicator_set_menu(id : Int64, menu_rid : Int64) : Void
      if @@mb_status_indicator_set_menu.null?
        @@mb_status_indicator_set_menu = Bridge.get_method_bind("DisplayServer", "status_indicator_set_menu", 4040184819_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = menu_rid
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_status_indicator_set_menu, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_status_indicator_set_callback : Void* = Pointer(Void).null
    def status_indicator_set_callback(id : Int64, callback : Void*) : Void
      if @@mb_status_indicator_set_callback.null?
        @@mb_status_indicator_set_callback = Bridge.get_method_bind("DisplayServer", "status_indicator_set_callback", 957362965_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_status_indicator_set_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_status_indicator_get_rect : Void* = Pointer(Void).null
    def status_indicator_get_rect(id : Int64) : Rect2
      if @@mb_status_indicator_get_rect.null?
        @@mb_status_indicator_get_rect = Bridge.get_method_bind("DisplayServer", "status_indicator_get_rect", 3327874267_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_status_indicator_get_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_delete_status_indicator : Void* = Pointer(Void).null
    def delete_status_indicator(id : Int64) : Void
      if @@mb_delete_status_indicator.null?
        @@mb_delete_status_indicator = Bridge.get_method_bind("DisplayServer", "delete_status_indicator", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_delete_status_indicator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_tablet_get_driver_count : Void* = Pointer(Void).null
    def tablet_get_driver_count() : Int64
      if @@mb_tablet_get_driver_count.null?
        @@mb_tablet_get_driver_count = Bridge.get_method_bind("DisplayServer", "tablet_get_driver_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_tablet_get_driver_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_tablet_get_driver_name : Void* = Pointer(Void).null
    def tablet_get_driver_name(idx : Int64) : String
      if @@mb_tablet_get_driver_name.null?
        @@mb_tablet_get_driver_name = Bridge.get_method_bind("DisplayServer", "tablet_get_driver_name", 844755477_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_tablet_get_current_driver : Void* = Pointer(Void).null
    def tablet_get_current_driver() : String
      if @@mb_tablet_get_current_driver.null?
        @@mb_tablet_get_current_driver = Bridge.get_method_bind("DisplayServer", "tablet_get_current_driver", 201670096_i64)
      end
      ""
    end
    @@mb_tablet_set_current_driver : Void* = Pointer(Void).null
    def tablet_set_current_driver(name : String) : Void
      if @@mb_tablet_set_current_driver.null?
        @@mb_tablet_set_current_driver = Bridge.get_method_bind("DisplayServer", "tablet_set_current_driver", 83702148_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_tablet_set_current_driver, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_window_transparency_available : Void* = Pointer(Void).null
    def is_window_transparency_available() : Bool
      if @@mb_is_window_transparency_available.null?
        @@mb_is_window_transparency_available = Bridge.get_method_bind("DisplayServer", "is_window_transparency_available", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_window_transparency_available, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_register_additional_output : Void* = Pointer(Void).null
    def register_additional_output(object : Godot::Object) : Void
      if @@mb_register_additional_output.null?
        @@mb_register_additional_output = Bridge.get_method_bind("DisplayServer", "register_additional_output", 3975164845_i64)
      end
      arg_ptr_0 = object ? object.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_register_additional_output, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_unregister_additional_output : Void* = Pointer(Void).null
    def unregister_additional_output(object : Godot::Object) : Void
      if @@mb_unregister_additional_output.null?
        @@mb_unregister_additional_output = Bridge.get_method_bind("DisplayServer", "unregister_additional_output", 3975164845_i64)
      end
      arg_ptr_0 = object ? object.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_unregister_additional_output, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_additional_outputs : Void* = Pointer(Void).null
    def has_additional_outputs() : Bool
      if @@mb_has_additional_outputs.null?
        @@mb_has_additional_outputs = Bridge.get_method_bind("DisplayServer", "has_additional_outputs", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_additional_outputs, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_in_pip_mode : Void* = Pointer(Void).null
    def is_in_pip_mode(window_id : Int64) : Bool
      if @@mb_is_in_pip_mode.null?
        @@mb_is_in_pip_mode = Bridge.get_method_bind("DisplayServer", "is_in_pip_mode", 1885608816_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_in_pip_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_pip_mode_enter : Void* = Pointer(Void).null
    def pip_mode_enter(window_id : Int64) : Void
      if @@mb_pip_mode_enter.null?
        @@mb_pip_mode_enter = Bridge.get_method_bind("DisplayServer", "pip_mode_enter", 1995695955_i64)
      end
      val_0 = window_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_pip_mode_enter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_pip_mode_set_aspect_ratio : Void* = Pointer(Void).null
    def pip_mode_set_aspect_ratio(numerator : Int64, denominator : Int64, window_id : Int64) : Void
      if @@mb_pip_mode_set_aspect_ratio.null?
        @@mb_pip_mode_set_aspect_ratio = Bridge.get_method_bind("DisplayServer", "pip_mode_set_aspect_ratio", 3471927553_i64)
      end
      val_0 = numerator
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = denominator
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = window_id
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_pip_mode_set_aspect_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_pip_mode_set_auto_enter_on_background : Void* = Pointer(Void).null
    def pip_mode_set_auto_enter_on_background(auto_enter_on_background : Bool, window_id : Int64) : Void
      if @@mb_pip_mode_set_auto_enter_on_background.null?
        @@mb_pip_mode_set_auto_enter_on_background = Bridge.get_method_bind("DisplayServer", "pip_mode_set_auto_enter_on_background", 1661950165_i64)
      end
      val_0 = auto_enter_on_background
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = window_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_pip_mode_set_auto_enter_on_background, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class RenderingServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum TextureType : Int64
      TextureType2d = 0_i64
      TextureTypeLayered = 1_i64
      TextureType3d = 2_i64
    end
    enum TextureLayeredType : Int64
      TextureLayered2dArray = 0_i64
      TextureLayeredCubemap = 1_i64
      TextureLayeredCubemapArray = 2_i64
    end
    enum CubeMapLayer : Int64
      CubemapLayerLeft = 0_i64
      CubemapLayerRight = 1_i64
      CubemapLayerBottom = 2_i64
      CubemapLayerTop = 3_i64
      CubemapLayerFront = 4_i64
      CubemapLayerBack = 5_i64
    end
    enum TextureDrawableFormat : Int64
      TextureDrawableFormatRgba8 = 0_i64
      TextureDrawableFormatRgba8Srgb = 1_i64
      TextureDrawableFormatRgbah = 2_i64
      TextureDrawableFormatRgbaf = 3_i64
    end
    enum ShaderMode : Int64
      ShaderSpatial = 0_i64
      ShaderCanvasItem = 1_i64
      ShaderParticles = 2_i64
      ShaderSky = 3_i64
      ShaderFog = 4_i64
      ShaderTextureBlit = 5_i64
      ShaderMax = 6_i64
    end
    enum ArrayType : Int64
      ArrayVertex = 0_i64
      ArrayNormal = 1_i64
      ArrayTangent = 2_i64
      ArrayColor = 3_i64
      ArrayTexUv = 4_i64
      ArrayTexUv2 = 5_i64
      ArrayCustom0 = 6_i64
      ArrayCustom1 = 7_i64
      ArrayCustom2 = 8_i64
      ArrayCustom3 = 9_i64
      ArrayBones = 10_i64
      ArrayWeights = 11_i64
      ArrayIndex = 12_i64
      ArrayMax = 13_i64
    end
    enum ArrayCustomFormat : Int64
      ArrayCustomRgba8Unorm = 0_i64
      ArrayCustomRgba8Snorm = 1_i64
      ArrayCustomRgHalf = 2_i64
      ArrayCustomRgbaHalf = 3_i64
      ArrayCustomRFloat = 4_i64
      ArrayCustomRgFloat = 5_i64
      ArrayCustomRgbFloat = 6_i64
      ArrayCustomRgbaFloat = 7_i64
      ArrayCustomMax = 8_i64
    end
    enum ArrayFormat : Int64
      ArrayFormatVertex = 1_i64
      ArrayFormatNormal = 2_i64
      ArrayFormatTangent = 4_i64
      ArrayFormatColor = 8_i64
      ArrayFormatTexUv = 16_i64
      ArrayFormatTexUv2 = 32_i64
      ArrayFormatCustom0 = 64_i64
      ArrayFormatCustom1 = 128_i64
      ArrayFormatCustom2 = 256_i64
      ArrayFormatCustom3 = 512_i64
      ArrayFormatBones = 1024_i64
      ArrayFormatWeights = 2048_i64
      ArrayFormatIndex = 4096_i64
      ArrayFormatBlendShapeMask = 7_i64
      ArrayFormatCustomBase = 13_i64
      ArrayFormatCustomBits = 3_i64
      ArrayFormatCustom0Shift = 13_i64
      ArrayFormatCustom1Shift = 16_i64
      ArrayFormatCustom2Shift = 19_i64
      ArrayFormatCustom3Shift = 22_i64
      ArrayFormatCustomMask = 7_i64
      ArrayCompressFlagsBase = 25_i64
      ArrayFlagUse2dVertices = 33554432_i64
      ArrayFlagUseDynamicUpdate = 67108864_i64
      ArrayFlagUse8BoneWeights = 134217728_i64
      ArrayFlagUsesEmptyVertexArray = 268435456_i64
      ArrayFlagCompressAttributes = 536870912_i64
      ArrayFlagUseStorageBuffer = 1073741824_i64
      ArrayFlagFormatVersionBase = 35_i64
      ArrayFlagFormatVersionShift = 35_i64
      ArrayFlagFormatVersion1 = 0_i64
      ArrayFlagFormatVersion2 = 34359738368_i64
      ArrayFlagFormatCurrentVersion = 34359738368_i64
      ArrayFlagFormatVersionMask = 255_i64
    end
    enum PrimitiveType : Int64
      PrimitivePoints = 0_i64
      PrimitiveLines = 1_i64
      PrimitiveLineStrip = 2_i64
      PrimitiveTriangles = 3_i64
      PrimitiveTriangleStrip = 4_i64
      PrimitiveMax = 5_i64
    end
    enum BlendShapeMode : Int64
      BlendShapeModeNormalized = 0_i64
      BlendShapeModeRelative = 1_i64
    end
    enum MultimeshTransformFormat : Int64
      MultimeshTransform2d = 0_i64
      MultimeshTransform3d = 1_i64
    end
    enum MultimeshPhysicsInterpolationQuality : Int64
      MultimeshInterpQualityFast = 0_i64
      MultimeshInterpQualityHigh = 1_i64
    end
    enum LightProjectorFilter : Int64
      LightProjectorFilterNearest = 0_i64
      LightProjectorFilterLinear = 1_i64
      LightProjectorFilterNearestMipmaps = 2_i64
      LightProjectorFilterLinearMipmaps = 3_i64
      LightProjectorFilterNearestMipmapsAnisotropic = 4_i64
      LightProjectorFilterLinearMipmapsAnisotropic = 5_i64
    end
    enum LightType : Int64
      LightDirectional = 0_i64
      LightOmni = 1_i64
      LightSpot = 2_i64
      LightArea = 3_i64
    end
    enum LightParam : Int64
      LightParamEnergy = 0_i64
      LightParamIndirectEnergy = 1_i64
      LightParamVolumetricFogEnergy = 2_i64
      LightParamSpecular = 3_i64
      LightParamRange = 4_i64
      LightParamSize = 5_i64
      LightParamAttenuation = 6_i64
      LightParamSpotAngle = 7_i64
      LightParamSpotAttenuation = 8_i64
      LightParamShadowMaxDistance = 9_i64
      LightParamShadowSplit1Offset = 10_i64
      LightParamShadowSplit2Offset = 11_i64
      LightParamShadowSplit3Offset = 12_i64
      LightParamShadowFadeStart = 13_i64
      LightParamShadowNormalBias = 14_i64
      LightParamShadowBias = 15_i64
      LightParamShadowPancakeSize = 16_i64
      LightParamShadowOpacity = 17_i64
      LightParamShadowBlur = 18_i64
      LightParamTransmittanceBias = 19_i64
      LightParamIntensity = 20_i64
      LightParamMax = 21_i64
    end
    enum LightBakeMode : Int64
      LightBakeDisabled = 0_i64
      LightBakeStatic = 1_i64
      LightBakeDynamic = 2_i64
    end
    enum LightOmniShadowMode : Int64
      LightOmniShadowDualParaboloid = 0_i64
      LightOmniShadowCube = 1_i64
    end
    enum LightDirectionalShadowMode : Int64
      LightDirectionalShadowOrthogonal = 0_i64
      LightDirectionalShadowParallel2Splits = 1_i64
      LightDirectionalShadowParallel4Splits = 2_i64
    end
    enum LightDirectionalSkyMode : Int64
      LightDirectionalSkyModeLightAndSky = 0_i64
      LightDirectionalSkyModeLightOnly = 1_i64
      LightDirectionalSkyModeSkyOnly = 2_i64
    end
    enum ShadowQuality : Int64
      ShadowQualityHard = 0_i64
      ShadowQualitySoftVeryLow = 1_i64
      ShadowQualitySoftLow = 2_i64
      ShadowQualitySoftMedium = 3_i64
      ShadowQualitySoftHigh = 4_i64
      ShadowQualitySoftUltra = 5_i64
      ShadowQualityMax = 6_i64
    end
    enum ReflectionProbeUpdateMode : Int64
      ReflectionProbeUpdateOnce = 0_i64
      ReflectionProbeUpdateAlways = 1_i64
    end
    enum ReflectionProbeAmbientMode : Int64
      ReflectionProbeAmbientDisabled = 0_i64
      ReflectionProbeAmbientEnvironment = 1_i64
      ReflectionProbeAmbientColor = 2_i64
    end
    enum DecalTexture : Int64
      DecalTextureAlbedo = 0_i64
      DecalTextureNormal = 1_i64
      DecalTextureOrm = 2_i64
      DecalTextureEmission = 3_i64
      DecalTextureMax = 4_i64
    end
    enum DecalFilter : Int64
      DecalFilterNearest = 0_i64
      DecalFilterLinear = 1_i64
      DecalFilterNearestMipmaps = 2_i64
      DecalFilterLinearMipmaps = 3_i64
      DecalFilterNearestMipmapsAnisotropic = 4_i64
      DecalFilterLinearMipmapsAnisotropic = 5_i64
    end
    enum VoxelGIQuality : Int64
      VoxelGiQualityLow = 0_i64
      VoxelGiQualityHigh = 1_i64
    end
    enum ParticlesMode : Int64
      ParticlesMode2d = 0_i64
      ParticlesMode3d = 1_i64
    end
    enum ParticlesTransformAlign : Int64
      ParticlesTransformAlignDisabled = 0_i64
      ParticlesTransformAlignZBillboard = 1_i64
      ParticlesTransformAlignYToVelocity = 2_i64
      ParticlesTransformAlignZBillboardYToVelocity = 3_i64
      ParticlesTransformAlignLocalBillboard = 4_i64
    end
    enum ParticlesTransformAlignCustomSrc : Int64
      ParticlesAlignChannelFilterDisabled = 0_i64
      ParticlesAlignChannelFilterX = 1_i64
      ParticlesAlignChannelFilterY = 2_i64
      ParticlesAlignChannelFilterZ = 3_i64
      ParticlesAlignChannelFilterW = 4_i64
    end
    enum ParticlesTransformAlignAxis : Int64
      ParticlesAlignAxisX = 0_i64
      ParticlesAlignAxisY = 1_i64
    end
    enum ParticlesDrawOrder : Int64
      ParticlesDrawOrderIndex = 0_i64
      ParticlesDrawOrderLifetime = 1_i64
      ParticlesDrawOrderReverseLifetime = 2_i64
      ParticlesDrawOrderViewDepth = 3_i64
    end
    enum ParticlesCollisionType : Int64
      ParticlesCollisionTypeSphereAttract = 0_i64
      ParticlesCollisionTypeBoxAttract = 1_i64
      ParticlesCollisionTypeVectorFieldAttract = 2_i64
      ParticlesCollisionTypeSphereCollide = 3_i64
      ParticlesCollisionTypeBoxCollide = 4_i64
      ParticlesCollisionTypeSdfCollide = 5_i64
      ParticlesCollisionTypeHeightfieldCollide = 6_i64
    end
    enum ParticlesCollisionHeightfieldResolution : Int64
      ParticlesCollisionHeightfieldResolution256 = 0_i64
      ParticlesCollisionHeightfieldResolution512 = 1_i64
      ParticlesCollisionHeightfieldResolution1024 = 2_i64
      ParticlesCollisionHeightfieldResolution2048 = 3_i64
      ParticlesCollisionHeightfieldResolution4096 = 4_i64
      ParticlesCollisionHeightfieldResolution8192 = 5_i64
      ParticlesCollisionHeightfieldResolutionMax = 6_i64
    end
    enum FogVolumeShape : Int64
      FogVolumeShapeEllipsoid = 0_i64
      FogVolumeShapeCone = 1_i64
      FogVolumeShapeCylinder = 2_i64
      FogVolumeShapeBox = 3_i64
      FogVolumeShapeWorld = 4_i64
      FogVolumeShapeMax = 5_i64
    end
    enum ViewportScaling3DMode : Int64
      ViewportScaling3dModeBilinear = 0_i64
      ViewportScaling3dModeFsr = 1_i64
      ViewportScaling3dModeFsr2 = 2_i64
      ViewportScaling3dModeMetalfxSpatial = 3_i64
      ViewportScaling3dModeMetalfxTemporal = 4_i64
      ViewportScaling3dModeNearest = 5_i64
      ViewportScaling3dModeMax = 6_i64
    end
    enum ViewportUpdateMode : Int64
      ViewportUpdateDisabled = 0_i64
      ViewportUpdateOnce = 1_i64
      ViewportUpdateWhenVisible = 2_i64
      ViewportUpdateWhenParentVisible = 3_i64
      ViewportUpdateAlways = 4_i64
    end
    enum ViewportClearMode : Int64
      ViewportClearAlways = 0_i64
      ViewportClearNever = 1_i64
      ViewportClearOnlyNextFrame = 2_i64
    end
    enum ViewportEnvironmentMode : Int64
      ViewportEnvironmentDisabled = 0_i64
      ViewportEnvironmentEnabled = 1_i64
      ViewportEnvironmentInherit = 2_i64
      ViewportEnvironmentMax = 3_i64
    end
    enum ViewportSDFOversize : Int64
      ViewportSdfOversize100Percent = 0_i64
      ViewportSdfOversize120Percent = 1_i64
      ViewportSdfOversize150Percent = 2_i64
      ViewportSdfOversize200Percent = 3_i64
      ViewportSdfOversizeMax = 4_i64
    end
    enum ViewportSDFScale : Int64
      ViewportSdfScale100Percent = 0_i64
      ViewportSdfScale50Percent = 1_i64
      ViewportSdfScale25Percent = 2_i64
      ViewportSdfScaleMax = 3_i64
    end
    enum ViewportMSAA : Int64
      ViewportMsaaDisabled = 0_i64
      ViewportMsaa2x = 1_i64
      ViewportMsaa4x = 2_i64
      ViewportMsaa8x = 3_i64
      ViewportMsaaMax = 4_i64
    end
    enum ViewportAnisotropicFiltering : Int64
      ViewportAnisotropyDisabled = 0_i64
      ViewportAnisotropy2x = 1_i64
      ViewportAnisotropy4x = 2_i64
      ViewportAnisotropy8x = 3_i64
      ViewportAnisotropy16x = 4_i64
      ViewportAnisotropyMax = 5_i64
    end
    enum ViewportScreenSpaceAA : Int64
      ViewportScreenSpaceAaDisabled = 0_i64
      ViewportScreenSpaceAaFxaa = 1_i64
      ViewportScreenSpaceAaSmaa = 2_i64
      ViewportScreenSpaceAaMax = 3_i64
    end
    enum ViewportOcclusionCullingBuildQuality : Int64
      ViewportOcclusionBuildQualityLow = 0_i64
      ViewportOcclusionBuildQualityMedium = 1_i64
      ViewportOcclusionBuildQualityHigh = 2_i64
    end
    enum ViewportRenderInfo : Int64
      ViewportRenderInfoObjectsInFrame = 0_i64
      ViewportRenderInfoPrimitivesInFrame = 1_i64
      ViewportRenderInfoDrawCallsInFrame = 2_i64
      ViewportRenderInfoMax = 3_i64
    end
    enum ViewportRenderInfoType : Int64
      ViewportRenderInfoTypeVisible = 0_i64
      ViewportRenderInfoTypeShadow = 1_i64
      ViewportRenderInfoTypeCanvas = 2_i64
      ViewportRenderInfoTypeMax = 3_i64
    end
    enum ViewportDebugDraw : Int64
      ViewportDebugDrawDisabled = 0_i64
      ViewportDebugDrawUnshaded = 1_i64
      ViewportDebugDrawLighting = 2_i64
      ViewportDebugDrawOverdraw = 3_i64
      ViewportDebugDrawWireframe = 4_i64
      ViewportDebugDrawNormalBuffer = 5_i64
      ViewportDebugDrawVoxelGiAlbedo = 6_i64
      ViewportDebugDrawVoxelGiLighting = 7_i64
      ViewportDebugDrawVoxelGiEmission = 8_i64
      ViewportDebugDrawShadowAtlas = 9_i64
      ViewportDebugDrawDirectionalShadowAtlas = 10_i64
      ViewportDebugDrawSceneLuminance = 11_i64
      ViewportDebugDrawSsao = 12_i64
      ViewportDebugDrawSsil = 13_i64
      ViewportDebugDrawPssmSplits = 14_i64
      ViewportDebugDrawDecalAtlas = 15_i64
      ViewportDebugDrawSdfgi = 16_i64
      ViewportDebugDrawSdfgiProbes = 17_i64
      ViewportDebugDrawGiBuffer = 18_i64
      ViewportDebugDrawDisableLod = 19_i64
      ViewportDebugDrawClusterOmniLights = 20_i64
      ViewportDebugDrawClusterSpotLights = 21_i64
      ViewportDebugDrawClusterDecals = 22_i64
      ViewportDebugDrawClusterReflectionProbes = 23_i64
      ViewportDebugDrawOccluders = 24_i64
      ViewportDebugDrawMotionVectors = 25_i64
      ViewportDebugDrawInternalBuffer = 26_i64
    end
    enum ViewportVRSMode : Int64
      ViewportVrsDisabled = 0_i64
      ViewportVrsTexture = 1_i64
      ViewportVrsXr = 2_i64
      ViewportVrsMax = 3_i64
    end
    enum ViewportVRSUpdateMode : Int64
      ViewportVrsUpdateDisabled = 0_i64
      ViewportVrsUpdateOnce = 1_i64
      ViewportVrsUpdateAlways = 2_i64
      ViewportVrsUpdateMax = 3_i64
    end
    enum SkyMode : Int64
      SkyModeAutomatic = 0_i64
      SkyModeQuality = 1_i64
      SkyModeIncremental = 2_i64
      SkyModeRealtime = 3_i64
    end
    enum CompositorEffectFlags : Int64
      CompositorEffectFlagAccessResolvedColor = 1_i64
      CompositorEffectFlagAccessResolvedDepth = 2_i64
      CompositorEffectFlagNeedsMotionVectors = 4_i64
      CompositorEffectFlagNeedsRoughness = 8_i64
      CompositorEffectFlagNeedsSeparateSpecular = 16_i64
    end
    enum CompositorEffectCallbackType : Int64
      CompositorEffectCallbackTypePreOpaque = 0_i64
      CompositorEffectCallbackTypePostOpaque = 1_i64
      CompositorEffectCallbackTypePostSky = 2_i64
      CompositorEffectCallbackTypePreTransparent = 3_i64
      CompositorEffectCallbackTypePostTransparent = 4_i64
      CompositorEffectCallbackTypeAny = -1_i64
    end
    enum EnvironmentBG : Int64
      EnvBgClearColor = 0_i64
      EnvBgColor = 1_i64
      EnvBgSky = 2_i64
      EnvBgCanvas = 3_i64
      EnvBgKeep = 4_i64
      EnvBgCameraFeed = 5_i64
      EnvBgMax = 6_i64
    end
    enum EnvironmentAmbientSource : Int64
      EnvAmbientSourceBg = 0_i64
      EnvAmbientSourceDisabled = 1_i64
      EnvAmbientSourceColor = 2_i64
      EnvAmbientSourceSky = 3_i64
    end
    enum EnvironmentReflectionSource : Int64
      EnvReflectionSourceBg = 0_i64
      EnvReflectionSourceDisabled = 1_i64
      EnvReflectionSourceSky = 2_i64
    end
    enum EnvironmentGlowBlendMode : Int64
      EnvGlowBlendModeAdditive = 0_i64
      EnvGlowBlendModeScreen = 1_i64
      EnvGlowBlendModeSoftlight = 2_i64
      EnvGlowBlendModeReplace = 3_i64
      EnvGlowBlendModeMix = 4_i64
    end
    enum EnvironmentFogMode : Int64
      EnvFogModeExponential = 0_i64
      EnvFogModeDepth = 1_i64
    end
    enum EnvironmentToneMapper : Int64
      EnvToneMapperLinear = 0_i64
      EnvToneMapperReinhard = 1_i64
      EnvToneMapperFilmic = 2_i64
      EnvToneMapperAces = 3_i64
      EnvToneMapperAgx = 4_i64
    end
    enum EnvironmentSSRRoughnessQuality : Int64
      EnvSsrRoughnessQualityDisabled = 0_i64
      EnvSsrRoughnessQualityLow = 1_i64
      EnvSsrRoughnessQualityMedium = 2_i64
      EnvSsrRoughnessQualityHigh = 3_i64
    end
    enum EnvironmentSSAOQuality : Int64
      EnvSsaoQualityVeryLow = 0_i64
      EnvSsaoQualityLow = 1_i64
      EnvSsaoQualityMedium = 2_i64
      EnvSsaoQualityHigh = 3_i64
      EnvSsaoQualityUltra = 4_i64
    end
    enum EnvironmentSSILQuality : Int64
      EnvSsilQualityVeryLow = 0_i64
      EnvSsilQualityLow = 1_i64
      EnvSsilQualityMedium = 2_i64
      EnvSsilQualityHigh = 3_i64
      EnvSsilQualityUltra = 4_i64
    end
    enum EnvironmentSDFGIYScale : Int64
      EnvSdfgiYScale50Percent = 0_i64
      EnvSdfgiYScale75Percent = 1_i64
      EnvSdfgiYScale100Percent = 2_i64
    end
    enum EnvironmentSDFGIRayCount : Int64
      EnvSdfgiRayCount4 = 0_i64
      EnvSdfgiRayCount8 = 1_i64
      EnvSdfgiRayCount16 = 2_i64
      EnvSdfgiRayCount32 = 3_i64
      EnvSdfgiRayCount64 = 4_i64
      EnvSdfgiRayCount96 = 5_i64
      EnvSdfgiRayCount128 = 6_i64
      EnvSdfgiRayCountMax = 7_i64
    end
    enum EnvironmentSDFGIFramesToConverge : Int64
      EnvSdfgiConvergeIn5Frames = 0_i64
      EnvSdfgiConvergeIn10Frames = 1_i64
      EnvSdfgiConvergeIn15Frames = 2_i64
      EnvSdfgiConvergeIn20Frames = 3_i64
      EnvSdfgiConvergeIn25Frames = 4_i64
      EnvSdfgiConvergeIn30Frames = 5_i64
      EnvSdfgiConvergeMax = 6_i64
    end
    enum EnvironmentSDFGIFramesToUpdateLight : Int64
      EnvSdfgiUpdateLightIn1Frame = 0_i64
      EnvSdfgiUpdateLightIn2Frames = 1_i64
      EnvSdfgiUpdateLightIn4Frames = 2_i64
      EnvSdfgiUpdateLightIn8Frames = 3_i64
      EnvSdfgiUpdateLightIn16Frames = 4_i64
      EnvSdfgiUpdateLightMax = 5_i64
    end
    enum SubSurfaceScatteringQuality : Int64
      SubSurfaceScatteringQualityDisabled = 0_i64
      SubSurfaceScatteringQualityLow = 1_i64
      SubSurfaceScatteringQualityMedium = 2_i64
      SubSurfaceScatteringQualityHigh = 3_i64
    end
    enum DOFBokehShape : Int64
      DofBokehBox = 0_i64
      DofBokehHexagon = 1_i64
      DofBokehCircle = 2_i64
    end
    enum DOFBlurQuality : Int64
      DofBlurQualityVeryLow = 0_i64
      DofBlurQualityLow = 1_i64
      DofBlurQualityMedium = 2_i64
      DofBlurQualityHigh = 3_i64
    end
    enum InstanceType : Int64
      InstanceNone = 0_i64
      InstanceMesh = 1_i64
      InstanceMultimesh = 2_i64
      InstanceParticles = 3_i64
      InstanceParticlesCollision = 4_i64
      InstanceLight = 5_i64
      InstanceReflectionProbe = 6_i64
      InstanceDecal = 7_i64
      InstanceVoxelGi = 8_i64
      InstanceLightmap = 9_i64
      InstanceOccluder = 10_i64
      InstanceVisiblityNotifier = 11_i64
      InstanceFogVolume = 12_i64
      InstanceMax = 13_i64
      InstanceGeometryMask = 14_i64
    end
    enum InstanceFlags : Int64
      InstanceFlagUseBakedLight = 0_i64
      InstanceFlagUseDynamicGi = 1_i64
      InstanceFlagDrawNextFrameIfVisible = 2_i64
      InstanceFlagIgnoreOcclusionCulling = 3_i64
      InstanceFlagMax = 4_i64
    end
    enum ShadowCastingSetting : Int64
      ShadowCastingSettingOff = 0_i64
      ShadowCastingSettingOn = 1_i64
      ShadowCastingSettingDoubleSided = 2_i64
      ShadowCastingSettingShadowsOnly = 3_i64
    end
    enum VisibilityRangeFadeMode : Int64
      VisibilityRangeFadeDisabled = 0_i64
      VisibilityRangeFadeSelf = 1_i64
      VisibilityRangeFadeDependencies = 2_i64
    end
    enum BakeChannels : Int64
      BakeChannelAlbedoAlpha = 0_i64
      BakeChannelNormal = 1_i64
      BakeChannelOrm = 2_i64
      BakeChannelEmission = 3_i64
    end
    enum CanvasTextureChannel : Int64
      CanvasTextureChannelDiffuse = 0_i64
      CanvasTextureChannelNormal = 1_i64
      CanvasTextureChannelSpecular = 2_i64
    end
    enum NinePatchAxisMode : Int64
      NinePatchStretch = 0_i64
      NinePatchTile = 1_i64
      NinePatchTileFit = 2_i64
    end
    enum CanvasItemTextureFilter : Int64
      CanvasItemTextureFilterDefault = 0_i64
      CanvasItemTextureFilterNearest = 1_i64
      CanvasItemTextureFilterLinear = 2_i64
      CanvasItemTextureFilterNearestWithMipmaps = 3_i64
      CanvasItemTextureFilterLinearWithMipmaps = 4_i64
      CanvasItemTextureFilterNearestWithMipmapsAnisotropic = 5_i64
      CanvasItemTextureFilterLinearWithMipmapsAnisotropic = 6_i64
      CanvasItemTextureFilterMax = 7_i64
    end
    enum CanvasItemTextureRepeat : Int64
      CanvasItemTextureRepeatDefault = 0_i64
      CanvasItemTextureRepeatDisabled = 1_i64
      CanvasItemTextureRepeatEnabled = 2_i64
      CanvasItemTextureRepeatMirror = 3_i64
      CanvasItemTextureRepeatMax = 4_i64
    end
    enum CanvasGroupMode : Int64
      CanvasGroupModeDisabled = 0_i64
      CanvasGroupModeClipOnly = 1_i64
      CanvasGroupModeClipAndDraw = 2_i64
      CanvasGroupModeTransparent = 3_i64
    end
    enum CanvasLightMode : Int64
      CanvasLightModePoint = 0_i64
      CanvasLightModeDirectional = 1_i64
    end
    enum CanvasLightBlendMode : Int64
      CanvasLightBlendModeAdd = 0_i64
      CanvasLightBlendModeSub = 1_i64
      CanvasLightBlendModeMix = 2_i64
    end
    enum CanvasLightShadowFilter : Int64
      CanvasLightFilterNone = 0_i64
      CanvasLightFilterPcf5 = 1_i64
      CanvasLightFilterPcf13 = 2_i64
      CanvasLightFilterMax = 3_i64
    end
    enum CanvasOccluderPolygonCullMode : Int64
      CanvasOccluderPolygonCullDisabled = 0_i64
      CanvasOccluderPolygonCullClockwise = 1_i64
      CanvasOccluderPolygonCullCounterClockwise = 2_i64
    end
    enum GlobalShaderParameterType : Int64
      GlobalVarTypeBool = 0_i64
      GlobalVarTypeBvec2 = 1_i64
      GlobalVarTypeBvec3 = 2_i64
      GlobalVarTypeBvec4 = 3_i64
      GlobalVarTypeInt = 4_i64
      GlobalVarTypeIvec2 = 5_i64
      GlobalVarTypeIvec3 = 6_i64
      GlobalVarTypeIvec4 = 7_i64
      GlobalVarTypeRect2i = 8_i64
      GlobalVarTypeUint = 9_i64
      GlobalVarTypeUvec2 = 10_i64
      GlobalVarTypeUvec3 = 11_i64
      GlobalVarTypeUvec4 = 12_i64
      GlobalVarTypeFloat = 13_i64
      GlobalVarTypeVec2 = 14_i64
      GlobalVarTypeVec3 = 15_i64
      GlobalVarTypeVec4 = 16_i64
      GlobalVarTypeColor = 17_i64
      GlobalVarTypeRect2 = 18_i64
      GlobalVarTypeMat2 = 19_i64
      GlobalVarTypeMat3 = 20_i64
      GlobalVarTypeMat4 = 21_i64
      GlobalVarTypeTransform2d = 22_i64
      GlobalVarTypeTransform = 23_i64
      GlobalVarTypeSampler2d = 24_i64
      GlobalVarTypeSampler2darray = 25_i64
      GlobalVarTypeSampler3d = 26_i64
      GlobalVarTypeSamplercube = 27_i64
      GlobalVarTypeSamplerext = 28_i64
      GlobalVarTypeMax = 29_i64
    end
    enum RenderingInfo : Int64
      RenderingInfoTotalObjectsInFrame = 0_i64
      RenderingInfoTotalPrimitivesInFrame = 1_i64
      RenderingInfoTotalDrawCallsInFrame = 2_i64
      RenderingInfoTextureMemUsed = 3_i64
      RenderingInfoBufferMemUsed = 4_i64
      RenderingInfoVideoMemUsed = 5_i64
      RenderingInfoPipelineCompilationsCanvas = 6_i64
      RenderingInfoPipelineCompilationsMesh = 7_i64
      RenderingInfoPipelineCompilationsSurface = 8_i64
      RenderingInfoPipelineCompilationsDraw = 9_i64
      RenderingInfoPipelineCompilationsSpecialization = 10_i64
    end
    enum PipelineSource : Int64
      PipelineSourceCanvas = 0_i64
      PipelineSourceMesh = 1_i64
      PipelineSourceSurface = 2_i64
      PipelineSourceDraw = 3_i64
      PipelineSourceSpecialization = 4_i64
      PipelineSourceMax = 5_i64
    end
    enum SplashStretchMode : Int64
      SplashStretchModeDisabled = 0_i64
      SplashStretchModeKeep = 1_i64
      SplashStretchModeKeepWidth = 2_i64
      SplashStretchModeKeepHeight = 3_i64
      SplashStretchModeCover = 4_i64
      SplashStretchModeIgnore = 5_i64
    end
    enum Features : Int64
      FeatureShaders = 0_i64
      FeatureMultithreaded = 1_i64
    end
    @@mb_texture_2d_create : Void* = Pointer(Void).null
    def texture_2d_create(image : Image) : Int64
      if @@mb_texture_2d_create.null?
        @@mb_texture_2d_create = Bridge.get_method_bind("RenderingServer", "texture_2d_create", 2010018390_i64)
      end
      val_0 = image
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_2d_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_2d_layered_create : Void* = Pointer(Void).null
    def texture_2d_layered_create(layers : Godot::Array, layered_type : Int64) : Int64
      if @@mb_texture_2d_layered_create.null?
        @@mb_texture_2d_layered_create = Bridge.get_method_bind("RenderingServer", "texture_2d_layered_create", 913689023_i64)
      end
      arg_ptr_0 = layers ? layers.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = layered_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_2d_layered_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_3d_create : Void* = Pointer(Void).null
    def texture_3d_create(format : Int64, width : Int64, height : Int64, depth : Int64, mipmaps : Bool, data : Godot::Array) : Int64
      if @@mb_texture_3d_create.null?
        @@mb_texture_3d_create = Bridge.get_method_bind("RenderingServer", "texture_3d_create", 4036838706_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = height
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = depth
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = mipmaps
      arg_4 = pointerof(val_4).as(Void*)
      arg_ptr_5 = data ? data.pointer : Pointer(Void).null
      arg_5 = pointerof(arg_ptr_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_3d_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_proxy_create : Void* = Pointer(Void).null
    def texture_proxy_create(base : Int64) : Int64
      if @@mb_texture_proxy_create.null?
        @@mb_texture_proxy_create = Bridge.get_method_bind("RenderingServer", "texture_proxy_create", 41030802_i64)
      end
      val_0 = base
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_proxy_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_create_from_native_handle : Void* = Pointer(Void).null
    def texture_create_from_native_handle(get_type : Int64, format : Int64, native_handle : Int64, width : Int64, height : Int64, depth : Int64, layers : Int64, layered_type : Int64) : Int64
      if @@mb_texture_create_from_native_handle.null?
        @@mb_texture_create_from_native_handle = Bridge.get_method_bind("RenderingServer", "texture_create_from_native_handle", 1682977582_i64)
      end
      val_0 = get_type
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = format
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = native_handle
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = width
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = height
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = depth
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = layers
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = layered_type
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_create_from_native_handle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_drawable_create : Void* = Pointer(Void).null
    def texture_drawable_create(width : Int64, height : Int64, format : Int64, color : Color, with_mipmaps : Bool) : Int64
      if @@mb_texture_drawable_create.null?
        @@mb_texture_drawable_create = Bridge.get_method_bind("RenderingServer", "texture_drawable_create", 1993613667_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = height
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = format
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = color
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = with_mipmaps
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_drawable_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_2d_update : Void* = Pointer(Void).null
    def texture_2d_update(texture : Int64, image : Image, layer : Int64) : Void
      if @@mb_texture_2d_update.null?
        @@mb_texture_2d_update = Bridge.get_method_bind("RenderingServer", "texture_2d_update", 999539803_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = image
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = layer
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_texture_2d_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_3d_update : Void* = Pointer(Void).null
    def texture_3d_update(texture : Int64, data : Godot::Array) : Void
      if @@mb_texture_3d_update.null?
        @@mb_texture_3d_update = Bridge.get_method_bind("RenderingServer", "texture_3d_update", 684822712_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = data ? data.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_texture_3d_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_proxy_update : Void* = Pointer(Void).null
    def texture_proxy_update(texture : Int64, proxy_to : Int64) : Void
      if @@mb_texture_proxy_update.null?
        @@mb_texture_proxy_update = Bridge.get_method_bind("RenderingServer", "texture_proxy_update", 395945892_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = proxy_to
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_texture_proxy_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_drawable_blit_rect : Void* = Pointer(Void).null
    def texture_drawable_blit_rect(textures : Godot::Array, rect : Rect2i, material : Int64, modulate : Color, source_textures : Godot::Array, to_mipmap : Int64) : Void
      if @@mb_texture_drawable_blit_rect.null?
        @@mb_texture_drawable_blit_rect = Bridge.get_method_bind("RenderingServer", "texture_drawable_blit_rect", 4077763890_i64)
      end
      arg_ptr_0 = textures ? textures.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = material
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = modulate
      arg_3 = pointerof(val_3).as(Void*)
      arg_ptr_4 = source_textures ? source_textures.pointer : Pointer(Void).null
      arg_4 = pointerof(arg_ptr_4).as(Void*)
      val_5 = to_mipmap
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_texture_drawable_blit_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_2d_placeholder_create : Void* = Pointer(Void).null
    def texture_2d_placeholder_create() : Int64
      if @@mb_texture_2d_placeholder_create.null?
        @@mb_texture_2d_placeholder_create = Bridge.get_method_bind("RenderingServer", "texture_2d_placeholder_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_2d_placeholder_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_2d_layered_placeholder_create : Void* = Pointer(Void).null
    def texture_2d_layered_placeholder_create(layered_type : Int64) : Int64
      if @@mb_texture_2d_layered_placeholder_create.null?
        @@mb_texture_2d_layered_placeholder_create = Bridge.get_method_bind("RenderingServer", "texture_2d_layered_placeholder_create", 1394585590_i64)
      end
      val_0 = layered_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_2d_layered_placeholder_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_3d_placeholder_create : Void* = Pointer(Void).null
    def texture_3d_placeholder_create() : Int64
      if @@mb_texture_3d_placeholder_create.null?
        @@mb_texture_3d_placeholder_create = Bridge.get_method_bind("RenderingServer", "texture_3d_placeholder_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_3d_placeholder_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_2d_get : Void* = Pointer(Void).null
    def texture_2d_get(texture : Int64) : Image
      if @@mb_texture_2d_get.null?
        @@mb_texture_2d_get = Bridge.get_method_bind("RenderingServer", "texture_2d_get", 4206205781_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_texture_2d_get, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_texture_2d_layer_get : Void* = Pointer(Void).null
    def texture_2d_layer_get(texture : Int64, layer : Int64) : Image
      if @@mb_texture_2d_layer_get.null?
        @@mb_texture_2d_layer_get = Bridge.get_method_bind("RenderingServer", "texture_2d_layer_get", 2705440895_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layer
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_texture_2d_layer_get, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_texture_3d_get : Void* = Pointer(Void).null
    def texture_3d_get(texture : Int64) : Godot::Array
      if @@mb_texture_3d_get.null?
        @@mb_texture_3d_get = Bridge.get_method_bind("RenderingServer", "texture_3d_get", 2684255073_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_texture_3d_get, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_texture_drawable_generate_mipmaps : Void* = Pointer(Void).null
    def texture_drawable_generate_mipmaps(texture : Int64) : Void
      if @@mb_texture_drawable_generate_mipmaps.null?
        @@mb_texture_drawable_generate_mipmaps = Bridge.get_method_bind("RenderingServer", "texture_drawable_generate_mipmaps", 2722037293_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_texture_drawable_generate_mipmaps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_drawable_get_default_material : Void* = Pointer(Void).null
    def texture_drawable_get_default_material() : Int64
      if @@mb_texture_drawable_get_default_material.null?
        @@mb_texture_drawable_get_default_material = Bridge.get_method_bind("RenderingServer", "texture_drawable_get_default_material", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_drawable_get_default_material, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_replace : Void* = Pointer(Void).null
    def texture_replace(texture : Int64, by_texture : Int64) : Void
      if @@mb_texture_replace.null?
        @@mb_texture_replace = Bridge.get_method_bind("RenderingServer", "texture_replace", 395945892_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = by_texture
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_texture_replace, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_set_size_override : Void* = Pointer(Void).null
    def texture_set_size_override(texture : Int64, width : Int64, height : Int64) : Void
      if @@mb_texture_set_size_override.null?
        @@mb_texture_set_size_override = Bridge.get_method_bind("RenderingServer", "texture_set_size_override", 4288446313_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = height
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_texture_set_size_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_set_path : Void* = Pointer(Void).null
    def texture_set_path(texture : Int64, path : String) : Void
      if @@mb_texture_set_path.null?
        @@mb_texture_set_path = Bridge.get_method_bind("RenderingServer", "texture_set_path", 2726140452_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = path
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_texture_set_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_get_path : Void* = Pointer(Void).null
    def texture_get_path(texture : Int64) : String
      if @@mb_texture_get_path.null?
        @@mb_texture_get_path = Bridge.get_method_bind("RenderingServer", "texture_get_path", 642473191_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_texture_get_format : Void* = Pointer(Void).null
    def texture_get_format(texture : Int64) : Int64
      if @@mb_texture_get_format.null?
        @@mb_texture_get_format = Bridge.get_method_bind("RenderingServer", "texture_get_format", 1932918979_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_get_format, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_set_force_redraw_if_visible : Void* = Pointer(Void).null
    def texture_set_force_redraw_if_visible(texture : Int64, enable : Bool) : Void
      if @@mb_texture_set_force_redraw_if_visible.null?
        @@mb_texture_set_force_redraw_if_visible = Bridge.get_method_bind("RenderingServer", "texture_set_force_redraw_if_visible", 1265174801_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_texture_set_force_redraw_if_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_texture_rd_create : Void* = Pointer(Void).null
    def texture_rd_create(rd_texture : Int64, layer_type : Int64) : Int64
      if @@mb_texture_rd_create.null?
        @@mb_texture_rd_create = Bridge.get_method_bind("RenderingServer", "texture_rd_create", 1434128712_i64)
      end
      val_0 = rd_texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layer_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_rd_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_get_rd_texture : Void* = Pointer(Void).null
    def texture_get_rd_texture(texture : Int64, srgb : Bool) : Int64
      if @@mb_texture_get_rd_texture.null?
        @@mb_texture_get_rd_texture = Bridge.get_method_bind("RenderingServer", "texture_get_rd_texture", 2790148051_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = srgb
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_get_rd_texture, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_texture_get_native_handle : Void* = Pointer(Void).null
    def texture_get_native_handle(texture : Int64, srgb : Bool) : Int64
      if @@mb_texture_get_native_handle.null?
        @@mb_texture_get_native_handle = Bridge.get_method_bind("RenderingServer", "texture_get_native_handle", 1834114100_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = srgb
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_texture_get_native_handle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shader_create : Void* = Pointer(Void).null
    def shader_create() : Int64
      if @@mb_shader_create.null?
        @@mb_shader_create = Bridge.get_method_bind("RenderingServer", "shader_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_shader_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_shader_set_code : Void* = Pointer(Void).null
    def shader_set_code(shader : Int64, code : String) : Void
      if @@mb_shader_set_code.null?
        @@mb_shader_set_code = Bridge.get_method_bind("RenderingServer", "shader_set_code", 2726140452_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = code
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shader_set_code, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shader_set_path_hint : Void* = Pointer(Void).null
    def shader_set_path_hint(shader : Int64, path : String) : Void
      if @@mb_shader_set_path_hint.null?
        @@mb_shader_set_path_hint = Bridge.get_method_bind("RenderingServer", "shader_set_path_hint", 2726140452_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = path
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shader_set_path_hint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shader_get_code : Void* = Pointer(Void).null
    def shader_get_code(shader : Int64) : String
      if @@mb_shader_get_code.null?
        @@mb_shader_get_code = Bridge.get_method_bind("RenderingServer", "shader_get_code", 642473191_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_shader_parameter_list : Void* = Pointer(Void).null
    def get_shader_parameter_list(shader : Int64) : Godot::Array
      if @@mb_get_shader_parameter_list.null?
        @@mb_get_shader_parameter_list = Bridge.get_method_bind("RenderingServer", "get_shader_parameter_list", 2684255073_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_shader_parameter_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_shader_get_parameter_default : Void* = Pointer(Void).null
    def shader_get_parameter_default(shader : Int64, name : String) : Void*
      if @@mb_shader_get_parameter_default.null?
        @@mb_shader_get_parameter_default = Bridge.get_method_bind("RenderingServer", "shader_get_parameter_default", 2621281810_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shader_get_parameter_default, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shader_set_default_texture_parameter : Void* = Pointer(Void).null
    def shader_set_default_texture_parameter(shader : Int64, name : String, texture : Int64, index : Int64) : Void
      if @@mb_shader_set_default_texture_parameter.null?
        @@mb_shader_set_default_texture_parameter = Bridge.get_method_bind("RenderingServer", "shader_set_default_texture_parameter", 4094001817_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = index
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_shader_set_default_texture_parameter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shader_get_default_texture_parameter : Void* = Pointer(Void).null
    def shader_get_default_texture_parameter(shader : Int64, name : String, index : Int64) : Int64
      if @@mb_shader_get_default_texture_parameter.null?
        @@mb_shader_get_default_texture_parameter = Bridge.get_method_bind("RenderingServer", "shader_get_default_texture_parameter", 1464608890_i64)
      end
      val_0 = shader
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shader_get_default_texture_parameter, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_material_create : Void* = Pointer(Void).null
    def material_create() : Int64
      if @@mb_material_create.null?
        @@mb_material_create = Bridge.get_method_bind("RenderingServer", "material_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_material_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_material_set_shader : Void* = Pointer(Void).null
    def material_set_shader(shader_material : Int64, shader : Int64) : Void
      if @@mb_material_set_shader.null?
        @@mb_material_set_shader = Bridge.get_method_bind("RenderingServer", "material_set_shader", 395945892_i64)
      end
      val_0 = shader_material
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shader
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_material_set_shader, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_material_set_param : Void* = Pointer(Void).null
    def material_set_param(material : Int64, parameter : String, value : Void*) : Void
      if @@mb_material_set_param.null?
        @@mb_material_set_param = Bridge.get_method_bind("RenderingServer", "material_set_param", 3477296213_i64)
      end
      val_0 = material
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_material_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_material_get_param : Void* = Pointer(Void).null
    def material_get_param(material : Int64, parameter : String) : Void*
      if @@mb_material_get_param.null?
        @@mb_material_get_param = Bridge.get_method_bind("RenderingServer", "material_get_param", 2621281810_i64)
      end
      val_0 = material
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_material_get_param, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_material_set_render_priority : Void* = Pointer(Void).null
    def material_set_render_priority(material : Int64, priority : Int64) : Void
      if @@mb_material_set_render_priority.null?
        @@mb_material_set_render_priority = Bridge.get_method_bind("RenderingServer", "material_set_render_priority", 3411492887_i64)
      end
      val_0 = material
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = priority
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_material_set_render_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_material_set_next_pass : Void* = Pointer(Void).null
    def material_set_next_pass(material : Int64, next_material : Int64) : Void
      if @@mb_material_set_next_pass.null?
        @@mb_material_set_next_pass = Bridge.get_method_bind("RenderingServer", "material_set_next_pass", 395945892_i64)
      end
      val_0 = material
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = next_material
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_material_set_next_pass, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_material_set_use_debanding : Void* = Pointer(Void).null
    def material_set_use_debanding(enable : Bool) : Void
      if @@mb_material_set_use_debanding.null?
        @@mb_material_set_use_debanding = Bridge.get_method_bind("RenderingServer", "material_set_use_debanding", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_material_set_use_debanding, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_create_from_surfaces : Void* = Pointer(Void).null
    def mesh_create_from_surfaces(surfaces : Godot::Array, blend_shape_count : Int64) : Int64
      if @@mb_mesh_create_from_surfaces.null?
        @@mb_mesh_create_from_surfaces = Bridge.get_method_bind("RenderingServer", "mesh_create_from_surfaces", 4291747531_i64)
      end
      arg_ptr_0 = surfaces ? surfaces.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = blend_shape_count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_create_from_surfaces, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_create : Void* = Pointer(Void).null
    def mesh_create() : Int64
      if @@mb_mesh_create.null?
        @@mb_mesh_create = Bridge.get_method_bind("RenderingServer", "mesh_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_format_offset : Void* = Pointer(Void).null
    def mesh_surface_get_format_offset(format : Int64, vertex_count : Int64, array_index : Int64) : Int64
      if @@mb_mesh_surface_get_format_offset.null?
        @@mb_mesh_surface_get_format_offset = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_format_offset", 2981368685_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertex_count
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = array_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_format_offset, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_format_vertex_stride : Void* = Pointer(Void).null
    def mesh_surface_get_format_vertex_stride(format : Int64, vertex_count : Int64) : Int64
      if @@mb_mesh_surface_get_format_vertex_stride.null?
        @@mb_mesh_surface_get_format_vertex_stride = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_format_vertex_stride", 3188363337_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertex_count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_format_vertex_stride, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_format_normal_tangent_stride : Void* = Pointer(Void).null
    def mesh_surface_get_format_normal_tangent_stride(format : Int64, vertex_count : Int64) : Int64
      if @@mb_mesh_surface_get_format_normal_tangent_stride.null?
        @@mb_mesh_surface_get_format_normal_tangent_stride = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_format_normal_tangent_stride", 3188363337_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertex_count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_format_normal_tangent_stride, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_format_attribute_stride : Void* = Pointer(Void).null
    def mesh_surface_get_format_attribute_stride(format : Int64, vertex_count : Int64) : Int64
      if @@mb_mesh_surface_get_format_attribute_stride.null?
        @@mb_mesh_surface_get_format_attribute_stride = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_format_attribute_stride", 3188363337_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertex_count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_format_attribute_stride, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_format_skin_stride : Void* = Pointer(Void).null
    def mesh_surface_get_format_skin_stride(format : Int64, vertex_count : Int64) : Int64
      if @@mb_mesh_surface_get_format_skin_stride.null?
        @@mb_mesh_surface_get_format_skin_stride = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_format_skin_stride", 3188363337_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertex_count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_format_skin_stride, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_format_index_stride : Void* = Pointer(Void).null
    def mesh_surface_get_format_index_stride(format : Int64, vertex_count : Int64) : Int64
      if @@mb_mesh_surface_get_format_index_stride.null?
        @@mb_mesh_surface_get_format_index_stride = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_format_index_stride", 3188363337_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertex_count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_format_index_stride, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_add_surface : Void* = Pointer(Void).null
    def mesh_add_surface(mesh : Int64, surface : Void*) : Void
      if @@mb_mesh_add_surface.null?
        @@mb_mesh_add_surface = Bridge.get_method_bind("RenderingServer", "mesh_add_surface", 1217542888_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_mesh_add_surface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_add_surface_from_arrays : Void* = Pointer(Void).null
    def mesh_add_surface_from_arrays(mesh : Int64, primitive : Int64, arrays : Godot::Array, blend_shapes : Godot::Array, lods : Void*, compress_format : Int64) : Void
      if @@mb_mesh_add_surface_from_arrays.null?
        @@mb_mesh_add_surface_from_arrays = Bridge.get_method_bind("RenderingServer", "mesh_add_surface_from_arrays", 2342446560_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = primitive
      arg_1 = pointerof(val_1).as(Void*)
      arg_ptr_2 = arrays ? arrays.pointer : Pointer(Void).null
      arg_2 = pointerof(arg_ptr_2).as(Void*)
      arg_ptr_3 = blend_shapes ? blend_shapes.pointer : Pointer(Void).null
      arg_3 = pointerof(arg_ptr_3).as(Void*)
      val_4 = lods
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = compress_format
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_mesh_add_surface_from_arrays, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_get_blend_shape_count : Void* = Pointer(Void).null
    def mesh_get_blend_shape_count(mesh : Int64) : Int64
      if @@mb_mesh_get_blend_shape_count.null?
        @@mb_mesh_get_blend_shape_count = Bridge.get_method_bind("RenderingServer", "mesh_get_blend_shape_count", 2198884583_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_get_blend_shape_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_set_blend_shape_mode : Void* = Pointer(Void).null
    def mesh_set_blend_shape_mode(mesh : Int64, mode : Int64) : Void
      if @@mb_mesh_set_blend_shape_mode.null?
        @@mb_mesh_set_blend_shape_mode = Bridge.get_method_bind("RenderingServer", "mesh_set_blend_shape_mode", 1294662092_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_mesh_set_blend_shape_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_get_blend_shape_mode : Void* = Pointer(Void).null
    def mesh_get_blend_shape_mode(mesh : Int64) : Int64
      if @@mb_mesh_get_blend_shape_mode.null?
        @@mb_mesh_get_blend_shape_mode = Bridge.get_method_bind("RenderingServer", "mesh_get_blend_shape_mode", 4282291819_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_get_blend_shape_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_set_material : Void* = Pointer(Void).null
    def mesh_surface_set_material(mesh : Int64, surface : Int64, material : Int64) : Void
      if @@mb_mesh_surface_set_material.null?
        @@mb_mesh_surface_set_material = Bridge.get_method_bind("RenderingServer", "mesh_surface_set_material", 2310537182_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = material
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_mesh_surface_set_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_surface_get_material : Void* = Pointer(Void).null
    def mesh_surface_get_material(mesh : Int64, surface : Int64) : Int64
      if @@mb_mesh_surface_get_material.null?
        @@mb_mesh_surface_get_material = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_material", 1066463050_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_material, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_get_surface : Void* = Pointer(Void).null
    def mesh_get_surface(mesh : Int64, surface : Int64) : Void*
      if @@mb_mesh_get_surface.null?
        @@mb_mesh_get_surface = Bridge.get_method_bind("RenderingServer", "mesh_get_surface", 186674697_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_mesh_get_surface, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_mesh_surface_get_arrays : Void* = Pointer(Void).null
    def mesh_surface_get_arrays(mesh : Int64, surface : Int64) : Godot::Array
      if @@mb_mesh_surface_get_arrays.null?
        @@mb_mesh_surface_get_arrays = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_arrays", 1778388067_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_mesh_surface_get_arrays, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_mesh_surface_get_blend_shape_arrays : Void* = Pointer(Void).null
    def mesh_surface_get_blend_shape_arrays(mesh : Int64, surface : Int64) : Godot::Array
      if @@mb_mesh_surface_get_blend_shape_arrays.null?
        @@mb_mesh_surface_get_blend_shape_arrays = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_blend_shape_arrays", 1778388067_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_mesh_surface_get_blend_shape_arrays, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_mesh_get_surface_count : Void* = Pointer(Void).null
    def mesh_get_surface_count(mesh : Int64) : Int64
      if @@mb_mesh_get_surface_count.null?
        @@mb_mesh_get_surface_count = Bridge.get_method_bind("RenderingServer", "mesh_get_surface_count", 2198884583_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_get_surface_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_set_custom_aabb : Void* = Pointer(Void).null
    def mesh_set_custom_aabb(mesh : Int64, aabb : AABB) : Void
      if @@mb_mesh_set_custom_aabb.null?
        @@mb_mesh_set_custom_aabb = Bridge.get_method_bind("RenderingServer", "mesh_set_custom_aabb", 3696536120_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = aabb
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_mesh_set_custom_aabb, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_get_custom_aabb : Void* = Pointer(Void).null
    def mesh_get_custom_aabb(mesh : Int64) : AABB
      if @@mb_mesh_get_custom_aabb.null?
        @@mb_mesh_get_custom_aabb = Bridge.get_method_bind("RenderingServer", "mesh_get_custom_aabb", 974181306_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_mesh_get_custom_aabb, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      AABB.new(ret_ptr)
    end
    @@mb_mesh_surface_remove : Void* = Pointer(Void).null
    def mesh_surface_remove(mesh : Int64, surface : Int64) : Void
      if @@mb_mesh_surface_remove.null?
        @@mb_mesh_surface_remove = Bridge.get_method_bind("RenderingServer", "mesh_surface_remove", 3411492887_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_mesh_surface_remove, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_clear : Void* = Pointer(Void).null
    def mesh_clear(mesh : Int64) : Void
      if @@mb_mesh_clear.null?
        @@mb_mesh_clear = Bridge.get_method_bind("RenderingServer", "mesh_clear", 2722037293_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_mesh_clear, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_surface_update_vertex_region : Void* = Pointer(Void).null
    def mesh_surface_update_vertex_region(mesh : Int64, surface : Int64, offset : Int64, data : Void*) : Void
      if @@mb_mesh_surface_update_vertex_region.null?
        @@mb_mesh_surface_update_vertex_region = Bridge.get_method_bind("RenderingServer", "mesh_surface_update_vertex_region", 2900195149_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = data
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_mesh_surface_update_vertex_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_surface_update_attribute_region : Void* = Pointer(Void).null
    def mesh_surface_update_attribute_region(mesh : Int64, surface : Int64, offset : Int64, data : Void*) : Void
      if @@mb_mesh_surface_update_attribute_region.null?
        @@mb_mesh_surface_update_attribute_region = Bridge.get_method_bind("RenderingServer", "mesh_surface_update_attribute_region", 2900195149_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = data
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_mesh_surface_update_attribute_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_surface_update_skin_region : Void* = Pointer(Void).null
    def mesh_surface_update_skin_region(mesh : Int64, surface : Int64, offset : Int64, data : Void*) : Void
      if @@mb_mesh_surface_update_skin_region.null?
        @@mb_mesh_surface_update_skin_region = Bridge.get_method_bind("RenderingServer", "mesh_surface_update_skin_region", 2900195149_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = data
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_mesh_surface_update_skin_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_surface_update_index_region : Void* = Pointer(Void).null
    def mesh_surface_update_index_region(mesh : Int64, surface : Int64, offset : Int64, data : Void*) : Void
      if @@mb_mesh_surface_update_index_region.null?
        @@mb_mesh_surface_update_index_region = Bridge.get_method_bind("RenderingServer", "mesh_surface_update_index_region", 2900195149_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = data
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_mesh_surface_update_index_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_mesh_surface_get_vertex_buffer_rd_rid : Void* = Pointer(Void).null
    def mesh_surface_get_vertex_buffer_rd_rid(mesh : Int64, surface : Int64) : Int64
      if @@mb_mesh_surface_get_vertex_buffer_rd_rid.null?
        @@mb_mesh_surface_get_vertex_buffer_rd_rid = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_vertex_buffer_rd_rid", 1066463050_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_vertex_buffer_rd_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_attribute_buffer_rd_rid : Void* = Pointer(Void).null
    def mesh_surface_get_attribute_buffer_rd_rid(mesh : Int64, surface : Int64) : Int64
      if @@mb_mesh_surface_get_attribute_buffer_rd_rid.null?
        @@mb_mesh_surface_get_attribute_buffer_rd_rid = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_attribute_buffer_rd_rid", 1066463050_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_attribute_buffer_rd_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_skin_buffer_rd_rid : Void* = Pointer(Void).null
    def mesh_surface_get_skin_buffer_rd_rid(mesh : Int64, surface : Int64) : Int64
      if @@mb_mesh_surface_get_skin_buffer_rd_rid.null?
        @@mb_mesh_surface_get_skin_buffer_rd_rid = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_skin_buffer_rd_rid", 1066463050_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_skin_buffer_rd_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_surface_get_index_buffer_rd_rid : Void* = Pointer(Void).null
    def mesh_surface_get_index_buffer_rd_rid(mesh : Int64, surface : Int64) : Int64
      if @@mb_mesh_surface_get_index_buffer_rd_rid.null?
        @@mb_mesh_surface_get_index_buffer_rd_rid = Bridge.get_method_bind("RenderingServer", "mesh_surface_get_index_buffer_rd_rid", 1066463050_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_mesh_surface_get_index_buffer_rd_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_mesh_set_shadow_mesh : Void* = Pointer(Void).null
    def mesh_set_shadow_mesh(mesh : Int64, shadow_mesh : Int64) : Void
      if @@mb_mesh_set_shadow_mesh.null?
        @@mb_mesh_set_shadow_mesh = Bridge.get_method_bind("RenderingServer", "mesh_set_shadow_mesh", 395945892_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shadow_mesh
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_mesh_set_shadow_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_create : Void* = Pointer(Void).null
    def multimesh_create() : Int64
      if @@mb_multimesh_create.null?
        @@mb_multimesh_create = Bridge.get_method_bind("RenderingServer", "multimesh_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_multimesh_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_allocate_data : Void* = Pointer(Void).null
    def multimesh_allocate_data(multimesh : Int64, instances : Int64, transform_format : Int64, color_format : Bool, custom_data_format : Bool, use_indirect : Bool) : Void
      if @@mb_multimesh_allocate_data.null?
        @@mb_multimesh_allocate_data = Bridge.get_method_bind("RenderingServer", "multimesh_allocate_data", 557240154_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = instances
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform_format
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = color_format
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = custom_data_format
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = use_indirect
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_multimesh_allocate_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_get_instance_count : Void* = Pointer(Void).null
    def multimesh_get_instance_count(multimesh : Int64) : Int64
      if @@mb_multimesh_get_instance_count.null?
        @@mb_multimesh_get_instance_count = Bridge.get_method_bind("RenderingServer", "multimesh_get_instance_count", 2198884583_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_multimesh_get_instance_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_set_mesh : Void* = Pointer(Void).null
    def multimesh_set_mesh(multimesh : Int64, mesh : Int64) : Void
      if @@mb_multimesh_set_mesh.null?
        @@mb_multimesh_set_mesh = Bridge.get_method_bind("RenderingServer", "multimesh_set_mesh", 395945892_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mesh
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_multimesh_set_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_instance_set_transform : Void* = Pointer(Void).null
    def multimesh_instance_set_transform(multimesh : Int64, index : Int64, transform : Transform3D) : Void
      if @@mb_multimesh_instance_set_transform.null?
        @@mb_multimesh_instance_set_transform = Bridge.get_method_bind("RenderingServer", "multimesh_instance_set_transform", 675327471_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_multimesh_instance_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_instance_set_transform_2d : Void* = Pointer(Void).null
    def multimesh_instance_set_transform_2d(multimesh : Int64, index : Int64, transform : Transform2D) : Void
      if @@mb_multimesh_instance_set_transform_2d.null?
        @@mb_multimesh_instance_set_transform_2d = Bridge.get_method_bind("RenderingServer", "multimesh_instance_set_transform_2d", 736082694_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_multimesh_instance_set_transform_2d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_instance_set_color : Void* = Pointer(Void).null
    def multimesh_instance_set_color(multimesh : Int64, index : Int64, color : Color) : Void
      if @@mb_multimesh_instance_set_color.null?
        @@mb_multimesh_instance_set_color = Bridge.get_method_bind("RenderingServer", "multimesh_instance_set_color", 176975443_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = color
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_multimesh_instance_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_instance_set_custom_data : Void* = Pointer(Void).null
    def multimesh_instance_set_custom_data(multimesh : Int64, index : Int64, custom_data : Color) : Void
      if @@mb_multimesh_instance_set_custom_data.null?
        @@mb_multimesh_instance_set_custom_data = Bridge.get_method_bind("RenderingServer", "multimesh_instance_set_custom_data", 176975443_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = custom_data
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_multimesh_instance_set_custom_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_get_mesh : Void* = Pointer(Void).null
    def multimesh_get_mesh(multimesh : Int64) : Int64
      if @@mb_multimesh_get_mesh.null?
        @@mb_multimesh_get_mesh = Bridge.get_method_bind("RenderingServer", "multimesh_get_mesh", 3814569979_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_multimesh_get_mesh, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_get_aabb : Void* = Pointer(Void).null
    def multimesh_get_aabb(multimesh : Int64) : AABB
      if @@mb_multimesh_get_aabb.null?
        @@mb_multimesh_get_aabb = Bridge.get_method_bind("RenderingServer", "multimesh_get_aabb", 974181306_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_multimesh_get_aabb, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      AABB.new(ret_ptr)
    end
    @@mb_multimesh_set_custom_aabb : Void* = Pointer(Void).null
    def multimesh_set_custom_aabb(multimesh : Int64, aabb : AABB) : Void
      if @@mb_multimesh_set_custom_aabb.null?
        @@mb_multimesh_set_custom_aabb = Bridge.get_method_bind("RenderingServer", "multimesh_set_custom_aabb", 3696536120_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = aabb
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_multimesh_set_custom_aabb, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_get_custom_aabb : Void* = Pointer(Void).null
    def multimesh_get_custom_aabb(multimesh : Int64) : AABB
      if @@mb_multimesh_get_custom_aabb.null?
        @@mb_multimesh_get_custom_aabb = Bridge.get_method_bind("RenderingServer", "multimesh_get_custom_aabb", 974181306_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_multimesh_get_custom_aabb, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      AABB.new(ret_ptr)
    end
    @@mb_multimesh_instance_get_transform : Void* = Pointer(Void).null
    def multimesh_instance_get_transform(multimesh : Int64, index : Int64) : Transform3D
      if @@mb_multimesh_instance_get_transform.null?
        @@mb_multimesh_instance_get_transform = Bridge.get_method_bind("RenderingServer", "multimesh_instance_get_transform", 1050775521_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_multimesh_instance_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_instance_get_transform_2d : Void* = Pointer(Void).null
    def multimesh_instance_get_transform_2d(multimesh : Int64, index : Int64) : Transform2D
      if @@mb_multimesh_instance_get_transform_2d.null?
        @@mb_multimesh_instance_get_transform_2d = Bridge.get_method_bind("RenderingServer", "multimesh_instance_get_transform_2d", 1324854622_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_multimesh_instance_get_transform_2d, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_multimesh_instance_get_color : Void* = Pointer(Void).null
    def multimesh_instance_get_color(multimesh : Int64, index : Int64) : Color
      if @@mb_multimesh_instance_get_color.null?
        @@mb_multimesh_instance_get_color = Bridge.get_method_bind("RenderingServer", "multimesh_instance_get_color", 2946315076_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Color.new
      Bridge.ptrcall(@@mb_multimesh_instance_get_color, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_instance_get_custom_data : Void* = Pointer(Void).null
    def multimesh_instance_get_custom_data(multimesh : Int64, index : Int64) : Color
      if @@mb_multimesh_instance_get_custom_data.null?
        @@mb_multimesh_instance_get_custom_data = Bridge.get_method_bind("RenderingServer", "multimesh_instance_get_custom_data", 2946315076_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Color.new
      Bridge.ptrcall(@@mb_multimesh_instance_get_custom_data, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_set_visible_instances : Void* = Pointer(Void).null
    def multimesh_set_visible_instances(multimesh : Int64, visible : Int64) : Void
      if @@mb_multimesh_set_visible_instances.null?
        @@mb_multimesh_set_visible_instances = Bridge.get_method_bind("RenderingServer", "multimesh_set_visible_instances", 3411492887_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = visible
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_multimesh_set_visible_instances, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_get_visible_instances : Void* = Pointer(Void).null
    def multimesh_get_visible_instances(multimesh : Int64) : Int64
      if @@mb_multimesh_get_visible_instances.null?
        @@mb_multimesh_get_visible_instances = Bridge.get_method_bind("RenderingServer", "multimesh_get_visible_instances", 2198884583_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_multimesh_get_visible_instances, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_set_buffer : Void* = Pointer(Void).null
    def multimesh_set_buffer(multimesh : Int64, buffer : Void*) : Void
      if @@mb_multimesh_set_buffer.null?
        @@mb_multimesh_set_buffer = Bridge.get_method_bind("RenderingServer", "multimesh_set_buffer", 2960552364_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = buffer
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_multimesh_set_buffer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_get_command_buffer_rd_rid : Void* = Pointer(Void).null
    def multimesh_get_command_buffer_rd_rid(multimesh : Int64) : Int64
      if @@mb_multimesh_get_command_buffer_rd_rid.null?
        @@mb_multimesh_get_command_buffer_rd_rid = Bridge.get_method_bind("RenderingServer", "multimesh_get_command_buffer_rd_rid", 3814569979_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_multimesh_get_command_buffer_rd_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_get_buffer_rd_rid : Void* = Pointer(Void).null
    def multimesh_get_buffer_rd_rid(multimesh : Int64) : Int64
      if @@mb_multimesh_get_buffer_rd_rid.null?
        @@mb_multimesh_get_buffer_rd_rid = Bridge.get_method_bind("RenderingServer", "multimesh_get_buffer_rd_rid", 3814569979_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_multimesh_get_buffer_rd_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_multimesh_get_buffer : Void* = Pointer(Void).null
    def multimesh_get_buffer(multimesh : Int64) : Void*
      if @@mb_multimesh_get_buffer.null?
        @@mb_multimesh_get_buffer = Bridge.get_method_bind("RenderingServer", "multimesh_get_buffer", 3964669176_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_multimesh_get_buffer, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_multimesh_set_buffer_interpolated : Void* = Pointer(Void).null
    def multimesh_set_buffer_interpolated(multimesh : Int64, buffer : Void*, buffer_previous : Void*) : Void
      if @@mb_multimesh_set_buffer_interpolated.null?
        @@mb_multimesh_set_buffer_interpolated = Bridge.get_method_bind("RenderingServer", "multimesh_set_buffer_interpolated", 659844711_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = buffer
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = buffer_previous
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_multimesh_set_buffer_interpolated, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_set_physics_interpolated : Void* = Pointer(Void).null
    def multimesh_set_physics_interpolated(multimesh : Int64, interpolated : Bool) : Void
      if @@mb_multimesh_set_physics_interpolated.null?
        @@mb_multimesh_set_physics_interpolated = Bridge.get_method_bind("RenderingServer", "multimesh_set_physics_interpolated", 1265174801_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = interpolated
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_multimesh_set_physics_interpolated, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_set_physics_interpolation_quality : Void* = Pointer(Void).null
    def multimesh_set_physics_interpolation_quality(multimesh : Int64, quality : Int64) : Void
      if @@mb_multimesh_set_physics_interpolation_quality.null?
        @@mb_multimesh_set_physics_interpolation_quality = Bridge.get_method_bind("RenderingServer", "multimesh_set_physics_interpolation_quality", 3934808223_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = quality
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_multimesh_set_physics_interpolation_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_instance_reset_physics_interpolation : Void* = Pointer(Void).null
    def multimesh_instance_reset_physics_interpolation(multimesh : Int64, index : Int64) : Void
      if @@mb_multimesh_instance_reset_physics_interpolation.null?
        @@mb_multimesh_instance_reset_physics_interpolation = Bridge.get_method_bind("RenderingServer", "multimesh_instance_reset_physics_interpolation", 3411492887_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_multimesh_instance_reset_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_multimesh_instances_reset_physics_interpolation : Void* = Pointer(Void).null
    def multimesh_instances_reset_physics_interpolation(multimesh : Int64) : Void
      if @@mb_multimesh_instances_reset_physics_interpolation.null?
        @@mb_multimesh_instances_reset_physics_interpolation = Bridge.get_method_bind("RenderingServer", "multimesh_instances_reset_physics_interpolation", 2722037293_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_multimesh_instances_reset_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_skeleton_create : Void* = Pointer(Void).null
    def skeleton_create() : Int64
      if @@mb_skeleton_create.null?
        @@mb_skeleton_create = Bridge.get_method_bind("RenderingServer", "skeleton_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_skeleton_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_skeleton_allocate_data : Void* = Pointer(Void).null
    def skeleton_allocate_data(skeleton : Int64, bones : Int64, is_2d_skeleton : Bool) : Void
      if @@mb_skeleton_allocate_data.null?
        @@mb_skeleton_allocate_data = Bridge.get_method_bind("RenderingServer", "skeleton_allocate_data", 1904426712_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bones
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = is_2d_skeleton
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_skeleton_allocate_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_skeleton_get_bone_count : Void* = Pointer(Void).null
    def skeleton_get_bone_count(skeleton : Int64) : Int64
      if @@mb_skeleton_get_bone_count.null?
        @@mb_skeleton_get_bone_count = Bridge.get_method_bind("RenderingServer", "skeleton_get_bone_count", 2198884583_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_skeleton_get_bone_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_skeleton_bone_set_transform : Void* = Pointer(Void).null
    def skeleton_bone_set_transform(skeleton : Int64, bone : Int64, transform : Transform3D) : Void
      if @@mb_skeleton_bone_set_transform.null?
        @@mb_skeleton_bone_set_transform = Bridge.get_method_bind("RenderingServer", "skeleton_bone_set_transform", 675327471_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_skeleton_bone_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_skeleton_bone_get_transform : Void* = Pointer(Void).null
    def skeleton_bone_get_transform(skeleton : Int64, bone : Int64) : Transform3D
      if @@mb_skeleton_bone_get_transform.null?
        @@mb_skeleton_bone_get_transform = Bridge.get_method_bind("RenderingServer", "skeleton_bone_get_transform", 1050775521_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_skeleton_bone_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_skeleton_bone_set_transform_2d : Void* = Pointer(Void).null
    def skeleton_bone_set_transform_2d(skeleton : Int64, bone : Int64, transform : Transform2D) : Void
      if @@mb_skeleton_bone_set_transform_2d.null?
        @@mb_skeleton_bone_set_transform_2d = Bridge.get_method_bind("RenderingServer", "skeleton_bone_set_transform_2d", 736082694_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_skeleton_bone_set_transform_2d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_skeleton_bone_get_transform_2d : Void* = Pointer(Void).null
    def skeleton_bone_get_transform_2d(skeleton : Int64, bone : Int64) : Transform2D
      if @@mb_skeleton_bone_get_transform_2d.null?
        @@mb_skeleton_bone_get_transform_2d = Bridge.get_method_bind("RenderingServer", "skeleton_bone_get_transform_2d", 1324854622_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_skeleton_bone_get_transform_2d, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_skeleton_set_base_transform_2d : Void* = Pointer(Void).null
    def skeleton_set_base_transform_2d(skeleton : Int64, base_transform : Transform2D) : Void
      if @@mb_skeleton_set_base_transform_2d.null?
        @@mb_skeleton_set_base_transform_2d = Bridge.get_method_bind("RenderingServer", "skeleton_set_base_transform_2d", 1246044741_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = base_transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_skeleton_set_base_transform_2d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_directional_light_create : Void* = Pointer(Void).null
    def directional_light_create() : Int64
      if @@mb_directional_light_create.null?
        @@mb_directional_light_create = Bridge.get_method_bind("RenderingServer", "directional_light_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_directional_light_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_omni_light_create : Void* = Pointer(Void).null
    def omni_light_create() : Int64
      if @@mb_omni_light_create.null?
        @@mb_omni_light_create = Bridge.get_method_bind("RenderingServer", "omni_light_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_omni_light_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_spot_light_create : Void* = Pointer(Void).null
    def spot_light_create() : Int64
      if @@mb_spot_light_create.null?
        @@mb_spot_light_create = Bridge.get_method_bind("RenderingServer", "spot_light_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_spot_light_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_light_create : Void* = Pointer(Void).null
    def area_light_create() : Int64
      if @@mb_area_light_create.null?
        @@mb_area_light_create = Bridge.get_method_bind("RenderingServer", "area_light_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_light_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_light_set_color : Void* = Pointer(Void).null
    def light_set_color(light : Int64, color : Color) : Void
      if @@mb_light_set_color.null?
        @@mb_light_set_color = Bridge.get_method_bind("RenderingServer", "light_set_color", 2948539648_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_param : Void* = Pointer(Void).null
    def light_set_param(light : Int64, param : Int64, value : Float64) : Void
      if @@mb_light_set_param.null?
        @@mb_light_set_param = Bridge.get_method_bind("RenderingServer", "light_set_param", 501936875_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_light_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_shadow : Void* = Pointer(Void).null
    def light_set_shadow(light : Int64, enabled : Bool) : Void
      if @@mb_light_set_shadow.null?
        @@mb_light_set_shadow = Bridge.get_method_bind("RenderingServer", "light_set_shadow", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_shadow, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_projector : Void* = Pointer(Void).null
    def light_set_projector(light : Int64, texture : Int64) : Void
      if @@mb_light_set_projector.null?
        @@mb_light_set_projector = Bridge.get_method_bind("RenderingServer", "light_set_projector", 395945892_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = texture
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_projector, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_negative : Void* = Pointer(Void).null
    def light_set_negative(light : Int64, enable : Bool) : Void
      if @@mb_light_set_negative.null?
        @@mb_light_set_negative = Bridge.get_method_bind("RenderingServer", "light_set_negative", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_negative, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_cull_mask : Void* = Pointer(Void).null
    def light_set_cull_mask(light : Int64, mask : Int64) : Void
      if @@mb_light_set_cull_mask.null?
        @@mb_light_set_cull_mask = Bridge.get_method_bind("RenderingServer", "light_set_cull_mask", 3411492887_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_distance_fade : Void* = Pointer(Void).null
    def light_set_distance_fade(decal : Int64, enabled : Bool, begin_val : Float64, shadow : Float64, length : Float64) : Void
      if @@mb_light_set_distance_fade.null?
        @@mb_light_set_distance_fade = Bridge.get_method_bind("RenderingServer", "light_set_distance_fade", 1622292572_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = begin_val
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = shadow
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = length
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_light_set_distance_fade, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_reverse_cull_face_mode : Void* = Pointer(Void).null
    def light_set_reverse_cull_face_mode(light : Int64, enabled : Bool) : Void
      if @@mb_light_set_reverse_cull_face_mode.null?
        @@mb_light_set_reverse_cull_face_mode = Bridge.get_method_bind("RenderingServer", "light_set_reverse_cull_face_mode", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_reverse_cull_face_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_shadow_caster_mask : Void* = Pointer(Void).null
    def light_set_shadow_caster_mask(light : Int64, mask : Int64) : Void
      if @@mb_light_set_shadow_caster_mask.null?
        @@mb_light_set_shadow_caster_mask = Bridge.get_method_bind("RenderingServer", "light_set_shadow_caster_mask", 3411492887_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_shadow_caster_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_bake_mode : Void* = Pointer(Void).null
    def light_set_bake_mode(light : Int64, bake_mode : Int64) : Void
      if @@mb_light_set_bake_mode.null?
        @@mb_light_set_bake_mode = Bridge.get_method_bind("RenderingServer", "light_set_bake_mode", 1048525260_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bake_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_bake_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_set_max_sdfgi_cascade : Void* = Pointer(Void).null
    def light_set_max_sdfgi_cascade(light : Int64, cascade : Int64) : Void
      if @@mb_light_set_max_sdfgi_cascade.null?
        @@mb_light_set_max_sdfgi_cascade = Bridge.get_method_bind("RenderingServer", "light_set_max_sdfgi_cascade", 3411492887_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = cascade
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_set_max_sdfgi_cascade, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_omni_set_shadow_mode : Void* = Pointer(Void).null
    def light_omni_set_shadow_mode(light : Int64, mode : Int64) : Void
      if @@mb_light_omni_set_shadow_mode.null?
        @@mb_light_omni_set_shadow_mode = Bridge.get_method_bind("RenderingServer", "light_omni_set_shadow_mode", 2552677200_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_omni_set_shadow_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_directional_set_shadow_mode : Void* = Pointer(Void).null
    def light_directional_set_shadow_mode(light : Int64, mode : Int64) : Void
      if @@mb_light_directional_set_shadow_mode.null?
        @@mb_light_directional_set_shadow_mode = Bridge.get_method_bind("RenderingServer", "light_directional_set_shadow_mode", 380462970_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_directional_set_shadow_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_directional_set_blend_splits : Void* = Pointer(Void).null
    def light_directional_set_blend_splits(light : Int64, enable : Bool) : Void
      if @@mb_light_directional_set_blend_splits.null?
        @@mb_light_directional_set_blend_splits = Bridge.get_method_bind("RenderingServer", "light_directional_set_blend_splits", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_directional_set_blend_splits, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_directional_set_sky_mode : Void* = Pointer(Void).null
    def light_directional_set_sky_mode(light : Int64, mode : Int64) : Void
      if @@mb_light_directional_set_sky_mode.null?
        @@mb_light_directional_set_sky_mode = Bridge.get_method_bind("RenderingServer", "light_directional_set_sky_mode", 2559740754_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_directional_set_sky_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_area_set_size : Void* = Pointer(Void).null
    def light_area_set_size(light : Int64, size : Vector2) : Void
      if @@mb_light_area_set_size.null?
        @@mb_light_area_set_size = Bridge.get_method_bind("RenderingServer", "light_area_set_size", 3201125042_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_area_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_area_set_normalize_energy : Void* = Pointer(Void).null
    def light_area_set_normalize_energy(light : Int64, enable : Bool) : Void
      if @@mb_light_area_set_normalize_energy.null?
        @@mb_light_area_set_normalize_energy = Bridge.get_method_bind("RenderingServer", "light_area_set_normalize_energy", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_light_area_set_normalize_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_light_projectors_set_filter : Void* = Pointer(Void).null
    def light_projectors_set_filter(filter : Int64) : Void
      if @@mb_light_projectors_set_filter.null?
        @@mb_light_projectors_set_filter = Bridge.get_method_bind("RenderingServer", "light_projectors_set_filter", 43944325_i64)
      end
      val_0 = filter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_light_projectors_set_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_lightmaps_set_bicubic_filter : Void* = Pointer(Void).null
    def lightmaps_set_bicubic_filter(enable : Bool) : Void
      if @@mb_lightmaps_set_bicubic_filter.null?
        @@mb_lightmaps_set_bicubic_filter = Bridge.get_method_bind("RenderingServer", "lightmaps_set_bicubic_filter", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_lightmaps_set_bicubic_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_positional_soft_shadow_filter_set_quality : Void* = Pointer(Void).null
    def positional_soft_shadow_filter_set_quality(quality : Int64) : Void
      if @@mb_positional_soft_shadow_filter_set_quality.null?
        @@mb_positional_soft_shadow_filter_set_quality = Bridge.get_method_bind("RenderingServer", "positional_soft_shadow_filter_set_quality", 3613045266_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_positional_soft_shadow_filter_set_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_directional_soft_shadow_filter_set_quality : Void* = Pointer(Void).null
    def directional_soft_shadow_filter_set_quality(quality : Int64) : Void
      if @@mb_directional_soft_shadow_filter_set_quality.null?
        @@mb_directional_soft_shadow_filter_set_quality = Bridge.get_method_bind("RenderingServer", "directional_soft_shadow_filter_set_quality", 3613045266_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_directional_soft_shadow_filter_set_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_directional_shadow_atlas_set_size : Void* = Pointer(Void).null
    def directional_shadow_atlas_set_size(size : Int64, is_16bits : Bool) : Void
      if @@mb_directional_shadow_atlas_set_size.null?
        @@mb_directional_shadow_atlas_set_size = Bridge.get_method_bind("RenderingServer", "directional_shadow_atlas_set_size", 300928843_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = is_16bits
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_directional_shadow_atlas_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_create : Void* = Pointer(Void).null
    def reflection_probe_create() : Int64
      if @@mb_reflection_probe_create.null?
        @@mb_reflection_probe_create = Bridge.get_method_bind("RenderingServer", "reflection_probe_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_reflection_probe_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_reflection_probe_set_update_mode : Void* = Pointer(Void).null
    def reflection_probe_set_update_mode(probe : Int64, mode : Int64) : Void
      if @@mb_reflection_probe_set_update_mode.null?
        @@mb_reflection_probe_set_update_mode = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_update_mode", 3853670147_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_update_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_intensity : Void* = Pointer(Void).null
    def reflection_probe_set_intensity(probe : Int64, intensity : Float64) : Void
      if @@mb_reflection_probe_set_intensity.null?
        @@mb_reflection_probe_set_intensity = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_intensity", 1794382983_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = intensity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_intensity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_blend_distance : Void* = Pointer(Void).null
    def reflection_probe_set_blend_distance(probe : Int64, blend_distance : Float64) : Void
      if @@mb_reflection_probe_set_blend_distance.null?
        @@mb_reflection_probe_set_blend_distance = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_blend_distance", 1794382983_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = blend_distance
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_blend_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_ambient_mode : Void* = Pointer(Void).null
    def reflection_probe_set_ambient_mode(probe : Int64, mode : Int64) : Void
      if @@mb_reflection_probe_set_ambient_mode.null?
        @@mb_reflection_probe_set_ambient_mode = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_ambient_mode", 184163074_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_ambient_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_ambient_color : Void* = Pointer(Void).null
    def reflection_probe_set_ambient_color(probe : Int64, color : Color) : Void
      if @@mb_reflection_probe_set_ambient_color.null?
        @@mb_reflection_probe_set_ambient_color = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_ambient_color", 2948539648_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_ambient_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_ambient_energy : Void* = Pointer(Void).null
    def reflection_probe_set_ambient_energy(probe : Int64, energy : Float64) : Void
      if @@mb_reflection_probe_set_ambient_energy.null?
        @@mb_reflection_probe_set_ambient_energy = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_ambient_energy", 1794382983_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = energy
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_ambient_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_max_distance : Void* = Pointer(Void).null
    def reflection_probe_set_max_distance(probe : Int64, distance : Float64) : Void
      if @@mb_reflection_probe_set_max_distance.null?
        @@mb_reflection_probe_set_max_distance = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_max_distance", 1794382983_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = distance
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_max_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_size : Void* = Pointer(Void).null
    def reflection_probe_set_size(probe : Int64, size : Vector3) : Void
      if @@mb_reflection_probe_set_size.null?
        @@mb_reflection_probe_set_size = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_size", 3227306858_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_origin_offset : Void* = Pointer(Void).null
    def reflection_probe_set_origin_offset(probe : Int64, offset : Vector3) : Void
      if @@mb_reflection_probe_set_origin_offset.null?
        @@mb_reflection_probe_set_origin_offset = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_origin_offset", 3227306858_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = offset
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_origin_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_as_interior : Void* = Pointer(Void).null
    def reflection_probe_set_as_interior(probe : Int64, enable : Bool) : Void
      if @@mb_reflection_probe_set_as_interior.null?
        @@mb_reflection_probe_set_as_interior = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_as_interior", 1265174801_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_as_interior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_enable_box_projection : Void* = Pointer(Void).null
    def reflection_probe_set_enable_box_projection(probe : Int64, enable : Bool) : Void
      if @@mb_reflection_probe_set_enable_box_projection.null?
        @@mb_reflection_probe_set_enable_box_projection = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_enable_box_projection", 1265174801_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_enable_box_projection, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_enable_shadows : Void* = Pointer(Void).null
    def reflection_probe_set_enable_shadows(probe : Int64, enable : Bool) : Void
      if @@mb_reflection_probe_set_enable_shadows.null?
        @@mb_reflection_probe_set_enable_shadows = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_enable_shadows", 1265174801_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_enable_shadows, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_cull_mask : Void* = Pointer(Void).null
    def reflection_probe_set_cull_mask(probe : Int64, layers : Int64) : Void
      if @@mb_reflection_probe_set_cull_mask.null?
        @@mb_reflection_probe_set_cull_mask = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_cull_mask", 3411492887_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layers
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_reflection_mask : Void* = Pointer(Void).null
    def reflection_probe_set_reflection_mask(probe : Int64, layers : Int64) : Void
      if @@mb_reflection_probe_set_reflection_mask.null?
        @@mb_reflection_probe_set_reflection_mask = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_reflection_mask", 3411492887_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layers
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_reflection_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_resolution : Void* = Pointer(Void).null
    def reflection_probe_set_resolution(probe : Int64, resolution : Int64) : Void
      if @@mb_reflection_probe_set_resolution.null?
        @@mb_reflection_probe_set_resolution = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_resolution", 3411492887_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = resolution
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_resolution, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reflection_probe_set_mesh_lod_threshold : Void* = Pointer(Void).null
    def reflection_probe_set_mesh_lod_threshold(probe : Int64, pixels : Float64) : Void
      if @@mb_reflection_probe_set_mesh_lod_threshold.null?
        @@mb_reflection_probe_set_mesh_lod_threshold = Bridge.get_method_bind("RenderingServer", "reflection_probe_set_mesh_lod_threshold", 1794382983_i64)
      end
      val_0 = probe
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pixels
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reflection_probe_set_mesh_lod_threshold, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_create : Void* = Pointer(Void).null
    def decal_create() : Int64
      if @@mb_decal_create.null?
        @@mb_decal_create = Bridge.get_method_bind("RenderingServer", "decal_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_decal_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_decal_set_size : Void* = Pointer(Void).null
    def decal_set_size(decal : Int64, size : Vector3) : Void
      if @@mb_decal_set_size.null?
        @@mb_decal_set_size = Bridge.get_method_bind("RenderingServer", "decal_set_size", 3227306858_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_decal_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_texture : Void* = Pointer(Void).null
    def decal_set_texture(decal : Int64, get_type : Int64, texture : Int64) : Void
      if @@mb_decal_set_texture.null?
        @@mb_decal_set_texture = Bridge.get_method_bind("RenderingServer", "decal_set_texture", 3953344054_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_decal_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_emission_energy : Void* = Pointer(Void).null
    def decal_set_emission_energy(decal : Int64, energy : Float64) : Void
      if @@mb_decal_set_emission_energy.null?
        @@mb_decal_set_emission_energy = Bridge.get_method_bind("RenderingServer", "decal_set_emission_energy", 1794382983_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = energy
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_decal_set_emission_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_albedo_mix : Void* = Pointer(Void).null
    def decal_set_albedo_mix(decal : Int64, albedo_mix : Float64) : Void
      if @@mb_decal_set_albedo_mix.null?
        @@mb_decal_set_albedo_mix = Bridge.get_method_bind("RenderingServer", "decal_set_albedo_mix", 1794382983_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = albedo_mix
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_decal_set_albedo_mix, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_modulate : Void* = Pointer(Void).null
    def decal_set_modulate(decal : Int64, color : Color) : Void
      if @@mb_decal_set_modulate.null?
        @@mb_decal_set_modulate = Bridge.get_method_bind("RenderingServer", "decal_set_modulate", 2948539648_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_decal_set_modulate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_cull_mask : Void* = Pointer(Void).null
    def decal_set_cull_mask(decal : Int64, mask : Int64) : Void
      if @@mb_decal_set_cull_mask.null?
        @@mb_decal_set_cull_mask = Bridge.get_method_bind("RenderingServer", "decal_set_cull_mask", 3411492887_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_decal_set_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_distance_fade : Void* = Pointer(Void).null
    def decal_set_distance_fade(decal : Int64, enabled : Bool, begin_val : Float64, length : Float64) : Void
      if @@mb_decal_set_distance_fade.null?
        @@mb_decal_set_distance_fade = Bridge.get_method_bind("RenderingServer", "decal_set_distance_fade", 2972769666_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = begin_val
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = length
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_decal_set_distance_fade, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_fade : Void* = Pointer(Void).null
    def decal_set_fade(decal : Int64, above : Float64, below : Float64) : Void
      if @@mb_decal_set_fade.null?
        @@mb_decal_set_fade = Bridge.get_method_bind("RenderingServer", "decal_set_fade", 2513314492_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = above
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = below
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_decal_set_fade, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decal_set_normal_fade : Void* = Pointer(Void).null
    def decal_set_normal_fade(decal : Int64, fade : Float64) : Void
      if @@mb_decal_set_normal_fade.null?
        @@mb_decal_set_normal_fade = Bridge.get_method_bind("RenderingServer", "decal_set_normal_fade", 1794382983_i64)
      end
      val_0 = decal
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = fade
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_decal_set_normal_fade, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_decals_set_filter : Void* = Pointer(Void).null
    def decals_set_filter(filter : Int64) : Void
      if @@mb_decals_set_filter.null?
        @@mb_decals_set_filter = Bridge.get_method_bind("RenderingServer", "decals_set_filter", 3519875702_i64)
      end
      val_0 = filter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_decals_set_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_gi_set_use_half_resolution : Void* = Pointer(Void).null
    def gi_set_use_half_resolution(half_resolution : Bool) : Void
      if @@mb_gi_set_use_half_resolution.null?
        @@mb_gi_set_use_half_resolution = Bridge.get_method_bind("RenderingServer", "gi_set_use_half_resolution", 2586408642_i64)
      end
      val_0 = half_resolution
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_gi_set_use_half_resolution, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_create : Void* = Pointer(Void).null
    def voxel_gi_create() : Int64
      if @@mb_voxel_gi_create.null?
        @@mb_voxel_gi_create = Bridge.get_method_bind("RenderingServer", "voxel_gi_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_voxel_gi_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_voxel_gi_allocate_data : Void* = Pointer(Void).null
    def voxel_gi_allocate_data(voxel_gi : Int64, to_cell_xform : Transform3D, aabb : AABB, octree_size : Vector3i, octree_cells : Void*, data_cells : Void*, distance_field : Void*, level_counts : Void*) : Void
      if @@mb_voxel_gi_allocate_data.null?
        @@mb_voxel_gi_allocate_data = Bridge.get_method_bind("RenderingServer", "voxel_gi_allocate_data", 4108223027_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_cell_xform
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = aabb
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = octree_size
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = octree_cells
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = data_cells
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = distance_field
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = level_counts
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      Bridge.ptrcall(@@mb_voxel_gi_allocate_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_get_octree_size : Void* = Pointer(Void).null
    def voxel_gi_get_octree_size(voxel_gi : Int64) : Vector3i
      if @@mb_voxel_gi_get_octree_size.null?
        @@mb_voxel_gi_get_octree_size = Bridge.get_method_bind("RenderingServer", "voxel_gi_get_octree_size", 2607699645_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_voxel_gi_get_octree_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector3i.new(ret_ptr)
    end
    @@mb_voxel_gi_get_octree_cells : Void* = Pointer(Void).null
    def voxel_gi_get_octree_cells(voxel_gi : Int64) : Void*
      if @@mb_voxel_gi_get_octree_cells.null?
        @@mb_voxel_gi_get_octree_cells = Bridge.get_method_bind("RenderingServer", "voxel_gi_get_octree_cells", 3348040486_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_voxel_gi_get_octree_cells, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_voxel_gi_get_data_cells : Void* = Pointer(Void).null
    def voxel_gi_get_data_cells(voxel_gi : Int64) : Void*
      if @@mb_voxel_gi_get_data_cells.null?
        @@mb_voxel_gi_get_data_cells = Bridge.get_method_bind("RenderingServer", "voxel_gi_get_data_cells", 3348040486_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_voxel_gi_get_data_cells, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_voxel_gi_get_distance_field : Void* = Pointer(Void).null
    def voxel_gi_get_distance_field(voxel_gi : Int64) : Void*
      if @@mb_voxel_gi_get_distance_field.null?
        @@mb_voxel_gi_get_distance_field = Bridge.get_method_bind("RenderingServer", "voxel_gi_get_distance_field", 3348040486_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_voxel_gi_get_distance_field, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_voxel_gi_get_level_counts : Void* = Pointer(Void).null
    def voxel_gi_get_level_counts(voxel_gi : Int64) : Void*
      if @@mb_voxel_gi_get_level_counts.null?
        @@mb_voxel_gi_get_level_counts = Bridge.get_method_bind("RenderingServer", "voxel_gi_get_level_counts", 788230395_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_voxel_gi_get_level_counts, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_voxel_gi_get_to_cell_xform : Void* = Pointer(Void).null
    def voxel_gi_get_to_cell_xform(voxel_gi : Int64) : Transform3D
      if @@mb_voxel_gi_get_to_cell_xform.null?
        @@mb_voxel_gi_get_to_cell_xform = Bridge.get_method_bind("RenderingServer", "voxel_gi_get_to_cell_xform", 1128465797_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_voxel_gi_get_to_cell_xform, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_voxel_gi_set_dynamic_range : Void* = Pointer(Void).null
    def voxel_gi_set_dynamic_range(voxel_gi : Int64, range : Float64) : Void
      if @@mb_voxel_gi_set_dynamic_range.null?
        @@mb_voxel_gi_set_dynamic_range = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_dynamic_range", 1794382983_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = range
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_dynamic_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_propagation : Void* = Pointer(Void).null
    def voxel_gi_set_propagation(voxel_gi : Int64, amount : Float64) : Void
      if @@mb_voxel_gi_set_propagation.null?
        @@mb_voxel_gi_set_propagation = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_propagation", 1794382983_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = amount
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_propagation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_energy : Void* = Pointer(Void).null
    def voxel_gi_set_energy(voxel_gi : Int64, energy : Float64) : Void
      if @@mb_voxel_gi_set_energy.null?
        @@mb_voxel_gi_set_energy = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_energy", 1794382983_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = energy
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_baked_exposure_normalization : Void* = Pointer(Void).null
    def voxel_gi_set_baked_exposure_normalization(voxel_gi : Int64, baked_exposure : Float64) : Void
      if @@mb_voxel_gi_set_baked_exposure_normalization.null?
        @@mb_voxel_gi_set_baked_exposure_normalization = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_baked_exposure_normalization", 1794382983_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = baked_exposure
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_baked_exposure_normalization, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_bias : Void* = Pointer(Void).null
    def voxel_gi_set_bias(voxel_gi : Int64, bias : Float64) : Void
      if @@mb_voxel_gi_set_bias.null?
        @@mb_voxel_gi_set_bias = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_bias", 1794382983_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bias
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_normal_bias : Void* = Pointer(Void).null
    def voxel_gi_set_normal_bias(voxel_gi : Int64, bias : Float64) : Void
      if @@mb_voxel_gi_set_normal_bias.null?
        @@mb_voxel_gi_set_normal_bias = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_normal_bias", 1794382983_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bias
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_normal_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_interior : Void* = Pointer(Void).null
    def voxel_gi_set_interior(voxel_gi : Int64, enable : Bool) : Void
      if @@mb_voxel_gi_set_interior.null?
        @@mb_voxel_gi_set_interior = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_interior", 1265174801_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_interior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_use_two_bounces : Void* = Pointer(Void).null
    def voxel_gi_set_use_two_bounces(voxel_gi : Int64, enable : Bool) : Void
      if @@mb_voxel_gi_set_use_two_bounces.null?
        @@mb_voxel_gi_set_use_two_bounces = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_use_two_bounces", 1265174801_i64)
      end
      val_0 = voxel_gi
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_voxel_gi_set_use_two_bounces, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_voxel_gi_set_quality : Void* = Pointer(Void).null
    def voxel_gi_set_quality(quality : Int64) : Void
      if @@mb_voxel_gi_set_quality.null?
        @@mb_voxel_gi_set_quality = Bridge.get_method_bind("RenderingServer", "voxel_gi_set_quality", 1538689978_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_voxel_gi_set_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_lightmap_create : Void* = Pointer(Void).null
    def lightmap_create() : Int64
      if @@mb_lightmap_create.null?
        @@mb_lightmap_create = Bridge.get_method_bind("RenderingServer", "lightmap_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_lightmap_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_lightmap_set_textures : Void* = Pointer(Void).null
    def lightmap_set_textures(lightmap : Int64, light : Int64, uses_sh : Bool) : Void
      if @@mb_lightmap_set_textures.null?
        @@mb_lightmap_set_textures = Bridge.get_method_bind("RenderingServer", "lightmap_set_textures", 2646464759_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = light
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = uses_sh
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_lightmap_set_textures, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_lightmap_set_probe_bounds : Void* = Pointer(Void).null
    def lightmap_set_probe_bounds(lightmap : Int64, bounds : AABB) : Void
      if @@mb_lightmap_set_probe_bounds.null?
        @@mb_lightmap_set_probe_bounds = Bridge.get_method_bind("RenderingServer", "lightmap_set_probe_bounds", 3696536120_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bounds
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_lightmap_set_probe_bounds, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_lightmap_set_probe_interior : Void* = Pointer(Void).null
    def lightmap_set_probe_interior(lightmap : Int64, interior : Bool) : Void
      if @@mb_lightmap_set_probe_interior.null?
        @@mb_lightmap_set_probe_interior = Bridge.get_method_bind("RenderingServer", "lightmap_set_probe_interior", 1265174801_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = interior
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_lightmap_set_probe_interior, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_lightmap_set_probe_capture_data : Void* = Pointer(Void).null
    def lightmap_set_probe_capture_data(lightmap : Int64, points : Void*, point_sh : Void*, tetrahedra : Void*, bsp_tree : Void*) : Void
      if @@mb_lightmap_set_probe_capture_data.null?
        @@mb_lightmap_set_probe_capture_data = Bridge.get_method_bind("RenderingServer", "lightmap_set_probe_capture_data", 3217845880_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = points
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = point_sh
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = tetrahedra
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = bsp_tree
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_lightmap_set_probe_capture_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_lightmap_get_probe_capture_points : Void* = Pointer(Void).null
    def lightmap_get_probe_capture_points(lightmap : Int64) : Void*
      if @@mb_lightmap_get_probe_capture_points.null?
        @@mb_lightmap_get_probe_capture_points = Bridge.get_method_bind("RenderingServer", "lightmap_get_probe_capture_points", 808965560_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_lightmap_get_probe_capture_points, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_lightmap_get_probe_capture_sh : Void* = Pointer(Void).null
    def lightmap_get_probe_capture_sh(lightmap : Int64) : Void*
      if @@mb_lightmap_get_probe_capture_sh.null?
        @@mb_lightmap_get_probe_capture_sh = Bridge.get_method_bind("RenderingServer", "lightmap_get_probe_capture_sh", 1569415609_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_lightmap_get_probe_capture_sh, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_lightmap_get_probe_capture_tetrahedra : Void* = Pointer(Void).null
    def lightmap_get_probe_capture_tetrahedra(lightmap : Int64) : Void*
      if @@mb_lightmap_get_probe_capture_tetrahedra.null?
        @@mb_lightmap_get_probe_capture_tetrahedra = Bridge.get_method_bind("RenderingServer", "lightmap_get_probe_capture_tetrahedra", 788230395_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_lightmap_get_probe_capture_tetrahedra, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_lightmap_get_probe_capture_bsp_tree : Void* = Pointer(Void).null
    def lightmap_get_probe_capture_bsp_tree(lightmap : Int64) : Void*
      if @@mb_lightmap_get_probe_capture_bsp_tree.null?
        @@mb_lightmap_get_probe_capture_bsp_tree = Bridge.get_method_bind("RenderingServer", "lightmap_get_probe_capture_bsp_tree", 788230395_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_lightmap_get_probe_capture_bsp_tree, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_lightmap_set_baked_exposure_normalization : Void* = Pointer(Void).null
    def lightmap_set_baked_exposure_normalization(lightmap : Int64, baked_exposure : Float64) : Void
      if @@mb_lightmap_set_baked_exposure_normalization.null?
        @@mb_lightmap_set_baked_exposure_normalization = Bridge.get_method_bind("RenderingServer", "lightmap_set_baked_exposure_normalization", 1794382983_i64)
      end
      val_0 = lightmap
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = baked_exposure
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_lightmap_set_baked_exposure_normalization, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_lightmap_set_probe_capture_update_speed : Void* = Pointer(Void).null
    def lightmap_set_probe_capture_update_speed(speed : Float64) : Void
      if @@mb_lightmap_set_probe_capture_update_speed.null?
        @@mb_lightmap_set_probe_capture_update_speed = Bridge.get_method_bind("RenderingServer", "lightmap_set_probe_capture_update_speed", 373806689_i64)
      end
      val_0 = speed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_lightmap_set_probe_capture_update_speed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_create : Void* = Pointer(Void).null
    def particles_create() : Int64
      if @@mb_particles_create.null?
        @@mb_particles_create = Bridge.get_method_bind("RenderingServer", "particles_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_particles_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_particles_set_mode : Void* = Pointer(Void).null
    def particles_set_mode(particles : Int64, mode : Int64) : Void
      if @@mb_particles_set_mode.null?
        @@mb_particles_set_mode = Bridge.get_method_bind("RenderingServer", "particles_set_mode", 3492270028_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_emitting : Void* = Pointer(Void).null
    def particles_set_emitting(particles : Int64, emitting : Bool) : Void
      if @@mb_particles_set_emitting.null?
        @@mb_particles_set_emitting = Bridge.get_method_bind("RenderingServer", "particles_set_emitting", 1265174801_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = emitting
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_emitting, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_get_emitting : Void* = Pointer(Void).null
    def particles_get_emitting(particles : Int64) : Bool
      if @@mb_particles_get_emitting.null?
        @@mb_particles_get_emitting = Bridge.get_method_bind("RenderingServer", "particles_get_emitting", 3521089500_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_particles_get_emitting, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_particles_set_amount : Void* = Pointer(Void).null
    def particles_set_amount(particles : Int64, amount : Int64) : Void
      if @@mb_particles_set_amount.null?
        @@mb_particles_set_amount = Bridge.get_method_bind("RenderingServer", "particles_set_amount", 3411492887_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = amount
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_amount, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_amount_ratio : Void* = Pointer(Void).null
    def particles_set_amount_ratio(particles : Int64, ratio : Float64) : Void
      if @@mb_particles_set_amount_ratio.null?
        @@mb_particles_set_amount_ratio = Bridge.get_method_bind("RenderingServer", "particles_set_amount_ratio", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = ratio
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_amount_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_lifetime : Void* = Pointer(Void).null
    def particles_set_lifetime(particles : Int64, lifetime : Float64) : Void
      if @@mb_particles_set_lifetime.null?
        @@mb_particles_set_lifetime = Bridge.get_method_bind("RenderingServer", "particles_set_lifetime", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = lifetime
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_lifetime, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_one_shot : Void* = Pointer(Void).null
    def particles_set_one_shot(particles : Int64, one_shot : Bool) : Void
      if @@mb_particles_set_one_shot.null?
        @@mb_particles_set_one_shot = Bridge.get_method_bind("RenderingServer", "particles_set_one_shot", 1265174801_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = one_shot
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_one_shot, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_pre_process_time : Void* = Pointer(Void).null
    def particles_set_pre_process_time(particles : Int64, time : Float64) : Void
      if @@mb_particles_set_pre_process_time.null?
        @@mb_particles_set_pre_process_time = Bridge.get_method_bind("RenderingServer", "particles_set_pre_process_time", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = time
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_pre_process_time, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_request_process_time : Void* = Pointer(Void).null
    def particles_request_process_time(particles : Int64, process_time : Float64, process_time_residual : Float64) : Void
      if @@mb_particles_request_process_time.null?
        @@mb_particles_request_process_time = Bridge.get_method_bind("RenderingServer", "particles_request_process_time", 1515254041_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = process_time
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = process_time_residual
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_particles_request_process_time, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_explosiveness_ratio : Void* = Pointer(Void).null
    def particles_set_explosiveness_ratio(particles : Int64, ratio : Float64) : Void
      if @@mb_particles_set_explosiveness_ratio.null?
        @@mb_particles_set_explosiveness_ratio = Bridge.get_method_bind("RenderingServer", "particles_set_explosiveness_ratio", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = ratio
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_explosiveness_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_randomness_ratio : Void* = Pointer(Void).null
    def particles_set_randomness_ratio(particles : Int64, ratio : Float64) : Void
      if @@mb_particles_set_randomness_ratio.null?
        @@mb_particles_set_randomness_ratio = Bridge.get_method_bind("RenderingServer", "particles_set_randomness_ratio", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = ratio
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_randomness_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_interp_to_end : Void* = Pointer(Void).null
    def particles_set_interp_to_end(particles : Int64, factor : Float64) : Void
      if @@mb_particles_set_interp_to_end.null?
        @@mb_particles_set_interp_to_end = Bridge.get_method_bind("RenderingServer", "particles_set_interp_to_end", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = factor
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_interp_to_end, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_emitter_velocity : Void* = Pointer(Void).null
    def particles_set_emitter_velocity(particles : Int64, velocity : Vector3) : Void
      if @@mb_particles_set_emitter_velocity.null?
        @@mb_particles_set_emitter_velocity = Bridge.get_method_bind("RenderingServer", "particles_set_emitter_velocity", 3227306858_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = velocity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_emitter_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_custom_aabb : Void* = Pointer(Void).null
    def particles_set_custom_aabb(particles : Int64, aabb : AABB) : Void
      if @@mb_particles_set_custom_aabb.null?
        @@mb_particles_set_custom_aabb = Bridge.get_method_bind("RenderingServer", "particles_set_custom_aabb", 3696536120_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = aabb
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_custom_aabb, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_speed_scale : Void* = Pointer(Void).null
    def particles_set_speed_scale(particles : Int64, scale : Float64) : Void
      if @@mb_particles_set_speed_scale.null?
        @@mb_particles_set_speed_scale = Bridge.get_method_bind("RenderingServer", "particles_set_speed_scale", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_speed_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_use_local_coordinates : Void* = Pointer(Void).null
    def particles_set_use_local_coordinates(particles : Int64, enable : Bool) : Void
      if @@mb_particles_set_use_local_coordinates.null?
        @@mb_particles_set_use_local_coordinates = Bridge.get_method_bind("RenderingServer", "particles_set_use_local_coordinates", 1265174801_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_use_local_coordinates, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_process_material : Void* = Pointer(Void).null
    def particles_set_process_material(particles : Int64, material : Int64) : Void
      if @@mb_particles_set_process_material.null?
        @@mb_particles_set_process_material = Bridge.get_method_bind("RenderingServer", "particles_set_process_material", 395945892_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = material
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_process_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_fixed_fps : Void* = Pointer(Void).null
    def particles_set_fixed_fps(particles : Int64, fps : Int64) : Void
      if @@mb_particles_set_fixed_fps.null?
        @@mb_particles_set_fixed_fps = Bridge.get_method_bind("RenderingServer", "particles_set_fixed_fps", 3411492887_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = fps
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_fixed_fps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_interpolate : Void* = Pointer(Void).null
    def particles_set_interpolate(particles : Int64, enable : Bool) : Void
      if @@mb_particles_set_interpolate.null?
        @@mb_particles_set_interpolate = Bridge.get_method_bind("RenderingServer", "particles_set_interpolate", 1265174801_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_interpolate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_fractional_delta : Void* = Pointer(Void).null
    def particles_set_fractional_delta(particles : Int64, enable : Bool) : Void
      if @@mb_particles_set_fractional_delta.null?
        @@mb_particles_set_fractional_delta = Bridge.get_method_bind("RenderingServer", "particles_set_fractional_delta", 1265174801_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_fractional_delta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_collision_base_size : Void* = Pointer(Void).null
    def particles_set_collision_base_size(particles : Int64, size : Float64) : Void
      if @@mb_particles_set_collision_base_size.null?
        @@mb_particles_set_collision_base_size = Bridge.get_method_bind("RenderingServer", "particles_set_collision_base_size", 1794382983_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_collision_base_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_transform_align : Void* = Pointer(Void).null
    def particles_set_transform_align(particles : Int64, align : Int64) : Void
      if @@mb_particles_set_transform_align.null?
        @@mb_particles_set_transform_align = Bridge.get_method_bind("RenderingServer", "particles_set_transform_align", 3264971368_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = align
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_transform_align, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_transform_align_channel_filter : Void* = Pointer(Void).null
    def particles_set_transform_align_channel_filter(particles : Int64, channel_filter : Int64) : Void
      if @@mb_particles_set_transform_align_channel_filter.null?
        @@mb_particles_set_transform_align_channel_filter = Bridge.get_method_bind("RenderingServer", "particles_set_transform_align_channel_filter", 1303285813_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = channel_filter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_transform_align_channel_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_transform_align_axis : Void* = Pointer(Void).null
    def particles_set_transform_align_axis(particles : Int64, rotation_axis : Int64) : Void
      if @@mb_particles_set_transform_align_axis.null?
        @@mb_particles_set_transform_align_axis = Bridge.get_method_bind("RenderingServer", "particles_set_transform_align_axis", 3065310065_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rotation_axis
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_transform_align_axis, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_trails : Void* = Pointer(Void).null
    def particles_set_trails(particles : Int64, enable : Bool, length_sec : Float64) : Void
      if @@mb_particles_set_trails.null?
        @@mb_particles_set_trails = Bridge.get_method_bind("RenderingServer", "particles_set_trails", 2010054925_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = length_sec
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_particles_set_trails, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_trail_bind_poses : Void* = Pointer(Void).null
    def particles_set_trail_bind_poses(particles : Int64, bind_poses : Godot::Array) : Void
      if @@mb_particles_set_trail_bind_poses.null?
        @@mb_particles_set_trail_bind_poses = Bridge.get_method_bind("RenderingServer", "particles_set_trail_bind_poses", 684822712_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = bind_poses ? bind_poses.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_trail_bind_poses, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_is_inactive : Void* = Pointer(Void).null
    def particles_is_inactive(particles : Int64) : Bool
      if @@mb_particles_is_inactive.null?
        @@mb_particles_is_inactive = Bridge.get_method_bind("RenderingServer", "particles_is_inactive", 3521089500_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_particles_is_inactive, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_particles_request_process : Void* = Pointer(Void).null
    def particles_request_process(particles : Int64) : Void
      if @@mb_particles_request_process.null?
        @@mb_particles_request_process = Bridge.get_method_bind("RenderingServer", "particles_request_process", 2722037293_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_particles_request_process, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_restart : Void* = Pointer(Void).null
    def particles_restart(particles : Int64) : Void
      if @@mb_particles_restart.null?
        @@mb_particles_restart = Bridge.get_method_bind("RenderingServer", "particles_restart", 2722037293_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_particles_restart, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_subemitter : Void* = Pointer(Void).null
    def particles_set_subemitter(particles : Int64, subemitter_particles : Int64) : Void
      if @@mb_particles_set_subemitter.null?
        @@mb_particles_set_subemitter = Bridge.get_method_bind("RenderingServer", "particles_set_subemitter", 395945892_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = subemitter_particles
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_subemitter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_emit : Void* = Pointer(Void).null
    def particles_emit(particles : Int64, transform : Transform3D, velocity : Vector3, color : Color, custom : Color, emit_flags : Int64) : Void
      if @@mb_particles_emit.null?
        @@mb_particles_emit = Bridge.get_method_bind("RenderingServer", "particles_emit", 4043136117_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = velocity
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = color
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = custom
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = emit_flags
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_particles_emit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_draw_order : Void* = Pointer(Void).null
    def particles_set_draw_order(particles : Int64, order : Int64) : Void
      if @@mb_particles_set_draw_order.null?
        @@mb_particles_set_draw_order = Bridge.get_method_bind("RenderingServer", "particles_set_draw_order", 935028487_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = order
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_draw_order, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_draw_passes : Void* = Pointer(Void).null
    def particles_set_draw_passes(particles : Int64, count : Int64) : Void
      if @@mb_particles_set_draw_passes.null?
        @@mb_particles_set_draw_passes = Bridge.get_method_bind("RenderingServer", "particles_set_draw_passes", 3411492887_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_draw_passes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_set_draw_pass_mesh : Void* = Pointer(Void).null
    def particles_set_draw_pass_mesh(particles : Int64, pass : Int64, mesh : Int64) : Void
      if @@mb_particles_set_draw_pass_mesh.null?
        @@mb_particles_set_draw_pass_mesh = Bridge.get_method_bind("RenderingServer", "particles_set_draw_pass_mesh", 2310537182_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pass
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = mesh
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_particles_set_draw_pass_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_get_current_aabb : Void* = Pointer(Void).null
    def particles_get_current_aabb(particles : Int64) : AABB
      if @@mb_particles_get_current_aabb.null?
        @@mb_particles_get_current_aabb = Bridge.get_method_bind("RenderingServer", "particles_get_current_aabb", 3952830260_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_particles_get_current_aabb, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      AABB.new(ret_ptr)
    end
    @@mb_particles_set_emission_transform : Void* = Pointer(Void).null
    def particles_set_emission_transform(particles : Int64, transform : Transform3D) : Void
      if @@mb_particles_set_emission_transform.null?
        @@mb_particles_set_emission_transform = Bridge.get_method_bind("RenderingServer", "particles_set_emission_transform", 3935195649_i64)
      end
      val_0 = particles
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_set_emission_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_create : Void* = Pointer(Void).null
    def particles_collision_create() : Int64
      if @@mb_particles_collision_create.null?
        @@mb_particles_collision_create = Bridge.get_method_bind("RenderingServer", "particles_collision_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_particles_collision_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_particles_collision_set_collision_type : Void* = Pointer(Void).null
    def particles_collision_set_collision_type(particles_collision : Int64, get_type : Int64) : Void
      if @@mb_particles_collision_set_collision_type.null?
        @@mb_particles_collision_set_collision_type = Bridge.get_method_bind("RenderingServer", "particles_collision_set_collision_type", 1497044930_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_collision_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_cull_mask : Void* = Pointer(Void).null
    def particles_collision_set_cull_mask(particles_collision : Int64, mask : Int64) : Void
      if @@mb_particles_collision_set_cull_mask.null?
        @@mb_particles_collision_set_cull_mask = Bridge.get_method_bind("RenderingServer", "particles_collision_set_cull_mask", 3411492887_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_sphere_radius : Void* = Pointer(Void).null
    def particles_collision_set_sphere_radius(particles_collision : Int64, radius : Float64) : Void
      if @@mb_particles_collision_set_sphere_radius.null?
        @@mb_particles_collision_set_sphere_radius = Bridge.get_method_bind("RenderingServer", "particles_collision_set_sphere_radius", 1794382983_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = radius
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_sphere_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_box_extents : Void* = Pointer(Void).null
    def particles_collision_set_box_extents(particles_collision : Int64, extents : Vector3) : Void
      if @@mb_particles_collision_set_box_extents.null?
        @@mb_particles_collision_set_box_extents = Bridge.get_method_bind("RenderingServer", "particles_collision_set_box_extents", 3227306858_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = extents
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_box_extents, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_attractor_strength : Void* = Pointer(Void).null
    def particles_collision_set_attractor_strength(particles_collision : Int64, strength : Float64) : Void
      if @@mb_particles_collision_set_attractor_strength.null?
        @@mb_particles_collision_set_attractor_strength = Bridge.get_method_bind("RenderingServer", "particles_collision_set_attractor_strength", 1794382983_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = strength
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_attractor_strength, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_attractor_directionality : Void* = Pointer(Void).null
    def particles_collision_set_attractor_directionality(particles_collision : Int64, amount : Float64) : Void
      if @@mb_particles_collision_set_attractor_directionality.null?
        @@mb_particles_collision_set_attractor_directionality = Bridge.get_method_bind("RenderingServer", "particles_collision_set_attractor_directionality", 1794382983_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = amount
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_attractor_directionality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_attractor_attenuation : Void* = Pointer(Void).null
    def particles_collision_set_attractor_attenuation(particles_collision : Int64, curve : Float64) : Void
      if @@mb_particles_collision_set_attractor_attenuation.null?
        @@mb_particles_collision_set_attractor_attenuation = Bridge.get_method_bind("RenderingServer", "particles_collision_set_attractor_attenuation", 1794382983_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = curve
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_attractor_attenuation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_field_texture : Void* = Pointer(Void).null
    def particles_collision_set_field_texture(particles_collision : Int64, texture : Int64) : Void
      if @@mb_particles_collision_set_field_texture.null?
        @@mb_particles_collision_set_field_texture = Bridge.get_method_bind("RenderingServer", "particles_collision_set_field_texture", 395945892_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = texture
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_field_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_height_field_update : Void* = Pointer(Void).null
    def particles_collision_height_field_update(particles_collision : Int64) : Void
      if @@mb_particles_collision_height_field_update.null?
        @@mb_particles_collision_height_field_update = Bridge.get_method_bind("RenderingServer", "particles_collision_height_field_update", 2722037293_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_particles_collision_height_field_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_height_field_resolution : Void* = Pointer(Void).null
    def particles_collision_set_height_field_resolution(particles_collision : Int64, resolution : Int64) : Void
      if @@mb_particles_collision_set_height_field_resolution.null?
        @@mb_particles_collision_set_height_field_resolution = Bridge.get_method_bind("RenderingServer", "particles_collision_set_height_field_resolution", 962977297_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = resolution
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_height_field_resolution, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_particles_collision_set_height_field_mask : Void* = Pointer(Void).null
    def particles_collision_set_height_field_mask(particles_collision : Int64, mask : Int64) : Void
      if @@mb_particles_collision_set_height_field_mask.null?
        @@mb_particles_collision_set_height_field_mask = Bridge.get_method_bind("RenderingServer", "particles_collision_set_height_field_mask", 3411492887_i64)
      end
      val_0 = particles_collision
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_particles_collision_set_height_field_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_fog_volume_create : Void* = Pointer(Void).null
    def fog_volume_create() : Int64
      if @@mb_fog_volume_create.null?
        @@mb_fog_volume_create = Bridge.get_method_bind("RenderingServer", "fog_volume_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_fog_volume_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_fog_volume_set_shape : Void* = Pointer(Void).null
    def fog_volume_set_shape(fog_volume : Int64, shape : Int64) : Void
      if @@mb_fog_volume_set_shape.null?
        @@mb_fog_volume_set_shape = Bridge.get_method_bind("RenderingServer", "fog_volume_set_shape", 3818703106_i64)
      end
      val_0 = fog_volume
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_fog_volume_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_fog_volume_set_size : Void* = Pointer(Void).null
    def fog_volume_set_size(fog_volume : Int64, size : Vector3) : Void
      if @@mb_fog_volume_set_size.null?
        @@mb_fog_volume_set_size = Bridge.get_method_bind("RenderingServer", "fog_volume_set_size", 3227306858_i64)
      end
      val_0 = fog_volume
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_fog_volume_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_fog_volume_set_material : Void* = Pointer(Void).null
    def fog_volume_set_material(fog_volume : Int64, material : Int64) : Void
      if @@mb_fog_volume_set_material.null?
        @@mb_fog_volume_set_material = Bridge.get_method_bind("RenderingServer", "fog_volume_set_material", 395945892_i64)
      end
      val_0 = fog_volume
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = material
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_fog_volume_set_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_visibility_notifier_create : Void* = Pointer(Void).null
    def visibility_notifier_create() : Int64
      if @@mb_visibility_notifier_create.null?
        @@mb_visibility_notifier_create = Bridge.get_method_bind("RenderingServer", "visibility_notifier_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_visibility_notifier_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_visibility_notifier_set_aabb : Void* = Pointer(Void).null
    def visibility_notifier_set_aabb(notifier : Int64, aabb : AABB) : Void
      if @@mb_visibility_notifier_set_aabb.null?
        @@mb_visibility_notifier_set_aabb = Bridge.get_method_bind("RenderingServer", "visibility_notifier_set_aabb", 3696536120_i64)
      end
      val_0 = notifier
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = aabb
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_visibility_notifier_set_aabb, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_visibility_notifier_set_callbacks : Void* = Pointer(Void).null
    def visibility_notifier_set_callbacks(notifier : Int64, enter_callable : Void*, exit_callable : Void*) : Void
      if @@mb_visibility_notifier_set_callbacks.null?
        @@mb_visibility_notifier_set_callbacks = Bridge.get_method_bind("RenderingServer", "visibility_notifier_set_callbacks", 2689735388_i64)
      end
      val_0 = notifier
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enter_callable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = exit_callable
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_visibility_notifier_set_callbacks, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_occluder_create : Void* = Pointer(Void).null
    def occluder_create() : Int64
      if @@mb_occluder_create.null?
        @@mb_occluder_create = Bridge.get_method_bind("RenderingServer", "occluder_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_occluder_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_occluder_set_mesh : Void* = Pointer(Void).null
    def occluder_set_mesh(occluder : Int64, vertices : Void*, indices : Void*) : Void
      if @@mb_occluder_set_mesh.null?
        @@mb_occluder_set_mesh = Bridge.get_method_bind("RenderingServer", "occluder_set_mesh", 3854404263_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertices
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = indices
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_occluder_set_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_create : Void* = Pointer(Void).null
    def camera_create() : Int64
      if @@mb_camera_create.null?
        @@mb_camera_create = Bridge.get_method_bind("RenderingServer", "camera_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_camera_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_camera_set_perspective : Void* = Pointer(Void).null
    def camera_set_perspective(camera : Int64, fovy_degrees : Float64, z_near : Float64, z_far : Float64) : Void
      if @@mb_camera_set_perspective.null?
        @@mb_camera_set_perspective = Bridge.get_method_bind("RenderingServer", "camera_set_perspective", 157498339_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = fovy_degrees
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = z_near
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = z_far
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_camera_set_perspective, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_orthogonal : Void* = Pointer(Void).null
    def camera_set_orthogonal(camera : Int64, size : Float64, z_near : Float64, z_far : Float64) : Void
      if @@mb_camera_set_orthogonal.null?
        @@mb_camera_set_orthogonal = Bridge.get_method_bind("RenderingServer", "camera_set_orthogonal", 157498339_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = z_near
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = z_far
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_camera_set_orthogonal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_frustum : Void* = Pointer(Void).null
    def camera_set_frustum(camera : Int64, size : Float64, offset : Vector2, z_near : Float64, z_far : Float64) : Void
      if @@mb_camera_set_frustum.null?
        @@mb_camera_set_frustum = Bridge.get_method_bind("RenderingServer", "camera_set_frustum", 1889878953_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = z_near
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = z_far
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_camera_set_frustum, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_transform : Void* = Pointer(Void).null
    def camera_set_transform(camera : Int64, transform : Transform3D) : Void
      if @@mb_camera_set_transform.null?
        @@mb_camera_set_transform = Bridge.get_method_bind("RenderingServer", "camera_set_transform", 3935195649_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_camera_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_cull_mask : Void* = Pointer(Void).null
    def camera_set_cull_mask(camera : Int64, layers : Int64) : Void
      if @@mb_camera_set_cull_mask.null?
        @@mb_camera_set_cull_mask = Bridge.get_method_bind("RenderingServer", "camera_set_cull_mask", 3411492887_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layers
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_camera_set_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_environment : Void* = Pointer(Void).null
    def camera_set_environment(camera : Int64, env : Int64) : Void
      if @@mb_camera_set_environment.null?
        @@mb_camera_set_environment = Bridge.get_method_bind("RenderingServer", "camera_set_environment", 395945892_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = env
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_camera_set_environment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_camera_attributes : Void* = Pointer(Void).null
    def camera_set_camera_attributes(camera : Int64, effects : Int64) : Void
      if @@mb_camera_set_camera_attributes.null?
        @@mb_camera_set_camera_attributes = Bridge.get_method_bind("RenderingServer", "camera_set_camera_attributes", 395945892_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effects
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_camera_set_camera_attributes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_compositor : Void* = Pointer(Void).null
    def camera_set_compositor(camera : Int64, compositor : Int64) : Void
      if @@mb_camera_set_compositor.null?
        @@mb_camera_set_compositor = Bridge.get_method_bind("RenderingServer", "camera_set_compositor", 395945892_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = compositor
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_camera_set_compositor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_set_use_vertical_aspect : Void* = Pointer(Void).null
    def camera_set_use_vertical_aspect(camera : Int64, enable : Bool) : Void
      if @@mb_camera_set_use_vertical_aspect.null?
        @@mb_camera_set_use_vertical_aspect = Bridge.get_method_bind("RenderingServer", "camera_set_use_vertical_aspect", 1265174801_i64)
      end
      val_0 = camera
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_camera_set_use_vertical_aspect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_create : Void* = Pointer(Void).null
    def viewport_create() : Int64
      if @@mb_viewport_create.null?
        @@mb_viewport_create = Bridge.get_method_bind("RenderingServer", "viewport_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_viewport_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_viewport_set_use_xr : Void* = Pointer(Void).null
    def viewport_set_use_xr(viewport : Int64, use_xr : Bool) : Void
      if @@mb_viewport_set_use_xr.null?
        @@mb_viewport_set_use_xr = Bridge.get_method_bind("RenderingServer", "viewport_set_use_xr", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = use_xr
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_use_xr, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_size : Void* = Pointer(Void).null
    def viewport_set_size(viewport : Int64, width : Int64, height : Int64, view_count : Int64) : Void
      if @@mb_viewport_set_size.null?
        @@mb_viewport_set_size = Bridge.get_method_bind("RenderingServer", "viewport_set_size", 3313592705_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = height
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = view_count
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_viewport_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_active : Void* = Pointer(Void).null
    def viewport_set_active(viewport : Int64, active : Bool) : Void
      if @@mb_viewport_set_active.null?
        @@mb_viewport_set_active = Bridge.get_method_bind("RenderingServer", "viewport_set_active", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = active
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_parent_viewport : Void* = Pointer(Void).null
    def viewport_set_parent_viewport(viewport : Int64, parent_viewport : Int64) : Void
      if @@mb_viewport_set_parent_viewport.null?
        @@mb_viewport_set_parent_viewport = Bridge.get_method_bind("RenderingServer", "viewport_set_parent_viewport", 395945892_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parent_viewport
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_parent_viewport, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_attach_to_screen : Void* = Pointer(Void).null
    def viewport_attach_to_screen(viewport : Int64, rect : Rect2, screen : Int64) : Void
      if @@mb_viewport_attach_to_screen.null?
        @@mb_viewport_attach_to_screen = Bridge.get_method_bind("RenderingServer", "viewport_attach_to_screen", 1062245816_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = screen
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_viewport_attach_to_screen, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_render_direct_to_screen : Void* = Pointer(Void).null
    def viewport_set_render_direct_to_screen(viewport : Int64, enabled : Bool) : Void
      if @@mb_viewport_set_render_direct_to_screen.null?
        @@mb_viewport_set_render_direct_to_screen = Bridge.get_method_bind("RenderingServer", "viewport_set_render_direct_to_screen", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_render_direct_to_screen, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_canvas_cull_mask : Void* = Pointer(Void).null
    def viewport_set_canvas_cull_mask(viewport : Int64, canvas_cull_mask : Int64) : Void
      if @@mb_viewport_set_canvas_cull_mask.null?
        @@mb_viewport_set_canvas_cull_mask = Bridge.get_method_bind("RenderingServer", "viewport_set_canvas_cull_mask", 3411492887_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas_cull_mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_canvas_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_scaling_3d_mode : Void* = Pointer(Void).null
    def viewport_set_scaling_3d_mode(viewport : Int64, scaling_3d_mode : Int64) : Void
      if @@mb_viewport_set_scaling_3d_mode.null?
        @@mb_viewport_set_scaling_3d_mode = Bridge.get_method_bind("RenderingServer", "viewport_set_scaling_3d_mode", 2386524376_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scaling_3d_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_scaling_3d_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_scaling_3d_scale : Void* = Pointer(Void).null
    def viewport_set_scaling_3d_scale(viewport : Int64, scale : Float64) : Void
      if @@mb_viewport_set_scaling_3d_scale.null?
        @@mb_viewport_set_scaling_3d_scale = Bridge.get_method_bind("RenderingServer", "viewport_set_scaling_3d_scale", 1794382983_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_scaling_3d_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_fsr_sharpness : Void* = Pointer(Void).null
    def viewport_set_fsr_sharpness(viewport : Int64, sharpness : Float64) : Void
      if @@mb_viewport_set_fsr_sharpness.null?
        @@mb_viewport_set_fsr_sharpness = Bridge.get_method_bind("RenderingServer", "viewport_set_fsr_sharpness", 1794382983_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = sharpness
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_fsr_sharpness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_texture_mipmap_bias : Void* = Pointer(Void).null
    def viewport_set_texture_mipmap_bias(viewport : Int64, mipmap_bias : Float64) : Void
      if @@mb_viewport_set_texture_mipmap_bias.null?
        @@mb_viewport_set_texture_mipmap_bias = Bridge.get_method_bind("RenderingServer", "viewport_set_texture_mipmap_bias", 1794382983_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mipmap_bias
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_texture_mipmap_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_anisotropic_filtering_level : Void* = Pointer(Void).null
    def viewport_set_anisotropic_filtering_level(viewport : Int64, anisotropic_filtering_level : Int64) : Void
      if @@mb_viewport_set_anisotropic_filtering_level.null?
        @@mb_viewport_set_anisotropic_filtering_level = Bridge.get_method_bind("RenderingServer", "viewport_set_anisotropic_filtering_level", 3953214029_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = anisotropic_filtering_level
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_anisotropic_filtering_level, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_update_mode : Void* = Pointer(Void).null
    def viewport_set_update_mode(viewport : Int64, update_mode : Int64) : Void
      if @@mb_viewport_set_update_mode.null?
        @@mb_viewport_set_update_mode = Bridge.get_method_bind("RenderingServer", "viewport_set_update_mode", 3161116010_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = update_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_update_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_get_update_mode : Void* = Pointer(Void).null
    def viewport_get_update_mode(viewport : Int64) : Int64
      if @@mb_viewport_get_update_mode.null?
        @@mb_viewport_get_update_mode = Bridge.get_method_bind("RenderingServer", "viewport_get_update_mode", 3803901472_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_viewport_get_update_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_viewport_set_clear_mode : Void* = Pointer(Void).null
    def viewport_set_clear_mode(viewport : Int64, clear_mode : Int64) : Void
      if @@mb_viewport_set_clear_mode.null?
        @@mb_viewport_set_clear_mode = Bridge.get_method_bind("RenderingServer", "viewport_set_clear_mode", 3628367896_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = clear_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_clear_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_get_render_target : Void* = Pointer(Void).null
    def viewport_get_render_target(viewport : Int64) : Int64
      if @@mb_viewport_get_render_target.null?
        @@mb_viewport_get_render_target = Bridge.get_method_bind("RenderingServer", "viewport_get_render_target", 3814569979_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_viewport_get_render_target, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_viewport_get_texture : Void* = Pointer(Void).null
    def viewport_get_texture(viewport : Int64) : Int64
      if @@mb_viewport_get_texture.null?
        @@mb_viewport_get_texture = Bridge.get_method_bind("RenderingServer", "viewport_get_texture", 3814569979_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_viewport_get_texture, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_viewport_set_disable_3d : Void* = Pointer(Void).null
    def viewport_set_disable_3d(viewport : Int64, disable : Bool) : Void
      if @@mb_viewport_set_disable_3d.null?
        @@mb_viewport_set_disable_3d = Bridge.get_method_bind("RenderingServer", "viewport_set_disable_3d", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_disable_3d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_disable_2d : Void* = Pointer(Void).null
    def viewport_set_disable_2d(viewport : Int64, disable : Bool) : Void
      if @@mb_viewport_set_disable_2d.null?
        @@mb_viewport_set_disable_2d = Bridge.get_method_bind("RenderingServer", "viewport_set_disable_2d", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_disable_2d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_environment_mode : Void* = Pointer(Void).null
    def viewport_set_environment_mode(viewport : Int64, mode : Int64) : Void
      if @@mb_viewport_set_environment_mode.null?
        @@mb_viewport_set_environment_mode = Bridge.get_method_bind("RenderingServer", "viewport_set_environment_mode", 2196892182_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_environment_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_attach_camera : Void* = Pointer(Void).null
    def viewport_attach_camera(viewport : Int64, camera : Int64) : Void
      if @@mb_viewport_attach_camera.null?
        @@mb_viewport_attach_camera = Bridge.get_method_bind("RenderingServer", "viewport_attach_camera", 395945892_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = camera
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_attach_camera, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_scenario : Void* = Pointer(Void).null
    def viewport_set_scenario(viewport : Int64, scenario : Int64) : Void
      if @@mb_viewport_set_scenario.null?
        @@mb_viewport_set_scenario = Bridge.get_method_bind("RenderingServer", "viewport_set_scenario", 395945892_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scenario
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_scenario, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_attach_canvas : Void* = Pointer(Void).null
    def viewport_attach_canvas(viewport : Int64, canvas : Int64) : Void
      if @@mb_viewport_attach_canvas.null?
        @@mb_viewport_attach_canvas = Bridge.get_method_bind("RenderingServer", "viewport_attach_canvas", 395945892_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_attach_canvas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_remove_canvas : Void* = Pointer(Void).null
    def viewport_remove_canvas(viewport : Int64, canvas : Int64) : Void
      if @@mb_viewport_remove_canvas.null?
        @@mb_viewport_remove_canvas = Bridge.get_method_bind("RenderingServer", "viewport_remove_canvas", 395945892_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_remove_canvas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_snap_2d_transforms_to_pixel : Void* = Pointer(Void).null
    def viewport_set_snap_2d_transforms_to_pixel(viewport : Int64, enabled : Bool) : Void
      if @@mb_viewport_set_snap_2d_transforms_to_pixel.null?
        @@mb_viewport_set_snap_2d_transforms_to_pixel = Bridge.get_method_bind("RenderingServer", "viewport_set_snap_2d_transforms_to_pixel", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_snap_2d_transforms_to_pixel, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_snap_2d_vertices_to_pixel : Void* = Pointer(Void).null
    def viewport_set_snap_2d_vertices_to_pixel(viewport : Int64, enabled : Bool) : Void
      if @@mb_viewport_set_snap_2d_vertices_to_pixel.null?
        @@mb_viewport_set_snap_2d_vertices_to_pixel = Bridge.get_method_bind("RenderingServer", "viewport_set_snap_2d_vertices_to_pixel", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_snap_2d_vertices_to_pixel, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_default_canvas_item_texture_filter : Void* = Pointer(Void).null
    def viewport_set_default_canvas_item_texture_filter(viewport : Int64, filter : Int64) : Void
      if @@mb_viewport_set_default_canvas_item_texture_filter.null?
        @@mb_viewport_set_default_canvas_item_texture_filter = Bridge.get_method_bind("RenderingServer", "viewport_set_default_canvas_item_texture_filter", 1155129294_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = filter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_default_canvas_item_texture_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_default_canvas_item_texture_repeat : Void* = Pointer(Void).null
    def viewport_set_default_canvas_item_texture_repeat(viewport : Int64, repeat : Int64) : Void
      if @@mb_viewport_set_default_canvas_item_texture_repeat.null?
        @@mb_viewport_set_default_canvas_item_texture_repeat = Bridge.get_method_bind("RenderingServer", "viewport_set_default_canvas_item_texture_repeat", 1652956681_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = repeat
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_default_canvas_item_texture_repeat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_canvas_transform : Void* = Pointer(Void).null
    def viewport_set_canvas_transform(viewport : Int64, canvas : Int64, offset : Transform2D) : Void
      if @@mb_viewport_set_canvas_transform.null?
        @@mb_viewport_set_canvas_transform = Bridge.get_method_bind("RenderingServer", "viewport_set_canvas_transform", 3608606053_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = offset
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_viewport_set_canvas_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_canvas_stacking : Void* = Pointer(Void).null
    def viewport_set_canvas_stacking(viewport : Int64, canvas : Int64, layer : Int64, sublayer : Int64) : Void
      if @@mb_viewport_set_canvas_stacking.null?
        @@mb_viewport_set_canvas_stacking = Bridge.get_method_bind("RenderingServer", "viewport_set_canvas_stacking", 3713930247_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = layer
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = sublayer
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_viewport_set_canvas_stacking, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_transparent_background : Void* = Pointer(Void).null
    def viewport_set_transparent_background(viewport : Int64, enabled : Bool) : Void
      if @@mb_viewport_set_transparent_background.null?
        @@mb_viewport_set_transparent_background = Bridge.get_method_bind("RenderingServer", "viewport_set_transparent_background", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_transparent_background, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_global_canvas_transform : Void* = Pointer(Void).null
    def viewport_set_global_canvas_transform(viewport : Int64, transform : Transform2D) : Void
      if @@mb_viewport_set_global_canvas_transform.null?
        @@mb_viewport_set_global_canvas_transform = Bridge.get_method_bind("RenderingServer", "viewport_set_global_canvas_transform", 1246044741_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_global_canvas_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_sdf_oversize_and_scale : Void* = Pointer(Void).null
    def viewport_set_sdf_oversize_and_scale(viewport : Int64, oversize : Int64, scale : Int64) : Void
      if @@mb_viewport_set_sdf_oversize_and_scale.null?
        @@mb_viewport_set_sdf_oversize_and_scale = Bridge.get_method_bind("RenderingServer", "viewport_set_sdf_oversize_and_scale", 1329198632_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = oversize
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = scale
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_viewport_set_sdf_oversize_and_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_positional_shadow_atlas_size : Void* = Pointer(Void).null
    def viewport_set_positional_shadow_atlas_size(viewport : Int64, size : Int64, use_16_bits : Bool) : Void
      if @@mb_viewport_set_positional_shadow_atlas_size.null?
        @@mb_viewport_set_positional_shadow_atlas_size = Bridge.get_method_bind("RenderingServer", "viewport_set_positional_shadow_atlas_size", 1904426712_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = use_16_bits
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_viewport_set_positional_shadow_atlas_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_positional_shadow_atlas_quadrant_subdivision : Void* = Pointer(Void).null
    def viewport_set_positional_shadow_atlas_quadrant_subdivision(viewport : Int64, quadrant : Int64, subdivision : Int64) : Void
      if @@mb_viewport_set_positional_shadow_atlas_quadrant_subdivision.null?
        @@mb_viewport_set_positional_shadow_atlas_quadrant_subdivision = Bridge.get_method_bind("RenderingServer", "viewport_set_positional_shadow_atlas_quadrant_subdivision", 4288446313_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = quadrant
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = subdivision
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_viewport_set_positional_shadow_atlas_quadrant_subdivision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_msaa_3d : Void* = Pointer(Void).null
    def viewport_set_msaa_3d(viewport : Int64, msaa : Int64) : Void
      if @@mb_viewport_set_msaa_3d.null?
        @@mb_viewport_set_msaa_3d = Bridge.get_method_bind("RenderingServer", "viewport_set_msaa_3d", 3764433340_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = msaa
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_msaa_3d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_msaa_2d : Void* = Pointer(Void).null
    def viewport_set_msaa_2d(viewport : Int64, msaa : Int64) : Void
      if @@mb_viewport_set_msaa_2d.null?
        @@mb_viewport_set_msaa_2d = Bridge.get_method_bind("RenderingServer", "viewport_set_msaa_2d", 3764433340_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = msaa
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_msaa_2d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_use_hdr_2d : Void* = Pointer(Void).null
    def viewport_set_use_hdr_2d(viewport : Int64, enabled : Bool) : Void
      if @@mb_viewport_set_use_hdr_2d.null?
        @@mb_viewport_set_use_hdr_2d = Bridge.get_method_bind("RenderingServer", "viewport_set_use_hdr_2d", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_use_hdr_2d, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_screen_space_aa : Void* = Pointer(Void).null
    def viewport_set_screen_space_aa(viewport : Int64, mode : Int64) : Void
      if @@mb_viewport_set_screen_space_aa.null?
        @@mb_viewport_set_screen_space_aa = Bridge.get_method_bind("RenderingServer", "viewport_set_screen_space_aa", 1447279591_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_screen_space_aa, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_use_taa : Void* = Pointer(Void).null
    def viewport_set_use_taa(viewport : Int64, enable : Bool) : Void
      if @@mb_viewport_set_use_taa.null?
        @@mb_viewport_set_use_taa = Bridge.get_method_bind("RenderingServer", "viewport_set_use_taa", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_use_taa, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_use_debanding : Void* = Pointer(Void).null
    def viewport_set_use_debanding(viewport : Int64, enable : Bool) : Void
      if @@mb_viewport_set_use_debanding.null?
        @@mb_viewport_set_use_debanding = Bridge.get_method_bind("RenderingServer", "viewport_set_use_debanding", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_use_debanding, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_use_occlusion_culling : Void* = Pointer(Void).null
    def viewport_set_use_occlusion_culling(viewport : Int64, enable : Bool) : Void
      if @@mb_viewport_set_use_occlusion_culling.null?
        @@mb_viewport_set_use_occlusion_culling = Bridge.get_method_bind("RenderingServer", "viewport_set_use_occlusion_culling", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_use_occlusion_culling, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_occlusion_rays_per_thread : Void* = Pointer(Void).null
    def viewport_set_occlusion_rays_per_thread(rays_per_thread : Int64) : Void
      if @@mb_viewport_set_occlusion_rays_per_thread.null?
        @@mb_viewport_set_occlusion_rays_per_thread = Bridge.get_method_bind("RenderingServer", "viewport_set_occlusion_rays_per_thread", 1286410249_i64)
      end
      val_0 = rays_per_thread
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_viewport_set_occlusion_rays_per_thread, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_occlusion_culling_build_quality : Void* = Pointer(Void).null
    def viewport_set_occlusion_culling_build_quality(quality : Int64) : Void
      if @@mb_viewport_set_occlusion_culling_build_quality.null?
        @@mb_viewport_set_occlusion_culling_build_quality = Bridge.get_method_bind("RenderingServer", "viewport_set_occlusion_culling_build_quality", 2069725696_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_viewport_set_occlusion_culling_build_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_get_render_info : Void* = Pointer(Void).null
    def viewport_get_render_info(viewport : Int64, get_type : Int64, info : Int64) : Int64
      if @@mb_viewport_get_render_info.null?
        @@mb_viewport_get_render_info = Bridge.get_method_bind("RenderingServer", "viewport_get_render_info", 2041262392_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = info
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_viewport_get_render_info, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_viewport_set_debug_draw : Void* = Pointer(Void).null
    def viewport_set_debug_draw(viewport : Int64, draw : Int64) : Void
      if @@mb_viewport_set_debug_draw.null?
        @@mb_viewport_set_debug_draw = Bridge.get_method_bind("RenderingServer", "viewport_set_debug_draw", 2089420930_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = draw
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_debug_draw, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_measure_render_time : Void* = Pointer(Void).null
    def viewport_set_measure_render_time(viewport : Int64, enable : Bool) : Void
      if @@mb_viewport_set_measure_render_time.null?
        @@mb_viewport_set_measure_render_time = Bridge.get_method_bind("RenderingServer", "viewport_set_measure_render_time", 1265174801_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_measure_render_time, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_get_measured_render_time_cpu : Void* = Pointer(Void).null
    def viewport_get_measured_render_time_cpu(viewport : Int64) : Float64
      if @@mb_viewport_get_measured_render_time_cpu.null?
        @@mb_viewport_get_measured_render_time_cpu = Bridge.get_method_bind("RenderingServer", "viewport_get_measured_render_time_cpu", 866169185_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_viewport_get_measured_render_time_cpu, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_viewport_get_measured_render_time_gpu : Void* = Pointer(Void).null
    def viewport_get_measured_render_time_gpu(viewport : Int64) : Float64
      if @@mb_viewport_get_measured_render_time_gpu.null?
        @@mb_viewport_get_measured_render_time_gpu = Bridge.get_method_bind("RenderingServer", "viewport_get_measured_render_time_gpu", 866169185_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_viewport_get_measured_render_time_gpu, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_viewport_set_vrs_mode : Void* = Pointer(Void).null
    def viewport_set_vrs_mode(viewport : Int64, mode : Int64) : Void
      if @@mb_viewport_set_vrs_mode.null?
        @@mb_viewport_set_vrs_mode = Bridge.get_method_bind("RenderingServer", "viewport_set_vrs_mode", 398809874_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_vrs_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_vrs_update_mode : Void* = Pointer(Void).null
    def viewport_set_vrs_update_mode(viewport : Int64, mode : Int64) : Void
      if @@mb_viewport_set_vrs_update_mode.null?
        @@mb_viewport_set_vrs_update_mode = Bridge.get_method_bind("RenderingServer", "viewport_set_vrs_update_mode", 2696154815_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_vrs_update_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_viewport_set_vrs_texture : Void* = Pointer(Void).null
    def viewport_set_vrs_texture(viewport : Int64, texture : Int64) : Void
      if @@mb_viewport_set_vrs_texture.null?
        @@mb_viewport_set_vrs_texture = Bridge.get_method_bind("RenderingServer", "viewport_set_vrs_texture", 395945892_i64)
      end
      val_0 = viewport
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = texture
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_viewport_set_vrs_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_sky_create : Void* = Pointer(Void).null
    def sky_create() : Int64
      if @@mb_sky_create.null?
        @@mb_sky_create = Bridge.get_method_bind("RenderingServer", "sky_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_sky_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_sky_set_radiance_size : Void* = Pointer(Void).null
    def sky_set_radiance_size(sky : Int64, radiance_size : Int64) : Void
      if @@mb_sky_set_radiance_size.null?
        @@mb_sky_set_radiance_size = Bridge.get_method_bind("RenderingServer", "sky_set_radiance_size", 3411492887_i64)
      end
      val_0 = sky
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = radiance_size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_sky_set_radiance_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_sky_set_mode : Void* = Pointer(Void).null
    def sky_set_mode(sky : Int64, mode : Int64) : Void
      if @@mb_sky_set_mode.null?
        @@mb_sky_set_mode = Bridge.get_method_bind("RenderingServer", "sky_set_mode", 3279019937_i64)
      end
      val_0 = sky
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_sky_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_sky_set_material : Void* = Pointer(Void).null
    def sky_set_material(sky : Int64, material : Int64) : Void
      if @@mb_sky_set_material.null?
        @@mb_sky_set_material = Bridge.get_method_bind("RenderingServer", "sky_set_material", 395945892_i64)
      end
      val_0 = sky
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = material
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_sky_set_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_sky_bake_panorama : Void* = Pointer(Void).null
    def sky_bake_panorama(sky : Int64, energy : Float64, bake_irradiance : Bool, size : Vector2i) : Image
      if @@mb_sky_bake_panorama.null?
        @@mb_sky_bake_panorama = Bridge.get_method_bind("RenderingServer", "sky_bake_panorama", 3875285818_i64)
      end
      val_0 = sky
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = energy
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = bake_irradiance
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = size
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_sky_bake_panorama, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_compositor_effect_create : Void* = Pointer(Void).null
    def compositor_effect_create() : Int64
      if @@mb_compositor_effect_create.null?
        @@mb_compositor_effect_create = Bridge.get_method_bind("RenderingServer", "compositor_effect_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_compositor_effect_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_compositor_effect_set_enabled : Void* = Pointer(Void).null
    def compositor_effect_set_enabled(effect : Int64, enabled : Bool) : Void
      if @@mb_compositor_effect_set_enabled.null?
        @@mb_compositor_effect_set_enabled = Bridge.get_method_bind("RenderingServer", "compositor_effect_set_enabled", 1265174801_i64)
      end
      val_0 = effect
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_compositor_effect_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_compositor_effect_set_callback : Void* = Pointer(Void).null
    def compositor_effect_set_callback(effect : Int64, callback_type : Int64, callback : Void*) : Void
      if @@mb_compositor_effect_set_callback.null?
        @@mb_compositor_effect_set_callback = Bridge.get_method_bind("RenderingServer", "compositor_effect_set_callback", 487412485_i64)
      end
      val_0 = effect
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callback_type
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_compositor_effect_set_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_compositor_effect_set_flag : Void* = Pointer(Void).null
    def compositor_effect_set_flag(effect : Int64, flag : Int64, set : Bool) : Void
      if @@mb_compositor_effect_set_flag.null?
        @@mb_compositor_effect_set_flag = Bridge.get_method_bind("RenderingServer", "compositor_effect_set_flag", 3659527075_i64)
      end
      val_0 = effect
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flag
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = set
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_compositor_effect_set_flag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_compositor_create : Void* = Pointer(Void).null
    def compositor_create() : Int64
      if @@mb_compositor_create.null?
        @@mb_compositor_create = Bridge.get_method_bind("RenderingServer", "compositor_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_compositor_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_compositor_set_compositor_effects : Void* = Pointer(Void).null
    def compositor_set_compositor_effects(compositor : Int64, effects : Godot::Array) : Void
      if @@mb_compositor_set_compositor_effects.null?
        @@mb_compositor_set_compositor_effects = Bridge.get_method_bind("RenderingServer", "compositor_set_compositor_effects", 684822712_i64)
      end
      val_0 = compositor
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = effects ? effects.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_compositor_set_compositor_effects, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_create : Void* = Pointer(Void).null
    def environment_create() : Int64
      if @@mb_environment_create.null?
        @@mb_environment_create = Bridge.get_method_bind("RenderingServer", "environment_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_environment_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_environment_set_background : Void* = Pointer(Void).null
    def environment_set_background(env : Int64, bg : Int64) : Void
      if @@mb_environment_set_background.null?
        @@mb_environment_set_background = Bridge.get_method_bind("RenderingServer", "environment_set_background", 3937328877_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bg
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_background, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_camera_id : Void* = Pointer(Void).null
    def environment_set_camera_id(env : Int64, id : Int64) : Void
      if @@mb_environment_set_camera_id.null?
        @@mb_environment_set_camera_id = Bridge.get_method_bind("RenderingServer", "environment_set_camera_id", 3411492887_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_camera_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_sky : Void* = Pointer(Void).null
    def environment_set_sky(env : Int64, sky : Int64) : Void
      if @@mb_environment_set_sky.null?
        @@mb_environment_set_sky = Bridge.get_method_bind("RenderingServer", "environment_set_sky", 395945892_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = sky
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_sky, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_sky_custom_fov : Void* = Pointer(Void).null
    def environment_set_sky_custom_fov(env : Int64, scale : Float64) : Void
      if @@mb_environment_set_sky_custom_fov.null?
        @@mb_environment_set_sky_custom_fov = Bridge.get_method_bind("RenderingServer", "environment_set_sky_custom_fov", 1794382983_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_sky_custom_fov, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_sky_orientation : Void* = Pointer(Void).null
    def environment_set_sky_orientation(env : Int64, orientation : Basis) : Void
      if @@mb_environment_set_sky_orientation.null?
        @@mb_environment_set_sky_orientation = Bridge.get_method_bind("RenderingServer", "environment_set_sky_orientation", 1735850857_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = orientation
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_sky_orientation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_bg_color : Void* = Pointer(Void).null
    def environment_set_bg_color(env : Int64, color : Color) : Void
      if @@mb_environment_set_bg_color.null?
        @@mb_environment_set_bg_color = Bridge.get_method_bind("RenderingServer", "environment_set_bg_color", 2948539648_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_bg_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_bg_energy : Void* = Pointer(Void).null
    def environment_set_bg_energy(env : Int64, multiplier : Float64, exposure_value : Float64) : Void
      if @@mb_environment_set_bg_energy.null?
        @@mb_environment_set_bg_energy = Bridge.get_method_bind("RenderingServer", "environment_set_bg_energy", 2513314492_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = multiplier
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = exposure_value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_environment_set_bg_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_canvas_max_layer : Void* = Pointer(Void).null
    def environment_set_canvas_max_layer(env : Int64, max_layer : Int64) : Void
      if @@mb_environment_set_canvas_max_layer.null?
        @@mb_environment_set_canvas_max_layer = Bridge.get_method_bind("RenderingServer", "environment_set_canvas_max_layer", 3411492887_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = max_layer
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_canvas_max_layer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_ambient_light : Void* = Pointer(Void).null
    def environment_set_ambient_light(env : Int64, color : Color, ambient : Int64, energy : Float64, sky_contribution : Float64, reflection_source : Int64) : Void
      if @@mb_environment_set_ambient_light.null?
        @@mb_environment_set_ambient_light = Bridge.get_method_bind("RenderingServer", "environment_set_ambient_light", 1214961493_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = ambient
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = energy
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = sky_contribution
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = reflection_source
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_environment_set_ambient_light, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_glow : Void* = Pointer(Void).null
    def environment_set_glow(env : Int64, enable : Bool, levels : Void*, intensity : Float64, strength : Float64, mix : Float64, bloom_threshold : Float64, blend_mode : Int64, hdr_bleed_threshold : Float64, hdr_bleed_scale : Float64, hdr_luminance_cap : Float64, glow_map_strength : Float64, glow_map : Int64) : Void
      if @@mb_environment_set_glow.null?
        @@mb_environment_set_glow = Bridge.get_method_bind("RenderingServer", "environment_set_glow", 2421724940_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = levels
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = intensity
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = strength
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = mix
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = bloom_threshold
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = blend_mode
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = hdr_bleed_threshold
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = hdr_bleed_scale
      arg_9 = pointerof(val_9).as(Void*)
      val_10 = hdr_luminance_cap
      arg_10 = pointerof(val_10).as(Void*)
      val_11 = glow_map_strength
      arg_11 = pointerof(val_11).as(Void*)
      val_12 = glow_map
      arg_12 = pointerof(val_12).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10, arg_11, arg_12]
      Bridge.ptrcall(@@mb_environment_set_glow, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_tonemap : Void* = Pointer(Void).null
    def environment_set_tonemap(env : Int64, tone_mapper : Int64, exposure : Float64, white : Float64) : Void
      if @@mb_environment_set_tonemap.null?
        @@mb_environment_set_tonemap = Bridge.get_method_bind("RenderingServer", "environment_set_tonemap", 2914312638_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tone_mapper
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = exposure
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = white
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_environment_set_tonemap, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_tonemap_agx_contrast : Void* = Pointer(Void).null
    def environment_set_tonemap_agx_contrast(env : Int64, agx_contrast : Float64) : Void
      if @@mb_environment_set_tonemap_agx_contrast.null?
        @@mb_environment_set_tonemap_agx_contrast = Bridge.get_method_bind("RenderingServer", "environment_set_tonemap_agx_contrast", 1794382983_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = agx_contrast
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_tonemap_agx_contrast, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_adjustment : Void* = Pointer(Void).null
    def environment_set_adjustment(env : Int64, enable : Bool, brightness : Float64, contrast : Float64, saturation : Float64, use_1d_color_correction : Bool, color_correction : Int64) : Void
      if @@mb_environment_set_adjustment.null?
        @@mb_environment_set_adjustment = Bridge.get_method_bind("RenderingServer", "environment_set_adjustment", 876799838_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = brightness
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = contrast
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = saturation
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = use_1d_color_correction
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = color_correction
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      Bridge.ptrcall(@@mb_environment_set_adjustment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_ssr : Void* = Pointer(Void).null
    def environment_set_ssr(env : Int64, enable : Bool, max_steps : Int64, fade_in : Float64, fade_out : Float64, depth_tolerance : Float64) : Void
      if @@mb_environment_set_ssr.null?
        @@mb_environment_set_ssr = Bridge.get_method_bind("RenderingServer", "environment_set_ssr", 3607294374_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max_steps
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = fade_in
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = fade_out
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = depth_tolerance
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_environment_set_ssr, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_ssao : Void* = Pointer(Void).null
    def environment_set_ssao(env : Int64, enable : Bool, radius : Float64, intensity : Float64, power : Float64, detail : Float64, horizon : Float64, sharpness : Float64, light_affect : Float64, ao_channel_affect : Float64) : Void
      if @@mb_environment_set_ssao.null?
        @@mb_environment_set_ssao = Bridge.get_method_bind("RenderingServer", "environment_set_ssao", 3994732740_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = radius
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = intensity
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = power
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = detail
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = horizon
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = sharpness
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = light_affect
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = ao_channel_affect
      arg_9 = pointerof(val_9).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9]
      Bridge.ptrcall(@@mb_environment_set_ssao, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_fog : Void* = Pointer(Void).null
    def environment_set_fog(env : Int64, enable : Bool, light_color : Color, light_energy : Float64, sun_scatter : Float64, density : Float64, height : Float64, height_density : Float64, aerial_perspective : Float64, sky_affect : Float64, fog_mode : Int64) : Void
      if @@mb_environment_set_fog.null?
        @@mb_environment_set_fog = Bridge.get_method_bind("RenderingServer", "environment_set_fog", 105051629_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = light_color
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = light_energy
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = sun_scatter
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = density
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = height
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = height_density
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = aerial_perspective
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = sky_affect
      arg_9 = pointerof(val_9).as(Void*)
      val_10 = fog_mode
      arg_10 = pointerof(val_10).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10]
      Bridge.ptrcall(@@mb_environment_set_fog, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_fog_depth : Void* = Pointer(Void).null
    def environment_set_fog_depth(env : Int64, curve : Float64, begin_val : Float64, end_val : Float64) : Void
      if @@mb_environment_set_fog_depth.null?
        @@mb_environment_set_fog_depth = Bridge.get_method_bind("RenderingServer", "environment_set_fog_depth", 157498339_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = curve
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = begin_val
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = end_val
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_environment_set_fog_depth, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_sdfgi : Void* = Pointer(Void).null
    def environment_set_sdfgi(env : Int64, enable : Bool, cascades : Int64, min_cell_size : Float64, y_scale : Int64, use_occlusion : Bool, bounce_feedback : Float64, read_sky : Bool, energy : Float64, normal_bias : Float64, probe_bias : Float64) : Void
      if @@mb_environment_set_sdfgi.null?
        @@mb_environment_set_sdfgi = Bridge.get_method_bind("RenderingServer", "environment_set_sdfgi", 3519144388_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = cascades
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = min_cell_size
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = y_scale
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = use_occlusion
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = bounce_feedback
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = read_sky
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = energy
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = normal_bias
      arg_9 = pointerof(val_9).as(Void*)
      val_10 = probe_bias
      arg_10 = pointerof(val_10).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10]
      Bridge.ptrcall(@@mb_environment_set_sdfgi, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_volumetric_fog : Void* = Pointer(Void).null
    def environment_set_volumetric_fog(env : Int64, enable : Bool, density : Float64, albedo : Color, emission : Color, emission_energy : Float64, anisotropy : Float64, length : Float64, detail_spread : Float64, gi_inject : Float64, temporal_reprojection : Bool, temporal_reprojection_amount : Float64, ambient_inject : Float64, sky_affect : Float64) : Void
      if @@mb_environment_set_volumetric_fog.null?
        @@mb_environment_set_volumetric_fog = Bridge.get_method_bind("RenderingServer", "environment_set_volumetric_fog", 1553633833_i64)
      end
      val_0 = env
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = density
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = albedo
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = emission
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = emission_energy
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = anisotropy
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = length
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = detail_spread
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = gi_inject
      arg_9 = pointerof(val_9).as(Void*)
      val_10 = temporal_reprojection
      arg_10 = pointerof(val_10).as(Void*)
      val_11 = temporal_reprojection_amount
      arg_11 = pointerof(val_11).as(Void*)
      val_12 = ambient_inject
      arg_12 = pointerof(val_12).as(Void*)
      val_13 = sky_affect
      arg_13 = pointerof(val_13).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9, arg_10, arg_11, arg_12, arg_13]
      Bridge.ptrcall(@@mb_environment_set_volumetric_fog, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_glow_set_use_bicubic_upscale : Void* = Pointer(Void).null
    def environment_glow_set_use_bicubic_upscale(enable : Bool) : Void
      if @@mb_environment_glow_set_use_bicubic_upscale.null?
        @@mb_environment_glow_set_use_bicubic_upscale = Bridge.get_method_bind("RenderingServer", "environment_glow_set_use_bicubic_upscale", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_environment_glow_set_use_bicubic_upscale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_ssr_half_size : Void* = Pointer(Void).null
    def environment_set_ssr_half_size(half_size : Bool) : Void
      if @@mb_environment_set_ssr_half_size.null?
        @@mb_environment_set_ssr_half_size = Bridge.get_method_bind("RenderingServer", "environment_set_ssr_half_size", 2586408642_i64)
      end
      val_0 = half_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_environment_set_ssr_half_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_ssr_roughness_quality : Void* = Pointer(Void).null
    def environment_set_ssr_roughness_quality(quality : Int64) : Void
      if @@mb_environment_set_ssr_roughness_quality.null?
        @@mb_environment_set_ssr_roughness_quality = Bridge.get_method_bind("RenderingServer", "environment_set_ssr_roughness_quality", 1190026788_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_environment_set_ssr_roughness_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_ssao_quality : Void* = Pointer(Void).null
    def environment_set_ssao_quality(quality : Int64, half_size : Bool, adaptive_target : Float64, blur_passes : Int64, fadeout_from : Float64, fadeout_to : Float64) : Void
      if @@mb_environment_set_ssao_quality.null?
        @@mb_environment_set_ssao_quality = Bridge.get_method_bind("RenderingServer", "environment_set_ssao_quality", 189753569_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = half_size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = adaptive_target
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = blur_passes
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = fadeout_from
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = fadeout_to
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_environment_set_ssao_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_ssil_quality : Void* = Pointer(Void).null
    def environment_set_ssil_quality(quality : Int64, half_size : Bool, adaptive_target : Float64, blur_passes : Int64, fadeout_from : Float64, fadeout_to : Float64) : Void
      if @@mb_environment_set_ssil_quality.null?
        @@mb_environment_set_ssil_quality = Bridge.get_method_bind("RenderingServer", "environment_set_ssil_quality", 1713836683_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = half_size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = adaptive_target
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = blur_passes
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = fadeout_from
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = fadeout_to
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_environment_set_ssil_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_sdfgi_ray_count : Void* = Pointer(Void).null
    def environment_set_sdfgi_ray_count(ray_count : Int64) : Void
      if @@mb_environment_set_sdfgi_ray_count.null?
        @@mb_environment_set_sdfgi_ray_count = Bridge.get_method_bind("RenderingServer", "environment_set_sdfgi_ray_count", 340137951_i64)
      end
      val_0 = ray_count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_environment_set_sdfgi_ray_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_sdfgi_frames_to_converge : Void* = Pointer(Void).null
    def environment_set_sdfgi_frames_to_converge(frames : Int64) : Void
      if @@mb_environment_set_sdfgi_frames_to_converge.null?
        @@mb_environment_set_sdfgi_frames_to_converge = Bridge.get_method_bind("RenderingServer", "environment_set_sdfgi_frames_to_converge", 2182444374_i64)
      end
      val_0 = frames
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_environment_set_sdfgi_frames_to_converge, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_sdfgi_frames_to_update_light : Void* = Pointer(Void).null
    def environment_set_sdfgi_frames_to_update_light(frames : Int64) : Void
      if @@mb_environment_set_sdfgi_frames_to_update_light.null?
        @@mb_environment_set_sdfgi_frames_to_update_light = Bridge.get_method_bind("RenderingServer", "environment_set_sdfgi_frames_to_update_light", 1251144068_i64)
      end
      val_0 = frames
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_environment_set_sdfgi_frames_to_update_light, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_volumetric_fog_volume_size : Void* = Pointer(Void).null
    def environment_set_volumetric_fog_volume_size(size : Int64, depth : Int64) : Void
      if @@mb_environment_set_volumetric_fog_volume_size.null?
        @@mb_environment_set_volumetric_fog_volume_size = Bridge.get_method_bind("RenderingServer", "environment_set_volumetric_fog_volume_size", 3937882851_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = depth
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_environment_set_volumetric_fog_volume_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_set_volumetric_fog_filter_active : Void* = Pointer(Void).null
    def environment_set_volumetric_fog_filter_active(active : Bool) : Void
      if @@mb_environment_set_volumetric_fog_filter_active.null?
        @@mb_environment_set_volumetric_fog_filter_active = Bridge.get_method_bind("RenderingServer", "environment_set_volumetric_fog_filter_active", 2586408642_i64)
      end
      val_0 = active
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_environment_set_volumetric_fog_filter_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_environment_bake_panorama : Void* = Pointer(Void).null
    def environment_bake_panorama(environment : Int64, bake_irradiance : Bool, size : Vector2i) : Image
      if @@mb_environment_bake_panorama.null?
        @@mb_environment_bake_panorama = Bridge.get_method_bind("RenderingServer", "environment_bake_panorama", 2452908646_i64)
      end
      val_0 = environment
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bake_irradiance
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = size
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_environment_bake_panorama, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_screen_space_roughness_limiter_set_active : Void* = Pointer(Void).null
    def screen_space_roughness_limiter_set_active(enable : Bool, amount : Float64, limit : Float64) : Void
      if @@mb_screen_space_roughness_limiter_set_active.null?
        @@mb_screen_space_roughness_limiter_set_active = Bridge.get_method_bind("RenderingServer", "screen_space_roughness_limiter_set_active", 916716790_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = amount
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = limit
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_screen_space_roughness_limiter_set_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_sub_surface_scattering_set_quality : Void* = Pointer(Void).null
    def sub_surface_scattering_set_quality(quality : Int64) : Void
      if @@mb_sub_surface_scattering_set_quality.null?
        @@mb_sub_surface_scattering_set_quality = Bridge.get_method_bind("RenderingServer", "sub_surface_scattering_set_quality", 64571803_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_sub_surface_scattering_set_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_sub_surface_scattering_set_scale : Void* = Pointer(Void).null
    def sub_surface_scattering_set_scale(scale : Float64, depth_scale : Float64) : Void
      if @@mb_sub_surface_scattering_set_scale.null?
        @@mb_sub_surface_scattering_set_scale = Bridge.get_method_bind("RenderingServer", "sub_surface_scattering_set_scale", 1017552074_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = depth_scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_sub_surface_scattering_set_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_attributes_create : Void* = Pointer(Void).null
    def camera_attributes_create() : Int64
      if @@mb_camera_attributes_create.null?
        @@mb_camera_attributes_create = Bridge.get_method_bind("RenderingServer", "camera_attributes_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_camera_attributes_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_camera_attributes_set_dof_blur_quality : Void* = Pointer(Void).null
    def camera_attributes_set_dof_blur_quality(quality : Int64, use_jitter : Bool) : Void
      if @@mb_camera_attributes_set_dof_blur_quality.null?
        @@mb_camera_attributes_set_dof_blur_quality = Bridge.get_method_bind("RenderingServer", "camera_attributes_set_dof_blur_quality", 2220136795_i64)
      end
      val_0 = quality
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = use_jitter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_camera_attributes_set_dof_blur_quality, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_attributes_set_dof_blur_bokeh_shape : Void* = Pointer(Void).null
    def camera_attributes_set_dof_blur_bokeh_shape(shape : Int64) : Void
      if @@mb_camera_attributes_set_dof_blur_bokeh_shape.null?
        @@mb_camera_attributes_set_dof_blur_bokeh_shape = Bridge.get_method_bind("RenderingServer", "camera_attributes_set_dof_blur_bokeh_shape", 1205058394_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_camera_attributes_set_dof_blur_bokeh_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_attributes_set_dof_blur : Void* = Pointer(Void).null
    def camera_attributes_set_dof_blur(camera_attributes : Int64, far_enable : Bool, far_distance : Float64, far_transition : Float64, near_enable : Bool, near_distance : Float64, near_transition : Float64, amount : Float64) : Void
      if @@mb_camera_attributes_set_dof_blur.null?
        @@mb_camera_attributes_set_dof_blur = Bridge.get_method_bind("RenderingServer", "camera_attributes_set_dof_blur", 316272616_i64)
      end
      val_0 = camera_attributes
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = far_enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = far_distance
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = far_transition
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = near_enable
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = near_distance
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = near_transition
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = amount
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      Bridge.ptrcall(@@mb_camera_attributes_set_dof_blur, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_attributes_set_exposure : Void* = Pointer(Void).null
    def camera_attributes_set_exposure(camera_attributes : Int64, multiplier : Float64, normalization : Float64) : Void
      if @@mb_camera_attributes_set_exposure.null?
        @@mb_camera_attributes_set_exposure = Bridge.get_method_bind("RenderingServer", "camera_attributes_set_exposure", 2513314492_i64)
      end
      val_0 = camera_attributes
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = multiplier
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = normalization
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_camera_attributes_set_exposure, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_camera_attributes_set_auto_exposure : Void* = Pointer(Void).null
    def camera_attributes_set_auto_exposure(camera_attributes : Int64, enable : Bool, min_sensitivity : Float64, max_sensitivity : Float64, speed : Float64, scale : Float64) : Void
      if @@mb_camera_attributes_set_auto_exposure.null?
        @@mb_camera_attributes_set_auto_exposure = Bridge.get_method_bind("RenderingServer", "camera_attributes_set_auto_exposure", 4266986332_i64)
      end
      val_0 = camera_attributes
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = min_sensitivity
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = max_sensitivity
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = speed
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = scale
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_camera_attributes_set_auto_exposure, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_scenario_create : Void* = Pointer(Void).null
    def scenario_create() : Int64
      if @@mb_scenario_create.null?
        @@mb_scenario_create = Bridge.get_method_bind("RenderingServer", "scenario_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_scenario_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_scenario_set_environment : Void* = Pointer(Void).null
    def scenario_set_environment(scenario : Int64, environment : Int64) : Void
      if @@mb_scenario_set_environment.null?
        @@mb_scenario_set_environment = Bridge.get_method_bind("RenderingServer", "scenario_set_environment", 395945892_i64)
      end
      val_0 = scenario
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = environment
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_scenario_set_environment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_scenario_set_fallback_environment : Void* = Pointer(Void).null
    def scenario_set_fallback_environment(scenario : Int64, environment : Int64) : Void
      if @@mb_scenario_set_fallback_environment.null?
        @@mb_scenario_set_fallback_environment = Bridge.get_method_bind("RenderingServer", "scenario_set_fallback_environment", 395945892_i64)
      end
      val_0 = scenario
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = environment
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_scenario_set_fallback_environment, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_scenario_set_camera_attributes : Void* = Pointer(Void).null
    def scenario_set_camera_attributes(scenario : Int64, effects : Int64) : Void
      if @@mb_scenario_set_camera_attributes.null?
        @@mb_scenario_set_camera_attributes = Bridge.get_method_bind("RenderingServer", "scenario_set_camera_attributes", 395945892_i64)
      end
      val_0 = scenario
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = effects
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_scenario_set_camera_attributes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_scenario_set_compositor : Void* = Pointer(Void).null
    def scenario_set_compositor(scenario : Int64, compositor : Int64) : Void
      if @@mb_scenario_set_compositor.null?
        @@mb_scenario_set_compositor = Bridge.get_method_bind("RenderingServer", "scenario_set_compositor", 395945892_i64)
      end
      val_0 = scenario
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = compositor
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_scenario_set_compositor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_create2 : Void* = Pointer(Void).null
    def instance_create2(base : Int64, scenario : Int64) : Int64
      if @@mb_instance_create2.null?
        @@mb_instance_create2 = Bridge.get_method_bind("RenderingServer", "instance_create2", 746547085_i64)
      end
      val_0 = base
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scenario
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_instance_create2, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_instance_create : Void* = Pointer(Void).null
    def instance_create() : Int64
      if @@mb_instance_create.null?
        @@mb_instance_create = Bridge.get_method_bind("RenderingServer", "instance_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_instance_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_instance_set_base : Void* = Pointer(Void).null
    def instance_set_base(instance : Int64, base : Int64) : Void
      if @@mb_instance_set_base.null?
        @@mb_instance_set_base = Bridge.get_method_bind("RenderingServer", "instance_set_base", 395945892_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = base
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_base, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_scenario : Void* = Pointer(Void).null
    def instance_set_scenario(instance : Int64, scenario : Int64) : Void
      if @@mb_instance_set_scenario.null?
        @@mb_instance_set_scenario = Bridge.get_method_bind("RenderingServer", "instance_set_scenario", 395945892_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scenario
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_scenario, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_layer_mask : Void* = Pointer(Void).null
    def instance_set_layer_mask(instance : Int64, mask : Int64) : Void
      if @@mb_instance_set_layer_mask.null?
        @@mb_instance_set_layer_mask = Bridge.get_method_bind("RenderingServer", "instance_set_layer_mask", 3411492887_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_layer_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_pivot_data : Void* = Pointer(Void).null
    def instance_set_pivot_data(instance : Int64, sorting_offset : Float64, use_aabb_center : Bool) : Void
      if @@mb_instance_set_pivot_data.null?
        @@mb_instance_set_pivot_data = Bridge.get_method_bind("RenderingServer", "instance_set_pivot_data", 1280615259_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = sorting_offset
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = use_aabb_center
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_instance_set_pivot_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_transform : Void* = Pointer(Void).null
    def instance_set_transform(instance : Int64, transform : Transform3D) : Void
      if @@mb_instance_set_transform.null?
        @@mb_instance_set_transform = Bridge.get_method_bind("RenderingServer", "instance_set_transform", 3935195649_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_attach_object_instance_id : Void* = Pointer(Void).null
    def instance_attach_object_instance_id(instance : Int64, id : Int64) : Void
      if @@mb_instance_attach_object_instance_id.null?
        @@mb_instance_attach_object_instance_id = Bridge.get_method_bind("RenderingServer", "instance_attach_object_instance_id", 3411492887_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_attach_object_instance_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_blend_shape_weight : Void* = Pointer(Void).null
    def instance_set_blend_shape_weight(instance : Int64, shape : Int64, weight : Float64) : Void
      if @@mb_instance_set_blend_shape_weight.null?
        @@mb_instance_set_blend_shape_weight = Bridge.get_method_bind("RenderingServer", "instance_set_blend_shape_weight", 1892459533_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = weight
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_instance_set_blend_shape_weight, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_surface_override_material : Void* = Pointer(Void).null
    def instance_set_surface_override_material(instance : Int64, surface : Int64, material : Int64) : Void
      if @@mb_instance_set_surface_override_material.null?
        @@mb_instance_set_surface_override_material = Bridge.get_method_bind("RenderingServer", "instance_set_surface_override_material", 2310537182_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = surface
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = material
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_instance_set_surface_override_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_visible : Void* = Pointer(Void).null
    def instance_set_visible(instance : Int64, visible : Bool) : Void
      if @@mb_instance_set_visible.null?
        @@mb_instance_set_visible = Bridge.get_method_bind("RenderingServer", "instance_set_visible", 1265174801_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = visible
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_transparency : Void* = Pointer(Void).null
    def instance_geometry_set_transparency(instance : Int64, transparency : Float64) : Void
      if @@mb_instance_geometry_set_transparency.null?
        @@mb_instance_geometry_set_transparency = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_transparency", 1794382983_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transparency
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_geometry_set_transparency, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_teleport : Void* = Pointer(Void).null
    def instance_teleport(instance : Int64) : Void
      if @@mb_instance_teleport.null?
        @@mb_instance_teleport = Bridge.get_method_bind("RenderingServer", "instance_teleport", 2722037293_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_instance_teleport, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_custom_aabb : Void* = Pointer(Void).null
    def instance_set_custom_aabb(instance : Int64, aabb : AABB) : Void
      if @@mb_instance_set_custom_aabb.null?
        @@mb_instance_set_custom_aabb = Bridge.get_method_bind("RenderingServer", "instance_set_custom_aabb", 3696536120_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = aabb
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_custom_aabb, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_attach_skeleton : Void* = Pointer(Void).null
    def instance_attach_skeleton(instance : Int64, skeleton : Int64) : Void
      if @@mb_instance_attach_skeleton.null?
        @@mb_instance_attach_skeleton = Bridge.get_method_bind("RenderingServer", "instance_attach_skeleton", 395945892_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = skeleton
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_attach_skeleton, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_extra_visibility_margin : Void* = Pointer(Void).null
    def instance_set_extra_visibility_margin(instance : Int64, margin : Float64) : Void
      if @@mb_instance_set_extra_visibility_margin.null?
        @@mb_instance_set_extra_visibility_margin = Bridge.get_method_bind("RenderingServer", "instance_set_extra_visibility_margin", 1794382983_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = margin
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_extra_visibility_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_visibility_parent : Void* = Pointer(Void).null
    def instance_set_visibility_parent(instance : Int64, parent : Int64) : Void
      if @@mb_instance_set_visibility_parent.null?
        @@mb_instance_set_visibility_parent = Bridge.get_method_bind("RenderingServer", "instance_set_visibility_parent", 395945892_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parent
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_visibility_parent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_set_ignore_culling : Void* = Pointer(Void).null
    def instance_set_ignore_culling(instance : Int64, enabled : Bool) : Void
      if @@mb_instance_set_ignore_culling.null?
        @@mb_instance_set_ignore_culling = Bridge.get_method_bind("RenderingServer", "instance_set_ignore_culling", 1265174801_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_set_ignore_culling, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_flag : Void* = Pointer(Void).null
    def instance_geometry_set_flag(instance : Int64, flag : Int64, enabled : Bool) : Void
      if @@mb_instance_geometry_set_flag.null?
        @@mb_instance_geometry_set_flag = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_flag", 1014989537_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flag
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = enabled
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_instance_geometry_set_flag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_cast_shadows_setting : Void* = Pointer(Void).null
    def instance_geometry_set_cast_shadows_setting(instance : Int64, shadow_casting_setting : Int64) : Void
      if @@mb_instance_geometry_set_cast_shadows_setting.null?
        @@mb_instance_geometry_set_cast_shadows_setting = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_cast_shadows_setting", 3768836020_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shadow_casting_setting
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_geometry_set_cast_shadows_setting, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_material_override : Void* = Pointer(Void).null
    def instance_geometry_set_material_override(instance : Int64, material : Int64) : Void
      if @@mb_instance_geometry_set_material_override.null?
        @@mb_instance_geometry_set_material_override = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_material_override", 395945892_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = material
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_geometry_set_material_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_material_overlay : Void* = Pointer(Void).null
    def instance_geometry_set_material_overlay(instance : Int64, material : Int64) : Void
      if @@mb_instance_geometry_set_material_overlay.null?
        @@mb_instance_geometry_set_material_overlay = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_material_overlay", 395945892_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = material
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_geometry_set_material_overlay, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_visibility_range : Void* = Pointer(Void).null
    def instance_geometry_set_visibility_range(instance : Int64, min : Float64, max : Float64, min_margin : Float64, max_margin : Float64, fade_mode : Int64) : Void
      if @@mb_instance_geometry_set_visibility_range.null?
        @@mb_instance_geometry_set_visibility_range = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_visibility_range", 4263925858_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = min_margin
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = max_margin
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = fade_mode
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_instance_geometry_set_visibility_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_lightmap : Void* = Pointer(Void).null
    def instance_geometry_set_lightmap(instance : Int64, lightmap : Int64, lightmap_uv_scale : Rect2, lightmap_slice : Int64) : Void
      if @@mb_instance_geometry_set_lightmap.null?
        @@mb_instance_geometry_set_lightmap = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_lightmap", 536974962_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = lightmap
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = lightmap_uv_scale
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = lightmap_slice
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_instance_geometry_set_lightmap, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_lod_bias : Void* = Pointer(Void).null
    def instance_geometry_set_lod_bias(instance : Int64, lod_bias : Float64) : Void
      if @@mb_instance_geometry_set_lod_bias.null?
        @@mb_instance_geometry_set_lod_bias = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_lod_bias", 1794382983_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = lod_bias
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_instance_geometry_set_lod_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_set_shader_parameter : Void* = Pointer(Void).null
    def instance_geometry_set_shader_parameter(instance : Int64, parameter : String, value : Void*) : Void
      if @@mb_instance_geometry_set_shader_parameter.null?
        @@mb_instance_geometry_set_shader_parameter = Bridge.get_method_bind("RenderingServer", "instance_geometry_set_shader_parameter", 3477296213_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_instance_geometry_set_shader_parameter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_instance_geometry_get_shader_parameter : Void* = Pointer(Void).null
    def instance_geometry_get_shader_parameter(instance : Int64, parameter : String) : Void*
      if @@mb_instance_geometry_get_shader_parameter.null?
        @@mb_instance_geometry_get_shader_parameter = Bridge.get_method_bind("RenderingServer", "instance_geometry_get_shader_parameter", 2621281810_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_instance_geometry_get_shader_parameter, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_instance_geometry_get_shader_parameter_default_value : Void* = Pointer(Void).null
    def instance_geometry_get_shader_parameter_default_value(instance : Int64, parameter : String) : Void*
      if @@mb_instance_geometry_get_shader_parameter_default_value.null?
        @@mb_instance_geometry_get_shader_parameter_default_value = Bridge.get_method_bind("RenderingServer", "instance_geometry_get_shader_parameter_default_value", 2621281810_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_instance_geometry_get_shader_parameter_default_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_instance_geometry_get_shader_parameter_list : Void* = Pointer(Void).null
    def instance_geometry_get_shader_parameter_list(instance : Int64) : Godot::Array
      if @@mb_instance_geometry_get_shader_parameter_list.null?
        @@mb_instance_geometry_get_shader_parameter_list = Bridge.get_method_bind("RenderingServer", "instance_geometry_get_shader_parameter_list", 2684255073_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_instance_geometry_get_shader_parameter_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_instances_cull_aabb : Void* = Pointer(Void).null
    def instances_cull_aabb(aabb : AABB, scenario : Int64) : Void*
      if @@mb_instances_cull_aabb.null?
        @@mb_instances_cull_aabb = Bridge.get_method_bind("RenderingServer", "instances_cull_aabb", 2570105777_i64)
      end
      val_0 = aabb
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scenario
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_instances_cull_aabb, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_instances_cull_ray : Void* = Pointer(Void).null
    def instances_cull_ray(from : Vector3, to : Vector3, scenario : Int64) : Void*
      if @@mb_instances_cull_ray.null?
        @@mb_instances_cull_ray = Bridge.get_method_bind("RenderingServer", "instances_cull_ray", 2208759584_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = scenario
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_instances_cull_ray, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_instances_cull_convex : Void* = Pointer(Void).null
    def instances_cull_convex(convex : Godot::Array, scenario : Int64) : Void*
      if @@mb_instances_cull_convex.null?
        @@mb_instances_cull_convex = Bridge.get_method_bind("RenderingServer", "instances_cull_convex", 2488539944_i64)
      end
      arg_ptr_0 = convex ? convex.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      val_1 = scenario
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_instances_cull_convex, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_bake_render_uv2 : Void* = Pointer(Void).null
    def bake_render_uv2(base : Int64, material_overrides : Godot::Array, image_size : Vector2i) : Godot::Array
      if @@mb_bake_render_uv2.null?
        @@mb_bake_render_uv2 = Bridge.get_method_bind("RenderingServer", "bake_render_uv2", 1904608558_i64)
      end
      val_0 = base
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = material_overrides ? material_overrides.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      val_2 = image_size
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_bake_render_uv2, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_canvas_create : Void* = Pointer(Void).null
    def canvas_create() : Int64
      if @@mb_canvas_create.null?
        @@mb_canvas_create = Bridge.get_method_bind("RenderingServer", "canvas_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_canvas_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_canvas_set_item_mirroring : Void* = Pointer(Void).null
    def canvas_set_item_mirroring(canvas : Int64, item : Int64, mirroring : Vector2) : Void
      if @@mb_canvas_set_item_mirroring.null?
        @@mb_canvas_set_item_mirroring = Bridge.get_method_bind("RenderingServer", "canvas_set_item_mirroring", 2343975398_i64)
      end
      val_0 = canvas
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = item
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = mirroring
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_set_item_mirroring, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_set_item_repeat : Void* = Pointer(Void).null
    def canvas_set_item_repeat(item : Int64, repeat_size : Vector2, repeat_times : Int64) : Void
      if @@mb_canvas_set_item_repeat.null?
        @@mb_canvas_set_item_repeat = Bridge.get_method_bind("RenderingServer", "canvas_set_item_repeat", 1739512717_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = repeat_size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = repeat_times
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_set_item_repeat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_set_modulate : Void* = Pointer(Void).null
    def canvas_set_modulate(canvas : Int64, color : Color) : Void
      if @@mb_canvas_set_modulate.null?
        @@mb_canvas_set_modulate = Bridge.get_method_bind("RenderingServer", "canvas_set_modulate", 2948539648_i64)
      end
      val_0 = canvas
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_set_modulate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_set_disable_scale : Void* = Pointer(Void).null
    def canvas_set_disable_scale(disable : Bool) : Void
      if @@mb_canvas_set_disable_scale.null?
        @@mb_canvas_set_disable_scale = Bridge.get_method_bind("RenderingServer", "canvas_set_disable_scale", 2586408642_i64)
      end
      val_0 = disable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_canvas_set_disable_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_texture_create : Void* = Pointer(Void).null
    def canvas_texture_create() : Int64
      if @@mb_canvas_texture_create.null?
        @@mb_canvas_texture_create = Bridge.get_method_bind("RenderingServer", "canvas_texture_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_canvas_texture_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_canvas_texture_set_channel : Void* = Pointer(Void).null
    def canvas_texture_set_channel(canvas_texture : Int64, channel : Int64, texture : Int64) : Void
      if @@mb_canvas_texture_set_channel.null?
        @@mb_canvas_texture_set_channel = Bridge.get_method_bind("RenderingServer", "canvas_texture_set_channel", 3822119138_i64)
      end
      val_0 = canvas_texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = channel
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_texture_set_channel, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_texture_set_shading_parameters : Void* = Pointer(Void).null
    def canvas_texture_set_shading_parameters(canvas_texture : Int64, base_color : Color, shininess : Float64) : Void
      if @@mb_canvas_texture_set_shading_parameters.null?
        @@mb_canvas_texture_set_shading_parameters = Bridge.get_method_bind("RenderingServer", "canvas_texture_set_shading_parameters", 2124967469_i64)
      end
      val_0 = canvas_texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = base_color
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = shininess
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_texture_set_shading_parameters, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_texture_set_texture_filter : Void* = Pointer(Void).null
    def canvas_texture_set_texture_filter(canvas_texture : Int64, filter : Int64) : Void
      if @@mb_canvas_texture_set_texture_filter.null?
        @@mb_canvas_texture_set_texture_filter = Bridge.get_method_bind("RenderingServer", "canvas_texture_set_texture_filter", 1155129294_i64)
      end
      val_0 = canvas_texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = filter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_texture_set_texture_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_texture_set_texture_repeat : Void* = Pointer(Void).null
    def canvas_texture_set_texture_repeat(canvas_texture : Int64, repeat : Int64) : Void
      if @@mb_canvas_texture_set_texture_repeat.null?
        @@mb_canvas_texture_set_texture_repeat = Bridge.get_method_bind("RenderingServer", "canvas_texture_set_texture_repeat", 1652956681_i64)
      end
      val_0 = canvas_texture
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = repeat
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_texture_set_texture_repeat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_create : Void* = Pointer(Void).null
    def canvas_item_create() : Int64
      if @@mb_canvas_item_create.null?
        @@mb_canvas_item_create = Bridge.get_method_bind("RenderingServer", "canvas_item_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_canvas_item_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_canvas_item_set_parent : Void* = Pointer(Void).null
    def canvas_item_set_parent(item : Int64, parent : Int64) : Void
      if @@mb_canvas_item_set_parent.null?
        @@mb_canvas_item_set_parent = Bridge.get_method_bind("RenderingServer", "canvas_item_set_parent", 395945892_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parent
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_parent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_default_texture_filter : Void* = Pointer(Void).null
    def canvas_item_set_default_texture_filter(item : Int64, filter : Int64) : Void
      if @@mb_canvas_item_set_default_texture_filter.null?
        @@mb_canvas_item_set_default_texture_filter = Bridge.get_method_bind("RenderingServer", "canvas_item_set_default_texture_filter", 1155129294_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = filter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_default_texture_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_default_texture_repeat : Void* = Pointer(Void).null
    def canvas_item_set_default_texture_repeat(item : Int64, repeat : Int64) : Void
      if @@mb_canvas_item_set_default_texture_repeat.null?
        @@mb_canvas_item_set_default_texture_repeat = Bridge.get_method_bind("RenderingServer", "canvas_item_set_default_texture_repeat", 1652956681_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = repeat
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_default_texture_repeat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_visible : Void* = Pointer(Void).null
    def canvas_item_set_visible(item : Int64, visible : Bool) : Void
      if @@mb_canvas_item_set_visible.null?
        @@mb_canvas_item_set_visible = Bridge.get_method_bind("RenderingServer", "canvas_item_set_visible", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = visible
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_visible, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_light_mask : Void* = Pointer(Void).null
    def canvas_item_set_light_mask(item : Int64, mask : Int64) : Void
      if @@mb_canvas_item_set_light_mask.null?
        @@mb_canvas_item_set_light_mask = Bridge.get_method_bind("RenderingServer", "canvas_item_set_light_mask", 3411492887_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_light_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_visibility_layer : Void* = Pointer(Void).null
    def canvas_item_set_visibility_layer(item : Int64, visibility_layer : Int64) : Void
      if @@mb_canvas_item_set_visibility_layer.null?
        @@mb_canvas_item_set_visibility_layer = Bridge.get_method_bind("RenderingServer", "canvas_item_set_visibility_layer", 3411492887_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = visibility_layer
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_visibility_layer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_transform : Void* = Pointer(Void).null
    def canvas_item_set_transform(item : Int64, transform : Transform2D) : Void
      if @@mb_canvas_item_set_transform.null?
        @@mb_canvas_item_set_transform = Bridge.get_method_bind("RenderingServer", "canvas_item_set_transform", 1246044741_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_clip : Void* = Pointer(Void).null
    def canvas_item_set_clip(item : Int64, clip : Bool) : Void
      if @@mb_canvas_item_set_clip.null?
        @@mb_canvas_item_set_clip = Bridge.get_method_bind("RenderingServer", "canvas_item_set_clip", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = clip
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_clip, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_distance_field_mode : Void* = Pointer(Void).null
    def canvas_item_set_distance_field_mode(item : Int64, enabled : Bool) : Void
      if @@mb_canvas_item_set_distance_field_mode.null?
        @@mb_canvas_item_set_distance_field_mode = Bridge.get_method_bind("RenderingServer", "canvas_item_set_distance_field_mode", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_distance_field_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_custom_rect : Void* = Pointer(Void).null
    def canvas_item_set_custom_rect(item : Int64, use_custom_rect : Bool, rect : Rect2) : Void
      if @@mb_canvas_item_set_custom_rect.null?
        @@mb_canvas_item_set_custom_rect = Bridge.get_method_bind("RenderingServer", "canvas_item_set_custom_rect", 1333997032_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = use_custom_rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = rect
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_item_set_custom_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_modulate : Void* = Pointer(Void).null
    def canvas_item_set_modulate(item : Int64, color : Color) : Void
      if @@mb_canvas_item_set_modulate.null?
        @@mb_canvas_item_set_modulate = Bridge.get_method_bind("RenderingServer", "canvas_item_set_modulate", 2948539648_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_modulate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_self_modulate : Void* = Pointer(Void).null
    def canvas_item_set_self_modulate(item : Int64, color : Color) : Void
      if @@mb_canvas_item_set_self_modulate.null?
        @@mb_canvas_item_set_self_modulate = Bridge.get_method_bind("RenderingServer", "canvas_item_set_self_modulate", 2948539648_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_self_modulate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_draw_behind_parent : Void* = Pointer(Void).null
    def canvas_item_set_draw_behind_parent(item : Int64, enabled : Bool) : Void
      if @@mb_canvas_item_set_draw_behind_parent.null?
        @@mb_canvas_item_set_draw_behind_parent = Bridge.get_method_bind("RenderingServer", "canvas_item_set_draw_behind_parent", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_draw_behind_parent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_interpolated : Void* = Pointer(Void).null
    def canvas_item_set_interpolated(item : Int64, interpolated : Bool) : Void
      if @@mb_canvas_item_set_interpolated.null?
        @@mb_canvas_item_set_interpolated = Bridge.get_method_bind("RenderingServer", "canvas_item_set_interpolated", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = interpolated
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_interpolated, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_reset_physics_interpolation : Void* = Pointer(Void).null
    def canvas_item_reset_physics_interpolation(item : Int64) : Void
      if @@mb_canvas_item_reset_physics_interpolation.null?
        @@mb_canvas_item_reset_physics_interpolation = Bridge.get_method_bind("RenderingServer", "canvas_item_reset_physics_interpolation", 2722037293_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_canvas_item_reset_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_transform_physics_interpolation : Void* = Pointer(Void).null
    def canvas_item_transform_physics_interpolation(item : Int64, transform : Transform2D) : Void
      if @@mb_canvas_item_transform_physics_interpolation.null?
        @@mb_canvas_item_transform_physics_interpolation = Bridge.get_method_bind("RenderingServer", "canvas_item_transform_physics_interpolation", 1246044741_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_transform_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_line : Void* = Pointer(Void).null
    def canvas_item_add_line(item : Int64, from : Vector2, to : Vector2, color : Color, width : Float64, antialiased : Bool) : Void
      if @@mb_canvas_item_add_line.null?
        @@mb_canvas_item_add_line = Bridge.get_method_bind("RenderingServer", "canvas_item_add_line", 1819681853_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = from
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = to
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = color
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = width
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = antialiased
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_canvas_item_add_line, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_polyline : Void* = Pointer(Void).null
    def canvas_item_add_polyline(item : Int64, points : Void*, colors : Void*, width : Float64, antialiased : Bool) : Void
      if @@mb_canvas_item_add_polyline.null?
        @@mb_canvas_item_add_polyline = Bridge.get_method_bind("RenderingServer", "canvas_item_add_polyline", 3098767073_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = points
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = colors
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = width
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = antialiased
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_polyline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_multiline : Void* = Pointer(Void).null
    def canvas_item_add_multiline(item : Int64, points : Void*, colors : Void*, width : Float64, antialiased : Bool) : Void
      if @@mb_canvas_item_add_multiline.null?
        @@mb_canvas_item_add_multiline = Bridge.get_method_bind("RenderingServer", "canvas_item_add_multiline", 3098767073_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = points
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = colors
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = width
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = antialiased
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_multiline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_rect : Void* = Pointer(Void).null
    def canvas_item_add_rect(item : Int64, rect : Rect2, color : Color, antialiased : Bool) : Void
      if @@mb_canvas_item_add_rect.null?
        @@mb_canvas_item_add_rect = Bridge.get_method_bind("RenderingServer", "canvas_item_add_rect", 3523446176_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = color
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = antialiased
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_canvas_item_add_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_circle : Void* = Pointer(Void).null
    def canvas_item_add_circle(item : Int64, pos : Vector2, radius : Float64, color : Color, antialiased : Bool) : Void
      if @@mb_canvas_item_add_circle.null?
        @@mb_canvas_item_add_circle = Bridge.get_method_bind("RenderingServer", "canvas_item_add_circle", 333077949_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = radius
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = color
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = antialiased
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_circle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_ellipse : Void* = Pointer(Void).null
    def canvas_item_add_ellipse(item : Int64, pos : Vector2, major : Float64, minor : Float64, color : Color, antialiased : Bool) : Void
      if @@mb_canvas_item_add_ellipse.null?
        @@mb_canvas_item_add_ellipse = Bridge.get_method_bind("RenderingServer", "canvas_item_add_ellipse", 4188642757_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = major
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = minor
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = color
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = antialiased
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_canvas_item_add_ellipse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_texture_rect : Void* = Pointer(Void).null
    def canvas_item_add_texture_rect(item : Int64, rect : Rect2, texture : Int64, tile : Bool, modulate : Color, transpose : Bool) : Void
      if @@mb_canvas_item_add_texture_rect.null?
        @@mb_canvas_item_add_texture_rect = Bridge.get_method_bind("RenderingServer", "canvas_item_add_texture_rect", 324864032_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = tile
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = modulate
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = transpose
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_canvas_item_add_texture_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_msdf_texture_rect_region : Void* = Pointer(Void).null
    def canvas_item_add_msdf_texture_rect_region(item : Int64, rect : Rect2, texture : Int64, src_rect : Rect2, modulate : Color, outline_size : Int64, px_range : Float64, scale : Float64) : Void
      if @@mb_canvas_item_add_msdf_texture_rect_region.null?
        @@mb_canvas_item_add_msdf_texture_rect_region = Bridge.get_method_bind("RenderingServer", "canvas_item_add_msdf_texture_rect_region", 97408773_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = src_rect
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = modulate
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = outline_size
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = px_range
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = scale
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      Bridge.ptrcall(@@mb_canvas_item_add_msdf_texture_rect_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_lcd_texture_rect_region : Void* = Pointer(Void).null
    def canvas_item_add_lcd_texture_rect_region(item : Int64, rect : Rect2, texture : Int64, src_rect : Rect2, modulate : Color) : Void
      if @@mb_canvas_item_add_lcd_texture_rect_region.null?
        @@mb_canvas_item_add_lcd_texture_rect_region = Bridge.get_method_bind("RenderingServer", "canvas_item_add_lcd_texture_rect_region", 359793297_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = src_rect
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = modulate
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_lcd_texture_rect_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_texture_rect_region : Void* = Pointer(Void).null
    def canvas_item_add_texture_rect_region(item : Int64, rect : Rect2, texture : Int64, src_rect : Rect2, modulate : Color, transpose : Bool, clip_uv : Bool) : Void
      if @@mb_canvas_item_add_texture_rect_region.null?
        @@mb_canvas_item_add_texture_rect_region = Bridge.get_method_bind("RenderingServer", "canvas_item_add_texture_rect_region", 485157892_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = src_rect
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = modulate
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = transpose
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = clip_uv
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      Bridge.ptrcall(@@mb_canvas_item_add_texture_rect_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_nine_patch : Void* = Pointer(Void).null
    def canvas_item_add_nine_patch(item : Int64, rect : Rect2, source : Rect2, texture : Int64, topleft : Vector2, bottomright : Vector2, x_axis_mode : Int64, y_axis_mode : Int64, draw_center : Bool, modulate : Color) : Void
      if @@mb_canvas_item_add_nine_patch.null?
        @@mb_canvas_item_add_nine_patch = Bridge.get_method_bind("RenderingServer", "canvas_item_add_nine_patch", 389957886_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = source
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = texture
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = topleft
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = bottomright
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = x_axis_mode
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = y_axis_mode
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = draw_center
      arg_8 = pointerof(val_8).as(Void*)
      val_9 = modulate
      arg_9 = pointerof(val_9).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8, arg_9]
      Bridge.ptrcall(@@mb_canvas_item_add_nine_patch, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_primitive : Void* = Pointer(Void).null
    def canvas_item_add_primitive(item : Int64, points : Void*, colors : Void*, uvs : Void*, texture : Int64) : Void
      if @@mb_canvas_item_add_primitive.null?
        @@mb_canvas_item_add_primitive = Bridge.get_method_bind("RenderingServer", "canvas_item_add_primitive", 3731601077_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = points
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = colors
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = uvs
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = texture
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_primitive, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_polygon : Void* = Pointer(Void).null
    def canvas_item_add_polygon(item : Int64, points : Void*, colors : Void*, uvs : Void*, texture : Int64) : Void
      if @@mb_canvas_item_add_polygon.null?
        @@mb_canvas_item_add_polygon = Bridge.get_method_bind("RenderingServer", "canvas_item_add_polygon", 3580000528_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = points
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = colors
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = uvs
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = texture
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_triangle_array : Void* = Pointer(Void).null
    def canvas_item_add_triangle_array(item : Int64, indices : Void*, points : Void*, colors : Void*, uvs : Void*, bones : Void*, weights : Void*, texture : Int64, count : Int64) : Void
      if @@mb_canvas_item_add_triangle_array.null?
        @@mb_canvas_item_add_triangle_array = Bridge.get_method_bind("RenderingServer", "canvas_item_add_triangle_array", 660261329_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = indices
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = points
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = colors
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = uvs
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = bones
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = weights
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = texture
      arg_7 = pointerof(val_7).as(Void*)
      val_8 = count
      arg_8 = pointerof(val_8).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7, arg_8]
      Bridge.ptrcall(@@mb_canvas_item_add_triangle_array, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_mesh : Void* = Pointer(Void).null
    def canvas_item_add_mesh(item : Int64, mesh : Int64, transform : Transform2D, modulate : Color, texture : Int64) : Void
      if @@mb_canvas_item_add_mesh.null?
        @@mb_canvas_item_add_mesh = Bridge.get_method_bind("RenderingServer", "canvas_item_add_mesh", 316450961_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mesh
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = modulate
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = texture
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_multimesh : Void* = Pointer(Void).null
    def canvas_item_add_multimesh(item : Int64, mesh : Int64, texture : Int64) : Void
      if @@mb_canvas_item_add_multimesh.null?
        @@mb_canvas_item_add_multimesh = Bridge.get_method_bind("RenderingServer", "canvas_item_add_multimesh", 2131855138_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mesh
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_item_add_multimesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_particles : Void* = Pointer(Void).null
    def canvas_item_add_particles(item : Int64, particles : Int64, texture : Int64) : Void
      if @@mb_canvas_item_add_particles.null?
        @@mb_canvas_item_add_particles = Bridge.get_method_bind("RenderingServer", "canvas_item_add_particles", 2575754278_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = particles
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_item_add_particles, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_set_transform : Void* = Pointer(Void).null
    def canvas_item_add_set_transform(item : Int64, transform : Transform2D) : Void
      if @@mb_canvas_item_add_set_transform.null?
        @@mb_canvas_item_add_set_transform = Bridge.get_method_bind("RenderingServer", "canvas_item_add_set_transform", 1246044741_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_add_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_clip_ignore : Void* = Pointer(Void).null
    def canvas_item_add_clip_ignore(item : Int64, ignore : Bool) : Void
      if @@mb_canvas_item_add_clip_ignore.null?
        @@mb_canvas_item_add_clip_ignore = Bridge.get_method_bind("RenderingServer", "canvas_item_add_clip_ignore", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = ignore
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_add_clip_ignore, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_add_animation_slice : Void* = Pointer(Void).null
    def canvas_item_add_animation_slice(item : Int64, animation_length : Float64, slice_begin : Float64, slice_end : Float64, offset : Float64) : Void
      if @@mb_canvas_item_add_animation_slice.null?
        @@mb_canvas_item_add_animation_slice = Bridge.get_method_bind("RenderingServer", "canvas_item_add_animation_slice", 2646834499_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = animation_length
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = slice_begin
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = slice_end
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = offset
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_add_animation_slice, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_sort_children_by_y : Void* = Pointer(Void).null
    def canvas_item_set_sort_children_by_y(item : Int64, enabled : Bool) : Void
      if @@mb_canvas_item_set_sort_children_by_y.null?
        @@mb_canvas_item_set_sort_children_by_y = Bridge.get_method_bind("RenderingServer", "canvas_item_set_sort_children_by_y", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_sort_children_by_y, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_z_index : Void* = Pointer(Void).null
    def canvas_item_set_z_index(item : Int64, z_index : Int64) : Void
      if @@mb_canvas_item_set_z_index.null?
        @@mb_canvas_item_set_z_index = Bridge.get_method_bind("RenderingServer", "canvas_item_set_z_index", 3411492887_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = z_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_z_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_z_as_relative_to_parent : Void* = Pointer(Void).null
    def canvas_item_set_z_as_relative_to_parent(item : Int64, enabled : Bool) : Void
      if @@mb_canvas_item_set_z_as_relative_to_parent.null?
        @@mb_canvas_item_set_z_as_relative_to_parent = Bridge.get_method_bind("RenderingServer", "canvas_item_set_z_as_relative_to_parent", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_z_as_relative_to_parent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_copy_to_backbuffer : Void* = Pointer(Void).null
    def canvas_item_set_copy_to_backbuffer(item : Int64, enabled : Bool, rect : Rect2) : Void
      if @@mb_canvas_item_set_copy_to_backbuffer.null?
        @@mb_canvas_item_set_copy_to_backbuffer = Bridge.get_method_bind("RenderingServer", "canvas_item_set_copy_to_backbuffer", 2429202503_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = rect
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_item_set_copy_to_backbuffer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_attach_skeleton : Void* = Pointer(Void).null
    def canvas_item_attach_skeleton(item : Int64, skeleton : Int64) : Void
      if @@mb_canvas_item_attach_skeleton.null?
        @@mb_canvas_item_attach_skeleton = Bridge.get_method_bind("RenderingServer", "canvas_item_attach_skeleton", 395945892_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = skeleton
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_attach_skeleton, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_clear : Void* = Pointer(Void).null
    def canvas_item_clear(item : Int64) : Void
      if @@mb_canvas_item_clear.null?
        @@mb_canvas_item_clear = Bridge.get_method_bind("RenderingServer", "canvas_item_clear", 2722037293_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_canvas_item_clear, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_draw_index : Void* = Pointer(Void).null
    def canvas_item_set_draw_index(item : Int64, index : Int64) : Void
      if @@mb_canvas_item_set_draw_index.null?
        @@mb_canvas_item_set_draw_index = Bridge.get_method_bind("RenderingServer", "canvas_item_set_draw_index", 3411492887_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_draw_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_material : Void* = Pointer(Void).null
    def canvas_item_set_material(item : Int64, material : Int64) : Void
      if @@mb_canvas_item_set_material.null?
        @@mb_canvas_item_set_material = Bridge.get_method_bind("RenderingServer", "canvas_item_set_material", 395945892_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = material
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_use_parent_material : Void* = Pointer(Void).null
    def canvas_item_set_use_parent_material(item : Int64, enabled : Bool) : Void
      if @@mb_canvas_item_set_use_parent_material.null?
        @@mb_canvas_item_set_use_parent_material = Bridge.get_method_bind("RenderingServer", "canvas_item_set_use_parent_material", 1265174801_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_item_set_use_parent_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_instance_shader_parameter : Void* = Pointer(Void).null
    def canvas_item_set_instance_shader_parameter(instance : Int64, parameter : String, value : Void*) : Void
      if @@mb_canvas_item_set_instance_shader_parameter.null?
        @@mb_canvas_item_set_instance_shader_parameter = Bridge.get_method_bind("RenderingServer", "canvas_item_set_instance_shader_parameter", 3477296213_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_item_set_instance_shader_parameter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_get_instance_shader_parameter : Void* = Pointer(Void).null
    def canvas_item_get_instance_shader_parameter(instance : Int64, parameter : String) : Void*
      if @@mb_canvas_item_get_instance_shader_parameter.null?
        @@mb_canvas_item_get_instance_shader_parameter = Bridge.get_method_bind("RenderingServer", "canvas_item_get_instance_shader_parameter", 2621281810_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_canvas_item_get_instance_shader_parameter, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_canvas_item_get_instance_shader_parameter_default_value : Void* = Pointer(Void).null
    def canvas_item_get_instance_shader_parameter_default_value(instance : Int64, parameter : String) : Void*
      if @@mb_canvas_item_get_instance_shader_parameter_default_value.null?
        @@mb_canvas_item_get_instance_shader_parameter_default_value = Bridge.get_method_bind("RenderingServer", "canvas_item_get_instance_shader_parameter_default_value", 2621281810_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_canvas_item_get_instance_shader_parameter_default_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_canvas_item_get_instance_shader_parameter_list : Void* = Pointer(Void).null
    def canvas_item_get_instance_shader_parameter_list(instance : Int64) : Godot::Array
      if @@mb_canvas_item_get_instance_shader_parameter_list.null?
        @@mb_canvas_item_get_instance_shader_parameter_list = Bridge.get_method_bind("RenderingServer", "canvas_item_get_instance_shader_parameter_list", 2684255073_i64)
      end
      val_0 = instance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_canvas_item_get_instance_shader_parameter_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_canvas_item_set_visibility_notifier : Void* = Pointer(Void).null
    def canvas_item_set_visibility_notifier(item : Int64, enable : Bool, area : Rect2, enter_callable : Void*, exit_callable : Void*) : Void
      if @@mb_canvas_item_set_visibility_notifier.null?
        @@mb_canvas_item_set_visibility_notifier = Bridge.get_method_bind("RenderingServer", "canvas_item_set_visibility_notifier", 3568945579_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = area
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = enter_callable
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = exit_callable
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_canvas_item_set_visibility_notifier, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_item_set_canvas_group_mode : Void* = Pointer(Void).null
    def canvas_item_set_canvas_group_mode(item : Int64, mode : Int64, clear_margin : Float64, fit_empty : Bool, fit_margin : Float64, blur_mipmaps : Bool) : Void
      if @@mb_canvas_item_set_canvas_group_mode.null?
        @@mb_canvas_item_set_canvas_group_mode = Bridge.get_method_bind("RenderingServer", "canvas_item_set_canvas_group_mode", 3973586316_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = clear_margin
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = fit_empty
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = fit_margin
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = blur_mipmaps
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_canvas_item_set_canvas_group_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_debug_canvas_item_get_rect : Void* = Pointer(Void).null
    def debug_canvas_item_get_rect(item : Int64) : Rect2
      if @@mb_debug_canvas_item_get_rect.null?
        @@mb_debug_canvas_item_get_rect = Bridge.get_method_bind("RenderingServer", "debug_canvas_item_get_rect", 624227424_i64)
      end
      val_0 = item
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_debug_canvas_item_get_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_canvas_light_create : Void* = Pointer(Void).null
    def canvas_light_create() : Int64
      if @@mb_canvas_light_create.null?
        @@mb_canvas_light_create = Bridge.get_method_bind("RenderingServer", "canvas_light_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_canvas_light_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_canvas_light_attach_to_canvas : Void* = Pointer(Void).null
    def canvas_light_attach_to_canvas(light : Int64, canvas : Int64) : Void
      if @@mb_canvas_light_attach_to_canvas.null?
        @@mb_canvas_light_attach_to_canvas = Bridge.get_method_bind("RenderingServer", "canvas_light_attach_to_canvas", 395945892_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_attach_to_canvas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_enabled : Void* = Pointer(Void).null
    def canvas_light_set_enabled(light : Int64, enabled : Bool) : Void
      if @@mb_canvas_light_set_enabled.null?
        @@mb_canvas_light_set_enabled = Bridge.get_method_bind("RenderingServer", "canvas_light_set_enabled", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_texture_scale : Void* = Pointer(Void).null
    def canvas_light_set_texture_scale(light : Int64, scale : Float64) : Void
      if @@mb_canvas_light_set_texture_scale.null?
        @@mb_canvas_light_set_texture_scale = Bridge.get_method_bind("RenderingServer", "canvas_light_set_texture_scale", 1794382983_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_texture_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_transform : Void* = Pointer(Void).null
    def canvas_light_set_transform(light : Int64, transform : Transform2D) : Void
      if @@mb_canvas_light_set_transform.null?
        @@mb_canvas_light_set_transform = Bridge.get_method_bind("RenderingServer", "canvas_light_set_transform", 1246044741_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_texture : Void* = Pointer(Void).null
    def canvas_light_set_texture(light : Int64, texture : Int64) : Void
      if @@mb_canvas_light_set_texture.null?
        @@mb_canvas_light_set_texture = Bridge.get_method_bind("RenderingServer", "canvas_light_set_texture", 395945892_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = texture
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_texture_offset : Void* = Pointer(Void).null
    def canvas_light_set_texture_offset(light : Int64, offset : Vector2) : Void
      if @@mb_canvas_light_set_texture_offset.null?
        @@mb_canvas_light_set_texture_offset = Bridge.get_method_bind("RenderingServer", "canvas_light_set_texture_offset", 3201125042_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = offset
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_texture_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_color : Void* = Pointer(Void).null
    def canvas_light_set_color(light : Int64, color : Color) : Void
      if @@mb_canvas_light_set_color.null?
        @@mb_canvas_light_set_color = Bridge.get_method_bind("RenderingServer", "canvas_light_set_color", 2948539648_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_height : Void* = Pointer(Void).null
    def canvas_light_set_height(light : Int64, height : Float64) : Void
      if @@mb_canvas_light_set_height.null?
        @@mb_canvas_light_set_height = Bridge.get_method_bind("RenderingServer", "canvas_light_set_height", 1794382983_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = height
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_height, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_energy : Void* = Pointer(Void).null
    def canvas_light_set_energy(light : Int64, energy : Float64) : Void
      if @@mb_canvas_light_set_energy.null?
        @@mb_canvas_light_set_energy = Bridge.get_method_bind("RenderingServer", "canvas_light_set_energy", 1794382983_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = energy
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_z_range : Void* = Pointer(Void).null
    def canvas_light_set_z_range(light : Int64, min_z : Int64, max_z : Int64) : Void
      if @@mb_canvas_light_set_z_range.null?
        @@mb_canvas_light_set_z_range = Bridge.get_method_bind("RenderingServer", "canvas_light_set_z_range", 4288446313_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min_z
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max_z
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_light_set_z_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_layer_range : Void* = Pointer(Void).null
    def canvas_light_set_layer_range(light : Int64, min_layer : Int64, max_layer : Int64) : Void
      if @@mb_canvas_light_set_layer_range.null?
        @@mb_canvas_light_set_layer_range = Bridge.get_method_bind("RenderingServer", "canvas_light_set_layer_range", 4288446313_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min_layer
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max_layer
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_light_set_layer_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_item_cull_mask : Void* = Pointer(Void).null
    def canvas_light_set_item_cull_mask(light : Int64, mask : Int64) : Void
      if @@mb_canvas_light_set_item_cull_mask.null?
        @@mb_canvas_light_set_item_cull_mask = Bridge.get_method_bind("RenderingServer", "canvas_light_set_item_cull_mask", 3411492887_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_item_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_item_shadow_cull_mask : Void* = Pointer(Void).null
    def canvas_light_set_item_shadow_cull_mask(light : Int64, mask : Int64) : Void
      if @@mb_canvas_light_set_item_shadow_cull_mask.null?
        @@mb_canvas_light_set_item_shadow_cull_mask = Bridge.get_method_bind("RenderingServer", "canvas_light_set_item_shadow_cull_mask", 3411492887_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_item_shadow_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_mode : Void* = Pointer(Void).null
    def canvas_light_set_mode(light : Int64, mode : Int64) : Void
      if @@mb_canvas_light_set_mode.null?
        @@mb_canvas_light_set_mode = Bridge.get_method_bind("RenderingServer", "canvas_light_set_mode", 2957564891_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_shadow_enabled : Void* = Pointer(Void).null
    def canvas_light_set_shadow_enabled(light : Int64, enabled : Bool) : Void
      if @@mb_canvas_light_set_shadow_enabled.null?
        @@mb_canvas_light_set_shadow_enabled = Bridge.get_method_bind("RenderingServer", "canvas_light_set_shadow_enabled", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_shadow_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_shadow_filter : Void* = Pointer(Void).null
    def canvas_light_set_shadow_filter(light : Int64, filter : Int64) : Void
      if @@mb_canvas_light_set_shadow_filter.null?
        @@mb_canvas_light_set_shadow_filter = Bridge.get_method_bind("RenderingServer", "canvas_light_set_shadow_filter", 393119659_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = filter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_shadow_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_shadow_color : Void* = Pointer(Void).null
    def canvas_light_set_shadow_color(light : Int64, color : Color) : Void
      if @@mb_canvas_light_set_shadow_color.null?
        @@mb_canvas_light_set_shadow_color = Bridge.get_method_bind("RenderingServer", "canvas_light_set_shadow_color", 2948539648_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_shadow_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_shadow_smooth : Void* = Pointer(Void).null
    def canvas_light_set_shadow_smooth(light : Int64, smooth : Float64) : Void
      if @@mb_canvas_light_set_shadow_smooth.null?
        @@mb_canvas_light_set_shadow_smooth = Bridge.get_method_bind("RenderingServer", "canvas_light_set_shadow_smooth", 1794382983_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = smooth
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_shadow_smooth, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_blend_mode : Void* = Pointer(Void).null
    def canvas_light_set_blend_mode(light : Int64, mode : Int64) : Void
      if @@mb_canvas_light_set_blend_mode.null?
        @@mb_canvas_light_set_blend_mode = Bridge.get_method_bind("RenderingServer", "canvas_light_set_blend_mode", 804895945_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_blend_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_set_interpolated : Void* = Pointer(Void).null
    def canvas_light_set_interpolated(light : Int64, interpolated : Bool) : Void
      if @@mb_canvas_light_set_interpolated.null?
        @@mb_canvas_light_set_interpolated = Bridge.get_method_bind("RenderingServer", "canvas_light_set_interpolated", 1265174801_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = interpolated
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_set_interpolated, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_reset_physics_interpolation : Void* = Pointer(Void).null
    def canvas_light_reset_physics_interpolation(light : Int64) : Void
      if @@mb_canvas_light_reset_physics_interpolation.null?
        @@mb_canvas_light_reset_physics_interpolation = Bridge.get_method_bind("RenderingServer", "canvas_light_reset_physics_interpolation", 2722037293_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_canvas_light_reset_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_transform_physics_interpolation : Void* = Pointer(Void).null
    def canvas_light_transform_physics_interpolation(light : Int64, transform : Transform2D) : Void
      if @@mb_canvas_light_transform_physics_interpolation.null?
        @@mb_canvas_light_transform_physics_interpolation = Bridge.get_method_bind("RenderingServer", "canvas_light_transform_physics_interpolation", 1246044741_i64)
      end
      val_0 = light
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_transform_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_create : Void* = Pointer(Void).null
    def canvas_light_occluder_create() : Int64
      if @@mb_canvas_light_occluder_create.null?
        @@mb_canvas_light_occluder_create = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_canvas_light_occluder_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_canvas_light_occluder_attach_to_canvas : Void* = Pointer(Void).null
    def canvas_light_occluder_attach_to_canvas(occluder : Int64, canvas : Int64) : Void
      if @@mb_canvas_light_occluder_attach_to_canvas.null?
        @@mb_canvas_light_occluder_attach_to_canvas = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_attach_to_canvas", 395945892_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_attach_to_canvas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_set_enabled : Void* = Pointer(Void).null
    def canvas_light_occluder_set_enabled(occluder : Int64, enabled : Bool) : Void
      if @@mb_canvas_light_occluder_set_enabled.null?
        @@mb_canvas_light_occluder_set_enabled = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_set_enabled", 1265174801_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_set_polygon : Void* = Pointer(Void).null
    def canvas_light_occluder_set_polygon(occluder : Int64, polygon : Int64) : Void
      if @@mb_canvas_light_occluder_set_polygon.null?
        @@mb_canvas_light_occluder_set_polygon = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_set_polygon", 395945892_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_set_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_set_as_sdf_collision : Void* = Pointer(Void).null
    def canvas_light_occluder_set_as_sdf_collision(occluder : Int64, enable : Bool) : Void
      if @@mb_canvas_light_occluder_set_as_sdf_collision.null?
        @@mb_canvas_light_occluder_set_as_sdf_collision = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_set_as_sdf_collision", 1265174801_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_set_as_sdf_collision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_set_transform : Void* = Pointer(Void).null
    def canvas_light_occluder_set_transform(occluder : Int64, transform : Transform2D) : Void
      if @@mb_canvas_light_occluder_set_transform.null?
        @@mb_canvas_light_occluder_set_transform = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_set_transform", 1246044741_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_set_light_mask : Void* = Pointer(Void).null
    def canvas_light_occluder_set_light_mask(occluder : Int64, mask : Int64) : Void
      if @@mb_canvas_light_occluder_set_light_mask.null?
        @@mb_canvas_light_occluder_set_light_mask = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_set_light_mask", 3411492887_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_set_light_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_set_interpolated : Void* = Pointer(Void).null
    def canvas_light_occluder_set_interpolated(occluder : Int64, interpolated : Bool) : Void
      if @@mb_canvas_light_occluder_set_interpolated.null?
        @@mb_canvas_light_occluder_set_interpolated = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_set_interpolated", 1265174801_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = interpolated
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_set_interpolated, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_reset_physics_interpolation : Void* = Pointer(Void).null
    def canvas_light_occluder_reset_physics_interpolation(occluder : Int64) : Void
      if @@mb_canvas_light_occluder_reset_physics_interpolation.null?
        @@mb_canvas_light_occluder_reset_physics_interpolation = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_reset_physics_interpolation", 2722037293_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_canvas_light_occluder_reset_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_light_occluder_transform_physics_interpolation : Void* = Pointer(Void).null
    def canvas_light_occluder_transform_physics_interpolation(occluder : Int64, transform : Transform2D) : Void
      if @@mb_canvas_light_occluder_transform_physics_interpolation.null?
        @@mb_canvas_light_occluder_transform_physics_interpolation = Bridge.get_method_bind("RenderingServer", "canvas_light_occluder_transform_physics_interpolation", 1246044741_i64)
      end
      val_0 = occluder
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_light_occluder_transform_physics_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_occluder_polygon_create : Void* = Pointer(Void).null
    def canvas_occluder_polygon_create() : Int64
      if @@mb_canvas_occluder_polygon_create.null?
        @@mb_canvas_occluder_polygon_create = Bridge.get_method_bind("RenderingServer", "canvas_occluder_polygon_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_canvas_occluder_polygon_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_canvas_occluder_polygon_set_shape : Void* = Pointer(Void).null
    def canvas_occluder_polygon_set_shape(occluder_polygon : Int64, shape : Void*, closed : Bool) : Void
      if @@mb_canvas_occluder_polygon_set_shape.null?
        @@mb_canvas_occluder_polygon_set_shape = Bridge.get_method_bind("RenderingServer", "canvas_occluder_polygon_set_shape", 2103882027_i64)
      end
      val_0 = occluder_polygon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = closed
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_canvas_occluder_polygon_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_occluder_polygon_set_cull_mode : Void* = Pointer(Void).null
    def canvas_occluder_polygon_set_cull_mode(occluder_polygon : Int64, mode : Int64) : Void
      if @@mb_canvas_occluder_polygon_set_cull_mode.null?
        @@mb_canvas_occluder_polygon_set_cull_mode = Bridge.get_method_bind("RenderingServer", "canvas_occluder_polygon_set_cull_mode", 1839404663_i64)
      end
      val_0 = occluder_polygon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_canvas_occluder_polygon_set_cull_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_canvas_set_shadow_texture_size : Void* = Pointer(Void).null
    def canvas_set_shadow_texture_size(size : Int64) : Void
      if @@mb_canvas_set_shadow_texture_size.null?
        @@mb_canvas_set_shadow_texture_size = Bridge.get_method_bind("RenderingServer", "canvas_set_shadow_texture_size", 1286410249_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_canvas_set_shadow_texture_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_shader_parameter_add : Void* = Pointer(Void).null
    def global_shader_parameter_add(name : String, get_type : Int64, default_value : Void*) : Void
      if @@mb_global_shader_parameter_add.null?
        @@mb_global_shader_parameter_add = Bridge.get_method_bind("RenderingServer", "global_shader_parameter_add", 463390080_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = get_type
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = default_value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_global_shader_parameter_add, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_shader_parameter_remove : Void* = Pointer(Void).null
    def global_shader_parameter_remove(name : String) : Void
      if @@mb_global_shader_parameter_remove.null?
        @@mb_global_shader_parameter_remove = Bridge.get_method_bind("RenderingServer", "global_shader_parameter_remove", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_global_shader_parameter_remove, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_shader_parameter_get_list : Void* = Pointer(Void).null
    def global_shader_parameter_get_list() : Godot::Array
      if @@mb_global_shader_parameter_get_list.null?
        @@mb_global_shader_parameter_get_list = Bridge.get_method_bind("RenderingServer", "global_shader_parameter_get_list", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_global_shader_parameter_get_list, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_global_shader_parameter_set : Void* = Pointer(Void).null
    def global_shader_parameter_set(name : String, value : Void*) : Void
      if @@mb_global_shader_parameter_set.null?
        @@mb_global_shader_parameter_set = Bridge.get_method_bind("RenderingServer", "global_shader_parameter_set", 3776071444_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_global_shader_parameter_set, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_shader_parameter_set_override : Void* = Pointer(Void).null
    def global_shader_parameter_set_override(name : String, value : Void*) : Void
      if @@mb_global_shader_parameter_set_override.null?
        @@mb_global_shader_parameter_set_override = Bridge.get_method_bind("RenderingServer", "global_shader_parameter_set_override", 3776071444_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_global_shader_parameter_set_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_shader_parameter_get : Void* = Pointer(Void).null
    def global_shader_parameter_get(name : String) : Void*
      if @@mb_global_shader_parameter_get.null?
        @@mb_global_shader_parameter_get = Bridge.get_method_bind("RenderingServer", "global_shader_parameter_get", 2760726917_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_global_shader_parameter_get, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_global_shader_parameter_get_type : Void* = Pointer(Void).null
    def global_shader_parameter_get_type(name : String) : Int64
      if @@mb_global_shader_parameter_get_type.null?
        @@mb_global_shader_parameter_get_type = Bridge.get_method_bind("RenderingServer", "global_shader_parameter_get_type", 1601414142_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_global_shader_parameter_get_type, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_free_rid : Void* = Pointer(Void).null
    def free_rid(rid : Int64) : Void
      if @@mb_free_rid.null?
        @@mb_free_rid = Bridge.get_method_bind("RenderingServer", "free_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_free_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_request_frame_drawn_callback : Void* = Pointer(Void).null
    def request_frame_drawn_callback(callable : Void*) : Void
      if @@mb_request_frame_drawn_callback.null?
        @@mb_request_frame_drawn_callback = Bridge.get_method_bind("RenderingServer", "request_frame_drawn_callback", 1611583062_i64)
      end
      val_0 = callable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_request_frame_drawn_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_changed : Void* = Pointer(Void).null
    def has_changed() : Bool
      if @@mb_has_changed.null?
        @@mb_has_changed = Bridge.get_method_bind("RenderingServer", "has_changed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_changed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_rendering_info : Void* = Pointer(Void).null
    def get_rendering_info(info : Int64) : Int64
      if @@mb_get_rendering_info.null?
        @@mb_get_rendering_info = Bridge.get_method_bind("RenderingServer", "get_rendering_info", 3763192241_i64)
      end
      val_0 = info
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rendering_info, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_video_adapter_name : Void* = Pointer(Void).null
    def get_video_adapter_name() : String
      if @@mb_get_video_adapter_name.null?
        @@mb_get_video_adapter_name = Bridge.get_method_bind("RenderingServer", "get_video_adapter_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_video_adapter_vendor : Void* = Pointer(Void).null
    def get_video_adapter_vendor() : String
      if @@mb_get_video_adapter_vendor.null?
        @@mb_get_video_adapter_vendor = Bridge.get_method_bind("RenderingServer", "get_video_adapter_vendor", 201670096_i64)
      end
      ""
    end
    @@mb_get_video_adapter_type : Void* = Pointer(Void).null
    def get_video_adapter_type() : Int64
      if @@mb_get_video_adapter_type.null?
        @@mb_get_video_adapter_type = Bridge.get_method_bind("RenderingServer", "get_video_adapter_type", 3099547011_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_video_adapter_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_video_adapter_api_version : Void* = Pointer(Void).null
    def get_video_adapter_api_version() : String
      if @@mb_get_video_adapter_api_version.null?
        @@mb_get_video_adapter_api_version = Bridge.get_method_bind("RenderingServer", "get_video_adapter_api_version", 201670096_i64)
      end
      ""
    end
    @@mb_get_current_rendering_driver_name : Void* = Pointer(Void).null
    def get_current_rendering_driver_name() : String
      if @@mb_get_current_rendering_driver_name.null?
        @@mb_get_current_rendering_driver_name = Bridge.get_method_bind("RenderingServer", "get_current_rendering_driver_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_current_rendering_method : Void* = Pointer(Void).null
    def get_current_rendering_method() : String
      if @@mb_get_current_rendering_method.null?
        @@mb_get_current_rendering_method = Bridge.get_method_bind("RenderingServer", "get_current_rendering_method", 201670096_i64)
      end
      ""
    end
    @@mb_make_sphere_mesh : Void* = Pointer(Void).null
    def make_sphere_mesh(latitudes : Int64, longitudes : Int64, radius : Float64) : Int64
      if @@mb_make_sphere_mesh.null?
        @@mb_make_sphere_mesh = Bridge.get_method_bind("RenderingServer", "make_sphere_mesh", 2251015897_i64)
      end
      val_0 = latitudes
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = longitudes
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = radius
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_make_sphere_mesh, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_test_cube : Void* = Pointer(Void).null
    def get_test_cube() : Int64
      if @@mb_get_test_cube.null?
        @@mb_get_test_cube = Bridge.get_method_bind("RenderingServer", "get_test_cube", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_test_cube, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_test_texture : Void* = Pointer(Void).null
    def get_test_texture() : Int64
      if @@mb_get_test_texture.null?
        @@mb_get_test_texture = Bridge.get_method_bind("RenderingServer", "get_test_texture", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_test_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_white_texture : Void* = Pointer(Void).null
    def get_white_texture() : Int64
      if @@mb_get_white_texture.null?
        @@mb_get_white_texture = Bridge.get_method_bind("RenderingServer", "get_white_texture", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_white_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_boot_image_with_stretch : Void* = Pointer(Void).null
    def set_boot_image_with_stretch(image : Image, color : Color, stretch_mode : Int64, use_filter : Bool) : Void
      if @@mb_set_boot_image_with_stretch.null?
        @@mb_set_boot_image_with_stretch = Bridge.get_method_bind("RenderingServer", "set_boot_image_with_stretch", 1104470771_i64)
      end
      val_0 = image
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = stretch_mode
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = use_filter
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_boot_image_with_stretch, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_boot_image : Void* = Pointer(Void).null
    def set_boot_image(image : Image, color : Color, scale : Bool, use_filter : Bool) : Void
      if @@mb_set_boot_image.null?
        @@mb_set_boot_image = Bridge.get_method_bind("RenderingServer", "set_boot_image", 3759744527_i64)
      end
      val_0 = image
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = scale
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = use_filter
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_boot_image, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_clear_color : Void* = Pointer(Void).null
    def get_default_clear_color() : Color
      if @@mb_get_default_clear_color.null?
        @@mb_get_default_clear_color = Bridge.get_method_bind("RenderingServer", "get_default_clear_color", 3200896285_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_default_clear_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_default_clear_color : Void* = Pointer(Void).null
    def set_default_clear_color(color : Color) : Void
      if @@mb_set_default_clear_color.null?
        @@mb_set_default_clear_color = Bridge.get_method_bind("RenderingServer", "set_default_clear_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_clear_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_os_feature : Void* = Pointer(Void).null
    def has_os_feature(feature : String) : Bool
      if @@mb_has_os_feature.null?
        @@mb_has_os_feature = Bridge.get_method_bind("RenderingServer", "has_os_feature", 3927539163_i64)
      end
      val_0 = feature
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_os_feature, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_debug_generate_wireframes : Void* = Pointer(Void).null
    def set_debug_generate_wireframes(generate : Bool) : Void
      if @@mb_set_debug_generate_wireframes.null?
        @@mb_set_debug_generate_wireframes = Bridge.get_method_bind("RenderingServer", "set_debug_generate_wireframes", 2586408642_i64)
      end
      val_0 = generate
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_generate_wireframes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_render_loop_enabled : Void* = Pointer(Void).null
    def is_render_loop_enabled() : Bool
      if @@mb_is_render_loop_enabled.null?
        @@mb_is_render_loop_enabled = Bridge.get_method_bind("RenderingServer", "is_render_loop_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_render_loop_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_render_loop_enabled : Void* = Pointer(Void).null
    def set_render_loop_enabled(enabled : Bool) : Void
      if @@mb_set_render_loop_enabled.null?
        @@mb_set_render_loop_enabled = Bridge.get_method_bind("RenderingServer", "set_render_loop_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_render_loop_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_frame_setup_time_cpu : Void* = Pointer(Void).null
    def get_frame_setup_time_cpu() : Float64
      if @@mb_get_frame_setup_time_cpu.null?
        @@mb_get_frame_setup_time_cpu = Bridge.get_method_bind("RenderingServer", "get_frame_setup_time_cpu", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_frame_setup_time_cpu, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_force_sync : Void* = Pointer(Void).null
    def force_sync() : Void
      if @@mb_force_sync.null?
        @@mb_force_sync = Bridge.get_method_bind("RenderingServer", "force_sync", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_sync, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_force_draw : Void* = Pointer(Void).null
    def force_draw(swap_buffers : Bool, frame_step : Float64) : Void
      if @@mb_force_draw.null?
        @@mb_force_draw = Bridge.get_method_bind("RenderingServer", "force_draw", 1076185472_i64)
      end
      val_0 = swap_buffers
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = frame_step
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_force_draw, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_rendering_device : Void* = Pointer(Void).null
    def get_rendering_device() : RenderingDevice
      if @@mb_get_rendering_device.null?
        @@mb_get_rendering_device = Bridge.get_method_bind("RenderingServer", "get_rendering_device", 1405107940_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rendering_device, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      RenderingDevice.new(ret_ptr)
    end
    @@mb_create_local_rendering_device : Void* = Pointer(Void).null
    def create_local_rendering_device() : RenderingDevice
      if @@mb_create_local_rendering_device.null?
        @@mb_create_local_rendering_device = Bridge.get_method_bind("RenderingServer", "create_local_rendering_device", 1405107940_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_local_rendering_device, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      RenderingDevice.new(ret_ptr)
    end
    @@mb_is_on_render_thread : Void* = Pointer(Void).null
    def is_on_render_thread() : Bool
      if @@mb_is_on_render_thread.null?
        @@mb_is_on_render_thread = Bridge.get_method_bind("RenderingServer", "is_on_render_thread", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_render_thread, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_call_on_render_thread : Void* = Pointer(Void).null
    def call_on_render_thread(callable : Void*) : Void
      if @@mb_call_on_render_thread.null?
        @@mb_call_on_render_thread = Bridge.get_method_bind("RenderingServer", "call_on_render_thread", 1611583062_i64)
      end
      val_0 = callable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_call_on_render_thread, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_feature : Void* = Pointer(Void).null
    def has_feature(feature : Int64) : Bool
      if @@mb_has_feature.null?
        @@mb_has_feature = Bridge.get_method_bind("RenderingServer", "has_feature", 598462696_i64)
      end
      val_0 = feature
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_feature, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class SocketServer < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_is_connection_available : Void* = Pointer(Void).null
    def is_connection_available() : Bool
      if @@mb_is_connection_available.null?
        @@mb_is_connection_available = Bridge.get_method_bind("SocketServer", "is_connection_available", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_connection_available, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_listening : Void* = Pointer(Void).null
    def is_listening() : Bool
      if @@mb_is_listening.null?
        @@mb_is_listening = Bridge.get_method_bind("SocketServer", "is_listening", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_listening, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_stop : Void* = Pointer(Void).null
    def stop() : Void
      if @@mb_stop.null?
        @@mb_stop = Bridge.get_method_bind("SocketServer", "stop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_stop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_take_socket_connection : Void* = Pointer(Void).null
    def take_socket_connection() : StreamPeerSocket
      if @@mb_take_socket_connection.null?
        @@mb_take_socket_connection = Bridge.get_method_bind("SocketServer", "take_socket_connection", 1883962599_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_take_socket_connection, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      StreamPeerSocket.new(ret_ptr)
    end
  end
  class TCPServer < Godot::SocketServer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_listen : Void* = Pointer(Void).null
    def listen(port : Int64, bind_address : String) : Int64
      if @@mb_listen.null?
        @@mb_listen = Bridge.get_method_bind("TCPServer", "listen", 3167955072_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bind_address
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_listen, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_local_port : Void* = Pointer(Void).null
    def get_local_port() : Int64
      if @@mb_get_local_port.null?
        @@mb_get_local_port = Bridge.get_method_bind("TCPServer", "get_local_port", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_local_port, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_take_connection : Void* = Pointer(Void).null
    def take_connection() : StreamPeerTCP
      if @@mb_take_connection.null?
        @@mb_take_connection = Bridge.get_method_bind("TCPServer", "take_connection", 30545006_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_take_connection, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      StreamPeerTCP.new(ret_ptr)
    end
  end
  class TextServer < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum FontAntialiasing : Int64
      FontAntialiasingNone = 0_i64
      FontAntialiasingGray = 1_i64
      FontAntialiasingLcd = 2_i64
    end
    enum FontLCDSubpixelLayout : Int64
      FontLcdSubpixelLayoutNone = 0_i64
      FontLcdSubpixelLayoutHrgb = 1_i64
      FontLcdSubpixelLayoutHbgr = 2_i64
      FontLcdSubpixelLayoutVrgb = 3_i64
      FontLcdSubpixelLayoutVbgr = 4_i64
      FontLcdSubpixelLayoutMax = 5_i64
    end
    enum Direction : Int64
      DirectionAuto = 0_i64
      DirectionLtr = 1_i64
      DirectionRtl = 2_i64
      DirectionInherited = 3_i64
    end
    enum Orientation : Int64
      OrientationHorizontal = 0_i64
      OrientationVertical = 1_i64
    end
    enum JustificationFlag : Int64
      JustificationNone = 0_i64
      JustificationKashida = 1_i64
      JustificationWordBound = 2_i64
      JustificationTrimEdgeSpaces = 4_i64
      JustificationAfterLastTab = 8_i64
      JustificationConstrainEllipsis = 16_i64
      JustificationSkipLastLine = 32_i64
      JustificationSkipLastLineWithVisibleChars = 64_i64
      JustificationDoNotSkipSingleLine = 128_i64
    end
    enum AutowrapMode : Int64
      AutowrapOff = 0_i64
      AutowrapArbitrary = 1_i64
      AutowrapWord = 2_i64
      AutowrapWordSmart = 3_i64
    end
    enum LineBreakFlag : Int64
      BreakNone = 0_i64
      BreakMandatory = 1_i64
      BreakWordBound = 2_i64
      BreakGraphemeBound = 4_i64
      BreakAdaptive = 8_i64
      BreakTrimEdgeSpaces = 16_i64
      BreakTrimIndent = 32_i64
      BreakTrimStartEdgeSpaces = 64_i64
      BreakTrimEndEdgeSpaces = 128_i64
    end
    enum VisibleCharactersBehavior : Int64
      VcCharsBeforeShaping = 0_i64
      VcCharsAfterShaping = 1_i64
      VcGlyphsAuto = 2_i64
      VcGlyphsLtr = 3_i64
      VcGlyphsRtl = 4_i64
    end
    enum OverrunBehavior : Int64
      OverrunNoTrimming = 0_i64
      OverrunTrimChar = 1_i64
      OverrunTrimWord = 2_i64
      OverrunTrimEllipsis = 3_i64
      OverrunTrimWordEllipsis = 4_i64
      OverrunTrimEllipsisForce = 5_i64
      OverrunTrimWordEllipsisForce = 6_i64
    end
    enum TextOverrunFlag : Int64
      OverrunNoTrim = 0_i64
      OverrunTrim = 1_i64
      OverrunTrimWordOnly = 2_i64
      OverrunAddEllipsis = 4_i64
      OverrunEnforceEllipsis = 8_i64
      OverrunJustificationAware = 16_i64
      OverrunShortStringEllipsis = 32_i64
    end
    enum GraphemeFlag : Int64
      GraphemeIsValid = 1_i64
      GraphemeIsRtl = 2_i64
      GraphemeIsVirtual = 4_i64
      GraphemeIsSpace = 8_i64
      GraphemeIsBreakHard = 16_i64
      GraphemeIsBreakSoft = 32_i64
      GraphemeIsTab = 64_i64
      GraphemeIsElongation = 128_i64
      GraphemeIsPunctuation = 256_i64
      GraphemeIsUnderscore = 512_i64
      GraphemeIsConnected = 1024_i64
      GraphemeIsSafeToInsertTatweel = 2048_i64
      GraphemeIsEmbeddedObject = 4096_i64
      GraphemeIsSoftHyphen = 8192_i64
    end
    enum Hinting : Int64
      HintingNone = 0_i64
      HintingLight = 1_i64
      HintingNormal = 2_i64
    end
    enum SubpixelPositioning : Int64
      SubpixelPositioningDisabled = 0_i64
      SubpixelPositioningAuto = 1_i64
      SubpixelPositioningOneHalf = 2_i64
      SubpixelPositioningOneQuarter = 3_i64
      SubpixelPositioningOneHalfMaxSize = 20_i64
      SubpixelPositioningOneQuarterMaxSize = 16_i64
    end
    enum Feature : Int64
      FeatureSimpleLayout = 1_i64
      FeatureBidiLayout = 2_i64
      FeatureVerticalLayout = 4_i64
      FeatureShaping = 8_i64
      FeatureKashidaJustification = 16_i64
      FeatureBreakIterators = 32_i64
      FeatureFontBitmap = 64_i64
      FeatureFontDynamic = 128_i64
      FeatureFontMsdf = 256_i64
      FeatureFontSystem = 512_i64
      FeatureFontVariable = 1024_i64
      FeatureContextSensitiveCaseConversion = 2048_i64
      FeatureUseSupportData = 4096_i64
      FeatureUnicodeIdentifiers = 8192_i64
      FeatureUnicodeSecurity = 16384_i64
    end
    enum ContourPointTag : Int64
      ContourCurveTagOn = 1_i64
      ContourCurveTagOffConic = 0_i64
      ContourCurveTagOffCubic = 2_i64
    end
    enum SpacingType : Int64
      SpacingGlyph = 0_i64
      SpacingSpace = 1_i64
      SpacingTop = 2_i64
      SpacingBottom = 3_i64
      SpacingMax = 4_i64
    end
    enum FontStyle : Int64
      FontBold = 1_i64
      FontItalic = 2_i64
      FontFixedWidth = 4_i64
    end
    enum StructuredTextParser : Int64
      StructuredTextDefault = 0_i64
      StructuredTextUri = 1_i64
      StructuredTextFile = 2_i64
      StructuredTextEmail = 3_i64
      StructuredTextList = 4_i64
      StructuredTextGdscript = 5_i64
      StructuredTextCustom = 6_i64
    end
    enum FixedSizeScaleMode : Int64
      FixedSizeScaleDisable = 0_i64
      FixedSizeScaleIntegerOnly = 1_i64
      FixedSizeScaleEnabled = 2_i64
    end
    @@mb_has_feature : Void* = Pointer(Void).null
    def has_feature(feature : Int64) : Bool
      if @@mb_has_feature.null?
        @@mb_has_feature = Bridge.get_method_bind("TextServer", "has_feature", 3967367083_i64)
      end
      val_0 = feature
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_feature, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_name : Void* = Pointer(Void).null
    def get_name() : String
      if @@mb_get_name.null?
        @@mb_get_name = Bridge.get_method_bind("TextServer", "get_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_short_name : Void* = Pointer(Void).null
    def get_short_name() : String
      if @@mb_get_short_name.null?
        @@mb_get_short_name = Bridge.get_method_bind("TextServer", "get_short_name", 201670096_i64)
      end
      ""
    end
    @@mb_get_features : Void* = Pointer(Void).null
    def get_features() : Int64
      if @@mb_get_features.null?
        @@mb_get_features = Bridge.get_method_bind("TextServer", "get_features", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_features, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_load_support_data : Void* = Pointer(Void).null
    def load_support_data(filename : String) : Bool
      if @@mb_load_support_data.null?
        @@mb_load_support_data = Bridge.get_method_bind("TextServer", "load_support_data", 2323990056_i64)
      end
      val_0 = filename
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_load_support_data, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_support_data_filename : Void* = Pointer(Void).null
    def get_support_data_filename() : String
      if @@mb_get_support_data_filename.null?
        @@mb_get_support_data_filename = Bridge.get_method_bind("TextServer", "get_support_data_filename", 201670096_i64)
      end
      ""
    end
    @@mb_get_support_data_info : Void* = Pointer(Void).null
    def get_support_data_info() : String
      if @@mb_get_support_data_info.null?
        @@mb_get_support_data_info = Bridge.get_method_bind("TextServer", "get_support_data_info", 201670096_i64)
      end
      ""
    end
    @@mb_save_support_data : Void* = Pointer(Void).null
    def save_support_data(filename : String) : Bool
      if @@mb_save_support_data.null?
        @@mb_save_support_data = Bridge.get_method_bind("TextServer", "save_support_data", 3927539163_i64)
      end
      val_0 = filename
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_save_support_data, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_support_data : Void* = Pointer(Void).null
    def get_support_data() : Void*
      if @@mb_get_support_data.null?
        @@mb_get_support_data = Bridge.get_method_bind("TextServer", "get_support_data", 2362200018_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_support_data, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_is_locale_using_support_data : Void* = Pointer(Void).null
    def is_locale_using_support_data(locale : String) : Bool
      if @@mb_is_locale_using_support_data.null?
        @@mb_is_locale_using_support_data = Bridge.get_method_bind("TextServer", "is_locale_using_support_data", 3927539163_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_locale_using_support_data, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_locale_right_to_left : Void* = Pointer(Void).null
    def is_locale_right_to_left(locale : String) : Bool
      if @@mb_is_locale_right_to_left.null?
        @@mb_is_locale_right_to_left = Bridge.get_method_bind("TextServer", "is_locale_right_to_left", 3927539163_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_locale_right_to_left, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_name_to_tag : Void* = Pointer(Void).null
    def name_to_tag(name : String) : Int64
      if @@mb_name_to_tag.null?
        @@mb_name_to_tag = Bridge.get_method_bind("TextServer", "name_to_tag", 1321353865_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_name_to_tag, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_tag_to_name : Void* = Pointer(Void).null
    def tag_to_name(tag : Int64) : String
      if @@mb_tag_to_name.null?
        @@mb_tag_to_name = Bridge.get_method_bind("TextServer", "tag_to_name", 844755477_i64)
      end
      val_0 = tag
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_has : Void* = Pointer(Void).null
    def has(rid : Int64) : Bool
      if @@mb_has.null?
        @@mb_has = Bridge.get_method_bind("TextServer", "has", 3521089500_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_free_rid : Void* = Pointer(Void).null
    def free_rid(rid : Int64) : Void
      if @@mb_free_rid.null?
        @@mb_free_rid = Bridge.get_method_bind("TextServer", "free_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_free_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_create_font : Void* = Pointer(Void).null
    def create_font() : Int64
      if @@mb_create_font.null?
        @@mb_create_font = Bridge.get_method_bind("TextServer", "create_font", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_font, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_create_font_linked_variation : Void* = Pointer(Void).null
    def create_font_linked_variation(font_rid : Int64) : Int64
      if @@mb_create_font_linked_variation.null?
        @@mb_create_font_linked_variation = Bridge.get_method_bind("TextServer", "create_font_linked_variation", 41030802_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_font_linked_variation, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_data : Void* = Pointer(Void).null
    def font_set_data(font_rid : Int64, data : Void*) : Void
      if @@mb_font_set_data.null?
        @@mb_font_set_data = Bridge.get_method_bind("TextServer", "font_set_data", 1355495400_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = data
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_set_face_index : Void* = Pointer(Void).null
    def font_set_face_index(font_rid : Int64, face_index : Int64) : Void
      if @@mb_font_set_face_index.null?
        @@mb_font_set_face_index = Bridge.get_method_bind("TextServer", "font_set_face_index", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = face_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_face_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_face_index : Void* = Pointer(Void).null
    def font_get_face_index(font_rid : Int64) : Int64
      if @@mb_font_get_face_index.null?
        @@mb_font_get_face_index = Bridge.get_method_bind("TextServer", "font_get_face_index", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_face_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_face_count : Void* = Pointer(Void).null
    def font_get_face_count(font_rid : Int64) : Int64
      if @@mb_font_get_face_count.null?
        @@mb_font_get_face_count = Bridge.get_method_bind("TextServer", "font_get_face_count", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_face_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_style : Void* = Pointer(Void).null
    def font_set_style(font_rid : Int64, style : Int64) : Void
      if @@mb_font_set_style.null?
        @@mb_font_set_style = Bridge.get_method_bind("TextServer", "font_set_style", 898466325_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = style
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_style, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_style : Void* = Pointer(Void).null
    def font_get_style(font_rid : Int64) : Int64
      if @@mb_font_get_style.null?
        @@mb_font_get_style = Bridge.get_method_bind("TextServer", "font_get_style", 3082502592_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_style, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_name : Void* = Pointer(Void).null
    def font_set_name(font_rid : Int64, name : String) : Void
      if @@mb_font_set_name.null?
        @@mb_font_set_name = Bridge.get_method_bind("TextServer", "font_set_name", 2726140452_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_name : Void* = Pointer(Void).null
    def font_get_name(font_rid : Int64) : String
      if @@mb_font_get_name.null?
        @@mb_font_get_name = Bridge.get_method_bind("TextServer", "font_get_name", 642473191_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_font_get_ot_name_strings : Void* = Pointer(Void).null
    def font_get_ot_name_strings(font_rid : Int64) : Void*
      if @@mb_font_get_ot_name_strings.null?
        @@mb_font_get_ot_name_strings = Bridge.get_method_bind("TextServer", "font_get_ot_name_strings", 1882737106_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_ot_name_strings, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_set_style_name : Void* = Pointer(Void).null
    def font_set_style_name(font_rid : Int64, name : String) : Void
      if @@mb_font_set_style_name.null?
        @@mb_font_set_style_name = Bridge.get_method_bind("TextServer", "font_set_style_name", 2726140452_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_style_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_style_name : Void* = Pointer(Void).null
    def font_get_style_name(font_rid : Int64) : String
      if @@mb_font_get_style_name.null?
        @@mb_font_get_style_name = Bridge.get_method_bind("TextServer", "font_get_style_name", 642473191_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_font_set_weight : Void* = Pointer(Void).null
    def font_set_weight(font_rid : Int64, weight : Int64) : Void
      if @@mb_font_set_weight.null?
        @@mb_font_set_weight = Bridge.get_method_bind("TextServer", "font_set_weight", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weight
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_weight, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_weight : Void* = Pointer(Void).null
    def font_get_weight(font_rid : Int64) : Int64
      if @@mb_font_get_weight.null?
        @@mb_font_get_weight = Bridge.get_method_bind("TextServer", "font_get_weight", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_weight, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_stretch : Void* = Pointer(Void).null
    def font_set_stretch(font_rid : Int64, weight : Int64) : Void
      if @@mb_font_set_stretch.null?
        @@mb_font_set_stretch = Bridge.get_method_bind("TextServer", "font_set_stretch", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weight
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_stretch, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_stretch : Void* = Pointer(Void).null
    def font_get_stretch(font_rid : Int64) : Int64
      if @@mb_font_get_stretch.null?
        @@mb_font_get_stretch = Bridge.get_method_bind("TextServer", "font_get_stretch", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_stretch, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_antialiasing : Void* = Pointer(Void).null
    def font_set_antialiasing(font_rid : Int64, antialiasing : Int64) : Void
      if @@mb_font_set_antialiasing.null?
        @@mb_font_set_antialiasing = Bridge.get_method_bind("TextServer", "font_set_antialiasing", 958337235_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = antialiasing
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_antialiasing, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_antialiasing : Void* = Pointer(Void).null
    def font_get_antialiasing(font_rid : Int64) : Int64
      if @@mb_font_get_antialiasing.null?
        @@mb_font_get_antialiasing = Bridge.get_method_bind("TextServer", "font_get_antialiasing", 3389420495_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_antialiasing, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_disable_embedded_bitmaps : Void* = Pointer(Void).null
    def font_set_disable_embedded_bitmaps(font_rid : Int64, disable_embedded_bitmaps : Bool) : Void
      if @@mb_font_set_disable_embedded_bitmaps.null?
        @@mb_font_set_disable_embedded_bitmaps = Bridge.get_method_bind("TextServer", "font_set_disable_embedded_bitmaps", 1265174801_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disable_embedded_bitmaps
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_disable_embedded_bitmaps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_disable_embedded_bitmaps : Void* = Pointer(Void).null
    def font_get_disable_embedded_bitmaps(font_rid : Int64) : Bool
      if @@mb_font_get_disable_embedded_bitmaps.null?
        @@mb_font_get_disable_embedded_bitmaps = Bridge.get_method_bind("TextServer", "font_get_disable_embedded_bitmaps", 4155700596_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_get_disable_embedded_bitmaps, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_set_generate_mipmaps : Void* = Pointer(Void).null
    def font_set_generate_mipmaps(font_rid : Int64, generate_mipmaps : Bool) : Void
      if @@mb_font_set_generate_mipmaps.null?
        @@mb_font_set_generate_mipmaps = Bridge.get_method_bind("TextServer", "font_set_generate_mipmaps", 1265174801_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = generate_mipmaps
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_generate_mipmaps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_generate_mipmaps : Void* = Pointer(Void).null
    def font_get_generate_mipmaps(font_rid : Int64) : Bool
      if @@mb_font_get_generate_mipmaps.null?
        @@mb_font_get_generate_mipmaps = Bridge.get_method_bind("TextServer", "font_get_generate_mipmaps", 4155700596_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_get_generate_mipmaps, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_set_multichannel_signed_distance_field : Void* = Pointer(Void).null
    def font_set_multichannel_signed_distance_field(font_rid : Int64, msdf : Bool) : Void
      if @@mb_font_set_multichannel_signed_distance_field.null?
        @@mb_font_set_multichannel_signed_distance_field = Bridge.get_method_bind("TextServer", "font_set_multichannel_signed_distance_field", 1265174801_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = msdf
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_multichannel_signed_distance_field, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_is_multichannel_signed_distance_field : Void* = Pointer(Void).null
    def font_is_multichannel_signed_distance_field(font_rid : Int64) : Bool
      if @@mb_font_is_multichannel_signed_distance_field.null?
        @@mb_font_is_multichannel_signed_distance_field = Bridge.get_method_bind("TextServer", "font_is_multichannel_signed_distance_field", 4155700596_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_is_multichannel_signed_distance_field, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_set_msdf_pixel_range : Void* = Pointer(Void).null
    def font_set_msdf_pixel_range(font_rid : Int64, msdf_pixel_range : Int64) : Void
      if @@mb_font_set_msdf_pixel_range.null?
        @@mb_font_set_msdf_pixel_range = Bridge.get_method_bind("TextServer", "font_set_msdf_pixel_range", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = msdf_pixel_range
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_msdf_pixel_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_msdf_pixel_range : Void* = Pointer(Void).null
    def font_get_msdf_pixel_range(font_rid : Int64) : Int64
      if @@mb_font_get_msdf_pixel_range.null?
        @@mb_font_get_msdf_pixel_range = Bridge.get_method_bind("TextServer", "font_get_msdf_pixel_range", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_msdf_pixel_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_msdf_size : Void* = Pointer(Void).null
    def font_set_msdf_size(font_rid : Int64, msdf_size : Int64) : Void
      if @@mb_font_set_msdf_size.null?
        @@mb_font_set_msdf_size = Bridge.get_method_bind("TextServer", "font_set_msdf_size", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = msdf_size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_msdf_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_msdf_size : Void* = Pointer(Void).null
    def font_get_msdf_size(font_rid : Int64) : Int64
      if @@mb_font_get_msdf_size.null?
        @@mb_font_get_msdf_size = Bridge.get_method_bind("TextServer", "font_get_msdf_size", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_msdf_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_fixed_size : Void* = Pointer(Void).null
    def font_set_fixed_size(font_rid : Int64, fixed_size : Int64) : Void
      if @@mb_font_set_fixed_size.null?
        @@mb_font_set_fixed_size = Bridge.get_method_bind("TextServer", "font_set_fixed_size", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = fixed_size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_fixed_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_fixed_size : Void* = Pointer(Void).null
    def font_get_fixed_size(font_rid : Int64) : Int64
      if @@mb_font_get_fixed_size.null?
        @@mb_font_get_fixed_size = Bridge.get_method_bind("TextServer", "font_get_fixed_size", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_fixed_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_fixed_size_scale_mode : Void* = Pointer(Void).null
    def font_set_fixed_size_scale_mode(font_rid : Int64, fixed_size_scale_mode : Int64) : Void
      if @@mb_font_set_fixed_size_scale_mode.null?
        @@mb_font_set_fixed_size_scale_mode = Bridge.get_method_bind("TextServer", "font_set_fixed_size_scale_mode", 1029390307_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = fixed_size_scale_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_fixed_size_scale_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_fixed_size_scale_mode : Void* = Pointer(Void).null
    def font_get_fixed_size_scale_mode(font_rid : Int64) : Int64
      if @@mb_font_get_fixed_size_scale_mode.null?
        @@mb_font_get_fixed_size_scale_mode = Bridge.get_method_bind("TextServer", "font_get_fixed_size_scale_mode", 4113120379_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_fixed_size_scale_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_allow_system_fallback : Void* = Pointer(Void).null
    def font_set_allow_system_fallback(font_rid : Int64, allow_system_fallback : Bool) : Void
      if @@mb_font_set_allow_system_fallback.null?
        @@mb_font_set_allow_system_fallback = Bridge.get_method_bind("TextServer", "font_set_allow_system_fallback", 1265174801_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = allow_system_fallback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_allow_system_fallback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_is_allow_system_fallback : Void* = Pointer(Void).null
    def font_is_allow_system_fallback(font_rid : Int64) : Bool
      if @@mb_font_is_allow_system_fallback.null?
        @@mb_font_is_allow_system_fallback = Bridge.get_method_bind("TextServer", "font_is_allow_system_fallback", 4155700596_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_is_allow_system_fallback, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_clear_system_fallback_cache : Void* = Pointer(Void).null
    def font_clear_system_fallback_cache() : Void
      if @@mb_font_clear_system_fallback_cache.null?
        @@mb_font_clear_system_fallback_cache = Bridge.get_method_bind("TextServer", "font_clear_system_fallback_cache", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_font_clear_system_fallback_cache, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_font_set_force_autohinter : Void* = Pointer(Void).null
    def font_set_force_autohinter(font_rid : Int64, force_autohinter : Bool) : Void
      if @@mb_font_set_force_autohinter.null?
        @@mb_font_set_force_autohinter = Bridge.get_method_bind("TextServer", "font_set_force_autohinter", 1265174801_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = force_autohinter
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_force_autohinter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_is_force_autohinter : Void* = Pointer(Void).null
    def font_is_force_autohinter(font_rid : Int64) : Bool
      if @@mb_font_is_force_autohinter.null?
        @@mb_font_is_force_autohinter = Bridge.get_method_bind("TextServer", "font_is_force_autohinter", 4155700596_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_is_force_autohinter, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_set_modulate_color_glyphs : Void* = Pointer(Void).null
    def font_set_modulate_color_glyphs(font_rid : Int64, modulate : Bool) : Void
      if @@mb_font_set_modulate_color_glyphs.null?
        @@mb_font_set_modulate_color_glyphs = Bridge.get_method_bind("TextServer", "font_set_modulate_color_glyphs", 1265174801_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = modulate
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_modulate_color_glyphs, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_is_modulate_color_glyphs : Void* = Pointer(Void).null
    def font_is_modulate_color_glyphs(font_rid : Int64) : Bool
      if @@mb_font_is_modulate_color_glyphs.null?
        @@mb_font_is_modulate_color_glyphs = Bridge.get_method_bind("TextServer", "font_is_modulate_color_glyphs", 4155700596_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_is_modulate_color_glyphs, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_get_palette_count : Void* = Pointer(Void).null
    def font_get_palette_count(font_rid : Int64) : Int64
      if @@mb_font_get_palette_count.null?
        @@mb_font_get_palette_count = Bridge.get_method_bind("TextServer", "font_get_palette_count", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_palette_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_palette_name : Void* = Pointer(Void).null
    def font_get_palette_name(font_rid : Int64, index : Int64) : String
      if @@mb_font_get_palette_name.null?
        @@mb_font_get_palette_name = Bridge.get_method_bind("TextServer", "font_get_palette_name", 1464764419_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_font_get_palette_colors : Void* = Pointer(Void).null
    def font_get_palette_colors(font_rid : Int64, index : Int64) : Void*
      if @@mb_font_get_palette_colors.null?
        @@mb_font_get_palette_colors = Bridge.get_method_bind("TextServer", "font_get_palette_colors", 1595517857_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_palette_colors, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_set_palette_custom_colors : Void* = Pointer(Void).null
    def font_set_palette_custom_colors(font_rid : Int64, colors : Void*) : Void
      if @@mb_font_set_palette_custom_colors.null?
        @@mb_font_set_palette_custom_colors = Bridge.get_method_bind("TextServer", "font_set_palette_custom_colors", 4037098590_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = colors
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_palette_custom_colors, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_palette_custom_colors : Void* = Pointer(Void).null
    def font_get_palette_custom_colors(font_rid : Int64) : Void*
      if @@mb_font_get_palette_custom_colors.null?
        @@mb_font_get_palette_custom_colors = Bridge.get_method_bind("TextServer", "font_get_palette_custom_colors", 1569415609_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_palette_custom_colors, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_get_used_palette : Void* = Pointer(Void).null
    def font_get_used_palette(font_rid : Int64) : Int64
      if @@mb_font_get_used_palette.null?
        @@mb_font_get_used_palette = Bridge.get_method_bind("TextServer", "font_get_used_palette", 2198884583_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_used_palette, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_used_palette : Void* = Pointer(Void).null
    def font_set_used_palette(font_rid : Int64, index : Int64) : Void
      if @@mb_font_set_used_palette.null?
        @@mb_font_set_used_palette = Bridge.get_method_bind("TextServer", "font_set_used_palette", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_used_palette, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_set_hinting : Void* = Pointer(Void).null
    def font_set_hinting(font_rid : Int64, hinting : Int64) : Void
      if @@mb_font_set_hinting.null?
        @@mb_font_set_hinting = Bridge.get_method_bind("TextServer", "font_set_hinting", 1520010864_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = hinting
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_hinting, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_hinting : Void* = Pointer(Void).null
    def font_get_hinting(font_rid : Int64) : Int64
      if @@mb_font_get_hinting.null?
        @@mb_font_get_hinting = Bridge.get_method_bind("TextServer", "font_get_hinting", 3971592737_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_hinting, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_subpixel_positioning : Void* = Pointer(Void).null
    def font_set_subpixel_positioning(font_rid : Int64, subpixel_positioning : Int64) : Void
      if @@mb_font_set_subpixel_positioning.null?
        @@mb_font_set_subpixel_positioning = Bridge.get_method_bind("TextServer", "font_set_subpixel_positioning", 3830459669_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = subpixel_positioning
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_subpixel_positioning, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_subpixel_positioning : Void* = Pointer(Void).null
    def font_get_subpixel_positioning(font_rid : Int64) : Int64
      if @@mb_font_get_subpixel_positioning.null?
        @@mb_font_get_subpixel_positioning = Bridge.get_method_bind("TextServer", "font_get_subpixel_positioning", 2752233671_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_subpixel_positioning, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_keep_rounding_remainders : Void* = Pointer(Void).null
    def font_set_keep_rounding_remainders(font_rid : Int64, keep_rounding_remainders : Bool) : Void
      if @@mb_font_set_keep_rounding_remainders.null?
        @@mb_font_set_keep_rounding_remainders = Bridge.get_method_bind("TextServer", "font_set_keep_rounding_remainders", 1265174801_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = keep_rounding_remainders
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_keep_rounding_remainders, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_keep_rounding_remainders : Void* = Pointer(Void).null
    def font_get_keep_rounding_remainders(font_rid : Int64) : Bool
      if @@mb_font_get_keep_rounding_remainders.null?
        @@mb_font_get_keep_rounding_remainders = Bridge.get_method_bind("TextServer", "font_get_keep_rounding_remainders", 4155700596_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_get_keep_rounding_remainders, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_set_embolden : Void* = Pointer(Void).null
    def font_set_embolden(font_rid : Int64, strength : Float64) : Void
      if @@mb_font_set_embolden.null?
        @@mb_font_set_embolden = Bridge.get_method_bind("TextServer", "font_set_embolden", 1794382983_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = strength
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_embolden, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_embolden : Void* = Pointer(Void).null
    def font_get_embolden(font_rid : Int64) : Float64
      if @@mb_font_get_embolden.null?
        @@mb_font_get_embolden = Bridge.get_method_bind("TextServer", "font_get_embolden", 866169185_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_embolden, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_spacing : Void* = Pointer(Void).null
    def font_set_spacing(font_rid : Int64, spacing : Int64, value : Int64) : Void
      if @@mb_font_set_spacing.null?
        @@mb_font_set_spacing = Bridge.get_method_bind("TextServer", "font_set_spacing", 1307259930_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = spacing
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_spacing, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_spacing : Void* = Pointer(Void).null
    def font_get_spacing(font_rid : Int64, spacing : Int64) : Int64
      if @@mb_font_get_spacing.null?
        @@mb_font_get_spacing = Bridge.get_method_bind("TextServer", "font_get_spacing", 1213653558_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = spacing
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_spacing, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_baseline_offset : Void* = Pointer(Void).null
    def font_set_baseline_offset(font_rid : Int64, baseline_offset : Float64) : Void
      if @@mb_font_set_baseline_offset.null?
        @@mb_font_set_baseline_offset = Bridge.get_method_bind("TextServer", "font_set_baseline_offset", 1794382983_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = baseline_offset
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_baseline_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_baseline_offset : Void* = Pointer(Void).null
    def font_get_baseline_offset(font_rid : Int64) : Float64
      if @@mb_font_get_baseline_offset.null?
        @@mb_font_get_baseline_offset = Bridge.get_method_bind("TextServer", "font_get_baseline_offset", 866169185_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_baseline_offset, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_transform : Void* = Pointer(Void).null
    def font_set_transform(font_rid : Int64, transform : Transform2D) : Void
      if @@mb_font_set_transform.null?
        @@mb_font_set_transform = Bridge.get_method_bind("TextServer", "font_set_transform", 1246044741_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_transform : Void* = Pointer(Void).null
    def font_get_transform(font_rid : Int64) : Transform2D
      if @@mb_font_get_transform.null?
        @@mb_font_get_transform = Bridge.get_method_bind("TextServer", "font_get_transform", 213527486_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_font_set_variation_coordinates : Void* = Pointer(Void).null
    def font_set_variation_coordinates(font_rid : Int64, variation_coordinates : Void*) : Void
      if @@mb_font_set_variation_coordinates.null?
        @@mb_font_set_variation_coordinates = Bridge.get_method_bind("TextServer", "font_set_variation_coordinates", 1217542888_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = variation_coordinates
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_variation_coordinates, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_variation_coordinates : Void* = Pointer(Void).null
    def font_get_variation_coordinates(font_rid : Int64) : Void*
      if @@mb_font_get_variation_coordinates.null?
        @@mb_font_get_variation_coordinates = Bridge.get_method_bind("TextServer", "font_get_variation_coordinates", 1882737106_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_variation_coordinates, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_set_oversampling : Void* = Pointer(Void).null
    def font_set_oversampling(font_rid : Int64, oversampling : Float64) : Void
      if @@mb_font_set_oversampling.null?
        @@mb_font_set_oversampling = Bridge.get_method_bind("TextServer", "font_set_oversampling", 1794382983_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = oversampling
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_oversampling, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_oversampling : Void* = Pointer(Void).null
    def font_get_oversampling(font_rid : Int64) : Float64
      if @@mb_font_get_oversampling.null?
        @@mb_font_get_oversampling = Bridge.get_method_bind("TextServer", "font_get_oversampling", 866169185_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_oversampling, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_size_cache_list : Void* = Pointer(Void).null
    def font_get_size_cache_list(font_rid : Int64) : Godot::Array
      if @@mb_font_get_size_cache_list.null?
        @@mb_font_get_size_cache_list = Bridge.get_method_bind("TextServer", "font_get_size_cache_list", 2684255073_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_size_cache_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_font_clear_size_cache : Void* = Pointer(Void).null
    def font_clear_size_cache(font_rid : Int64) : Void
      if @@mb_font_clear_size_cache.null?
        @@mb_font_clear_size_cache = Bridge.get_method_bind("TextServer", "font_clear_size_cache", 2722037293_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_font_clear_size_cache, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_remove_size_cache : Void* = Pointer(Void).null
    def font_remove_size_cache(font_rid : Int64, size : Vector2i) : Void
      if @@mb_font_remove_size_cache.null?
        @@mb_font_remove_size_cache = Bridge.get_method_bind("TextServer", "font_remove_size_cache", 2450610377_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_remove_size_cache, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_size_cache_info : Void* = Pointer(Void).null
    def font_get_size_cache_info(font_rid : Int64) : Godot::Array
      if @@mb_font_get_size_cache_info.null?
        @@mb_font_get_size_cache_info = Bridge.get_method_bind("TextServer", "font_get_size_cache_info", 2684255073_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_size_cache_info, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_font_set_ascent : Void* = Pointer(Void).null
    def font_set_ascent(font_rid : Int64, size : Int64, ascent : Float64) : Void
      if @@mb_font_set_ascent.null?
        @@mb_font_set_ascent = Bridge.get_method_bind("TextServer", "font_set_ascent", 1892459533_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = ascent
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_ascent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_ascent : Void* = Pointer(Void).null
    def font_get_ascent(font_rid : Int64, size : Int64) : Float64
      if @@mb_font_get_ascent.null?
        @@mb_font_get_ascent = Bridge.get_method_bind("TextServer", "font_get_ascent", 755457166_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_ascent, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_descent : Void* = Pointer(Void).null
    def font_set_descent(font_rid : Int64, size : Int64, descent : Float64) : Void
      if @@mb_font_set_descent.null?
        @@mb_font_set_descent = Bridge.get_method_bind("TextServer", "font_set_descent", 1892459533_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = descent
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_descent, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_descent : Void* = Pointer(Void).null
    def font_get_descent(font_rid : Int64, size : Int64) : Float64
      if @@mb_font_get_descent.null?
        @@mb_font_get_descent = Bridge.get_method_bind("TextServer", "font_get_descent", 755457166_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_descent, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_underline_position : Void* = Pointer(Void).null
    def font_set_underline_position(font_rid : Int64, size : Int64, underline_position : Float64) : Void
      if @@mb_font_set_underline_position.null?
        @@mb_font_set_underline_position = Bridge.get_method_bind("TextServer", "font_set_underline_position", 1892459533_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = underline_position
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_underline_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_underline_position : Void* = Pointer(Void).null
    def font_get_underline_position(font_rid : Int64, size : Int64) : Float64
      if @@mb_font_get_underline_position.null?
        @@mb_font_get_underline_position = Bridge.get_method_bind("TextServer", "font_get_underline_position", 755457166_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_underline_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_underline_thickness : Void* = Pointer(Void).null
    def font_set_underline_thickness(font_rid : Int64, size : Int64, underline_thickness : Float64) : Void
      if @@mb_font_set_underline_thickness.null?
        @@mb_font_set_underline_thickness = Bridge.get_method_bind("TextServer", "font_set_underline_thickness", 1892459533_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = underline_thickness
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_underline_thickness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_underline_thickness : Void* = Pointer(Void).null
    def font_get_underline_thickness(font_rid : Int64, size : Int64) : Float64
      if @@mb_font_get_underline_thickness.null?
        @@mb_font_get_underline_thickness = Bridge.get_method_bind("TextServer", "font_get_underline_thickness", 755457166_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_underline_thickness, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_scale : Void* = Pointer(Void).null
    def font_set_scale(font_rid : Int64, size : Int64, scale : Float64) : Void
      if @@mb_font_set_scale.null?
        @@mb_font_set_scale = Bridge.get_method_bind("TextServer", "font_set_scale", 1892459533_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = scale
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_scale : Void* = Pointer(Void).null
    def font_get_scale(font_rid : Int64, size : Int64) : Float64
      if @@mb_font_get_scale.null?
        @@mb_font_get_scale = Bridge.get_method_bind("TextServer", "font_get_scale", 755457166_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_scale, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_texture_count : Void* = Pointer(Void).null
    def font_get_texture_count(font_rid : Int64, size : Vector2i) : Int64
      if @@mb_font_get_texture_count.null?
        @@mb_font_get_texture_count = Bridge.get_method_bind("TextServer", "font_get_texture_count", 1311001310_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_texture_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_clear_textures : Void* = Pointer(Void).null
    def font_clear_textures(font_rid : Int64, size : Vector2i) : Void
      if @@mb_font_clear_textures.null?
        @@mb_font_clear_textures = Bridge.get_method_bind("TextServer", "font_clear_textures", 2450610377_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_clear_textures, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_remove_texture : Void* = Pointer(Void).null
    def font_remove_texture(font_rid : Int64, size : Vector2i, texture_index : Int64) : Void
      if @@mb_font_remove_texture.null?
        @@mb_font_remove_texture = Bridge.get_method_bind("TextServer", "font_remove_texture", 3810512262_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_remove_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_set_texture_image : Void* = Pointer(Void).null
    def font_set_texture_image(font_rid : Int64, size : Vector2i, texture_index : Int64, image : Image) : Void
      if @@mb_font_set_texture_image.null?
        @@mb_font_set_texture_image = Bridge.get_method_bind("TextServer", "font_set_texture_image", 2354485091_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture_index
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = image
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_texture_image, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_texture_image : Void* = Pointer(Void).null
    def font_get_texture_image(font_rid : Int64, size : Vector2i, texture_index : Int64) : Image
      if @@mb_font_get_texture_image.null?
        @@mb_font_get_texture_image = Bridge.get_method_bind("TextServer", "font_get_texture_image", 2451761155_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_texture_image, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_font_set_texture_offsets : Void* = Pointer(Void).null
    def font_set_texture_offsets(font_rid : Int64, size : Vector2i, texture_index : Int64, offset : Void*) : Void
      if @@mb_font_set_texture_offsets.null?
        @@mb_font_set_texture_offsets = Bridge.get_method_bind("TextServer", "font_set_texture_offsets", 3005398047_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture_index
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = offset
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_texture_offsets, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_texture_offsets : Void* = Pointer(Void).null
    def font_get_texture_offsets(font_rid : Int64, size : Vector2i, texture_index : Int64) : Void*
      if @@mb_font_get_texture_offsets.null?
        @@mb_font_get_texture_offsets = Bridge.get_method_bind("TextServer", "font_get_texture_offsets", 3420028887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = texture_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_texture_offsets, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_get_glyph_list : Void* = Pointer(Void).null
    def font_get_glyph_list(font_rid : Int64, size : Vector2i) : Void*
      if @@mb_font_get_glyph_list.null?
        @@mb_font_get_glyph_list = Bridge.get_method_bind("TextServer", "font_get_glyph_list", 46086620_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_glyph_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_clear_glyphs : Void* = Pointer(Void).null
    def font_clear_glyphs(font_rid : Int64, size : Vector2i) : Void
      if @@mb_font_clear_glyphs.null?
        @@mb_font_clear_glyphs = Bridge.get_method_bind("TextServer", "font_clear_glyphs", 2450610377_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_clear_glyphs, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_remove_glyph : Void* = Pointer(Void).null
    def font_remove_glyph(font_rid : Int64, size : Vector2i, glyph : Int64) : Void
      if @@mb_font_remove_glyph.null?
        @@mb_font_remove_glyph = Bridge.get_method_bind("TextServer", "font_remove_glyph", 3810512262_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_remove_glyph, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_glyph_advance : Void* = Pointer(Void).null
    def font_get_glyph_advance(font_rid : Int64, size : Int64, glyph : Int64) : Vector2
      if @@mb_font_get_glyph_advance.null?
        @@mb_font_get_glyph_advance = Bridge.get_method_bind("TextServer", "font_get_glyph_advance", 2555689501_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_font_get_glyph_advance, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_glyph_advance : Void* = Pointer(Void).null
    def font_set_glyph_advance(font_rid : Int64, size : Int64, glyph : Int64, advance : Vector2) : Void
      if @@mb_font_set_glyph_advance.null?
        @@mb_font_set_glyph_advance = Bridge.get_method_bind("TextServer", "font_set_glyph_advance", 3219397315_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = advance
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_glyph_advance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_glyph_offset : Void* = Pointer(Void).null
    def font_get_glyph_offset(font_rid : Int64, size : Vector2i, glyph : Int64) : Vector2
      if @@mb_font_get_glyph_offset.null?
        @@mb_font_get_glyph_offset = Bridge.get_method_bind("TextServer", "font_get_glyph_offset", 513728628_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_font_get_glyph_offset, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_glyph_offset : Void* = Pointer(Void).null
    def font_set_glyph_offset(font_rid : Int64, size : Vector2i, glyph : Int64, offset : Vector2) : Void
      if @@mb_font_set_glyph_offset.null?
        @@mb_font_set_glyph_offset = Bridge.get_method_bind("TextServer", "font_set_glyph_offset", 1812632090_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = offset
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_glyph_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_glyph_size : Void* = Pointer(Void).null
    def font_get_glyph_size(font_rid : Int64, size : Vector2i, glyph : Int64) : Vector2
      if @@mb_font_get_glyph_size.null?
        @@mb_font_get_glyph_size = Bridge.get_method_bind("TextServer", "font_get_glyph_size", 513728628_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_font_get_glyph_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_glyph_size : Void* = Pointer(Void).null
    def font_set_glyph_size(font_rid : Int64, size : Vector2i, glyph : Int64, gl_size : Vector2) : Void
      if @@mb_font_set_glyph_size.null?
        @@mb_font_set_glyph_size = Bridge.get_method_bind("TextServer", "font_set_glyph_size", 1812632090_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = gl_size
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_glyph_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_glyph_uv_rect : Void* = Pointer(Void).null
    def font_get_glyph_uv_rect(font_rid : Int64, size : Vector2i, glyph : Int64) : Rect2
      if @@mb_font_get_glyph_uv_rect.null?
        @@mb_font_get_glyph_uv_rect = Bridge.get_method_bind("TextServer", "font_get_glyph_uv_rect", 2274268786_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_glyph_uv_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_font_set_glyph_uv_rect : Void* = Pointer(Void).null
    def font_set_glyph_uv_rect(font_rid : Int64, size : Vector2i, glyph : Int64, uv_rect : Rect2) : Void
      if @@mb_font_set_glyph_uv_rect.null?
        @@mb_font_set_glyph_uv_rect = Bridge.get_method_bind("TextServer", "font_set_glyph_uv_rect", 1973324081_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = uv_rect
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_glyph_uv_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_glyph_texture_idx : Void* = Pointer(Void).null
    def font_get_glyph_texture_idx(font_rid : Int64, size : Vector2i, glyph : Int64) : Int64
      if @@mb_font_get_glyph_texture_idx.null?
        @@mb_font_get_glyph_texture_idx = Bridge.get_method_bind("TextServer", "font_get_glyph_texture_idx", 4292800474_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_glyph_texture_idx, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_glyph_texture_idx : Void* = Pointer(Void).null
    def font_set_glyph_texture_idx(font_rid : Int64, size : Vector2i, glyph : Int64, texture_idx : Int64) : Void
      if @@mb_font_set_glyph_texture_idx.null?
        @@mb_font_set_glyph_texture_idx = Bridge.get_method_bind("TextServer", "font_set_glyph_texture_idx", 4254580980_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = texture_idx
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_glyph_texture_idx, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_glyph_texture_rid : Void* = Pointer(Void).null
    def font_get_glyph_texture_rid(font_rid : Int64, size : Vector2i, glyph : Int64) : Int64
      if @@mb_font_get_glyph_texture_rid.null?
        @@mb_font_get_glyph_texture_rid = Bridge.get_method_bind("TextServer", "font_get_glyph_texture_rid", 1451696141_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_glyph_texture_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_glyph_texture_size : Void* = Pointer(Void).null
    def font_get_glyph_texture_size(font_rid : Int64, size : Vector2i, glyph : Int64) : Vector2
      if @@mb_font_get_glyph_texture_size.null?
        @@mb_font_get_glyph_texture_size = Bridge.get_method_bind("TextServer", "font_get_glyph_texture_size", 513728628_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_font_get_glyph_texture_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_glyph_contours : Void* = Pointer(Void).null
    def font_get_glyph_contours(font : Int64, size : Int64, index : Int64) : Void*
      if @@mb_font_get_glyph_contours.null?
        @@mb_font_get_glyph_contours = Bridge.get_method_bind("TextServer", "font_get_glyph_contours", 2903964473_i64)
      end
      val_0 = font
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_glyph_contours, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_get_kerning_list : Void* = Pointer(Void).null
    def font_get_kerning_list(font_rid : Int64, size : Int64) : Godot::Array
      if @@mb_font_get_kerning_list.null?
        @@mb_font_get_kerning_list = Bridge.get_method_bind("TextServer", "font_get_kerning_list", 1778388067_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_kerning_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_font_clear_kerning_map : Void* = Pointer(Void).null
    def font_clear_kerning_map(font_rid : Int64, size : Int64) : Void
      if @@mb_font_clear_kerning_map.null?
        @@mb_font_clear_kerning_map = Bridge.get_method_bind("TextServer", "font_clear_kerning_map", 3411492887_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_clear_kerning_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_remove_kerning : Void* = Pointer(Void).null
    def font_remove_kerning(font_rid : Int64, size : Int64, glyph_pair : Vector2i) : Void
      if @@mb_font_remove_kerning.null?
        @@mb_font_remove_kerning = Bridge.get_method_bind("TextServer", "font_remove_kerning", 2141860016_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph_pair
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_remove_kerning, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_set_kerning : Void* = Pointer(Void).null
    def font_set_kerning(font_rid : Int64, size : Int64, glyph_pair : Vector2i, kerning : Vector2) : Void
      if @@mb_font_set_kerning.null?
        @@mb_font_set_kerning = Bridge.get_method_bind("TextServer", "font_set_kerning", 3630965883_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph_pair
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = kerning
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_set_kerning, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_kerning : Void* = Pointer(Void).null
    def font_get_kerning(font_rid : Int64, size : Int64, glyph_pair : Vector2i) : Vector2
      if @@mb_font_get_kerning.null?
        @@mb_font_get_kerning = Bridge.get_method_bind("TextServer", "font_get_kerning", 1019980169_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph_pair
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_font_get_kerning, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_glyph_index : Void* = Pointer(Void).null
    def font_get_glyph_index(font_rid : Int64, size : Int64, char : Int64, variation_selector : Int64) : Int64
      if @@mb_font_get_glyph_index.null?
        @@mb_font_get_glyph_index = Bridge.get_method_bind("TextServer", "font_get_glyph_index", 1765635060_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = char
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = variation_selector
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_glyph_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_get_char_from_glyph_index : Void* = Pointer(Void).null
    def font_get_char_from_glyph_index(font_rid : Int64, size : Int64, glyph_index : Int64) : Int64
      if @@mb_font_get_char_from_glyph_index.null?
        @@mb_font_get_char_from_glyph_index = Bridge.get_method_bind("TextServer", "font_get_char_from_glyph_index", 2156738276_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = glyph_index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_font_get_char_from_glyph_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_has_char : Void* = Pointer(Void).null
    def font_has_char(font_rid : Int64, char : Int64) : Bool
      if @@mb_font_has_char.null?
        @@mb_font_has_char = Bridge.get_method_bind("TextServer", "font_has_char", 3120086654_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = char
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_has_char, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_get_supported_chars : Void* = Pointer(Void).null
    def font_get_supported_chars(font_rid : Int64) : String
      if @@mb_font_get_supported_chars.null?
        @@mb_font_get_supported_chars = Bridge.get_method_bind("TextServer", "font_get_supported_chars", 642473191_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_font_get_supported_glyphs : Void* = Pointer(Void).null
    def font_get_supported_glyphs(font_rid : Int64) : Void*
      if @@mb_font_get_supported_glyphs.null?
        @@mb_font_get_supported_glyphs = Bridge.get_method_bind("TextServer", "font_get_supported_glyphs", 788230395_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_supported_glyphs, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_render_range : Void* = Pointer(Void).null
    def font_render_range(font_rid : Int64, size : Vector2i, start : Int64, end_val : Int64) : Void
      if @@mb_font_render_range.null?
        @@mb_font_render_range = Bridge.get_method_bind("TextServer", "font_render_range", 4254580980_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = start
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = end_val
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_font_render_range, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_render_glyph : Void* = Pointer(Void).null
    def font_render_glyph(font_rid : Int64, size : Vector2i, index : Int64) : Void
      if @@mb_font_render_glyph.null?
        @@mb_font_render_glyph = Bridge.get_method_bind("TextServer", "font_render_glyph", 3810512262_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = index
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_render_glyph, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_draw_glyph : Void* = Pointer(Void).null
    def font_draw_glyph(font_rid : Int64, canvas : Int64, size : Int64, pos : Vector2, index : Int64, color : Color, oversampling : Float64) : Void
      if @@mb_font_draw_glyph.null?
        @@mb_font_draw_glyph = Bridge.get_method_bind("TextServer", "font_draw_glyph", 3103234926_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = size
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = pos
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = index
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = color
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = oversampling
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      Bridge.ptrcall(@@mb_font_draw_glyph, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_draw_glyph_outline : Void* = Pointer(Void).null
    def font_draw_glyph_outline(font_rid : Int64, canvas : Int64, size : Int64, outline_size : Int64, pos : Vector2, index : Int64, color : Color, oversampling : Float64) : Void
      if @@mb_font_draw_glyph_outline.null?
        @@mb_font_draw_glyph_outline = Bridge.get_method_bind("TextServer", "font_draw_glyph_outline", 1976041553_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = size
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = outline_size
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = pos
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = index
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = color
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = oversampling
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      Bridge.ptrcall(@@mb_font_draw_glyph_outline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_is_language_supported : Void* = Pointer(Void).null
    def font_is_language_supported(font_rid : Int64, language : String) : Bool
      if @@mb_font_is_language_supported.null?
        @@mb_font_is_language_supported = Bridge.get_method_bind("TextServer", "font_is_language_supported", 3199320846_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_is_language_supported, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_set_language_support_override : Void* = Pointer(Void).null
    def font_set_language_support_override(font_rid : Int64, language : String, supported : Bool) : Void
      if @@mb_font_set_language_support_override.null?
        @@mb_font_set_language_support_override = Bridge.get_method_bind("TextServer", "font_set_language_support_override", 2313957094_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = supported
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_language_support_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_language_support_override : Void* = Pointer(Void).null
    def font_get_language_support_override(font_rid : Int64, language : String) : Bool
      if @@mb_font_get_language_support_override.null?
        @@mb_font_get_language_support_override = Bridge.get_method_bind("TextServer", "font_get_language_support_override", 2829184646_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_get_language_support_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_remove_language_support_override : Void* = Pointer(Void).null
    def font_remove_language_support_override(font_rid : Int64, language : String) : Void
      if @@mb_font_remove_language_support_override.null?
        @@mb_font_remove_language_support_override = Bridge.get_method_bind("TextServer", "font_remove_language_support_override", 2726140452_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_remove_language_support_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_language_support_overrides : Void* = Pointer(Void).null
    def font_get_language_support_overrides(font_rid : Int64) : Void*
      if @@mb_font_get_language_support_overrides.null?
        @@mb_font_get_language_support_overrides = Bridge.get_method_bind("TextServer", "font_get_language_support_overrides", 2801473409_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_language_support_overrides, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_is_script_supported : Void* = Pointer(Void).null
    def font_is_script_supported(font_rid : Int64, script : String) : Bool
      if @@mb_font_is_script_supported.null?
        @@mb_font_is_script_supported = Bridge.get_method_bind("TextServer", "font_is_script_supported", 3199320846_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = script
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_is_script_supported, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_set_script_support_override : Void* = Pointer(Void).null
    def font_set_script_support_override(font_rid : Int64, script : String, supported : Bool) : Void
      if @@mb_font_set_script_support_override.null?
        @@mb_font_set_script_support_override = Bridge.get_method_bind("TextServer", "font_set_script_support_override", 2313957094_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = script
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = supported
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_font_set_script_support_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_script_support_override : Void* = Pointer(Void).null
    def font_get_script_support_override(font_rid : Int64, script : String) : Bool
      if @@mb_font_get_script_support_override.null?
        @@mb_font_get_script_support_override = Bridge.get_method_bind("TextServer", "font_get_script_support_override", 2829184646_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = script
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_font_get_script_support_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_font_remove_script_support_override : Void* = Pointer(Void).null
    def font_remove_script_support_override(font_rid : Int64, script : String) : Void
      if @@mb_font_remove_script_support_override.null?
        @@mb_font_remove_script_support_override = Bridge.get_method_bind("TextServer", "font_remove_script_support_override", 2726140452_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = script
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_remove_script_support_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_script_support_overrides : Void* = Pointer(Void).null
    def font_get_script_support_overrides(font_rid : Int64) : Void*
      if @@mb_font_get_script_support_overrides.null?
        @@mb_font_get_script_support_overrides = Bridge.get_method_bind("TextServer", "font_get_script_support_overrides", 2801473409_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_script_support_overrides, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_set_opentype_feature_overrides : Void* = Pointer(Void).null
    def font_set_opentype_feature_overrides(font_rid : Int64, overrides : Void*) : Void
      if @@mb_font_set_opentype_feature_overrides.null?
        @@mb_font_set_opentype_feature_overrides = Bridge.get_method_bind("TextServer", "font_set_opentype_feature_overrides", 1217542888_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = overrides
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_font_set_opentype_feature_overrides, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_font_get_opentype_feature_overrides : Void* = Pointer(Void).null
    def font_get_opentype_feature_overrides(font_rid : Int64) : Void*
      if @@mb_font_get_opentype_feature_overrides.null?
        @@mb_font_get_opentype_feature_overrides = Bridge.get_method_bind("TextServer", "font_get_opentype_feature_overrides", 1882737106_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_get_opentype_feature_overrides, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_supported_feature_list : Void* = Pointer(Void).null
    def font_supported_feature_list(font_rid : Int64) : Void*
      if @@mb_font_supported_feature_list.null?
        @@mb_font_supported_feature_list = Bridge.get_method_bind("TextServer", "font_supported_feature_list", 1882737106_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_supported_feature_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_supported_variation_list : Void* = Pointer(Void).null
    def font_supported_variation_list(font_rid : Int64) : Void*
      if @@mb_font_supported_variation_list.null?
        @@mb_font_supported_variation_list = Bridge.get_method_bind("TextServer", "font_supported_variation_list", 1882737106_i64)
      end
      val_0 = font_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_font_supported_variation_list, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_font_get_global_oversampling : Void* = Pointer(Void).null
    def font_get_global_oversampling() : Float64
      if @@mb_font_get_global_oversampling.null?
        @@mb_font_get_global_oversampling = Bridge.get_method_bind("TextServer", "font_get_global_oversampling", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_font_get_global_oversampling, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_font_set_global_oversampling : Void* = Pointer(Void).null
    def font_set_global_oversampling(oversampling : Float64) : Void
      if @@mb_font_set_global_oversampling.null?
        @@mb_font_set_global_oversampling = Bridge.get_method_bind("TextServer", "font_set_global_oversampling", 373806689_i64)
      end
      val_0 = oversampling
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_font_set_global_oversampling, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hex_code_box_size : Void* = Pointer(Void).null
    def get_hex_code_box_size(size : Int64, index : Int64) : Vector2
      if @@mb_get_hex_code_box_size.null?
        @@mb_get_hex_code_box_size = Bridge.get_method_bind("TextServer", "get_hex_code_box_size", 3016396712_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_hex_code_box_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_draw_hex_code_box : Void* = Pointer(Void).null
    def draw_hex_code_box(canvas : Int64, size : Int64, pos : Vector2, index : Int64, color : Color) : Void
      if @@mb_draw_hex_code_box.null?
        @@mb_draw_hex_code_box = Bridge.get_method_bind("TextServer", "draw_hex_code_box", 1602046441_i64)
      end
      val_0 = canvas
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = size
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = pos
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = index
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = color
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_draw_hex_code_box, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_create_shaped_text : Void* = Pointer(Void).null
    def create_shaped_text(direction : Int64, orientation : Int64) : Int64
      if @@mb_create_shaped_text.null?
        @@mb_create_shaped_text = Bridge.get_method_bind("TextServer", "create_shaped_text", 1231398698_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = orientation
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_shaped_text, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_clear : Void* = Pointer(Void).null
    def shaped_text_clear(rid : Int64) : Void
      if @@mb_shaped_text_clear.null?
        @@mb_shaped_text_clear = Bridge.get_method_bind("TextServer", "shaped_text_clear", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_shaped_text_clear, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_duplicate : Void* = Pointer(Void).null
    def shaped_text_duplicate(rid : Int64) : Int64
      if @@mb_shaped_text_duplicate.null?
        @@mb_shaped_text_duplicate = Bridge.get_method_bind("TextServer", "shaped_text_duplicate", 41030802_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_duplicate, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_set_direction : Void* = Pointer(Void).null
    def shaped_text_set_direction(shaped : Int64, direction : Int64) : Void
      if @@mb_shaped_text_set_direction.null?
        @@mb_shaped_text_set_direction = Bridge.get_method_bind("TextServer", "shaped_text_set_direction", 1551430183_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = direction
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shaped_text_set_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_direction : Void* = Pointer(Void).null
    def shaped_text_get_direction(shaped : Int64) : Int64
      if @@mb_shaped_text_get_direction.null?
        @@mb_shaped_text_get_direction = Bridge.get_method_bind("TextServer", "shaped_text_get_direction", 3065904362_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_direction, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_inferred_direction : Void* = Pointer(Void).null
    def shaped_text_get_inferred_direction(shaped : Int64) : Int64
      if @@mb_shaped_text_get_inferred_direction.null?
        @@mb_shaped_text_get_inferred_direction = Bridge.get_method_bind("TextServer", "shaped_text_get_inferred_direction", 3065904362_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_inferred_direction, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_set_bidi_override : Void* = Pointer(Void).null
    def shaped_text_set_bidi_override(shaped : Int64, override : Godot::Array) : Void
      if @@mb_shaped_text_set_bidi_override.null?
        @@mb_shaped_text_set_bidi_override = Bridge.get_method_bind("TextServer", "shaped_text_set_bidi_override", 684822712_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = override ? override.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shaped_text_set_bidi_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_set_custom_punctuation : Void* = Pointer(Void).null
    def shaped_text_set_custom_punctuation(shaped : Int64, punct : String) : Void
      if @@mb_shaped_text_set_custom_punctuation.null?
        @@mb_shaped_text_set_custom_punctuation = Bridge.get_method_bind("TextServer", "shaped_text_set_custom_punctuation", 2726140452_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = punct
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shaped_text_set_custom_punctuation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_custom_punctuation : Void* = Pointer(Void).null
    def shaped_text_get_custom_punctuation(shaped : Int64) : String
      if @@mb_shaped_text_get_custom_punctuation.null?
        @@mb_shaped_text_get_custom_punctuation = Bridge.get_method_bind("TextServer", "shaped_text_get_custom_punctuation", 642473191_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_shaped_text_set_custom_ellipsis : Void* = Pointer(Void).null
    def shaped_text_set_custom_ellipsis(shaped : Int64, char : Int64) : Void
      if @@mb_shaped_text_set_custom_ellipsis.null?
        @@mb_shaped_text_set_custom_ellipsis = Bridge.get_method_bind("TextServer", "shaped_text_set_custom_ellipsis", 3411492887_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = char
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shaped_text_set_custom_ellipsis, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_custom_ellipsis : Void* = Pointer(Void).null
    def shaped_text_get_custom_ellipsis(shaped : Int64) : Int64
      if @@mb_shaped_text_get_custom_ellipsis.null?
        @@mb_shaped_text_get_custom_ellipsis = Bridge.get_method_bind("TextServer", "shaped_text_get_custom_ellipsis", 2198884583_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_custom_ellipsis, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_set_orientation : Void* = Pointer(Void).null
    def shaped_text_set_orientation(shaped : Int64, orientation : Int64) : Void
      if @@mb_shaped_text_set_orientation.null?
        @@mb_shaped_text_set_orientation = Bridge.get_method_bind("TextServer", "shaped_text_set_orientation", 3019609126_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = orientation
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shaped_text_set_orientation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_orientation : Void* = Pointer(Void).null
    def shaped_text_get_orientation(shaped : Int64) : Int64
      if @@mb_shaped_text_get_orientation.null?
        @@mb_shaped_text_get_orientation = Bridge.get_method_bind("TextServer", "shaped_text_get_orientation", 3142708106_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_orientation, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_set_preserve_invalid : Void* = Pointer(Void).null
    def shaped_text_set_preserve_invalid(shaped : Int64, enabled : Bool) : Void
      if @@mb_shaped_text_set_preserve_invalid.null?
        @@mb_shaped_text_set_preserve_invalid = Bridge.get_method_bind("TextServer", "shaped_text_set_preserve_invalid", 1265174801_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shaped_text_set_preserve_invalid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_preserve_invalid : Void* = Pointer(Void).null
    def shaped_text_get_preserve_invalid(shaped : Int64) : Bool
      if @@mb_shaped_text_get_preserve_invalid.null?
        @@mb_shaped_text_get_preserve_invalid = Bridge.get_method_bind("TextServer", "shaped_text_get_preserve_invalid", 4155700596_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_get_preserve_invalid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_set_preserve_control : Void* = Pointer(Void).null
    def shaped_text_set_preserve_control(shaped : Int64, enabled : Bool) : Void
      if @@mb_shaped_text_set_preserve_control.null?
        @@mb_shaped_text_set_preserve_control = Bridge.get_method_bind("TextServer", "shaped_text_set_preserve_control", 1265174801_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shaped_text_set_preserve_control, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_preserve_control : Void* = Pointer(Void).null
    def shaped_text_get_preserve_control(shaped : Int64) : Bool
      if @@mb_shaped_text_get_preserve_control.null?
        @@mb_shaped_text_get_preserve_control = Bridge.get_method_bind("TextServer", "shaped_text_get_preserve_control", 4155700596_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_get_preserve_control, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_set_spacing : Void* = Pointer(Void).null
    def shaped_text_set_spacing(shaped : Int64, spacing : Int64, value : Int64) : Void
      if @@mb_shaped_text_set_spacing.null?
        @@mb_shaped_text_set_spacing = Bridge.get_method_bind("TextServer", "shaped_text_set_spacing", 1307259930_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = spacing
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_shaped_text_set_spacing, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_spacing : Void* = Pointer(Void).null
    def shaped_text_get_spacing(shaped : Int64, spacing : Int64) : Int64
      if @@mb_shaped_text_get_spacing.null?
        @@mb_shaped_text_get_spacing = Bridge.get_method_bind("TextServer", "shaped_text_get_spacing", 1213653558_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = spacing
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_spacing, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_add_string : Void* = Pointer(Void).null
    def shaped_text_add_string(shaped : Int64, text : String, fonts : Godot::Array, size : Int64, opentype_features : Void*, language : String, meta : Void*) : Bool
      if @@mb_shaped_text_add_string.null?
        @@mb_shaped_text_add_string = Bridge.get_method_bind("TextServer", "shaped_text_add_string", 623473029_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = text
      arg_1 = pointerof(val_1).as(Void*)
      arg_ptr_2 = fonts ? fonts.pointer : Pointer(Void).null
      arg_2 = pointerof(arg_ptr_2).as(Void*)
      val_3 = size
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = opentype_features
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = language
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = meta
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_add_string, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_add_object : Void* = Pointer(Void).null
    def shaped_text_add_object(shaped : Int64, key : Void*, size : Vector2, inline_align : Int64, length : Int64, baseline : Float64) : Bool
      if @@mb_shaped_text_add_object.null?
        @@mb_shaped_text_add_object = Bridge.get_method_bind("TextServer", "shaped_text_add_object", 3664424789_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = key
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = size
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = inline_align
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = length
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = baseline
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_add_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_resize_object : Void* = Pointer(Void).null
    def shaped_text_resize_object(shaped : Int64, key : Void*, size : Vector2, inline_align : Int64, baseline : Float64) : Bool
      if @@mb_shaped_text_resize_object.null?
        @@mb_shaped_text_resize_object = Bridge.get_method_bind("TextServer", "shaped_text_resize_object", 790361552_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = key
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = size
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = inline_align
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = baseline
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_resize_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_has_object : Void* = Pointer(Void).null
    def shaped_text_has_object(shaped : Int64, key : Void*) : Bool
      if @@mb_shaped_text_has_object.null?
        @@mb_shaped_text_has_object = Bridge.get_method_bind("TextServer", "shaped_text_has_object", 2360964694_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = key
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_has_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_get_text : Void* = Pointer(Void).null
    def shaped_get_text(shaped : Int64) : String
      if @@mb_shaped_get_text.null?
        @@mb_shaped_get_text = Bridge.get_method_bind("TextServer", "shaped_get_text", 642473191_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_shaped_get_span_count : Void* = Pointer(Void).null
    def shaped_get_span_count(shaped : Int64) : Int64
      if @@mb_shaped_get_span_count.null?
        @@mb_shaped_get_span_count = Bridge.get_method_bind("TextServer", "shaped_get_span_count", 2198884583_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_get_span_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_get_span_meta : Void* = Pointer(Void).null
    def shaped_get_span_meta(shaped : Int64, index : Int64) : Void*
      if @@mb_shaped_get_span_meta.null?
        @@mb_shaped_get_span_meta = Bridge.get_method_bind("TextServer", "shaped_get_span_meta", 4069510997_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_get_span_meta, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_get_span_embedded_object : Void* = Pointer(Void).null
    def shaped_get_span_embedded_object(shaped : Int64, index : Int64) : Void*
      if @@mb_shaped_get_span_embedded_object.null?
        @@mb_shaped_get_span_embedded_object = Bridge.get_method_bind("TextServer", "shaped_get_span_embedded_object", 4069510997_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_get_span_embedded_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_get_span_text : Void* = Pointer(Void).null
    def shaped_get_span_text(shaped : Int64, index : Int64) : String
      if @@mb_shaped_get_span_text.null?
        @@mb_shaped_get_span_text = Bridge.get_method_bind("TextServer", "shaped_get_span_text", 1464764419_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_shaped_get_span_object : Void* = Pointer(Void).null
    def shaped_get_span_object(shaped : Int64, index : Int64) : Void*
      if @@mb_shaped_get_span_object.null?
        @@mb_shaped_get_span_object = Bridge.get_method_bind("TextServer", "shaped_get_span_object", 4069510997_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_get_span_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_set_span_update_font : Void* = Pointer(Void).null
    def shaped_set_span_update_font(shaped : Int64, index : Int64, fonts : Godot::Array, size : Int64, opentype_features : Void*) : Void
      if @@mb_shaped_set_span_update_font.null?
        @@mb_shaped_set_span_update_font = Bridge.get_method_bind("TextServer", "shaped_set_span_update_font", 2022725822_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      arg_ptr_2 = fonts ? fonts.pointer : Pointer(Void).null
      arg_2 = pointerof(arg_ptr_2).as(Void*)
      val_3 = size
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = opentype_features
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_shaped_set_span_update_font, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_get_run_count : Void* = Pointer(Void).null
    def shaped_get_run_count(shaped : Int64) : Int64
      if @@mb_shaped_get_run_count.null?
        @@mb_shaped_get_run_count = Bridge.get_method_bind("TextServer", "shaped_get_run_count", 2198884583_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_get_run_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_get_run_text : Void* = Pointer(Void).null
    def shaped_get_run_text(shaped : Int64, index : Int64) : String
      if @@mb_shaped_get_run_text.null?
        @@mb_shaped_get_run_text = Bridge.get_method_bind("TextServer", "shaped_get_run_text", 1464764419_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_shaped_get_run_range : Void* = Pointer(Void).null
    def shaped_get_run_range(shaped : Int64, index : Int64) : Vector2i
      if @@mb_shaped_get_run_range.null?
        @@mb_shaped_get_run_range = Bridge.get_method_bind("TextServer", "shaped_get_run_range", 4069534484_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_get_run_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_shaped_get_run_glyph_range : Void* = Pointer(Void).null
    def shaped_get_run_glyph_range(shaped : Int64, index : Int64) : Vector2i
      if @@mb_shaped_get_run_glyph_range.null?
        @@mb_shaped_get_run_glyph_range = Bridge.get_method_bind("TextServer", "shaped_get_run_glyph_range", 4069534484_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_get_run_glyph_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_shaped_get_run_font_rid : Void* = Pointer(Void).null
    def shaped_get_run_font_rid(shaped : Int64, index : Int64) : Int64
      if @@mb_shaped_get_run_font_rid.null?
        @@mb_shaped_get_run_font_rid = Bridge.get_method_bind("TextServer", "shaped_get_run_font_rid", 1066463050_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_get_run_font_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_get_run_font_size : Void* = Pointer(Void).null
    def shaped_get_run_font_size(shaped : Int64, index : Int64) : Int64
      if @@mb_shaped_get_run_font_size.null?
        @@mb_shaped_get_run_font_size = Bridge.get_method_bind("TextServer", "shaped_get_run_font_size", 1120910005_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_get_run_font_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_get_run_language : Void* = Pointer(Void).null
    def shaped_get_run_language(shaped : Int64, index : Int64) : String
      if @@mb_shaped_get_run_language.null?
        @@mb_shaped_get_run_language = Bridge.get_method_bind("TextServer", "shaped_get_run_language", 1464764419_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_shaped_get_run_direction : Void* = Pointer(Void).null
    def shaped_get_run_direction(shaped : Int64, index : Int64) : Int64
      if @@mb_shaped_get_run_direction.null?
        @@mb_shaped_get_run_direction = Bridge.get_method_bind("TextServer", "shaped_get_run_direction", 2413896864_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_get_run_direction, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_get_run_object : Void* = Pointer(Void).null
    def shaped_get_run_object(shaped : Int64, index : Int64) : Void*
      if @@mb_shaped_get_run_object.null?
        @@mb_shaped_get_run_object = Bridge.get_method_bind("TextServer", "shaped_get_run_object", 4069510997_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_get_run_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_text_substr : Void* = Pointer(Void).null
    def shaped_text_substr(shaped : Int64, start : Int64, length : Int64) : Int64
      if @@mb_shaped_text_substr.null?
        @@mb_shaped_text_substr = Bridge.get_method_bind("TextServer", "shaped_text_substr", 1937682086_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = start
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = length
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_substr, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_parent : Void* = Pointer(Void).null
    def shaped_text_get_parent(shaped : Int64) : Int64
      if @@mb_shaped_text_get_parent.null?
        @@mb_shaped_text_get_parent = Bridge.get_method_bind("TextServer", "shaped_text_get_parent", 3814569979_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_parent, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_fit_to_width : Void* = Pointer(Void).null
    def shaped_text_fit_to_width(shaped : Int64, width : Float64, justification_flags : Int64) : Float64
      if @@mb_shaped_text_fit_to_width.null?
        @@mb_shaped_text_fit_to_width = Bridge.get_method_bind("TextServer", "shaped_text_fit_to_width", 530670926_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = justification_flags
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_shaped_text_fit_to_width, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_tab_align : Void* = Pointer(Void).null
    def shaped_text_tab_align(shaped : Int64, tab_stops : Void*) : Float64
      if @@mb_shaped_text_tab_align.null?
        @@mb_shaped_text_tab_align = Bridge.get_method_bind("TextServer", "shaped_text_tab_align", 1283669550_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tab_stops
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_shaped_text_tab_align, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_shape : Void* = Pointer(Void).null
    def shaped_text_shape(shaped : Int64) : Bool
      if @@mb_shaped_text_shape.null?
        @@mb_shaped_text_shape = Bridge.get_method_bind("TextServer", "shaped_text_shape", 3521089500_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_is_ready : Void* = Pointer(Void).null
    def shaped_text_is_ready(shaped : Int64) : Bool
      if @@mb_shaped_text_is_ready.null?
        @@mb_shaped_text_is_ready = Bridge.get_method_bind("TextServer", "shaped_text_is_ready", 4155700596_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_is_ready, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_has_visible_chars : Void* = Pointer(Void).null
    def shaped_text_has_visible_chars(shaped : Int64) : Bool
      if @@mb_shaped_text_has_visible_chars.null?
        @@mb_shaped_text_has_visible_chars = Bridge.get_method_bind("TextServer", "shaped_text_has_visible_chars", 4155700596_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_shaped_text_has_visible_chars, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shaped_text_get_glyphs : Void* = Pointer(Void).null
    def shaped_text_get_glyphs(shaped : Int64) : Godot::Array
      if @@mb_shaped_text_get_glyphs.null?
        @@mb_shaped_text_get_glyphs = Bridge.get_method_bind("TextServer", "shaped_text_get_glyphs", 2684255073_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_glyphs, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_shaped_text_sort_logical : Void* = Pointer(Void).null
    def shaped_text_sort_logical(shaped : Int64) : Godot::Array
      if @@mb_shaped_text_sort_logical.null?
        @@mb_shaped_text_sort_logical = Bridge.get_method_bind("TextServer", "shaped_text_sort_logical", 2670461153_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_sort_logical, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_shaped_text_get_glyph_count : Void* = Pointer(Void).null
    def shaped_text_get_glyph_count(shaped : Int64) : Int64
      if @@mb_shaped_text_get_glyph_count.null?
        @@mb_shaped_text_get_glyph_count = Bridge.get_method_bind("TextServer", "shaped_text_get_glyph_count", 2198884583_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_glyph_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_range : Void* = Pointer(Void).null
    def shaped_text_get_range(shaped : Int64) : Vector2i
      if @@mb_shaped_text_get_range.null?
        @@mb_shaped_text_get_range = Bridge.get_method_bind("TextServer", "shaped_text_get_range", 733700038_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_shaped_text_get_line_breaks_adv : Void* = Pointer(Void).null
    def shaped_text_get_line_breaks_adv(shaped : Int64, width : Void*, start : Int64, once : Bool, break_flags : Int64) : Void*
      if @@mb_shaped_text_get_line_breaks_adv.null?
        @@mb_shaped_text_get_line_breaks_adv = Bridge.get_method_bind("TextServer", "shaped_text_get_line_breaks_adv", 2376991424_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = start
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = once
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = break_flags
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_line_breaks_adv, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_text_get_line_breaks : Void* = Pointer(Void).null
    def shaped_text_get_line_breaks(shaped : Int64, width : Float64, start : Int64, break_flags : Int64) : Void*
      if @@mb_shaped_text_get_line_breaks.null?
        @@mb_shaped_text_get_line_breaks = Bridge.get_method_bind("TextServer", "shaped_text_get_line_breaks", 2651359741_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = start
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = break_flags
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_line_breaks, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_text_get_word_breaks : Void* = Pointer(Void).null
    def shaped_text_get_word_breaks(shaped : Int64, grapheme_flags : Int64, skip_grapheme_flags : Int64) : Void*
      if @@mb_shaped_text_get_word_breaks.null?
        @@mb_shaped_text_get_word_breaks = Bridge.get_method_bind("TextServer", "shaped_text_get_word_breaks", 4099476853_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = grapheme_flags
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = skip_grapheme_flags
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_word_breaks, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_text_get_trim_pos : Void* = Pointer(Void).null
    def shaped_text_get_trim_pos(shaped : Int64) : Int64
      if @@mb_shaped_text_get_trim_pos.null?
        @@mb_shaped_text_get_trim_pos = Bridge.get_method_bind("TextServer", "shaped_text_get_trim_pos", 2198884583_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_trim_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_ellipsis_pos : Void* = Pointer(Void).null
    def shaped_text_get_ellipsis_pos(shaped : Int64) : Int64
      if @@mb_shaped_text_get_ellipsis_pos.null?
        @@mb_shaped_text_get_ellipsis_pos = Bridge.get_method_bind("TextServer", "shaped_text_get_ellipsis_pos", 2198884583_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_ellipsis_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_ellipsis_glyphs : Void* = Pointer(Void).null
    def shaped_text_get_ellipsis_glyphs(shaped : Int64) : Godot::Array
      if @@mb_shaped_text_get_ellipsis_glyphs.null?
        @@mb_shaped_text_get_ellipsis_glyphs = Bridge.get_method_bind("TextServer", "shaped_text_get_ellipsis_glyphs", 2684255073_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_ellipsis_glyphs, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_shaped_text_get_ellipsis_glyph_count : Void* = Pointer(Void).null
    def shaped_text_get_ellipsis_glyph_count(shaped : Int64) : Int64
      if @@mb_shaped_text_get_ellipsis_glyph_count.null?
        @@mb_shaped_text_get_ellipsis_glyph_count = Bridge.get_method_bind("TextServer", "shaped_text_get_ellipsis_glyph_count", 2198884583_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_ellipsis_glyph_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_overrun_trim_to_width : Void* = Pointer(Void).null
    def shaped_text_overrun_trim_to_width(shaped : Int64, width : Float64, overrun_trim_flags : Int64) : Void
      if @@mb_shaped_text_overrun_trim_to_width.null?
        @@mb_shaped_text_overrun_trim_to_width = Bridge.get_method_bind("TextServer", "shaped_text_overrun_trim_to_width", 2723146520_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = width
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = overrun_trim_flags
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_shaped_text_overrun_trim_to_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_objects : Void* = Pointer(Void).null
    def shaped_text_get_objects(shaped : Int64) : Godot::Array
      if @@mb_shaped_text_get_objects.null?
        @@mb_shaped_text_get_objects = Bridge.get_method_bind("TextServer", "shaped_text_get_objects", 2684255073_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_objects, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_shaped_text_get_object_rect : Void* = Pointer(Void).null
    def shaped_text_get_object_rect(shaped : Int64, key : Void*) : Rect2
      if @@mb_shaped_text_get_object_rect.null?
        @@mb_shaped_text_get_object_rect = Bridge.get_method_bind("TextServer", "shaped_text_get_object_rect", 447978354_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = key
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_object_rect, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_shaped_text_get_object_range : Void* = Pointer(Void).null
    def shaped_text_get_object_range(shaped : Int64, key : Void*) : Vector2i
      if @@mb_shaped_text_get_object_range.null?
        @@mb_shaped_text_get_object_range = Bridge.get_method_bind("TextServer", "shaped_text_get_object_range", 2524675647_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = key
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_object_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_shaped_text_get_object_glyph : Void* = Pointer(Void).null
    def shaped_text_get_object_glyph(shaped : Int64, key : Void*) : Int64
      if @@mb_shaped_text_get_object_glyph.null?
        @@mb_shaped_text_get_object_glyph = Bridge.get_method_bind("TextServer", "shaped_text_get_object_glyph", 1260085030_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = key
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_object_glyph, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_size : Void* = Pointer(Void).null
    def shaped_text_get_size(shaped : Int64) : Vector2
      if @@mb_shaped_text_get_size.null?
        @@mb_shaped_text_get_size = Bridge.get_method_bind("TextServer", "shaped_text_get_size", 2440833711_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_shaped_text_get_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_ascent : Void* = Pointer(Void).null
    def shaped_text_get_ascent(shaped : Int64) : Float64
      if @@mb_shaped_text_get_ascent.null?
        @@mb_shaped_text_get_ascent = Bridge.get_method_bind("TextServer", "shaped_text_get_ascent", 866169185_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_shaped_text_get_ascent, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_descent : Void* = Pointer(Void).null
    def shaped_text_get_descent(shaped : Int64) : Float64
      if @@mb_shaped_text_get_descent.null?
        @@mb_shaped_text_get_descent = Bridge.get_method_bind("TextServer", "shaped_text_get_descent", 866169185_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_shaped_text_get_descent, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_width : Void* = Pointer(Void).null
    def shaped_text_get_width(shaped : Int64) : Float64
      if @@mb_shaped_text_get_width.null?
        @@mb_shaped_text_get_width = Bridge.get_method_bind("TextServer", "shaped_text_get_width", 866169185_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_shaped_text_get_width, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_underline_position : Void* = Pointer(Void).null
    def shaped_text_get_underline_position(shaped : Int64) : Float64
      if @@mb_shaped_text_get_underline_position.null?
        @@mb_shaped_text_get_underline_position = Bridge.get_method_bind("TextServer", "shaped_text_get_underline_position", 866169185_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_shaped_text_get_underline_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_underline_thickness : Void* = Pointer(Void).null
    def shaped_text_get_underline_thickness(shaped : Int64) : Float64
      if @@mb_shaped_text_get_underline_thickness.null?
        @@mb_shaped_text_get_underline_thickness = Bridge.get_method_bind("TextServer", "shaped_text_get_underline_thickness", 866169185_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_shaped_text_get_underline_thickness, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_carets : Void* = Pointer(Void).null
    def shaped_text_get_carets(shaped : Int64, position : Int64) : Void*
      if @@mb_shaped_text_get_carets.null?
        @@mb_shaped_text_get_carets = Bridge.get_method_bind("TextServer", "shaped_text_get_carets", 1574219346_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_carets, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_text_get_selection : Void* = Pointer(Void).null
    def shaped_text_get_selection(shaped : Int64, start : Int64, end_val : Int64) : Void*
      if @@mb_shaped_text_get_selection.null?
        @@mb_shaped_text_get_selection = Bridge.get_method_bind("TextServer", "shaped_text_get_selection", 3714187733_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = start
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = end_val
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_selection, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_text_hit_test_grapheme : Void* = Pointer(Void).null
    def shaped_text_hit_test_grapheme(shaped : Int64, coords : Float64) : Int64
      if @@mb_shaped_text_hit_test_grapheme.null?
        @@mb_shaped_text_hit_test_grapheme = Bridge.get_method_bind("TextServer", "shaped_text_hit_test_grapheme", 3149310417_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = coords
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_hit_test_grapheme, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_hit_test_position : Void* = Pointer(Void).null
    def shaped_text_hit_test_position(shaped : Int64, coords : Float64) : Int64
      if @@mb_shaped_text_hit_test_position.null?
        @@mb_shaped_text_hit_test_position = Bridge.get_method_bind("TextServer", "shaped_text_hit_test_position", 3149310417_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = coords
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_hit_test_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_grapheme_bounds : Void* = Pointer(Void).null
    def shaped_text_get_grapheme_bounds(shaped : Int64, pos : Int64) : Vector2
      if @@mb_shaped_text_get_grapheme_bounds.null?
        @@mb_shaped_text_get_grapheme_bounds = Bridge.get_method_bind("TextServer", "shaped_text_get_grapheme_bounds", 2546185844_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_shaped_text_get_grapheme_bounds, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_next_grapheme_pos : Void* = Pointer(Void).null
    def shaped_text_next_grapheme_pos(shaped : Int64, pos : Int64) : Int64
      if @@mb_shaped_text_next_grapheme_pos.null?
        @@mb_shaped_text_next_grapheme_pos = Bridge.get_method_bind("TextServer", "shaped_text_next_grapheme_pos", 1120910005_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_next_grapheme_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_prev_grapheme_pos : Void* = Pointer(Void).null
    def shaped_text_prev_grapheme_pos(shaped : Int64, pos : Int64) : Int64
      if @@mb_shaped_text_prev_grapheme_pos.null?
        @@mb_shaped_text_prev_grapheme_pos = Bridge.get_method_bind("TextServer", "shaped_text_prev_grapheme_pos", 1120910005_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_prev_grapheme_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_get_character_breaks : Void* = Pointer(Void).null
    def shaped_text_get_character_breaks(shaped : Int64) : Void*
      if @@mb_shaped_text_get_character_breaks.null?
        @@mb_shaped_text_get_character_breaks = Bridge.get_method_bind("TextServer", "shaped_text_get_character_breaks", 788230395_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shaped_text_get_character_breaks, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shaped_text_next_character_pos : Void* = Pointer(Void).null
    def shaped_text_next_character_pos(shaped : Int64, pos : Int64) : Int64
      if @@mb_shaped_text_next_character_pos.null?
        @@mb_shaped_text_next_character_pos = Bridge.get_method_bind("TextServer", "shaped_text_next_character_pos", 1120910005_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_next_character_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_prev_character_pos : Void* = Pointer(Void).null
    def shaped_text_prev_character_pos(shaped : Int64, pos : Int64) : Int64
      if @@mb_shaped_text_prev_character_pos.null?
        @@mb_shaped_text_prev_character_pos = Bridge.get_method_bind("TextServer", "shaped_text_prev_character_pos", 1120910005_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_prev_character_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_closest_character_pos : Void* = Pointer(Void).null
    def shaped_text_closest_character_pos(shaped : Int64, pos : Int64) : Int64
      if @@mb_shaped_text_closest_character_pos.null?
        @@mb_shaped_text_closest_character_pos = Bridge.get_method_bind("TextServer", "shaped_text_closest_character_pos", 1120910005_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_closest_character_pos, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shaped_text_draw : Void* = Pointer(Void).null
    def shaped_text_draw(shaped : Int64, canvas : Int64, pos : Vector2, clip_l : Float64, clip_r : Float64, color : Color, oversampling : Float64) : Void
      if @@mb_shaped_text_draw.null?
        @@mb_shaped_text_draw = Bridge.get_method_bind("TextServer", "shaped_text_draw", 1647687596_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = pos
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = clip_l
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = clip_r
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = color
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = oversampling
      arg_6 = pointerof(val_6).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6]
      Bridge.ptrcall(@@mb_shaped_text_draw, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_draw_outline : Void* = Pointer(Void).null
    def shaped_text_draw_outline(shaped : Int64, canvas : Int64, pos : Vector2, clip_l : Float64, clip_r : Float64, outline_size : Int64, color : Color, oversampling : Float64) : Void
      if @@mb_shaped_text_draw_outline.null?
        @@mb_shaped_text_draw_outline = Bridge.get_method_bind("TextServer", "shaped_text_draw_outline", 1217146601_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = canvas
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = pos
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = clip_l
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = clip_r
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = outline_size
      arg_5 = pointerof(val_5).as(Void*)
      val_6 = color
      arg_6 = pointerof(val_6).as(Void*)
      val_7 = oversampling
      arg_7 = pointerof(val_7).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5, arg_6, arg_7]
      Bridge.ptrcall(@@mb_shaped_text_draw_outline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shaped_text_get_dominant_direction_in_range : Void* = Pointer(Void).null
    def shaped_text_get_dominant_direction_in_range(shaped : Int64, start : Int64, end_val : Int64) : Int64
      if @@mb_shaped_text_get_dominant_direction_in_range.null?
        @@mb_shaped_text_get_dominant_direction_in_range = Bridge.get_method_bind("TextServer", "shaped_text_get_dominant_direction_in_range", 3326907668_i64)
      end
      val_0 = shaped
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = start
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = end_val
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shaped_text_get_dominant_direction_in_range, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_format_number : Void* = Pointer(Void).null
    def format_number(number : String, language : String) : String
      if @@mb_format_number.null?
        @@mb_format_number = Bridge.get_method_bind("TextServer", "format_number", 2664628024_i64)
      end
      val_0 = number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_parse_number : Void* = Pointer(Void).null
    def parse_number(number : String, language : String) : String
      if @@mb_parse_number.null?
        @@mb_parse_number = Bridge.get_method_bind("TextServer", "parse_number", 2664628024_i64)
      end
      val_0 = number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_percent_sign : Void* = Pointer(Void).null
    def percent_sign(language : String) : String
      if @@mb_percent_sign.null?
        @@mb_percent_sign = Bridge.get_method_bind("TextServer", "percent_sign", 993269549_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_string_get_word_breaks : Void* = Pointer(Void).null
    def string_get_word_breaks(string : String, language : String, chars_per_line : Int64) : Void*
      if @@mb_string_get_word_breaks.null?
        @@mb_string_get_word_breaks = Bridge.get_method_bind("TextServer", "string_get_word_breaks", 581857818_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = chars_per_line
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_string_get_word_breaks, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_string_get_character_breaks : Void* = Pointer(Void).null
    def string_get_character_breaks(string : String, language : String) : Void*
      if @@mb_string_get_character_breaks.null?
        @@mb_string_get_character_breaks = Bridge.get_method_bind("TextServer", "string_get_character_breaks", 2333794773_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_string_get_character_breaks, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_is_confusable : Void* = Pointer(Void).null
    def is_confusable(string : String, dict : Void*) : Int64
      if @@mb_is_confusable.null?
        @@mb_is_confusable = Bridge.get_method_bind("TextServer", "is_confusable", 1433197768_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = dict
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_is_confusable, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_spoof_check : Void* = Pointer(Void).null
    def spoof_check(string : String) : Bool
      if @@mb_spoof_check.null?
        @@mb_spoof_check = Bridge.get_method_bind("TextServer", "spoof_check", 3927539163_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_spoof_check, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_strip_diacritics : Void* = Pointer(Void).null
    def strip_diacritics(string : String) : String
      if @@mb_strip_diacritics.null?
        @@mb_strip_diacritics = Bridge.get_method_bind("TextServer", "strip_diacritics", 3135753539_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_is_valid_identifier : Void* = Pointer(Void).null
    def is_valid_identifier(string : String) : Bool
      if @@mb_is_valid_identifier.null?
        @@mb_is_valid_identifier = Bridge.get_method_bind("TextServer", "is_valid_identifier", 3927539163_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_valid_identifier, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_valid_letter : Void* = Pointer(Void).null
    def is_valid_letter(unicode : Int64) : Bool
      if @@mb_is_valid_letter.null?
        @@mb_is_valid_letter = Bridge.get_method_bind("TextServer", "is_valid_letter", 1116898809_i64)
      end
      val_0 = unicode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_valid_letter, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_string_to_upper : Void* = Pointer(Void).null
    def string_to_upper(string : String, language : String) : String
      if @@mb_string_to_upper.null?
        @@mb_string_to_upper = Bridge.get_method_bind("TextServer", "string_to_upper", 2664628024_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_string_to_lower : Void* = Pointer(Void).null
    def string_to_lower(string : String, language : String) : String
      if @@mb_string_to_lower.null?
        @@mb_string_to_lower = Bridge.get_method_bind("TextServer", "string_to_lower", 2664628024_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_string_to_title : Void* = Pointer(Void).null
    def string_to_title(string : String, language : String) : String
      if @@mb_string_to_title.null?
        @@mb_string_to_title = Bridge.get_method_bind("TextServer", "string_to_title", 2664628024_i64)
      end
      val_0 = string
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = language
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_parse_structured_text : Void* = Pointer(Void).null
    def parse_structured_text(parser_type : Int64, args : Godot::Array, text : String) : Godot::Array
      if @@mb_parse_structured_text.null?
        @@mb_parse_structured_text = Bridge.get_method_bind("TextServer", "parse_structured_text", 3310685015_i64)
      end
      val_0 = parser_type
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = args ? args.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      val_2 = text
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_parse_structured_text, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
  end
  class TextServerExtension < Godot::TextServer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class TextServerAdvanced < Godot::TextServerExtension
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class TextServerDummy < Godot::TextServerExtension
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class TextServerManager < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_add_interface : Void* = Pointer(Void).null
    def add_interface(interface : TextServer) : Void
      if @@mb_add_interface.null?
        @@mb_add_interface = Bridge.get_method_bind("TextServerManager", "add_interface", 1799689403_i64)
      end
      val_0 = interface
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_interface_count : Void* = Pointer(Void).null
    def get_interface_count() : Int64
      if @@mb_get_interface_count.null?
        @@mb_get_interface_count = Bridge.get_method_bind("TextServerManager", "get_interface_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_interface_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_interface : Void* = Pointer(Void).null
    def remove_interface(interface : TextServer) : Void
      if @@mb_remove_interface.null?
        @@mb_remove_interface = Bridge.get_method_bind("TextServerManager", "remove_interface", 1799689403_i64)
      end
      val_0 = interface
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_interface : Void* = Pointer(Void).null
    def get_interface(idx : Int64) : TextServer
      if @@mb_get_interface.null?
        @@mb_get_interface = Bridge.get_method_bind("TextServerManager", "get_interface", 1672475555_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_interface, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      TextServer.new(ret_ptr)
    end
    @@mb_get_interfaces : Void* = Pointer(Void).null
    def get_interfaces() : Godot::Array
      if @@mb_get_interfaces.null?
        @@mb_get_interfaces = Bridge.get_method_bind("TextServerManager", "get_interfaces", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_interfaces, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_find_interface : Void* = Pointer(Void).null
    def find_interface(name : String) : TextServer
      if @@mb_find_interface.null?
        @@mb_find_interface = Bridge.get_method_bind("TextServerManager", "find_interface", 2240905781_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_interface, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      TextServer.new(ret_ptr)
    end
    @@mb_set_primary_interface : Void* = Pointer(Void).null
    def set_primary_interface(index : TextServer) : Void
      if @@mb_set_primary_interface.null?
        @@mb_set_primary_interface = Bridge.get_method_bind("TextServerManager", "set_primary_interface", 1799689403_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_primary_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_primary_interface : Void* = Pointer(Void).null
    def get_primary_interface() : TextServer
      if @@mb_get_primary_interface.null?
        @@mb_get_primary_interface = Bridge.get_method_bind("TextServerManager", "get_primary_interface", 905850878_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_primary_interface, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      TextServer.new(ret_ptr)
    end
  end
  class TranslationServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_locale : Void* = Pointer(Void).null
    def set_locale(locale : String) : Void
      if @@mb_set_locale.null?
        @@mb_set_locale = Bridge.get_method_bind("TranslationServer", "set_locale", 83702148_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_locale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_locale : Void* = Pointer(Void).null
    def get_locale() : String
      if @@mb_get_locale.null?
        @@mb_get_locale = Bridge.get_method_bind("TranslationServer", "get_locale", 201670096_i64)
      end
      ""
    end
    @@mb_get_tool_locale : Void* = Pointer(Void).null
    def get_tool_locale() : String
      if @@mb_get_tool_locale.null?
        @@mb_get_tool_locale = Bridge.get_method_bind("TranslationServer", "get_tool_locale", 2841200299_i64)
      end
      ""
    end
    @@mb_compare_locales : Void* = Pointer(Void).null
    def compare_locales(locale_a : String, locale_b : String) : Int64
      if @@mb_compare_locales.null?
        @@mb_compare_locales = Bridge.get_method_bind("TranslationServer", "compare_locales", 2878152881_i64)
      end
      val_0 = locale_a
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = locale_b
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_compare_locales, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_standardize_locale : Void* = Pointer(Void).null
    def standardize_locale(locale : String, add_defaults : Bool) : String
      if @@mb_standardize_locale.null?
        @@mb_standardize_locale = Bridge.get_method_bind("TranslationServer", "standardize_locale", 4216441673_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = add_defaults
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_get_all_languages : Void* = Pointer(Void).null
    def get_all_languages() : Void*
      if @@mb_get_all_languages.null?
        @@mb_get_all_languages = Bridge.get_method_bind("TranslationServer", "get_all_languages", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_all_languages, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_language_name : Void* = Pointer(Void).null
    def get_language_name(language : String) : String
      if @@mb_get_language_name.null?
        @@mb_get_language_name = Bridge.get_method_bind("TranslationServer", "get_language_name", 3135753539_i64)
      end
      val_0 = language
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_all_scripts : Void* = Pointer(Void).null
    def get_all_scripts() : Void*
      if @@mb_get_all_scripts.null?
        @@mb_get_all_scripts = Bridge.get_method_bind("TranslationServer", "get_all_scripts", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_all_scripts, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_script_name : Void* = Pointer(Void).null
    def get_script_name(script : String) : String
      if @@mb_get_script_name.null?
        @@mb_get_script_name = Bridge.get_method_bind("TranslationServer", "get_script_name", 3135753539_i64)
      end
      val_0 = script
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_all_countries : Void* = Pointer(Void).null
    def get_all_countries() : Void*
      if @@mb_get_all_countries.null?
        @@mb_get_all_countries = Bridge.get_method_bind("TranslationServer", "get_all_countries", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_all_countries, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_country_name : Void* = Pointer(Void).null
    def get_country_name(country : String) : String
      if @@mb_get_country_name.null?
        @@mb_get_country_name = Bridge.get_method_bind("TranslationServer", "get_country_name", 3135753539_i64)
      end
      val_0 = country
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_locale_name : Void* = Pointer(Void).null
    def get_locale_name(locale : String) : String
      if @@mb_get_locale_name.null?
        @@mb_get_locale_name = Bridge.get_method_bind("TranslationServer", "get_locale_name", 3135753539_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_get_plural_rules : Void* = Pointer(Void).null
    def get_plural_rules(locale : String) : String
      if @@mb_get_plural_rules.null?
        @@mb_get_plural_rules = Bridge.get_method_bind("TranslationServer", "get_plural_rules", 3135753539_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_translate : Void* = Pointer(Void).null
    def translate(message : String, context : String) : String
      if @@mb_translate.null?
        @@mb_translate = Bridge.get_method_bind("TranslationServer", "translate", 1829228469_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = context
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_translate_plural : Void* = Pointer(Void).null
    def translate_plural(message : String, plural_message : String, n : Int64, context : String) : String
      if @@mb_translate_plural.null?
        @@mb_translate_plural = Bridge.get_method_bind("TranslationServer", "translate_plural", 229954002_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = plural_message
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = n
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = context
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ""
    end
    @@mb_add_translation : Void* = Pointer(Void).null
    def add_translation(translation : Translation) : Void
      if @@mb_add_translation.null?
        @@mb_add_translation = Bridge.get_method_bind("TranslationServer", "add_translation", 1466479800_i64)
      end
      val_0 = translation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_translation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_translation : Void* = Pointer(Void).null
    def remove_translation(translation : Translation) : Void
      if @@mb_remove_translation.null?
        @@mb_remove_translation = Bridge.get_method_bind("TranslationServer", "remove_translation", 1466479800_i64)
      end
      val_0 = translation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_translation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_translation_object : Void* = Pointer(Void).null
    def get_translation_object(locale : String) : Translation
      if @@mb_get_translation_object.null?
        @@mb_get_translation_object = Bridge.get_method_bind("TranslationServer", "get_translation_object", 2065240175_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_translation_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Translation.new(ret_ptr)
    end
    @@mb_get_translations : Void* = Pointer(Void).null
    def get_translations() : Godot::Array
      if @@mb_get_translations.null?
        @@mb_get_translations = Bridge.get_method_bind("TranslationServer", "get_translations", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_translations, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_find_translations : Void* = Pointer(Void).null
    def find_translations(locale : String, exact : Bool) : Godot::Array
      if @@mb_find_translations.null?
        @@mb_find_translations = Bridge.get_method_bind("TranslationServer", "find_translations", 2109650934_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = exact
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_translations, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_has_translation_for_locale : Void* = Pointer(Void).null
    def has_translation_for_locale(locale : String, exact : Bool) : Bool
      if @@mb_has_translation_for_locale.null?
        @@mb_has_translation_for_locale = Bridge.get_method_bind("TranslationServer", "has_translation_for_locale", 2034713381_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = exact
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_translation_for_locale, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_translation : Void* = Pointer(Void).null
    def has_translation(translation : Translation) : Bool
      if @@mb_has_translation.null?
        @@mb_has_translation = Bridge.get_method_bind("TranslationServer", "has_translation", 2696976312_i64)
      end
      val_0 = translation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_translation, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_domain : Void* = Pointer(Void).null
    def has_domain(domain : String) : Bool
      if @@mb_has_domain.null?
        @@mb_has_domain = Bridge.get_method_bind("TranslationServer", "has_domain", 2619796661_i64)
      end
      val_0 = domain
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_domain, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_or_add_domain : Void* = Pointer(Void).null
    def get_or_add_domain(domain : String) : TranslationDomain
      if @@mb_get_or_add_domain.null?
        @@mb_get_or_add_domain = Bridge.get_method_bind("TranslationServer", "get_or_add_domain", 397200075_i64)
      end
      val_0 = domain
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_or_add_domain, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      TranslationDomain.new(ret_ptr)
    end
    @@mb_remove_domain : Void* = Pointer(Void).null
    def remove_domain(domain : String) : Void
      if @@mb_remove_domain.null?
        @@mb_remove_domain = Bridge.get_method_bind("TranslationServer", "remove_domain", 3304788590_i64)
      end
      val_0 = domain
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_domain, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("TranslationServer", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_loaded_locales : Void* = Pointer(Void).null
    def get_loaded_locales() : Void*
      if @@mb_get_loaded_locales.null?
        @@mb_get_loaded_locales = Bridge.get_method_bind("TranslationServer", "get_loaded_locales", 1139954409_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_loaded_locales, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_format_number : Void* = Pointer(Void).null
    def format_number(number : String, locale : String) : String
      if @@mb_format_number.null?
        @@mb_format_number = Bridge.get_method_bind("TranslationServer", "format_number", 315676799_i64)
      end
      val_0 = number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = locale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_get_percent_sign : Void* = Pointer(Void).null
    def get_percent_sign(locale : String) : String
      if @@mb_get_percent_sign.null?
        @@mb_get_percent_sign = Bridge.get_method_bind("TranslationServer", "get_percent_sign", 3135753539_i64)
      end
      val_0 = locale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_parse_number : Void* = Pointer(Void).null
    def parse_number(number : String, locale : String) : String
      if @@mb_parse_number.null?
        @@mb_parse_number = Bridge.get_method_bind("TranslationServer", "parse_number", 315676799_i64)
      end
      val_0 = number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = locale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ""
    end
    @@mb_is_pseudolocalization_enabled : Void* = Pointer(Void).null
    def is_pseudolocalization_enabled() : Bool
      if @@mb_is_pseudolocalization_enabled.null?
        @@mb_is_pseudolocalization_enabled = Bridge.get_method_bind("TranslationServer", "is_pseudolocalization_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_pseudolocalization_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_pseudolocalization_enabled : Void* = Pointer(Void).null
    def set_pseudolocalization_enabled(enabled : Bool) : Void
      if @@mb_set_pseudolocalization_enabled.null?
        @@mb_set_pseudolocalization_enabled = Bridge.get_method_bind("TranslationServer", "set_pseudolocalization_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pseudolocalization_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_reload_pseudolocalization : Void* = Pointer(Void).null
    def reload_pseudolocalization() : Void
      if @@mb_reload_pseudolocalization.null?
        @@mb_reload_pseudolocalization = Bridge.get_method_bind("TranslationServer", "reload_pseudolocalization", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reload_pseudolocalization, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_pseudolocalize : Void* = Pointer(Void).null
    def pseudolocalize(message : String) : String
      if @@mb_pseudolocalize.null?
        @@mb_pseudolocalize = Bridge.get_method_bind("TranslationServer", "pseudolocalize", 1965194235_i64)
      end
      val_0 = message
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
  end
  class UDPServer < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_listen : Void* = Pointer(Void).null
    def listen(port : Int64, bind_address : String) : Int64
      if @@mb_listen.null?
        @@mb_listen = Bridge.get_method_bind("UDPServer", "listen", 3167955072_i64)
      end
      val_0 = port
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bind_address
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_listen, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_poll : Void* = Pointer(Void).null
    def poll() : Int64
      if @@mb_poll.null?
        @@mb_poll = Bridge.get_method_bind("UDPServer", "poll", 166280745_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_poll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_connection_available : Void* = Pointer(Void).null
    def is_connection_available() : Bool
      if @@mb_is_connection_available.null?
        @@mb_is_connection_available = Bridge.get_method_bind("UDPServer", "is_connection_available", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_connection_available, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_local_port : Void* = Pointer(Void).null
    def get_local_port() : Int64
      if @@mb_get_local_port.null?
        @@mb_get_local_port = Bridge.get_method_bind("UDPServer", "get_local_port", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_local_port, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_listening : Void* = Pointer(Void).null
    def is_listening() : Bool
      if @@mb_is_listening.null?
        @@mb_is_listening = Bridge.get_method_bind("UDPServer", "is_listening", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_listening, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_take_connection : Void* = Pointer(Void).null
    def take_connection() : PacketPeerUDP
      if @@mb_take_connection.null?
        @@mb_take_connection = Bridge.get_method_bind("UDPServer", "take_connection", 808734560_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_take_connection, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PacketPeerUDP.new(ret_ptr)
    end
    @@mb_stop : Void* = Pointer(Void).null
    def stop() : Void
      if @@mb_stop.null?
        @@mb_stop = Bridge.get_method_bind("UDPServer", "stop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_stop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_max_pending_connections : Void* = Pointer(Void).null
    def set_max_pending_connections(max_pending_connections : Int64) : Void
      if @@mb_set_max_pending_connections.null?
        @@mb_set_max_pending_connections = Bridge.get_method_bind("UDPServer", "set_max_pending_connections", 1286410249_i64)
      end
      val_0 = max_pending_connections
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_pending_connections, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_pending_connections : Void* = Pointer(Void).null
    def get_max_pending_connections() : Int64
      if @@mb_get_max_pending_connections.null?
        @@mb_get_max_pending_connections = Bridge.get_method_bind("UDPServer", "get_max_pending_connections", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_pending_connections, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class UDSServer < Godot::SocketServer
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_listen : Void* = Pointer(Void).null
    def listen(path : String) : Int64
      if @@mb_listen.null?
        @@mb_listen = Bridge.get_method_bind("UDSServer", "listen", 166001499_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_listen, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_take_connection : Void* = Pointer(Void).null
    def take_connection() : StreamPeerUDS
      if @@mb_take_connection.null?
        @@mb_take_connection = Bridge.get_method_bind("UDSServer", "take_connection", 1623851112_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_take_connection, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      StreamPeerUDS.new(ret_ptr)
    end
  end
  class XRServer < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum TrackerType : Int64
      TrackerHead = 1_i64
      TrackerController = 2_i64
      TrackerBasestation = 4_i64
      TrackerAnchor = 8_i64
      TrackerHand = 16_i64
      TrackerBody = 32_i64
      TrackerFace = 64_i64
      TrackerAnyKnown = 127_i64
      TrackerUnknown = 128_i64
      TrackerAny = 255_i64
    end
    enum RotationMode : Int64
      ResetFullRotation = 0_i64
      ResetButKeepTilt = 1_i64
      DontResetRotation = 2_i64
    end
    @@mb_get_world_scale : Void* = Pointer(Void).null
    def get_world_scale() : Float64
      if @@mb_get_world_scale.null?
        @@mb_get_world_scale = Bridge.get_method_bind("XRServer", "get_world_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_world_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_world_scale : Void* = Pointer(Void).null
    def set_world_scale(scale : Float64) : Void
      if @@mb_set_world_scale.null?
        @@mb_set_world_scale = Bridge.get_method_bind("XRServer", "set_world_scale", 373806689_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_world_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_world_origin : Void* = Pointer(Void).null
    def get_world_origin() : Transform3D
      if @@mb_get_world_origin.null?
        @@mb_get_world_origin = Bridge.get_method_bind("XRServer", "get_world_origin", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_world_origin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_world_origin : Void* = Pointer(Void).null
    def set_world_origin(world_origin : Transform3D) : Void
      if @@mb_set_world_origin.null?
        @@mb_set_world_origin = Bridge.get_method_bind("XRServer", "set_world_origin", 2952846383_i64)
      end
      val_0 = world_origin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_world_origin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_reference_frame : Void* = Pointer(Void).null
    def get_reference_frame() : Transform3D
      if @@mb_get_reference_frame.null?
        @@mb_get_reference_frame = Bridge.get_method_bind("XRServer", "get_reference_frame", 3229777777_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_reference_frame, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_clear_reference_frame : Void* = Pointer(Void).null
    def clear_reference_frame() : Void
      if @@mb_clear_reference_frame.null?
        @@mb_clear_reference_frame = Bridge.get_method_bind("XRServer", "clear_reference_frame", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_reference_frame, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_center_on_hmd : Void* = Pointer(Void).null
    def center_on_hmd(rotation_mode : Int64, keep_height : Bool) : Void
      if @@mb_center_on_hmd.null?
        @@mb_center_on_hmd = Bridge.get_method_bind("XRServer", "center_on_hmd", 1450904707_i64)
      end
      val_0 = rotation_mode
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = keep_height
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_center_on_hmd, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hmd_transform : Void* = Pointer(Void).null
    def get_hmd_transform() : Transform3D
      if @@mb_get_hmd_transform.null?
        @@mb_get_hmd_transform = Bridge.get_method_bind("XRServer", "get_hmd_transform", 4183770049_i64)
      end
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_hmd_transform, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_camera_locked_to_origin : Void* = Pointer(Void).null
    def set_camera_locked_to_origin(enabled : Bool) : Void
      if @@mb_set_camera_locked_to_origin.null?
        @@mb_set_camera_locked_to_origin = Bridge.get_method_bind("XRServer", "set_camera_locked_to_origin", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_camera_locked_to_origin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_camera_locked_to_origin : Void* = Pointer(Void).null
    def is_camera_locked_to_origin() : Bool
      if @@mb_is_camera_locked_to_origin.null?
        @@mb_is_camera_locked_to_origin = Bridge.get_method_bind("XRServer", "is_camera_locked_to_origin", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_camera_locked_to_origin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_add_interface : Void* = Pointer(Void).null
    def add_interface(interface : XRInterface) : Void
      if @@mb_add_interface.null?
        @@mb_add_interface = Bridge.get_method_bind("XRServer", "add_interface", 1898711491_i64)
      end
      val_0 = interface
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_interface_count : Void* = Pointer(Void).null
    def get_interface_count() : Int64
      if @@mb_get_interface_count.null?
        @@mb_get_interface_count = Bridge.get_method_bind("XRServer", "get_interface_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_interface_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_interface : Void* = Pointer(Void).null
    def remove_interface(interface : XRInterface) : Void
      if @@mb_remove_interface.null?
        @@mb_remove_interface = Bridge.get_method_bind("XRServer", "remove_interface", 1898711491_i64)
      end
      val_0 = interface
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_interface : Void* = Pointer(Void).null
    def get_interface(idx : Int64) : XRInterface
      if @@mb_get_interface.null?
        @@mb_get_interface = Bridge.get_method_bind("XRServer", "get_interface", 4237347919_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_interface, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      XRInterface.new(ret_ptr)
    end
    @@mb_get_interfaces : Void* = Pointer(Void).null
    def get_interfaces() : Godot::Array
      if @@mb_get_interfaces.null?
        @@mb_get_interfaces = Bridge.get_method_bind("XRServer", "get_interfaces", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_interfaces, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_find_interface : Void* = Pointer(Void).null
    def find_interface(name : String) : XRInterface
      if @@mb_find_interface.null?
        @@mb_find_interface = Bridge.get_method_bind("XRServer", "find_interface", 1395192955_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_find_interface, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      XRInterface.new(ret_ptr)
    end
    @@mb_add_tracker : Void* = Pointer(Void).null
    def add_tracker(tracker : XRTracker) : Void
      if @@mb_add_tracker.null?
        @@mb_add_tracker = Bridge.get_method_bind("XRServer", "add_tracker", 684804553_i64)
      end
      val_0 = tracker
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_tracker : Void* = Pointer(Void).null
    def remove_tracker(tracker : XRTracker) : Void
      if @@mb_remove_tracker.null?
        @@mb_remove_tracker = Bridge.get_method_bind("XRServer", "remove_tracker", 684804553_i64)
      end
      val_0 = tracker
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_tracker, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_trackers : Void* = Pointer(Void).null
    def get_trackers(tracker_types : Int64) : Void*
      if @@mb_get_trackers.null?
        @@mb_get_trackers = Bridge.get_method_bind("XRServer", "get_trackers", 3554694381_i64)
      end
      val_0 = tracker_types
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_trackers, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_tracker : Void* = Pointer(Void).null
    def get_tracker(tracker_name : String) : XRTracker
      if @@mb_get_tracker.null?
        @@mb_get_tracker = Bridge.get_method_bind("XRServer", "get_tracker", 147382240_i64)
      end
      val_0 = tracker_name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tracker, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      XRTracker.new(ret_ptr)
    end
    @@mb_get_primary_interface : Void* = Pointer(Void).null
    def get_primary_interface() : XRInterface
      if @@mb_get_primary_interface.null?
        @@mb_get_primary_interface = Bridge.get_method_bind("XRServer", "get_primary_interface", 2143545064_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_primary_interface, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      XRInterface.new(ret_ptr)
    end
    @@mb_set_primary_interface : Void* = Pointer(Void).null
    def set_primary_interface(interface : XRInterface) : Void
      if @@mb_set_primary_interface.null?
        @@mb_set_primary_interface = Bridge.get_method_bind("XRServer", "set_primary_interface", 1898711491_i64)
      end
      val_0 = interface
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_primary_interface, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
end
