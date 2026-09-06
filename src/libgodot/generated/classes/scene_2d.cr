# Generated scene_2d classes
module Godot
  class AStar2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_available_point_id : Void* = Pointer(Void).null
    def get_available_point_id() : Int64
      if @@mb_get_available_point_id.null?
        @@mb_get_available_point_id = Bridge.get_method_bind("AStar2D", "get_available_point_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_available_point_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_point : Void* = Pointer(Void).null
    def add_point(id : Int64, position : Vector2, weight_scale : Float64) : Void
      if @@mb_add_point.null?
        @@mb_add_point = Bridge.get_method_bind("AStar2D", "add_point", 4074201818_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = weight_scale
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_add_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_point_position : Void* = Pointer(Void).null
    def get_point_position(id : Int64) : Vector2
      if @@mb_get_point_position.null?
        @@mb_get_point_position = Bridge.get_method_bind("AStar2D", "get_point_position", 2299179447_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_point_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_point_position : Void* = Pointer(Void).null
    def set_point_position(id : Int64, position : Vector2) : Void
      if @@mb_set_point_position.null?
        @@mb_set_point_position = Bridge.get_method_bind("AStar2D", "set_point_position", 163021252_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_point_weight_scale : Void* = Pointer(Void).null
    def get_point_weight_scale(id : Int64) : Float64
      if @@mb_get_point_weight_scale.null?
        @@mb_get_point_weight_scale = Bridge.get_method_bind("AStar2D", "get_point_weight_scale", 2339986948_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_point_weight_scale, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_point_weight_scale : Void* = Pointer(Void).null
    def set_point_weight_scale(id : Int64, weight_scale : Float64) : Void
      if @@mb_set_point_weight_scale.null?
        @@mb_set_point_weight_scale = Bridge.get_method_bind("AStar2D", "set_point_weight_scale", 1602489585_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weight_scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_weight_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_point : Void* = Pointer(Void).null
    def remove_point(id : Int64) : Void
      if @@mb_remove_point.null?
        @@mb_remove_point = Bridge.get_method_bind("AStar2D", "remove_point", 1286410249_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_point : Void* = Pointer(Void).null
    def has_point(id : Int64) : Bool
      if @@mb_has_point.null?
        @@mb_has_point = Bridge.get_method_bind("AStar2D", "has_point", 1116898809_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_point_connections : Void* = Pointer(Void).null
    def get_point_connections(id : Int64) : Void*
      if @@mb_get_point_connections.null?
        @@mb_get_point_connections = Bridge.get_method_bind("AStar2D", "get_point_connections", 2865087369_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_point_connections, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_point_ids : Void* = Pointer(Void).null
    def get_point_ids() : Void*
      if @@mb_get_point_ids.null?
        @@mb_get_point_ids = Bridge.get_method_bind("AStar2D", "get_point_ids", 3851388692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_point_ids, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_neighbor_filter_enabled : Void* = Pointer(Void).null
    def set_neighbor_filter_enabled(enabled : Bool) : Void
      if @@mb_set_neighbor_filter_enabled.null?
        @@mb_set_neighbor_filter_enabled = Bridge.get_method_bind("AStar2D", "set_neighbor_filter_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_neighbor_filter_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_neighbor_filter_enabled : Void* = Pointer(Void).null
    def is_neighbor_filter_enabled() : Bool
      if @@mb_is_neighbor_filter_enabled.null?
        @@mb_is_neighbor_filter_enabled = Bridge.get_method_bind("AStar2D", "is_neighbor_filter_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_neighbor_filter_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_point_disabled : Void* = Pointer(Void).null
    def set_point_disabled(id : Int64, disabled : Bool) : Void
      if @@mb_set_point_disabled.null?
        @@mb_set_point_disabled = Bridge.get_method_bind("AStar2D", "set_point_disabled", 972357352_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_point_disabled : Void* = Pointer(Void).null
    def is_point_disabled(id : Int64) : Bool
      if @@mb_is_point_disabled.null?
        @@mb_is_point_disabled = Bridge.get_method_bind("AStar2D", "is_point_disabled", 1116898809_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_point_disabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_connect_points : Void* = Pointer(Void).null
    def connect_points(id : Int64, to_id : Int64, bidirectional : Bool) : Void
      if @@mb_connect_points.null?
        @@mb_connect_points = Bridge.get_method_bind("AStar2D", "connect_points", 3710494224_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = bidirectional
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_connect_points, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_disconnect_points : Void* = Pointer(Void).null
    def disconnect_points(id : Int64, to_id : Int64, bidirectional : Bool) : Void
      if @@mb_disconnect_points.null?
        @@mb_disconnect_points = Bridge.get_method_bind("AStar2D", "disconnect_points", 3710494224_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = bidirectional
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_disconnect_points, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_are_points_connected : Void* = Pointer(Void).null
    def are_points_connected(id : Int64, to_id : Int64, bidirectional : Bool) : Bool
      if @@mb_are_points_connected.null?
        @@mb_are_points_connected = Bridge.get_method_bind("AStar2D", "are_points_connected", 2288175859_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = bidirectional
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_u8
      Bridge.ptrcall(@@mb_are_points_connected, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_point_count : Void* = Pointer(Void).null
    def get_point_count() : Int64
      if @@mb_get_point_count.null?
        @@mb_get_point_count = Bridge.get_method_bind("AStar2D", "get_point_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_point_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_point_capacity : Void* = Pointer(Void).null
    def get_point_capacity() : Int64
      if @@mb_get_point_capacity.null?
        @@mb_get_point_capacity = Bridge.get_method_bind("AStar2D", "get_point_capacity", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_point_capacity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_reserve_space : Void* = Pointer(Void).null
    def reserve_space(num_nodes : Int64) : Void
      if @@mb_reserve_space.null?
        @@mb_reserve_space = Bridge.get_method_bind("AStar2D", "reserve_space", 1286410249_i64)
      end
      val_0 = num_nodes
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_reserve_space, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("AStar2D", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_closest_point : Void* = Pointer(Void).null
    def get_closest_point(to_position : Vector2, include_disabled : Bool) : Int64
      if @@mb_get_closest_point.null?
        @@mb_get_closest_point = Bridge.get_method_bind("AStar2D", "get_closest_point", 2300324924_i64)
      end
      val_0 = to_position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = include_disabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_closest_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_closest_position_in_segment : Void* = Pointer(Void).null
    def get_closest_position_in_segment(to_position : Vector2) : Vector2
      if @@mb_get_closest_position_in_segment.null?
        @@mb_get_closest_position_in_segment = Bridge.get_method_bind("AStar2D", "get_closest_position_in_segment", 2656412154_i64)
      end
      val_0 = to_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_closest_position_in_segment, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_point_path : Void* = Pointer(Void).null
    def get_point_path(from_id : Int64, to_id : Int64, allow_partial_path : Bool) : Void*
      if @@mb_get_point_path.null?
        @@mb_get_point_path = Bridge.get_method_bind("AStar2D", "get_point_path", 3427490392_i64)
      end
      val_0 = from_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = allow_partial_path
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_point_path, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_id_path : Void* = Pointer(Void).null
    def get_id_path(from_id : Int64, to_id : Int64, allow_partial_path : Bool) : Void*
      if @@mb_get_id_path.null?
        @@mb_get_id_path = Bridge.get_method_bind("AStar2D", "get_id_path", 3136199648_i64)
      end
      val_0 = from_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = allow_partial_path
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_id_path, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class AStarGrid2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Heuristic : Int64
      HeuristicEuclidean = 0_i64
      HeuristicManhattan = 1_i64
      HeuristicOctile = 2_i64
      HeuristicChebyshev = 3_i64
      HeuristicMax = 4_i64
    end
    enum DiagonalMode : Int64
      DiagonalModeAlways = 0_i64
      DiagonalModeNever = 1_i64
      DiagonalModeAtLeastOneWalkable = 2_i64
      DiagonalModeOnlyIfNoObstacles = 3_i64
      DiagonalModeMax = 4_i64
    end
    enum CellShape : Int64
      CellShapeSquare = 0_i64
      CellShapeIsometricRight = 1_i64
      CellShapeIsometricDown = 2_i64
      CellShapeMax = 3_i64
    end
    @@mb_set_region : Void* = Pointer(Void).null
    def set_region(region : Rect2i) : Void
      if @@mb_set_region.null?
        @@mb_set_region = Bridge.get_method_bind("AStarGrid2D", "set_region", 1763793166_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_region : Void* = Pointer(Void).null
    def get_region() : Rect2i
      if @@mb_get_region.null?
        @@mb_get_region = Bridge.get_method_bind("AStarGrid2D", "get_region", 410525958_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_region, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2i.new(ret_ptr)
    end
    @@mb_set_size : Void* = Pointer(Void).null
    def set_size(size : Vector2i) : Void
      if @@mb_set_size.null?
        @@mb_set_size = Bridge.get_method_bind("AStarGrid2D", "set_size", 1130785943_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_size : Void* = Pointer(Void).null
    def get_size() : Vector2i
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("AStarGrid2D", "get_size", 3690982128_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_set_offset : Void* = Pointer(Void).null
    def set_offset(offset : Vector2) : Void
      if @@mb_set_offset.null?
        @@mb_set_offset = Bridge.get_method_bind("AStarGrid2D", "set_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset : Void* = Pointer(Void).null
    def get_offset() : Vector2
      if @@mb_get_offset.null?
        @@mb_get_offset = Bridge.get_method_bind("AStarGrid2D", "get_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_cell_size : Void* = Pointer(Void).null
    def set_cell_size(cell_size : Vector2) : Void
      if @@mb_set_cell_size.null?
        @@mb_set_cell_size = Bridge.get_method_bind("AStarGrid2D", "set_cell_size", 743155724_i64)
      end
      val_0 = cell_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cell_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_cell_size : Void* = Pointer(Void).null
    def get_cell_size() : Vector2
      if @@mb_get_cell_size.null?
        @@mb_get_cell_size = Bridge.get_method_bind("AStarGrid2D", "get_cell_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_cell_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_cell_shape : Void* = Pointer(Void).null
    def set_cell_shape(cell_shape : Int64) : Void
      if @@mb_set_cell_shape.null?
        @@mb_set_cell_shape = Bridge.get_method_bind("AStarGrid2D", "set_cell_shape", 4130591146_i64)
      end
      val_0 = cell_shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cell_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_cell_shape : Void* = Pointer(Void).null
    def get_cell_shape() : Int64
      if @@mb_get_cell_shape.null?
        @@mb_get_cell_shape = Bridge.get_method_bind("AStarGrid2D", "get_cell_shape", 3293463634_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_cell_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_in_bounds : Void* = Pointer(Void).null
    def is_in_bounds(x : Int64, y : Int64) : Bool
      if @@mb_is_in_bounds.null?
        @@mb_is_in_bounds = Bridge.get_method_bind("AStarGrid2D", "is_in_bounds", 2522259332_i64)
      end
      val_0 = x
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = y
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_in_bounds, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_in_boundsv : Void* = Pointer(Void).null
    def is_in_boundsv(id : Vector2i) : Bool
      if @@mb_is_in_boundsv.null?
        @@mb_is_in_boundsv = Bridge.get_method_bind("AStarGrid2D", "is_in_boundsv", 3900751641_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_in_boundsv, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_dirty : Void* = Pointer(Void).null
    def is_dirty() : Bool
      if @@mb_is_dirty.null?
        @@mb_is_dirty = Bridge.get_method_bind("AStarGrid2D", "is_dirty", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_dirty, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_update : Void* = Pointer(Void).null
    def update() : Void
      if @@mb_update.null?
        @@mb_update = Bridge.get_method_bind("AStarGrid2D", "update", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_update, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_jumping_enabled : Void* = Pointer(Void).null
    def set_jumping_enabled(enabled : Bool) : Void
      if @@mb_set_jumping_enabled.null?
        @@mb_set_jumping_enabled = Bridge.get_method_bind("AStarGrid2D", "set_jumping_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_jumping_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_jumping_enabled : Void* = Pointer(Void).null
    def is_jumping_enabled() : Bool
      if @@mb_is_jumping_enabled.null?
        @@mb_is_jumping_enabled = Bridge.get_method_bind("AStarGrid2D", "is_jumping_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_jumping_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_diagonal_mode : Void* = Pointer(Void).null
    def set_diagonal_mode(mode : Int64) : Void
      if @@mb_set_diagonal_mode.null?
        @@mb_set_diagonal_mode = Bridge.get_method_bind("AStarGrid2D", "set_diagonal_mode", 1017829798_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_diagonal_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_diagonal_mode : Void* = Pointer(Void).null
    def get_diagonal_mode() : Int64
      if @@mb_get_diagonal_mode.null?
        @@mb_get_diagonal_mode = Bridge.get_method_bind("AStarGrid2D", "get_diagonal_mode", 3129282674_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_diagonal_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_default_compute_heuristic : Void* = Pointer(Void).null
    def set_default_compute_heuristic(heuristic : Int64) : Void
      if @@mb_set_default_compute_heuristic.null?
        @@mb_set_default_compute_heuristic = Bridge.get_method_bind("AStarGrid2D", "set_default_compute_heuristic", 1044375519_i64)
      end
      val_0 = heuristic
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_compute_heuristic, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_compute_heuristic : Void* = Pointer(Void).null
    def get_default_compute_heuristic() : Int64
      if @@mb_get_default_compute_heuristic.null?
        @@mb_get_default_compute_heuristic = Bridge.get_method_bind("AStarGrid2D", "get_default_compute_heuristic", 2074731422_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_default_compute_heuristic, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_default_estimate_heuristic : Void* = Pointer(Void).null
    def set_default_estimate_heuristic(heuristic : Int64) : Void
      if @@mb_set_default_estimate_heuristic.null?
        @@mb_set_default_estimate_heuristic = Bridge.get_method_bind("AStarGrid2D", "set_default_estimate_heuristic", 1044375519_i64)
      end
      val_0 = heuristic
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_estimate_heuristic, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_estimate_heuristic : Void* = Pointer(Void).null
    def get_default_estimate_heuristic() : Int64
      if @@mb_get_default_estimate_heuristic.null?
        @@mb_get_default_estimate_heuristic = Bridge.get_method_bind("AStarGrid2D", "get_default_estimate_heuristic", 2074731422_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_default_estimate_heuristic, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_point_solid : Void* = Pointer(Void).null
    def set_point_solid(id : Vector2i, solid : Bool) : Void
      if @@mb_set_point_solid.null?
        @@mb_set_point_solid = Bridge.get_method_bind("AStarGrid2D", "set_point_solid", 1765703753_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = solid
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_solid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_point_solid : Void* = Pointer(Void).null
    def is_point_solid(id : Vector2i) : Bool
      if @@mb_is_point_solid.null?
        @@mb_is_point_solid = Bridge.get_method_bind("AStarGrid2D", "is_point_solid", 3900751641_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_point_solid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_point_weight_scale : Void* = Pointer(Void).null
    def set_point_weight_scale(id : Vector2i, weight_scale : Float64) : Void
      if @@mb_set_point_weight_scale.null?
        @@mb_set_point_weight_scale = Bridge.get_method_bind("AStarGrid2D", "set_point_weight_scale", 2262553149_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weight_scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_weight_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_point_weight_scale : Void* = Pointer(Void).null
    def get_point_weight_scale(id : Vector2i) : Float64
      if @@mb_get_point_weight_scale.null?
        @@mb_get_point_weight_scale = Bridge.get_method_bind("AStarGrid2D", "get_point_weight_scale", 719993801_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_point_weight_scale, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_fill_solid_region : Void* = Pointer(Void).null
    def fill_solid_region(region : Rect2i, solid : Bool) : Void
      if @@mb_fill_solid_region.null?
        @@mb_fill_solid_region = Bridge.get_method_bind("AStarGrid2D", "fill_solid_region", 2261970063_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = solid
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_fill_solid_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_fill_weight_scale_region : Void* = Pointer(Void).null
    def fill_weight_scale_region(region : Rect2i, weight_scale : Float64) : Void
      if @@mb_fill_weight_scale_region.null?
        @@mb_fill_weight_scale_region = Bridge.get_method_bind("AStarGrid2D", "fill_weight_scale_region", 2793244083_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weight_scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_fill_weight_scale_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("AStarGrid2D", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_point_position : Void* = Pointer(Void).null
    def get_point_position(id : Vector2i) : Vector2
      if @@mb_get_point_position.null?
        @@mb_get_point_position = Bridge.get_method_bind("AStarGrid2D", "get_point_position", 108438297_i64)
      end
      val_0 = id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_point_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_point_data_in_region : Void* = Pointer(Void).null
    def get_point_data_in_region(region : Rect2i) : Godot::Array
      if @@mb_get_point_data_in_region.null?
        @@mb_get_point_data_in_region = Bridge.get_method_bind("AStarGrid2D", "get_point_data_in_region", 3893818462_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_point_data_in_region, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_point_path : Void* = Pointer(Void).null
    def get_point_path(from_id : Vector2i, to_id : Vector2i, allow_partial_path : Bool) : Void*
      if @@mb_get_point_path.null?
        @@mb_get_point_path = Bridge.get_method_bind("AStarGrid2D", "get_point_path", 1641925693_i64)
      end
      val_0 = from_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = allow_partial_path
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_point_path, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_id_path : Void* = Pointer(Void).null
    def get_id_path(from_id : Vector2i, to_id : Vector2i, allow_partial_path : Bool) : Godot::Array
      if @@mb_get_id_path.null?
        @@mb_get_id_path = Bridge.get_method_bind("AStarGrid2D", "get_id_path", 1918132273_i64)
      end
      val_0 = from_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_id
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = allow_partial_path
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_id_path, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
  end
  class Node2D < Godot::CanvasItem
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_position : Void* = Pointer(Void).null
    def set_position(position : Vector2) : Void
      if @@mb_set_position.null?
        @@mb_set_position = Bridge.get_method_bind("Node2D", "set_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_rotation : Void* = Pointer(Void).null
    def set_rotation(radians : Float64) : Void
      if @@mb_set_rotation.null?
        @@mb_set_rotation = Bridge.get_method_bind("Node2D", "set_rotation", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_rotation_degrees : Void* = Pointer(Void).null
    def set_rotation_degrees(degrees : Float64) : Void
      if @@mb_set_rotation_degrees.null?
        @@mb_set_rotation_degrees = Bridge.get_method_bind("Node2D", "set_rotation_degrees", 373806689_i64)
      end
      val_0 = degrees
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rotation_degrees, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_skew : Void* = Pointer(Void).null
    def set_skew(radians : Float64) : Void
      if @@mb_set_skew.null?
        @@mb_set_skew = Bridge.get_method_bind("Node2D", "set_skew", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_skew, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_scale : Void* = Pointer(Void).null
    def set_scale(scale : Vector2) : Void
      if @@mb_set_scale.null?
        @@mb_set_scale = Bridge.get_method_bind("Node2D", "set_scale", 743155724_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_position : Void* = Pointer(Void).null
    def get_position() : Vector2
      if @@mb_get_position.null?
        @@mb_get_position = Bridge.get_method_bind("Node2D", "get_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rotation : Void* = Pointer(Void).null
    def get_rotation() : Float64
      if @@mb_get_rotation.null?
        @@mb_get_rotation = Bridge.get_method_bind("Node2D", "get_rotation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rotation_degrees : Void* = Pointer(Void).null
    def get_rotation_degrees() : Float64
      if @@mb_get_rotation_degrees.null?
        @@mb_get_rotation_degrees = Bridge.get_method_bind("Node2D", "get_rotation_degrees", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_rotation_degrees, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_skew : Void* = Pointer(Void).null
    def get_skew() : Float64
      if @@mb_get_skew.null?
        @@mb_get_skew = Bridge.get_method_bind("Node2D", "get_skew", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_skew, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_scale : Void* = Pointer(Void).null
    def get_scale() : Vector2
      if @@mb_get_scale.null?
        @@mb_get_scale = Bridge.get_method_bind("Node2D", "get_scale", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_rotate : Void* = Pointer(Void).null
    def rotate(radians : Float64) : Void
      if @@mb_rotate.null?
        @@mb_rotate = Bridge.get_method_bind("Node2D", "rotate", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_rotate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_move_local_x : Void* = Pointer(Void).null
    def move_local_x(delta : Float64, scaled : Bool) : Void
      if @@mb_move_local_x.null?
        @@mb_move_local_x = Bridge.get_method_bind("Node2D", "move_local_x", 2087892650_i64)
      end
      val_0 = delta
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scaled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_local_x, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_move_local_y : Void* = Pointer(Void).null
    def move_local_y(delta : Float64, scaled : Bool) : Void
      if @@mb_move_local_y.null?
        @@mb_move_local_y = Bridge.get_method_bind("Node2D", "move_local_y", 2087892650_i64)
      end
      val_0 = delta
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scaled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_move_local_y, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_translate : Void* = Pointer(Void).null
    def translate(offset : Vector2) : Void
      if @@mb_translate.null?
        @@mb_translate = Bridge.get_method_bind("Node2D", "translate", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_translate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_global_translate : Void* = Pointer(Void).null
    def global_translate(offset : Vector2) : Void
      if @@mb_global_translate.null?
        @@mb_global_translate = Bridge.get_method_bind("Node2D", "global_translate", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_global_translate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_scale : Void* = Pointer(Void).null
    def apply_scale(ratio : Vector2) : Void
      if @@mb_apply_scale.null?
        @@mb_apply_scale = Bridge.get_method_bind("Node2D", "apply_scale", 743155724_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_global_position : Void* = Pointer(Void).null
    def set_global_position(position : Vector2) : Void
      if @@mb_set_global_position.null?
        @@mb_set_global_position = Bridge.get_method_bind("Node2D", "set_global_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_global_position : Void* = Pointer(Void).null
    def get_global_position() : Vector2
      if @@mb_get_global_position.null?
        @@mb_get_global_position = Bridge.get_method_bind("Node2D", "get_global_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_global_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_global_rotation : Void* = Pointer(Void).null
    def set_global_rotation(radians : Float64) : Void
      if @@mb_set_global_rotation.null?
        @@mb_set_global_rotation = Bridge.get_method_bind("Node2D", "set_global_rotation", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_global_rotation_degrees : Void* = Pointer(Void).null
    def set_global_rotation_degrees(degrees : Float64) : Void
      if @@mb_set_global_rotation_degrees.null?
        @@mb_set_global_rotation_degrees = Bridge.get_method_bind("Node2D", "set_global_rotation_degrees", 373806689_i64)
      end
      val_0 = degrees
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_rotation_degrees, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_global_rotation : Void* = Pointer(Void).null
    def get_global_rotation() : Float64
      if @@mb_get_global_rotation.null?
        @@mb_get_global_rotation = Bridge.get_method_bind("Node2D", "get_global_rotation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_global_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_global_rotation_degrees : Void* = Pointer(Void).null
    def get_global_rotation_degrees() : Float64
      if @@mb_get_global_rotation_degrees.null?
        @@mb_get_global_rotation_degrees = Bridge.get_method_bind("Node2D", "get_global_rotation_degrees", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_global_rotation_degrees, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_global_skew : Void* = Pointer(Void).null
    def set_global_skew(radians : Float64) : Void
      if @@mb_set_global_skew.null?
        @@mb_set_global_skew = Bridge.get_method_bind("Node2D", "set_global_skew", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_skew, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_global_skew : Void* = Pointer(Void).null
    def get_global_skew() : Float64
      if @@mb_get_global_skew.null?
        @@mb_get_global_skew = Bridge.get_method_bind("Node2D", "get_global_skew", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_global_skew, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_global_scale : Void* = Pointer(Void).null
    def set_global_scale(scale : Vector2) : Void
      if @@mb_set_global_scale.null?
        @@mb_set_global_scale = Bridge.get_method_bind("Node2D", "set_global_scale", 743155724_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_global_scale : Void* = Pointer(Void).null
    def get_global_scale() : Vector2
      if @@mb_get_global_scale.null?
        @@mb_get_global_scale = Bridge.get_method_bind("Node2D", "get_global_scale", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_global_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_transform : Void* = Pointer(Void).null
    def set_transform(xform : Transform2D) : Void
      if @@mb_set_transform.null?
        @@mb_set_transform = Bridge.get_method_bind("Node2D", "set_transform", 2761652528_i64)
      end
      val_0 = xform
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_global_transform : Void* = Pointer(Void).null
    def set_global_transform(xform : Transform2D) : Void
      if @@mb_set_global_transform.null?
        @@mb_set_global_transform = Bridge.get_method_bind("Node2D", "set_global_transform", 2761652528_i64)
      end
      val_0 = xform
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_look_at : Void* = Pointer(Void).null
    def look_at(point : Vector2) : Void
      if @@mb_look_at.null?
        @@mb_look_at = Bridge.get_method_bind("Node2D", "look_at", 743155724_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_look_at, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angle_to : Void* = Pointer(Void).null
    def get_angle_to(point : Vector2) : Float64
      if @@mb_get_angle_to.null?
        @@mb_get_angle_to = Bridge.get_method_bind("Node2D", "get_angle_to", 2276447920_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angle_to, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_to_local : Void* = Pointer(Void).null
    def to_local(global_point : Vector2) : Vector2
      if @@mb_to_local.null?
        @@mb_to_local = Bridge.get_method_bind("Node2D", "to_local", 2656412154_i64)
      end
      val_0 = global_point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_to_local, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_to_global : Void* = Pointer(Void).null
    def to_global(local_point : Vector2) : Vector2
      if @@mb_to_global.null?
        @@mb_to_global = Bridge.get_method_bind("Node2D", "to_global", 2656412154_i64)
      end
      val_0 = local_point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_to_global, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_relative_transform_to_parent : Void* = Pointer(Void).null
    def get_relative_transform_to_parent(parent : Node) : Transform2D
      if @@mb_get_relative_transform_to_parent.null?
        @@mb_get_relative_transform_to_parent = Bridge.get_method_bind("Node2D", "get_relative_transform_to_parent", 904556875_i64)
      end
      arg_ptr_0 = parent ? parent.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_relative_transform_to_parent, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
  end
  class CollisionObject2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum DisableMode : Int64
      DisableModeRemove = 0_i64
      DisableModeMakeStatic = 1_i64
      DisableModeKeepActive = 2_i64
    end
    @@mb_get_rid : Void* = Pointer(Void).null
    def get_rid() : Int64
      if @@mb_get_rid.null?
        @@mb_get_rid = Bridge.get_method_bind("CollisionObject2D", "get_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_layer : Void* = Pointer(Void).null
    def set_collision_layer(layer : Int64) : Void
      if @@mb_set_collision_layer.null?
        @@mb_set_collision_layer = Bridge.get_method_bind("CollisionObject2D", "set_collision_layer", 1286410249_i64)
      end
      val_0 = layer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_layer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_layer : Void* = Pointer(Void).null
    def get_collision_layer() : Int64
      if @@mb_get_collision_layer.null?
        @@mb_get_collision_layer = Bridge.get_method_bind("CollisionObject2D", "get_collision_layer", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_layer, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("CollisionObject2D", "set_collision_mask", 1286410249_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("CollisionObject2D", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_layer_value : Void* = Pointer(Void).null
    def set_collision_layer_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_collision_layer_value.null?
        @@mb_set_collision_layer_value = Bridge.get_method_bind("CollisionObject2D", "set_collision_layer_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_collision_layer_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_layer_value : Void* = Pointer(Void).null
    def get_collision_layer_value(layer_number : Int64) : Bool
      if @@mb_get_collision_layer_value.null?
        @@mb_get_collision_layer_value = Bridge.get_method_bind("CollisionObject2D", "get_collision_layer_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_collision_layer_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collision_mask_value : Void* = Pointer(Void).null
    def set_collision_mask_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_collision_mask_value.null?
        @@mb_set_collision_mask_value = Bridge.get_method_bind("CollisionObject2D", "set_collision_mask_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_collision_mask_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask_value : Void* = Pointer(Void).null
    def get_collision_mask_value(layer_number : Int64) : Bool
      if @@mb_get_collision_mask_value.null?
        @@mb_get_collision_mask_value = Bridge.get_method_bind("CollisionObject2D", "get_collision_mask_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_collision_mask_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collision_priority : Void* = Pointer(Void).null
    def set_collision_priority(priority : Float64) : Void
      if @@mb_set_collision_priority.null?
        @@mb_set_collision_priority = Bridge.get_method_bind("CollisionObject2D", "set_collision_priority", 373806689_i64)
      end
      val_0 = priority
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_priority : Void* = Pointer(Void).null
    def get_collision_priority() : Float64
      if @@mb_get_collision_priority.null?
        @@mb_get_collision_priority = Bridge.get_method_bind("CollisionObject2D", "get_collision_priority", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_collision_priority, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_disable_mode : Void* = Pointer(Void).null
    def set_disable_mode(mode : Int64) : Void
      if @@mb_set_disable_mode.null?
        @@mb_set_disable_mode = Bridge.get_method_bind("CollisionObject2D", "set_disable_mode", 1919204045_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_disable_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_disable_mode : Void* = Pointer(Void).null
    def get_disable_mode() : Int64
      if @@mb_get_disable_mode.null?
        @@mb_get_disable_mode = Bridge.get_method_bind("CollisionObject2D", "get_disable_mode", 3172846349_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_disable_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_pickable : Void* = Pointer(Void).null
    def set_pickable(enabled : Bool) : Void
      if @@mb_set_pickable.null?
        @@mb_set_pickable = Bridge.get_method_bind("CollisionObject2D", "set_pickable", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pickable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_pickable : Void* = Pointer(Void).null
    def is_pickable() : Bool
      if @@mb_is_pickable.null?
        @@mb_is_pickable = Bridge.get_method_bind("CollisionObject2D", "is_pickable", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_pickable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_create_shape_owner : Void* = Pointer(Void).null
    def create_shape_owner(owner : Godot::Object) : Int64
      if @@mb_create_shape_owner.null?
        @@mb_create_shape_owner = Bridge.get_method_bind("CollisionObject2D", "create_shape_owner", 3429307534_i64)
      end
      arg_ptr_0 = owner ? owner.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_create_shape_owner, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_shape_owner : Void* = Pointer(Void).null
    def remove_shape_owner(owner_id : Int64) : Void
      if @@mb_remove_shape_owner.null?
        @@mb_remove_shape_owner = Bridge.get_method_bind("CollisionObject2D", "remove_shape_owner", 1286410249_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_shape_owner, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shape_owners : Void* = Pointer(Void).null
    def get_shape_owners() : Void*
      if @@mb_get_shape_owners.null?
        @@mb_get_shape_owners = Bridge.get_method_bind("CollisionObject2D", "get_shape_owners", 969006518_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_shape_owners, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_shape_owner_set_transform : Void* = Pointer(Void).null
    def shape_owner_set_transform(owner_id : Int64, transform : Transform2D) : Void
      if @@mb_shape_owner_set_transform.null?
        @@mb_shape_owner_set_transform = Bridge.get_method_bind("CollisionObject2D", "shape_owner_set_transform", 30160968_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_owner_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shape_owner_get_transform : Void* = Pointer(Void).null
    def shape_owner_get_transform(owner_id : Int64) : Transform2D
      if @@mb_shape_owner_get_transform.null?
        @@mb_shape_owner_get_transform = Bridge.get_method_bind("CollisionObject2D", "shape_owner_get_transform", 3836996910_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shape_owner_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_shape_owner_get_owner : Void* = Pointer(Void).null
    def shape_owner_get_owner(owner_id : Int64) : Godot::Object
      if @@mb_shape_owner_get_owner.null?
        @@mb_shape_owner_get_owner = Bridge.get_method_bind("CollisionObject2D", "shape_owner_get_owner", 3332903315_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shape_owner_get_owner, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_shape_owner_set_disabled : Void* = Pointer(Void).null
    def shape_owner_set_disabled(owner_id : Int64, disabled : Bool) : Void
      if @@mb_shape_owner_set_disabled.null?
        @@mb_shape_owner_set_disabled = Bridge.get_method_bind("CollisionObject2D", "shape_owner_set_disabled", 300928843_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_owner_set_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shape_owner_disabled : Void* = Pointer(Void).null
    def is_shape_owner_disabled(owner_id : Int64) : Bool
      if @@mb_is_shape_owner_disabled.null?
        @@mb_is_shape_owner_disabled = Bridge.get_method_bind("CollisionObject2D", "is_shape_owner_disabled", 1116898809_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shape_owner_disabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shape_owner_set_one_way_collision : Void* = Pointer(Void).null
    def shape_owner_set_one_way_collision(owner_id : Int64, enable : Bool) : Void
      if @@mb_shape_owner_set_one_way_collision.null?
        @@mb_shape_owner_set_one_way_collision = Bridge.get_method_bind("CollisionObject2D", "shape_owner_set_one_way_collision", 300928843_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_owner_set_one_way_collision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shape_owner_one_way_collision_enabled : Void* = Pointer(Void).null
    def is_shape_owner_one_way_collision_enabled(owner_id : Int64) : Bool
      if @@mb_is_shape_owner_one_way_collision_enabled.null?
        @@mb_is_shape_owner_one_way_collision_enabled = Bridge.get_method_bind("CollisionObject2D", "is_shape_owner_one_way_collision_enabled", 1116898809_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shape_owner_one_way_collision_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_shape_owner_set_one_way_collision_margin : Void* = Pointer(Void).null
    def shape_owner_set_one_way_collision_margin(owner_id : Int64, margin : Float64) : Void
      if @@mb_shape_owner_set_one_way_collision_margin.null?
        @@mb_shape_owner_set_one_way_collision_margin = Bridge.get_method_bind("CollisionObject2D", "shape_owner_set_one_way_collision_margin", 1602489585_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = margin
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_owner_set_one_way_collision_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shape_owner_one_way_collision_margin : Void* = Pointer(Void).null
    def get_shape_owner_one_way_collision_margin(owner_id : Int64) : Float64
      if @@mb_get_shape_owner_one_way_collision_margin.null?
        @@mb_get_shape_owner_one_way_collision_margin = Bridge.get_method_bind("CollisionObject2D", "get_shape_owner_one_way_collision_margin", 2339986948_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_shape_owner_one_way_collision_margin, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_shape_owner_one_way_collision_direction : Void* = Pointer(Void).null
    def get_shape_owner_one_way_collision_direction(owner_id : Int64) : Vector2
      if @@mb_get_shape_owner_one_way_collision_direction.null?
        @@mb_get_shape_owner_one_way_collision_direction = Bridge.get_method_bind("CollisionObject2D", "get_shape_owner_one_way_collision_direction", 2299179447_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_shape_owner_one_way_collision_direction, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shape_owner_set_one_way_collision_direction : Void* = Pointer(Void).null
    def shape_owner_set_one_way_collision_direction(owner_id : Int64, direction : Vector2) : Void
      if @@mb_shape_owner_set_one_way_collision_direction.null?
        @@mb_shape_owner_set_one_way_collision_direction = Bridge.get_method_bind("CollisionObject2D", "shape_owner_set_one_way_collision_direction", 163021252_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = direction
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_owner_set_one_way_collision_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shape_owner_add_shape : Void* = Pointer(Void).null
    def shape_owner_add_shape(owner_id : Int64, shape : Shape2D) : Void
      if @@mb_shape_owner_add_shape.null?
        @@mb_shape_owner_add_shape = Bridge.get_method_bind("CollisionObject2D", "shape_owner_add_shape", 2077425081_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_owner_add_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shape_owner_get_shape_count : Void* = Pointer(Void).null
    def shape_owner_get_shape_count(owner_id : Int64) : Int64
      if @@mb_shape_owner_get_shape_count.null?
        @@mb_shape_owner_get_shape_count = Bridge.get_method_bind("CollisionObject2D", "shape_owner_get_shape_count", 923996154_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shape_owner_get_shape_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shape_owner_get_shape : Void* = Pointer(Void).null
    def shape_owner_get_shape(owner_id : Int64, shape_id : Int64) : Shape2D
      if @@mb_shape_owner_get_shape.null?
        @@mb_shape_owner_get_shape = Bridge.get_method_bind("CollisionObject2D", "shape_owner_get_shape", 3106725749_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shape_owner_get_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Shape2D.new(ret_ptr)
    end
    @@mb_shape_owner_get_shape_index : Void* = Pointer(Void).null
    def shape_owner_get_shape_index(owner_id : Int64, shape_id : Int64) : Int64
      if @@mb_shape_owner_get_shape_index.null?
        @@mb_shape_owner_get_shape_index = Bridge.get_method_bind("CollisionObject2D", "shape_owner_get_shape_index", 3175239445_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shape_owner_get_shape_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shape_owner_remove_shape : Void* = Pointer(Void).null
    def shape_owner_remove_shape(owner_id : Int64, shape_id : Int64) : Void
      if @@mb_shape_owner_remove_shape.null?
        @@mb_shape_owner_remove_shape = Bridge.get_method_bind("CollisionObject2D", "shape_owner_remove_shape", 3937882851_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_owner_remove_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shape_owner_clear_shapes : Void* = Pointer(Void).null
    def shape_owner_clear_shapes(owner_id : Int64) : Void
      if @@mb_shape_owner_clear_shapes.null?
        @@mb_shape_owner_clear_shapes = Bridge.get_method_bind("CollisionObject2D", "shape_owner_clear_shapes", 1286410249_i64)
      end
      val_0 = owner_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_shape_owner_clear_shapes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shape_find_owner : Void* = Pointer(Void).null
    def shape_find_owner(shape_index : Int64) : Int64
      if @@mb_shape_find_owner.null?
        @@mb_shape_find_owner = Bridge.get_method_bind("CollisionObject2D", "shape_find_owner", 923996154_i64)
      end
      val_0 = shape_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shape_find_owner, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  class PhysicsBody2D < Godot::CollisionObject2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_move_and_collide : Void* = Pointer(Void).null
    def move_and_collide(motion : Vector2, test_only : Bool, safe_margin : Float64, recovery_as_collision : Bool) : KinematicCollision2D
      if @@mb_move_and_collide.null?
        @@mb_move_and_collide = Bridge.get_method_bind("PhysicsBody2D", "move_and_collide", 3681923724_i64)
      end
      val_0 = motion
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = test_only
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = safe_margin
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = recovery_as_collision
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_move_and_collide, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      KinematicCollision2D.new(ret_ptr)
    end
    @@mb_test_move : Void* = Pointer(Void).null
    def test_move(from : Transform2D, motion : Vector2, collision : KinematicCollision2D, safe_margin : Float64, recovery_as_collision : Bool) : Bool
      if @@mb_test_move.null?
        @@mb_test_move = Bridge.get_method_bind("PhysicsBody2D", "test_move", 3324464701_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = motion
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = collision
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = safe_margin
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = recovery_as_collision
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_u8
      Bridge.ptrcall(@@mb_test_move, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_gravity : Void* = Pointer(Void).null
    def get_gravity() : Vector2
      if @@mb_get_gravity.null?
        @@mb_get_gravity = Bridge.get_method_bind("PhysicsBody2D", "get_gravity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_gravity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_exceptions : Void* = Pointer(Void).null
    def get_collision_exceptions() : Godot::Array
      if @@mb_get_collision_exceptions.null?
        @@mb_get_collision_exceptions = Bridge.get_method_bind("PhysicsBody2D", "get_collision_exceptions", 2915620761_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_collision_exceptions, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_add_collision_exception_with : Void* = Pointer(Void).null
    def add_collision_exception_with(body : Node) : Void
      if @@mb_add_collision_exception_with.null?
        @@mb_add_collision_exception_with = Bridge.get_method_bind("PhysicsBody2D", "add_collision_exception_with", 1078189570_i64)
      end
      arg_ptr_0 = body ? body.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_collision_exception_with, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_collision_exception_with : Void* = Pointer(Void).null
    def remove_collision_exception_with(body : Node) : Void
      if @@mb_remove_collision_exception_with.null?
        @@mb_remove_collision_exception_with = Bridge.get_method_bind("PhysicsBody2D", "remove_collision_exception_with", 1078189570_i64)
      end
      arg_ptr_0 = body ? body.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_collision_exception_with, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class StaticBody2D < Godot::PhysicsBody2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_constant_linear_velocity : Void* = Pointer(Void).null
    def set_constant_linear_velocity(vel : Vector2) : Void
      if @@mb_set_constant_linear_velocity.null?
        @@mb_set_constant_linear_velocity = Bridge.get_method_bind("StaticBody2D", "set_constant_linear_velocity", 743155724_i64)
      end
      val_0 = vel
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant_linear_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_constant_angular_velocity : Void* = Pointer(Void).null
    def set_constant_angular_velocity(vel : Float64) : Void
      if @@mb_set_constant_angular_velocity.null?
        @@mb_set_constant_angular_velocity = Bridge.get_method_bind("StaticBody2D", "set_constant_angular_velocity", 373806689_i64)
      end
      val_0 = vel
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant_angular_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant_linear_velocity : Void* = Pointer(Void).null
    def get_constant_linear_velocity() : Vector2
      if @@mb_get_constant_linear_velocity.null?
        @@mb_get_constant_linear_velocity = Bridge.get_method_bind("StaticBody2D", "get_constant_linear_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_constant_linear_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_constant_angular_velocity : Void* = Pointer(Void).null
    def get_constant_angular_velocity() : Float64
      if @@mb_get_constant_angular_velocity.null?
        @@mb_get_constant_angular_velocity = Bridge.get_method_bind("StaticBody2D", "get_constant_angular_velocity", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_constant_angular_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_physics_material_override : Void* = Pointer(Void).null
    def set_physics_material_override(physics_material_override : PhysicsMaterial) : Void
      if @@mb_set_physics_material_override.null?
        @@mb_set_physics_material_override = Bridge.get_method_bind("StaticBody2D", "set_physics_material_override", 1784508650_i64)
      end
      val_0 = physics_material_override
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physics_material_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_physics_material_override : Void* = Pointer(Void).null
    def get_physics_material_override() : PhysicsMaterial
      if @@mb_get_physics_material_override.null?
        @@mb_get_physics_material_override = Bridge.get_method_bind("StaticBody2D", "get_physics_material_override", 2521850424_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_physics_material_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PhysicsMaterial.new(ret_ptr)
    end
  end
  class AnimatableBody2D < Godot::StaticBody2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_sync_to_physics : Void* = Pointer(Void).null
    def set_sync_to_physics(enable : Bool) : Void
      if @@mb_set_sync_to_physics.null?
        @@mb_set_sync_to_physics = Bridge.get_method_bind("AnimatableBody2D", "set_sync_to_physics", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_sync_to_physics, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_sync_to_physics_enabled : Void* = Pointer(Void).null
    def is_sync_to_physics_enabled() : Bool
      if @@mb_is_sync_to_physics_enabled.null?
        @@mb_is_sync_to_physics_enabled = Bridge.get_method_bind("AnimatableBody2D", "is_sync_to_physics_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_sync_to_physics_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class AnimatedSprite2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_sprite_frames : Void* = Pointer(Void).null
    def set_sprite_frames(sprite_frames : SpriteFrames) : Void
      if @@mb_set_sprite_frames.null?
        @@mb_set_sprite_frames = Bridge.get_method_bind("AnimatedSprite2D", "set_sprite_frames", 905781144_i64)
      end
      val_0 = sprite_frames
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_sprite_frames, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_sprite_frames : Void* = Pointer(Void).null
    def get_sprite_frames() : SpriteFrames
      if @@mb_get_sprite_frames.null?
        @@mb_get_sprite_frames = Bridge.get_method_bind("AnimatedSprite2D", "get_sprite_frames", 3804851214_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_sprite_frames, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      SpriteFrames.new(ret_ptr)
    end
    @@mb_set_animation : Void* = Pointer(Void).null
    def set_animation(name : String) : Void
      if @@mb_set_animation.null?
        @@mb_set_animation = Bridge.get_method_bind("AnimatedSprite2D", "set_animation", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_animation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_animation : Void* = Pointer(Void).null
    def get_animation() : String
      if @@mb_get_animation.null?
        @@mb_get_animation = Bridge.get_method_bind("AnimatedSprite2D", "get_animation", 2002593661_i64)
      end
      ""
    end
    @@mb_set_autoplay : Void* = Pointer(Void).null
    def set_autoplay(name : String) : Void
      if @@mb_set_autoplay.null?
        @@mb_set_autoplay = Bridge.get_method_bind("AnimatedSprite2D", "set_autoplay", 83702148_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autoplay, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autoplay : Void* = Pointer(Void).null
    def get_autoplay() : String
      if @@mb_get_autoplay.null?
        @@mb_get_autoplay = Bridge.get_method_bind("AnimatedSprite2D", "get_autoplay", 201670096_i64)
      end
      ""
    end
    @@mb_is_playing : Void* = Pointer(Void).null
    def is_playing() : Bool
      if @@mb_is_playing.null?
        @@mb_is_playing = Bridge.get_method_bind("AnimatedSprite2D", "is_playing", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_playing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_play : Void* = Pointer(Void).null
    def play(name : String, custom_speed : Float64, from_end : Bool) : Void
      if @@mb_play.null?
        @@mb_play = Bridge.get_method_bind("AnimatedSprite2D", "play", 3269405555_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = custom_speed
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_end
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_play, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_play_backwards : Void* = Pointer(Void).null
    def play_backwards(name : String) : Void
      if @@mb_play_backwards.null?
        @@mb_play_backwards = Bridge.get_method_bind("AnimatedSprite2D", "play_backwards", 3323268493_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_play_backwards, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_pause : Void* = Pointer(Void).null
    def pause() : Void
      if @@mb_pause.null?
        @@mb_pause = Bridge.get_method_bind("AnimatedSprite2D", "pause", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_pause, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_stop : Void* = Pointer(Void).null
    def stop() : Void
      if @@mb_stop.null?
        @@mb_stop = Bridge.get_method_bind("AnimatedSprite2D", "stop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_stop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_centered : Void* = Pointer(Void).null
    def set_centered(centered : Bool) : Void
      if @@mb_set_centered.null?
        @@mb_set_centered = Bridge.get_method_bind("AnimatedSprite2D", "set_centered", 2586408642_i64)
      end
      val_0 = centered
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_centered, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_centered : Void* = Pointer(Void).null
    def is_centered() : Bool
      if @@mb_is_centered.null?
        @@mb_is_centered = Bridge.get_method_bind("AnimatedSprite2D", "is_centered", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_centered, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_offset : Void* = Pointer(Void).null
    def set_offset(offset : Vector2) : Void
      if @@mb_set_offset.null?
        @@mb_set_offset = Bridge.get_method_bind("AnimatedSprite2D", "set_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset : Void* = Pointer(Void).null
    def get_offset() : Vector2
      if @@mb_get_offset.null?
        @@mb_get_offset = Bridge.get_method_bind("AnimatedSprite2D", "get_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_flip_h : Void* = Pointer(Void).null
    def set_flip_h(flip_h : Bool) : Void
      if @@mb_set_flip_h.null?
        @@mb_set_flip_h = Bridge.get_method_bind("AnimatedSprite2D", "set_flip_h", 2586408642_i64)
      end
      val_0 = flip_h
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flip_h, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flipped_h : Void* = Pointer(Void).null
    def is_flipped_h() : Bool
      if @@mb_is_flipped_h.null?
        @@mb_is_flipped_h = Bridge.get_method_bind("AnimatedSprite2D", "is_flipped_h", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flipped_h, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_flip_v : Void* = Pointer(Void).null
    def set_flip_v(flip_v : Bool) : Void
      if @@mb_set_flip_v.null?
        @@mb_set_flip_v = Bridge.get_method_bind("AnimatedSprite2D", "set_flip_v", 2586408642_i64)
      end
      val_0 = flip_v
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flip_v, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flipped_v : Void* = Pointer(Void).null
    def is_flipped_v() : Bool
      if @@mb_is_flipped_v.null?
        @@mb_is_flipped_v = Bridge.get_method_bind("AnimatedSprite2D", "is_flipped_v", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flipped_v, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_frame : Void* = Pointer(Void).null
    def set_frame(frame : Int64) : Void
      if @@mb_set_frame.null?
        @@mb_set_frame = Bridge.get_method_bind("AnimatedSprite2D", "set_frame", 1286410249_i64)
      end
      val_0 = frame
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_frame : Void* = Pointer(Void).null
    def get_frame() : Int64
      if @@mb_get_frame.null?
        @@mb_get_frame = Bridge.get_method_bind("AnimatedSprite2D", "get_frame", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_frame, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_frame_progress : Void* = Pointer(Void).null
    def set_frame_progress(progress : Float64) : Void
      if @@mb_set_frame_progress.null?
        @@mb_set_frame_progress = Bridge.get_method_bind("AnimatedSprite2D", "set_frame_progress", 373806689_i64)
      end
      val_0 = progress
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_frame_progress, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_frame_progress : Void* = Pointer(Void).null
    def get_frame_progress() : Float64
      if @@mb_get_frame_progress.null?
        @@mb_get_frame_progress = Bridge.get_method_bind("AnimatedSprite2D", "get_frame_progress", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_frame_progress, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_frame_and_progress : Void* = Pointer(Void).null
    def set_frame_and_progress(frame : Int64, progress : Float64) : Void
      if @@mb_set_frame_and_progress.null?
        @@mb_set_frame_and_progress = Bridge.get_method_bind("AnimatedSprite2D", "set_frame_and_progress", 1602489585_i64)
      end
      val_0 = frame
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = progress
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_frame_and_progress, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_speed_scale : Void* = Pointer(Void).null
    def set_speed_scale(speed_scale : Float64) : Void
      if @@mb_set_speed_scale.null?
        @@mb_set_speed_scale = Bridge.get_method_bind("AnimatedSprite2D", "set_speed_scale", 373806689_i64)
      end
      val_0 = speed_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_speed_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_speed_scale : Void* = Pointer(Void).null
    def get_speed_scale() : Float64
      if @@mb_get_speed_scale.null?
        @@mb_get_speed_scale = Bridge.get_method_bind("AnimatedSprite2D", "get_speed_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_speed_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_playing_speed : Void* = Pointer(Void).null
    def get_playing_speed() : Float64
      if @@mb_get_playing_speed.null?
        @@mb_get_playing_speed = Bridge.get_method_bind("AnimatedSprite2D", "get_playing_speed", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_playing_speed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Texture2D < Godot::Texture
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_format : Void* = Pointer(Void).null
    def get_format() : Int64
      if @@mb_get_format.null?
        @@mb_get_format = Bridge.get_method_bind("Texture2D", "get_format", 3847873762_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_format, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_mipmap_count : Void* = Pointer(Void).null
    def get_mipmap_count() : Int64
      if @@mb_get_mipmap_count.null?
        @@mb_get_mipmap_count = Bridge.get_method_bind("Texture2D", "get_mipmap_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_mipmap_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_width : Void* = Pointer(Void).null
    def get_width() : Int64
      if @@mb_get_width.null?
        @@mb_get_width = Bridge.get_method_bind("Texture2D", "get_width", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_height : Void* = Pointer(Void).null
    def get_height() : Int64
      if @@mb_get_height.null?
        @@mb_get_height = Bridge.get_method_bind("Texture2D", "get_height", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_size : Void* = Pointer(Void).null
    def get_size() : Vector2
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("Texture2D", "get_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_alpha : Void* = Pointer(Void).null
    def has_alpha() : Bool
      if @@mb_has_alpha.null?
        @@mb_has_alpha = Bridge.get_method_bind("Texture2D", "has_alpha", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_alpha, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_mipmaps : Void* = Pointer(Void).null
    def has_mipmaps() : Bool
      if @@mb_has_mipmaps.null?
        @@mb_has_mipmaps = Bridge.get_method_bind("Texture2D", "has_mipmaps", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_mipmaps, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_draw : Void* = Pointer(Void).null
    def draw(canvas_item : Int64, position : Vector2, modulate : Color, transpose : Bool) : Void
      if @@mb_draw.null?
        @@mb_draw = Bridge.get_method_bind("Texture2D", "draw", 2729649137_i64)
      end
      val_0 = canvas_item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = modulate
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = transpose
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_draw, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_draw_rect : Void* = Pointer(Void).null
    def draw_rect(canvas_item : Int64, rect : Rect2, tile : Bool, modulate : Color, transpose : Bool) : Void
      if @@mb_draw_rect.null?
        @@mb_draw_rect = Bridge.get_method_bind("Texture2D", "draw_rect", 3499451691_i64)
      end
      val_0 = canvas_item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = tile
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = modulate
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = transpose
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_draw_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_draw_rect_region : Void* = Pointer(Void).null
    def draw_rect_region(canvas_item : Int64, rect : Rect2, src_rect : Rect2, modulate : Color, transpose : Bool, clip_uv : Bool) : Void
      if @@mb_draw_rect_region.null?
        @@mb_draw_rect_region = Bridge.get_method_bind("Texture2D", "draw_rect_region", 2963678660_i64)
      end
      val_0 = canvas_item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rect
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = src_rect
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = modulate
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = transpose
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = clip_uv
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_draw_rect_region, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_image : Void* = Pointer(Void).null
    def get_image() : Image
      if @@mb_get_image.null?
        @@mb_get_image = Bridge.get_method_bind("Texture2D", "get_image", 4190603485_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_image, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Image.new(ret_ptr)
    end
    @@mb_create_placeholder : Void* = Pointer(Void).null
    def create_placeholder() : Resource
      if @@mb_create_placeholder.null?
        @@mb_create_placeholder = Bridge.get_method_bind("Texture2D", "create_placeholder", 121922552_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_placeholder, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Resource.new(ret_ptr)
    end
  end
  class AnimationNodeBlendSpace2D < Godot::AnimationRootNode
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum BlendMode : Int64
      BlendModeInterpolated = 0_i64
      BlendModeDiscrete = 1_i64
      BlendModeDiscreteCarry = 2_i64
    end
    enum SyncMode : Int64
      SyncModeNone = 0_i64
      SyncModeIndependent = 1_i64
      SyncModeCyclicMutable = 2_i64
      SyncModeCyclicConstant = 3_i64
    end
    @@mb_add_blend_point : Void* = Pointer(Void).null
    def add_blend_point(node : AnimationRootNode, pos : Vector2, at_index : Int64, name : String) : Void
      if @@mb_add_blend_point.null?
        @@mb_add_blend_point = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "add_blend_point", 768750458_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = at_index
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = name
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_add_blend_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_blend_point_position : Void* = Pointer(Void).null
    def set_blend_point_position(point : Int64, pos : Vector2) : Void
      if @@mb_set_blend_point_position.null?
        @@mb_set_blend_point_position = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_blend_point_position", 163021252_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = pos
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_blend_point_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_blend_point_position : Void* = Pointer(Void).null
    def get_blend_point_position(point : Int64) : Vector2
      if @@mb_get_blend_point_position.null?
        @@mb_get_blend_point_position = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_blend_point_position", 2299179447_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_blend_point_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_blend_point_node : Void* = Pointer(Void).null
    def set_blend_point_node(point : Int64, node : AnimationRootNode) : Void
      if @@mb_set_blend_point_node.null?
        @@mb_set_blend_point_node = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_blend_point_node", 4240341528_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = node
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_blend_point_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_blend_point_node : Void* = Pointer(Void).null
    def get_blend_point_node(point : Int64) : AnimationRootNode
      if @@mb_get_blend_point_node.null?
        @@mb_get_blend_point_node = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_blend_point_node", 665599029_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_blend_point_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      AnimationRootNode.new(ret_ptr)
    end
    @@mb_set_blend_point_name : Void* = Pointer(Void).null
    def set_blend_point_name(point : Int64, name : String) : Void
      if @@mb_set_blend_point_name.null?
        @@mb_set_blend_point_name = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_blend_point_name", 3780747571_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = name
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_blend_point_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_blend_point_name : Void* = Pointer(Void).null
    def get_blend_point_name(point : Int64) : String
      if @@mb_get_blend_point_name.null?
        @@mb_get_blend_point_name = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_blend_point_name", 659327637_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ""
    end
    @@mb_find_blend_point_by_name : Void* = Pointer(Void).null
    def find_blend_point_by_name(name : String) : Int64
      if @@mb_find_blend_point_by_name.null?
        @@mb_find_blend_point_by_name = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "find_blend_point_by_name", 2458036349_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_find_blend_point_by_name, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_blend_point : Void* = Pointer(Void).null
    def remove_blend_point(point : Int64) : Void
      if @@mb_remove_blend_point.null?
        @@mb_remove_blend_point = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "remove_blend_point", 1286410249_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_blend_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_blend_point_count : Void* = Pointer(Void).null
    def get_blend_point_count() : Int64
      if @@mb_get_blend_point_count.null?
        @@mb_get_blend_point_count = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_blend_point_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_blend_point_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_reorder_blend_point : Void* = Pointer(Void).null
    def reorder_blend_point(from_index : Int64, to_index : Int64) : Void
      if @@mb_reorder_blend_point.null?
        @@mb_reorder_blend_point = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "reorder_blend_point", 3937882851_i64)
      end
      val_0 = from_index
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_reorder_blend_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_triangle : Void* = Pointer(Void).null
    def add_triangle(x : Int64, y : Int64, z : Int64, at_index : Int64) : Void
      if @@mb_add_triangle.null?
        @@mb_add_triangle = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "add_triangle", 753017335_i64)
      end
      val_0 = x
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = y
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = z
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = at_index
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_add_triangle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_triangle_point : Void* = Pointer(Void).null
    def get_triangle_point(triangle : Int64, point : Int64) : Int64
      if @@mb_get_triangle_point.null?
        @@mb_get_triangle_point = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_triangle_point", 50157827_i64)
      end
      val_0 = triangle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = point
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_triangle_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_triangle : Void* = Pointer(Void).null
    def remove_triangle(triangle : Int64) : Void
      if @@mb_remove_triangle.null?
        @@mb_remove_triangle = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "remove_triangle", 1286410249_i64)
      end
      val_0 = triangle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_triangle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_triangle_count : Void* = Pointer(Void).null
    def get_triangle_count() : Int64
      if @@mb_get_triangle_count.null?
        @@mb_get_triangle_count = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_triangle_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_triangle_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_min_space : Void* = Pointer(Void).null
    def set_min_space(min_space : Vector2) : Void
      if @@mb_set_min_space.null?
        @@mb_set_min_space = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_min_space", 743155724_i64)
      end
      val_0 = min_space
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_min_space, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_min_space : Void* = Pointer(Void).null
    def get_min_space() : Vector2
      if @@mb_get_min_space.null?
        @@mb_get_min_space = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_min_space", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_min_space, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_space : Void* = Pointer(Void).null
    def set_max_space(max_space : Vector2) : Void
      if @@mb_set_max_space.null?
        @@mb_set_max_space = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_max_space", 743155724_i64)
      end
      val_0 = max_space
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_space, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_space : Void* = Pointer(Void).null
    def get_max_space() : Vector2
      if @@mb_get_max_space.null?
        @@mb_get_max_space = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_max_space", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_max_space, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_snap : Void* = Pointer(Void).null
    def set_snap(snap : Vector2) : Void
      if @@mb_set_snap.null?
        @@mb_set_snap = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_snap", 743155724_i64)
      end
      val_0 = snap
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_snap, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_snap : Void* = Pointer(Void).null
    def get_snap() : Vector2
      if @@mb_get_snap.null?
        @@mb_get_snap = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_snap", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_snap, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_x_label : Void* = Pointer(Void).null
    def set_x_label(text : String) : Void
      if @@mb_set_x_label.null?
        @@mb_set_x_label = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_x_label", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_x_label, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_x_label : Void* = Pointer(Void).null
    def get_x_label() : String
      if @@mb_get_x_label.null?
        @@mb_get_x_label = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_x_label", 201670096_i64)
      end
      ""
    end
    @@mb_set_y_label : Void* = Pointer(Void).null
    def set_y_label(text : String) : Void
      if @@mb_set_y_label.null?
        @@mb_set_y_label = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_y_label", 83702148_i64)
      end
      val_0 = text
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_y_label, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_y_label : Void* = Pointer(Void).null
    def get_y_label() : String
      if @@mb_get_y_label.null?
        @@mb_get_y_label = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_y_label", 201670096_i64)
      end
      ""
    end
    @@mb_set_auto_triangles : Void* = Pointer(Void).null
    def set_auto_triangles(enable : Bool) : Void
      if @@mb_set_auto_triangles.null?
        @@mb_set_auto_triangles = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_auto_triangles", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_triangles, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_auto_triangles : Void* = Pointer(Void).null
    def get_auto_triangles() : Bool
      if @@mb_get_auto_triangles.null?
        @@mb_get_auto_triangles = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_auto_triangles", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_auto_triangles, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_blend_mode : Void* = Pointer(Void).null
    def set_blend_mode(mode : Int64) : Void
      if @@mb_set_blend_mode.null?
        @@mb_set_blend_mode = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_blend_mode", 81193520_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_blend_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_blend_mode : Void* = Pointer(Void).null
    def get_blend_mode() : Int64
      if @@mb_get_blend_mode.null?
        @@mb_get_blend_mode = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_blend_mode", 1398433632_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_blend_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_sync : Void* = Pointer(Void).null
    def set_use_sync(enable : Bool) : Void
      if @@mb_set_use_sync.null?
        @@mb_set_use_sync = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_use_sync", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_sync, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_using_sync : Void* = Pointer(Void).null
    def is_using_sync() : Bool
      if @@mb_is_using_sync.null?
        @@mb_is_using_sync = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "is_using_sync", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_using_sync, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_sync_mode : Void* = Pointer(Void).null
    def set_sync_mode(sync_mode : Int64) : Void
      if @@mb_set_sync_mode.null?
        @@mb_set_sync_mode = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_sync_mode", 2615784488_i64)
      end
      val_0 = sync_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_sync_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_sync_mode : Void* = Pointer(Void).null
    def get_sync_mode() : Int64
      if @@mb_get_sync_mode.null?
        @@mb_get_sync_mode = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_sync_mode", 242032665_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_sync_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_cyclic_length : Void* = Pointer(Void).null
    def set_cyclic_length(length : Float64) : Void
      if @@mb_set_cyclic_length.null?
        @@mb_set_cyclic_length = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "set_cyclic_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cyclic_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_cyclic_length : Void* = Pointer(Void).null
    def get_cyclic_length() : Float64
      if @@mb_get_cyclic_length.null?
        @@mb_get_cyclic_length = Bridge.get_method_bind("AnimationNodeBlendSpace2D", "get_cyclic_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_cyclic_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Area2D < Godot::CollisionObject2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum SpaceOverride : Int64
      SpaceOverrideDisabled = 0_i64
      SpaceOverrideCombine = 1_i64
      SpaceOverrideCombineReplace = 2_i64
      SpaceOverrideReplace = 3_i64
      SpaceOverrideReplaceCombine = 4_i64
    end
    @@mb_set_gravity_space_override_mode : Void* = Pointer(Void).null
    def set_gravity_space_override_mode(space_override_mode : Int64) : Void
      if @@mb_set_gravity_space_override_mode.null?
        @@mb_set_gravity_space_override_mode = Bridge.get_method_bind("Area2D", "set_gravity_space_override_mode", 2879900038_i64)
      end
      val_0 = space_override_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity_space_override_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gravity_space_override_mode : Void* = Pointer(Void).null
    def get_gravity_space_override_mode() : Int64
      if @@mb_get_gravity_space_override_mode.null?
        @@mb_get_gravity_space_override_mode = Bridge.get_method_bind("Area2D", "get_gravity_space_override_mode", 3990256304_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_gravity_space_override_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gravity_is_point : Void* = Pointer(Void).null
    def set_gravity_is_point(enable : Bool) : Void
      if @@mb_set_gravity_is_point.null?
        @@mb_set_gravity_is_point = Bridge.get_method_bind("Area2D", "set_gravity_is_point", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity_is_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_gravity_a_point : Void* = Pointer(Void).null
    def is_gravity_a_point() : Bool
      if @@mb_is_gravity_a_point.null?
        @@mb_is_gravity_a_point = Bridge.get_method_bind("Area2D", "is_gravity_a_point", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_gravity_a_point, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_gravity_point_unit_distance : Void* = Pointer(Void).null
    def set_gravity_point_unit_distance(distance_scale : Float64) : Void
      if @@mb_set_gravity_point_unit_distance.null?
        @@mb_set_gravity_point_unit_distance = Bridge.get_method_bind("Area2D", "set_gravity_point_unit_distance", 373806689_i64)
      end
      val_0 = distance_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity_point_unit_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gravity_point_unit_distance : Void* = Pointer(Void).null
    def get_gravity_point_unit_distance() : Float64
      if @@mb_get_gravity_point_unit_distance.null?
        @@mb_get_gravity_point_unit_distance = Bridge.get_method_bind("Area2D", "get_gravity_point_unit_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_gravity_point_unit_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gravity_point_center : Void* = Pointer(Void).null
    def set_gravity_point_center(center : Vector2) : Void
      if @@mb_set_gravity_point_center.null?
        @@mb_set_gravity_point_center = Bridge.get_method_bind("Area2D", "set_gravity_point_center", 743155724_i64)
      end
      val_0 = center
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity_point_center, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gravity_point_center : Void* = Pointer(Void).null
    def get_gravity_point_center() : Vector2
      if @@mb_get_gravity_point_center.null?
        @@mb_get_gravity_point_center = Bridge.get_method_bind("Area2D", "get_gravity_point_center", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_gravity_point_center, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gravity_direction : Void* = Pointer(Void).null
    def set_gravity_direction(direction : Vector2) : Void
      if @@mb_set_gravity_direction.null?
        @@mb_set_gravity_direction = Bridge.get_method_bind("Area2D", "set_gravity_direction", 743155724_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gravity_direction : Void* = Pointer(Void).null
    def get_gravity_direction() : Vector2
      if @@mb_get_gravity_direction.null?
        @@mb_get_gravity_direction = Bridge.get_method_bind("Area2D", "get_gravity_direction", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_gravity_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gravity : Void* = Pointer(Void).null
    def set_gravity(gravity : Float64) : Void
      if @@mb_set_gravity.null?
        @@mb_set_gravity = Bridge.get_method_bind("Area2D", "set_gravity", 373806689_i64)
      end
      val_0 = gravity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gravity : Void* = Pointer(Void).null
    def get_gravity() : Float64
      if @@mb_get_gravity.null?
        @@mb_get_gravity = Bridge.get_method_bind("Area2D", "get_gravity", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_gravity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_linear_damp_space_override_mode : Void* = Pointer(Void).null
    def set_linear_damp_space_override_mode(space_override_mode : Int64) : Void
      if @@mb_set_linear_damp_space_override_mode.null?
        @@mb_set_linear_damp_space_override_mode = Bridge.get_method_bind("Area2D", "set_linear_damp_space_override_mode", 2879900038_i64)
      end
      val_0 = space_override_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_linear_damp_space_override_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_linear_damp_space_override_mode : Void* = Pointer(Void).null
    def get_linear_damp_space_override_mode() : Int64
      if @@mb_get_linear_damp_space_override_mode.null?
        @@mb_get_linear_damp_space_override_mode = Bridge.get_method_bind("Area2D", "get_linear_damp_space_override_mode", 3990256304_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_linear_damp_space_override_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_damp_space_override_mode : Void* = Pointer(Void).null
    def set_angular_damp_space_override_mode(space_override_mode : Int64) : Void
      if @@mb_set_angular_damp_space_override_mode.null?
        @@mb_set_angular_damp_space_override_mode = Bridge.get_method_bind("Area2D", "set_angular_damp_space_override_mode", 2879900038_i64)
      end
      val_0 = space_override_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_damp_space_override_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_damp_space_override_mode : Void* = Pointer(Void).null
    def get_angular_damp_space_override_mode() : Int64
      if @@mb_get_angular_damp_space_override_mode.null?
        @@mb_get_angular_damp_space_override_mode = Bridge.get_method_bind("Area2D", "get_angular_damp_space_override_mode", 3990256304_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_angular_damp_space_override_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_linear_damp : Void* = Pointer(Void).null
    def set_linear_damp(linear_damp : Float64) : Void
      if @@mb_set_linear_damp.null?
        @@mb_set_linear_damp = Bridge.get_method_bind("Area2D", "set_linear_damp", 373806689_i64)
      end
      val_0 = linear_damp
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_linear_damp, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_linear_damp : Void* = Pointer(Void).null
    def get_linear_damp() : Float64
      if @@mb_get_linear_damp.null?
        @@mb_get_linear_damp = Bridge.get_method_bind("Area2D", "get_linear_damp", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_linear_damp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_damp : Void* = Pointer(Void).null
    def set_angular_damp(angular_damp : Float64) : Void
      if @@mb_set_angular_damp.null?
        @@mb_set_angular_damp = Bridge.get_method_bind("Area2D", "set_angular_damp", 373806689_i64)
      end
      val_0 = angular_damp
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_damp, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_damp : Void* = Pointer(Void).null
    def get_angular_damp() : Float64
      if @@mb_get_angular_damp.null?
        @@mb_get_angular_damp = Bridge.get_method_bind("Area2D", "get_angular_damp", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angular_damp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_priority : Void* = Pointer(Void).null
    def set_priority(priority : Int64) : Void
      if @@mb_set_priority.null?
        @@mb_set_priority = Bridge.get_method_bind("Area2D", "set_priority", 1286410249_i64)
      end
      val_0 = priority
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_priority : Void* = Pointer(Void).null
    def get_priority() : Int64
      if @@mb_get_priority.null?
        @@mb_get_priority = Bridge.get_method_bind("Area2D", "get_priority", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_priority, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_monitoring : Void* = Pointer(Void).null
    def set_monitoring(enable : Bool) : Void
      if @@mb_set_monitoring.null?
        @@mb_set_monitoring = Bridge.get_method_bind("Area2D", "set_monitoring", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_monitoring, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_monitoring : Void* = Pointer(Void).null
    def is_monitoring() : Bool
      if @@mb_is_monitoring.null?
        @@mb_is_monitoring = Bridge.get_method_bind("Area2D", "is_monitoring", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_monitoring, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_monitorable : Void* = Pointer(Void).null
    def set_monitorable(enable : Bool) : Void
      if @@mb_set_monitorable.null?
        @@mb_set_monitorable = Bridge.get_method_bind("Area2D", "set_monitorable", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_monitorable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_monitorable : Void* = Pointer(Void).null
    def is_monitorable() : Bool
      if @@mb_is_monitorable.null?
        @@mb_is_monitorable = Bridge.get_method_bind("Area2D", "is_monitorable", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_monitorable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_overlapping_bodies : Void* = Pointer(Void).null
    def get_overlapping_bodies() : Godot::Array
      if @@mb_get_overlapping_bodies.null?
        @@mb_get_overlapping_bodies = Bridge.get_method_bind("Area2D", "get_overlapping_bodies", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_overlapping_bodies, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_overlapping_areas : Void* = Pointer(Void).null
    def get_overlapping_areas() : Godot::Array
      if @@mb_get_overlapping_areas.null?
        @@mb_get_overlapping_areas = Bridge.get_method_bind("Area2D", "get_overlapping_areas", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_overlapping_areas, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_has_overlapping_bodies : Void* = Pointer(Void).null
    def has_overlapping_bodies() : Bool
      if @@mb_has_overlapping_bodies.null?
        @@mb_has_overlapping_bodies = Bridge.get_method_bind("Area2D", "has_overlapping_bodies", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_overlapping_bodies, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_has_overlapping_areas : Void* = Pointer(Void).null
    def has_overlapping_areas() : Bool
      if @@mb_has_overlapping_areas.null?
        @@mb_has_overlapping_areas = Bridge.get_method_bind("Area2D", "has_overlapping_areas", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_overlapping_areas, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_overlaps_body : Void* = Pointer(Void).null
    def overlaps_body(body : Node) : Bool
      if @@mb_overlaps_body.null?
        @@mb_overlaps_body = Bridge.get_method_bind("Area2D", "overlaps_body", 3093956946_i64)
      end
      arg_ptr_0 = body ? body.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_overlaps_body, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_overlaps_area : Void* = Pointer(Void).null
    def overlaps_area(area : Node) : Bool
      if @@mb_overlaps_area.null?
        @@mb_overlaps_area = Bridge.get_method_bind("Area2D", "overlaps_area", 3093956946_i64)
      end
      arg_ptr_0 = area ? area.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_overlaps_area, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_audio_bus_name : Void* = Pointer(Void).null
    def set_audio_bus_name(name : String) : Void
      if @@mb_set_audio_bus_name.null?
        @@mb_set_audio_bus_name = Bridge.get_method_bind("Area2D", "set_audio_bus_name", 3304788590_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_audio_bus_name, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_audio_bus_name : Void* = Pointer(Void).null
    def get_audio_bus_name() : String
      if @@mb_get_audio_bus_name.null?
        @@mb_get_audio_bus_name = Bridge.get_method_bind("Area2D", "get_audio_bus_name", 2002593661_i64)
      end
      ""
    end
    @@mb_set_audio_bus_override : Void* = Pointer(Void).null
    def set_audio_bus_override(enable : Bool) : Void
      if @@mb_set_audio_bus_override.null?
        @@mb_set_audio_bus_override = Bridge.get_method_bind("Area2D", "set_audio_bus_override", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_audio_bus_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_overriding_audio_bus : Void* = Pointer(Void).null
    def is_overriding_audio_bus() : Bool
      if @@mb_is_overriding_audio_bus.null?
        @@mb_is_overriding_audio_bus = Bridge.get_method_bind("Area2D", "is_overriding_audio_bus", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_overriding_audio_bus, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class AudioListener2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_make_current : Void* = Pointer(Void).null
    def make_current() : Void
      if @@mb_make_current.null?
        @@mb_make_current = Bridge.get_method_bind("AudioListener2D", "make_current", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_make_current, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_clear_current : Void* = Pointer(Void).null
    def clear_current() : Void
      if @@mb_clear_current.null?
        @@mb_clear_current = Bridge.get_method_bind("AudioListener2D", "clear_current", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_current, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_current : Void* = Pointer(Void).null
    def is_current() : Bool
      if @@mb_is_current.null?
        @@mb_is_current = Bridge.get_method_bind("AudioListener2D", "is_current", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_current, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class AudioStreamPlayer2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_stream : Void* = Pointer(Void).null
    def set_stream(stream : AudioStream) : Void
      if @@mb_set_stream.null?
        @@mb_set_stream = Bridge.get_method_bind("AudioStreamPlayer2D", "set_stream", 2210767741_i64)
      end
      val_0 = stream
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stream, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stream : Void* = Pointer(Void).null
    def get_stream() : AudioStream
      if @@mb_get_stream.null?
        @@mb_get_stream = Bridge.get_method_bind("AudioStreamPlayer2D", "get_stream", 160907539_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_stream, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      AudioStream.new(ret_ptr)
    end
    @@mb_set_volume_db : Void* = Pointer(Void).null
    def set_volume_db(volume_db : Float64) : Void
      if @@mb_set_volume_db.null?
        @@mb_set_volume_db = Bridge.get_method_bind("AudioStreamPlayer2D", "set_volume_db", 373806689_i64)
      end
      val_0 = volume_db
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_volume_db, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_volume_db : Void* = Pointer(Void).null
    def get_volume_db() : Float64
      if @@mb_get_volume_db.null?
        @@mb_get_volume_db = Bridge.get_method_bind("AudioStreamPlayer2D", "get_volume_db", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_volume_db, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_volume_linear : Void* = Pointer(Void).null
    def set_volume_linear(volume_linear : Float64) : Void
      if @@mb_set_volume_linear.null?
        @@mb_set_volume_linear = Bridge.get_method_bind("AudioStreamPlayer2D", "set_volume_linear", 373806689_i64)
      end
      val_0 = volume_linear
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_volume_linear, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_volume_linear : Void* = Pointer(Void).null
    def get_volume_linear() : Float64
      if @@mb_get_volume_linear.null?
        @@mb_get_volume_linear = Bridge.get_method_bind("AudioStreamPlayer2D", "get_volume_linear", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_volume_linear, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_pitch_scale : Void* = Pointer(Void).null
    def set_pitch_scale(pitch_scale : Float64) : Void
      if @@mb_set_pitch_scale.null?
        @@mb_set_pitch_scale = Bridge.get_method_bind("AudioStreamPlayer2D", "set_pitch_scale", 373806689_i64)
      end
      val_0 = pitch_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pitch_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_pitch_scale : Void* = Pointer(Void).null
    def get_pitch_scale() : Float64
      if @@mb_get_pitch_scale.null?
        @@mb_get_pitch_scale = Bridge.get_method_bind("AudioStreamPlayer2D", "get_pitch_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_pitch_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_play : Void* = Pointer(Void).null
    def play(from_position : Float64) : Void
      if @@mb_play.null?
        @@mb_play = Bridge.get_method_bind("AudioStreamPlayer2D", "play", 1958160172_i64)
      end
      val_0 = from_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_play, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_seek : Void* = Pointer(Void).null
    def seek(to_position : Float64) : Void
      if @@mb_seek.null?
        @@mb_seek = Bridge.get_method_bind("AudioStreamPlayer2D", "seek", 373806689_i64)
      end
      val_0 = to_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_seek, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_stop : Void* = Pointer(Void).null
    def stop() : Void
      if @@mb_stop.null?
        @@mb_stop = Bridge.get_method_bind("AudioStreamPlayer2D", "stop", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_stop, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_playing : Void* = Pointer(Void).null
    def is_playing() : Bool
      if @@mb_is_playing.null?
        @@mb_is_playing = Bridge.get_method_bind("AudioStreamPlayer2D", "is_playing", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_playing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_playback_position : Void* = Pointer(Void).null
    def get_playback_position() : Float64
      if @@mb_get_playback_position.null?
        @@mb_get_playback_position = Bridge.get_method_bind("AudioStreamPlayer2D", "get_playback_position", 191475506_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_playback_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bus : Void* = Pointer(Void).null
    def set_bus(bus : String) : Void
      if @@mb_set_bus.null?
        @@mb_set_bus = Bridge.get_method_bind("AudioStreamPlayer2D", "set_bus", 3304788590_i64)
      end
      val_0 = bus
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bus, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bus : Void* = Pointer(Void).null
    def get_bus() : String
      if @@mb_get_bus.null?
        @@mb_get_bus = Bridge.get_method_bind("AudioStreamPlayer2D", "get_bus", 2002593661_i64)
      end
      ""
    end
    @@mb_set_autoplay : Void* = Pointer(Void).null
    def set_autoplay(enable : Bool) : Void
      if @@mb_set_autoplay.null?
        @@mb_set_autoplay = Bridge.get_method_bind("AudioStreamPlayer2D", "set_autoplay", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autoplay, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_autoplay_enabled : Void* = Pointer(Void).null
    def is_autoplay_enabled() : Bool
      if @@mb_is_autoplay_enabled.null?
        @@mb_is_autoplay_enabled = Bridge.get_method_bind("AudioStreamPlayer2D", "is_autoplay_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_autoplay_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_playing : Void* = Pointer(Void).null
    def set_playing(enable : Bool) : Void
      if @@mb_set_playing.null?
        @@mb_set_playing = Bridge.get_method_bind("AudioStreamPlayer2D", "set_playing", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_playing, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_max_distance : Void* = Pointer(Void).null
    def set_max_distance(pixels : Float64) : Void
      if @@mb_set_max_distance.null?
        @@mb_set_max_distance = Bridge.get_method_bind("AudioStreamPlayer2D", "set_max_distance", 373806689_i64)
      end
      val_0 = pixels
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_distance : Void* = Pointer(Void).null
    def get_max_distance() : Float64
      if @@mb_get_max_distance.null?
        @@mb_get_max_distance = Bridge.get_method_bind("AudioStreamPlayer2D", "get_max_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_max_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_attenuation : Void* = Pointer(Void).null
    def set_attenuation(curve : Float64) : Void
      if @@mb_set_attenuation.null?
        @@mb_set_attenuation = Bridge.get_method_bind("AudioStreamPlayer2D", "set_attenuation", 373806689_i64)
      end
      val_0 = curve
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_attenuation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_attenuation : Void* = Pointer(Void).null
    def get_attenuation() : Float64
      if @@mb_get_attenuation.null?
        @@mb_get_attenuation = Bridge.get_method_bind("AudioStreamPlayer2D", "get_attenuation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_attenuation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_area_mask : Void* = Pointer(Void).null
    def set_area_mask(mask : Int64) : Void
      if @@mb_set_area_mask.null?
        @@mb_set_area_mask = Bridge.get_method_bind("AudioStreamPlayer2D", "set_area_mask", 1286410249_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_area_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_area_mask : Void* = Pointer(Void).null
    def get_area_mask() : Int64
      if @@mb_get_area_mask.null?
        @@mb_get_area_mask = Bridge.get_method_bind("AudioStreamPlayer2D", "get_area_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_area_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_stream_paused : Void* = Pointer(Void).null
    def set_stream_paused(pause : Bool) : Void
      if @@mb_set_stream_paused.null?
        @@mb_set_stream_paused = Bridge.get_method_bind("AudioStreamPlayer2D", "set_stream_paused", 2586408642_i64)
      end
      val_0 = pause
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stream_paused, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stream_paused : Void* = Pointer(Void).null
    def get_stream_paused() : Bool
      if @@mb_get_stream_paused.null?
        @@mb_get_stream_paused = Bridge.get_method_bind("AudioStreamPlayer2D", "get_stream_paused", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_stream_paused, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_max_polyphony : Void* = Pointer(Void).null
    def set_max_polyphony(max_polyphony : Int64) : Void
      if @@mb_set_max_polyphony.null?
        @@mb_set_max_polyphony = Bridge.get_method_bind("AudioStreamPlayer2D", "set_max_polyphony", 1286410249_i64)
      end
      val_0 = max_polyphony
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_polyphony, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_polyphony : Void* = Pointer(Void).null
    def get_max_polyphony() : Int64
      if @@mb_get_max_polyphony.null?
        @@mb_get_max_polyphony = Bridge.get_method_bind("AudioStreamPlayer2D", "get_max_polyphony", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_polyphony, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_panning_strength : Void* = Pointer(Void).null
    def set_panning_strength(panning_strength : Float64) : Void
      if @@mb_set_panning_strength.null?
        @@mb_set_panning_strength = Bridge.get_method_bind("AudioStreamPlayer2D", "set_panning_strength", 373806689_i64)
      end
      val_0 = panning_strength
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_panning_strength, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_panning_strength : Void* = Pointer(Void).null
    def get_panning_strength() : Float64
      if @@mb_get_panning_strength.null?
        @@mb_get_panning_strength = Bridge.get_method_bind("AudioStreamPlayer2D", "get_panning_strength", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_panning_strength, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_has_stream_playback : Void* = Pointer(Void).null
    def has_stream_playback() : Bool
      if @@mb_has_stream_playback.null?
        @@mb_has_stream_playback = Bridge.get_method_bind("AudioStreamPlayer2D", "has_stream_playback", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_stream_playback, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_stream_playback : Void* = Pointer(Void).null
    def get_stream_playback() : AudioStreamPlayback
      if @@mb_get_stream_playback.null?
        @@mb_get_stream_playback = Bridge.get_method_bind("AudioStreamPlayer2D", "get_stream_playback", 210135309_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_stream_playback, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      AudioStreamPlayback.new(ret_ptr)
    end
    @@mb_set_playback_type : Void* = Pointer(Void).null
    def set_playback_type(playback_type : Int64) : Void
      if @@mb_set_playback_type.null?
        @@mb_set_playback_type = Bridge.get_method_bind("AudioStreamPlayer2D", "set_playback_type", 725473817_i64)
      end
      val_0 = playback_type
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_playback_type, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_playback_type : Void* = Pointer(Void).null
    def get_playback_type() : Int64
      if @@mb_get_playback_type.null?
        @@mb_get_playback_type = Bridge.get_method_bind("AudioStreamPlayer2D", "get_playback_type", 4011264623_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_playback_type, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Bone2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_rest : Void* = Pointer(Void).null
    def set_rest(rest : Transform2D) : Void
      if @@mb_set_rest.null?
        @@mb_set_rest = Bridge.get_method_bind("Bone2D", "set_rest", 2761652528_i64)
      end
      val_0 = rest
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rest, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_rest : Void* = Pointer(Void).null
    def get_rest() : Transform2D
      if @@mb_get_rest.null?
        @@mb_get_rest = Bridge.get_method_bind("Bone2D", "get_rest", 3814499831_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rest, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_apply_rest : Void* = Pointer(Void).null
    def apply_rest() : Void
      if @@mb_apply_rest.null?
        @@mb_apply_rest = Bridge.get_method_bind("Bone2D", "apply_rest", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_apply_rest, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_skeleton_rest : Void* = Pointer(Void).null
    def get_skeleton_rest() : Transform2D
      if @@mb_get_skeleton_rest.null?
        @@mb_get_skeleton_rest = Bridge.get_method_bind("Bone2D", "get_skeleton_rest", 3814499831_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_skeleton_rest, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_get_index_in_skeleton : Void* = Pointer(Void).null
    def get_index_in_skeleton() : Int64
      if @@mb_get_index_in_skeleton.null?
        @@mb_get_index_in_skeleton = Bridge.get_method_bind("Bone2D", "get_index_in_skeleton", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_index_in_skeleton, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autocalculate_length_and_angle : Void* = Pointer(Void).null
    def set_autocalculate_length_and_angle(auto_calculate : Bool) : Void
      if @@mb_set_autocalculate_length_and_angle.null?
        @@mb_set_autocalculate_length_and_angle = Bridge.get_method_bind("Bone2D", "set_autocalculate_length_and_angle", 2586408642_i64)
      end
      val_0 = auto_calculate
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autocalculate_length_and_angle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autocalculate_length_and_angle : Void* = Pointer(Void).null
    def get_autocalculate_length_and_angle() : Bool
      if @@mb_get_autocalculate_length_and_angle.null?
        @@mb_get_autocalculate_length_and_angle = Bridge.get_method_bind("Bone2D", "get_autocalculate_length_and_angle", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_autocalculate_length_and_angle, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_length : Void* = Pointer(Void).null
    def set_length(length : Float64) : Void
      if @@mb_set_length.null?
        @@mb_set_length = Bridge.get_method_bind("Bone2D", "set_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_length : Void* = Pointer(Void).null
    def get_length() : Float64
      if @@mb_get_length.null?
        @@mb_get_length = Bridge.get_method_bind("Bone2D", "get_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bone_angle : Void* = Pointer(Void).null
    def set_bone_angle(angle : Float64) : Void
      if @@mb_set_bone_angle.null?
        @@mb_set_bone_angle = Bridge.get_method_bind("Bone2D", "set_bone_angle", 373806689_i64)
      end
      val_0 = angle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bone_angle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone_angle : Void* = Pointer(Void).null
    def get_bone_angle() : Float64
      if @@mb_get_bone_angle.null?
        @@mb_get_bone_angle = Bridge.get_method_bind("Bone2D", "get_bone_angle", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bone_angle, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class CPUParticles2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum DrawOrder : Int64
      DrawOrderIndex = 0_i64
      DrawOrderLifetime = 1_i64
    end
    enum Parameter : Int64
      ParamInitialLinearVelocity = 0_i64
      ParamAngularVelocity = 1_i64
      ParamOrbitVelocity = 2_i64
      ParamLinearAccel = 3_i64
      ParamRadialAccel = 4_i64
      ParamTangentialAccel = 5_i64
      ParamDamping = 6_i64
      ParamAngle = 7_i64
      ParamScale = 8_i64
      ParamHueVariation = 9_i64
      ParamAnimSpeed = 10_i64
      ParamAnimOffset = 11_i64
      ParamMax = 12_i64
    end
    enum ParticleFlags : Int64
      ParticleFlagAlignYToVelocity = 0_i64
      ParticleFlagRotateY = 1_i64
      ParticleFlagDisableZ = 2_i64
      ParticleFlagMax = 3_i64
    end
    enum EmissionShape : Int64
      EmissionShapePoint = 0_i64
      EmissionShapeSphere = 1_i64
      EmissionShapeSphereSurface = 2_i64
      EmissionShapeRectangle = 3_i64
      EmissionShapePoints = 4_i64
      EmissionShapeDirectedPoints = 5_i64
      EmissionShapeRing = 6_i64
      EmissionShapeMax = 7_i64
    end
    @@mb_set_emitting : Void* = Pointer(Void).null
    def set_emitting(emitting : Bool) : Void
      if @@mb_set_emitting.null?
        @@mb_set_emitting = Bridge.get_method_bind("CPUParticles2D", "set_emitting", 2586408642_i64)
      end
      val_0 = emitting
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emitting, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_amount : Void* = Pointer(Void).null
    def set_amount(amount : Int64) : Void
      if @@mb_set_amount.null?
        @@mb_set_amount = Bridge.get_method_bind("CPUParticles2D", "set_amount", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_amount, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_lifetime : Void* = Pointer(Void).null
    def set_lifetime(secs : Float64) : Void
      if @@mb_set_lifetime.null?
        @@mb_set_lifetime = Bridge.get_method_bind("CPUParticles2D", "set_lifetime", 373806689_i64)
      end
      val_0 = secs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_lifetime, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_one_shot : Void* = Pointer(Void).null
    def set_one_shot(enable : Bool) : Void
      if @@mb_set_one_shot.null?
        @@mb_set_one_shot = Bridge.get_method_bind("CPUParticles2D", "set_one_shot", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_shot, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_pre_process_time : Void* = Pointer(Void).null
    def set_pre_process_time(secs : Float64) : Void
      if @@mb_set_pre_process_time.null?
        @@mb_set_pre_process_time = Bridge.get_method_bind("CPUParticles2D", "set_pre_process_time", 373806689_i64)
      end
      val_0 = secs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pre_process_time, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_explosiveness_ratio : Void* = Pointer(Void).null
    def set_explosiveness_ratio(ratio : Float64) : Void
      if @@mb_set_explosiveness_ratio.null?
        @@mb_set_explosiveness_ratio = Bridge.get_method_bind("CPUParticles2D", "set_explosiveness_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_explosiveness_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_randomness_ratio : Void* = Pointer(Void).null
    def set_randomness_ratio(ratio : Float64) : Void
      if @@mb_set_randomness_ratio.null?
        @@mb_set_randomness_ratio = Bridge.get_method_bind("CPUParticles2D", "set_randomness_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_randomness_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_lifetime_randomness : Void* = Pointer(Void).null
    def set_lifetime_randomness(random : Float64) : Void
      if @@mb_set_lifetime_randomness.null?
        @@mb_set_lifetime_randomness = Bridge.get_method_bind("CPUParticles2D", "set_lifetime_randomness", 373806689_i64)
      end
      val_0 = random
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_lifetime_randomness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_use_local_coordinates : Void* = Pointer(Void).null
    def set_use_local_coordinates(enable : Bool) : Void
      if @@mb_set_use_local_coordinates.null?
        @@mb_set_use_local_coordinates = Bridge.get_method_bind("CPUParticles2D", "set_use_local_coordinates", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_local_coordinates, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_fixed_fps : Void* = Pointer(Void).null
    def set_fixed_fps(fps : Int64) : Void
      if @@mb_set_fixed_fps.null?
        @@mb_set_fixed_fps = Bridge.get_method_bind("CPUParticles2D", "set_fixed_fps", 1286410249_i64)
      end
      val_0 = fps
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fixed_fps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_fractional_delta : Void* = Pointer(Void).null
    def set_fractional_delta(enable : Bool) : Void
      if @@mb_set_fractional_delta.null?
        @@mb_set_fractional_delta = Bridge.get_method_bind("CPUParticles2D", "set_fractional_delta", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fractional_delta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_speed_scale : Void* = Pointer(Void).null
    def set_speed_scale(scale : Float64) : Void
      if @@mb_set_speed_scale.null?
        @@mb_set_speed_scale = Bridge.get_method_bind("CPUParticles2D", "set_speed_scale", 373806689_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_speed_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_request_particles_process : Void* = Pointer(Void).null
    def request_particles_process(process_time : Float64, process_time_residual : Float64) : Void
      if @@mb_request_particles_process.null?
        @@mb_request_particles_process = Bridge.get_method_bind("CPUParticles2D", "request_particles_process", 66938510_i64)
      end
      val_0 = process_time
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = process_time_residual
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_request_particles_process, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_emitting : Void* = Pointer(Void).null
    def is_emitting() : Bool
      if @@mb_is_emitting.null?
        @@mb_is_emitting = Bridge.get_method_bind("CPUParticles2D", "is_emitting", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_emitting, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_amount : Void* = Pointer(Void).null
    def get_amount() : Int64
      if @@mb_get_amount.null?
        @@mb_get_amount = Bridge.get_method_bind("CPUParticles2D", "get_amount", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_amount, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_lifetime : Void* = Pointer(Void).null
    def get_lifetime() : Float64
      if @@mb_get_lifetime.null?
        @@mb_get_lifetime = Bridge.get_method_bind("CPUParticles2D", "get_lifetime", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_lifetime, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_one_shot : Void* = Pointer(Void).null
    def get_one_shot() : Bool
      if @@mb_get_one_shot.null?
        @@mb_get_one_shot = Bridge.get_method_bind("CPUParticles2D", "get_one_shot", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_one_shot, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_pre_process_time : Void* = Pointer(Void).null
    def get_pre_process_time() : Float64
      if @@mb_get_pre_process_time.null?
        @@mb_get_pre_process_time = Bridge.get_method_bind("CPUParticles2D", "get_pre_process_time", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_pre_process_time, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_explosiveness_ratio : Void* = Pointer(Void).null
    def get_explosiveness_ratio() : Float64
      if @@mb_get_explosiveness_ratio.null?
        @@mb_get_explosiveness_ratio = Bridge.get_method_bind("CPUParticles2D", "get_explosiveness_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_explosiveness_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_randomness_ratio : Void* = Pointer(Void).null
    def get_randomness_ratio() : Float64
      if @@mb_get_randomness_ratio.null?
        @@mb_get_randomness_ratio = Bridge.get_method_bind("CPUParticles2D", "get_randomness_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_randomness_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_lifetime_randomness : Void* = Pointer(Void).null
    def get_lifetime_randomness() : Float64
      if @@mb_get_lifetime_randomness.null?
        @@mb_get_lifetime_randomness = Bridge.get_method_bind("CPUParticles2D", "get_lifetime_randomness", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_lifetime_randomness, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_use_local_coordinates : Void* = Pointer(Void).null
    def get_use_local_coordinates() : Bool
      if @@mb_get_use_local_coordinates.null?
        @@mb_get_use_local_coordinates = Bridge.get_method_bind("CPUParticles2D", "get_use_local_coordinates", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_local_coordinates, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_fixed_fps : Void* = Pointer(Void).null
    def get_fixed_fps() : Int64
      if @@mb_get_fixed_fps.null?
        @@mb_get_fixed_fps = Bridge.get_method_bind("CPUParticles2D", "get_fixed_fps", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fixed_fps, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_fractional_delta : Void* = Pointer(Void).null
    def get_fractional_delta() : Bool
      if @@mb_get_fractional_delta.null?
        @@mb_get_fractional_delta = Bridge.get_method_bind("CPUParticles2D", "get_fractional_delta", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_fractional_delta, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_speed_scale : Void* = Pointer(Void).null
    def get_speed_scale() : Float64
      if @@mb_get_speed_scale.null?
        @@mb_get_speed_scale = Bridge.get_method_bind("CPUParticles2D", "get_speed_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_speed_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_fixed_seed : Void* = Pointer(Void).null
    def set_use_fixed_seed(use_fixed_seed : Bool) : Void
      if @@mb_set_use_fixed_seed.null?
        @@mb_set_use_fixed_seed = Bridge.get_method_bind("CPUParticles2D", "set_use_fixed_seed", 2586408642_i64)
      end
      val_0 = use_fixed_seed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_fixed_seed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_use_fixed_seed : Void* = Pointer(Void).null
    def get_use_fixed_seed() : Bool
      if @@mb_get_use_fixed_seed.null?
        @@mb_get_use_fixed_seed = Bridge.get_method_bind("CPUParticles2D", "get_use_fixed_seed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_fixed_seed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_seed : Void* = Pointer(Void).null
    def set_seed(seed : Int64) : Void
      if @@mb_set_seed.null?
        @@mb_set_seed = Bridge.get_method_bind("CPUParticles2D", "set_seed", 1286410249_i64)
      end
      val_0 = seed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_seed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_seed : Void* = Pointer(Void).null
    def get_seed() : Int64
      if @@mb_get_seed.null?
        @@mb_get_seed = Bridge.get_method_bind("CPUParticles2D", "get_seed", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_seed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_draw_order : Void* = Pointer(Void).null
    def set_draw_order(order : Int64) : Void
      if @@mb_set_draw_order.null?
        @@mb_set_draw_order = Bridge.get_method_bind("CPUParticles2D", "set_draw_order", 4183193490_i64)
      end
      val_0 = order
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_order, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_draw_order : Void* = Pointer(Void).null
    def get_draw_order() : Int64
      if @@mb_get_draw_order.null?
        @@mb_get_draw_order = Bridge.get_method_bind("CPUParticles2D", "get_draw_order", 1668655735_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_draw_order, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("CPUParticles2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("CPUParticles2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_restart : Void* = Pointer(Void).null
    def restart(keep_seed : Bool) : Void
      if @@mb_restart.null?
        @@mb_restart = Bridge.get_method_bind("CPUParticles2D", "restart", 107499316_i64)
      end
      val_0 = keep_seed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_restart, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_direction : Void* = Pointer(Void).null
    def set_direction(direction : Vector2) : Void
      if @@mb_set_direction.null?
        @@mb_set_direction = Bridge.get_method_bind("CPUParticles2D", "set_direction", 743155724_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_direction : Void* = Pointer(Void).null
    def get_direction() : Vector2
      if @@mb_get_direction.null?
        @@mb_get_direction = Bridge.get_method_bind("CPUParticles2D", "get_direction", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_spread : Void* = Pointer(Void).null
    def set_spread(spread : Float64) : Void
      if @@mb_set_spread.null?
        @@mb_set_spread = Bridge.get_method_bind("CPUParticles2D", "set_spread", 373806689_i64)
      end
      val_0 = spread
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_spread, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_spread : Void* = Pointer(Void).null
    def get_spread() : Float64
      if @@mb_get_spread.null?
        @@mb_get_spread = Bridge.get_method_bind("CPUParticles2D", "get_spread", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_spread, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_param_min : Void* = Pointer(Void).null
    def set_param_min(param : Int64, value : Float64) : Void
      if @@mb_set_param_min.null?
        @@mb_set_param_min = Bridge.get_method_bind("CPUParticles2D", "set_param_min", 3320615296_i64)
      end
      val_0 = param
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_param_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_param_min : Void* = Pointer(Void).null
    def get_param_min(param : Int64) : Float64
      if @@mb_get_param_min.null?
        @@mb_get_param_min = Bridge.get_method_bind("CPUParticles2D", "get_param_min", 2038050600_i64)
      end
      val_0 = param
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_param_min, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_param_max : Void* = Pointer(Void).null
    def set_param_max(param : Int64, value : Float64) : Void
      if @@mb_set_param_max.null?
        @@mb_set_param_max = Bridge.get_method_bind("CPUParticles2D", "set_param_max", 3320615296_i64)
      end
      val_0 = param
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_param_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_param_max : Void* = Pointer(Void).null
    def get_param_max(param : Int64) : Float64
      if @@mb_get_param_max.null?
        @@mb_get_param_max = Bridge.get_method_bind("CPUParticles2D", "get_param_max", 2038050600_i64)
      end
      val_0 = param
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_param_max, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_param_curve : Void* = Pointer(Void).null
    def set_param_curve(param : Int64, curve : Curve) : Void
      if @@mb_set_param_curve.null?
        @@mb_set_param_curve = Bridge.get_method_bind("CPUParticles2D", "set_param_curve", 2959350143_i64)
      end
      val_0 = param
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = curve
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_param_curve, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_param_curve : Void* = Pointer(Void).null
    def get_param_curve(param : Int64) : Curve
      if @@mb_get_param_curve.null?
        @@mb_get_param_curve = Bridge.get_method_bind("CPUParticles2D", "get_param_curve", 2603158474_i64)
      end
      val_0 = param
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_param_curve, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Curve.new(ret_ptr)
    end
    @@mb_set_color : Void* = Pointer(Void).null
    def set_color(color : Color) : Void
      if @@mb_set_color.null?
        @@mb_set_color = Bridge.get_method_bind("CPUParticles2D", "set_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color : Void* = Pointer(Void).null
    def get_color() : Color
      if @@mb_get_color.null?
        @@mb_get_color = Bridge.get_method_bind("CPUParticles2D", "get_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_color_ramp : Void* = Pointer(Void).null
    def set_color_ramp(ramp : Gradient) : Void
      if @@mb_set_color_ramp.null?
        @@mb_set_color_ramp = Bridge.get_method_bind("CPUParticles2D", "set_color_ramp", 2756054477_i64)
      end
      val_0 = ramp
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color_ramp, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color_ramp : Void* = Pointer(Void).null
    def get_color_ramp() : Gradient
      if @@mb_get_color_ramp.null?
        @@mb_get_color_ramp = Bridge.get_method_bind("CPUParticles2D", "get_color_ramp", 132272999_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_color_ramp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Gradient.new(ret_ptr)
    end
    @@mb_set_color_initial_ramp : Void* = Pointer(Void).null
    def set_color_initial_ramp(ramp : Gradient) : Void
      if @@mb_set_color_initial_ramp.null?
        @@mb_set_color_initial_ramp = Bridge.get_method_bind("CPUParticles2D", "set_color_initial_ramp", 2756054477_i64)
      end
      val_0 = ramp
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color_initial_ramp, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color_initial_ramp : Void* = Pointer(Void).null
    def get_color_initial_ramp() : Gradient
      if @@mb_get_color_initial_ramp.null?
        @@mb_get_color_initial_ramp = Bridge.get_method_bind("CPUParticles2D", "get_color_initial_ramp", 132272999_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_color_initial_ramp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Gradient.new(ret_ptr)
    end
    @@mb_set_particle_flag : Void* = Pointer(Void).null
    def set_particle_flag(particle_flag : Int64, enable : Bool) : Void
      if @@mb_set_particle_flag.null?
        @@mb_set_particle_flag = Bridge.get_method_bind("CPUParticles2D", "set_particle_flag", 4178137949_i64)
      end
      val_0 = particle_flag
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_particle_flag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_particle_flag : Void* = Pointer(Void).null
    def get_particle_flag(particle_flag : Int64) : Bool
      if @@mb_get_particle_flag.null?
        @@mb_get_particle_flag = Bridge.get_method_bind("CPUParticles2D", "get_particle_flag", 2829976507_i64)
      end
      val_0 = particle_flag
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_particle_flag, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_emission_shape : Void* = Pointer(Void).null
    def set_emission_shape(shape : Int64) : Void
      if @@mb_set_emission_shape.null?
        @@mb_set_emission_shape = Bridge.get_method_bind("CPUParticles2D", "set_emission_shape", 393763892_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_shape : Void* = Pointer(Void).null
    def get_emission_shape() : Int64
      if @@mb_get_emission_shape.null?
        @@mb_get_emission_shape = Bridge.get_method_bind("CPUParticles2D", "get_emission_shape", 1740246024_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_emission_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_emission_sphere_radius : Void* = Pointer(Void).null
    def set_emission_sphere_radius(radius : Float64) : Void
      if @@mb_set_emission_sphere_radius.null?
        @@mb_set_emission_sphere_radius = Bridge.get_method_bind("CPUParticles2D", "set_emission_sphere_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_sphere_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_sphere_radius : Void* = Pointer(Void).null
    def get_emission_sphere_radius() : Float64
      if @@mb_get_emission_sphere_radius.null?
        @@mb_get_emission_sphere_radius = Bridge.get_method_bind("CPUParticles2D", "get_emission_sphere_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_emission_sphere_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_emission_rect_extents : Void* = Pointer(Void).null
    def set_emission_rect_extents(extents : Vector2) : Void
      if @@mb_set_emission_rect_extents.null?
        @@mb_set_emission_rect_extents = Bridge.get_method_bind("CPUParticles2D", "set_emission_rect_extents", 743155724_i64)
      end
      val_0 = extents
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_rect_extents, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_rect_extents : Void* = Pointer(Void).null
    def get_emission_rect_extents() : Vector2
      if @@mb_get_emission_rect_extents.null?
        @@mb_get_emission_rect_extents = Bridge.get_method_bind("CPUParticles2D", "get_emission_rect_extents", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_emission_rect_extents, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_emission_points : Void* = Pointer(Void).null
    def set_emission_points(array : Void*) : Void
      if @@mb_set_emission_points.null?
        @@mb_set_emission_points = Bridge.get_method_bind("CPUParticles2D", "set_emission_points", 1509147220_i64)
      end
      val_0 = array
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_points, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_points : Void* = Pointer(Void).null
    def get_emission_points() : Void*
      if @@mb_get_emission_points.null?
        @@mb_get_emission_points = Bridge.get_method_bind("CPUParticles2D", "get_emission_points", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_emission_points, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_emission_normals : Void* = Pointer(Void).null
    def set_emission_normals(array : Void*) : Void
      if @@mb_set_emission_normals.null?
        @@mb_set_emission_normals = Bridge.get_method_bind("CPUParticles2D", "set_emission_normals", 1509147220_i64)
      end
      val_0 = array
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_normals, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_normals : Void* = Pointer(Void).null
    def get_emission_normals() : Void*
      if @@mb_get_emission_normals.null?
        @@mb_get_emission_normals = Bridge.get_method_bind("CPUParticles2D", "get_emission_normals", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_emission_normals, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_emission_colors : Void* = Pointer(Void).null
    def set_emission_colors(array : Void*) : Void
      if @@mb_set_emission_colors.null?
        @@mb_set_emission_colors = Bridge.get_method_bind("CPUParticles2D", "set_emission_colors", 3546319833_i64)
      end
      val_0 = array
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_colors, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_colors : Void* = Pointer(Void).null
    def get_emission_colors() : Void*
      if @@mb_get_emission_colors.null?
        @@mb_get_emission_colors = Bridge.get_method_bind("CPUParticles2D", "get_emission_colors", 1392750486_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_emission_colors, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_emission_ring_inner_radius : Void* = Pointer(Void).null
    def set_emission_ring_inner_radius(inner_radius : Float64) : Void
      if @@mb_set_emission_ring_inner_radius.null?
        @@mb_set_emission_ring_inner_radius = Bridge.get_method_bind("CPUParticles2D", "set_emission_ring_inner_radius", 373806689_i64)
      end
      val_0 = inner_radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_ring_inner_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_ring_inner_radius : Void* = Pointer(Void).null
    def get_emission_ring_inner_radius() : Float64
      if @@mb_get_emission_ring_inner_radius.null?
        @@mb_get_emission_ring_inner_radius = Bridge.get_method_bind("CPUParticles2D", "get_emission_ring_inner_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_emission_ring_inner_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_emission_ring_radius : Void* = Pointer(Void).null
    def set_emission_ring_radius(radius : Float64) : Void
      if @@mb_set_emission_ring_radius.null?
        @@mb_set_emission_ring_radius = Bridge.get_method_bind("CPUParticles2D", "set_emission_ring_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emission_ring_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_emission_ring_radius : Void* = Pointer(Void).null
    def get_emission_ring_radius() : Float64
      if @@mb_get_emission_ring_radius.null?
        @@mb_get_emission_ring_radius = Bridge.get_method_bind("CPUParticles2D", "get_emission_ring_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_emission_ring_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_gravity : Void* = Pointer(Void).null
    def get_gravity() : Vector2
      if @@mb_get_gravity.null?
        @@mb_get_gravity = Bridge.get_method_bind("CPUParticles2D", "get_gravity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_gravity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gravity : Void* = Pointer(Void).null
    def set_gravity(accel_vec : Vector2) : Void
      if @@mb_set_gravity.null?
        @@mb_set_gravity = Bridge.get_method_bind("CPUParticles2D", "set_gravity", 743155724_i64)
      end
      val_0 = accel_vec
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_split_scale : Void* = Pointer(Void).null
    def get_split_scale() : Bool
      if @@mb_get_split_scale.null?
        @@mb_get_split_scale = Bridge.get_method_bind("CPUParticles2D", "get_split_scale", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_split_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_split_scale : Void* = Pointer(Void).null
    def set_split_scale(split_scale : Bool) : Void
      if @@mb_set_split_scale.null?
        @@mb_set_split_scale = Bridge.get_method_bind("CPUParticles2D", "set_split_scale", 2586408642_i64)
      end
      val_0 = split_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_split_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scale_curve_x : Void* = Pointer(Void).null
    def get_scale_curve_x() : Curve
      if @@mb_get_scale_curve_x.null?
        @@mb_get_scale_curve_x = Bridge.get_method_bind("CPUParticles2D", "get_scale_curve_x", 2460114913_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_scale_curve_x, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Curve.new(ret_ptr)
    end
    @@mb_set_scale_curve_x : Void* = Pointer(Void).null
    def set_scale_curve_x(scale_curve : Curve) : Void
      if @@mb_set_scale_curve_x.null?
        @@mb_set_scale_curve_x = Bridge.get_method_bind("CPUParticles2D", "set_scale_curve_x", 270443179_i64)
      end
      val_0 = scale_curve
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scale_curve_x, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scale_curve_y : Void* = Pointer(Void).null
    def get_scale_curve_y() : Curve
      if @@mb_get_scale_curve_y.null?
        @@mb_get_scale_curve_y = Bridge.get_method_bind("CPUParticles2D", "get_scale_curve_y", 2460114913_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_scale_curve_y, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Curve.new(ret_ptr)
    end
    @@mb_set_scale_curve_y : Void* = Pointer(Void).null
    def set_scale_curve_y(scale_curve : Curve) : Void
      if @@mb_set_scale_curve_y.null?
        @@mb_set_scale_curve_y = Bridge.get_method_bind("CPUParticles2D", "set_scale_curve_y", 270443179_i64)
      end
      val_0 = scale_curve
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scale_curve_y, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_convert_from_particles : Void* = Pointer(Void).null
    def convert_from_particles(particles : Node) : Void
      if @@mb_convert_from_particles.null?
        @@mb_convert_from_particles = Bridge.get_method_bind("CPUParticles2D", "convert_from_particles", 1078189570_i64)
      end
      arg_ptr_0 = particles ? particles.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_convert_from_particles, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class Camera2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum AnchorMode : Int64
      AnchorModeFixedTopLeft = 0_i64
      AnchorModeDragCenter = 1_i64
    end
    enum Camera2DProcessCallback : Int64
      Camera2dProcessPhysics = 0_i64
      Camera2dProcessIdle = 1_i64
    end
    @@mb_set_offset : Void* = Pointer(Void).null
    def set_offset(offset : Vector2) : Void
      if @@mb_set_offset.null?
        @@mb_set_offset = Bridge.get_method_bind("Camera2D", "set_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset : Void* = Pointer(Void).null
    def get_offset() : Vector2
      if @@mb_get_offset.null?
        @@mb_get_offset = Bridge.get_method_bind("Camera2D", "get_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_anchor_mode : Void* = Pointer(Void).null
    def set_anchor_mode(anchor_mode : Int64) : Void
      if @@mb_set_anchor_mode.null?
        @@mb_set_anchor_mode = Bridge.get_method_bind("Camera2D", "set_anchor_mode", 2050398218_i64)
      end
      val_0 = anchor_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_anchor_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_anchor_mode : Void* = Pointer(Void).null
    def get_anchor_mode() : Int64
      if @@mb_get_anchor_mode.null?
        @@mb_get_anchor_mode = Bridge.get_method_bind("Camera2D", "get_anchor_mode", 155978067_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_anchor_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_ignore_rotation : Void* = Pointer(Void).null
    def set_ignore_rotation(ignore : Bool) : Void
      if @@mb_set_ignore_rotation.null?
        @@mb_set_ignore_rotation = Bridge.get_method_bind("Camera2D", "set_ignore_rotation", 2586408642_i64)
      end
      val_0 = ignore
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_ignore_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_ignoring_rotation : Void* = Pointer(Void).null
    def is_ignoring_rotation() : Bool
      if @@mb_is_ignoring_rotation.null?
        @@mb_is_ignoring_rotation = Bridge.get_method_bind("Camera2D", "is_ignoring_rotation", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_ignoring_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_process_callback : Void* = Pointer(Void).null
    def set_process_callback(mode : Int64) : Void
      if @@mb_set_process_callback.null?
        @@mb_set_process_callback = Bridge.get_method_bind("Camera2D", "set_process_callback", 4201947462_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_process_callback : Void* = Pointer(Void).null
    def get_process_callback() : Int64
      if @@mb_get_process_callback.null?
        @@mb_get_process_callback = Bridge.get_method_bind("Camera2D", "get_process_callback", 2325344499_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_callback, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("Camera2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_enabled : Void* = Pointer(Void).null
    def is_enabled() : Bool
      if @@mb_is_enabled.null?
        @@mb_is_enabled = Bridge.get_method_bind("Camera2D", "is_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_make_current : Void* = Pointer(Void).null
    def make_current() : Void
      if @@mb_make_current.null?
        @@mb_make_current = Bridge.get_method_bind("Camera2D", "make_current", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_make_current, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_is_current : Void* = Pointer(Void).null
    def is_current() : Bool
      if @@mb_is_current.null?
        @@mb_is_current = Bridge.get_method_bind("Camera2D", "is_current", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_current, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_limit_enabled : Void* = Pointer(Void).null
    def set_limit_enabled(limit_enabled : Bool) : Void
      if @@mb_set_limit_enabled.null?
        @@mb_set_limit_enabled = Bridge.get_method_bind("Camera2D", "set_limit_enabled", 2586408642_i64)
      end
      val_0 = limit_enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_limit_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_limit_enabled : Void* = Pointer(Void).null
    def is_limit_enabled() : Bool
      if @@mb_is_limit_enabled.null?
        @@mb_is_limit_enabled = Bridge.get_method_bind("Camera2D", "is_limit_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_limit_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_limit : Void* = Pointer(Void).null
    def set_limit(margin : Int64, limit : Int64) : Void
      if @@mb_set_limit.null?
        @@mb_set_limit = Bridge.get_method_bind("Camera2D", "set_limit", 437707142_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = limit
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_limit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_limit : Void* = Pointer(Void).null
    def get_limit(margin : Int64) : Int64
      if @@mb_get_limit.null?
        @@mb_get_limit = Bridge.get_method_bind("Camera2D", "get_limit", 1983885014_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_limit, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_limit_smoothing_enabled : Void* = Pointer(Void).null
    def set_limit_smoothing_enabled(limit_smoothing_enabled : Bool) : Void
      if @@mb_set_limit_smoothing_enabled.null?
        @@mb_set_limit_smoothing_enabled = Bridge.get_method_bind("Camera2D", "set_limit_smoothing_enabled", 2586408642_i64)
      end
      val_0 = limit_smoothing_enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_limit_smoothing_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_limit_smoothing_enabled : Void* = Pointer(Void).null
    def is_limit_smoothing_enabled() : Bool
      if @@mb_is_limit_smoothing_enabled.null?
        @@mb_is_limit_smoothing_enabled = Bridge.get_method_bind("Camera2D", "is_limit_smoothing_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_limit_smoothing_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drag_vertical_enabled : Void* = Pointer(Void).null
    def set_drag_vertical_enabled(enabled : Bool) : Void
      if @@mb_set_drag_vertical_enabled.null?
        @@mb_set_drag_vertical_enabled = Bridge.get_method_bind("Camera2D", "set_drag_vertical_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_vertical_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drag_vertical_enabled : Void* = Pointer(Void).null
    def is_drag_vertical_enabled() : Bool
      if @@mb_is_drag_vertical_enabled.null?
        @@mb_is_drag_vertical_enabled = Bridge.get_method_bind("Camera2D", "is_drag_vertical_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drag_vertical_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drag_horizontal_enabled : Void* = Pointer(Void).null
    def set_drag_horizontal_enabled(enabled : Bool) : Void
      if @@mb_set_drag_horizontal_enabled.null?
        @@mb_set_drag_horizontal_enabled = Bridge.get_method_bind("Camera2D", "set_drag_horizontal_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_horizontal_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_drag_horizontal_enabled : Void* = Pointer(Void).null
    def is_drag_horizontal_enabled() : Bool
      if @@mb_is_drag_horizontal_enabled.null?
        @@mb_is_drag_horizontal_enabled = Bridge.get_method_bind("Camera2D", "is_drag_horizontal_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_drag_horizontal_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_drag_vertical_offset : Void* = Pointer(Void).null
    def set_drag_vertical_offset(offset : Float64) : Void
      if @@mb_set_drag_vertical_offset.null?
        @@mb_set_drag_vertical_offset = Bridge.get_method_bind("Camera2D", "set_drag_vertical_offset", 373806689_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_vertical_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_drag_vertical_offset : Void* = Pointer(Void).null
    def get_drag_vertical_offset() : Float64
      if @@mb_get_drag_vertical_offset.null?
        @@mb_get_drag_vertical_offset = Bridge.get_method_bind("Camera2D", "get_drag_vertical_offset", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_drag_vertical_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_drag_horizontal_offset : Void* = Pointer(Void).null
    def set_drag_horizontal_offset(offset : Float64) : Void
      if @@mb_set_drag_horizontal_offset.null?
        @@mb_set_drag_horizontal_offset = Bridge.get_method_bind("Camera2D", "set_drag_horizontal_offset", 373806689_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_drag_horizontal_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_drag_horizontal_offset : Void* = Pointer(Void).null
    def get_drag_horizontal_offset() : Float64
      if @@mb_get_drag_horizontal_offset.null?
        @@mb_get_drag_horizontal_offset = Bridge.get_method_bind("Camera2D", "get_drag_horizontal_offset", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_drag_horizontal_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_drag_margin : Void* = Pointer(Void).null
    def set_drag_margin(margin : Int64, drag_margin : Float64) : Void
      if @@mb_set_drag_margin.null?
        @@mb_set_drag_margin = Bridge.get_method_bind("Camera2D", "set_drag_margin", 4290182280_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = drag_margin
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_drag_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_drag_margin : Void* = Pointer(Void).null
    def get_drag_margin(margin : Int64) : Float64
      if @@mb_get_drag_margin.null?
        @@mb_get_drag_margin = Bridge.get_method_bind("Camera2D", "get_drag_margin", 2869120046_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_drag_margin, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_target_position : Void* = Pointer(Void).null
    def get_target_position() : Vector2
      if @@mb_get_target_position.null?
        @@mb_get_target_position = Bridge.get_method_bind("Camera2D", "get_target_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_target_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_screen_center_position : Void* = Pointer(Void).null
    def get_screen_center_position() : Vector2
      if @@mb_get_screen_center_position.null?
        @@mb_get_screen_center_position = Bridge.get_method_bind("Camera2D", "get_screen_center_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_screen_center_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_screen_rotation : Void* = Pointer(Void).null
    def get_screen_rotation() : Float64
      if @@mb_get_screen_rotation.null?
        @@mb_get_screen_rotation = Bridge.get_method_bind("Camera2D", "get_screen_rotation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_screen_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_zoom : Void* = Pointer(Void).null
    def set_zoom(zoom : Vector2) : Void
      if @@mb_set_zoom.null?
        @@mb_set_zoom = Bridge.get_method_bind("Camera2D", "set_zoom", 743155724_i64)
      end
      val_0 = zoom
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_zoom, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_zoom : Void* = Pointer(Void).null
    def get_zoom() : Vector2
      if @@mb_get_zoom.null?
        @@mb_get_zoom = Bridge.get_method_bind("Camera2D", "get_zoom", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_zoom, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_custom_viewport : Void* = Pointer(Void).null
    def set_custom_viewport(viewport : Node) : Void
      if @@mb_set_custom_viewport.null?
        @@mb_set_custom_viewport = Bridge.get_method_bind("Camera2D", "set_custom_viewport", 1078189570_i64)
      end
      arg_ptr_0 = viewport ? viewport.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_viewport, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_custom_viewport : Void* = Pointer(Void).null
    def get_custom_viewport() : Node
      if @@mb_get_custom_viewport.null?
        @@mb_get_custom_viewport = Bridge.get_method_bind("Camera2D", "get_custom_viewport", 3160264692_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_custom_viewport, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node.new(ret_ptr)
    end
    @@mb_set_position_smoothing_speed : Void* = Pointer(Void).null
    def set_position_smoothing_speed(position_smoothing_speed : Float64) : Void
      if @@mb_set_position_smoothing_speed.null?
        @@mb_set_position_smoothing_speed = Bridge.get_method_bind("Camera2D", "set_position_smoothing_speed", 373806689_i64)
      end
      val_0 = position_smoothing_speed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_position_smoothing_speed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_position_smoothing_speed : Void* = Pointer(Void).null
    def get_position_smoothing_speed() : Float64
      if @@mb_get_position_smoothing_speed.null?
        @@mb_get_position_smoothing_speed = Bridge.get_method_bind("Camera2D", "get_position_smoothing_speed", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_position_smoothing_speed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_position_smoothing_enabled : Void* = Pointer(Void).null
    def set_position_smoothing_enabled(enabled : Bool) : Void
      if @@mb_set_position_smoothing_enabled.null?
        @@mb_set_position_smoothing_enabled = Bridge.get_method_bind("Camera2D", "set_position_smoothing_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_position_smoothing_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_position_smoothing_enabled : Void* = Pointer(Void).null
    def is_position_smoothing_enabled() : Bool
      if @@mb_is_position_smoothing_enabled.null?
        @@mb_is_position_smoothing_enabled = Bridge.get_method_bind("Camera2D", "is_position_smoothing_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_position_smoothing_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_rotation_smoothing_enabled : Void* = Pointer(Void).null
    def set_rotation_smoothing_enabled(enabled : Bool) : Void
      if @@mb_set_rotation_smoothing_enabled.null?
        @@mb_set_rotation_smoothing_enabled = Bridge.get_method_bind("Camera2D", "set_rotation_smoothing_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rotation_smoothing_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_rotation_smoothing_enabled : Void* = Pointer(Void).null
    def is_rotation_smoothing_enabled() : Bool
      if @@mb_is_rotation_smoothing_enabled.null?
        @@mb_is_rotation_smoothing_enabled = Bridge.get_method_bind("Camera2D", "is_rotation_smoothing_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_rotation_smoothing_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_rotation_smoothing_speed : Void* = Pointer(Void).null
    def set_rotation_smoothing_speed(speed : Float64) : Void
      if @@mb_set_rotation_smoothing_speed.null?
        @@mb_set_rotation_smoothing_speed = Bridge.get_method_bind("Camera2D", "set_rotation_smoothing_speed", 373806689_i64)
      end
      val_0 = speed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rotation_smoothing_speed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_rotation_smoothing_speed : Void* = Pointer(Void).null
    def get_rotation_smoothing_speed() : Float64
      if @@mb_get_rotation_smoothing_speed.null?
        @@mb_get_rotation_smoothing_speed = Bridge.get_method_bind("Camera2D", "get_rotation_smoothing_speed", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_rotation_smoothing_speed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_force_update_scroll : Void* = Pointer(Void).null
    def force_update_scroll() : Void
      if @@mb_force_update_scroll.null?
        @@mb_force_update_scroll = Bridge.get_method_bind("Camera2D", "force_update_scroll", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_update_scroll, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_reset_smoothing : Void* = Pointer(Void).null
    def reset_smoothing() : Void
      if @@mb_reset_smoothing.null?
        @@mb_reset_smoothing = Bridge.get_method_bind("Camera2D", "reset_smoothing", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reset_smoothing, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_align : Void* = Pointer(Void).null
    def align() : Void
      if @@mb_align.null?
        @@mb_align = Bridge.get_method_bind("Camera2D", "align", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_align, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_screen_drawing_enabled : Void* = Pointer(Void).null
    def set_screen_drawing_enabled(screen_drawing_enabled : Bool) : Void
      if @@mb_set_screen_drawing_enabled.null?
        @@mb_set_screen_drawing_enabled = Bridge.get_method_bind("Camera2D", "set_screen_drawing_enabled", 2586408642_i64)
      end
      val_0 = screen_drawing_enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_screen_drawing_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_screen_drawing_enabled : Void* = Pointer(Void).null
    def is_screen_drawing_enabled() : Bool
      if @@mb_is_screen_drawing_enabled.null?
        @@mb_is_screen_drawing_enabled = Bridge.get_method_bind("Camera2D", "is_screen_drawing_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_screen_drawing_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_limit_drawing_enabled : Void* = Pointer(Void).null
    def set_limit_drawing_enabled(limit_drawing_enabled : Bool) : Void
      if @@mb_set_limit_drawing_enabled.null?
        @@mb_set_limit_drawing_enabled = Bridge.get_method_bind("Camera2D", "set_limit_drawing_enabled", 2586408642_i64)
      end
      val_0 = limit_drawing_enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_limit_drawing_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_limit_drawing_enabled : Void* = Pointer(Void).null
    def is_limit_drawing_enabled() : Bool
      if @@mb_is_limit_drawing_enabled.null?
        @@mb_is_limit_drawing_enabled = Bridge.get_method_bind("Camera2D", "is_limit_drawing_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_limit_drawing_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_margin_drawing_enabled : Void* = Pointer(Void).null
    def set_margin_drawing_enabled(margin_drawing_enabled : Bool) : Void
      if @@mb_set_margin_drawing_enabled.null?
        @@mb_set_margin_drawing_enabled = Bridge.get_method_bind("Camera2D", "set_margin_drawing_enabled", 2586408642_i64)
      end
      val_0 = margin_drawing_enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_margin_drawing_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_margin_drawing_enabled : Void* = Pointer(Void).null
    def is_margin_drawing_enabled() : Bool
      if @@mb_is_margin_drawing_enabled.null?
        @@mb_is_margin_drawing_enabled = Bridge.get_method_bind("Camera2D", "is_margin_drawing_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_margin_drawing_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class Shape2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_custom_solver_bias : Void* = Pointer(Void).null
    def set_custom_solver_bias(bias : Float64) : Void
      if @@mb_set_custom_solver_bias.null?
        @@mb_set_custom_solver_bias = Bridge.get_method_bind("Shape2D", "set_custom_solver_bias", 373806689_i64)
      end
      val_0 = bias
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_custom_solver_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_custom_solver_bias : Void* = Pointer(Void).null
    def get_custom_solver_bias() : Float64
      if @@mb_get_custom_solver_bias.null?
        @@mb_get_custom_solver_bias = Bridge.get_method_bind("Shape2D", "get_custom_solver_bias", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_custom_solver_bias, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_collide : Void* = Pointer(Void).null
    def collide(local_xform : Transform2D, with_shape : Shape2D, shape_xform : Transform2D) : Bool
      if @@mb_collide.null?
        @@mb_collide = Bridge.get_method_bind("Shape2D", "collide", 3709843132_i64)
      end
      val_0 = local_xform
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = with_shape
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = shape_xform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_u8
      Bridge.ptrcall(@@mb_collide, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_collide_with_motion : Void* = Pointer(Void).null
    def collide_with_motion(local_xform : Transform2D, local_motion : Vector2, with_shape : Shape2D, shape_xform : Transform2D, shape_motion : Vector2) : Bool
      if @@mb_collide_with_motion.null?
        @@mb_collide_with_motion = Bridge.get_method_bind("Shape2D", "collide_with_motion", 2869556801_i64)
      end
      val_0 = local_xform
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = local_motion
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = with_shape
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = shape_xform
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = shape_motion
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret = 0_u8
      Bridge.ptrcall(@@mb_collide_with_motion, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_collide_and_get_contacts : Void* = Pointer(Void).null
    def collide_and_get_contacts(local_xform : Transform2D, with_shape : Shape2D, shape_xform : Transform2D) : Void*
      if @@mb_collide_and_get_contacts.null?
        @@mb_collide_and_get_contacts = Bridge.get_method_bind("Shape2D", "collide_and_get_contacts", 3056932662_i64)
      end
      val_0 = local_xform
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = with_shape
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = shape_xform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_collide_and_get_contacts, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_collide_with_motion_and_get_contacts : Void* = Pointer(Void).null
    def collide_with_motion_and_get_contacts(local_xform : Transform2D, local_motion : Vector2, with_shape : Shape2D, shape_xform : Transform2D, shape_motion : Vector2) : Void*
      if @@mb_collide_with_motion_and_get_contacts.null?
        @@mb_collide_with_motion_and_get_contacts = Bridge.get_method_bind("Shape2D", "collide_with_motion_and_get_contacts", 3620351573_i64)
      end
      val_0 = local_xform
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = local_motion
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = with_shape
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = shape_xform
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = shape_motion
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_collide_with_motion_and_get_contacts, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_draw : Void* = Pointer(Void).null
    def draw(canvas_item : Int64, color : Color) : Void
      if @@mb_draw.null?
        @@mb_draw = Bridge.get_method_bind("Shape2D", "draw", 2948539648_i64)
      end
      val_0 = canvas_item
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = color
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_draw, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_rect : Void* = Pointer(Void).null
    def get_rect() : Rect2
      if @@mb_get_rect.null?
        @@mb_get_rect = Bridge.get_method_bind("Shape2D", "get_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
  end
  class CapsuleShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_radius : Void* = Pointer(Void).null
    def set_radius(radius : Float64) : Void
      if @@mb_set_radius.null?
        @@mb_set_radius = Bridge.get_method_bind("CapsuleShape2D", "set_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_radius : Void* = Pointer(Void).null
    def get_radius() : Float64
      if @@mb_get_radius.null?
        @@mb_get_radius = Bridge.get_method_bind("CapsuleShape2D", "get_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_height : Void* = Pointer(Void).null
    def set_height(height : Float64) : Void
      if @@mb_set_height.null?
        @@mb_set_height = Bridge.get_method_bind("CapsuleShape2D", "set_height", 373806689_i64)
      end
      val_0 = height
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_height, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_height : Void* = Pointer(Void).null
    def get_height() : Float64
      if @@mb_get_height.null?
        @@mb_get_height = Bridge.get_method_bind("CapsuleShape2D", "get_height", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_mid_height : Void* = Pointer(Void).null
    def set_mid_height(mid_height : Float64) : Void
      if @@mb_set_mid_height.null?
        @@mb_set_mid_height = Bridge.get_method_bind("CapsuleShape2D", "set_mid_height", 373806689_i64)
      end
      val_0 = mid_height
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mid_height, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mid_height : Void* = Pointer(Void).null
    def get_mid_height() : Float64
      if @@mb_get_mid_height.null?
        @@mb_get_mid_height = Bridge.get_method_bind("CapsuleShape2D", "get_mid_height", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_mid_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class CharacterBody2D < Godot::PhysicsBody2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum MotionMode : Int64
      MotionModeGrounded = 0_i64
      MotionModeFloating = 1_i64
    end
    enum PlatformOnLeave : Int64
      PlatformOnLeaveAddVelocity = 0_i64
      PlatformOnLeaveAddUpwardVelocity = 1_i64
      PlatformOnLeaveDoNothing = 2_i64
    end
    @@mb_move_and_slide : Void* = Pointer(Void).null
    def move_and_slide() : Bool
      if @@mb_move_and_slide.null?
        @@mb_move_and_slide = Bridge.get_method_bind("CharacterBody2D", "move_and_slide", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_move_and_slide, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_apply_floor_snap : Void* = Pointer(Void).null
    def apply_floor_snap() : Void
      if @@mb_apply_floor_snap.null?
        @@mb_apply_floor_snap = Bridge.get_method_bind("CharacterBody2D", "apply_floor_snap", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_apply_floor_snap, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_velocity : Void* = Pointer(Void).null
    def set_velocity(velocity : Vector2) : Void
      if @@mb_set_velocity.null?
        @@mb_set_velocity = Bridge.get_method_bind("CharacterBody2D", "set_velocity", 743155724_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_velocity : Void* = Pointer(Void).null
    def get_velocity() : Vector2
      if @@mb_get_velocity.null?
        @@mb_get_velocity = Bridge.get_method_bind("CharacterBody2D", "get_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_safe_margin : Void* = Pointer(Void).null
    def set_safe_margin(margin : Float64) : Void
      if @@mb_set_safe_margin.null?
        @@mb_set_safe_margin = Bridge.get_method_bind("CharacterBody2D", "set_safe_margin", 373806689_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_safe_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_safe_margin : Void* = Pointer(Void).null
    def get_safe_margin() : Float64
      if @@mb_get_safe_margin.null?
        @@mb_get_safe_margin = Bridge.get_method_bind("CharacterBody2D", "get_safe_margin", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_safe_margin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_floor_stop_on_slope_enabled : Void* = Pointer(Void).null
    def is_floor_stop_on_slope_enabled() : Bool
      if @@mb_is_floor_stop_on_slope_enabled.null?
        @@mb_is_floor_stop_on_slope_enabled = Bridge.get_method_bind("CharacterBody2D", "is_floor_stop_on_slope_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_floor_stop_on_slope_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_floor_stop_on_slope_enabled : Void* = Pointer(Void).null
    def set_floor_stop_on_slope_enabled(enabled : Bool) : Void
      if @@mb_set_floor_stop_on_slope_enabled.null?
        @@mb_set_floor_stop_on_slope_enabled = Bridge.get_method_bind("CharacterBody2D", "set_floor_stop_on_slope_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_floor_stop_on_slope_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_floor_constant_speed_enabled : Void* = Pointer(Void).null
    def set_floor_constant_speed_enabled(enabled : Bool) : Void
      if @@mb_set_floor_constant_speed_enabled.null?
        @@mb_set_floor_constant_speed_enabled = Bridge.get_method_bind("CharacterBody2D", "set_floor_constant_speed_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_floor_constant_speed_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_floor_constant_speed_enabled : Void* = Pointer(Void).null
    def is_floor_constant_speed_enabled() : Bool
      if @@mb_is_floor_constant_speed_enabled.null?
        @@mb_is_floor_constant_speed_enabled = Bridge.get_method_bind("CharacterBody2D", "is_floor_constant_speed_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_floor_constant_speed_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_floor_block_on_wall_enabled : Void* = Pointer(Void).null
    def set_floor_block_on_wall_enabled(enabled : Bool) : Void
      if @@mb_set_floor_block_on_wall_enabled.null?
        @@mb_set_floor_block_on_wall_enabled = Bridge.get_method_bind("CharacterBody2D", "set_floor_block_on_wall_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_floor_block_on_wall_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_floor_block_on_wall_enabled : Void* = Pointer(Void).null
    def is_floor_block_on_wall_enabled() : Bool
      if @@mb_is_floor_block_on_wall_enabled.null?
        @@mb_is_floor_block_on_wall_enabled = Bridge.get_method_bind("CharacterBody2D", "is_floor_block_on_wall_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_floor_block_on_wall_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_slide_on_ceiling_enabled : Void* = Pointer(Void).null
    def set_slide_on_ceiling_enabled(enabled : Bool) : Void
      if @@mb_set_slide_on_ceiling_enabled.null?
        @@mb_set_slide_on_ceiling_enabled = Bridge.get_method_bind("CharacterBody2D", "set_slide_on_ceiling_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_slide_on_ceiling_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_slide_on_ceiling_enabled : Void* = Pointer(Void).null
    def is_slide_on_ceiling_enabled() : Bool
      if @@mb_is_slide_on_ceiling_enabled.null?
        @@mb_is_slide_on_ceiling_enabled = Bridge.get_method_bind("CharacterBody2D", "is_slide_on_ceiling_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_slide_on_ceiling_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_platform_floor_layers : Void* = Pointer(Void).null
    def set_platform_floor_layers(exclude_layer : Int64) : Void
      if @@mb_set_platform_floor_layers.null?
        @@mb_set_platform_floor_layers = Bridge.get_method_bind("CharacterBody2D", "set_platform_floor_layers", 1286410249_i64)
      end
      val_0 = exclude_layer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_platform_floor_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_platform_floor_layers : Void* = Pointer(Void).null
    def get_platform_floor_layers() : Int64
      if @@mb_get_platform_floor_layers.null?
        @@mb_get_platform_floor_layers = Bridge.get_method_bind("CharacterBody2D", "get_platform_floor_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_platform_floor_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_platform_wall_layers : Void* = Pointer(Void).null
    def set_platform_wall_layers(exclude_layer : Int64) : Void
      if @@mb_set_platform_wall_layers.null?
        @@mb_set_platform_wall_layers = Bridge.get_method_bind("CharacterBody2D", "set_platform_wall_layers", 1286410249_i64)
      end
      val_0 = exclude_layer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_platform_wall_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_platform_wall_layers : Void* = Pointer(Void).null
    def get_platform_wall_layers() : Int64
      if @@mb_get_platform_wall_layers.null?
        @@mb_get_platform_wall_layers = Bridge.get_method_bind("CharacterBody2D", "get_platform_wall_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_platform_wall_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_max_slides : Void* = Pointer(Void).null
    def get_max_slides() : Int64
      if @@mb_get_max_slides.null?
        @@mb_get_max_slides = Bridge.get_method_bind("CharacterBody2D", "get_max_slides", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_slides, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_slides : Void* = Pointer(Void).null
    def set_max_slides(max_slides : Int64) : Void
      if @@mb_set_max_slides.null?
        @@mb_set_max_slides = Bridge.get_method_bind("CharacterBody2D", "set_max_slides", 1286410249_i64)
      end
      val_0 = max_slides
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_slides, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_floor_max_angle : Void* = Pointer(Void).null
    def get_floor_max_angle() : Float64
      if @@mb_get_floor_max_angle.null?
        @@mb_get_floor_max_angle = Bridge.get_method_bind("CharacterBody2D", "get_floor_max_angle", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_floor_max_angle, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_floor_max_angle : Void* = Pointer(Void).null
    def set_floor_max_angle(radians : Float64) : Void
      if @@mb_set_floor_max_angle.null?
        @@mb_set_floor_max_angle = Bridge.get_method_bind("CharacterBody2D", "set_floor_max_angle", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_floor_max_angle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_floor_snap_length : Void* = Pointer(Void).null
    def get_floor_snap_length() : Float64
      if @@mb_get_floor_snap_length.null?
        @@mb_get_floor_snap_length = Bridge.get_method_bind("CharacterBody2D", "get_floor_snap_length", 191475506_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_floor_snap_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_floor_snap_length : Void* = Pointer(Void).null
    def set_floor_snap_length(floor_snap_length : Float64) : Void
      if @@mb_set_floor_snap_length.null?
        @@mb_set_floor_snap_length = Bridge.get_method_bind("CharacterBody2D", "set_floor_snap_length", 373806689_i64)
      end
      val_0 = floor_snap_length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_floor_snap_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_wall_min_slide_angle : Void* = Pointer(Void).null
    def get_wall_min_slide_angle() : Float64
      if @@mb_get_wall_min_slide_angle.null?
        @@mb_get_wall_min_slide_angle = Bridge.get_method_bind("CharacterBody2D", "get_wall_min_slide_angle", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_wall_min_slide_angle, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_wall_min_slide_angle : Void* = Pointer(Void).null
    def set_wall_min_slide_angle(radians : Float64) : Void
      if @@mb_set_wall_min_slide_angle.null?
        @@mb_set_wall_min_slide_angle = Bridge.get_method_bind("CharacterBody2D", "set_wall_min_slide_angle", 373806689_i64)
      end
      val_0 = radians
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_wall_min_slide_angle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_up_direction : Void* = Pointer(Void).null
    def get_up_direction() : Vector2
      if @@mb_get_up_direction.null?
        @@mb_get_up_direction = Bridge.get_method_bind("CharacterBody2D", "get_up_direction", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_up_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_up_direction : Void* = Pointer(Void).null
    def set_up_direction(up_direction : Vector2) : Void
      if @@mb_set_up_direction.null?
        @@mb_set_up_direction = Bridge.get_method_bind("CharacterBody2D", "set_up_direction", 743155724_i64)
      end
      val_0 = up_direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_up_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_motion_mode : Void* = Pointer(Void).null
    def set_motion_mode(mode : Int64) : Void
      if @@mb_set_motion_mode.null?
        @@mb_set_motion_mode = Bridge.get_method_bind("CharacterBody2D", "set_motion_mode", 1224392233_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_motion_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_motion_mode : Void* = Pointer(Void).null
    def get_motion_mode() : Int64
      if @@mb_get_motion_mode.null?
        @@mb_get_motion_mode = Bridge.get_method_bind("CharacterBody2D", "get_motion_mode", 1160151236_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_motion_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_platform_on_leave : Void* = Pointer(Void).null
    def set_platform_on_leave(on_leave_apply_velocity : Int64) : Void
      if @@mb_set_platform_on_leave.null?
        @@mb_set_platform_on_leave = Bridge.get_method_bind("CharacterBody2D", "set_platform_on_leave", 2423324375_i64)
      end
      val_0 = on_leave_apply_velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_platform_on_leave, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_platform_on_leave : Void* = Pointer(Void).null
    def get_platform_on_leave() : Int64
      if @@mb_get_platform_on_leave.null?
        @@mb_get_platform_on_leave = Bridge.get_method_bind("CharacterBody2D", "get_platform_on_leave", 4054324341_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_platform_on_leave, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_on_floor : Void* = Pointer(Void).null
    def is_on_floor() : Bool
      if @@mb_is_on_floor.null?
        @@mb_is_on_floor = Bridge.get_method_bind("CharacterBody2D", "is_on_floor", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_floor, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_on_floor_only : Void* = Pointer(Void).null
    def is_on_floor_only() : Bool
      if @@mb_is_on_floor_only.null?
        @@mb_is_on_floor_only = Bridge.get_method_bind("CharacterBody2D", "is_on_floor_only", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_floor_only, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_on_ceiling : Void* = Pointer(Void).null
    def is_on_ceiling() : Bool
      if @@mb_is_on_ceiling.null?
        @@mb_is_on_ceiling = Bridge.get_method_bind("CharacterBody2D", "is_on_ceiling", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_ceiling, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_on_ceiling_only : Void* = Pointer(Void).null
    def is_on_ceiling_only() : Bool
      if @@mb_is_on_ceiling_only.null?
        @@mb_is_on_ceiling_only = Bridge.get_method_bind("CharacterBody2D", "is_on_ceiling_only", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_ceiling_only, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_on_wall : Void* = Pointer(Void).null
    def is_on_wall() : Bool
      if @@mb_is_on_wall.null?
        @@mb_is_on_wall = Bridge.get_method_bind("CharacterBody2D", "is_on_wall", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_wall, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_on_wall_only : Void* = Pointer(Void).null
    def is_on_wall_only() : Bool
      if @@mb_is_on_wall_only.null?
        @@mb_is_on_wall_only = Bridge.get_method_bind("CharacterBody2D", "is_on_wall_only", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_wall_only, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_floor_normal : Void* = Pointer(Void).null
    def get_floor_normal() : Vector2
      if @@mb_get_floor_normal.null?
        @@mb_get_floor_normal = Bridge.get_method_bind("CharacterBody2D", "get_floor_normal", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_floor_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_wall_normal : Void* = Pointer(Void).null
    def get_wall_normal() : Vector2
      if @@mb_get_wall_normal.null?
        @@mb_get_wall_normal = Bridge.get_method_bind("CharacterBody2D", "get_wall_normal", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_wall_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_last_motion : Void* = Pointer(Void).null
    def get_last_motion() : Vector2
      if @@mb_get_last_motion.null?
        @@mb_get_last_motion = Bridge.get_method_bind("CharacterBody2D", "get_last_motion", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_last_motion, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_position_delta : Void* = Pointer(Void).null
    def get_position_delta() : Vector2
      if @@mb_get_position_delta.null?
        @@mb_get_position_delta = Bridge.get_method_bind("CharacterBody2D", "get_position_delta", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_position_delta, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_real_velocity : Void* = Pointer(Void).null
    def get_real_velocity() : Vector2
      if @@mb_get_real_velocity.null?
        @@mb_get_real_velocity = Bridge.get_method_bind("CharacterBody2D", "get_real_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_real_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_floor_angle : Void* = Pointer(Void).null
    def get_floor_angle(up_direction : Vector2) : Float64
      if @@mb_get_floor_angle.null?
        @@mb_get_floor_angle = Bridge.get_method_bind("CharacterBody2D", "get_floor_angle", 2841063350_i64)
      end
      val_0 = up_direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_floor_angle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_platform_velocity : Void* = Pointer(Void).null
    def get_platform_velocity() : Vector2
      if @@mb_get_platform_velocity.null?
        @@mb_get_platform_velocity = Bridge.get_method_bind("CharacterBody2D", "get_platform_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_platform_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_slide_collision_count : Void* = Pointer(Void).null
    def get_slide_collision_count() : Int64
      if @@mb_get_slide_collision_count.null?
        @@mb_get_slide_collision_count = Bridge.get_method_bind("CharacterBody2D", "get_slide_collision_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_slide_collision_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_slide_collision : Void* = Pointer(Void).null
    def get_slide_collision(slide_idx : Int64) : KinematicCollision2D
      if @@mb_get_slide_collision.null?
        @@mb_get_slide_collision = Bridge.get_method_bind("CharacterBody2D", "get_slide_collision", 860659811_i64)
      end
      val_0 = slide_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_slide_collision, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      KinematicCollision2D.new(ret_ptr)
    end
    @@mb_get_last_slide_collision : Void* = Pointer(Void).null
    def get_last_slide_collision() : KinematicCollision2D
      if @@mb_get_last_slide_collision.null?
        @@mb_get_last_slide_collision = Bridge.get_method_bind("CharacterBody2D", "get_last_slide_collision", 2161834755_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_last_slide_collision, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      KinematicCollision2D.new(ret_ptr)
    end
  end
  class CircleShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_radius : Void* = Pointer(Void).null
    def set_radius(radius : Float64) : Void
      if @@mb_set_radius.null?
        @@mb_set_radius = Bridge.get_method_bind("CircleShape2D", "set_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_radius : Void* = Pointer(Void).null
    def get_radius() : Float64
      if @@mb_get_radius.null?
        @@mb_get_radius = Bridge.get_method_bind("CircleShape2D", "get_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class CollisionPolygon2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum BuildMode : Int64
      BuildSolids = 0_i64
      BuildSegments = 1_i64
    end
    @@mb_set_polygon : Void* = Pointer(Void).null
    def set_polygon(polygon : Void*) : Void
      if @@mb_set_polygon.null?
        @@mb_set_polygon = Bridge.get_method_bind("CollisionPolygon2D", "set_polygon", 1509147220_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_polygon : Void* = Pointer(Void).null
    def get_polygon() : Void*
      if @@mb_get_polygon.null?
        @@mb_get_polygon = Bridge.get_method_bind("CollisionPolygon2D", "get_polygon", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_polygon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_build_mode : Void* = Pointer(Void).null
    def set_build_mode(build_mode : Int64) : Void
      if @@mb_set_build_mode.null?
        @@mb_set_build_mode = Bridge.get_method_bind("CollisionPolygon2D", "set_build_mode", 2780803135_i64)
      end
      val_0 = build_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_build_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_build_mode : Void* = Pointer(Void).null
    def get_build_mode() : Int64
      if @@mb_get_build_mode.null?
        @@mb_get_build_mode = Bridge.get_method_bind("CollisionPolygon2D", "get_build_mode", 3044948800_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_build_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_disabled : Void* = Pointer(Void).null
    def set_disabled(disabled : Bool) : Void
      if @@mb_set_disabled.null?
        @@mb_set_disabled = Bridge.get_method_bind("CollisionPolygon2D", "set_disabled", 2586408642_i64)
      end
      val_0 = disabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_disabled : Void* = Pointer(Void).null
    def is_disabled() : Bool
      if @@mb_is_disabled.null?
        @@mb_is_disabled = Bridge.get_method_bind("CollisionPolygon2D", "is_disabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_disabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_one_way_collision : Void* = Pointer(Void).null
    def set_one_way_collision(enabled : Bool) : Void
      if @@mb_set_one_way_collision.null?
        @@mb_set_one_way_collision = Bridge.get_method_bind("CollisionPolygon2D", "set_one_way_collision", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_way_collision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_one_way_collision_enabled : Void* = Pointer(Void).null
    def is_one_way_collision_enabled() : Bool
      if @@mb_is_one_way_collision_enabled.null?
        @@mb_is_one_way_collision_enabled = Bridge.get_method_bind("CollisionPolygon2D", "is_one_way_collision_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_one_way_collision_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_one_way_collision_margin : Void* = Pointer(Void).null
    def set_one_way_collision_margin(margin : Float64) : Void
      if @@mb_set_one_way_collision_margin.null?
        @@mb_set_one_way_collision_margin = Bridge.get_method_bind("CollisionPolygon2D", "set_one_way_collision_margin", 373806689_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_way_collision_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_one_way_collision_margin : Void* = Pointer(Void).null
    def get_one_way_collision_margin() : Float64
      if @@mb_get_one_way_collision_margin.null?
        @@mb_get_one_way_collision_margin = Bridge.get_method_bind("CollisionPolygon2D", "get_one_way_collision_margin", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_one_way_collision_margin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_one_way_collision_direction : Void* = Pointer(Void).null
    def set_one_way_collision_direction(direction : Vector2) : Void
      if @@mb_set_one_way_collision_direction.null?
        @@mb_set_one_way_collision_direction = Bridge.get_method_bind("CollisionPolygon2D", "set_one_way_collision_direction", 743155724_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_way_collision_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_one_way_collision_direction : Void* = Pointer(Void).null
    def get_one_way_collision_direction() : Vector2
      if @@mb_get_one_way_collision_direction.null?
        @@mb_get_one_way_collision_direction = Bridge.get_method_bind("CollisionPolygon2D", "get_one_way_collision_direction", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_one_way_collision_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class CollisionShape2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_shape : Void* = Pointer(Void).null
    def set_shape(shape : Shape2D) : Void
      if @@mb_set_shape.null?
        @@mb_set_shape = Bridge.get_method_bind("CollisionShape2D", "set_shape", 771364740_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shape : Void* = Pointer(Void).null
    def get_shape() : Shape2D
      if @@mb_get_shape.null?
        @@mb_get_shape = Bridge.get_method_bind("CollisionShape2D", "get_shape", 522005891_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Shape2D.new(ret_ptr)
    end
    @@mb_set_disabled : Void* = Pointer(Void).null
    def set_disabled(disabled : Bool) : Void
      if @@mb_set_disabled.null?
        @@mb_set_disabled = Bridge.get_method_bind("CollisionShape2D", "set_disabled", 2586408642_i64)
      end
      val_0 = disabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_disabled : Void* = Pointer(Void).null
    def is_disabled() : Bool
      if @@mb_is_disabled.null?
        @@mb_is_disabled = Bridge.get_method_bind("CollisionShape2D", "is_disabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_disabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_one_way_collision : Void* = Pointer(Void).null
    def set_one_way_collision(enabled : Bool) : Void
      if @@mb_set_one_way_collision.null?
        @@mb_set_one_way_collision = Bridge.get_method_bind("CollisionShape2D", "set_one_way_collision", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_way_collision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_one_way_collision_enabled : Void* = Pointer(Void).null
    def is_one_way_collision_enabled() : Bool
      if @@mb_is_one_way_collision_enabled.null?
        @@mb_is_one_way_collision_enabled = Bridge.get_method_bind("CollisionShape2D", "is_one_way_collision_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_one_way_collision_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_one_way_collision_margin : Void* = Pointer(Void).null
    def set_one_way_collision_margin(margin : Float64) : Void
      if @@mb_set_one_way_collision_margin.null?
        @@mb_set_one_way_collision_margin = Bridge.get_method_bind("CollisionShape2D", "set_one_way_collision_margin", 373806689_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_way_collision_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_one_way_collision_margin : Void* = Pointer(Void).null
    def get_one_way_collision_margin() : Float64
      if @@mb_get_one_way_collision_margin.null?
        @@mb_get_one_way_collision_margin = Bridge.get_method_bind("CollisionShape2D", "get_one_way_collision_margin", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_one_way_collision_margin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_one_way_collision_direction : Void* = Pointer(Void).null
    def set_one_way_collision_direction(direction : Vector2) : Void
      if @@mb_set_one_way_collision_direction.null?
        @@mb_set_one_way_collision_direction = Bridge.get_method_bind("CollisionShape2D", "set_one_way_collision_direction", 743155724_i64)
      end
      val_0 = direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_way_collision_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_one_way_collision_direction : Void* = Pointer(Void).null
    def get_one_way_collision_direction() : Vector2
      if @@mb_get_one_way_collision_direction.null?
        @@mb_get_one_way_collision_direction = Bridge.get_method_bind("CollisionShape2D", "get_one_way_collision_direction", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_one_way_collision_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_debug_color : Void* = Pointer(Void).null
    def set_debug_color(color : Color) : Void
      if @@mb_set_debug_color.null?
        @@mb_set_debug_color = Bridge.get_method_bind("CollisionShape2D", "set_debug_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_debug_color : Void* = Pointer(Void).null
    def get_debug_color() : Color
      if @@mb_get_debug_color.null?
        @@mb_get_debug_color = Bridge.get_method_bind("CollisionShape2D", "get_debug_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_debug_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class CompressedTexture2D < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_load : Void* = Pointer(Void).null
    def load(path : String) : Int64
      if @@mb_load.null?
        @@mb_load = Bridge.get_method_bind("CompressedTexture2D", "load", 166001499_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_load, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_load_path : Void* = Pointer(Void).null
    def get_load_path() : String
      if @@mb_get_load_path.null?
        @@mb_get_load_path = Bridge.get_method_bind("CompressedTexture2D", "get_load_path", 201670096_i64)
      end
      ""
    end
  end
  class CompressedTexture2DArray < Godot::CompressedTextureLayered
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class ConcavePolygonShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_segments : Void* = Pointer(Void).null
    def set_segments(segments : Void*) : Void
      if @@mb_set_segments.null?
        @@mb_set_segments = Bridge.get_method_bind("ConcavePolygonShape2D", "set_segments", 1509147220_i64)
      end
      val_0 = segments
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_segments, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_segments : Void* = Pointer(Void).null
    def get_segments() : Void*
      if @@mb_get_segments.null?
        @@mb_get_segments = Bridge.get_method_bind("ConcavePolygonShape2D", "get_segments", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_segments, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class ConvexPolygonShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_point_cloud : Void* = Pointer(Void).null
    def set_point_cloud(point_cloud : Void*) : Void
      if @@mb_set_point_cloud.null?
        @@mb_set_point_cloud = Bridge.get_method_bind("ConvexPolygonShape2D", "set_point_cloud", 1509147220_i64)
      end
      val_0 = point_cloud
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_point_cloud, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_points : Void* = Pointer(Void).null
    def set_points(points : Void*) : Void
      if @@mb_set_points.null?
        @@mb_set_points = Bridge.get_method_bind("ConvexPolygonShape2D", "set_points", 1509147220_i64)
      end
      val_0 = points
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_points, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_points : Void* = Pointer(Void).null
    def get_points() : Void*
      if @@mb_get_points.null?
        @@mb_get_points = Bridge.get_method_bind("ConvexPolygonShape2D", "get_points", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_points, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class Curve2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_point_count : Void* = Pointer(Void).null
    def get_point_count() : Int64
      if @@mb_get_point_count.null?
        @@mb_get_point_count = Bridge.get_method_bind("Curve2D", "get_point_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_point_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_point_count : Void* = Pointer(Void).null
    def set_point_count(count : Int64) : Void
      if @@mb_set_point_count.null?
        @@mb_set_point_count = Bridge.get_method_bind("Curve2D", "set_point_count", 1286410249_i64)
      end
      val_0 = count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_point_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_point : Void* = Pointer(Void).null
    def add_point(position : Vector2, in_val : Vector2, out_val : Vector2, index : Int64) : Void
      if @@mb_add_point.null?
        @@mb_add_point = Bridge.get_method_bind("Curve2D", "add_point", 4175465202_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = in_val
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = out_val
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = index
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_add_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_point_position : Void* = Pointer(Void).null
    def set_point_position(idx : Int64, position : Vector2) : Void
      if @@mb_set_point_position.null?
        @@mb_set_point_position = Bridge.get_method_bind("Curve2D", "set_point_position", 163021252_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_point_position : Void* = Pointer(Void).null
    def get_point_position(idx : Int64) : Vector2
      if @@mb_get_point_position.null?
        @@mb_get_point_position = Bridge.get_method_bind("Curve2D", "get_point_position", 2299179447_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_point_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_point_in : Void* = Pointer(Void).null
    def set_point_in(idx : Int64, position : Vector2) : Void
      if @@mb_set_point_in.null?
        @@mb_set_point_in = Bridge.get_method_bind("Curve2D", "set_point_in", 163021252_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_in, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_point_in : Void* = Pointer(Void).null
    def get_point_in(idx : Int64) : Vector2
      if @@mb_get_point_in.null?
        @@mb_get_point_in = Bridge.get_method_bind("Curve2D", "get_point_in", 2299179447_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_point_in, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_point_out : Void* = Pointer(Void).null
    def set_point_out(idx : Int64, position : Vector2) : Void
      if @@mb_set_point_out.null?
        @@mb_set_point_out = Bridge.get_method_bind("Curve2D", "set_point_out", 163021252_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_out, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_point_out : Void* = Pointer(Void).null
    def get_point_out(idx : Int64) : Vector2
      if @@mb_get_point_out.null?
        @@mb_get_point_out = Bridge.get_method_bind("Curve2D", "get_point_out", 2299179447_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_point_out, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_remove_point : Void* = Pointer(Void).null
    def remove_point(idx : Int64) : Void
      if @@mb_remove_point.null?
        @@mb_remove_point = Bridge.get_method_bind("Curve2D", "remove_point", 1286410249_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_points : Void* = Pointer(Void).null
    def clear_points() : Void
      if @@mb_clear_points.null?
        @@mb_clear_points = Bridge.get_method_bind("Curve2D", "clear_points", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_points, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_sample : Void* = Pointer(Void).null
    def sample(idx : Int64, t : Float64) : Vector2
      if @@mb_sample.null?
        @@mb_sample = Bridge.get_method_bind("Curve2D", "sample", 26514310_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = t
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_sample, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_samplef : Void* = Pointer(Void).null
    def samplef(fofs : Float64) : Vector2
      if @@mb_samplef.null?
        @@mb_samplef = Bridge.get_method_bind("Curve2D", "samplef", 3588506812_i64)
      end
      val_0 = fofs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_samplef, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bake_interval : Void* = Pointer(Void).null
    def set_bake_interval(distance : Float64) : Void
      if @@mb_set_bake_interval.null?
        @@mb_set_bake_interval = Bridge.get_method_bind("Curve2D", "set_bake_interval", 373806689_i64)
      end
      val_0 = distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bake_interval, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bake_interval : Void* = Pointer(Void).null
    def get_bake_interval() : Float64
      if @@mb_get_bake_interval.null?
        @@mb_get_bake_interval = Bridge.get_method_bind("Curve2D", "get_bake_interval", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bake_interval, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_baked_length : Void* = Pointer(Void).null
    def get_baked_length() : Float64
      if @@mb_get_baked_length.null?
        @@mb_get_baked_length = Bridge.get_method_bind("Curve2D", "get_baked_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_baked_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_sample_baked : Void* = Pointer(Void).null
    def sample_baked(offset : Float64, cubic : Bool) : Vector2
      if @@mb_sample_baked.null?
        @@mb_sample_baked = Bridge.get_method_bind("Curve2D", "sample_baked", 3464257706_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = cubic
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_sample_baked, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_sample_baked_with_rotation : Void* = Pointer(Void).null
    def sample_baked_with_rotation(offset : Float64, cubic : Bool) : Transform2D
      if @@mb_sample_baked_with_rotation.null?
        @@mb_sample_baked_with_rotation = Bridge.get_method_bind("Curve2D", "sample_baked_with_rotation", 3296056341_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = cubic
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_sample_baked_with_rotation, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_get_baked_points : Void* = Pointer(Void).null
    def get_baked_points() : Void*
      if @@mb_get_baked_points.null?
        @@mb_get_baked_points = Bridge.get_method_bind("Curve2D", "get_baked_points", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_baked_points, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_closest_point : Void* = Pointer(Void).null
    def get_closest_point(to_point : Vector2) : Vector2
      if @@mb_get_closest_point.null?
        @@mb_get_closest_point = Bridge.get_method_bind("Curve2D", "get_closest_point", 2656412154_i64)
      end
      val_0 = to_point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_closest_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_closest_offset : Void* = Pointer(Void).null
    def get_closest_offset(to_point : Vector2) : Float64
      if @@mb_get_closest_offset.null?
        @@mb_get_closest_offset = Bridge.get_method_bind("Curve2D", "get_closest_offset", 2276447920_i64)
      end
      val_0 = to_point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_closest_offset, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_tessellate : Void* = Pointer(Void).null
    def tessellate(max_stages : Int64, tolerance_degrees : Float64) : Void*
      if @@mb_tessellate.null?
        @@mb_tessellate = Bridge.get_method_bind("Curve2D", "tessellate", 958145977_i64)
      end
      val_0 = max_stages
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tolerance_degrees
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_tessellate, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_tessellate_even_length : Void* = Pointer(Void).null
    def tessellate_even_length(max_stages : Int64, tolerance_length : Float64) : Void*
      if @@mb_tessellate_even_length.null?
        @@mb_tessellate_even_length = Bridge.get_method_bind("Curve2D", "tessellate_even_length", 2319761637_i64)
      end
      val_0 = max_stages
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = tolerance_length
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_tessellate_even_length, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class Joint2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_node_a : Void* = Pointer(Void).null
    def set_node_a(node : NodePath) : Void
      if @@mb_set_node_a.null?
        @@mb_set_node_a = Bridge.get_method_bind("Joint2D", "set_node_a", 1348162250_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_node_a, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node_a : Void* = Pointer(Void).null
    def get_node_a() : NodePath
      if @@mb_get_node_a.null?
        @@mb_get_node_a = Bridge.get_method_bind("Joint2D", "get_node_a", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_a, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_node_b : Void* = Pointer(Void).null
    def set_node_b(node : NodePath) : Void
      if @@mb_set_node_b.null?
        @@mb_set_node_b = Bridge.get_method_bind("Joint2D", "set_node_b", 1348162250_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_node_b, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_node_b : Void* = Pointer(Void).null
    def get_node_b() : NodePath
      if @@mb_get_node_b.null?
        @@mb_get_node_b = Bridge.get_method_bind("Joint2D", "get_node_b", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_node_b, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_bias : Void* = Pointer(Void).null
    def set_bias(bias : Float64) : Void
      if @@mb_set_bias.null?
        @@mb_set_bias = Bridge.get_method_bind("Joint2D", "set_bias", 373806689_i64)
      end
      val_0 = bias
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bias, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bias : Void* = Pointer(Void).null
    def get_bias() : Float64
      if @@mb_get_bias.null?
        @@mb_get_bias = Bridge.get_method_bind("Joint2D", "get_bias", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bias, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_exclude_nodes_from_collision : Void* = Pointer(Void).null
    def set_exclude_nodes_from_collision(enable : Bool) : Void
      if @@mb_set_exclude_nodes_from_collision.null?
        @@mb_set_exclude_nodes_from_collision = Bridge.get_method_bind("Joint2D", "set_exclude_nodes_from_collision", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude_nodes_from_collision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude_nodes_from_collision : Void* = Pointer(Void).null
    def get_exclude_nodes_from_collision() : Bool
      if @@mb_get_exclude_nodes_from_collision.null?
        @@mb_get_exclude_nodes_from_collision = Bridge.get_method_bind("Joint2D", "get_exclude_nodes_from_collision", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_exclude_nodes_from_collision, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_rid : Void* = Pointer(Void).null
    def get_rid() : Int64
      if @@mb_get_rid.null?
        @@mb_get_rid = Bridge.get_method_bind("Joint2D", "get_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class DampedSpringJoint2D < Godot::Joint2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_length : Void* = Pointer(Void).null
    def set_length(length : Float64) : Void
      if @@mb_set_length.null?
        @@mb_set_length = Bridge.get_method_bind("DampedSpringJoint2D", "set_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_length : Void* = Pointer(Void).null
    def get_length() : Float64
      if @@mb_get_length.null?
        @@mb_get_length = Bridge.get_method_bind("DampedSpringJoint2D", "get_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_rest_length : Void* = Pointer(Void).null
    def set_rest_length(rest_length : Float64) : Void
      if @@mb_set_rest_length.null?
        @@mb_set_rest_length = Bridge.get_method_bind("DampedSpringJoint2D", "set_rest_length", 373806689_i64)
      end
      val_0 = rest_length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rest_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_rest_length : Void* = Pointer(Void).null
    def get_rest_length() : Float64
      if @@mb_get_rest_length.null?
        @@mb_get_rest_length = Bridge.get_method_bind("DampedSpringJoint2D", "get_rest_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_rest_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_stiffness : Void* = Pointer(Void).null
    def set_stiffness(stiffness : Float64) : Void
      if @@mb_set_stiffness.null?
        @@mb_set_stiffness = Bridge.get_method_bind("DampedSpringJoint2D", "set_stiffness", 373806689_i64)
      end
      val_0 = stiffness
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stiffness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stiffness : Void* = Pointer(Void).null
    def get_stiffness() : Float64
      if @@mb_get_stiffness.null?
        @@mb_get_stiffness = Bridge.get_method_bind("DampedSpringJoint2D", "get_stiffness", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_stiffness, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_damping : Void* = Pointer(Void).null
    def set_damping(damping : Float64) : Void
      if @@mb_set_damping.null?
        @@mb_set_damping = Bridge.get_method_bind("DampedSpringJoint2D", "set_damping", 373806689_i64)
      end
      val_0 = damping
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_damping, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_damping : Void* = Pointer(Void).null
    def get_damping() : Float64
      if @@mb_get_damping.null?
        @@mb_get_damping = Bridge.get_method_bind("DampedSpringJoint2D", "get_damping", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_damping, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Light2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ShadowFilter : Int64
      ShadowFilterNone = 0_i64
      ShadowFilterPcf5 = 1_i64
      ShadowFilterPcf13 = 2_i64
    end
    enum BlendMode : Int64
      BlendModeAdd = 0_i64
      BlendModeSub = 1_i64
      BlendModeMix = 2_i64
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("Light2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_enabled : Void* = Pointer(Void).null
    def is_enabled() : Bool
      if @@mb_is_enabled.null?
        @@mb_is_enabled = Bridge.get_method_bind("Light2D", "is_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_editor_only : Void* = Pointer(Void).null
    def set_editor_only(editor_only : Bool) : Void
      if @@mb_set_editor_only.null?
        @@mb_set_editor_only = Bridge.get_method_bind("Light2D", "set_editor_only", 2586408642_i64)
      end
      val_0 = editor_only
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editor_only, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_editor_only : Void* = Pointer(Void).null
    def is_editor_only() : Bool
      if @@mb_is_editor_only.null?
        @@mb_is_editor_only = Bridge.get_method_bind("Light2D", "is_editor_only", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_editor_only, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_color : Void* = Pointer(Void).null
    def set_color(color : Color) : Void
      if @@mb_set_color.null?
        @@mb_set_color = Bridge.get_method_bind("Light2D", "set_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color : Void* = Pointer(Void).null
    def get_color() : Color
      if @@mb_get_color.null?
        @@mb_get_color = Bridge.get_method_bind("Light2D", "get_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_energy : Void* = Pointer(Void).null
    def set_energy(energy : Float64) : Void
      if @@mb_set_energy.null?
        @@mb_set_energy = Bridge.get_method_bind("Light2D", "set_energy", 373806689_i64)
      end
      val_0 = energy
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_energy, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_energy : Void* = Pointer(Void).null
    def get_energy() : Float64
      if @@mb_get_energy.null?
        @@mb_get_energy = Bridge.get_method_bind("Light2D", "get_energy", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_energy, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_z_range_min : Void* = Pointer(Void).null
    def set_z_range_min(z : Int64) : Void
      if @@mb_set_z_range_min.null?
        @@mb_set_z_range_min = Bridge.get_method_bind("Light2D", "set_z_range_min", 1286410249_i64)
      end
      val_0 = z
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_z_range_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_z_range_min : Void* = Pointer(Void).null
    def get_z_range_min() : Int64
      if @@mb_get_z_range_min.null?
        @@mb_get_z_range_min = Bridge.get_method_bind("Light2D", "get_z_range_min", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_z_range_min, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_z_range_max : Void* = Pointer(Void).null
    def set_z_range_max(z : Int64) : Void
      if @@mb_set_z_range_max.null?
        @@mb_set_z_range_max = Bridge.get_method_bind("Light2D", "set_z_range_max", 1286410249_i64)
      end
      val_0 = z
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_z_range_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_z_range_max : Void* = Pointer(Void).null
    def get_z_range_max() : Int64
      if @@mb_get_z_range_max.null?
        @@mb_get_z_range_max = Bridge.get_method_bind("Light2D", "get_z_range_max", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_z_range_max, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_layer_range_min : Void* = Pointer(Void).null
    def set_layer_range_min(layer : Int64) : Void
      if @@mb_set_layer_range_min.null?
        @@mb_set_layer_range_min = Bridge.get_method_bind("Light2D", "set_layer_range_min", 1286410249_i64)
      end
      val_0 = layer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_layer_range_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_layer_range_min : Void* = Pointer(Void).null
    def get_layer_range_min() : Int64
      if @@mb_get_layer_range_min.null?
        @@mb_get_layer_range_min = Bridge.get_method_bind("Light2D", "get_layer_range_min", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_layer_range_min, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_layer_range_max : Void* = Pointer(Void).null
    def set_layer_range_max(layer : Int64) : Void
      if @@mb_set_layer_range_max.null?
        @@mb_set_layer_range_max = Bridge.get_method_bind("Light2D", "set_layer_range_max", 1286410249_i64)
      end
      val_0 = layer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_layer_range_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_layer_range_max : Void* = Pointer(Void).null
    def get_layer_range_max() : Int64
      if @@mb_get_layer_range_max.null?
        @@mb_get_layer_range_max = Bridge.get_method_bind("Light2D", "get_layer_range_max", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_layer_range_max, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_item_cull_mask : Void* = Pointer(Void).null
    def set_item_cull_mask(item_cull_mask : Int64) : Void
      if @@mb_set_item_cull_mask.null?
        @@mb_set_item_cull_mask = Bridge.get_method_bind("Light2D", "set_item_cull_mask", 1286410249_i64)
      end
      val_0 = item_cull_mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_item_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_cull_mask : Void* = Pointer(Void).null
    def get_item_cull_mask() : Int64
      if @@mb_get_item_cull_mask.null?
        @@mb_get_item_cull_mask = Bridge.get_method_bind("Light2D", "get_item_cull_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_item_cull_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_item_shadow_cull_mask : Void* = Pointer(Void).null
    def set_item_shadow_cull_mask(item_shadow_cull_mask : Int64) : Void
      if @@mb_set_item_shadow_cull_mask.null?
        @@mb_set_item_shadow_cull_mask = Bridge.get_method_bind("Light2D", "set_item_shadow_cull_mask", 1286410249_i64)
      end
      val_0 = item_shadow_cull_mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_item_shadow_cull_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_item_shadow_cull_mask : Void* = Pointer(Void).null
    def get_item_shadow_cull_mask() : Int64
      if @@mb_get_item_shadow_cull_mask.null?
        @@mb_get_item_shadow_cull_mask = Bridge.get_method_bind("Light2D", "get_item_shadow_cull_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_item_shadow_cull_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_shadow_enabled : Void* = Pointer(Void).null
    def set_shadow_enabled(enabled : Bool) : Void
      if @@mb_set_shadow_enabled.null?
        @@mb_set_shadow_enabled = Bridge.get_method_bind("Light2D", "set_shadow_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shadow_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_shadow_enabled : Void* = Pointer(Void).null
    def is_shadow_enabled() : Bool
      if @@mb_is_shadow_enabled.null?
        @@mb_is_shadow_enabled = Bridge.get_method_bind("Light2D", "is_shadow_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_shadow_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shadow_smooth : Void* = Pointer(Void).null
    def set_shadow_smooth(smooth : Float64) : Void
      if @@mb_set_shadow_smooth.null?
        @@mb_set_shadow_smooth = Bridge.get_method_bind("Light2D", "set_shadow_smooth", 373806689_i64)
      end
      val_0 = smooth
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shadow_smooth, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shadow_smooth : Void* = Pointer(Void).null
    def get_shadow_smooth() : Float64
      if @@mb_get_shadow_smooth.null?
        @@mb_get_shadow_smooth = Bridge.get_method_bind("Light2D", "get_shadow_smooth", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_shadow_smooth, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_shadow_filter : Void* = Pointer(Void).null
    def set_shadow_filter(filter : Int64) : Void
      if @@mb_set_shadow_filter.null?
        @@mb_set_shadow_filter = Bridge.get_method_bind("Light2D", "set_shadow_filter", 3209356555_i64)
      end
      val_0 = filter
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shadow_filter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shadow_filter : Void* = Pointer(Void).null
    def get_shadow_filter() : Int64
      if @@mb_get_shadow_filter.null?
        @@mb_get_shadow_filter = Bridge.get_method_bind("Light2D", "get_shadow_filter", 1973619177_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_shadow_filter, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_shadow_color : Void* = Pointer(Void).null
    def set_shadow_color(shadow_color : Color) : Void
      if @@mb_set_shadow_color.null?
        @@mb_set_shadow_color = Bridge.get_method_bind("Light2D", "set_shadow_color", 2920490490_i64)
      end
      val_0 = shadow_color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shadow_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shadow_color : Void* = Pointer(Void).null
    def get_shadow_color() : Color
      if @@mb_get_shadow_color.null?
        @@mb_get_shadow_color = Bridge.get_method_bind("Light2D", "get_shadow_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_shadow_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_blend_mode : Void* = Pointer(Void).null
    def set_blend_mode(mode : Int64) : Void
      if @@mb_set_blend_mode.null?
        @@mb_set_blend_mode = Bridge.get_method_bind("Light2D", "set_blend_mode", 2916638796_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_blend_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_blend_mode : Void* = Pointer(Void).null
    def get_blend_mode() : Int64
      if @@mb_get_blend_mode.null?
        @@mb_get_blend_mode = Bridge.get_method_bind("Light2D", "get_blend_mode", 936255250_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_blend_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_height : Void* = Pointer(Void).null
    def set_height(height : Float64) : Void
      if @@mb_set_height.null?
        @@mb_set_height = Bridge.get_method_bind("Light2D", "set_height", 373806689_i64)
      end
      val_0 = height
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_height, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_height : Void* = Pointer(Void).null
    def get_height() : Float64
      if @@mb_get_height.null?
        @@mb_get_height = Bridge.get_method_bind("Light2D", "get_height", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_height, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class DirectionalLight2D < Godot::Light2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_max_distance : Void* = Pointer(Void).null
    def set_max_distance(pixels : Float64) : Void
      if @@mb_set_max_distance.null?
        @@mb_set_max_distance = Bridge.get_method_bind("DirectionalLight2D", "set_max_distance", 373806689_i64)
      end
      val_0 = pixels
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_distance : Void* = Pointer(Void).null
    def get_max_distance() : Float64
      if @@mb_get_max_distance.null?
        @@mb_get_max_distance = Bridge.get_method_bind("DirectionalLight2D", "get_max_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_max_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class DrawableTexture2D < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum DrawableFormat : Int64
      DrawableFormatRgba8 = 0_i64
      DrawableFormatRgba8Srgb = 1_i64
      DrawableFormatRgbah = 2_i64
      DrawableFormatRgbaf = 3_i64
    end
    @@mb_set_format : Void* = Pointer(Void).null
    def set_format(format : Int64) : Void
      if @@mb_set_format.null?
        @@mb_set_format = Bridge.get_method_bind("DrawableTexture2D", "set_format", 2875673594_i64)
      end
      val_0 = format
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_format, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_use_mipmaps : Void* = Pointer(Void).null
    def set_use_mipmaps(mipmaps : Bool) : Void
      if @@mb_set_use_mipmaps.null?
        @@mb_set_use_mipmaps = Bridge.get_method_bind("DrawableTexture2D", "set_use_mipmaps", 2586408642_i64)
      end
      val_0 = mipmaps
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_mipmaps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_use_mipmaps : Void* = Pointer(Void).null
    def get_use_mipmaps() : Bool
      if @@mb_get_use_mipmaps.null?
        @@mb_get_use_mipmaps = Bridge.get_method_bind("DrawableTexture2D", "get_use_mipmaps", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_mipmaps, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_setup : Void* = Pointer(Void).null
    def setup(width : Int64, height : Int64, format : Int64, color : Color, use_mipmaps : Bool) : Void
      if @@mb_setup.null?
        @@mb_setup = Bridge.get_method_bind("DrawableTexture2D", "setup", 674365339_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = height
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = format
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = color
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = use_mipmaps
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_setup, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_blit_rect : Void* = Pointer(Void).null
    def blit_rect(rect : Rect2i, source : Texture2D, modulate : Color, mipmap : Int64, material : Material) : Void
      if @@mb_blit_rect.null?
        @@mb_blit_rect = Bridge.get_method_bind("DrawableTexture2D", "blit_rect", 319217173_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = source
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = modulate
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = mipmap
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = material
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_blit_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_blit_rect_multi : Void* = Pointer(Void).null
    def blit_rect_multi(rect : Rect2i, sources : Godot::Array, extra_targets : Godot::Array, modulate : Color, mipmap : Int64, material : Material) : Void
      if @@mb_blit_rect_multi.null?
        @@mb_blit_rect_multi = Bridge.get_method_bind("DrawableTexture2D", "blit_rect_multi", 3074783066_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      arg_ptr_1 = sources ? sources.pointer : Pointer(Void).null
      arg_1 = pointerof(arg_ptr_1).as(Void*)
      arg_ptr_2 = extra_targets ? extra_targets.pointer : Pointer(Void).null
      arg_2 = pointerof(arg_ptr_2).as(Void*)
      val_3 = modulate
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = mipmap
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = material
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_blit_rect_multi, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_generate_mipmaps : Void* = Pointer(Void).null
    def generate_mipmaps() : Void
      if @@mb_generate_mipmaps.null?
        @@mb_generate_mipmaps = Bridge.get_method_bind("DrawableTexture2D", "generate_mipmaps", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_generate_mipmaps, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
  end
  class GPUParticles2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum DrawOrder : Int64
      DrawOrderIndex = 0_i64
      DrawOrderLifetime = 1_i64
      DrawOrderReverseLifetime = 2_i64
    end
    enum EmitFlags : Int64
      EmitFlagPosition = 1_i64
      EmitFlagRotationScale = 2_i64
      EmitFlagVelocity = 4_i64
      EmitFlagColor = 8_i64
      EmitFlagCustom = 16_i64
    end
    @@mb_set_emitting : Void* = Pointer(Void).null
    def set_emitting(emitting : Bool) : Void
      if @@mb_set_emitting.null?
        @@mb_set_emitting = Bridge.get_method_bind("GPUParticles2D", "set_emitting", 2586408642_i64)
      end
      val_0 = emitting
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_emitting, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_amount : Void* = Pointer(Void).null
    def set_amount(amount : Int64) : Void
      if @@mb_set_amount.null?
        @@mb_set_amount = Bridge.get_method_bind("GPUParticles2D", "set_amount", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_amount, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_lifetime : Void* = Pointer(Void).null
    def set_lifetime(secs : Float64) : Void
      if @@mb_set_lifetime.null?
        @@mb_set_lifetime = Bridge.get_method_bind("GPUParticles2D", "set_lifetime", 373806689_i64)
      end
      val_0 = secs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_lifetime, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_one_shot : Void* = Pointer(Void).null
    def set_one_shot(secs : Bool) : Void
      if @@mb_set_one_shot.null?
        @@mb_set_one_shot = Bridge.get_method_bind("GPUParticles2D", "set_one_shot", 2586408642_i64)
      end
      val_0 = secs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_one_shot, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_pre_process_time : Void* = Pointer(Void).null
    def set_pre_process_time(secs : Float64) : Void
      if @@mb_set_pre_process_time.null?
        @@mb_set_pre_process_time = Bridge.get_method_bind("GPUParticles2D", "set_pre_process_time", 373806689_i64)
      end
      val_0 = secs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pre_process_time, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_explosiveness_ratio : Void* = Pointer(Void).null
    def set_explosiveness_ratio(ratio : Float64) : Void
      if @@mb_set_explosiveness_ratio.null?
        @@mb_set_explosiveness_ratio = Bridge.get_method_bind("GPUParticles2D", "set_explosiveness_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_explosiveness_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_randomness_ratio : Void* = Pointer(Void).null
    def set_randomness_ratio(ratio : Float64) : Void
      if @@mb_set_randomness_ratio.null?
        @@mb_set_randomness_ratio = Bridge.get_method_bind("GPUParticles2D", "set_randomness_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_randomness_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_visibility_rect : Void* = Pointer(Void).null
    def set_visibility_rect(visibility_rect : Rect2) : Void
      if @@mb_set_visibility_rect.null?
        @@mb_set_visibility_rect = Bridge.get_method_bind("GPUParticles2D", "set_visibility_rect", 2046264180_i64)
      end
      val_0 = visibility_rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_visibility_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_use_local_coordinates : Void* = Pointer(Void).null
    def set_use_local_coordinates(enable : Bool) : Void
      if @@mb_set_use_local_coordinates.null?
        @@mb_set_use_local_coordinates = Bridge.get_method_bind("GPUParticles2D", "set_use_local_coordinates", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_local_coordinates, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_fixed_fps : Void* = Pointer(Void).null
    def set_fixed_fps(fps : Int64) : Void
      if @@mb_set_fixed_fps.null?
        @@mb_set_fixed_fps = Bridge.get_method_bind("GPUParticles2D", "set_fixed_fps", 1286410249_i64)
      end
      val_0 = fps
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fixed_fps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_fractional_delta : Void* = Pointer(Void).null
    def set_fractional_delta(enable : Bool) : Void
      if @@mb_set_fractional_delta.null?
        @@mb_set_fractional_delta = Bridge.get_method_bind("GPUParticles2D", "set_fractional_delta", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fractional_delta, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_interpolate : Void* = Pointer(Void).null
    def set_interpolate(enable : Bool) : Void
      if @@mb_set_interpolate.null?
        @@mb_set_interpolate = Bridge.get_method_bind("GPUParticles2D", "set_interpolate", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_interpolate, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_process_material : Void* = Pointer(Void).null
    def set_process_material(material : Material) : Void
      if @@mb_set_process_material.null?
        @@mb_set_process_material = Bridge.get_method_bind("GPUParticles2D", "set_process_material", 2757459619_i64)
      end
      val_0 = material
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_process_material, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_speed_scale : Void* = Pointer(Void).null
    def set_speed_scale(scale : Float64) : Void
      if @@mb_set_speed_scale.null?
        @@mb_set_speed_scale = Bridge.get_method_bind("GPUParticles2D", "set_speed_scale", 373806689_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_speed_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_collision_base_size : Void* = Pointer(Void).null
    def set_collision_base_size(size : Float64) : Void
      if @@mb_set_collision_base_size.null?
        @@mb_set_collision_base_size = Bridge.get_method_bind("GPUParticles2D", "set_collision_base_size", 373806689_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_base_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_interp_to_end : Void* = Pointer(Void).null
    def set_interp_to_end(interp : Float64) : Void
      if @@mb_set_interp_to_end.null?
        @@mb_set_interp_to_end = Bridge.get_method_bind("GPUParticles2D", "set_interp_to_end", 373806689_i64)
      end
      val_0 = interp
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_interp_to_end, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_request_particles_process : Void* = Pointer(Void).null
    def request_particles_process(process_time : Float64, process_time_residual : Float64) : Void
      if @@mb_request_particles_process.null?
        @@mb_request_particles_process = Bridge.get_method_bind("GPUParticles2D", "request_particles_process", 2019720106_i64)
      end
      val_0 = process_time
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = process_time_residual
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_request_particles_process, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_emitting : Void* = Pointer(Void).null
    def is_emitting() : Bool
      if @@mb_is_emitting.null?
        @@mb_is_emitting = Bridge.get_method_bind("GPUParticles2D", "is_emitting", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_emitting, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_amount : Void* = Pointer(Void).null
    def get_amount() : Int64
      if @@mb_get_amount.null?
        @@mb_get_amount = Bridge.get_method_bind("GPUParticles2D", "get_amount", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_amount, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_lifetime : Void* = Pointer(Void).null
    def get_lifetime() : Float64
      if @@mb_get_lifetime.null?
        @@mb_get_lifetime = Bridge.get_method_bind("GPUParticles2D", "get_lifetime", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_lifetime, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_one_shot : Void* = Pointer(Void).null
    def get_one_shot() : Bool
      if @@mb_get_one_shot.null?
        @@mb_get_one_shot = Bridge.get_method_bind("GPUParticles2D", "get_one_shot", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_one_shot, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_pre_process_time : Void* = Pointer(Void).null
    def get_pre_process_time() : Float64
      if @@mb_get_pre_process_time.null?
        @@mb_get_pre_process_time = Bridge.get_method_bind("GPUParticles2D", "get_pre_process_time", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_pre_process_time, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_explosiveness_ratio : Void* = Pointer(Void).null
    def get_explosiveness_ratio() : Float64
      if @@mb_get_explosiveness_ratio.null?
        @@mb_get_explosiveness_ratio = Bridge.get_method_bind("GPUParticles2D", "get_explosiveness_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_explosiveness_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_randomness_ratio : Void* = Pointer(Void).null
    def get_randomness_ratio() : Float64
      if @@mb_get_randomness_ratio.null?
        @@mb_get_randomness_ratio = Bridge.get_method_bind("GPUParticles2D", "get_randomness_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_randomness_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_visibility_rect : Void* = Pointer(Void).null
    def get_visibility_rect() : Rect2
      if @@mb_get_visibility_rect.null?
        @@mb_get_visibility_rect = Bridge.get_method_bind("GPUParticles2D", "get_visibility_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_visibility_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_get_use_local_coordinates : Void* = Pointer(Void).null
    def get_use_local_coordinates() : Bool
      if @@mb_get_use_local_coordinates.null?
        @@mb_get_use_local_coordinates = Bridge.get_method_bind("GPUParticles2D", "get_use_local_coordinates", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_local_coordinates, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_fixed_fps : Void* = Pointer(Void).null
    def get_fixed_fps() : Int64
      if @@mb_get_fixed_fps.null?
        @@mb_get_fixed_fps = Bridge.get_method_bind("GPUParticles2D", "get_fixed_fps", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fixed_fps, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_fractional_delta : Void* = Pointer(Void).null
    def get_fractional_delta() : Bool
      if @@mb_get_fractional_delta.null?
        @@mb_get_fractional_delta = Bridge.get_method_bind("GPUParticles2D", "get_fractional_delta", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_fractional_delta, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_interpolate : Void* = Pointer(Void).null
    def get_interpolate() : Bool
      if @@mb_get_interpolate.null?
        @@mb_get_interpolate = Bridge.get_method_bind("GPUParticles2D", "get_interpolate", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_interpolate, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_process_material : Void* = Pointer(Void).null
    def get_process_material() : Material
      if @@mb_get_process_material.null?
        @@mb_get_process_material = Bridge.get_method_bind("GPUParticles2D", "get_process_material", 5934680_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_process_material, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Material.new(ret_ptr)
    end
    @@mb_get_speed_scale : Void* = Pointer(Void).null
    def get_speed_scale() : Float64
      if @@mb_get_speed_scale.null?
        @@mb_get_speed_scale = Bridge.get_method_bind("GPUParticles2D", "get_speed_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_speed_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_base_size : Void* = Pointer(Void).null
    def get_collision_base_size() : Float64
      if @@mb_get_collision_base_size.null?
        @@mb_get_collision_base_size = Bridge.get_method_bind("GPUParticles2D", "get_collision_base_size", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_collision_base_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_interp_to_end : Void* = Pointer(Void).null
    def get_interp_to_end() : Float64
      if @@mb_get_interp_to_end.null?
        @@mb_get_interp_to_end = Bridge.get_method_bind("GPUParticles2D", "get_interp_to_end", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_interp_to_end, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_draw_order : Void* = Pointer(Void).null
    def set_draw_order(order : Int64) : Void
      if @@mb_set_draw_order.null?
        @@mb_set_draw_order = Bridge.get_method_bind("GPUParticles2D", "set_draw_order", 1939677959_i64)
      end
      val_0 = order
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_draw_order, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_draw_order : Void* = Pointer(Void).null
    def get_draw_order() : Int64
      if @@mb_get_draw_order.null?
        @@mb_get_draw_order = Bridge.get_method_bind("GPUParticles2D", "get_draw_order", 941479095_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_draw_order, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("GPUParticles2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("GPUParticles2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_capture_rect : Void* = Pointer(Void).null
    def capture_rect() : Rect2
      if @@mb_capture_rect.null?
        @@mb_capture_rect = Bridge.get_method_bind("GPUParticles2D", "capture_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_capture_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_restart : Void* = Pointer(Void).null
    def restart(keep_seed : Bool) : Void
      if @@mb_restart.null?
        @@mb_restart = Bridge.get_method_bind("GPUParticles2D", "restart", 107499316_i64)
      end
      val_0 = keep_seed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_restart, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_sub_emitter : Void* = Pointer(Void).null
    def set_sub_emitter(path : NodePath) : Void
      if @@mb_set_sub_emitter.null?
        @@mb_set_sub_emitter = Bridge.get_method_bind("GPUParticles2D", "set_sub_emitter", 1348162250_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_sub_emitter, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_sub_emitter : Void* = Pointer(Void).null
    def get_sub_emitter() : NodePath
      if @@mb_get_sub_emitter.null?
        @@mb_get_sub_emitter = Bridge.get_method_bind("GPUParticles2D", "get_sub_emitter", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_sub_emitter, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_emit_particle : Void* = Pointer(Void).null
    def emit_particle(xform : Transform2D, velocity : Vector2, color : Color, custom : Color, flags : Int64) : Void
      if @@mb_emit_particle.null?
        @@mb_emit_particle = Bridge.get_method_bind("GPUParticles2D", "emit_particle", 2179202058_i64)
      end
      val_0 = xform
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = velocity
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = color
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = custom
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = flags
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_emit_particle, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_trail_enabled : Void* = Pointer(Void).null
    def set_trail_enabled(enabled : Bool) : Void
      if @@mb_set_trail_enabled.null?
        @@mb_set_trail_enabled = Bridge.get_method_bind("GPUParticles2D", "set_trail_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_trail_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_trail_lifetime : Void* = Pointer(Void).null
    def set_trail_lifetime(secs : Float64) : Void
      if @@mb_set_trail_lifetime.null?
        @@mb_set_trail_lifetime = Bridge.get_method_bind("GPUParticles2D", "set_trail_lifetime", 373806689_i64)
      end
      val_0 = secs
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_trail_lifetime, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_trail_enabled : Void* = Pointer(Void).null
    def is_trail_enabled() : Bool
      if @@mb_is_trail_enabled.null?
        @@mb_is_trail_enabled = Bridge.get_method_bind("GPUParticles2D", "is_trail_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_trail_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_trail_lifetime : Void* = Pointer(Void).null
    def get_trail_lifetime() : Float64
      if @@mb_get_trail_lifetime.null?
        @@mb_get_trail_lifetime = Bridge.get_method_bind("GPUParticles2D", "get_trail_lifetime", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_trail_lifetime, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_trail_sections : Void* = Pointer(Void).null
    def set_trail_sections(sections : Int64) : Void
      if @@mb_set_trail_sections.null?
        @@mb_set_trail_sections = Bridge.get_method_bind("GPUParticles2D", "set_trail_sections", 1286410249_i64)
      end
      val_0 = sections
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_trail_sections, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_trail_sections : Void* = Pointer(Void).null
    def get_trail_sections() : Int64
      if @@mb_get_trail_sections.null?
        @@mb_get_trail_sections = Bridge.get_method_bind("GPUParticles2D", "get_trail_sections", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_trail_sections, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_trail_section_subdivisions : Void* = Pointer(Void).null
    def set_trail_section_subdivisions(subdivisions : Int64) : Void
      if @@mb_set_trail_section_subdivisions.null?
        @@mb_set_trail_section_subdivisions = Bridge.get_method_bind("GPUParticles2D", "set_trail_section_subdivisions", 1286410249_i64)
      end
      val_0 = subdivisions
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_trail_section_subdivisions, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_trail_section_subdivisions : Void* = Pointer(Void).null
    def get_trail_section_subdivisions() : Int64
      if @@mb_get_trail_section_subdivisions.null?
        @@mb_get_trail_section_subdivisions = Bridge.get_method_bind("GPUParticles2D", "get_trail_section_subdivisions", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_trail_section_subdivisions, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_convert_from_particles : Void* = Pointer(Void).null
    def convert_from_particles(particles : Node) : Void
      if @@mb_convert_from_particles.null?
        @@mb_convert_from_particles = Bridge.get_method_bind("GPUParticles2D", "convert_from_particles", 1078189570_i64)
      end
      arg_ptr_0 = particles ? particles.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_convert_from_particles, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_amount_ratio : Void* = Pointer(Void).null
    def set_amount_ratio(ratio : Float64) : Void
      if @@mb_set_amount_ratio.null?
        @@mb_set_amount_ratio = Bridge.get_method_bind("GPUParticles2D", "set_amount_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_amount_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_amount_ratio : Void* = Pointer(Void).null
    def get_amount_ratio() : Float64
      if @@mb_get_amount_ratio.null?
        @@mb_get_amount_ratio = Bridge.get_method_bind("GPUParticles2D", "get_amount_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_amount_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_fixed_seed : Void* = Pointer(Void).null
    def set_use_fixed_seed(use_fixed_seed : Bool) : Void
      if @@mb_set_use_fixed_seed.null?
        @@mb_set_use_fixed_seed = Bridge.get_method_bind("GPUParticles2D", "set_use_fixed_seed", 2586408642_i64)
      end
      val_0 = use_fixed_seed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_fixed_seed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_use_fixed_seed : Void* = Pointer(Void).null
    def get_use_fixed_seed() : Bool
      if @@mb_get_use_fixed_seed.null?
        @@mb_get_use_fixed_seed = Bridge.get_method_bind("GPUParticles2D", "get_use_fixed_seed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_fixed_seed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_seed : Void* = Pointer(Void).null
    def set_seed(seed : Int64) : Void
      if @@mb_set_seed.null?
        @@mb_set_seed = Bridge.get_method_bind("GPUParticles2D", "set_seed", 1286410249_i64)
      end
      val_0 = seed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_seed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_seed : Void* = Pointer(Void).null
    def get_seed() : Int64
      if @@mb_get_seed.null?
        @@mb_get_seed = Bridge.get_method_bind("GPUParticles2D", "get_seed", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_seed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Geometry2D < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum PolyBooleanOperation : Int64
      OperationUnion = 0_i64
      OperationDifference = 1_i64
      OperationIntersection = 2_i64
      OperationXor = 3_i64
    end
    enum PolyJoinType : Int64
      JoinSquare = 0_i64
      JoinRound = 1_i64
      JoinMiter = 2_i64
    end
    enum PolyEndType : Int64
      EndPolygon = 0_i64
      EndJoined = 1_i64
      EndButt = 2_i64
      EndSquare = 3_i64
      EndRound = 4_i64
    end
    @@mb_is_point_in_circle : Void* = Pointer(Void).null
    def is_point_in_circle(point : Vector2, circle_position : Vector2, circle_radius : Float64) : Bool
      if @@mb_is_point_in_circle.null?
        @@mb_is_point_in_circle = Bridge.get_method_bind("Geometry2D", "is_point_in_circle", 2929491703_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = circle_position
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = circle_radius
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_point_in_circle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_segment_intersects_circle : Void* = Pointer(Void).null
    def segment_intersects_circle(segment_from : Vector2, segment_to : Vector2, circle_position : Vector2, circle_radius : Float64) : Float64
      if @@mb_segment_intersects_circle.null?
        @@mb_segment_intersects_circle = Bridge.get_method_bind("Geometry2D", "segment_intersects_circle", 1356928167_i64)
      end
      val_0 = segment_from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = segment_to
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = circle_position
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = circle_radius
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_segment_intersects_circle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_segment_intersects_segment : Void* = Pointer(Void).null
    def segment_intersects_segment(from_a : Vector2, to_a : Vector2, from_b : Vector2, to_b : Vector2) : Void*
      if @@mb_segment_intersects_segment.null?
        @@mb_segment_intersects_segment = Bridge.get_method_bind("Geometry2D", "segment_intersects_segment", 2058025344_i64)
      end
      val_0 = from_a
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_a
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_b
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = to_b
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_segment_intersects_segment, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_line_intersects_line : Void* = Pointer(Void).null
    def line_intersects_line(from_a : Vector2, dir_a : Vector2, from_b : Vector2, dir_b : Vector2) : Void*
      if @@mb_line_intersects_line.null?
        @@mb_line_intersects_line = Bridge.get_method_bind("Geometry2D", "line_intersects_line", 2058025344_i64)
      end
      val_0 = from_a
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = dir_a
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = from_b
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = dir_b
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_line_intersects_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_closest_points_between_segments : Void* = Pointer(Void).null
    def get_closest_points_between_segments(p1 : Vector2, q1 : Vector2, p2 : Vector2, q2 : Vector2) : Void*
      if @@mb_get_closest_points_between_segments.null?
        @@mb_get_closest_points_between_segments = Bridge.get_method_bind("Geometry2D", "get_closest_points_between_segments", 3344690961_i64)
      end
      val_0 = p1
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = q1
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = p2
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = q2
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_closest_points_between_segments, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_closest_point_to_segment : Void* = Pointer(Void).null
    def get_closest_point_to_segment(point : Vector2, s1 : Vector2, s2 : Vector2) : Vector2
      if @@mb_get_closest_point_to_segment.null?
        @@mb_get_closest_point_to_segment = Bridge.get_method_bind("Geometry2D", "get_closest_point_to_segment", 4172901909_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = s1
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = s2
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_closest_point_to_segment, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_closest_point_to_segment_uncapped : Void* = Pointer(Void).null
    def get_closest_point_to_segment_uncapped(point : Vector2, s1 : Vector2, s2 : Vector2) : Vector2
      if @@mb_get_closest_point_to_segment_uncapped.null?
        @@mb_get_closest_point_to_segment_uncapped = Bridge.get_method_bind("Geometry2D", "get_closest_point_to_segment_uncapped", 4172901909_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = s1
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = s2
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_closest_point_to_segment_uncapped, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_point_is_inside_triangle : Void* = Pointer(Void).null
    def point_is_inside_triangle(point : Vector2, a : Vector2, b : Vector2, c : Vector2) : Bool
      if @@mb_point_is_inside_triangle.null?
        @@mb_point_is_inside_triangle = Bridge.get_method_bind("Geometry2D", "point_is_inside_triangle", 1025948137_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = a
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = b
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = c
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0_u8
      Bridge.ptrcall(@@mb_point_is_inside_triangle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_polygon_clockwise : Void* = Pointer(Void).null
    def is_polygon_clockwise(polygon : Void*) : Bool
      if @@mb_is_polygon_clockwise.null?
        @@mb_is_polygon_clockwise = Bridge.get_method_bind("Geometry2D", "is_polygon_clockwise", 1361156557_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_polygon_clockwise, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_point_in_polygon : Void* = Pointer(Void).null
    def is_point_in_polygon(point : Vector2, polygon : Void*) : Bool
      if @@mb_is_point_in_polygon.null?
        @@mb_is_point_in_polygon = Bridge.get_method_bind("Geometry2D", "is_point_in_polygon", 738277916_i64)
      end
      val_0 = point
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_point_in_polygon, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_triangulate_polygon : Void* = Pointer(Void).null
    def triangulate_polygon(polygon : Void*) : Void*
      if @@mb_triangulate_polygon.null?
        @@mb_triangulate_polygon = Bridge.get_method_bind("Geometry2D", "triangulate_polygon", 1389921771_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_triangulate_polygon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_triangulate_delaunay : Void* = Pointer(Void).null
    def triangulate_delaunay(points : Void*) : Void*
      if @@mb_triangulate_delaunay.null?
        @@mb_triangulate_delaunay = Bridge.get_method_bind("Geometry2D", "triangulate_delaunay", 1389921771_i64)
      end
      val_0 = points
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_triangulate_delaunay, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_convex_hull : Void* = Pointer(Void).null
    def convex_hull(points : Void*) : Void*
      if @@mb_convex_hull.null?
        @@mb_convex_hull = Bridge.get_method_bind("Geometry2D", "convex_hull", 2004331998_i64)
      end
      val_0 = points
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_convex_hull, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_decompose_polygon_in_convex : Void* = Pointer(Void).null
    def decompose_polygon_in_convex(polygon : Void*) : Godot::Array
      if @@mb_decompose_polygon_in_convex.null?
        @@mb_decompose_polygon_in_convex = Bridge.get_method_bind("Geometry2D", "decompose_polygon_in_convex", 3982393695_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_decompose_polygon_in_convex, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_merge_polygons : Void* = Pointer(Void).null
    def merge_polygons(polygon_a : Void*, polygon_b : Void*) : Godot::Array
      if @@mb_merge_polygons.null?
        @@mb_merge_polygons = Bridge.get_method_bind("Geometry2D", "merge_polygons", 3637387053_i64)
      end
      val_0 = polygon_a
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon_b
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_merge_polygons, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_clip_polygons : Void* = Pointer(Void).null
    def clip_polygons(polygon_a : Void*, polygon_b : Void*) : Godot::Array
      if @@mb_clip_polygons.null?
        @@mb_clip_polygons = Bridge.get_method_bind("Geometry2D", "clip_polygons", 3637387053_i64)
      end
      val_0 = polygon_a
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon_b
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_clip_polygons, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_intersect_polygons : Void* = Pointer(Void).null
    def intersect_polygons(polygon_a : Void*, polygon_b : Void*) : Godot::Array
      if @@mb_intersect_polygons.null?
        @@mb_intersect_polygons = Bridge.get_method_bind("Geometry2D", "intersect_polygons", 3637387053_i64)
      end
      val_0 = polygon_a
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon_b
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_intersect_polygons, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_exclude_polygons : Void* = Pointer(Void).null
    def exclude_polygons(polygon_a : Void*, polygon_b : Void*) : Godot::Array
      if @@mb_exclude_polygons.null?
        @@mb_exclude_polygons = Bridge.get_method_bind("Geometry2D", "exclude_polygons", 3637387053_i64)
      end
      val_0 = polygon_a
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon_b
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_exclude_polygons, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_clip_polyline_with_polygon : Void* = Pointer(Void).null
    def clip_polyline_with_polygon(polyline : Void*, polygon : Void*) : Godot::Array
      if @@mb_clip_polyline_with_polygon.null?
        @@mb_clip_polyline_with_polygon = Bridge.get_method_bind("Geometry2D", "clip_polyline_with_polygon", 3637387053_i64)
      end
      val_0 = polyline
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_clip_polyline_with_polygon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_intersect_polyline_with_polygon : Void* = Pointer(Void).null
    def intersect_polyline_with_polygon(polyline : Void*, polygon : Void*) : Godot::Array
      if @@mb_intersect_polyline_with_polygon.null?
        @@mb_intersect_polyline_with_polygon = Bridge.get_method_bind("Geometry2D", "intersect_polyline_with_polygon", 3637387053_i64)
      end
      val_0 = polyline
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = polygon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_intersect_polyline_with_polygon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_offset_polygon : Void* = Pointer(Void).null
    def offset_polygon(polygon : Void*, delta : Float64, join_type : Int64) : Godot::Array
      if @@mb_offset_polygon.null?
        @@mb_offset_polygon = Bridge.get_method_bind("Geometry2D", "offset_polygon", 1275354010_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = delta
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = join_type
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_offset_polygon, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_offset_polyline : Void* = Pointer(Void).null
    def offset_polyline(polyline : Void*, delta : Float64, join_type : Int64, end_type : Int64) : Godot::Array
      if @@mb_offset_polyline.null?
        @@mb_offset_polyline = Bridge.get_method_bind("Geometry2D", "offset_polyline", 2328231778_i64)
      end
      val_0 = polyline
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = delta
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = join_type
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = end_type
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_offset_polyline, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_make_atlas : Void* = Pointer(Void).null
    def make_atlas(sizes : Void*) : Void*
      if @@mb_make_atlas.null?
        @@mb_make_atlas = Bridge.get_method_bind("Geometry2D", "make_atlas", 1337682371_i64)
      end
      val_0 = sizes
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_make_atlas, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_bresenham_line : Void* = Pointer(Void).null
    def bresenham_line(from : Vector2i, to : Vector2i) : Godot::Array
      if @@mb_bresenham_line.null?
        @@mb_bresenham_line = Bridge.get_method_bind("Geometry2D", "bresenham_line", 1989391000_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_bresenham_line, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
  end
  class GradientTexture2D < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum Fill : Int64
      FillLinear = 0_i64
      FillRadial = 1_i64
      FillSquare = 2_i64
      FillConic = 3_i64
    end
    enum Repeat : Int64
      RepeatNone = 0_i64
      Repeat = 1_i64
      RepeatMirror = 2_i64
    end
    @@mb_set_gradient : Void* = Pointer(Void).null
    def set_gradient(gradient : Gradient) : Void
      if @@mb_set_gradient.null?
        @@mb_set_gradient = Bridge.get_method_bind("GradientTexture2D", "set_gradient", 2756054477_i64)
      end
      val_0 = gradient
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gradient, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gradient : Void* = Pointer(Void).null
    def get_gradient() : Gradient
      if @@mb_get_gradient.null?
        @@mb_get_gradient = Bridge.get_method_bind("GradientTexture2D", "get_gradient", 132272999_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_gradient, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Gradient.new(ret_ptr)
    end
    @@mb_set_width : Void* = Pointer(Void).null
    def set_width(width : Int64) : Void
      if @@mb_set_width.null?
        @@mb_set_width = Bridge.get_method_bind("GradientTexture2D", "set_width", 1286410249_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_height : Void* = Pointer(Void).null
    def set_height(height : Int64) : Void
      if @@mb_set_height.null?
        @@mb_set_height = Bridge.get_method_bind("GradientTexture2D", "set_height", 1286410249_i64)
      end
      val_0 = height
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_height, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_use_hdr : Void* = Pointer(Void).null
    def set_use_hdr(enabled : Bool) : Void
      if @@mb_set_use_hdr.null?
        @@mb_set_use_hdr = Bridge.get_method_bind("GradientTexture2D", "set_use_hdr", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_hdr, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_using_hdr : Void* = Pointer(Void).null
    def is_using_hdr() : Bool
      if @@mb_is_using_hdr.null?
        @@mb_is_using_hdr = Bridge.get_method_bind("GradientTexture2D", "is_using_hdr", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_using_hdr, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_fill : Void* = Pointer(Void).null
    def set_fill(fill : Int64) : Void
      if @@mb_set_fill.null?
        @@mb_set_fill = Bridge.get_method_bind("GradientTexture2D", "set_fill", 3623927636_i64)
      end
      val_0 = fill
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fill, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fill : Void* = Pointer(Void).null
    def get_fill() : Int64
      if @@mb_get_fill.null?
        @@mb_get_fill = Bridge.get_method_bind("GradientTexture2D", "get_fill", 1876227217_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fill, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fill_from : Void* = Pointer(Void).null
    def set_fill_from(fill_from : Vector2) : Void
      if @@mb_set_fill_from.null?
        @@mb_set_fill_from = Bridge.get_method_bind("GradientTexture2D", "set_fill_from", 743155724_i64)
      end
      val_0 = fill_from
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fill_from, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fill_from : Void* = Pointer(Void).null
    def get_fill_from() : Vector2
      if @@mb_get_fill_from.null?
        @@mb_get_fill_from = Bridge.get_method_bind("GradientTexture2D", "get_fill_from", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_fill_from, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fill_to : Void* = Pointer(Void).null
    def set_fill_to(fill_to : Vector2) : Void
      if @@mb_set_fill_to.null?
        @@mb_set_fill_to = Bridge.get_method_bind("GradientTexture2D", "set_fill_to", 743155724_i64)
      end
      val_0 = fill_to
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fill_to, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fill_to : Void* = Pointer(Void).null
    def get_fill_to() : Vector2
      if @@mb_get_fill_to.null?
        @@mb_get_fill_to = Bridge.get_method_bind("GradientTexture2D", "get_fill_to", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_fill_to, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_repeat : Void* = Pointer(Void).null
    def set_repeat(repeat : Int64) : Void
      if @@mb_set_repeat.null?
        @@mb_set_repeat = Bridge.get_method_bind("GradientTexture2D", "set_repeat", 1357597002_i64)
      end
      val_0 = repeat
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_repeat, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_repeat : Void* = Pointer(Void).null
    def get_repeat() : Int64
      if @@mb_get_repeat.null?
        @@mb_get_repeat = Bridge.get_method_bind("GradientTexture2D", "get_repeat", 3351758665_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_repeat, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class GrooveJoint2D < Godot::Joint2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_length : Void* = Pointer(Void).null
    def set_length(length : Float64) : Void
      if @@mb_set_length.null?
        @@mb_set_length = Bridge.get_method_bind("GrooveJoint2D", "set_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_length : Void* = Pointer(Void).null
    def get_length() : Float64
      if @@mb_get_length.null?
        @@mb_get_length = Bridge.get_method_bind("GrooveJoint2D", "get_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_initial_offset : Void* = Pointer(Void).null
    def set_initial_offset(offset : Float64) : Void
      if @@mb_set_initial_offset.null?
        @@mb_set_initial_offset = Bridge.get_method_bind("GrooveJoint2D", "set_initial_offset", 373806689_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_initial_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_initial_offset : Void* = Pointer(Void).null
    def get_initial_offset() : Float64
      if @@mb_get_initial_offset.null?
        @@mb_get_initial_offset = Bridge.get_method_bind("GrooveJoint2D", "get_initial_offset", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_initial_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class KinematicCollision2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_position : Void* = Pointer(Void).null
    def get_position() : Vector2
      if @@mb_get_position.null?
        @@mb_get_position = Bridge.get_method_bind("KinematicCollision2D", "get_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_normal : Void* = Pointer(Void).null
    def get_normal() : Vector2
      if @@mb_get_normal.null?
        @@mb_get_normal = Bridge.get_method_bind("KinematicCollision2D", "get_normal", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_travel : Void* = Pointer(Void).null
    def get_travel() : Vector2
      if @@mb_get_travel.null?
        @@mb_get_travel = Bridge.get_method_bind("KinematicCollision2D", "get_travel", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_travel, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_remainder : Void* = Pointer(Void).null
    def get_remainder() : Vector2
      if @@mb_get_remainder.null?
        @@mb_get_remainder = Bridge.get_method_bind("KinematicCollision2D", "get_remainder", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_remainder, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_angle : Void* = Pointer(Void).null
    def get_angle(up_direction : Vector2) : Float64
      if @@mb_get_angle.null?
        @@mb_get_angle = Bridge.get_method_bind("KinematicCollision2D", "get_angle", 2841063350_i64)
      end
      val_0 = up_direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_depth : Void* = Pointer(Void).null
    def get_depth() : Float64
      if @@mb_get_depth.null?
        @@mb_get_depth = Bridge.get_method_bind("KinematicCollision2D", "get_depth", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_depth, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_local_shape : Void* = Pointer(Void).null
    def get_local_shape() : Godot::Object
      if @@mb_get_local_shape.null?
        @@mb_get_local_shape = Bridge.get_method_bind("KinematicCollision2D", "get_local_shape", 1981248198_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_local_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_get_collider : Void* = Pointer(Void).null
    def get_collider() : Godot::Object
      if @@mb_get_collider.null?
        @@mb_get_collider = Bridge.get_method_bind("KinematicCollision2D", "get_collider", 1981248198_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_collider, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_get_collider_id : Void* = Pointer(Void).null
    def get_collider_id() : Int64
      if @@mb_get_collider_id.null?
        @@mb_get_collider_id = Bridge.get_method_bind("KinematicCollision2D", "get_collider_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_rid : Void* = Pointer(Void).null
    def get_collider_rid() : Int64
      if @@mb_get_collider_rid.null?
        @@mb_get_collider_rid = Bridge.get_method_bind("KinematicCollision2D", "get_collider_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_shape : Void* = Pointer(Void).null
    def get_collider_shape() : Godot::Object
      if @@mb_get_collider_shape.null?
        @@mb_get_collider_shape = Bridge.get_method_bind("KinematicCollision2D", "get_collider_shape", 1981248198_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_collider_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_get_collider_shape_index : Void* = Pointer(Void).null
    def get_collider_shape_index() : Int64
      if @@mb_get_collider_shape_index.null?
        @@mb_get_collider_shape_index = Bridge.get_method_bind("KinematicCollision2D", "get_collider_shape_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_shape_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_velocity : Void* = Pointer(Void).null
    def get_collider_velocity() : Vector2
      if @@mb_get_collider_velocity.null?
        @@mb_get_collider_velocity = Bridge.get_method_bind("KinematicCollision2D", "get_collider_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collider_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class LightOccluder2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_occluder_polygon : Void* = Pointer(Void).null
    def set_occluder_polygon(polygon : OccluderPolygon2D) : Void
      if @@mb_set_occluder_polygon.null?
        @@mb_set_occluder_polygon = Bridge.get_method_bind("LightOccluder2D", "set_occluder_polygon", 3258315893_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_occluder_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_occluder_polygon : Void* = Pointer(Void).null
    def get_occluder_polygon() : OccluderPolygon2D
      if @@mb_get_occluder_polygon.null?
        @@mb_get_occluder_polygon = Bridge.get_method_bind("LightOccluder2D", "get_occluder_polygon", 3962317075_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_occluder_polygon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      OccluderPolygon2D.new(ret_ptr)
    end
    @@mb_set_occluder_light_mask : Void* = Pointer(Void).null
    def set_occluder_light_mask(mask : Int64) : Void
      if @@mb_set_occluder_light_mask.null?
        @@mb_set_occluder_light_mask = Bridge.get_method_bind("LightOccluder2D", "set_occluder_light_mask", 1286410249_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_occluder_light_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_occluder_light_mask : Void* = Pointer(Void).null
    def get_occluder_light_mask() : Int64
      if @@mb_get_occluder_light_mask.null?
        @@mb_get_occluder_light_mask = Bridge.get_method_bind("LightOccluder2D", "get_occluder_light_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_occluder_light_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_as_sdf_collision : Void* = Pointer(Void).null
    def set_as_sdf_collision(enable : Bool) : Void
      if @@mb_set_as_sdf_collision.null?
        @@mb_set_as_sdf_collision = Bridge.get_method_bind("LightOccluder2D", "set_as_sdf_collision", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_as_sdf_collision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_set_as_sdf_collision : Void* = Pointer(Void).null
    def is_set_as_sdf_collision() : Bool
      if @@mb_is_set_as_sdf_collision.null?
        @@mb_is_set_as_sdf_collision = Bridge.get_method_bind("LightOccluder2D", "is_set_as_sdf_collision", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_set_as_sdf_collision, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class Line2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum LineJointMode : Int64
      LineJointSharp = 0_i64
      LineJointBevel = 1_i64
      LineJointRound = 2_i64
    end
    enum LineCapMode : Int64
      LineCapNone = 0_i64
      LineCapBox = 1_i64
      LineCapRound = 2_i64
    end
    enum LineTextureMode : Int64
      LineTextureNone = 0_i64
      LineTextureTile = 1_i64
      LineTextureStretch = 2_i64
    end
    @@mb_set_points : Void* = Pointer(Void).null
    def set_points(points : Void*) : Void
      if @@mb_set_points.null?
        @@mb_set_points = Bridge.get_method_bind("Line2D", "set_points", 1509147220_i64)
      end
      val_0 = points
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_points, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_points : Void* = Pointer(Void).null
    def get_points() : Void*
      if @@mb_get_points.null?
        @@mb_get_points = Bridge.get_method_bind("Line2D", "get_points", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_points, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_point_position : Void* = Pointer(Void).null
    def set_point_position(index : Int64, position : Vector2) : Void
      if @@mb_set_point_position.null?
        @@mb_set_point_position = Bridge.get_method_bind("Line2D", "set_point_position", 163021252_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_point_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_point_position : Void* = Pointer(Void).null
    def get_point_position(index : Int64) : Vector2
      if @@mb_get_point_position.null?
        @@mb_get_point_position = Bridge.get_method_bind("Line2D", "get_point_position", 2299179447_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_point_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_point_count : Void* = Pointer(Void).null
    def get_point_count() : Int64
      if @@mb_get_point_count.null?
        @@mb_get_point_count = Bridge.get_method_bind("Line2D", "get_point_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_point_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_point : Void* = Pointer(Void).null
    def add_point(position : Vector2, index : Int64) : Void
      if @@mb_add_point.null?
        @@mb_add_point = Bridge.get_method_bind("Line2D", "add_point", 2654014372_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_point : Void* = Pointer(Void).null
    def remove_point(index : Int64) : Void
      if @@mb_remove_point.null?
        @@mb_remove_point = Bridge.get_method_bind("Line2D", "remove_point", 1286410249_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_point, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_points : Void* = Pointer(Void).null
    def clear_points() : Void
      if @@mb_clear_points.null?
        @@mb_clear_points = Bridge.get_method_bind("Line2D", "clear_points", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_points, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_closed : Void* = Pointer(Void).null
    def set_closed(closed : Bool) : Void
      if @@mb_set_closed.null?
        @@mb_set_closed = Bridge.get_method_bind("Line2D", "set_closed", 2586408642_i64)
      end
      val_0 = closed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_closed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_closed : Void* = Pointer(Void).null
    def is_closed() : Bool
      if @@mb_is_closed.null?
        @@mb_is_closed = Bridge.get_method_bind("Line2D", "is_closed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_closed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_width : Void* = Pointer(Void).null
    def set_width(width : Float64) : Void
      if @@mb_set_width.null?
        @@mb_set_width = Bridge.get_method_bind("Line2D", "set_width", 373806689_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_width : Void* = Pointer(Void).null
    def get_width() : Float64
      if @@mb_get_width.null?
        @@mb_get_width = Bridge.get_method_bind("Line2D", "get_width", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_curve : Void* = Pointer(Void).null
    def set_curve(curve : Curve) : Void
      if @@mb_set_curve.null?
        @@mb_set_curve = Bridge.get_method_bind("Line2D", "set_curve", 270443179_i64)
      end
      val_0 = curve
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_curve, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_curve : Void* = Pointer(Void).null
    def get_curve() : Curve
      if @@mb_get_curve.null?
        @@mb_get_curve = Bridge.get_method_bind("Line2D", "get_curve", 2460114913_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_curve, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Curve.new(ret_ptr)
    end
    @@mb_set_default_color : Void* = Pointer(Void).null
    def set_default_color(color : Color) : Void
      if @@mb_set_default_color.null?
        @@mb_set_default_color = Bridge.get_method_bind("Line2D", "set_default_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_default_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_default_color : Void* = Pointer(Void).null
    def get_default_color() : Color
      if @@mb_get_default_color.null?
        @@mb_get_default_color = Bridge.get_method_bind("Line2D", "get_default_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_default_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_gradient : Void* = Pointer(Void).null
    def set_gradient(color : Gradient) : Void
      if @@mb_set_gradient.null?
        @@mb_set_gradient = Bridge.get_method_bind("Line2D", "set_gradient", 2756054477_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gradient, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gradient : Void* = Pointer(Void).null
    def get_gradient() : Gradient
      if @@mb_get_gradient.null?
        @@mb_get_gradient = Bridge.get_method_bind("Line2D", "get_gradient", 132272999_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_gradient, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Gradient.new(ret_ptr)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("Line2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("Line2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_texture_mode : Void* = Pointer(Void).null
    def set_texture_mode(mode : Int64) : Void
      if @@mb_set_texture_mode.null?
        @@mb_set_texture_mode = Bridge.get_method_bind("Line2D", "set_texture_mode", 1952559516_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_mode : Void* = Pointer(Void).null
    def get_texture_mode() : Int64
      if @@mb_get_texture_mode.null?
        @@mb_get_texture_mode = Bridge.get_method_bind("Line2D", "get_texture_mode", 2341040722_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_joint_mode : Void* = Pointer(Void).null
    def set_joint_mode(mode : Int64) : Void
      if @@mb_set_joint_mode.null?
        @@mb_set_joint_mode = Bridge.get_method_bind("Line2D", "set_joint_mode", 604292979_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joint_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joint_mode : Void* = Pointer(Void).null
    def get_joint_mode() : Int64
      if @@mb_get_joint_mode.null?
        @@mb_get_joint_mode = Bridge.get_method_bind("Line2D", "get_joint_mode", 2546544037_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_joint_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_begin_cap_mode : Void* = Pointer(Void).null
    def set_begin_cap_mode(mode : Int64) : Void
      if @@mb_set_begin_cap_mode.null?
        @@mb_set_begin_cap_mode = Bridge.get_method_bind("Line2D", "set_begin_cap_mode", 1669024546_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_begin_cap_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_begin_cap_mode : Void* = Pointer(Void).null
    def get_begin_cap_mode() : Int64
      if @@mb_get_begin_cap_mode.null?
        @@mb_get_begin_cap_mode = Bridge.get_method_bind("Line2D", "get_begin_cap_mode", 1107511441_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_begin_cap_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_end_cap_mode : Void* = Pointer(Void).null
    def set_end_cap_mode(mode : Int64) : Void
      if @@mb_set_end_cap_mode.null?
        @@mb_set_end_cap_mode = Bridge.get_method_bind("Line2D", "set_end_cap_mode", 1669024546_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_end_cap_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_end_cap_mode : Void* = Pointer(Void).null
    def get_end_cap_mode() : Int64
      if @@mb_get_end_cap_mode.null?
        @@mb_get_end_cap_mode = Bridge.get_method_bind("Line2D", "get_end_cap_mode", 1107511441_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_end_cap_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_sharp_limit : Void* = Pointer(Void).null
    def set_sharp_limit(limit : Float64) : Void
      if @@mb_set_sharp_limit.null?
        @@mb_set_sharp_limit = Bridge.get_method_bind("Line2D", "set_sharp_limit", 373806689_i64)
      end
      val_0 = limit
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_sharp_limit, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_sharp_limit : Void* = Pointer(Void).null
    def get_sharp_limit() : Float64
      if @@mb_get_sharp_limit.null?
        @@mb_get_sharp_limit = Bridge.get_method_bind("Line2D", "get_sharp_limit", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_sharp_limit, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_round_precision : Void* = Pointer(Void).null
    def set_round_precision(precision : Int64) : Void
      if @@mb_set_round_precision.null?
        @@mb_set_round_precision = Bridge.get_method_bind("Line2D", "set_round_precision", 1286410249_i64)
      end
      val_0 = precision
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_round_precision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_round_precision : Void* = Pointer(Void).null
    def get_round_precision() : Int64
      if @@mb_get_round_precision.null?
        @@mb_get_round_precision = Bridge.get_method_bind("Line2D", "get_round_precision", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_round_precision, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_antialiased : Void* = Pointer(Void).null
    def set_antialiased(antialiased : Bool) : Void
      if @@mb_set_antialiased.null?
        @@mb_set_antialiased = Bridge.get_method_bind("Line2D", "set_antialiased", 2586408642_i64)
      end
      val_0 = antialiased
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_antialiased, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_antialiased : Void* = Pointer(Void).null
    def get_antialiased() : Bool
      if @@mb_get_antialiased.null?
        @@mb_get_antialiased = Bridge.get_method_bind("Line2D", "get_antialiased", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_antialiased, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class Marker2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_gizmo_extents : Void* = Pointer(Void).null
    def set_gizmo_extents(extents : Float64) : Void
      if @@mb_set_gizmo_extents.null?
        @@mb_set_gizmo_extents = Bridge.get_method_bind("Marker2D", "set_gizmo_extents", 373806689_i64)
      end
      val_0 = extents
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gizmo_extents, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gizmo_extents : Void* = Pointer(Void).null
    def get_gizmo_extents() : Float64
      if @@mb_get_gizmo_extents.null?
        @@mb_get_gizmo_extents = Bridge.get_method_bind("Marker2D", "get_gizmo_extents", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_gizmo_extents, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class MeshInstance2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_mesh : Void* = Pointer(Void).null
    def set_mesh(mesh : Mesh) : Void
      if @@mb_set_mesh.null?
        @@mb_set_mesh = Bridge.get_method_bind("MeshInstance2D", "set_mesh", 194775623_i64)
      end
      val_0 = mesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mesh : Void* = Pointer(Void).null
    def get_mesh() : Mesh
      if @@mb_get_mesh.null?
        @@mb_get_mesh = Bridge.get_method_bind("MeshInstance2D", "get_mesh", 1808005922_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_mesh, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Mesh.new(ret_ptr)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("MeshInstance2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("MeshInstance2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
  end
  class MultiMeshInstance2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_multimesh : Void* = Pointer(Void).null
    def set_multimesh(multimesh : MultiMesh) : Void
      if @@mb_set_multimesh.null?
        @@mb_set_multimesh = Bridge.get_method_bind("MultiMeshInstance2D", "set_multimesh", 2246127404_i64)
      end
      val_0 = multimesh
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_multimesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_multimesh : Void* = Pointer(Void).null
    def get_multimesh() : MultiMesh
      if @@mb_get_multimesh.null?
        @@mb_get_multimesh = Bridge.get_method_bind("MultiMeshInstance2D", "get_multimesh", 1385450523_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_multimesh, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      MultiMesh.new(ret_ptr)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("MultiMeshInstance2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("MultiMeshInstance2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
  end
  class NavigationAgent2D < Godot::Node
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_rid : Void* = Pointer(Void).null
    def get_rid() : Int64
      if @@mb_get_rid.null?
        @@mb_get_rid = Bridge.get_method_bind("NavigationAgent2D", "get_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_avoidance_enabled : Void* = Pointer(Void).null
    def set_avoidance_enabled(enabled : Bool) : Void
      if @@mb_set_avoidance_enabled.null?
        @@mb_set_avoidance_enabled = Bridge.get_method_bind("NavigationAgent2D", "set_avoidance_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_avoidance_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_enabled : Void* = Pointer(Void).null
    def get_avoidance_enabled() : Bool
      if @@mb_get_avoidance_enabled.null?
        @@mb_get_avoidance_enabled = Bridge.get_method_bind("NavigationAgent2D", "get_avoidance_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_avoidance_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_path_desired_distance : Void* = Pointer(Void).null
    def set_path_desired_distance(desired_distance : Float64) : Void
      if @@mb_set_path_desired_distance.null?
        @@mb_set_path_desired_distance = Bridge.get_method_bind("NavigationAgent2D", "set_path_desired_distance", 373806689_i64)
      end
      val_0 = desired_distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_desired_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_desired_distance : Void* = Pointer(Void).null
    def get_path_desired_distance() : Float64
      if @@mb_get_path_desired_distance.null?
        @@mb_get_path_desired_distance = Bridge.get_method_bind("NavigationAgent2D", "get_path_desired_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_desired_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_target_desired_distance : Void* = Pointer(Void).null
    def set_target_desired_distance(desired_distance : Float64) : Void
      if @@mb_set_target_desired_distance.null?
        @@mb_set_target_desired_distance = Bridge.get_method_bind("NavigationAgent2D", "set_target_desired_distance", 373806689_i64)
      end
      val_0 = desired_distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_desired_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_desired_distance : Void* = Pointer(Void).null
    def get_target_desired_distance() : Float64
      if @@mb_get_target_desired_distance.null?
        @@mb_get_target_desired_distance = Bridge.get_method_bind("NavigationAgent2D", "get_target_desired_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_target_desired_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_radius : Void* = Pointer(Void).null
    def set_radius(radius : Float64) : Void
      if @@mb_set_radius.null?
        @@mb_set_radius = Bridge.get_method_bind("NavigationAgent2D", "set_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_radius : Void* = Pointer(Void).null
    def get_radius() : Float64
      if @@mb_get_radius.null?
        @@mb_get_radius = Bridge.get_method_bind("NavigationAgent2D", "get_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_neighbor_distance : Void* = Pointer(Void).null
    def set_neighbor_distance(neighbor_distance : Float64) : Void
      if @@mb_set_neighbor_distance.null?
        @@mb_set_neighbor_distance = Bridge.get_method_bind("NavigationAgent2D", "set_neighbor_distance", 373806689_i64)
      end
      val_0 = neighbor_distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_neighbor_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_neighbor_distance : Void* = Pointer(Void).null
    def get_neighbor_distance() : Float64
      if @@mb_get_neighbor_distance.null?
        @@mb_get_neighbor_distance = Bridge.get_method_bind("NavigationAgent2D", "get_neighbor_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_neighbor_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_neighbors : Void* = Pointer(Void).null
    def set_max_neighbors(max_neighbors : Int64) : Void
      if @@mb_set_max_neighbors.null?
        @@mb_set_max_neighbors = Bridge.get_method_bind("NavigationAgent2D", "set_max_neighbors", 1286410249_i64)
      end
      val_0 = max_neighbors
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_neighbors, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_neighbors : Void* = Pointer(Void).null
    def get_max_neighbors() : Int64
      if @@mb_get_max_neighbors.null?
        @@mb_get_max_neighbors = Bridge.get_method_bind("NavigationAgent2D", "get_max_neighbors", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_neighbors, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_time_horizon_agents : Void* = Pointer(Void).null
    def set_time_horizon_agents(time_horizon : Float64) : Void
      if @@mb_set_time_horizon_agents.null?
        @@mb_set_time_horizon_agents = Bridge.get_method_bind("NavigationAgent2D", "set_time_horizon_agents", 373806689_i64)
      end
      val_0 = time_horizon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_time_horizon_agents, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_time_horizon_agents : Void* = Pointer(Void).null
    def get_time_horizon_agents() : Float64
      if @@mb_get_time_horizon_agents.null?
        @@mb_get_time_horizon_agents = Bridge.get_method_bind("NavigationAgent2D", "get_time_horizon_agents", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_time_horizon_agents, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_time_horizon_obstacles : Void* = Pointer(Void).null
    def set_time_horizon_obstacles(time_horizon : Float64) : Void
      if @@mb_set_time_horizon_obstacles.null?
        @@mb_set_time_horizon_obstacles = Bridge.get_method_bind("NavigationAgent2D", "set_time_horizon_obstacles", 373806689_i64)
      end
      val_0 = time_horizon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_time_horizon_obstacles, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_time_horizon_obstacles : Void* = Pointer(Void).null
    def get_time_horizon_obstacles() : Float64
      if @@mb_get_time_horizon_obstacles.null?
        @@mb_get_time_horizon_obstacles = Bridge.get_method_bind("NavigationAgent2D", "get_time_horizon_obstacles", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_time_horizon_obstacles, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_speed : Void* = Pointer(Void).null
    def set_max_speed(max_speed : Float64) : Void
      if @@mb_set_max_speed.null?
        @@mb_set_max_speed = Bridge.get_method_bind("NavigationAgent2D", "set_max_speed", 373806689_i64)
      end
      val_0 = max_speed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_speed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_speed : Void* = Pointer(Void).null
    def get_max_speed() : Float64
      if @@mb_get_max_speed.null?
        @@mb_get_max_speed = Bridge.get_method_bind("NavigationAgent2D", "get_max_speed", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_max_speed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_max_distance : Void* = Pointer(Void).null
    def set_path_max_distance(max_speed : Float64) : Void
      if @@mb_set_path_max_distance.null?
        @@mb_set_path_max_distance = Bridge.get_method_bind("NavigationAgent2D", "set_path_max_distance", 373806689_i64)
      end
      val_0 = max_speed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_max_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_max_distance : Void* = Pointer(Void).null
    def get_path_max_distance() : Float64
      if @@mb_get_path_max_distance.null?
        @@mb_get_path_max_distance = Bridge.get_method_bind("NavigationAgent2D", "get_path_max_distance", 191475506_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_max_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_navigation_layers : Void* = Pointer(Void).null
    def set_navigation_layers(navigation_layers : Int64) : Void
      if @@mb_set_navigation_layers.null?
        @@mb_set_navigation_layers = Bridge.get_method_bind("NavigationAgent2D", "set_navigation_layers", 1286410249_i64)
      end
      val_0 = navigation_layers
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_layers : Void* = Pointer(Void).null
    def get_navigation_layers() : Int64
      if @@mb_get_navigation_layers.null?
        @@mb_get_navigation_layers = Bridge.get_method_bind("NavigationAgent2D", "get_navigation_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_navigation_layer_value : Void* = Pointer(Void).null
    def set_navigation_layer_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_navigation_layer_value.null?
        @@mb_set_navigation_layer_value = Bridge.get_method_bind("NavigationAgent2D", "set_navigation_layer_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_navigation_layer_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_layer_value : Void* = Pointer(Void).null
    def get_navigation_layer_value(layer_number : Int64) : Bool
      if @@mb_get_navigation_layer_value.null?
        @@mb_get_navigation_layer_value = Bridge.get_method_bind("NavigationAgent2D", "get_navigation_layer_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_navigation_layer_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_pathfinding_algorithm : Void* = Pointer(Void).null
    def set_pathfinding_algorithm(pathfinding_algorithm : Int64) : Void
      if @@mb_set_pathfinding_algorithm.null?
        @@mb_set_pathfinding_algorithm = Bridge.get_method_bind("NavigationAgent2D", "set_pathfinding_algorithm", 2783519915_i64)
      end
      val_0 = pathfinding_algorithm
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pathfinding_algorithm, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_pathfinding_algorithm : Void* = Pointer(Void).null
    def get_pathfinding_algorithm() : Int64
      if @@mb_get_pathfinding_algorithm.null?
        @@mb_get_pathfinding_algorithm = Bridge.get_method_bind("NavigationAgent2D", "get_pathfinding_algorithm", 3000421146_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_pathfinding_algorithm, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_postprocessing : Void* = Pointer(Void).null
    def set_path_postprocessing(path_postprocessing : Int64) : Void
      if @@mb_set_path_postprocessing.null?
        @@mb_set_path_postprocessing = Bridge.get_method_bind("NavigationAgent2D", "set_path_postprocessing", 2864409082_i64)
      end
      val_0 = path_postprocessing
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_postprocessing, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_postprocessing : Void* = Pointer(Void).null
    def get_path_postprocessing() : Int64
      if @@mb_get_path_postprocessing.null?
        @@mb_get_path_postprocessing = Bridge.get_method_bind("NavigationAgent2D", "get_path_postprocessing", 3798118993_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_path_postprocessing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_metadata_flags : Void* = Pointer(Void).null
    def set_path_metadata_flags(flags : Int64) : Void
      if @@mb_set_path_metadata_flags.null?
        @@mb_set_path_metadata_flags = Bridge.get_method_bind("NavigationAgent2D", "set_path_metadata_flags", 24274129_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_metadata_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_metadata_flags : Void* = Pointer(Void).null
    def get_path_metadata_flags() : Int64
      if @@mb_get_path_metadata_flags.null?
        @@mb_get_path_metadata_flags = Bridge.get_method_bind("NavigationAgent2D", "get_path_metadata_flags", 488152976_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_path_metadata_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_navigation_map : Void* = Pointer(Void).null
    def set_navigation_map(navigation_map : Int64) : Void
      if @@mb_set_navigation_map.null?
        @@mb_set_navigation_map = Bridge.get_method_bind("NavigationAgent2D", "set_navigation_map", 2722037293_i64)
      end
      val_0 = navigation_map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_map : Void* = Pointer(Void).null
    def get_navigation_map() : Int64
      if @@mb_get_navigation_map.null?
        @@mb_get_navigation_map = Bridge.get_method_bind("NavigationAgent2D", "get_navigation_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_target_position : Void* = Pointer(Void).null
    def set_target_position(position : Vector2) : Void
      if @@mb_set_target_position.null?
        @@mb_set_target_position = Bridge.get_method_bind("NavigationAgent2D", "set_target_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_position : Void* = Pointer(Void).null
    def get_target_position() : Vector2
      if @@mb_get_target_position.null?
        @@mb_get_target_position = Bridge.get_method_bind("NavigationAgent2D", "get_target_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_target_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_simplify_path : Void* = Pointer(Void).null
    def set_simplify_path(enabled : Bool) : Void
      if @@mb_set_simplify_path.null?
        @@mb_set_simplify_path = Bridge.get_method_bind("NavigationAgent2D", "set_simplify_path", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_simplify_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_simplify_path : Void* = Pointer(Void).null
    def get_simplify_path() : Bool
      if @@mb_get_simplify_path.null?
        @@mb_get_simplify_path = Bridge.get_method_bind("NavigationAgent2D", "get_simplify_path", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_simplify_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_simplify_epsilon : Void* = Pointer(Void).null
    def set_simplify_epsilon(epsilon : Float64) : Void
      if @@mb_set_simplify_epsilon.null?
        @@mb_set_simplify_epsilon = Bridge.get_method_bind("NavigationAgent2D", "set_simplify_epsilon", 373806689_i64)
      end
      val_0 = epsilon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_simplify_epsilon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_simplify_epsilon : Void* = Pointer(Void).null
    def get_simplify_epsilon() : Float64
      if @@mb_get_simplify_epsilon.null?
        @@mb_get_simplify_epsilon = Bridge.get_method_bind("NavigationAgent2D", "get_simplify_epsilon", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_simplify_epsilon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_return_max_length : Void* = Pointer(Void).null
    def set_path_return_max_length(length : Float64) : Void
      if @@mb_set_path_return_max_length.null?
        @@mb_set_path_return_max_length = Bridge.get_method_bind("NavigationAgent2D", "set_path_return_max_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_return_max_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_return_max_length : Void* = Pointer(Void).null
    def get_path_return_max_length() : Float64
      if @@mb_get_path_return_max_length.null?
        @@mb_get_path_return_max_length = Bridge.get_method_bind("NavigationAgent2D", "get_path_return_max_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_return_max_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_return_max_radius : Void* = Pointer(Void).null
    def set_path_return_max_radius(radius : Float64) : Void
      if @@mb_set_path_return_max_radius.null?
        @@mb_set_path_return_max_radius = Bridge.get_method_bind("NavigationAgent2D", "set_path_return_max_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_return_max_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_return_max_radius : Void* = Pointer(Void).null
    def get_path_return_max_radius() : Float64
      if @@mb_get_path_return_max_radius.null?
        @@mb_get_path_return_max_radius = Bridge.get_method_bind("NavigationAgent2D", "get_path_return_max_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_return_max_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_search_max_polygons : Void* = Pointer(Void).null
    def set_path_search_max_polygons(max_polygons : Int64) : Void
      if @@mb_set_path_search_max_polygons.null?
        @@mb_set_path_search_max_polygons = Bridge.get_method_bind("NavigationAgent2D", "set_path_search_max_polygons", 1286410249_i64)
      end
      val_0 = max_polygons
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_search_max_polygons, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_search_max_polygons : Void* = Pointer(Void).null
    def get_path_search_max_polygons() : Int64
      if @@mb_get_path_search_max_polygons.null?
        @@mb_get_path_search_max_polygons = Bridge.get_method_bind("NavigationAgent2D", "get_path_search_max_polygons", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_path_search_max_polygons, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_search_max_distance : Void* = Pointer(Void).null
    def set_path_search_max_distance(distance : Float64) : Void
      if @@mb_set_path_search_max_distance.null?
        @@mb_set_path_search_max_distance = Bridge.get_method_bind("NavigationAgent2D", "set_path_search_max_distance", 373806689_i64)
      end
      val_0 = distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_search_max_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_search_max_distance : Void* = Pointer(Void).null
    def get_path_search_max_distance() : Float64
      if @@mb_get_path_search_max_distance.null?
        @@mb_get_path_search_max_distance = Bridge.get_method_bind("NavigationAgent2D", "get_path_search_max_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_search_max_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_path_length : Void* = Pointer(Void).null
    def get_path_length() : Float64
      if @@mb_get_path_length.null?
        @@mb_get_path_length = Bridge.get_method_bind("NavigationAgent2D", "get_path_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_next_path_position : Void* = Pointer(Void).null
    def get_next_path_position() : Vector2
      if @@mb_get_next_path_position.null?
        @@mb_get_next_path_position = Bridge.get_method_bind("NavigationAgent2D", "get_next_path_position", 1497962370_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_next_path_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_velocity_forced : Void* = Pointer(Void).null
    def set_velocity_forced(velocity : Vector2) : Void
      if @@mb_set_velocity_forced.null?
        @@mb_set_velocity_forced = Bridge.get_method_bind("NavigationAgent2D", "set_velocity_forced", 743155724_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_velocity_forced, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_velocity : Void* = Pointer(Void).null
    def set_velocity(velocity : Vector2) : Void
      if @@mb_set_velocity.null?
        @@mb_set_velocity = Bridge.get_method_bind("NavigationAgent2D", "set_velocity", 743155724_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_velocity : Void* = Pointer(Void).null
    def get_velocity() : Vector2
      if @@mb_get_velocity.null?
        @@mb_get_velocity = Bridge.get_method_bind("NavigationAgent2D", "get_velocity", 1497962370_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_distance_to_target : Void* = Pointer(Void).null
    def distance_to_target() : Float64
      if @@mb_distance_to_target.null?
        @@mb_distance_to_target = Bridge.get_method_bind("NavigationAgent2D", "distance_to_target", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_distance_to_target, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_current_navigation_result : Void* = Pointer(Void).null
    def get_current_navigation_result() : NavigationPathQueryResult2D
      if @@mb_get_current_navigation_result.null?
        @@mb_get_current_navigation_result = Bridge.get_method_bind("NavigationAgent2D", "get_current_navigation_result", 166799483_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_current_navigation_result, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NavigationPathQueryResult2D.new(ret_ptr)
    end
    @@mb_get_current_navigation_path : Void* = Pointer(Void).null
    def get_current_navigation_path() : Void*
      if @@mb_get_current_navigation_path.null?
        @@mb_get_current_navigation_path = Bridge.get_method_bind("NavigationAgent2D", "get_current_navigation_path", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_current_navigation_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_current_navigation_path_index : Void* = Pointer(Void).null
    def get_current_navigation_path_index() : Int64
      if @@mb_get_current_navigation_path_index.null?
        @@mb_get_current_navigation_path_index = Bridge.get_method_bind("NavigationAgent2D", "get_current_navigation_path_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_current_navigation_path_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_target_reached : Void* = Pointer(Void).null
    def is_target_reached() : Bool
      if @@mb_is_target_reached.null?
        @@mb_is_target_reached = Bridge.get_method_bind("NavigationAgent2D", "is_target_reached", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_target_reached, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_target_reachable : Void* = Pointer(Void).null
    def is_target_reachable() : Bool
      if @@mb_is_target_reachable.null?
        @@mb_is_target_reachable = Bridge.get_method_bind("NavigationAgent2D", "is_target_reachable", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_target_reachable, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_navigation_finished : Void* = Pointer(Void).null
    def is_navigation_finished() : Bool
      if @@mb_is_navigation_finished.null?
        @@mb_is_navigation_finished = Bridge.get_method_bind("NavigationAgent2D", "is_navigation_finished", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_navigation_finished, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_final_position : Void* = Pointer(Void).null
    def get_final_position() : Vector2
      if @@mb_get_final_position.null?
        @@mb_get_final_position = Bridge.get_method_bind("NavigationAgent2D", "get_final_position", 1497962370_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_final_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_avoidance_layers : Void* = Pointer(Void).null
    def set_avoidance_layers(layers : Int64) : Void
      if @@mb_set_avoidance_layers.null?
        @@mb_set_avoidance_layers = Bridge.get_method_bind("NavigationAgent2D", "set_avoidance_layers", 1286410249_i64)
      end
      val_0 = layers
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_avoidance_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_layers : Void* = Pointer(Void).null
    def get_avoidance_layers() : Int64
      if @@mb_get_avoidance_layers.null?
        @@mb_get_avoidance_layers = Bridge.get_method_bind("NavigationAgent2D", "get_avoidance_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_avoidance_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_avoidance_mask : Void* = Pointer(Void).null
    def set_avoidance_mask(mask : Int64) : Void
      if @@mb_set_avoidance_mask.null?
        @@mb_set_avoidance_mask = Bridge.get_method_bind("NavigationAgent2D", "set_avoidance_mask", 1286410249_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_avoidance_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_mask : Void* = Pointer(Void).null
    def get_avoidance_mask() : Int64
      if @@mb_get_avoidance_mask.null?
        @@mb_get_avoidance_mask = Bridge.get_method_bind("NavigationAgent2D", "get_avoidance_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_avoidance_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_avoidance_layer_value : Void* = Pointer(Void).null
    def set_avoidance_layer_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_avoidance_layer_value.null?
        @@mb_set_avoidance_layer_value = Bridge.get_method_bind("NavigationAgent2D", "set_avoidance_layer_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_avoidance_layer_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_layer_value : Void* = Pointer(Void).null
    def get_avoidance_layer_value(layer_number : Int64) : Bool
      if @@mb_get_avoidance_layer_value.null?
        @@mb_get_avoidance_layer_value = Bridge.get_method_bind("NavigationAgent2D", "get_avoidance_layer_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_avoidance_layer_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_avoidance_mask_value : Void* = Pointer(Void).null
    def set_avoidance_mask_value(mask_number : Int64, value : Bool) : Void
      if @@mb_set_avoidance_mask_value.null?
        @@mb_set_avoidance_mask_value = Bridge.get_method_bind("NavigationAgent2D", "set_avoidance_mask_value", 300928843_i64)
      end
      val_0 = mask_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_avoidance_mask_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_mask_value : Void* = Pointer(Void).null
    def get_avoidance_mask_value(mask_number : Int64) : Bool
      if @@mb_get_avoidance_mask_value.null?
        @@mb_get_avoidance_mask_value = Bridge.get_method_bind("NavigationAgent2D", "get_avoidance_mask_value", 1116898809_i64)
      end
      val_0 = mask_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_avoidance_mask_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_avoidance_priority : Void* = Pointer(Void).null
    def set_avoidance_priority(priority : Float64) : Void
      if @@mb_set_avoidance_priority.null?
        @@mb_set_avoidance_priority = Bridge.get_method_bind("NavigationAgent2D", "set_avoidance_priority", 373806689_i64)
      end
      val_0 = priority
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_avoidance_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_priority : Void* = Pointer(Void).null
    def get_avoidance_priority() : Float64
      if @@mb_get_avoidance_priority.null?
        @@mb_get_avoidance_priority = Bridge.get_method_bind("NavigationAgent2D", "get_avoidance_priority", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_avoidance_priority, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_debug_enabled : Void* = Pointer(Void).null
    def set_debug_enabled(enabled : Bool) : Void
      if @@mb_set_debug_enabled.null?
        @@mb_set_debug_enabled = Bridge.get_method_bind("NavigationAgent2D", "set_debug_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_debug_enabled : Void* = Pointer(Void).null
    def get_debug_enabled() : Bool
      if @@mb_get_debug_enabled.null?
        @@mb_get_debug_enabled = Bridge.get_method_bind("NavigationAgent2D", "get_debug_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_debug_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_debug_use_custom : Void* = Pointer(Void).null
    def set_debug_use_custom(enabled : Bool) : Void
      if @@mb_set_debug_use_custom.null?
        @@mb_set_debug_use_custom = Bridge.get_method_bind("NavigationAgent2D", "set_debug_use_custom", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_use_custom, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_debug_use_custom : Void* = Pointer(Void).null
    def get_debug_use_custom() : Bool
      if @@mb_get_debug_use_custom.null?
        @@mb_get_debug_use_custom = Bridge.get_method_bind("NavigationAgent2D", "get_debug_use_custom", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_debug_use_custom, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_debug_path_custom_color : Void* = Pointer(Void).null
    def set_debug_path_custom_color(color : Color) : Void
      if @@mb_set_debug_path_custom_color.null?
        @@mb_set_debug_path_custom_color = Bridge.get_method_bind("NavigationAgent2D", "set_debug_path_custom_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_path_custom_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_debug_path_custom_color : Void* = Pointer(Void).null
    def get_debug_path_custom_color() : Color
      if @@mb_get_debug_path_custom_color.null?
        @@mb_get_debug_path_custom_color = Bridge.get_method_bind("NavigationAgent2D", "get_debug_path_custom_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_debug_path_custom_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_debug_path_custom_point_size : Void* = Pointer(Void).null
    def set_debug_path_custom_point_size(point_size : Float64) : Void
      if @@mb_set_debug_path_custom_point_size.null?
        @@mb_set_debug_path_custom_point_size = Bridge.get_method_bind("NavigationAgent2D", "set_debug_path_custom_point_size", 373806689_i64)
      end
      val_0 = point_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_path_custom_point_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_debug_path_custom_point_size : Void* = Pointer(Void).null
    def get_debug_path_custom_point_size() : Float64
      if @@mb_get_debug_path_custom_point_size.null?
        @@mb_get_debug_path_custom_point_size = Bridge.get_method_bind("NavigationAgent2D", "get_debug_path_custom_point_size", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_debug_path_custom_point_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_debug_path_custom_line_width : Void* = Pointer(Void).null
    def set_debug_path_custom_line_width(line_width : Float64) : Void
      if @@mb_set_debug_path_custom_line_width.null?
        @@mb_set_debug_path_custom_line_width = Bridge.get_method_bind("NavigationAgent2D", "set_debug_path_custom_line_width", 373806689_i64)
      end
      val_0 = line_width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_path_custom_line_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_debug_path_custom_line_width : Void* = Pointer(Void).null
    def get_debug_path_custom_line_width() : Float64
      if @@mb_get_debug_path_custom_line_width.null?
        @@mb_get_debug_path_custom_line_width = Bridge.get_method_bind("NavigationAgent2D", "get_debug_path_custom_line_width", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_debug_path_custom_line_width, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class NavigationLink2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_rid : Void* = Pointer(Void).null
    def get_rid() : Int64
      if @@mb_get_rid.null?
        @@mb_get_rid = Bridge.get_method_bind("NavigationLink2D", "get_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("NavigationLink2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_enabled : Void* = Pointer(Void).null
    def is_enabled() : Bool
      if @@mb_is_enabled.null?
        @@mb_is_enabled = Bridge.get_method_bind("NavigationLink2D", "is_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_navigation_map : Void* = Pointer(Void).null
    def set_navigation_map(navigation_map : Int64) : Void
      if @@mb_set_navigation_map.null?
        @@mb_set_navigation_map = Bridge.get_method_bind("NavigationLink2D", "set_navigation_map", 2722037293_i64)
      end
      val_0 = navigation_map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_map : Void* = Pointer(Void).null
    def get_navigation_map() : Int64
      if @@mb_get_navigation_map.null?
        @@mb_get_navigation_map = Bridge.get_method_bind("NavigationLink2D", "get_navigation_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bidirectional : Void* = Pointer(Void).null
    def set_bidirectional(bidirectional : Bool) : Void
      if @@mb_set_bidirectional.null?
        @@mb_set_bidirectional = Bridge.get_method_bind("NavigationLink2D", "set_bidirectional", 2586408642_i64)
      end
      val_0 = bidirectional
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bidirectional, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_bidirectional : Void* = Pointer(Void).null
    def is_bidirectional() : Bool
      if @@mb_is_bidirectional.null?
        @@mb_is_bidirectional = Bridge.get_method_bind("NavigationLink2D", "is_bidirectional", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_bidirectional, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_navigation_layers : Void* = Pointer(Void).null
    def set_navigation_layers(navigation_layers : Int64) : Void
      if @@mb_set_navigation_layers.null?
        @@mb_set_navigation_layers = Bridge.get_method_bind("NavigationLink2D", "set_navigation_layers", 1286410249_i64)
      end
      val_0 = navigation_layers
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_layers : Void* = Pointer(Void).null
    def get_navigation_layers() : Int64
      if @@mb_get_navigation_layers.null?
        @@mb_get_navigation_layers = Bridge.get_method_bind("NavigationLink2D", "get_navigation_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_navigation_layer_value : Void* = Pointer(Void).null
    def set_navigation_layer_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_navigation_layer_value.null?
        @@mb_set_navigation_layer_value = Bridge.get_method_bind("NavigationLink2D", "set_navigation_layer_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_navigation_layer_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_layer_value : Void* = Pointer(Void).null
    def get_navigation_layer_value(layer_number : Int64) : Bool
      if @@mb_get_navigation_layer_value.null?
        @@mb_get_navigation_layer_value = Bridge.get_method_bind("NavigationLink2D", "get_navigation_layer_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_navigation_layer_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_start_position : Void* = Pointer(Void).null
    def set_start_position(position : Vector2) : Void
      if @@mb_set_start_position.null?
        @@mb_set_start_position = Bridge.get_method_bind("NavigationLink2D", "set_start_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_start_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_start_position : Void* = Pointer(Void).null
    def get_start_position() : Vector2
      if @@mb_get_start_position.null?
        @@mb_get_start_position = Bridge.get_method_bind("NavigationLink2D", "get_start_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_start_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_end_position : Void* = Pointer(Void).null
    def set_end_position(position : Vector2) : Void
      if @@mb_set_end_position.null?
        @@mb_set_end_position = Bridge.get_method_bind("NavigationLink2D", "set_end_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_end_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_end_position : Void* = Pointer(Void).null
    def get_end_position() : Vector2
      if @@mb_get_end_position.null?
        @@mb_get_end_position = Bridge.get_method_bind("NavigationLink2D", "get_end_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_end_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_global_start_position : Void* = Pointer(Void).null
    def set_global_start_position(position : Vector2) : Void
      if @@mb_set_global_start_position.null?
        @@mb_set_global_start_position = Bridge.get_method_bind("NavigationLink2D", "set_global_start_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_start_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_global_start_position : Void* = Pointer(Void).null
    def get_global_start_position() : Vector2
      if @@mb_get_global_start_position.null?
        @@mb_get_global_start_position = Bridge.get_method_bind("NavigationLink2D", "get_global_start_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_global_start_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_global_end_position : Void* = Pointer(Void).null
    def set_global_end_position(position : Vector2) : Void
      if @@mb_set_global_end_position.null?
        @@mb_set_global_end_position = Bridge.get_method_bind("NavigationLink2D", "set_global_end_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_global_end_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_global_end_position : Void* = Pointer(Void).null
    def get_global_end_position() : Vector2
      if @@mb_get_global_end_position.null?
        @@mb_get_global_end_position = Bridge.get_method_bind("NavigationLink2D", "get_global_end_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_global_end_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enter_cost : Void* = Pointer(Void).null
    def set_enter_cost(enter_cost : Float64) : Void
      if @@mb_set_enter_cost.null?
        @@mb_set_enter_cost = Bridge.get_method_bind("NavigationLink2D", "set_enter_cost", 373806689_i64)
      end
      val_0 = enter_cost
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enter_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enter_cost : Void* = Pointer(Void).null
    def get_enter_cost() : Float64
      if @@mb_get_enter_cost.null?
        @@mb_get_enter_cost = Bridge.get_method_bind("NavigationLink2D", "get_enter_cost", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_enter_cost, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_travel_cost : Void* = Pointer(Void).null
    def set_travel_cost(travel_cost : Float64) : Void
      if @@mb_set_travel_cost.null?
        @@mb_set_travel_cost = Bridge.get_method_bind("NavigationLink2D", "set_travel_cost", 373806689_i64)
      end
      val_0 = travel_cost
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_travel_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_travel_cost : Void* = Pointer(Void).null
    def get_travel_cost() : Float64
      if @@mb_get_travel_cost.null?
        @@mb_get_travel_cost = Bridge.get_method_bind("NavigationLink2D", "get_travel_cost", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_travel_cost, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class NavigationMeshSourceGeometryData2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_clear : Void* = Pointer(Void).null
    def clear() : Void
      if @@mb_clear.null?
        @@mb_clear = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "clear", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_has_data : Void* = Pointer(Void).null
    def has_data() : Bool
      if @@mb_has_data.null?
        @@mb_has_data = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "has_data", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_data, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_traversable_outlines : Void* = Pointer(Void).null
    def set_traversable_outlines(traversable_outlines : Godot::Array) : Void
      if @@mb_set_traversable_outlines.null?
        @@mb_set_traversable_outlines = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "set_traversable_outlines", 381264803_i64)
      end
      arg_ptr_0 = traversable_outlines ? traversable_outlines.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_traversable_outlines, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_traversable_outlines : Void* = Pointer(Void).null
    def get_traversable_outlines() : Godot::Array
      if @@mb_get_traversable_outlines.null?
        @@mb_get_traversable_outlines = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "get_traversable_outlines", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_traversable_outlines, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_obstruction_outlines : Void* = Pointer(Void).null
    def set_obstruction_outlines(obstruction_outlines : Godot::Array) : Void
      if @@mb_set_obstruction_outlines.null?
        @@mb_set_obstruction_outlines = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "set_obstruction_outlines", 381264803_i64)
      end
      arg_ptr_0 = obstruction_outlines ? obstruction_outlines.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_obstruction_outlines, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_obstruction_outlines : Void* = Pointer(Void).null
    def get_obstruction_outlines() : Godot::Array
      if @@mb_get_obstruction_outlines.null?
        @@mb_get_obstruction_outlines = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "get_obstruction_outlines", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_obstruction_outlines, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_append_traversable_outlines : Void* = Pointer(Void).null
    def append_traversable_outlines(traversable_outlines : Godot::Array) : Void
      if @@mb_append_traversable_outlines.null?
        @@mb_append_traversable_outlines = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "append_traversable_outlines", 381264803_i64)
      end
      arg_ptr_0 = traversable_outlines ? traversable_outlines.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_append_traversable_outlines, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_append_obstruction_outlines : Void* = Pointer(Void).null
    def append_obstruction_outlines(obstruction_outlines : Godot::Array) : Void
      if @@mb_append_obstruction_outlines.null?
        @@mb_append_obstruction_outlines = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "append_obstruction_outlines", 381264803_i64)
      end
      arg_ptr_0 = obstruction_outlines ? obstruction_outlines.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_append_obstruction_outlines, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_traversable_outline : Void* = Pointer(Void).null
    def add_traversable_outline(shape_outline : Void*) : Void
      if @@mb_add_traversable_outline.null?
        @@mb_add_traversable_outline = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "add_traversable_outline", 1509147220_i64)
      end
      val_0 = shape_outline
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_traversable_outline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_obstruction_outline : Void* = Pointer(Void).null
    def add_obstruction_outline(shape_outline : Void*) : Void
      if @@mb_add_obstruction_outline.null?
        @@mb_add_obstruction_outline = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "add_obstruction_outline", 1509147220_i64)
      end
      val_0 = shape_outline
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_obstruction_outline, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_merge : Void* = Pointer(Void).null
    def merge(other_geometry : NavigationMeshSourceGeometryData2D) : Void
      if @@mb_merge.null?
        @@mb_merge = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "merge", 742424872_i64)
      end
      val_0 = other_geometry
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_merge, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_projected_obstruction : Void* = Pointer(Void).null
    def add_projected_obstruction(vertices : Void*, carve : Bool) : Void
      if @@mb_add_projected_obstruction.null?
        @@mb_add_projected_obstruction = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "add_projected_obstruction", 3882407395_i64)
      end
      val_0 = vertices
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = carve
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_projected_obstruction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_projected_obstructions : Void* = Pointer(Void).null
    def clear_projected_obstructions() : Void
      if @@mb_clear_projected_obstructions.null?
        @@mb_clear_projected_obstructions = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "clear_projected_obstructions", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_projected_obstructions, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_projected_obstructions : Void* = Pointer(Void).null
    def set_projected_obstructions(projected_obstructions : Godot::Array) : Void
      if @@mb_set_projected_obstructions.null?
        @@mb_set_projected_obstructions = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "set_projected_obstructions", 381264803_i64)
      end
      arg_ptr_0 = projected_obstructions ? projected_obstructions.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_projected_obstructions, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_projected_obstructions : Void* = Pointer(Void).null
    def get_projected_obstructions() : Godot::Array
      if @@mb_get_projected_obstructions.null?
        @@mb_get_projected_obstructions = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "get_projected_obstructions", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_projected_obstructions, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_bounds : Void* = Pointer(Void).null
    def get_bounds() : Rect2
      if @@mb_get_bounds.null?
        @@mb_get_bounds = Bridge.get_method_bind("NavigationMeshSourceGeometryData2D", "get_bounds", 3248174_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bounds, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
  end
  class NavigationObstacle2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_rid : Void* = Pointer(Void).null
    def get_rid() : Int64
      if @@mb_get_rid.null?
        @@mb_get_rid = Bridge.get_method_bind("NavigationObstacle2D", "get_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_avoidance_enabled : Void* = Pointer(Void).null
    def set_avoidance_enabled(enabled : Bool) : Void
      if @@mb_set_avoidance_enabled.null?
        @@mb_set_avoidance_enabled = Bridge.get_method_bind("NavigationObstacle2D", "set_avoidance_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_avoidance_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_enabled : Void* = Pointer(Void).null
    def get_avoidance_enabled() : Bool
      if @@mb_get_avoidance_enabled.null?
        @@mb_get_avoidance_enabled = Bridge.get_method_bind("NavigationObstacle2D", "get_avoidance_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_avoidance_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_navigation_map : Void* = Pointer(Void).null
    def set_navigation_map(navigation_map : Int64) : Void
      if @@mb_set_navigation_map.null?
        @@mb_set_navigation_map = Bridge.get_method_bind("NavigationObstacle2D", "set_navigation_map", 2722037293_i64)
      end
      val_0 = navigation_map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_map : Void* = Pointer(Void).null
    def get_navigation_map() : Int64
      if @@mb_get_navigation_map.null?
        @@mb_get_navigation_map = Bridge.get_method_bind("NavigationObstacle2D", "get_navigation_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_radius : Void* = Pointer(Void).null
    def set_radius(radius : Float64) : Void
      if @@mb_set_radius.null?
        @@mb_set_radius = Bridge.get_method_bind("NavigationObstacle2D", "set_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_radius : Void* = Pointer(Void).null
    def get_radius() : Float64
      if @@mb_get_radius.null?
        @@mb_get_radius = Bridge.get_method_bind("NavigationObstacle2D", "get_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_velocity : Void* = Pointer(Void).null
    def set_velocity(velocity : Vector2) : Void
      if @@mb_set_velocity.null?
        @@mb_set_velocity = Bridge.get_method_bind("NavigationObstacle2D", "set_velocity", 743155724_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_velocity : Void* = Pointer(Void).null
    def get_velocity() : Vector2
      if @@mb_get_velocity.null?
        @@mb_get_velocity = Bridge.get_method_bind("NavigationObstacle2D", "get_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_vertices : Void* = Pointer(Void).null
    def set_vertices(vertices : Void*) : Void
      if @@mb_set_vertices.null?
        @@mb_set_vertices = Bridge.get_method_bind("NavigationObstacle2D", "set_vertices", 1509147220_i64)
      end
      val_0 = vertices
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertices, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vertices : Void* = Pointer(Void).null
    def get_vertices() : Void*
      if @@mb_get_vertices.null?
        @@mb_get_vertices = Bridge.get_method_bind("NavigationObstacle2D", "get_vertices", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_vertices, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_avoidance_layers : Void* = Pointer(Void).null
    def set_avoidance_layers(layers : Int64) : Void
      if @@mb_set_avoidance_layers.null?
        @@mb_set_avoidance_layers = Bridge.get_method_bind("NavigationObstacle2D", "set_avoidance_layers", 1286410249_i64)
      end
      val_0 = layers
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_avoidance_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_layers : Void* = Pointer(Void).null
    def get_avoidance_layers() : Int64
      if @@mb_get_avoidance_layers.null?
        @@mb_get_avoidance_layers = Bridge.get_method_bind("NavigationObstacle2D", "get_avoidance_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_avoidance_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_avoidance_layer_value : Void* = Pointer(Void).null
    def set_avoidance_layer_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_avoidance_layer_value.null?
        @@mb_set_avoidance_layer_value = Bridge.get_method_bind("NavigationObstacle2D", "set_avoidance_layer_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_avoidance_layer_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_avoidance_layer_value : Void* = Pointer(Void).null
    def get_avoidance_layer_value(layer_number : Int64) : Bool
      if @@mb_get_avoidance_layer_value.null?
        @@mb_get_avoidance_layer_value = Bridge.get_method_bind("NavigationObstacle2D", "get_avoidance_layer_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_avoidance_layer_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_affect_navigation_mesh : Void* = Pointer(Void).null
    def set_affect_navigation_mesh(enabled : Bool) : Void
      if @@mb_set_affect_navigation_mesh.null?
        @@mb_set_affect_navigation_mesh = Bridge.get_method_bind("NavigationObstacle2D", "set_affect_navigation_mesh", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_affect_navigation_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_affect_navigation_mesh : Void* = Pointer(Void).null
    def get_affect_navigation_mesh() : Bool
      if @@mb_get_affect_navigation_mesh.null?
        @@mb_get_affect_navigation_mesh = Bridge.get_method_bind("NavigationObstacle2D", "get_affect_navigation_mesh", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_affect_navigation_mesh, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_carve_navigation_mesh : Void* = Pointer(Void).null
    def set_carve_navigation_mesh(enabled : Bool) : Void
      if @@mb_set_carve_navigation_mesh.null?
        @@mb_set_carve_navigation_mesh = Bridge.get_method_bind("NavigationObstacle2D", "set_carve_navigation_mesh", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_carve_navigation_mesh, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_carve_navigation_mesh : Void* = Pointer(Void).null
    def get_carve_navigation_mesh() : Bool
      if @@mb_get_carve_navigation_mesh.null?
        @@mb_get_carve_navigation_mesh = Bridge.get_method_bind("NavigationObstacle2D", "get_carve_navigation_mesh", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_carve_navigation_mesh, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class NavigationPathQueryParameters2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum PathfindingAlgorithm : Int64
      PathfindingAlgorithmAstar = 0_i64
    end
    enum PathPostProcessing : Int64
      PathPostprocessingCorridorfunnel = 0_i64
      PathPostprocessingEdgecentered = 1_i64
      PathPostprocessingNone = 2_i64
    end
    enum PathMetadataFlags : Int64
      PathMetadataIncludeNone = 0_i64
      PathMetadataIncludeTypes = 1_i64
      PathMetadataIncludeRids = 2_i64
      PathMetadataIncludeOwners = 4_i64
      PathMetadataIncludeAll = 7_i64
    end
    @@mb_set_pathfinding_algorithm : Void* = Pointer(Void).null
    def set_pathfinding_algorithm(pathfinding_algorithm : Int64) : Void
      if @@mb_set_pathfinding_algorithm.null?
        @@mb_set_pathfinding_algorithm = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_pathfinding_algorithm", 2783519915_i64)
      end
      val_0 = pathfinding_algorithm
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_pathfinding_algorithm, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_pathfinding_algorithm : Void* = Pointer(Void).null
    def get_pathfinding_algorithm() : Int64
      if @@mb_get_pathfinding_algorithm.null?
        @@mb_get_pathfinding_algorithm = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_pathfinding_algorithm", 3000421146_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_pathfinding_algorithm, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_postprocessing : Void* = Pointer(Void).null
    def set_path_postprocessing(path_postprocessing : Int64) : Void
      if @@mb_set_path_postprocessing.null?
        @@mb_set_path_postprocessing = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_path_postprocessing", 2864409082_i64)
      end
      val_0 = path_postprocessing
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_postprocessing, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_postprocessing : Void* = Pointer(Void).null
    def get_path_postprocessing() : Int64
      if @@mb_get_path_postprocessing.null?
        @@mb_get_path_postprocessing = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_path_postprocessing", 3798118993_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_path_postprocessing, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_map : Void* = Pointer(Void).null
    def set_map(map : Int64) : Void
      if @@mb_set_map.null?
        @@mb_set_map = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_map", 2722037293_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_map : Void* = Pointer(Void).null
    def get_map() : Int64
      if @@mb_get_map.null?
        @@mb_get_map = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_start_position : Void* = Pointer(Void).null
    def set_start_position(start_position : Vector2) : Void
      if @@mb_set_start_position.null?
        @@mb_set_start_position = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_start_position", 743155724_i64)
      end
      val_0 = start_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_start_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_start_position : Void* = Pointer(Void).null
    def get_start_position() : Vector2
      if @@mb_get_start_position.null?
        @@mb_get_start_position = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_start_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_start_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_target_position : Void* = Pointer(Void).null
    def set_target_position(target_position : Vector2) : Void
      if @@mb_set_target_position.null?
        @@mb_set_target_position = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_target_position", 743155724_i64)
      end
      val_0 = target_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_position : Void* = Pointer(Void).null
    def get_target_position() : Vector2
      if @@mb_get_target_position.null?
        @@mb_get_target_position = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_target_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_target_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_navigation_layers : Void* = Pointer(Void).null
    def set_navigation_layers(navigation_layers : Int64) : Void
      if @@mb_set_navigation_layers.null?
        @@mb_set_navigation_layers = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_navigation_layers", 1286410249_i64)
      end
      val_0 = navigation_layers
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_layers : Void* = Pointer(Void).null
    def get_navigation_layers() : Int64
      if @@mb_get_navigation_layers.null?
        @@mb_get_navigation_layers = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_navigation_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_metadata_flags : Void* = Pointer(Void).null
    def set_metadata_flags(flags : Int64) : Void
      if @@mb_set_metadata_flags.null?
        @@mb_set_metadata_flags = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_metadata_flags", 24274129_i64)
      end
      val_0 = flags
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_metadata_flags, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_metadata_flags : Void* = Pointer(Void).null
    def get_metadata_flags() : Int64
      if @@mb_get_metadata_flags.null?
        @@mb_get_metadata_flags = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_metadata_flags", 488152976_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_metadata_flags, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_simplify_path : Void* = Pointer(Void).null
    def set_simplify_path(enabled : Bool) : Void
      if @@mb_set_simplify_path.null?
        @@mb_set_simplify_path = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_simplify_path", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_simplify_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_simplify_path : Void* = Pointer(Void).null
    def get_simplify_path() : Bool
      if @@mb_get_simplify_path.null?
        @@mb_get_simplify_path = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_simplify_path", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_simplify_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_simplify_epsilon : Void* = Pointer(Void).null
    def set_simplify_epsilon(epsilon : Float64) : Void
      if @@mb_set_simplify_epsilon.null?
        @@mb_set_simplify_epsilon = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_simplify_epsilon", 373806689_i64)
      end
      val_0 = epsilon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_simplify_epsilon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_simplify_epsilon : Void* = Pointer(Void).null
    def get_simplify_epsilon() : Float64
      if @@mb_get_simplify_epsilon.null?
        @@mb_get_simplify_epsilon = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_simplify_epsilon", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_simplify_epsilon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_included_regions : Void* = Pointer(Void).null
    def set_included_regions(regions : Godot::Array) : Void
      if @@mb_set_included_regions.null?
        @@mb_set_included_regions = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_included_regions", 381264803_i64)
      end
      arg_ptr_0 = regions ? regions.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_included_regions, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_included_regions : Void* = Pointer(Void).null
    def get_included_regions() : Godot::Array
      if @@mb_get_included_regions.null?
        @@mb_get_included_regions = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_included_regions", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_included_regions, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_excluded_regions : Void* = Pointer(Void).null
    def set_excluded_regions(regions : Godot::Array) : Void
      if @@mb_set_excluded_regions.null?
        @@mb_set_excluded_regions = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_excluded_regions", 381264803_i64)
      end
      arg_ptr_0 = regions ? regions.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_excluded_regions, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_excluded_regions : Void* = Pointer(Void).null
    def get_excluded_regions() : Godot::Array
      if @@mb_get_excluded_regions.null?
        @@mb_get_excluded_regions = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_excluded_regions", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_excluded_regions, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_path_return_max_length : Void* = Pointer(Void).null
    def set_path_return_max_length(length : Float64) : Void
      if @@mb_set_path_return_max_length.null?
        @@mb_set_path_return_max_length = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_path_return_max_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_return_max_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_return_max_length : Void* = Pointer(Void).null
    def get_path_return_max_length() : Float64
      if @@mb_get_path_return_max_length.null?
        @@mb_get_path_return_max_length = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_path_return_max_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_return_max_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_return_max_radius : Void* = Pointer(Void).null
    def set_path_return_max_radius(radius : Float64) : Void
      if @@mb_set_path_return_max_radius.null?
        @@mb_set_path_return_max_radius = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_path_return_max_radius", 373806689_i64)
      end
      val_0 = radius
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_return_max_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_return_max_radius : Void* = Pointer(Void).null
    def get_path_return_max_radius() : Float64
      if @@mb_get_path_return_max_radius.null?
        @@mb_get_path_return_max_radius = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_path_return_max_radius", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_return_max_radius, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_search_max_polygons : Void* = Pointer(Void).null
    def set_path_search_max_polygons(max_polygons : Int64) : Void
      if @@mb_set_path_search_max_polygons.null?
        @@mb_set_path_search_max_polygons = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_path_search_max_polygons", 1286410249_i64)
      end
      val_0 = max_polygons
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_search_max_polygons, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_search_max_polygons : Void* = Pointer(Void).null
    def get_path_search_max_polygons() : Int64
      if @@mb_get_path_search_max_polygons.null?
        @@mb_get_path_search_max_polygons = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_path_search_max_polygons", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_path_search_max_polygons, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_path_search_max_distance : Void* = Pointer(Void).null
    def set_path_search_max_distance(distance : Float64) : Void
      if @@mb_set_path_search_max_distance.null?
        @@mb_set_path_search_max_distance = Bridge.get_method_bind("NavigationPathQueryParameters2D", "set_path_search_max_distance", 373806689_i64)
      end
      val_0 = distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_search_max_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_search_max_distance : Void* = Pointer(Void).null
    def get_path_search_max_distance() : Float64
      if @@mb_get_path_search_max_distance.null?
        @@mb_get_path_search_max_distance = Bridge.get_method_bind("NavigationPathQueryParameters2D", "get_path_search_max_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_search_max_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class NavigationPathQueryResult2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum PathSegmentType : Int64
      PathSegmentTypeRegion = 0_i64
      PathSegmentTypeLink = 1_i64
    end
    @@mb_set_path : Void* = Pointer(Void).null
    def set_path(path : Void*) : Void
      if @@mb_set_path.null?
        @@mb_set_path = Bridge.get_method_bind("NavigationPathQueryResult2D", "set_path", 1509147220_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path : Void* = Pointer(Void).null
    def get_path() : Void*
      if @@mb_get_path.null?
        @@mb_get_path = Bridge.get_method_bind("NavigationPathQueryResult2D", "get_path", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_path_types : Void* = Pointer(Void).null
    def set_path_types(path_types : Void*) : Void
      if @@mb_set_path_types.null?
        @@mb_set_path_types = Bridge.get_method_bind("NavigationPathQueryResult2D", "set_path_types", 3614634198_i64)
      end
      val_0 = path_types
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_types, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_types : Void* = Pointer(Void).null
    def get_path_types() : Void*
      if @@mb_get_path_types.null?
        @@mb_get_path_types = Bridge.get_method_bind("NavigationPathQueryResult2D", "get_path_types", 1930428628_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_path_types, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_path_rids : Void* = Pointer(Void).null
    def set_path_rids(path_rids : Godot::Array) : Void
      if @@mb_set_path_rids.null?
        @@mb_set_path_rids = Bridge.get_method_bind("NavigationPathQueryResult2D", "set_path_rids", 381264803_i64)
      end
      arg_ptr_0 = path_rids ? path_rids.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_rids, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_rids : Void* = Pointer(Void).null
    def get_path_rids() : Godot::Array
      if @@mb_get_path_rids.null?
        @@mb_get_path_rids = Bridge.get_method_bind("NavigationPathQueryResult2D", "get_path_rids", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_path_rids, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_path_owner_ids : Void* = Pointer(Void).null
    def set_path_owner_ids(path_owner_ids : Void*) : Void
      if @@mb_set_path_owner_ids.null?
        @@mb_set_path_owner_ids = Bridge.get_method_bind("NavigationPathQueryResult2D", "set_path_owner_ids", 3709968205_i64)
      end
      val_0 = path_owner_ids
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_owner_ids, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_owner_ids : Void* = Pointer(Void).null
    def get_path_owner_ids() : Void*
      if @@mb_get_path_owner_ids.null?
        @@mb_get_path_owner_ids = Bridge.get_method_bind("NavigationPathQueryResult2D", "get_path_owner_ids", 235988956_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_path_owner_ids, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_path_length : Void* = Pointer(Void).null
    def set_path_length(length : Float64) : Void
      if @@mb_set_path_length.null?
        @@mb_set_path_length = Bridge.get_method_bind("NavigationPathQueryResult2D", "set_path_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_path_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_path_length : Void* = Pointer(Void).null
    def get_path_length() : Float64
      if @@mb_get_path_length.null?
        @@mb_get_path_length = Bridge.get_method_bind("NavigationPathQueryResult2D", "get_path_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_path_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_reset : Void* = Pointer(Void).null
    def reset() : Void
      if @@mb_reset.null?
        @@mb_reset = Bridge.get_method_bind("NavigationPathQueryResult2D", "reset", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reset, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
  end
  class NavigationRegion2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_rid : Void* = Pointer(Void).null
    def get_rid() : Int64
      if @@mb_get_rid.null?
        @@mb_get_rid = Bridge.get_method_bind("NavigationRegion2D", "get_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_navigation_polygon : Void* = Pointer(Void).null
    def set_navigation_polygon(navigation_polygon : NavigationPolygon) : Void
      if @@mb_set_navigation_polygon.null?
        @@mb_set_navigation_polygon = Bridge.get_method_bind("NavigationRegion2D", "set_navigation_polygon", 1515040758_i64)
      end
      val_0 = navigation_polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_polygon : Void* = Pointer(Void).null
    def get_navigation_polygon() : NavigationPolygon
      if @@mb_get_navigation_polygon.null?
        @@mb_get_navigation_polygon = Bridge.get_method_bind("NavigationRegion2D", "get_navigation_polygon", 1046532237_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_navigation_polygon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NavigationPolygon.new(ret_ptr)
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("NavigationRegion2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_enabled : Void* = Pointer(Void).null
    def is_enabled() : Bool
      if @@mb_is_enabled.null?
        @@mb_is_enabled = Bridge.get_method_bind("NavigationRegion2D", "is_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_navigation_map : Void* = Pointer(Void).null
    def set_navigation_map(navigation_map : Int64) : Void
      if @@mb_set_navigation_map.null?
        @@mb_set_navigation_map = Bridge.get_method_bind("NavigationRegion2D", "set_navigation_map", 2722037293_i64)
      end
      val_0 = navigation_map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_map : Void* = Pointer(Void).null
    def get_navigation_map() : Int64
      if @@mb_get_navigation_map.null?
        @@mb_get_navigation_map = Bridge.get_method_bind("NavigationRegion2D", "get_navigation_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_edge_connections : Void* = Pointer(Void).null
    def set_use_edge_connections(enabled : Bool) : Void
      if @@mb_set_use_edge_connections.null?
        @@mb_set_use_edge_connections = Bridge.get_method_bind("NavigationRegion2D", "set_use_edge_connections", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_edge_connections, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_use_edge_connections : Void* = Pointer(Void).null
    def get_use_edge_connections() : Bool
      if @@mb_get_use_edge_connections.null?
        @@mb_get_use_edge_connections = Bridge.get_method_bind("NavigationRegion2D", "get_use_edge_connections", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_edge_connections, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_navigation_layers : Void* = Pointer(Void).null
    def set_navigation_layers(navigation_layers : Int64) : Void
      if @@mb_set_navigation_layers.null?
        @@mb_set_navigation_layers = Bridge.get_method_bind("NavigationRegion2D", "set_navigation_layers", 1286410249_i64)
      end
      val_0 = navigation_layers
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_navigation_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_layers : Void* = Pointer(Void).null
    def get_navigation_layers() : Int64
      if @@mb_get_navigation_layers.null?
        @@mb_get_navigation_layers = Bridge.get_method_bind("NavigationRegion2D", "get_navigation_layers", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_layers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_navigation_layer_value : Void* = Pointer(Void).null
    def set_navigation_layer_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_navigation_layer_value.null?
        @@mb_set_navigation_layer_value = Bridge.get_method_bind("NavigationRegion2D", "set_navigation_layer_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_navigation_layer_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_navigation_layer_value : Void* = Pointer(Void).null
    def get_navigation_layer_value(layer_number : Int64) : Bool
      if @@mb_get_navigation_layer_value.null?
        @@mb_get_navigation_layer_value = Bridge.get_method_bind("NavigationRegion2D", "get_navigation_layer_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_navigation_layer_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_region_rid : Void* = Pointer(Void).null
    def get_region_rid() : Int64
      if @@mb_get_region_rid.null?
        @@mb_get_region_rid = Bridge.get_method_bind("NavigationRegion2D", "get_region_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_region_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enter_cost : Void* = Pointer(Void).null
    def set_enter_cost(enter_cost : Float64) : Void
      if @@mb_set_enter_cost.null?
        @@mb_set_enter_cost = Bridge.get_method_bind("NavigationRegion2D", "set_enter_cost", 373806689_i64)
      end
      val_0 = enter_cost
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enter_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enter_cost : Void* = Pointer(Void).null
    def get_enter_cost() : Float64
      if @@mb_get_enter_cost.null?
        @@mb_get_enter_cost = Bridge.get_method_bind("NavigationRegion2D", "get_enter_cost", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_enter_cost, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_travel_cost : Void* = Pointer(Void).null
    def set_travel_cost(travel_cost : Float64) : Void
      if @@mb_set_travel_cost.null?
        @@mb_set_travel_cost = Bridge.get_method_bind("NavigationRegion2D", "set_travel_cost", 373806689_i64)
      end
      val_0 = travel_cost
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_travel_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_travel_cost : Void* = Pointer(Void).null
    def get_travel_cost() : Float64
      if @@mb_get_travel_cost.null?
        @@mb_get_travel_cost = Bridge.get_method_bind("NavigationRegion2D", "get_travel_cost", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_travel_cost, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_bake_navigation_polygon : Void* = Pointer(Void).null
    def bake_navigation_polygon(on_thread : Bool) : Void
      if @@mb_bake_navigation_polygon.null?
        @@mb_bake_navigation_polygon = Bridge.get_method_bind("NavigationRegion2D", "bake_navigation_polygon", 3216645846_i64)
      end
      val_0 = on_thread
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_bake_navigation_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_baking : Void* = Pointer(Void).null
    def is_baking() : Bool
      if @@mb_is_baking.null?
        @@mb_is_baking = Bridge.get_method_bind("NavigationRegion2D", "is_baking", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_baking, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_bounds : Void* = Pointer(Void).null
    def get_bounds() : Rect2
      if @@mb_get_bounds.null?
        @@mb_get_bounds = Bridge.get_method_bind("NavigationRegion2D", "get_bounds", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bounds, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
  end
  class NavigationServer2D < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum ProcessInfo : Int64
      InfoActiveMaps = 0_i64
      InfoRegionCount = 1_i64
      InfoAgentCount = 2_i64
      InfoLinkCount = 3_i64
      InfoPolygonCount = 4_i64
      InfoEdgeCount = 5_i64
      InfoEdgeMergeCount = 6_i64
      InfoEdgeConnectionCount = 7_i64
      InfoEdgeFreeCount = 8_i64
      InfoObstacleCount = 9_i64
    end
    @@mb_get_maps : Void* = Pointer(Void).null
    def get_maps() : Godot::Array
      if @@mb_get_maps.null?
        @@mb_get_maps = Bridge.get_method_bind("NavigationServer2D", "get_maps", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_maps, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_map_create : Void* = Pointer(Void).null
    def map_create() : Int64
      if @@mb_map_create.null?
        @@mb_map_create = Bridge.get_method_bind("NavigationServer2D", "map_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_map_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_set_active : Void* = Pointer(Void).null
    def map_set_active(map : Int64, active : Bool) : Void
      if @@mb_map_set_active.null?
        @@mb_map_set_active = Bridge.get_method_bind("NavigationServer2D", "map_set_active", 1265174801_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = active
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_map_set_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_is_active : Void* = Pointer(Void).null
    def map_is_active(map : Int64) : Bool
      if @@mb_map_is_active.null?
        @@mb_map_is_active = Bridge.get_method_bind("NavigationServer2D", "map_is_active", 4155700596_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_map_is_active, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_map_set_cell_size : Void* = Pointer(Void).null
    def map_set_cell_size(map : Int64, cell_size : Float64) : Void
      if @@mb_map_set_cell_size.null?
        @@mb_map_set_cell_size = Bridge.get_method_bind("NavigationServer2D", "map_set_cell_size", 1794382983_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = cell_size
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_map_set_cell_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_get_cell_size : Void* = Pointer(Void).null
    def map_get_cell_size(map : Int64) : Float64
      if @@mb_map_get_cell_size.null?
        @@mb_map_get_cell_size = Bridge.get_method_bind("NavigationServer2D", "map_get_cell_size", 866169185_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_map_get_cell_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_set_merge_rasterizer_cell_scale : Void* = Pointer(Void).null
    def map_set_merge_rasterizer_cell_scale(map : Int64, scale : Float64) : Void
      if @@mb_map_set_merge_rasterizer_cell_scale.null?
        @@mb_map_set_merge_rasterizer_cell_scale = Bridge.get_method_bind("NavigationServer2D", "map_set_merge_rasterizer_cell_scale", 1794382983_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = scale
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_map_set_merge_rasterizer_cell_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_get_merge_rasterizer_cell_scale : Void* = Pointer(Void).null
    def map_get_merge_rasterizer_cell_scale(map : Int64) : Float64
      if @@mb_map_get_merge_rasterizer_cell_scale.null?
        @@mb_map_get_merge_rasterizer_cell_scale = Bridge.get_method_bind("NavigationServer2D", "map_get_merge_rasterizer_cell_scale", 866169185_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_map_get_merge_rasterizer_cell_scale, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_set_use_edge_connections : Void* = Pointer(Void).null
    def map_set_use_edge_connections(map : Int64, enabled : Bool) : Void
      if @@mb_map_set_use_edge_connections.null?
        @@mb_map_set_use_edge_connections = Bridge.get_method_bind("NavigationServer2D", "map_set_use_edge_connections", 1265174801_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_map_set_use_edge_connections, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_get_use_edge_connections : Void* = Pointer(Void).null
    def map_get_use_edge_connections(map : Int64) : Bool
      if @@mb_map_get_use_edge_connections.null?
        @@mb_map_get_use_edge_connections = Bridge.get_method_bind("NavigationServer2D", "map_get_use_edge_connections", 4155700596_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_map_get_use_edge_connections, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_map_set_edge_connection_margin : Void* = Pointer(Void).null
    def map_set_edge_connection_margin(map : Int64, margin : Float64) : Void
      if @@mb_map_set_edge_connection_margin.null?
        @@mb_map_set_edge_connection_margin = Bridge.get_method_bind("NavigationServer2D", "map_set_edge_connection_margin", 1794382983_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = margin
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_map_set_edge_connection_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_get_edge_connection_margin : Void* = Pointer(Void).null
    def map_get_edge_connection_margin(map : Int64) : Float64
      if @@mb_map_get_edge_connection_margin.null?
        @@mb_map_get_edge_connection_margin = Bridge.get_method_bind("NavigationServer2D", "map_get_edge_connection_margin", 866169185_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_map_get_edge_connection_margin, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_set_link_connection_radius : Void* = Pointer(Void).null
    def map_set_link_connection_radius(map : Int64, radius : Float64) : Void
      if @@mb_map_set_link_connection_radius.null?
        @@mb_map_set_link_connection_radius = Bridge.get_method_bind("NavigationServer2D", "map_set_link_connection_radius", 1794382983_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = radius
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_map_set_link_connection_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_get_link_connection_radius : Void* = Pointer(Void).null
    def map_get_link_connection_radius(map : Int64) : Float64
      if @@mb_map_get_link_connection_radius.null?
        @@mb_map_get_link_connection_radius = Bridge.get_method_bind("NavigationServer2D", "map_get_link_connection_radius", 866169185_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_map_get_link_connection_radius, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_get_path : Void* = Pointer(Void).null
    def map_get_path(map : Int64, origin : Vector2, destination : Vector2, optimize : Bool, navigation_layers : Int64) : Void*
      if @@mb_map_get_path.null?
        @@mb_map_get_path = Bridge.get_method_bind("NavigationServer2D", "map_get_path", 1279824844_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = origin
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = destination
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = optimize
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = navigation_layers
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_map_get_path, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_map_get_closest_point : Void* = Pointer(Void).null
    def map_get_closest_point(map : Int64, to_point : Vector2) : Vector2
      if @@mb_map_get_closest_point.null?
        @@mb_map_get_closest_point = Bridge.get_method_bind("NavigationServer2D", "map_get_closest_point", 1358334418_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_point
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_map_get_closest_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_get_closest_point_owner : Void* = Pointer(Void).null
    def map_get_closest_point_owner(map : Int64, to_point : Vector2) : Int64
      if @@mb_map_get_closest_point_owner.null?
        @@mb_map_get_closest_point_owner = Bridge.get_method_bind("NavigationServer2D", "map_get_closest_point_owner", 1353467510_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_point
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_map_get_closest_point_owner, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_get_links : Void* = Pointer(Void).null
    def map_get_links(map : Int64) : Godot::Array
      if @@mb_map_get_links.null?
        @@mb_map_get_links = Bridge.get_method_bind("NavigationServer2D", "map_get_links", 2684255073_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_map_get_links, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_map_get_regions : Void* = Pointer(Void).null
    def map_get_regions(map : Int64) : Godot::Array
      if @@mb_map_get_regions.null?
        @@mb_map_get_regions = Bridge.get_method_bind("NavigationServer2D", "map_get_regions", 2684255073_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_map_get_regions, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_map_get_agents : Void* = Pointer(Void).null
    def map_get_agents(map : Int64) : Godot::Array
      if @@mb_map_get_agents.null?
        @@mb_map_get_agents = Bridge.get_method_bind("NavigationServer2D", "map_get_agents", 2684255073_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_map_get_agents, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_map_get_obstacles : Void* = Pointer(Void).null
    def map_get_obstacles(map : Int64) : Godot::Array
      if @@mb_map_get_obstacles.null?
        @@mb_map_get_obstacles = Bridge.get_method_bind("NavigationServer2D", "map_get_obstacles", 2684255073_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_map_get_obstacles, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_map_force_update : Void* = Pointer(Void).null
    def map_force_update(map : Int64) : Void
      if @@mb_map_force_update.null?
        @@mb_map_force_update = Bridge.get_method_bind("NavigationServer2D", "map_force_update", 2722037293_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_map_force_update, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_get_iteration_id : Void* = Pointer(Void).null
    def map_get_iteration_id(map : Int64) : Int64
      if @@mb_map_get_iteration_id.null?
        @@mb_map_get_iteration_id = Bridge.get_method_bind("NavigationServer2D", "map_get_iteration_id", 2198884583_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_map_get_iteration_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_map_set_use_async_iterations : Void* = Pointer(Void).null
    def map_set_use_async_iterations(map : Int64, enabled : Bool) : Void
      if @@mb_map_set_use_async_iterations.null?
        @@mb_map_set_use_async_iterations = Bridge.get_method_bind("NavigationServer2D", "map_set_use_async_iterations", 1265174801_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_map_set_use_async_iterations, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_map_get_use_async_iterations : Void* = Pointer(Void).null
    def map_get_use_async_iterations(map : Int64) : Bool
      if @@mb_map_get_use_async_iterations.null?
        @@mb_map_get_use_async_iterations = Bridge.get_method_bind("NavigationServer2D", "map_get_use_async_iterations", 4155700596_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_map_get_use_async_iterations, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_map_get_random_point : Void* = Pointer(Void).null
    def map_get_random_point(map : Int64, navigation_layers : Int64, uniformly : Bool) : Vector2
      if @@mb_map_get_random_point.null?
        @@mb_map_get_random_point = Bridge.get_method_bind("NavigationServer2D", "map_get_random_point", 3271000763_i64)
      end
      val_0 = map
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = navigation_layers
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = uniformly
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_map_get_random_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_query_path : Void* = Pointer(Void).null
    def query_path(parameters : NavigationPathQueryParameters2D, result : NavigationPathQueryResult2D, callback : Void*) : Void
      if @@mb_query_path.null?
        @@mb_query_path = Bridge.get_method_bind("NavigationServer2D", "query_path", 1254915886_i64)
      end
      val_0 = parameters
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = result
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_query_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_create : Void* = Pointer(Void).null
    def region_create() : Int64
      if @@mb_region_create.null?
        @@mb_region_create = Bridge.get_method_bind("NavigationServer2D", "region_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_region_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_get_iteration_id : Void* = Pointer(Void).null
    def region_get_iteration_id(region : Int64) : Int64
      if @@mb_region_get_iteration_id.null?
        @@mb_region_get_iteration_id = Bridge.get_method_bind("NavigationServer2D", "region_get_iteration_id", 2198884583_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_region_get_iteration_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_set_use_async_iterations : Void* = Pointer(Void).null
    def region_set_use_async_iterations(region : Int64, enabled : Bool) : Void
      if @@mb_region_set_use_async_iterations.null?
        @@mb_region_set_use_async_iterations = Bridge.get_method_bind("NavigationServer2D", "region_set_use_async_iterations", 1265174801_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_use_async_iterations, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_use_async_iterations : Void* = Pointer(Void).null
    def region_get_use_async_iterations(region : Int64) : Bool
      if @@mb_region_get_use_async_iterations.null?
        @@mb_region_get_use_async_iterations = Bridge.get_method_bind("NavigationServer2D", "region_get_use_async_iterations", 4155700596_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_region_get_use_async_iterations, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_region_set_enabled : Void* = Pointer(Void).null
    def region_set_enabled(region : Int64, enabled : Bool) : Void
      if @@mb_region_set_enabled.null?
        @@mb_region_set_enabled = Bridge.get_method_bind("NavigationServer2D", "region_set_enabled", 1265174801_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_enabled : Void* = Pointer(Void).null
    def region_get_enabled(region : Int64) : Bool
      if @@mb_region_get_enabled.null?
        @@mb_region_get_enabled = Bridge.get_method_bind("NavigationServer2D", "region_get_enabled", 4155700596_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_region_get_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_region_set_use_edge_connections : Void* = Pointer(Void).null
    def region_set_use_edge_connections(region : Int64, enabled : Bool) : Void
      if @@mb_region_set_use_edge_connections.null?
        @@mb_region_set_use_edge_connections = Bridge.get_method_bind("NavigationServer2D", "region_set_use_edge_connections", 1265174801_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_use_edge_connections, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_use_edge_connections : Void* = Pointer(Void).null
    def region_get_use_edge_connections(region : Int64) : Bool
      if @@mb_region_get_use_edge_connections.null?
        @@mb_region_get_use_edge_connections = Bridge.get_method_bind("NavigationServer2D", "region_get_use_edge_connections", 4155700596_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_region_get_use_edge_connections, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_region_set_enter_cost : Void* = Pointer(Void).null
    def region_set_enter_cost(region : Int64, enter_cost : Float64) : Void
      if @@mb_region_set_enter_cost.null?
        @@mb_region_set_enter_cost = Bridge.get_method_bind("NavigationServer2D", "region_set_enter_cost", 1794382983_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enter_cost
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_enter_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_enter_cost : Void* = Pointer(Void).null
    def region_get_enter_cost(region : Int64) : Float64
      if @@mb_region_get_enter_cost.null?
        @@mb_region_get_enter_cost = Bridge.get_method_bind("NavigationServer2D", "region_get_enter_cost", 866169185_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_region_get_enter_cost, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_set_travel_cost : Void* = Pointer(Void).null
    def region_set_travel_cost(region : Int64, travel_cost : Float64) : Void
      if @@mb_region_set_travel_cost.null?
        @@mb_region_set_travel_cost = Bridge.get_method_bind("NavigationServer2D", "region_set_travel_cost", 1794382983_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = travel_cost
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_travel_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_travel_cost : Void* = Pointer(Void).null
    def region_get_travel_cost(region : Int64) : Float64
      if @@mb_region_get_travel_cost.null?
        @@mb_region_get_travel_cost = Bridge.get_method_bind("NavigationServer2D", "region_get_travel_cost", 866169185_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_region_get_travel_cost, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_set_owner_id : Void* = Pointer(Void).null
    def region_set_owner_id(region : Int64, owner_id : Int64) : Void
      if @@mb_region_set_owner_id.null?
        @@mb_region_set_owner_id = Bridge.get_method_bind("NavigationServer2D", "region_set_owner_id", 3411492887_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = owner_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_owner_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_owner_id : Void* = Pointer(Void).null
    def region_get_owner_id(region : Int64) : Int64
      if @@mb_region_get_owner_id.null?
        @@mb_region_get_owner_id = Bridge.get_method_bind("NavigationServer2D", "region_get_owner_id", 2198884583_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_region_get_owner_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_owns_point : Void* = Pointer(Void).null
    def region_owns_point(region : Int64, point : Vector2) : Bool
      if @@mb_region_owns_point.null?
        @@mb_region_owns_point = Bridge.get_method_bind("NavigationServer2D", "region_owns_point", 219849798_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = point
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_region_owns_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_region_set_map : Void* = Pointer(Void).null
    def region_set_map(region : Int64, map : Int64) : Void
      if @@mb_region_set_map.null?
        @@mb_region_set_map = Bridge.get_method_bind("NavigationServer2D", "region_set_map", 395945892_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = map
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_map : Void* = Pointer(Void).null
    def region_get_map(region : Int64) : Int64
      if @@mb_region_get_map.null?
        @@mb_region_get_map = Bridge.get_method_bind("NavigationServer2D", "region_get_map", 3814569979_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_region_get_map, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_set_navigation_layers : Void* = Pointer(Void).null
    def region_set_navigation_layers(region : Int64, navigation_layers : Int64) : Void
      if @@mb_region_set_navigation_layers.null?
        @@mb_region_set_navigation_layers = Bridge.get_method_bind("NavigationServer2D", "region_set_navigation_layers", 3411492887_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = navigation_layers
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_navigation_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_navigation_layers : Void* = Pointer(Void).null
    def region_get_navigation_layers(region : Int64) : Int64
      if @@mb_region_get_navigation_layers.null?
        @@mb_region_get_navigation_layers = Bridge.get_method_bind("NavigationServer2D", "region_get_navigation_layers", 2198884583_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_region_get_navigation_layers, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_set_transform : Void* = Pointer(Void).null
    def region_set_transform(region : Int64, transform : Transform2D) : Void
      if @@mb_region_set_transform.null?
        @@mb_region_set_transform = Bridge.get_method_bind("NavigationServer2D", "region_set_transform", 1246044741_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_transform : Void* = Pointer(Void).null
    def region_get_transform(region : Int64) : Transform2D
      if @@mb_region_get_transform.null?
        @@mb_region_get_transform = Bridge.get_method_bind("NavigationServer2D", "region_get_transform", 213527486_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_region_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_region_set_navigation_polygon : Void* = Pointer(Void).null
    def region_set_navigation_polygon(region : Int64, navigation_polygon : NavigationPolygon) : Void
      if @@mb_region_set_navigation_polygon.null?
        @@mb_region_set_navigation_polygon = Bridge.get_method_bind("NavigationServer2D", "region_set_navigation_polygon", 3633623451_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = navigation_polygon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_region_set_navigation_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_region_get_connections_count : Void* = Pointer(Void).null
    def region_get_connections_count(region : Int64) : Int64
      if @@mb_region_get_connections_count.null?
        @@mb_region_get_connections_count = Bridge.get_method_bind("NavigationServer2D", "region_get_connections_count", 2198884583_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_region_get_connections_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_get_connection_pathway_start : Void* = Pointer(Void).null
    def region_get_connection_pathway_start(region : Int64, connection : Int64) : Vector2
      if @@mb_region_get_connection_pathway_start.null?
        @@mb_region_get_connection_pathway_start = Bridge.get_method_bind("NavigationServer2D", "region_get_connection_pathway_start", 2546185844_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = connection
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_region_get_connection_pathway_start, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_get_connection_pathway_end : Void* = Pointer(Void).null
    def region_get_connection_pathway_end(region : Int64, connection : Int64) : Vector2
      if @@mb_region_get_connection_pathway_end.null?
        @@mb_region_get_connection_pathway_end = Bridge.get_method_bind("NavigationServer2D", "region_get_connection_pathway_end", 2546185844_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = connection
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_region_get_connection_pathway_end, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_get_closest_point : Void* = Pointer(Void).null
    def region_get_closest_point(region : Int64, to_point : Vector2) : Vector2
      if @@mb_region_get_closest_point.null?
        @@mb_region_get_closest_point = Bridge.get_method_bind("NavigationServer2D", "region_get_closest_point", 1358334418_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to_point
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_region_get_closest_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_get_random_point : Void* = Pointer(Void).null
    def region_get_random_point(region : Int64, navigation_layers : Int64, uniformly : Bool) : Vector2
      if @@mb_region_get_random_point.null?
        @@mb_region_get_random_point = Bridge.get_method_bind("NavigationServer2D", "region_get_random_point", 3271000763_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = navigation_layers
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = uniformly
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_region_get_random_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_region_get_bounds : Void* = Pointer(Void).null
    def region_get_bounds(region : Int64) : Rect2
      if @@mb_region_get_bounds.null?
        @@mb_region_get_bounds = Bridge.get_method_bind("NavigationServer2D", "region_get_bounds", 1097232729_i64)
      end
      val_0 = region
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_region_get_bounds, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_link_create : Void* = Pointer(Void).null
    def link_create() : Int64
      if @@mb_link_create.null?
        @@mb_link_create = Bridge.get_method_bind("NavigationServer2D", "link_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_link_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_get_iteration_id : Void* = Pointer(Void).null
    def link_get_iteration_id(link : Int64) : Int64
      if @@mb_link_get_iteration_id.null?
        @@mb_link_get_iteration_id = Bridge.get_method_bind("NavigationServer2D", "link_get_iteration_id", 2198884583_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_link_get_iteration_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_set_map : Void* = Pointer(Void).null
    def link_set_map(link : Int64, map : Int64) : Void
      if @@mb_link_set_map.null?
        @@mb_link_set_map = Bridge.get_method_bind("NavigationServer2D", "link_set_map", 395945892_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = map
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_map : Void* = Pointer(Void).null
    def link_get_map(link : Int64) : Int64
      if @@mb_link_get_map.null?
        @@mb_link_get_map = Bridge.get_method_bind("NavigationServer2D", "link_get_map", 3814569979_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_link_get_map, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_set_enabled : Void* = Pointer(Void).null
    def link_set_enabled(link : Int64, enabled : Bool) : Void
      if @@mb_link_set_enabled.null?
        @@mb_link_set_enabled = Bridge.get_method_bind("NavigationServer2D", "link_set_enabled", 1265174801_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_enabled : Void* = Pointer(Void).null
    def link_get_enabled(link : Int64) : Bool
      if @@mb_link_get_enabled.null?
        @@mb_link_get_enabled = Bridge.get_method_bind("NavigationServer2D", "link_get_enabled", 4155700596_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_link_get_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_link_set_bidirectional : Void* = Pointer(Void).null
    def link_set_bidirectional(link : Int64, bidirectional : Bool) : Void
      if @@mb_link_set_bidirectional.null?
        @@mb_link_set_bidirectional = Bridge.get_method_bind("NavigationServer2D", "link_set_bidirectional", 1265174801_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bidirectional
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_bidirectional, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_is_bidirectional : Void* = Pointer(Void).null
    def link_is_bidirectional(link : Int64) : Bool
      if @@mb_link_is_bidirectional.null?
        @@mb_link_is_bidirectional = Bridge.get_method_bind("NavigationServer2D", "link_is_bidirectional", 4155700596_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_link_is_bidirectional, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_link_set_navigation_layers : Void* = Pointer(Void).null
    def link_set_navigation_layers(link : Int64, navigation_layers : Int64) : Void
      if @@mb_link_set_navigation_layers.null?
        @@mb_link_set_navigation_layers = Bridge.get_method_bind("NavigationServer2D", "link_set_navigation_layers", 3411492887_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = navigation_layers
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_navigation_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_navigation_layers : Void* = Pointer(Void).null
    def link_get_navigation_layers(link : Int64) : Int64
      if @@mb_link_get_navigation_layers.null?
        @@mb_link_get_navigation_layers = Bridge.get_method_bind("NavigationServer2D", "link_get_navigation_layers", 2198884583_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_link_get_navigation_layers, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_set_start_position : Void* = Pointer(Void).null
    def link_set_start_position(link : Int64, position : Vector2) : Void
      if @@mb_link_set_start_position.null?
        @@mb_link_set_start_position = Bridge.get_method_bind("NavigationServer2D", "link_set_start_position", 3201125042_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_start_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_start_position : Void* = Pointer(Void).null
    def link_get_start_position(link : Int64) : Vector2
      if @@mb_link_get_start_position.null?
        @@mb_link_get_start_position = Bridge.get_method_bind("NavigationServer2D", "link_get_start_position", 2440833711_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_link_get_start_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_set_end_position : Void* = Pointer(Void).null
    def link_set_end_position(link : Int64, position : Vector2) : Void
      if @@mb_link_set_end_position.null?
        @@mb_link_set_end_position = Bridge.get_method_bind("NavigationServer2D", "link_set_end_position", 3201125042_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_end_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_end_position : Void* = Pointer(Void).null
    def link_get_end_position(link : Int64) : Vector2
      if @@mb_link_get_end_position.null?
        @@mb_link_get_end_position = Bridge.get_method_bind("NavigationServer2D", "link_get_end_position", 2440833711_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_link_get_end_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_set_enter_cost : Void* = Pointer(Void).null
    def link_set_enter_cost(link : Int64, enter_cost : Float64) : Void
      if @@mb_link_set_enter_cost.null?
        @@mb_link_set_enter_cost = Bridge.get_method_bind("NavigationServer2D", "link_set_enter_cost", 1794382983_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enter_cost
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_enter_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_enter_cost : Void* = Pointer(Void).null
    def link_get_enter_cost(link : Int64) : Float64
      if @@mb_link_get_enter_cost.null?
        @@mb_link_get_enter_cost = Bridge.get_method_bind("NavigationServer2D", "link_get_enter_cost", 866169185_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_link_get_enter_cost, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_set_travel_cost : Void* = Pointer(Void).null
    def link_set_travel_cost(link : Int64, travel_cost : Float64) : Void
      if @@mb_link_set_travel_cost.null?
        @@mb_link_set_travel_cost = Bridge.get_method_bind("NavigationServer2D", "link_set_travel_cost", 1794382983_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = travel_cost
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_travel_cost, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_travel_cost : Void* = Pointer(Void).null
    def link_get_travel_cost(link : Int64) : Float64
      if @@mb_link_get_travel_cost.null?
        @@mb_link_get_travel_cost = Bridge.get_method_bind("NavigationServer2D", "link_get_travel_cost", 866169185_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_link_get_travel_cost, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_link_set_owner_id : Void* = Pointer(Void).null
    def link_set_owner_id(link : Int64, owner_id : Int64) : Void
      if @@mb_link_set_owner_id.null?
        @@mb_link_set_owner_id = Bridge.get_method_bind("NavigationServer2D", "link_set_owner_id", 3411492887_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = owner_id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_link_set_owner_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_link_get_owner_id : Void* = Pointer(Void).null
    def link_get_owner_id(link : Int64) : Int64
      if @@mb_link_get_owner_id.null?
        @@mb_link_get_owner_id = Bridge.get_method_bind("NavigationServer2D", "link_get_owner_id", 2198884583_i64)
      end
      val_0 = link
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_link_get_owner_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_create : Void* = Pointer(Void).null
    def agent_create() : Int64
      if @@mb_agent_create.null?
        @@mb_agent_create = Bridge.get_method_bind("NavigationServer2D", "agent_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_agent_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_avoidance_enabled : Void* = Pointer(Void).null
    def agent_set_avoidance_enabled(agent : Int64, enabled : Bool) : Void
      if @@mb_agent_set_avoidance_enabled.null?
        @@mb_agent_set_avoidance_enabled = Bridge.get_method_bind("NavigationServer2D", "agent_set_avoidance_enabled", 1265174801_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_avoidance_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_avoidance_enabled : Void* = Pointer(Void).null
    def agent_get_avoidance_enabled(agent : Int64) : Bool
      if @@mb_agent_get_avoidance_enabled.null?
        @@mb_agent_get_avoidance_enabled = Bridge.get_method_bind("NavigationServer2D", "agent_get_avoidance_enabled", 4155700596_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_agent_get_avoidance_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_agent_set_map : Void* = Pointer(Void).null
    def agent_set_map(agent : Int64, map : Int64) : Void
      if @@mb_agent_set_map.null?
        @@mb_agent_set_map = Bridge.get_method_bind("NavigationServer2D", "agent_set_map", 395945892_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = map
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_map : Void* = Pointer(Void).null
    def agent_get_map(agent : Int64) : Int64
      if @@mb_agent_get_map.null?
        @@mb_agent_get_map = Bridge.get_method_bind("NavigationServer2D", "agent_get_map", 3814569979_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_agent_get_map, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_paused : Void* = Pointer(Void).null
    def agent_set_paused(agent : Int64, paused : Bool) : Void
      if @@mb_agent_set_paused.null?
        @@mb_agent_set_paused = Bridge.get_method_bind("NavigationServer2D", "agent_set_paused", 1265174801_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = paused
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_paused, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_paused : Void* = Pointer(Void).null
    def agent_get_paused(agent : Int64) : Bool
      if @@mb_agent_get_paused.null?
        @@mb_agent_get_paused = Bridge.get_method_bind("NavigationServer2D", "agent_get_paused", 4155700596_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_agent_get_paused, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_agent_set_neighbor_distance : Void* = Pointer(Void).null
    def agent_set_neighbor_distance(agent : Int64, distance : Float64) : Void
      if @@mb_agent_set_neighbor_distance.null?
        @@mb_agent_set_neighbor_distance = Bridge.get_method_bind("NavigationServer2D", "agent_set_neighbor_distance", 1794382983_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = distance
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_neighbor_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_neighbor_distance : Void* = Pointer(Void).null
    def agent_get_neighbor_distance(agent : Int64) : Float64
      if @@mb_agent_get_neighbor_distance.null?
        @@mb_agent_get_neighbor_distance = Bridge.get_method_bind("NavigationServer2D", "agent_get_neighbor_distance", 866169185_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_agent_get_neighbor_distance, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_max_neighbors : Void* = Pointer(Void).null
    def agent_set_max_neighbors(agent : Int64, count : Int64) : Void
      if @@mb_agent_set_max_neighbors.null?
        @@mb_agent_set_max_neighbors = Bridge.get_method_bind("NavigationServer2D", "agent_set_max_neighbors", 3411492887_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = count
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_max_neighbors, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_max_neighbors : Void* = Pointer(Void).null
    def agent_get_max_neighbors(agent : Int64) : Int64
      if @@mb_agent_get_max_neighbors.null?
        @@mb_agent_get_max_neighbors = Bridge.get_method_bind("NavigationServer2D", "agent_get_max_neighbors", 2198884583_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_agent_get_max_neighbors, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_time_horizon_agents : Void* = Pointer(Void).null
    def agent_set_time_horizon_agents(agent : Int64, time_horizon : Float64) : Void
      if @@mb_agent_set_time_horizon_agents.null?
        @@mb_agent_set_time_horizon_agents = Bridge.get_method_bind("NavigationServer2D", "agent_set_time_horizon_agents", 1794382983_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = time_horizon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_time_horizon_agents, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_time_horizon_agents : Void* = Pointer(Void).null
    def agent_get_time_horizon_agents(agent : Int64) : Float64
      if @@mb_agent_get_time_horizon_agents.null?
        @@mb_agent_get_time_horizon_agents = Bridge.get_method_bind("NavigationServer2D", "agent_get_time_horizon_agents", 866169185_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_agent_get_time_horizon_agents, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_time_horizon_obstacles : Void* = Pointer(Void).null
    def agent_set_time_horizon_obstacles(agent : Int64, time_horizon : Float64) : Void
      if @@mb_agent_set_time_horizon_obstacles.null?
        @@mb_agent_set_time_horizon_obstacles = Bridge.get_method_bind("NavigationServer2D", "agent_set_time_horizon_obstacles", 1794382983_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = time_horizon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_time_horizon_obstacles, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_time_horizon_obstacles : Void* = Pointer(Void).null
    def agent_get_time_horizon_obstacles(agent : Int64) : Float64
      if @@mb_agent_get_time_horizon_obstacles.null?
        @@mb_agent_get_time_horizon_obstacles = Bridge.get_method_bind("NavigationServer2D", "agent_get_time_horizon_obstacles", 866169185_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_agent_get_time_horizon_obstacles, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_radius : Void* = Pointer(Void).null
    def agent_set_radius(agent : Int64, radius : Float64) : Void
      if @@mb_agent_set_radius.null?
        @@mb_agent_set_radius = Bridge.get_method_bind("NavigationServer2D", "agent_set_radius", 1794382983_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = radius
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_radius : Void* = Pointer(Void).null
    def agent_get_radius(agent : Int64) : Float64
      if @@mb_agent_get_radius.null?
        @@mb_agent_get_radius = Bridge.get_method_bind("NavigationServer2D", "agent_get_radius", 866169185_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_agent_get_radius, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_max_speed : Void* = Pointer(Void).null
    def agent_set_max_speed(agent : Int64, max_speed : Float64) : Void
      if @@mb_agent_set_max_speed.null?
        @@mb_agent_set_max_speed = Bridge.get_method_bind("NavigationServer2D", "agent_set_max_speed", 1794382983_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = max_speed
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_max_speed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_max_speed : Void* = Pointer(Void).null
    def agent_get_max_speed(agent : Int64) : Float64
      if @@mb_agent_get_max_speed.null?
        @@mb_agent_get_max_speed = Bridge.get_method_bind("NavigationServer2D", "agent_get_max_speed", 866169185_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_agent_get_max_speed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_velocity_forced : Void* = Pointer(Void).null
    def agent_set_velocity_forced(agent : Int64, velocity : Vector2) : Void
      if @@mb_agent_set_velocity_forced.null?
        @@mb_agent_set_velocity_forced = Bridge.get_method_bind("NavigationServer2D", "agent_set_velocity_forced", 3201125042_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = velocity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_velocity_forced, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_set_velocity : Void* = Pointer(Void).null
    def agent_set_velocity(agent : Int64, velocity : Vector2) : Void
      if @@mb_agent_set_velocity.null?
        @@mb_agent_set_velocity = Bridge.get_method_bind("NavigationServer2D", "agent_set_velocity", 3201125042_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = velocity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_velocity : Void* = Pointer(Void).null
    def agent_get_velocity(agent : Int64) : Vector2
      if @@mb_agent_get_velocity.null?
        @@mb_agent_get_velocity = Bridge.get_method_bind("NavigationServer2D", "agent_get_velocity", 2440833711_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_agent_get_velocity, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_position : Void* = Pointer(Void).null
    def agent_set_position(agent : Int64, position : Vector2) : Void
      if @@mb_agent_set_position.null?
        @@mb_agent_set_position = Bridge.get_method_bind("NavigationServer2D", "agent_set_position", 3201125042_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_position : Void* = Pointer(Void).null
    def agent_get_position(agent : Int64) : Vector2
      if @@mb_agent_get_position.null?
        @@mb_agent_get_position = Bridge.get_method_bind("NavigationServer2D", "agent_get_position", 2440833711_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_agent_get_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_is_map_changed : Void* = Pointer(Void).null
    def agent_is_map_changed(agent : Int64) : Bool
      if @@mb_agent_is_map_changed.null?
        @@mb_agent_is_map_changed = Bridge.get_method_bind("NavigationServer2D", "agent_is_map_changed", 4155700596_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_agent_is_map_changed, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_agent_set_avoidance_callback : Void* = Pointer(Void).null
    def agent_set_avoidance_callback(agent : Int64, callback : Void*) : Void
      if @@mb_agent_set_avoidance_callback.null?
        @@mb_agent_set_avoidance_callback = Bridge.get_method_bind("NavigationServer2D", "agent_set_avoidance_callback", 3379118538_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_avoidance_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_has_avoidance_callback : Void* = Pointer(Void).null
    def agent_has_avoidance_callback(agent : Int64) : Bool
      if @@mb_agent_has_avoidance_callback.null?
        @@mb_agent_has_avoidance_callback = Bridge.get_method_bind("NavigationServer2D", "agent_has_avoidance_callback", 4155700596_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_agent_has_avoidance_callback, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_agent_set_avoidance_layers : Void* = Pointer(Void).null
    def agent_set_avoidance_layers(agent : Int64, layers : Int64) : Void
      if @@mb_agent_set_avoidance_layers.null?
        @@mb_agent_set_avoidance_layers = Bridge.get_method_bind("NavigationServer2D", "agent_set_avoidance_layers", 3411492887_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layers
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_avoidance_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_avoidance_layers : Void* = Pointer(Void).null
    def agent_get_avoidance_layers(agent : Int64) : Int64
      if @@mb_agent_get_avoidance_layers.null?
        @@mb_agent_get_avoidance_layers = Bridge.get_method_bind("NavigationServer2D", "agent_get_avoidance_layers", 2198884583_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_agent_get_avoidance_layers, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_avoidance_mask : Void* = Pointer(Void).null
    def agent_set_avoidance_mask(agent : Int64, mask : Int64) : Void
      if @@mb_agent_set_avoidance_mask.null?
        @@mb_agent_set_avoidance_mask = Bridge.get_method_bind("NavigationServer2D", "agent_set_avoidance_mask", 3411492887_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_avoidance_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_avoidance_mask : Void* = Pointer(Void).null
    def agent_get_avoidance_mask(agent : Int64) : Int64
      if @@mb_agent_get_avoidance_mask.null?
        @@mb_agent_get_avoidance_mask = Bridge.get_method_bind("NavigationServer2D", "agent_get_avoidance_mask", 2198884583_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_agent_get_avoidance_mask, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_agent_set_avoidance_priority : Void* = Pointer(Void).null
    def agent_set_avoidance_priority(agent : Int64, priority : Float64) : Void
      if @@mb_agent_set_avoidance_priority.null?
        @@mb_agent_set_avoidance_priority = Bridge.get_method_bind("NavigationServer2D", "agent_set_avoidance_priority", 1794382983_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = priority
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_agent_set_avoidance_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_agent_get_avoidance_priority : Void* = Pointer(Void).null
    def agent_get_avoidance_priority(agent : Int64) : Float64
      if @@mb_agent_get_avoidance_priority.null?
        @@mb_agent_get_avoidance_priority = Bridge.get_method_bind("NavigationServer2D", "agent_get_avoidance_priority", 866169185_i64)
      end
      val_0 = agent
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_agent_get_avoidance_priority, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_obstacle_create : Void* = Pointer(Void).null
    def obstacle_create() : Int64
      if @@mb_obstacle_create.null?
        @@mb_obstacle_create = Bridge.get_method_bind("NavigationServer2D", "obstacle_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_obstacle_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_obstacle_set_avoidance_enabled : Void* = Pointer(Void).null
    def obstacle_set_avoidance_enabled(obstacle : Int64, enabled : Bool) : Void
      if @@mb_obstacle_set_avoidance_enabled.null?
        @@mb_obstacle_set_avoidance_enabled = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_avoidance_enabled", 1265174801_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enabled
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_avoidance_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_avoidance_enabled : Void* = Pointer(Void).null
    def obstacle_get_avoidance_enabled(obstacle : Int64) : Bool
      if @@mb_obstacle_get_avoidance_enabled.null?
        @@mb_obstacle_get_avoidance_enabled = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_avoidance_enabled", 4155700596_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_obstacle_get_avoidance_enabled, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_obstacle_set_map : Void* = Pointer(Void).null
    def obstacle_set_map(obstacle : Int64, map : Int64) : Void
      if @@mb_obstacle_set_map.null?
        @@mb_obstacle_set_map = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_map", 395945892_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = map
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_map : Void* = Pointer(Void).null
    def obstacle_get_map(obstacle : Int64) : Int64
      if @@mb_obstacle_get_map.null?
        @@mb_obstacle_get_map = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_map", 3814569979_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_obstacle_get_map, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_obstacle_set_paused : Void* = Pointer(Void).null
    def obstacle_set_paused(obstacle : Int64, paused : Bool) : Void
      if @@mb_obstacle_set_paused.null?
        @@mb_obstacle_set_paused = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_paused", 1265174801_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = paused
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_paused, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_paused : Void* = Pointer(Void).null
    def obstacle_get_paused(obstacle : Int64) : Bool
      if @@mb_obstacle_get_paused.null?
        @@mb_obstacle_get_paused = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_paused", 4155700596_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_obstacle_get_paused, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_obstacle_set_radius : Void* = Pointer(Void).null
    def obstacle_set_radius(obstacle : Int64, radius : Float64) : Void
      if @@mb_obstacle_set_radius.null?
        @@mb_obstacle_set_radius = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_radius", 1794382983_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = radius
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_radius, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_radius : Void* = Pointer(Void).null
    def obstacle_get_radius(obstacle : Int64) : Float64
      if @@mb_obstacle_get_radius.null?
        @@mb_obstacle_get_radius = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_radius", 866169185_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_obstacle_get_radius, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_obstacle_set_velocity : Void* = Pointer(Void).null
    def obstacle_set_velocity(obstacle : Int64, velocity : Vector2) : Void
      if @@mb_obstacle_set_velocity.null?
        @@mb_obstacle_set_velocity = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_velocity", 3201125042_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = velocity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_velocity : Void* = Pointer(Void).null
    def obstacle_get_velocity(obstacle : Int64) : Vector2
      if @@mb_obstacle_get_velocity.null?
        @@mb_obstacle_get_velocity = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_velocity", 2440833711_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_obstacle_get_velocity, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_obstacle_set_position : Void* = Pointer(Void).null
    def obstacle_set_position(obstacle : Int64, position : Vector2) : Void
      if @@mb_obstacle_set_position.null?
        @@mb_obstacle_set_position = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_position", 3201125042_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_position : Void* = Pointer(Void).null
    def obstacle_get_position(obstacle : Int64) : Vector2
      if @@mb_obstacle_get_position.null?
        @@mb_obstacle_get_position = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_position", 2440833711_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_obstacle_get_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_obstacle_set_vertices : Void* = Pointer(Void).null
    def obstacle_set_vertices(obstacle : Int64, vertices : Void*) : Void
      if @@mb_obstacle_set_vertices.null?
        @@mb_obstacle_set_vertices = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_vertices", 29476483_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = vertices
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_vertices, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_vertices : Void* = Pointer(Void).null
    def obstacle_get_vertices(obstacle : Int64) : Void*
      if @@mb_obstacle_get_vertices.null?
        @@mb_obstacle_get_vertices = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_vertices", 2222557395_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_obstacle_get_vertices, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_obstacle_set_avoidance_layers : Void* = Pointer(Void).null
    def obstacle_set_avoidance_layers(obstacle : Int64, layers : Int64) : Void
      if @@mb_obstacle_set_avoidance_layers.null?
        @@mb_obstacle_set_avoidance_layers = Bridge.get_method_bind("NavigationServer2D", "obstacle_set_avoidance_layers", 3411492887_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layers
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_obstacle_set_avoidance_layers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_obstacle_get_avoidance_layers : Void* = Pointer(Void).null
    def obstacle_get_avoidance_layers(obstacle : Int64) : Int64
      if @@mb_obstacle_get_avoidance_layers.null?
        @@mb_obstacle_get_avoidance_layers = Bridge.get_method_bind("NavigationServer2D", "obstacle_get_avoidance_layers", 2198884583_i64)
      end
      val_0 = obstacle
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_obstacle_get_avoidance_layers, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_parse_source_geometry_data : Void* = Pointer(Void).null
    def parse_source_geometry_data(navigation_polygon : NavigationPolygon, source_geometry_data : NavigationMeshSourceGeometryData2D, root_node : Node, callback : Void*) : Void
      if @@mb_parse_source_geometry_data.null?
        @@mb_parse_source_geometry_data = Bridge.get_method_bind("NavigationServer2D", "parse_source_geometry_data", 1766905497_i64)
      end
      val_0 = navigation_polygon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = source_geometry_data
      arg_1 = pointerof(val_1).as(Void*)
      arg_ptr_2 = root_node ? root_node.pointer : Pointer(Void).null
      arg_2 = pointerof(arg_ptr_2).as(Void*)
      val_3 = callback
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_parse_source_geometry_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_bake_from_source_geometry_data : Void* = Pointer(Void).null
    def bake_from_source_geometry_data(navigation_polygon : NavigationPolygon, source_geometry_data : NavigationMeshSourceGeometryData2D, callback : Void*) : Void
      if @@mb_bake_from_source_geometry_data.null?
        @@mb_bake_from_source_geometry_data = Bridge.get_method_bind("NavigationServer2D", "bake_from_source_geometry_data", 2179660022_i64)
      end
      val_0 = navigation_polygon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = source_geometry_data
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_bake_from_source_geometry_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_bake_from_source_geometry_data_async : Void* = Pointer(Void).null
    def bake_from_source_geometry_data_async(navigation_polygon : NavigationPolygon, source_geometry_data : NavigationMeshSourceGeometryData2D, callback : Void*) : Void
      if @@mb_bake_from_source_geometry_data_async.null?
        @@mb_bake_from_source_geometry_data_async = Bridge.get_method_bind("NavigationServer2D", "bake_from_source_geometry_data_async", 2179660022_i64)
      end
      val_0 = navigation_polygon
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = source_geometry_data
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = callback
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_bake_from_source_geometry_data_async, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_baking_navigation_polygon : Void* = Pointer(Void).null
    def is_baking_navigation_polygon(navigation_polygon : NavigationPolygon) : Bool
      if @@mb_is_baking_navigation_polygon.null?
        @@mb_is_baking_navigation_polygon = Bridge.get_method_bind("NavigationServer2D", "is_baking_navigation_polygon", 3729405808_i64)
      end
      val_0 = navigation_polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_baking_navigation_polygon, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_source_geometry_parser_create : Void* = Pointer(Void).null
    def source_geometry_parser_create() : Int64
      if @@mb_source_geometry_parser_create.null?
        @@mb_source_geometry_parser_create = Bridge.get_method_bind("NavigationServer2D", "source_geometry_parser_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_source_geometry_parser_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_source_geometry_parser_set_callback : Void* = Pointer(Void).null
    def source_geometry_parser_set_callback(parser : Int64, callback : Void*) : Void
      if @@mb_source_geometry_parser_set_callback.null?
        @@mb_source_geometry_parser_set_callback = Bridge.get_method_bind("NavigationServer2D", "source_geometry_parser_set_callback", 3379118538_i64)
      end
      val_0 = parser
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_source_geometry_parser_set_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_simplify_path : Void* = Pointer(Void).null
    def simplify_path(path : Void*, epsilon : Float64) : Void*
      if @@mb_simplify_path.null?
        @@mb_simplify_path = Bridge.get_method_bind("NavigationServer2D", "simplify_path", 2457191505_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = epsilon
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_simplify_path, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_free_rid : Void* = Pointer(Void).null
    def free_rid(rid : Int64) : Void
      if @@mb_free_rid.null?
        @@mb_free_rid = Bridge.get_method_bind("NavigationServer2D", "free_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_free_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_active : Void* = Pointer(Void).null
    def set_active(active : Bool) : Void
      if @@mb_set_active.null?
        @@mb_set_active = Bridge.get_method_bind("NavigationServer2D", "set_active", 2586408642_i64)
      end
      val_0 = active
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_debug_enabled : Void* = Pointer(Void).null
    def set_debug_enabled(enabled : Bool) : Void
      if @@mb_set_debug_enabled.null?
        @@mb_set_debug_enabled = Bridge.get_method_bind("NavigationServer2D", "set_debug_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_debug_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_debug_enabled : Void* = Pointer(Void).null
    def get_debug_enabled() : Bool
      if @@mb_get_debug_enabled.null?
        @@mb_get_debug_enabled = Bridge.get_method_bind("NavigationServer2D", "get_debug_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_debug_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_process_info : Void* = Pointer(Void).null
    def get_process_info(process_info : Int64) : Int64
      if @@mb_get_process_info.null?
        @@mb_get_process_info = Bridge.get_method_bind("NavigationServer2D", "get_process_info", 1640219858_i64)
      end
      val_0 = process_info
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_info, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  class NavigationServer2DManager < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_register_server : Void* = Pointer(Void).null
    def register_server(name : String, create_callback : Void*) : Void
      if @@mb_register_server.null?
        @@mb_register_server = Bridge.get_method_bind("NavigationServer2DManager", "register_server", 2137474292_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = create_callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_register_server, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_default_server : Void* = Pointer(Void).null
    def set_default_server(name : String, priority : Int64) : Void
      if @@mb_set_default_server.null?
        @@mb_set_default_server = Bridge.get_method_bind("NavigationServer2DManager", "set_default_server", 2956805083_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = priority
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_default_server, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class NoiseTexture2D < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_width : Void* = Pointer(Void).null
    def set_width(width : Int64) : Void
      if @@mb_set_width.null?
        @@mb_set_width = Bridge.get_method_bind("NoiseTexture2D", "set_width", 1286410249_i64)
      end
      val_0 = width
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_width, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_height : Void* = Pointer(Void).null
    def set_height(height : Int64) : Void
      if @@mb_set_height.null?
        @@mb_set_height = Bridge.get_method_bind("NoiseTexture2D", "set_height", 1286410249_i64)
      end
      val_0 = height
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_height, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_generate_mipmaps : Void* = Pointer(Void).null
    def set_generate_mipmaps(invert : Bool) : Void
      if @@mb_set_generate_mipmaps.null?
        @@mb_set_generate_mipmaps = Bridge.get_method_bind("NoiseTexture2D", "set_generate_mipmaps", 2586408642_i64)
      end
      val_0 = invert
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_generate_mipmaps, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_generating_mipmaps : Void* = Pointer(Void).null
    def is_generating_mipmaps() : Bool
      if @@mb_is_generating_mipmaps.null?
        @@mb_is_generating_mipmaps = Bridge.get_method_bind("NoiseTexture2D", "is_generating_mipmaps", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_generating_mipmaps, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_noise : Void* = Pointer(Void).null
    def set_noise(noise : Noise) : Void
      if @@mb_set_noise.null?
        @@mb_set_noise = Bridge.get_method_bind("NoiseTexture2D", "set_noise", 4135492439_i64)
      end
      val_0 = noise
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_noise, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_noise : Void* = Pointer(Void).null
    def get_noise() : Noise
      if @@mb_get_noise.null?
        @@mb_get_noise = Bridge.get_method_bind("NoiseTexture2D", "get_noise", 185851837_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_noise, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Noise.new(ret_ptr)
    end
    @@mb_set_color_ramp : Void* = Pointer(Void).null
    def set_color_ramp(gradient : Gradient) : Void
      if @@mb_set_color_ramp.null?
        @@mb_set_color_ramp = Bridge.get_method_bind("NoiseTexture2D", "set_color_ramp", 2756054477_i64)
      end
      val_0 = gradient
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color_ramp, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color_ramp : Void* = Pointer(Void).null
    def get_color_ramp() : Gradient
      if @@mb_get_color_ramp.null?
        @@mb_get_color_ramp = Bridge.get_method_bind("NoiseTexture2D", "get_color_ramp", 132272999_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_color_ramp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Gradient.new(ret_ptr)
    end
    @@mb_set_seamless : Void* = Pointer(Void).null
    def set_seamless(seamless : Bool) : Void
      if @@mb_set_seamless.null?
        @@mb_set_seamless = Bridge.get_method_bind("NoiseTexture2D", "set_seamless", 2586408642_i64)
      end
      val_0 = seamless
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_seamless, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_seamless : Void* = Pointer(Void).null
    def get_seamless() : Bool
      if @@mb_get_seamless.null?
        @@mb_get_seamless = Bridge.get_method_bind("NoiseTexture2D", "get_seamless", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_seamless, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_invert : Void* = Pointer(Void).null
    def set_invert(invert : Bool) : Void
      if @@mb_set_invert.null?
        @@mb_set_invert = Bridge.get_method_bind("NoiseTexture2D", "set_invert", 2586408642_i64)
      end
      val_0 = invert
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_invert, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_invert : Void* = Pointer(Void).null
    def get_invert() : Bool
      if @@mb_get_invert.null?
        @@mb_get_invert = Bridge.get_method_bind("NoiseTexture2D", "get_invert", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_invert, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_in_3d_space : Void* = Pointer(Void).null
    def set_in_3d_space(enable : Bool) : Void
      if @@mb_set_in_3d_space.null?
        @@mb_set_in_3d_space = Bridge.get_method_bind("NoiseTexture2D", "set_in_3d_space", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_in_3d_space, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_in_3d_space : Void* = Pointer(Void).null
    def is_in_3d_space() : Bool
      if @@mb_is_in_3d_space.null?
        @@mb_is_in_3d_space = Bridge.get_method_bind("NoiseTexture2D", "is_in_3d_space", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_in_3d_space, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_as_normal_map : Void* = Pointer(Void).null
    def set_as_normal_map(as_normal_map : Bool) : Void
      if @@mb_set_as_normal_map.null?
        @@mb_set_as_normal_map = Bridge.get_method_bind("NoiseTexture2D", "set_as_normal_map", 2586408642_i64)
      end
      val_0 = as_normal_map
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_as_normal_map, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_normal_map : Void* = Pointer(Void).null
    def is_normal_map() : Bool
      if @@mb_is_normal_map.null?
        @@mb_is_normal_map = Bridge.get_method_bind("NoiseTexture2D", "is_normal_map", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_normal_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_normalize : Void* = Pointer(Void).null
    def set_normalize(normalize : Bool) : Void
      if @@mb_set_normalize.null?
        @@mb_set_normalize = Bridge.get_method_bind("NoiseTexture2D", "set_normalize", 2586408642_i64)
      end
      val_0 = normalize
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_normalize, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_normalized : Void* = Pointer(Void).null
    def is_normalized() : Bool
      if @@mb_is_normalized.null?
        @@mb_is_normalized = Bridge.get_method_bind("NoiseTexture2D", "is_normalized", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_normalized, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_seamless_blend_skirt : Void* = Pointer(Void).null
    def set_seamless_blend_skirt(seamless_blend_skirt : Float64) : Void
      if @@mb_set_seamless_blend_skirt.null?
        @@mb_set_seamless_blend_skirt = Bridge.get_method_bind("NoiseTexture2D", "set_seamless_blend_skirt", 373806689_i64)
      end
      val_0 = seamless_blend_skirt
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_seamless_blend_skirt, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_seamless_blend_skirt : Void* = Pointer(Void).null
    def get_seamless_blend_skirt() : Float64
      if @@mb_get_seamless_blend_skirt.null?
        @@mb_get_seamless_blend_skirt = Bridge.get_method_bind("NoiseTexture2D", "get_seamless_blend_skirt", 191475506_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_seamless_blend_skirt, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_bump_strength : Void* = Pointer(Void).null
    def set_bump_strength(bump_strength : Float64) : Void
      if @@mb_set_bump_strength.null?
        @@mb_set_bump_strength = Bridge.get_method_bind("NoiseTexture2D", "set_bump_strength", 373806689_i64)
      end
      val_0 = bump_strength
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bump_strength, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bump_strength : Void* = Pointer(Void).null
    def get_bump_strength() : Float64
      if @@mb_get_bump_strength.null?
        @@mb_get_bump_strength = Bridge.get_method_bind("NoiseTexture2D", "get_bump_strength", 191475506_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_bump_strength, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class OccluderPolygon2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum CullMode : Int64
      CullDisabled = 0_i64
      CullClockwise = 1_i64
      CullCounterClockwise = 2_i64
    end
    @@mb_set_closed : Void* = Pointer(Void).null
    def set_closed(closed : Bool) : Void
      if @@mb_set_closed.null?
        @@mb_set_closed = Bridge.get_method_bind("OccluderPolygon2D", "set_closed", 2586408642_i64)
      end
      val_0 = closed
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_closed, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_closed : Void* = Pointer(Void).null
    def is_closed() : Bool
      if @@mb_is_closed.null?
        @@mb_is_closed = Bridge.get_method_bind("OccluderPolygon2D", "is_closed", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_closed, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_cull_mode : Void* = Pointer(Void).null
    def set_cull_mode(cull_mode : Int64) : Void
      if @@mb_set_cull_mode.null?
        @@mb_set_cull_mode = Bridge.get_method_bind("OccluderPolygon2D", "set_cull_mode", 3500863002_i64)
      end
      val_0 = cull_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cull_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_cull_mode : Void* = Pointer(Void).null
    def get_cull_mode() : Int64
      if @@mb_get_cull_mode.null?
        @@mb_get_cull_mode = Bridge.get_method_bind("OccluderPolygon2D", "get_cull_mode", 33931036_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_cull_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_polygon : Void* = Pointer(Void).null
    def set_polygon(polygon : Void*) : Void
      if @@mb_set_polygon.null?
        @@mb_set_polygon = Bridge.get_method_bind("OccluderPolygon2D", "set_polygon", 1509147220_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_polygon : Void* = Pointer(Void).null
    def get_polygon() : Void*
      if @@mb_get_polygon.null?
        @@mb_get_polygon = Bridge.get_method_bind("OccluderPolygon2D", "get_polygon", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_polygon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class OpenXRSpatialComponentBounded2DList < Godot::OpenXRSpatialComponentData
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_center_pose : Void* = Pointer(Void).null
    def get_center_pose(index : Int64) : Transform3D
      if @@mb_get_center_pose.null?
        @@mb_get_center_pose = Bridge.get_method_bind("OpenXRSpatialComponentBounded2DList", "get_center_pose", 1965739696_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_center_pose, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_size : Void* = Pointer(Void).null
    def get_size(index : Int64) : Vector2
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("OpenXRSpatialComponentBounded2DList", "get_size", 2299179447_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_size, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  class OpenXRSpatialComponentMesh2DList < Godot::OpenXRSpatialComponentData
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_transform : Void* = Pointer(Void).null
    def get_transform(index : Int64) : Transform3D
      if @@mb_get_transform.null?
        @@mb_get_transform = Bridge.get_method_bind("OpenXRSpatialComponentMesh2DList", "get_transform", 1965739696_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_vertices : Void* = Pointer(Void).null
    def get_vertices(snapshot : Int64, index : Int64) : Void*
      if @@mb_get_vertices.null?
        @@mb_get_vertices = Bridge.get_method_bind("OpenXRSpatialComponentMesh2DList", "get_vertices", 110850971_i64)
      end
      val_0 = snapshot
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_vertices, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_get_indices : Void* = Pointer(Void).null
    def get_indices(snapshot : Int64, index : Int64) : Void*
      if @@mb_get_indices.null?
        @@mb_get_indices = Bridge.get_method_bind("OpenXRSpatialComponentMesh2DList", "get_indices", 3393655756_i64)
      end
      val_0 = snapshot
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_indices, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class OpenXRSpatialComponentPolygon2DList < Godot::OpenXRSpatialComponentData
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_transform : Void* = Pointer(Void).null
    def get_transform(index : Int64) : Transform3D
      if @@mb_get_transform.null?
        @@mb_get_transform = Bridge.get_method_bind("OpenXRSpatialComponentPolygon2DList", "get_transform", 1965739696_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Transform3D.new
      Bridge.ptrcall(@@mb_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_vertices : Void* = Pointer(Void).null
    def get_vertices(snapshot : Int64, index : Int64) : Void*
      if @@mb_get_vertices.null?
        @@mb_get_vertices = Bridge.get_method_bind("OpenXRSpatialComponentPolygon2DList", "get_vertices", 110850971_i64)
      end
      val_0 = snapshot
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = index
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_vertices, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class Parallax2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_scroll_scale : Void* = Pointer(Void).null
    def set_scroll_scale(scale : Vector2) : Void
      if @@mb_set_scroll_scale.null?
        @@mb_set_scroll_scale = Bridge.get_method_bind("Parallax2D", "set_scroll_scale", 743155724_i64)
      end
      val_0 = scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scroll_scale : Void* = Pointer(Void).null
    def get_scroll_scale() : Vector2
      if @@mb_get_scroll_scale.null?
        @@mb_get_scroll_scale = Bridge.get_method_bind("Parallax2D", "get_scroll_scale", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_scroll_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_repeat_size : Void* = Pointer(Void).null
    def set_repeat_size(repeat_size : Vector2) : Void
      if @@mb_set_repeat_size.null?
        @@mb_set_repeat_size = Bridge.get_method_bind("Parallax2D", "set_repeat_size", 743155724_i64)
      end
      val_0 = repeat_size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_repeat_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_repeat_size : Void* = Pointer(Void).null
    def get_repeat_size() : Vector2
      if @@mb_get_repeat_size.null?
        @@mb_get_repeat_size = Bridge.get_method_bind("Parallax2D", "get_repeat_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_repeat_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_repeat_times : Void* = Pointer(Void).null
    def set_repeat_times(repeat_times : Int64) : Void
      if @@mb_set_repeat_times.null?
        @@mb_set_repeat_times = Bridge.get_method_bind("Parallax2D", "set_repeat_times", 1286410249_i64)
      end
      val_0 = repeat_times
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_repeat_times, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_repeat_times : Void* = Pointer(Void).null
    def get_repeat_times() : Int64
      if @@mb_get_repeat_times.null?
        @@mb_get_repeat_times = Bridge.get_method_bind("Parallax2D", "get_repeat_times", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_repeat_times, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_autoscroll : Void* = Pointer(Void).null
    def set_autoscroll(autoscroll : Vector2) : Void
      if @@mb_set_autoscroll.null?
        @@mb_set_autoscroll = Bridge.get_method_bind("Parallax2D", "set_autoscroll", 743155724_i64)
      end
      val_0 = autoscroll
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_autoscroll, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_autoscroll : Void* = Pointer(Void).null
    def get_autoscroll() : Vector2
      if @@mb_get_autoscroll.null?
        @@mb_get_autoscroll = Bridge.get_method_bind("Parallax2D", "get_autoscroll", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_autoscroll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_scroll_offset : Void* = Pointer(Void).null
    def set_scroll_offset(offset : Vector2) : Void
      if @@mb_set_scroll_offset.null?
        @@mb_set_scroll_offset = Bridge.get_method_bind("Parallax2D", "set_scroll_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_scroll_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_scroll_offset : Void* = Pointer(Void).null
    def get_scroll_offset() : Vector2
      if @@mb_get_scroll_offset.null?
        @@mb_get_scroll_offset = Bridge.get_method_bind("Parallax2D", "get_scroll_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_scroll_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_screen_offset : Void* = Pointer(Void).null
    def set_screen_offset(offset : Vector2) : Void
      if @@mb_set_screen_offset.null?
        @@mb_set_screen_offset = Bridge.get_method_bind("Parallax2D", "set_screen_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_screen_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_screen_offset : Void* = Pointer(Void).null
    def get_screen_offset() : Vector2
      if @@mb_get_screen_offset.null?
        @@mb_get_screen_offset = Bridge.get_method_bind("Parallax2D", "get_screen_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_screen_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_limit_begin : Void* = Pointer(Void).null
    def set_limit_begin(offset : Vector2) : Void
      if @@mb_set_limit_begin.null?
        @@mb_set_limit_begin = Bridge.get_method_bind("Parallax2D", "set_limit_begin", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_limit_begin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_limit_begin : Void* = Pointer(Void).null
    def get_limit_begin() : Vector2
      if @@mb_get_limit_begin.null?
        @@mb_get_limit_begin = Bridge.get_method_bind("Parallax2D", "get_limit_begin", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_limit_begin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_limit_end : Void* = Pointer(Void).null
    def set_limit_end(offset : Vector2) : Void
      if @@mb_set_limit_end.null?
        @@mb_set_limit_end = Bridge.get_method_bind("Parallax2D", "set_limit_end", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_limit_end, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_limit_end : Void* = Pointer(Void).null
    def get_limit_end() : Vector2
      if @@mb_get_limit_end.null?
        @@mb_get_limit_end = Bridge.get_method_bind("Parallax2D", "get_limit_end", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_limit_end, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_follow_viewport : Void* = Pointer(Void).null
    def set_follow_viewport(follow : Bool) : Void
      if @@mb_set_follow_viewport.null?
        @@mb_set_follow_viewport = Bridge.get_method_bind("Parallax2D", "set_follow_viewport", 2586408642_i64)
      end
      val_0 = follow
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_follow_viewport, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_follow_viewport : Void* = Pointer(Void).null
    def get_follow_viewport() : Bool
      if @@mb_get_follow_viewport.null?
        @@mb_get_follow_viewport = Bridge.get_method_bind("Parallax2D", "get_follow_viewport", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_follow_viewport, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_ignore_camera_scroll : Void* = Pointer(Void).null
    def set_ignore_camera_scroll(ignore : Bool) : Void
      if @@mb_set_ignore_camera_scroll.null?
        @@mb_set_ignore_camera_scroll = Bridge.get_method_bind("Parallax2D", "set_ignore_camera_scroll", 2586408642_i64)
      end
      val_0 = ignore
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_ignore_camera_scroll, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_ignore_camera_scroll : Void* = Pointer(Void).null
    def is_ignore_camera_scroll() : Bool
      if @@mb_is_ignore_camera_scroll.null?
        @@mb_is_ignore_camera_scroll = Bridge.get_method_bind("Parallax2D", "is_ignore_camera_scroll", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_ignore_camera_scroll, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class Path2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_curve : Void* = Pointer(Void).null
    def set_curve(curve : Curve2D) : Void
      if @@mb_set_curve.null?
        @@mb_set_curve = Bridge.get_method_bind("Path2D", "set_curve", 659985499_i64)
      end
      val_0 = curve
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_curve, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_curve : Void* = Pointer(Void).null
    def get_curve() : Curve2D
      if @@mb_get_curve.null?
        @@mb_get_curve = Bridge.get_method_bind("Path2D", "get_curve", 660369445_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_curve, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Curve2D.new(ret_ptr)
    end
  end
  class PathFollow2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_progress : Void* = Pointer(Void).null
    def set_progress(progress : Float64) : Void
      if @@mb_set_progress.null?
        @@mb_set_progress = Bridge.get_method_bind("PathFollow2D", "set_progress", 373806689_i64)
      end
      val_0 = progress
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_progress, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_progress : Void* = Pointer(Void).null
    def get_progress() : Float64
      if @@mb_get_progress.null?
        @@mb_get_progress = Bridge.get_method_bind("PathFollow2D", "get_progress", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_progress, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_h_offset : Void* = Pointer(Void).null
    def set_h_offset(h_offset : Float64) : Void
      if @@mb_set_h_offset.null?
        @@mb_set_h_offset = Bridge.get_method_bind("PathFollow2D", "set_h_offset", 373806689_i64)
      end
      val_0 = h_offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_h_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_h_offset : Void* = Pointer(Void).null
    def get_h_offset() : Float64
      if @@mb_get_h_offset.null?
        @@mb_get_h_offset = Bridge.get_method_bind("PathFollow2D", "get_h_offset", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_h_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_v_offset : Void* = Pointer(Void).null
    def set_v_offset(v_offset : Float64) : Void
      if @@mb_set_v_offset.null?
        @@mb_set_v_offset = Bridge.get_method_bind("PathFollow2D", "set_v_offset", 373806689_i64)
      end
      val_0 = v_offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_v_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_v_offset : Void* = Pointer(Void).null
    def get_v_offset() : Float64
      if @@mb_get_v_offset.null?
        @@mb_get_v_offset = Bridge.get_method_bind("PathFollow2D", "get_v_offset", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_v_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_progress_ratio : Void* = Pointer(Void).null
    def set_progress_ratio(ratio : Float64) : Void
      if @@mb_set_progress_ratio.null?
        @@mb_set_progress_ratio = Bridge.get_method_bind("PathFollow2D", "set_progress_ratio", 373806689_i64)
      end
      val_0 = ratio
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_progress_ratio, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_progress_ratio : Void* = Pointer(Void).null
    def get_progress_ratio() : Float64
      if @@mb_get_progress_ratio.null?
        @@mb_get_progress_ratio = Bridge.get_method_bind("PathFollow2D", "get_progress_ratio", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_progress_ratio, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_rotates : Void* = Pointer(Void).null
    def set_rotates(enabled : Bool) : Void
      if @@mb_set_rotates.null?
        @@mb_set_rotates = Bridge.get_method_bind("PathFollow2D", "set_rotates", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rotates, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_rotating : Void* = Pointer(Void).null
    def is_rotating() : Bool
      if @@mb_is_rotating.null?
        @@mb_is_rotating = Bridge.get_method_bind("PathFollow2D", "is_rotating", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_rotating, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_cubic_interpolation : Void* = Pointer(Void).null
    def set_cubic_interpolation(enabled : Bool) : Void
      if @@mb_set_cubic_interpolation.null?
        @@mb_set_cubic_interpolation = Bridge.get_method_bind("PathFollow2D", "set_cubic_interpolation", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_cubic_interpolation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_cubic_interpolation : Void* = Pointer(Void).null
    def get_cubic_interpolation() : Bool
      if @@mb_get_cubic_interpolation.null?
        @@mb_get_cubic_interpolation = Bridge.get_method_bind("PathFollow2D", "get_cubic_interpolation", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_cubic_interpolation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_loop : Void* = Pointer(Void).null
    def set_loop(loop : Bool) : Void
      if @@mb_set_loop.null?
        @@mb_set_loop = Bridge.get_method_bind("PathFollow2D", "set_loop", 2586408642_i64)
      end
      val_0 = loop
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_loop, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_has_loop : Void* = Pointer(Void).null
    def has_loop() : Bool
      if @@mb_has_loop.null?
        @@mb_has_loop = Bridge.get_method_bind("PathFollow2D", "has_loop", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_has_loop, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class RigidBody2D < Godot::PhysicsBody2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum FreezeMode : Int64
      FreezeModeStatic = 0_i64
      FreezeModeKinematic = 1_i64
    end
    enum CenterOfMassMode : Int64
      CenterOfMassModeAuto = 0_i64
      CenterOfMassModeCustom = 1_i64
    end
    enum DampMode : Int64
      DampModeCombine = 0_i64
      DampModeReplace = 1_i64
    end
    enum CCDMode : Int64
      CcdModeDisabled = 0_i64
      CcdModeCastRay = 1_i64
      CcdModeCastShape = 2_i64
    end
    @@mb_set_mass : Void* = Pointer(Void).null
    def set_mass(mass : Float64) : Void
      if @@mb_set_mass.null?
        @@mb_set_mass = Bridge.get_method_bind("RigidBody2D", "set_mass", 373806689_i64)
      end
      val_0 = mass
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mass, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mass : Void* = Pointer(Void).null
    def get_mass() : Float64
      if @@mb_get_mass.null?
        @@mb_get_mass = Bridge.get_method_bind("RigidBody2D", "get_mass", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_mass, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_inertia : Void* = Pointer(Void).null
    def get_inertia() : Float64
      if @@mb_get_inertia.null?
        @@mb_get_inertia = Bridge.get_method_bind("RigidBody2D", "get_inertia", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_inertia, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_inertia : Void* = Pointer(Void).null
    def set_inertia(inertia : Float64) : Void
      if @@mb_set_inertia.null?
        @@mb_set_inertia = Bridge.get_method_bind("RigidBody2D", "set_inertia", 373806689_i64)
      end
      val_0 = inertia
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_inertia, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_center_of_mass_mode : Void* = Pointer(Void).null
    def set_center_of_mass_mode(mode : Int64) : Void
      if @@mb_set_center_of_mass_mode.null?
        @@mb_set_center_of_mass_mode = Bridge.get_method_bind("RigidBody2D", "set_center_of_mass_mode", 1757235706_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_center_of_mass_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_center_of_mass_mode : Void* = Pointer(Void).null
    def get_center_of_mass_mode() : Int64
      if @@mb_get_center_of_mass_mode.null?
        @@mb_get_center_of_mass_mode = Bridge.get_method_bind("RigidBody2D", "get_center_of_mass_mode", 3277132817_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_center_of_mass_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_center_of_mass : Void* = Pointer(Void).null
    def set_center_of_mass(center_of_mass : Vector2) : Void
      if @@mb_set_center_of_mass.null?
        @@mb_set_center_of_mass = Bridge.get_method_bind("RigidBody2D", "set_center_of_mass", 743155724_i64)
      end
      val_0 = center_of_mass
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_center_of_mass, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_center_of_mass : Void* = Pointer(Void).null
    def get_center_of_mass() : Vector2
      if @@mb_get_center_of_mass.null?
        @@mb_get_center_of_mass = Bridge.get_method_bind("RigidBody2D", "get_center_of_mass", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_center_of_mass, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_physics_material_override : Void* = Pointer(Void).null
    def set_physics_material_override(physics_material_override : PhysicsMaterial) : Void
      if @@mb_set_physics_material_override.null?
        @@mb_set_physics_material_override = Bridge.get_method_bind("RigidBody2D", "set_physics_material_override", 1784508650_i64)
      end
      val_0 = physics_material_override
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physics_material_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_physics_material_override : Void* = Pointer(Void).null
    def get_physics_material_override() : PhysicsMaterial
      if @@mb_get_physics_material_override.null?
        @@mb_get_physics_material_override = Bridge.get_method_bind("RigidBody2D", "get_physics_material_override", 2521850424_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_physics_material_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PhysicsMaterial.new(ret_ptr)
    end
    @@mb_set_gravity_scale : Void* = Pointer(Void).null
    def set_gravity_scale(gravity_scale : Float64) : Void
      if @@mb_set_gravity_scale.null?
        @@mb_set_gravity_scale = Bridge.get_method_bind("RigidBody2D", "set_gravity_scale", 373806689_i64)
      end
      val_0 = gravity_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gravity_scale : Void* = Pointer(Void).null
    def get_gravity_scale() : Float64
      if @@mb_get_gravity_scale.null?
        @@mb_get_gravity_scale = Bridge.get_method_bind("RigidBody2D", "get_gravity_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_gravity_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_linear_damp_mode : Void* = Pointer(Void).null
    def set_linear_damp_mode(linear_damp_mode : Int64) : Void
      if @@mb_set_linear_damp_mode.null?
        @@mb_set_linear_damp_mode = Bridge.get_method_bind("RigidBody2D", "set_linear_damp_mode", 3406533708_i64)
      end
      val_0 = linear_damp_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_linear_damp_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_linear_damp_mode : Void* = Pointer(Void).null
    def get_linear_damp_mode() : Int64
      if @@mb_get_linear_damp_mode.null?
        @@mb_get_linear_damp_mode = Bridge.get_method_bind("RigidBody2D", "get_linear_damp_mode", 2970511462_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_linear_damp_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_damp_mode : Void* = Pointer(Void).null
    def set_angular_damp_mode(angular_damp_mode : Int64) : Void
      if @@mb_set_angular_damp_mode.null?
        @@mb_set_angular_damp_mode = Bridge.get_method_bind("RigidBody2D", "set_angular_damp_mode", 3406533708_i64)
      end
      val_0 = angular_damp_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_damp_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_damp_mode : Void* = Pointer(Void).null
    def get_angular_damp_mode() : Int64
      if @@mb_get_angular_damp_mode.null?
        @@mb_get_angular_damp_mode = Bridge.get_method_bind("RigidBody2D", "get_angular_damp_mode", 2970511462_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_angular_damp_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_linear_damp : Void* = Pointer(Void).null
    def set_linear_damp(linear_damp : Float64) : Void
      if @@mb_set_linear_damp.null?
        @@mb_set_linear_damp = Bridge.get_method_bind("RigidBody2D", "set_linear_damp", 373806689_i64)
      end
      val_0 = linear_damp
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_linear_damp, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_linear_damp : Void* = Pointer(Void).null
    def get_linear_damp() : Float64
      if @@mb_get_linear_damp.null?
        @@mb_get_linear_damp = Bridge.get_method_bind("RigidBody2D", "get_linear_damp", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_linear_damp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_damp : Void* = Pointer(Void).null
    def set_angular_damp(angular_damp : Float64) : Void
      if @@mb_set_angular_damp.null?
        @@mb_set_angular_damp = Bridge.get_method_bind("RigidBody2D", "set_angular_damp", 373806689_i64)
      end
      val_0 = angular_damp
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_damp, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_damp : Void* = Pointer(Void).null
    def get_angular_damp() : Float64
      if @@mb_get_angular_damp.null?
        @@mb_get_angular_damp = Bridge.get_method_bind("RigidBody2D", "get_angular_damp", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angular_damp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_linear_velocity : Void* = Pointer(Void).null
    def set_linear_velocity(linear_velocity : Vector2) : Void
      if @@mb_set_linear_velocity.null?
        @@mb_set_linear_velocity = Bridge.get_method_bind("RigidBody2D", "set_linear_velocity", 743155724_i64)
      end
      val_0 = linear_velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_linear_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_linear_velocity : Void* = Pointer(Void).null
    def get_linear_velocity() : Vector2
      if @@mb_get_linear_velocity.null?
        @@mb_get_linear_velocity = Bridge.get_method_bind("RigidBody2D", "get_linear_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_linear_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_velocity : Void* = Pointer(Void).null
    def set_angular_velocity(angular_velocity : Float64) : Void
      if @@mb_set_angular_velocity.null?
        @@mb_set_angular_velocity = Bridge.get_method_bind("RigidBody2D", "set_angular_velocity", 373806689_i64)
      end
      val_0 = angular_velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_velocity : Void* = Pointer(Void).null
    def get_angular_velocity() : Float64
      if @@mb_get_angular_velocity.null?
        @@mb_get_angular_velocity = Bridge.get_method_bind("RigidBody2D", "get_angular_velocity", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angular_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_contacts_reported : Void* = Pointer(Void).null
    def set_max_contacts_reported(amount : Int64) : Void
      if @@mb_set_max_contacts_reported.null?
        @@mb_set_max_contacts_reported = Bridge.get_method_bind("RigidBody2D", "set_max_contacts_reported", 1286410249_i64)
      end
      val_0 = amount
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_contacts_reported, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_contacts_reported : Void* = Pointer(Void).null
    def get_max_contacts_reported() : Int64
      if @@mb_get_max_contacts_reported.null?
        @@mb_get_max_contacts_reported = Bridge.get_method_bind("RigidBody2D", "get_max_contacts_reported", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_contacts_reported, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_count : Void* = Pointer(Void).null
    def get_contact_count() : Int64
      if @@mb_get_contact_count.null?
        @@mb_get_contact_count = Bridge.get_method_bind("RigidBody2D", "get_contact_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_contact_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_custom_integrator : Void* = Pointer(Void).null
    def set_use_custom_integrator(enable : Bool) : Void
      if @@mb_set_use_custom_integrator.null?
        @@mb_set_use_custom_integrator = Bridge.get_method_bind("RigidBody2D", "set_use_custom_integrator", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_custom_integrator, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_using_custom_integrator : Void* = Pointer(Void).null
    def is_using_custom_integrator() : Bool
      if @@mb_is_using_custom_integrator.null?
        @@mb_is_using_custom_integrator = Bridge.get_method_bind("RigidBody2D", "is_using_custom_integrator", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_using_custom_integrator, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_contact_monitor : Void* = Pointer(Void).null
    def set_contact_monitor(enabled : Bool) : Void
      if @@mb_set_contact_monitor.null?
        @@mb_set_contact_monitor = Bridge.get_method_bind("RigidBody2D", "set_contact_monitor", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_contact_monitor, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_contact_monitor_enabled : Void* = Pointer(Void).null
    def is_contact_monitor_enabled() : Bool
      if @@mb_is_contact_monitor_enabled.null?
        @@mb_is_contact_monitor_enabled = Bridge.get_method_bind("RigidBody2D", "is_contact_monitor_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_contact_monitor_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_continuous_collision_detection_mode : Void* = Pointer(Void).null
    def set_continuous_collision_detection_mode(mode : Int64) : Void
      if @@mb_set_continuous_collision_detection_mode.null?
        @@mb_set_continuous_collision_detection_mode = Bridge.get_method_bind("RigidBody2D", "set_continuous_collision_detection_mode", 1000241384_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_continuous_collision_detection_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_continuous_collision_detection_mode : Void* = Pointer(Void).null
    def get_continuous_collision_detection_mode() : Int64
      if @@mb_get_continuous_collision_detection_mode.null?
        @@mb_get_continuous_collision_detection_mode = Bridge.get_method_bind("RigidBody2D", "get_continuous_collision_detection_mode", 815214376_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_continuous_collision_detection_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_velocity_at_local_position : Void* = Pointer(Void).null
    def get_velocity_at_local_position(local_position : Vector2) : Vector2
      if @@mb_get_velocity_at_local_position.null?
        @@mb_get_velocity_at_local_position = Bridge.get_method_bind("RigidBody2D", "get_velocity_at_local_position", 2656412154_i64)
      end
      val_0 = local_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_velocity_at_local_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_velocity_at_position : Void* = Pointer(Void).null
    def get_velocity_at_position(global_point : Vector2) : Vector2
      if @@mb_get_velocity_at_position.null?
        @@mb_get_velocity_at_position = Bridge.get_method_bind("RigidBody2D", "get_velocity_at_position", 2656412154_i64)
      end
      val_0 = global_point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_velocity_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_axis_velocity : Void* = Pointer(Void).null
    def set_axis_velocity(axis_velocity : Vector2) : Void
      if @@mb_set_axis_velocity.null?
        @@mb_set_axis_velocity = Bridge.get_method_bind("RigidBody2D", "set_axis_velocity", 743155724_i64)
      end
      val_0 = axis_velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_axis_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_central_impulse : Void* = Pointer(Void).null
    def apply_central_impulse(impulse : Vector2) : Void
      if @@mb_apply_central_impulse.null?
        @@mb_apply_central_impulse = Bridge.get_method_bind("RigidBody2D", "apply_central_impulse", 3862383994_i64)
      end
      val_0 = impulse
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_central_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_impulse : Void* = Pointer(Void).null
    def apply_impulse(impulse : Vector2, position : Vector2) : Void
      if @@mb_apply_impulse.null?
        @@mb_apply_impulse = Bridge.get_method_bind("RigidBody2D", "apply_impulse", 4288681949_i64)
      end
      val_0 = impulse
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_apply_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_torque_impulse : Void* = Pointer(Void).null
    def apply_torque_impulse(torque : Float64) : Void
      if @@mb_apply_torque_impulse.null?
        @@mb_apply_torque_impulse = Bridge.get_method_bind("RigidBody2D", "apply_torque_impulse", 373806689_i64)
      end
      val_0 = torque
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_torque_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_central_force : Void* = Pointer(Void).null
    def apply_central_force(force : Vector2) : Void
      if @@mb_apply_central_force.null?
        @@mb_apply_central_force = Bridge.get_method_bind("RigidBody2D", "apply_central_force", 743155724_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_central_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_force : Void* = Pointer(Void).null
    def apply_force(force : Vector2, position : Vector2) : Void
      if @@mb_apply_force.null?
        @@mb_apply_force = Bridge.get_method_bind("RigidBody2D", "apply_force", 4288681949_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_apply_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_torque : Void* = Pointer(Void).null
    def apply_torque(torque : Float64) : Void
      if @@mb_apply_torque.null?
        @@mb_apply_torque = Bridge.get_method_bind("RigidBody2D", "apply_torque", 373806689_i64)
      end
      val_0 = torque
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_constant_central_force : Void* = Pointer(Void).null
    def add_constant_central_force(force : Vector2) : Void
      if @@mb_add_constant_central_force.null?
        @@mb_add_constant_central_force = Bridge.get_method_bind("RigidBody2D", "add_constant_central_force", 743155724_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_constant_central_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_constant_force : Void* = Pointer(Void).null
    def add_constant_force(force : Vector2, position : Vector2) : Void
      if @@mb_add_constant_force.null?
        @@mb_add_constant_force = Bridge.get_method_bind("RigidBody2D", "add_constant_force", 4288681949_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_constant_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_constant_torque : Void* = Pointer(Void).null
    def add_constant_torque(torque : Float64) : Void
      if @@mb_add_constant_torque.null?
        @@mb_add_constant_torque = Bridge.get_method_bind("RigidBody2D", "add_constant_torque", 373806689_i64)
      end
      val_0 = torque
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_constant_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_constant_force : Void* = Pointer(Void).null
    def set_constant_force(force : Vector2) : Void
      if @@mb_set_constant_force.null?
        @@mb_set_constant_force = Bridge.get_method_bind("RigidBody2D", "set_constant_force", 743155724_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant_force : Void* = Pointer(Void).null
    def get_constant_force() : Vector2
      if @@mb_get_constant_force.null?
        @@mb_get_constant_force = Bridge.get_method_bind("RigidBody2D", "get_constant_force", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_constant_force, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_constant_torque : Void* = Pointer(Void).null
    def set_constant_torque(torque : Float64) : Void
      if @@mb_set_constant_torque.null?
        @@mb_set_constant_torque = Bridge.get_method_bind("RigidBody2D", "set_constant_torque", 373806689_i64)
      end
      val_0 = torque
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant_torque : Void* = Pointer(Void).null
    def get_constant_torque() : Float64
      if @@mb_get_constant_torque.null?
        @@mb_get_constant_torque = Bridge.get_method_bind("RigidBody2D", "get_constant_torque", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_constant_torque, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_sleeping : Void* = Pointer(Void).null
    def set_sleeping(sleeping : Bool) : Void
      if @@mb_set_sleeping.null?
        @@mb_set_sleeping = Bridge.get_method_bind("RigidBody2D", "set_sleeping", 2586408642_i64)
      end
      val_0 = sleeping
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_sleeping, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_sleeping : Void* = Pointer(Void).null
    def is_sleeping() : Bool
      if @@mb_is_sleeping.null?
        @@mb_is_sleeping = Bridge.get_method_bind("RigidBody2D", "is_sleeping", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_sleeping, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_can_sleep : Void* = Pointer(Void).null
    def set_can_sleep(able_to_sleep : Bool) : Void
      if @@mb_set_can_sleep.null?
        @@mb_set_can_sleep = Bridge.get_method_bind("RigidBody2D", "set_can_sleep", 2586408642_i64)
      end
      val_0 = able_to_sleep
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_can_sleep, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_able_to_sleep : Void* = Pointer(Void).null
    def is_able_to_sleep() : Bool
      if @@mb_is_able_to_sleep.null?
        @@mb_is_able_to_sleep = Bridge.get_method_bind("RigidBody2D", "is_able_to_sleep", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_able_to_sleep, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_lock_rotation_enabled : Void* = Pointer(Void).null
    def set_lock_rotation_enabled(lock_rotation : Bool) : Void
      if @@mb_set_lock_rotation_enabled.null?
        @@mb_set_lock_rotation_enabled = Bridge.get_method_bind("RigidBody2D", "set_lock_rotation_enabled", 2586408642_i64)
      end
      val_0 = lock_rotation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_lock_rotation_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_lock_rotation_enabled : Void* = Pointer(Void).null
    def is_lock_rotation_enabled() : Bool
      if @@mb_is_lock_rotation_enabled.null?
        @@mb_is_lock_rotation_enabled = Bridge.get_method_bind("RigidBody2D", "is_lock_rotation_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_lock_rotation_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_freeze_enabled : Void* = Pointer(Void).null
    def set_freeze_enabled(freeze_mode : Bool) : Void
      if @@mb_set_freeze_enabled.null?
        @@mb_set_freeze_enabled = Bridge.get_method_bind("RigidBody2D", "set_freeze_enabled", 2586408642_i64)
      end
      val_0 = freeze_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_freeze_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_freeze_enabled : Void* = Pointer(Void).null
    def is_freeze_enabled() : Bool
      if @@mb_is_freeze_enabled.null?
        @@mb_is_freeze_enabled = Bridge.get_method_bind("RigidBody2D", "is_freeze_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_freeze_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_freeze_mode : Void* = Pointer(Void).null
    def set_freeze_mode(freeze_mode : Int64) : Void
      if @@mb_set_freeze_mode.null?
        @@mb_set_freeze_mode = Bridge.get_method_bind("RigidBody2D", "set_freeze_mode", 1705112154_i64)
      end
      val_0 = freeze_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_freeze_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_freeze_mode : Void* = Pointer(Void).null
    def get_freeze_mode() : Int64
      if @@mb_get_freeze_mode.null?
        @@mb_get_freeze_mode = Bridge.get_method_bind("RigidBody2D", "get_freeze_mode", 2016872314_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_freeze_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_colliding_bodies : Void* = Pointer(Void).null
    def get_colliding_bodies() : Godot::Array
      if @@mb_get_colliding_bodies.null?
        @@mb_get_colliding_bodies = Bridge.get_method_bind("RigidBody2D", "get_colliding_bodies", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_colliding_bodies, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
  end
  class PhysicalBone2D < Godot::RigidBody2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_joint : Void* = Pointer(Void).null
    def get_joint() : Joint2D
      if @@mb_get_joint.null?
        @@mb_get_joint = Bridge.get_method_bind("PhysicalBone2D", "get_joint", 3582132112_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_joint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Joint2D.new(ret_ptr)
    end
    @@mb_get_auto_configure_joint : Void* = Pointer(Void).null
    def get_auto_configure_joint() : Bool
      if @@mb_get_auto_configure_joint.null?
        @@mb_get_auto_configure_joint = Bridge.get_method_bind("PhysicalBone2D", "get_auto_configure_joint", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_auto_configure_joint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_auto_configure_joint : Void* = Pointer(Void).null
    def set_auto_configure_joint(auto_configure_joint : Bool) : Void
      if @@mb_set_auto_configure_joint.null?
        @@mb_set_auto_configure_joint = Bridge.get_method_bind("PhysicalBone2D", "set_auto_configure_joint", 2586408642_i64)
      end
      val_0 = auto_configure_joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_auto_configure_joint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_simulate_physics : Void* = Pointer(Void).null
    def set_simulate_physics(simulate_physics : Bool) : Void
      if @@mb_set_simulate_physics.null?
        @@mb_set_simulate_physics = Bridge.get_method_bind("PhysicalBone2D", "set_simulate_physics", 2586408642_i64)
      end
      val_0 = simulate_physics
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_simulate_physics, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_simulate_physics : Void* = Pointer(Void).null
    def get_simulate_physics() : Bool
      if @@mb_get_simulate_physics.null?
        @@mb_get_simulate_physics = Bridge.get_method_bind("PhysicalBone2D", "get_simulate_physics", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_simulate_physics, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_simulating_physics : Void* = Pointer(Void).null
    def is_simulating_physics() : Bool
      if @@mb_is_simulating_physics.null?
        @@mb_is_simulating_physics = Bridge.get_method_bind("PhysicalBone2D", "is_simulating_physics", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_simulating_physics, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_bone2d_nodepath : Void* = Pointer(Void).null
    def set_bone2d_nodepath(nodepath : NodePath) : Void
      if @@mb_set_bone2d_nodepath.null?
        @@mb_set_bone2d_nodepath = Bridge.get_method_bind("PhysicalBone2D", "set_bone2d_nodepath", 1348162250_i64)
      end
      val_0 = nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bone2d_nodepath, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone2d_nodepath : Void* = Pointer(Void).null
    def get_bone2d_nodepath() : NodePath
      if @@mb_get_bone2d_nodepath.null?
        @@mb_get_bone2d_nodepath = Bridge.get_method_bind("PhysicalBone2D", "get_bone2d_nodepath", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bone2d_nodepath, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_bone2d_index : Void* = Pointer(Void).null
    def set_bone2d_index(bone_index : Int64) : Void
      if @@mb_set_bone2d_index.null?
        @@mb_set_bone2d_index = Bridge.get_method_bind("PhysicalBone2D", "set_bone2d_index", 1286410249_i64)
      end
      val_0 = bone_index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bone2d_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone2d_index : Void* = Pointer(Void).null
    def get_bone2d_index() : Int64
      if @@mb_get_bone2d_index.null?
        @@mb_get_bone2d_index = Bridge.get_method_bind("PhysicalBone2D", "get_bone2d_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bone2d_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_follow_bone_when_simulating : Void* = Pointer(Void).null
    def set_follow_bone_when_simulating(follow_bone : Bool) : Void
      if @@mb_set_follow_bone_when_simulating.null?
        @@mb_set_follow_bone_when_simulating = Bridge.get_method_bind("PhysicalBone2D", "set_follow_bone_when_simulating", 2586408642_i64)
      end
      val_0 = follow_bone
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_follow_bone_when_simulating, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_follow_bone_when_simulating : Void* = Pointer(Void).null
    def get_follow_bone_when_simulating() : Bool
      if @@mb_get_follow_bone_when_simulating.null?
        @@mb_get_follow_bone_when_simulating = Bridge.get_method_bind("PhysicalBone2D", "get_follow_bone_when_simulating", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_follow_bone_when_simulating, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class PhysicsDirectBodyState2D < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_total_gravity : Void* = Pointer(Void).null
    def get_total_gravity() : Vector2
      if @@mb_get_total_gravity.null?
        @@mb_get_total_gravity = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_total_gravity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_total_gravity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_total_linear_damp : Void* = Pointer(Void).null
    def get_total_linear_damp() : Float64
      if @@mb_get_total_linear_damp.null?
        @@mb_get_total_linear_damp = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_total_linear_damp", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_total_linear_damp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_total_angular_damp : Void* = Pointer(Void).null
    def get_total_angular_damp() : Float64
      if @@mb_get_total_angular_damp.null?
        @@mb_get_total_angular_damp = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_total_angular_damp", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_total_angular_damp, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_center_of_mass : Void* = Pointer(Void).null
    def get_center_of_mass() : Vector2
      if @@mb_get_center_of_mass.null?
        @@mb_get_center_of_mass = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_center_of_mass", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_center_of_mass, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_center_of_mass_local : Void* = Pointer(Void).null
    def get_center_of_mass_local() : Vector2
      if @@mb_get_center_of_mass_local.null?
        @@mb_get_center_of_mass_local = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_center_of_mass_local", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_center_of_mass_local, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_inverse_mass : Void* = Pointer(Void).null
    def get_inverse_mass() : Float64
      if @@mb_get_inverse_mass.null?
        @@mb_get_inverse_mass = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_inverse_mass", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_inverse_mass, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_inverse_inertia : Void* = Pointer(Void).null
    def get_inverse_inertia() : Float64
      if @@mb_get_inverse_inertia.null?
        @@mb_get_inverse_inertia = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_inverse_inertia", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_inverse_inertia, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_linear_velocity : Void* = Pointer(Void).null
    def set_linear_velocity(velocity : Vector2) : Void
      if @@mb_set_linear_velocity.null?
        @@mb_set_linear_velocity = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_linear_velocity", 743155724_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_linear_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_linear_velocity : Void* = Pointer(Void).null
    def get_linear_velocity() : Vector2
      if @@mb_get_linear_velocity.null?
        @@mb_get_linear_velocity = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_linear_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_linear_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_velocity : Void* = Pointer(Void).null
    def set_angular_velocity(velocity : Float64) : Void
      if @@mb_set_angular_velocity.null?
        @@mb_set_angular_velocity = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_angular_velocity", 373806689_i64)
      end
      val_0 = velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_velocity : Void* = Pointer(Void).null
    def get_angular_velocity() : Float64
      if @@mb_get_angular_velocity.null?
        @@mb_get_angular_velocity = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_angular_velocity", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angular_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_transform : Void* = Pointer(Void).null
    def set_transform(transform : Transform2D) : Void
      if @@mb_set_transform.null?
        @@mb_set_transform = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_transform", 2761652528_i64)
      end
      val_0 = transform
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_transform : Void* = Pointer(Void).null
    def get_transform() : Transform2D
      if @@mb_get_transform.null?
        @@mb_get_transform = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_transform", 3814499831_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_transform, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_get_velocity_at_local_position : Void* = Pointer(Void).null
    def get_velocity_at_local_position(local_position : Vector2) : Vector2
      if @@mb_get_velocity_at_local_position.null?
        @@mb_get_velocity_at_local_position = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_velocity_at_local_position", 2656412154_i64)
      end
      val_0 = local_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_velocity_at_local_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_apply_central_impulse : Void* = Pointer(Void).null
    def apply_central_impulse(impulse : Vector2) : Void
      if @@mb_apply_central_impulse.null?
        @@mb_apply_central_impulse = Bridge.get_method_bind("PhysicsDirectBodyState2D", "apply_central_impulse", 743155724_i64)
      end
      val_0 = impulse
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_central_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_torque_impulse : Void* = Pointer(Void).null
    def apply_torque_impulse(impulse : Float64) : Void
      if @@mb_apply_torque_impulse.null?
        @@mb_apply_torque_impulse = Bridge.get_method_bind("PhysicsDirectBodyState2D", "apply_torque_impulse", 373806689_i64)
      end
      val_0 = impulse
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_torque_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_impulse : Void* = Pointer(Void).null
    def apply_impulse(impulse : Vector2, position : Vector2) : Void
      if @@mb_apply_impulse.null?
        @@mb_apply_impulse = Bridge.get_method_bind("PhysicsDirectBodyState2D", "apply_impulse", 4288681949_i64)
      end
      val_0 = impulse
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_apply_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_central_force : Void* = Pointer(Void).null
    def apply_central_force(force : Vector2) : Void
      if @@mb_apply_central_force.null?
        @@mb_apply_central_force = Bridge.get_method_bind("PhysicsDirectBodyState2D", "apply_central_force", 3862383994_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_central_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_force : Void* = Pointer(Void).null
    def apply_force(force : Vector2, position : Vector2) : Void
      if @@mb_apply_force.null?
        @@mb_apply_force = Bridge.get_method_bind("PhysicsDirectBodyState2D", "apply_force", 4288681949_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_apply_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_apply_torque : Void* = Pointer(Void).null
    def apply_torque(torque : Float64) : Void
      if @@mb_apply_torque.null?
        @@mb_apply_torque = Bridge.get_method_bind("PhysicsDirectBodyState2D", "apply_torque", 373806689_i64)
      end
      val_0 = torque
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_apply_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_constant_central_force : Void* = Pointer(Void).null
    def add_constant_central_force(force : Vector2) : Void
      if @@mb_add_constant_central_force.null?
        @@mb_add_constant_central_force = Bridge.get_method_bind("PhysicsDirectBodyState2D", "add_constant_central_force", 3862383994_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_constant_central_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_constant_force : Void* = Pointer(Void).null
    def add_constant_force(force : Vector2, position : Vector2) : Void
      if @@mb_add_constant_force.null?
        @@mb_add_constant_force = Bridge.get_method_bind("PhysicsDirectBodyState2D", "add_constant_force", 4288681949_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_constant_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_constant_torque : Void* = Pointer(Void).null
    def add_constant_torque(torque : Float64) : Void
      if @@mb_add_constant_torque.null?
        @@mb_add_constant_torque = Bridge.get_method_bind("PhysicsDirectBodyState2D", "add_constant_torque", 373806689_i64)
      end
      val_0 = torque
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_constant_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_constant_force : Void* = Pointer(Void).null
    def set_constant_force(force : Vector2) : Void
      if @@mb_set_constant_force.null?
        @@mb_set_constant_force = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_constant_force", 743155724_i64)
      end
      val_0 = force
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant_force : Void* = Pointer(Void).null
    def get_constant_force() : Vector2
      if @@mb_get_constant_force.null?
        @@mb_get_constant_force = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_constant_force", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_constant_force, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_constant_torque : Void* = Pointer(Void).null
    def set_constant_torque(torque : Float64) : Void
      if @@mb_set_constant_torque.null?
        @@mb_set_constant_torque = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_constant_torque", 373806689_i64)
      end
      val_0 = torque
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constant_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constant_torque : Void* = Pointer(Void).null
    def get_constant_torque() : Float64
      if @@mb_get_constant_torque.null?
        @@mb_get_constant_torque = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_constant_torque", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_constant_torque, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_sleep_state : Void* = Pointer(Void).null
    def set_sleep_state(enabled : Bool) : Void
      if @@mb_set_sleep_state.null?
        @@mb_set_sleep_state = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_sleep_state", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_sleep_state, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_sleeping : Void* = Pointer(Void).null
    def is_sleeping() : Bool
      if @@mb_is_sleeping.null?
        @@mb_is_sleeping = Bridge.get_method_bind("PhysicsDirectBodyState2D", "is_sleeping", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_sleeping, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collision_layer : Void* = Pointer(Void).null
    def set_collision_layer(layer : Int64) : Void
      if @@mb_set_collision_layer.null?
        @@mb_set_collision_layer = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_collision_layer", 1286410249_i64)
      end
      val_0 = layer
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_layer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_layer : Void* = Pointer(Void).null
    def get_collision_layer() : Int64
      if @@mb_get_collision_layer.null?
        @@mb_get_collision_layer = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_collision_layer", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_layer, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("PhysicsDirectBodyState2D", "set_collision_mask", 1286410249_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_count : Void* = Pointer(Void).null
    def get_contact_count() : Int64
      if @@mb_get_contact_count.null?
        @@mb_get_contact_count = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_contact_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_local_position : Void* = Pointer(Void).null
    def get_contact_local_position(contact_idx : Int64) : Vector2
      if @@mb_get_contact_local_position.null?
        @@mb_get_contact_local_position = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_local_position", 2299179447_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_contact_local_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_local_normal : Void* = Pointer(Void).null
    def get_contact_local_normal(contact_idx : Int64) : Vector2
      if @@mb_get_contact_local_normal.null?
        @@mb_get_contact_local_normal = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_local_normal", 2299179447_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_contact_local_normal, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_local_shape : Void* = Pointer(Void).null
    def get_contact_local_shape(contact_idx : Int64) : Int64
      if @@mb_get_contact_local_shape.null?
        @@mb_get_contact_local_shape = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_local_shape", 923996154_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_contact_local_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_local_velocity_at_position : Void* = Pointer(Void).null
    def get_contact_local_velocity_at_position(contact_idx : Int64) : Vector2
      if @@mb_get_contact_local_velocity_at_position.null?
        @@mb_get_contact_local_velocity_at_position = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_local_velocity_at_position", 2299179447_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_contact_local_velocity_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_collider : Void* = Pointer(Void).null
    def get_contact_collider(contact_idx : Int64) : Int64
      if @@mb_get_contact_collider.null?
        @@mb_get_contact_collider = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_collider", 495598643_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_contact_collider, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_collider_position : Void* = Pointer(Void).null
    def get_contact_collider_position(contact_idx : Int64) : Vector2
      if @@mb_get_contact_collider_position.null?
        @@mb_get_contact_collider_position = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_collider_position", 2299179447_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_contact_collider_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_collider_id : Void* = Pointer(Void).null
    def get_contact_collider_id(contact_idx : Int64) : Int64
      if @@mb_get_contact_collider_id.null?
        @@mb_get_contact_collider_id = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_collider_id", 923996154_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_contact_collider_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_collider_object : Void* = Pointer(Void).null
    def get_contact_collider_object(contact_idx : Int64) : Godot::Object
      if @@mb_get_contact_collider_object.null?
        @@mb_get_contact_collider_object = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_collider_object", 3332903315_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_contact_collider_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_get_contact_collider_shape : Void* = Pointer(Void).null
    def get_contact_collider_shape(contact_idx : Int64) : Int64
      if @@mb_get_contact_collider_shape.null?
        @@mb_get_contact_collider_shape = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_collider_shape", 923996154_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_contact_collider_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_collider_velocity_at_position : Void* = Pointer(Void).null
    def get_contact_collider_velocity_at_position(contact_idx : Int64) : Vector2
      if @@mb_get_contact_collider_velocity_at_position.null?
        @@mb_get_contact_collider_velocity_at_position = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_collider_velocity_at_position", 2299179447_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_contact_collider_velocity_at_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_contact_impulse : Void* = Pointer(Void).null
    def get_contact_impulse(contact_idx : Int64) : Vector2
      if @@mb_get_contact_impulse.null?
        @@mb_get_contact_impulse = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_contact_impulse", 2299179447_i64)
      end
      val_0 = contact_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_contact_impulse, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_step : Void* = Pointer(Void).null
    def get_step() : Float64
      if @@mb_get_step.null?
        @@mb_get_step = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_step", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_step, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_integrate_forces : Void* = Pointer(Void).null
    def integrate_forces() : Void
      if @@mb_integrate_forces.null?
        @@mb_integrate_forces = Bridge.get_method_bind("PhysicsDirectBodyState2D", "integrate_forces", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_integrate_forces, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_space_state : Void* = Pointer(Void).null
    def get_space_state() : PhysicsDirectSpaceState2D
      if @@mb_get_space_state.null?
        @@mb_get_space_state = Bridge.get_method_bind("PhysicsDirectBodyState2D", "get_space_state", 2506717822_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_space_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PhysicsDirectSpaceState2D.new(ret_ptr)
    end
  end
  class PhysicsDirectBodyState2DExtension < Godot::PhysicsDirectBodyState2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class PhysicsDirectSpaceState2D < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_intersect_point : Void* = Pointer(Void).null
    def intersect_point(parameters : PhysicsPointQueryParameters2D, max_results : Int64) : Godot::Array
      if @@mb_intersect_point.null?
        @@mb_intersect_point = Bridge.get_method_bind("PhysicsDirectSpaceState2D", "intersect_point", 2118456068_i64)
      end
      val_0 = parameters
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = max_results
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_intersect_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_intersect_ray : Void* = Pointer(Void).null
    def intersect_ray(parameters : PhysicsRayQueryParameters2D) : Void*
      if @@mb_intersect_ray.null?
        @@mb_intersect_ray = Bridge.get_method_bind("PhysicsDirectSpaceState2D", "intersect_ray", 1590275562_i64)
      end
      val_0 = parameters
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_intersect_ray, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_intersect_shape : Void* = Pointer(Void).null
    def intersect_shape(parameters : PhysicsShapeQueryParameters2D, max_results : Int64) : Godot::Array
      if @@mb_intersect_shape.null?
        @@mb_intersect_shape = Bridge.get_method_bind("PhysicsDirectSpaceState2D", "intersect_shape", 2488867228_i64)
      end
      val_0 = parameters
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = max_results
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_intersect_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_cast_motion : Void* = Pointer(Void).null
    def cast_motion(parameters : PhysicsShapeQueryParameters2D) : Void*
      if @@mb_cast_motion.null?
        @@mb_cast_motion = Bridge.get_method_bind("PhysicsDirectSpaceState2D", "cast_motion", 711275086_i64)
      end
      val_0 = parameters
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_cast_motion, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_collide_shape : Void* = Pointer(Void).null
    def collide_shape(parameters : PhysicsShapeQueryParameters2D, max_results : Int64) : Godot::Array
      if @@mb_collide_shape.null?
        @@mb_collide_shape = Bridge.get_method_bind("PhysicsDirectSpaceState2D", "collide_shape", 2488867228_i64)
      end
      val_0 = parameters
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = max_results
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_collide_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_get_rest_info : Void* = Pointer(Void).null
    def get_rest_info(parameters : PhysicsShapeQueryParameters2D) : Void*
      if @@mb_get_rest_info.null?
        @@mb_get_rest_info = Bridge.get_method_bind("PhysicsDirectSpaceState2D", "get_rest_info", 2803666496_i64)
      end
      val_0 = parameters
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rest_info, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
  end
  class PhysicsDirectSpaceState2DExtension < Godot::PhysicsDirectSpaceState2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_is_body_excluded_from_query : Void* = Pointer(Void).null
    def is_body_excluded_from_query(body : Int64) : Bool
      if @@mb_is_body_excluded_from_query.null?
        @@mb_is_body_excluded_from_query = Bridge.get_method_bind("PhysicsDirectSpaceState2DExtension", "is_body_excluded_from_query", 4155700596_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_body_excluded_from_query, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class PhysicsPointQueryParameters2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_position : Void* = Pointer(Void).null
    def set_position(position : Vector2) : Void
      if @@mb_set_position.null?
        @@mb_set_position = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "set_position", 743155724_i64)
      end
      val_0 = position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_position : Void* = Pointer(Void).null
    def get_position() : Vector2
      if @@mb_get_position.null?
        @@mb_get_position = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "get_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_canvas_instance_id : Void* = Pointer(Void).null
    def set_canvas_instance_id(canvas_instance_id : Int64) : Void
      if @@mb_set_canvas_instance_id.null?
        @@mb_set_canvas_instance_id = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "set_canvas_instance_id", 1286410249_i64)
      end
      val_0 = canvas_instance_id
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_canvas_instance_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_canvas_instance_id : Void* = Pointer(Void).null
    def get_canvas_instance_id() : Int64
      if @@mb_get_canvas_instance_id.null?
        @@mb_get_canvas_instance_id = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "get_canvas_instance_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_canvas_instance_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(collision_mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "set_collision_mask", 1286410249_i64)
      end
      val_0 = collision_mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_exclude : Void* = Pointer(Void).null
    def set_exclude(exclude : Godot::Array) : Void
      if @@mb_set_exclude.null?
        @@mb_set_exclude = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "set_exclude", 381264803_i64)
      end
      arg_ptr_0 = exclude ? exclude.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude : Void* = Pointer(Void).null
    def get_exclude() : Godot::Array
      if @@mb_get_exclude.null?
        @@mb_get_exclude = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "get_exclude", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_exclude, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_collide_with_bodies : Void* = Pointer(Void).null
    def set_collide_with_bodies(enable : Bool) : Void
      if @@mb_set_collide_with_bodies.null?
        @@mb_set_collide_with_bodies = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "set_collide_with_bodies", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_bodies, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_bodies_enabled : Void* = Pointer(Void).null
    def is_collide_with_bodies_enabled() : Bool
      if @@mb_is_collide_with_bodies_enabled.null?
        @@mb_is_collide_with_bodies_enabled = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "is_collide_with_bodies_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_bodies_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_with_areas : Void* = Pointer(Void).null
    def set_collide_with_areas(enable : Bool) : Void
      if @@mb_set_collide_with_areas.null?
        @@mb_set_collide_with_areas = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "set_collide_with_areas", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_areas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_areas_enabled : Void* = Pointer(Void).null
    def is_collide_with_areas_enabled() : Bool
      if @@mb_is_collide_with_areas_enabled.null?
        @@mb_is_collide_with_areas_enabled = Bridge.get_method_bind("PhysicsPointQueryParameters2D", "is_collide_with_areas_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_areas_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class PhysicsRayQueryParameters2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_create : Void* = Pointer(Void).null
    def create(from : Vector2, to : Vector2, collision_mask : Int64, exclude : Godot::Array) : PhysicsRayQueryParameters2D
      if @@mb_create.null?
        @@mb_create = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "create", 3196569324_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = to
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = collision_mask
      arg_2 = pointerof(val_2).as(Void*)
      arg_ptr_3 = exclude ? exclude.pointer : Pointer(Void).null
      arg_3 = pointerof(arg_ptr_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      PhysicsRayQueryParameters2D.new(ret_ptr)
    end
    @@mb_set_from : Void* = Pointer(Void).null
    def set_from(from : Vector2) : Void
      if @@mb_set_from.null?
        @@mb_set_from = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "set_from", 743155724_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_from, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_from : Void* = Pointer(Void).null
    def get_from() : Vector2
      if @@mb_get_from.null?
        @@mb_get_from = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "get_from", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_from, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_to : Void* = Pointer(Void).null
    def set_to(to : Vector2) : Void
      if @@mb_set_to.null?
        @@mb_set_to = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "set_to", 743155724_i64)
      end
      val_0 = to
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_to, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_to : Void* = Pointer(Void).null
    def get_to() : Vector2
      if @@mb_get_to.null?
        @@mb_get_to = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "get_to", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_to, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(collision_mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "set_collision_mask", 1286410249_i64)
      end
      val_0 = collision_mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_exclude : Void* = Pointer(Void).null
    def set_exclude(exclude : Godot::Array) : Void
      if @@mb_set_exclude.null?
        @@mb_set_exclude = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "set_exclude", 381264803_i64)
      end
      arg_ptr_0 = exclude ? exclude.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude : Void* = Pointer(Void).null
    def get_exclude() : Godot::Array
      if @@mb_get_exclude.null?
        @@mb_get_exclude = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "get_exclude", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_exclude, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_collide_with_bodies : Void* = Pointer(Void).null
    def set_collide_with_bodies(enable : Bool) : Void
      if @@mb_set_collide_with_bodies.null?
        @@mb_set_collide_with_bodies = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "set_collide_with_bodies", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_bodies, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_bodies_enabled : Void* = Pointer(Void).null
    def is_collide_with_bodies_enabled() : Bool
      if @@mb_is_collide_with_bodies_enabled.null?
        @@mb_is_collide_with_bodies_enabled = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "is_collide_with_bodies_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_bodies_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_with_areas : Void* = Pointer(Void).null
    def set_collide_with_areas(enable : Bool) : Void
      if @@mb_set_collide_with_areas.null?
        @@mb_set_collide_with_areas = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "set_collide_with_areas", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_areas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_areas_enabled : Void* = Pointer(Void).null
    def is_collide_with_areas_enabled() : Bool
      if @@mb_is_collide_with_areas_enabled.null?
        @@mb_is_collide_with_areas_enabled = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "is_collide_with_areas_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_areas_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_hit_from_inside : Void* = Pointer(Void).null
    def set_hit_from_inside(enable : Bool) : Void
      if @@mb_set_hit_from_inside.null?
        @@mb_set_hit_from_inside = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "set_hit_from_inside", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hit_from_inside, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_hit_from_inside_enabled : Void* = Pointer(Void).null
    def is_hit_from_inside_enabled() : Bool
      if @@mb_is_hit_from_inside_enabled.null?
        @@mb_is_hit_from_inside_enabled = Bridge.get_method_bind("PhysicsRayQueryParameters2D", "is_hit_from_inside_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_hit_from_inside_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class PhysicsServer2D < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum SpaceParameter : Int64
      SpaceParamContactRecycleRadius = 0_i64
      SpaceParamContactMaxSeparation = 1_i64
      SpaceParamContactMaxAllowedPenetration = 2_i64
      SpaceParamContactDefaultBias = 3_i64
      SpaceParamBodyLinearVelocitySleepThreshold = 4_i64
      SpaceParamBodyAngularVelocitySleepThreshold = 5_i64
      SpaceParamBodyTimeToSleep = 6_i64
      SpaceParamConstraintDefaultBias = 7_i64
      SpaceParamSolverIterations = 8_i64
    end
    enum ShapeType : Int64
      ShapeWorldBoundary = 0_i64
      ShapeSeparationRay = 1_i64
      ShapeSegment = 2_i64
      ShapeCircle = 3_i64
      ShapeRectangle = 4_i64
      ShapeCapsule = 5_i64
      ShapeConvexPolygon = 6_i64
      ShapeConcavePolygon = 7_i64
      ShapeCustom = 8_i64
    end
    enum AreaParameter : Int64
      AreaParamGravityOverrideMode = 0_i64
      AreaParamGravity = 1_i64
      AreaParamGravityVector = 2_i64
      AreaParamGravityIsPoint = 3_i64
      AreaParamGravityPointUnitDistance = 4_i64
      AreaParamLinearDampOverrideMode = 5_i64
      AreaParamLinearDamp = 6_i64
      AreaParamAngularDampOverrideMode = 7_i64
      AreaParamAngularDamp = 8_i64
      AreaParamPriority = 9_i64
    end
    enum AreaSpaceOverrideMode : Int64
      AreaSpaceOverrideDisabled = 0_i64
      AreaSpaceOverrideCombine = 1_i64
      AreaSpaceOverrideCombineReplace = 2_i64
      AreaSpaceOverrideReplace = 3_i64
      AreaSpaceOverrideReplaceCombine = 4_i64
    end
    enum BodyMode : Int64
      BodyModeStatic = 0_i64
      BodyModeKinematic = 1_i64
      BodyModeRigid = 2_i64
      BodyModeRigidLinear = 3_i64
    end
    enum BodyParameter : Int64
      BodyParamBounce = 0_i64
      BodyParamFriction = 1_i64
      BodyParamMass = 2_i64
      BodyParamInertia = 3_i64
      BodyParamCenterOfMass = 4_i64
      BodyParamGravityScale = 5_i64
      BodyParamLinearDampMode = 6_i64
      BodyParamAngularDampMode = 7_i64
      BodyParamLinearDamp = 8_i64
      BodyParamAngularDamp = 9_i64
      BodyParamMax = 10_i64
    end
    enum BodyDampMode : Int64
      BodyDampModeCombine = 0_i64
      BodyDampModeReplace = 1_i64
    end
    enum BodyState : Int64
      BodyStateTransform = 0_i64
      BodyStateLinearVelocity = 1_i64
      BodyStateAngularVelocity = 2_i64
      BodyStateSleeping = 3_i64
      BodyStateCanSleep = 4_i64
    end
    enum JointType : Int64
      JointTypePin = 0_i64
      JointTypeGroove = 1_i64
      JointTypeDampedSpring = 2_i64
      JointTypeMax = 3_i64
    end
    enum JointParam : Int64
      JointParamBias = 0_i64
      JointParamMaxBias = 1_i64
      JointParamMaxForce = 2_i64
    end
    enum PinJointParam : Int64
      PinJointSoftness = 0_i64
      PinJointLimitUpper = 1_i64
      PinJointLimitLower = 2_i64
      PinJointMotorTargetVelocity = 3_i64
    end
    enum PinJointFlag : Int64
      PinJointFlagAngularLimitEnabled = 0_i64
      PinJointFlagMotorEnabled = 1_i64
    end
    enum DampedSpringParam : Int64
      DampedSpringRestLength = 0_i64
      DampedSpringStiffness = 1_i64
      DampedSpringDamping = 2_i64
    end
    enum CCDMode : Int64
      CcdModeDisabled = 0_i64
      CcdModeCastRay = 1_i64
      CcdModeCastShape = 2_i64
    end
    enum AreaBodyStatus : Int64
      AreaBodyAdded = 0_i64
      AreaBodyRemoved = 1_i64
    end
    enum ProcessInfo : Int64
      InfoActiveObjects = 0_i64
      InfoCollisionPairs = 1_i64
      InfoIslandCount = 2_i64
    end
    @@mb_world_boundary_shape_create : Void* = Pointer(Void).null
    def world_boundary_shape_create() : Int64
      if @@mb_world_boundary_shape_create.null?
        @@mb_world_boundary_shape_create = Bridge.get_method_bind("PhysicsServer2D", "world_boundary_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_world_boundary_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_separation_ray_shape_create : Void* = Pointer(Void).null
    def separation_ray_shape_create() : Int64
      if @@mb_separation_ray_shape_create.null?
        @@mb_separation_ray_shape_create = Bridge.get_method_bind("PhysicsServer2D", "separation_ray_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_separation_ray_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_segment_shape_create : Void* = Pointer(Void).null
    def segment_shape_create() : Int64
      if @@mb_segment_shape_create.null?
        @@mb_segment_shape_create = Bridge.get_method_bind("PhysicsServer2D", "segment_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_segment_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_circle_shape_create : Void* = Pointer(Void).null
    def circle_shape_create() : Int64
      if @@mb_circle_shape_create.null?
        @@mb_circle_shape_create = Bridge.get_method_bind("PhysicsServer2D", "circle_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_circle_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_rectangle_shape_create : Void* = Pointer(Void).null
    def rectangle_shape_create() : Int64
      if @@mb_rectangle_shape_create.null?
        @@mb_rectangle_shape_create = Bridge.get_method_bind("PhysicsServer2D", "rectangle_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_rectangle_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_capsule_shape_create : Void* = Pointer(Void).null
    def capsule_shape_create() : Int64
      if @@mb_capsule_shape_create.null?
        @@mb_capsule_shape_create = Bridge.get_method_bind("PhysicsServer2D", "capsule_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_capsule_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_convex_polygon_shape_create : Void* = Pointer(Void).null
    def convex_polygon_shape_create() : Int64
      if @@mb_convex_polygon_shape_create.null?
        @@mb_convex_polygon_shape_create = Bridge.get_method_bind("PhysicsServer2D", "convex_polygon_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_convex_polygon_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_concave_polygon_shape_create : Void* = Pointer(Void).null
    def concave_polygon_shape_create() : Int64
      if @@mb_concave_polygon_shape_create.null?
        @@mb_concave_polygon_shape_create = Bridge.get_method_bind("PhysicsServer2D", "concave_polygon_shape_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_concave_polygon_shape_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_shape_set_data : Void* = Pointer(Void).null
    def shape_set_data(shape : Int64, data : Void*) : Void
      if @@mb_shape_set_data.null?
        @@mb_shape_set_data = Bridge.get_method_bind("PhysicsServer2D", "shape_set_data", 3175752987_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = data
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_shape_set_data, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_shape_get_type : Void* = Pointer(Void).null
    def shape_get_type(shape : Int64) : Int64
      if @@mb_shape_get_type.null?
        @@mb_shape_get_type = Bridge.get_method_bind("PhysicsServer2D", "shape_get_type", 1240598777_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_shape_get_type, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_shape_get_data : Void* = Pointer(Void).null
    def shape_get_data(shape : Int64) : Void*
      if @@mb_shape_get_data.null?
        @@mb_shape_get_data = Bridge.get_method_bind("PhysicsServer2D", "shape_get_data", 4171304767_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_shape_get_data, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_space_create : Void* = Pointer(Void).null
    def space_create() : Int64
      if @@mb_space_create.null?
        @@mb_space_create = Bridge.get_method_bind("PhysicsServer2D", "space_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_space_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_space_set_active : Void* = Pointer(Void).null
    def space_set_active(space : Int64, active : Bool) : Void
      if @@mb_space_set_active.null?
        @@mb_space_set_active = Bridge.get_method_bind("PhysicsServer2D", "space_set_active", 1265174801_i64)
      end
      val_0 = space
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = active
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_space_set_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_space_is_active : Void* = Pointer(Void).null
    def space_is_active(space : Int64) : Bool
      if @@mb_space_is_active.null?
        @@mb_space_is_active = Bridge.get_method_bind("PhysicsServer2D", "space_is_active", 4155700596_i64)
      end
      val_0 = space
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_space_is_active, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_space_set_param : Void* = Pointer(Void).null
    def space_set_param(space : Int64, param : Int64, value : Float64) : Void
      if @@mb_space_set_param.null?
        @@mb_space_set_param = Bridge.get_method_bind("PhysicsServer2D", "space_set_param", 949194586_i64)
      end
      val_0 = space
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_space_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_space_get_param : Void* = Pointer(Void).null
    def space_get_param(space : Int64, param : Int64) : Float64
      if @@mb_space_get_param.null?
        @@mb_space_get_param = Bridge.get_method_bind("PhysicsServer2D", "space_get_param", 874111783_i64)
      end
      val_0 = space
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_space_get_param, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_space_get_direct_state : Void* = Pointer(Void).null
    def space_get_direct_state(space : Int64) : PhysicsDirectSpaceState2D
      if @@mb_space_get_direct_state.null?
        @@mb_space_get_direct_state = Bridge.get_method_bind("PhysicsServer2D", "space_get_direct_state", 3160173886_i64)
      end
      val_0 = space
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_space_get_direct_state, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      PhysicsDirectSpaceState2D.new(ret_ptr)
    end
    @@mb_area_create : Void* = Pointer(Void).null
    def area_create() : Int64
      if @@mb_area_create.null?
        @@mb_area_create = Bridge.get_method_bind("PhysicsServer2D", "area_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_set_space : Void* = Pointer(Void).null
    def area_set_space(area : Int64, space : Int64) : Void
      if @@mb_area_set_space.null?
        @@mb_area_set_space = Bridge.get_method_bind("PhysicsServer2D", "area_set_space", 395945892_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = space
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_set_space, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_get_space : Void* = Pointer(Void).null
    def area_get_space(area : Int64) : Int64
      if @@mb_area_get_space.null?
        @@mb_area_get_space = Bridge.get_method_bind("PhysicsServer2D", "area_get_space", 3814569979_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_get_space, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_add_shape : Void* = Pointer(Void).null
    def area_add_shape(area : Int64, shape : Int64, transform : Transform2D, disabled : Bool) : Void
      if @@mb_area_add_shape.null?
        @@mb_area_add_shape = Bridge.get_method_bind("PhysicsServer2D", "area_add_shape", 339056240_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = disabled
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_area_add_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_set_shape : Void* = Pointer(Void).null
    def area_set_shape(area : Int64, shape_idx : Int64, shape : Int64) : Void
      if @@mb_area_set_shape.null?
        @@mb_area_set_shape = Bridge.get_method_bind("PhysicsServer2D", "area_set_shape", 2310537182_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = shape
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_area_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_set_shape_transform : Void* = Pointer(Void).null
    def area_set_shape_transform(area : Int64, shape_idx : Int64, transform : Transform2D) : Void
      if @@mb_area_set_shape_transform.null?
        @@mb_area_set_shape_transform = Bridge.get_method_bind("PhysicsServer2D", "area_set_shape_transform", 736082694_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_area_set_shape_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_set_shape_disabled : Void* = Pointer(Void).null
    def area_set_shape_disabled(area : Int64, shape_idx : Int64, disabled : Bool) : Void
      if @@mb_area_set_shape_disabled.null?
        @@mb_area_set_shape_disabled = Bridge.get_method_bind("PhysicsServer2D", "area_set_shape_disabled", 2658558584_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = disabled
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_area_set_shape_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_get_shape_count : Void* = Pointer(Void).null
    def area_get_shape_count(area : Int64) : Int64
      if @@mb_area_get_shape_count.null?
        @@mb_area_get_shape_count = Bridge.get_method_bind("PhysicsServer2D", "area_get_shape_count", 2198884583_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_get_shape_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_get_shape : Void* = Pointer(Void).null
    def area_get_shape(area : Int64, shape_idx : Int64) : Int64
      if @@mb_area_get_shape.null?
        @@mb_area_get_shape = Bridge.get_method_bind("PhysicsServer2D", "area_get_shape", 1066463050_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_get_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_get_shape_transform : Void* = Pointer(Void).null
    def area_get_shape_transform(area : Int64, shape_idx : Int64) : Transform2D
      if @@mb_area_get_shape_transform.null?
        @@mb_area_get_shape_transform = Bridge.get_method_bind("PhysicsServer2D", "area_get_shape_transform", 1324854622_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_area_get_shape_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_area_remove_shape : Void* = Pointer(Void).null
    def area_remove_shape(area : Int64, shape_idx : Int64) : Void
      if @@mb_area_remove_shape.null?
        @@mb_area_remove_shape = Bridge.get_method_bind("PhysicsServer2D", "area_remove_shape", 3411492887_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_remove_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_clear_shapes : Void* = Pointer(Void).null
    def area_clear_shapes(area : Int64) : Void
      if @@mb_area_clear_shapes.null?
        @@mb_area_clear_shapes = Bridge.get_method_bind("PhysicsServer2D", "area_clear_shapes", 2722037293_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_area_clear_shapes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_set_collision_layer : Void* = Pointer(Void).null
    def area_set_collision_layer(area : Int64, layer : Int64) : Void
      if @@mb_area_set_collision_layer.null?
        @@mb_area_set_collision_layer = Bridge.get_method_bind("PhysicsServer2D", "area_set_collision_layer", 3411492887_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layer
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_set_collision_layer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_get_collision_layer : Void* = Pointer(Void).null
    def area_get_collision_layer(area : Int64) : Int64
      if @@mb_area_get_collision_layer.null?
        @@mb_area_get_collision_layer = Bridge.get_method_bind("PhysicsServer2D", "area_get_collision_layer", 2198884583_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_get_collision_layer, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_set_collision_mask : Void* = Pointer(Void).null
    def area_set_collision_mask(area : Int64, mask : Int64) : Void
      if @@mb_area_set_collision_mask.null?
        @@mb_area_set_collision_mask = Bridge.get_method_bind("PhysicsServer2D", "area_set_collision_mask", 3411492887_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_get_collision_mask : Void* = Pointer(Void).null
    def area_get_collision_mask(area : Int64) : Int64
      if @@mb_area_get_collision_mask.null?
        @@mb_area_get_collision_mask = Bridge.get_method_bind("PhysicsServer2D", "area_get_collision_mask", 2198884583_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_get_collision_mask, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_set_param : Void* = Pointer(Void).null
    def area_set_param(area : Int64, param : Int64, value : Void*) : Void
      if @@mb_area_set_param.null?
        @@mb_area_set_param = Bridge.get_method_bind("PhysicsServer2D", "area_set_param", 1257146028_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_area_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_set_transform : Void* = Pointer(Void).null
    def area_set_transform(area : Int64, transform : Transform2D) : Void
      if @@mb_area_set_transform.null?
        @@mb_area_set_transform = Bridge.get_method_bind("PhysicsServer2D", "area_set_transform", 1246044741_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = transform
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_get_param : Void* = Pointer(Void).null
    def area_get_param(area : Int64, param : Int64) : Void*
      if @@mb_area_get_param.null?
        @@mb_area_get_param = Bridge.get_method_bind("PhysicsServer2D", "area_get_param", 3047435120_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_area_get_param, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_area_get_transform : Void* = Pointer(Void).null
    def area_get_transform(area : Int64) : Transform2D
      if @@mb_area_get_transform.null?
        @@mb_area_get_transform = Bridge.get_method_bind("PhysicsServer2D", "area_get_transform", 213527486_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_area_get_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_area_attach_object_instance_id : Void* = Pointer(Void).null
    def area_attach_object_instance_id(area : Int64, id : Int64) : Void
      if @@mb_area_attach_object_instance_id.null?
        @@mb_area_attach_object_instance_id = Bridge.get_method_bind("PhysicsServer2D", "area_attach_object_instance_id", 3411492887_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_attach_object_instance_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_get_object_instance_id : Void* = Pointer(Void).null
    def area_get_object_instance_id(area : Int64) : Int64
      if @@mb_area_get_object_instance_id.null?
        @@mb_area_get_object_instance_id = Bridge.get_method_bind("PhysicsServer2D", "area_get_object_instance_id", 2198884583_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_get_object_instance_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_attach_canvas_instance_id : Void* = Pointer(Void).null
    def area_attach_canvas_instance_id(area : Int64, id : Int64) : Void
      if @@mb_area_attach_canvas_instance_id.null?
        @@mb_area_attach_canvas_instance_id = Bridge.get_method_bind("PhysicsServer2D", "area_attach_canvas_instance_id", 3411492887_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_attach_canvas_instance_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_get_canvas_instance_id : Void* = Pointer(Void).null
    def area_get_canvas_instance_id(area : Int64) : Int64
      if @@mb_area_get_canvas_instance_id.null?
        @@mb_area_get_canvas_instance_id = Bridge.get_method_bind("PhysicsServer2D", "area_get_canvas_instance_id", 2198884583_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_area_get_canvas_instance_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_area_set_monitor_callback : Void* = Pointer(Void).null
    def area_set_monitor_callback(area : Int64, callback : Void*) : Void
      if @@mb_area_set_monitor_callback.null?
        @@mb_area_set_monitor_callback = Bridge.get_method_bind("PhysicsServer2D", "area_set_monitor_callback", 3379118538_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_set_monitor_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_set_area_monitor_callback : Void* = Pointer(Void).null
    def area_set_area_monitor_callback(area : Int64, callback : Void*) : Void
      if @@mb_area_set_area_monitor_callback.null?
        @@mb_area_set_area_monitor_callback = Bridge.get_method_bind("PhysicsServer2D", "area_set_area_monitor_callback", 3379118538_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_set_area_monitor_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_area_set_monitorable : Void* = Pointer(Void).null
    def area_set_monitorable(area : Int64, monitorable : Bool) : Void
      if @@mb_area_set_monitorable.null?
        @@mb_area_set_monitorable = Bridge.get_method_bind("PhysicsServer2D", "area_set_monitorable", 1265174801_i64)
      end
      val_0 = area
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = monitorable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_area_set_monitorable, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_create : Void* = Pointer(Void).null
    def body_create() : Int64
      if @@mb_body_create.null?
        @@mb_body_create = Bridge.get_method_bind("PhysicsServer2D", "body_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_space : Void* = Pointer(Void).null
    def body_set_space(body : Int64, space : Int64) : Void
      if @@mb_body_set_space.null?
        @@mb_body_set_space = Bridge.get_method_bind("PhysicsServer2D", "body_set_space", 395945892_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = space
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_space, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_space : Void* = Pointer(Void).null
    def body_get_space(body : Int64) : Int64
      if @@mb_body_get_space.null?
        @@mb_body_get_space = Bridge.get_method_bind("PhysicsServer2D", "body_get_space", 3814569979_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_space, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_mode : Void* = Pointer(Void).null
    def body_set_mode(body : Int64, mode : Int64) : Void
      if @@mb_body_set_mode.null?
        @@mb_body_set_mode = Bridge.get_method_bind("PhysicsServer2D", "body_set_mode", 1658067650_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_mode : Void* = Pointer(Void).null
    def body_get_mode(body : Int64) : Int64
      if @@mb_body_get_mode.null?
        @@mb_body_get_mode = Bridge.get_method_bind("PhysicsServer2D", "body_get_mode", 3261702585_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_add_shape : Void* = Pointer(Void).null
    def body_add_shape(body : Int64, shape : Int64, transform : Transform2D, disabled : Bool) : Void
      if @@mb_body_add_shape.null?
        @@mb_body_add_shape = Bridge.get_method_bind("PhysicsServer2D", "body_add_shape", 339056240_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = disabled
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_body_add_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_shape : Void* = Pointer(Void).null
    def body_set_shape(body : Int64, shape_idx : Int64, shape : Int64) : Void
      if @@mb_body_set_shape.null?
        @@mb_body_set_shape = Bridge.get_method_bind("PhysicsServer2D", "body_set_shape", 2310537182_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = shape
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_shape_transform : Void* = Pointer(Void).null
    def body_set_shape_transform(body : Int64, shape_idx : Int64, transform : Transform2D) : Void
      if @@mb_body_set_shape_transform.null?
        @@mb_body_set_shape_transform = Bridge.get_method_bind("PhysicsServer2D", "body_set_shape_transform", 736082694_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = transform
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_set_shape_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_shape_count : Void* = Pointer(Void).null
    def body_get_shape_count(body : Int64) : Int64
      if @@mb_body_get_shape_count.null?
        @@mb_body_get_shape_count = Bridge.get_method_bind("PhysicsServer2D", "body_get_shape_count", 2198884583_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_shape_count, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_get_shape : Void* = Pointer(Void).null
    def body_get_shape(body : Int64, shape_idx : Int64) : Int64
      if @@mb_body_get_shape.null?
        @@mb_body_get_shape = Bridge.get_method_bind("PhysicsServer2D", "body_get_shape", 1066463050_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_get_shape_transform : Void* = Pointer(Void).null
    def body_get_shape_transform(body : Int64, shape_idx : Int64) : Transform2D
      if @@mb_body_get_shape_transform.null?
        @@mb_body_get_shape_transform = Bridge.get_method_bind("PhysicsServer2D", "body_get_shape_transform", 1324854622_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_body_get_shape_transform, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_body_remove_shape : Void* = Pointer(Void).null
    def body_remove_shape(body : Int64, shape_idx : Int64) : Void
      if @@mb_body_remove_shape.null?
        @@mb_body_remove_shape = Bridge.get_method_bind("PhysicsServer2D", "body_remove_shape", 3411492887_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_remove_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_clear_shapes : Void* = Pointer(Void).null
    def body_clear_shapes(body : Int64) : Void
      if @@mb_body_clear_shapes.null?
        @@mb_body_clear_shapes = Bridge.get_method_bind("PhysicsServer2D", "body_clear_shapes", 2722037293_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_body_clear_shapes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_shape_disabled : Void* = Pointer(Void).null
    def body_set_shape_disabled(body : Int64, shape_idx : Int64, disabled : Bool) : Void
      if @@mb_body_set_shape_disabled.null?
        @@mb_body_set_shape_disabled = Bridge.get_method_bind("PhysicsServer2D", "body_set_shape_disabled", 2658558584_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = disabled
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_set_shape_disabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_shape_as_one_way_collision : Void* = Pointer(Void).null
    def body_set_shape_as_one_way_collision(body : Int64, shape_idx : Int64, enable : Bool, margin : Float64, direction : Vector2) : Void
      if @@mb_body_set_shape_as_one_way_collision.null?
        @@mb_body_set_shape_as_one_way_collision = Bridge.get_method_bind("PhysicsServer2D", "body_set_shape_as_one_way_collision", 2389283141_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = shape_idx
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = enable
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = margin
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = direction
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_body_set_shape_as_one_way_collision, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_attach_object_instance_id : Void* = Pointer(Void).null
    def body_attach_object_instance_id(body : Int64, id : Int64) : Void
      if @@mb_body_attach_object_instance_id.null?
        @@mb_body_attach_object_instance_id = Bridge.get_method_bind("PhysicsServer2D", "body_attach_object_instance_id", 3411492887_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_attach_object_instance_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_object_instance_id : Void* = Pointer(Void).null
    def body_get_object_instance_id(body : Int64) : Int64
      if @@mb_body_get_object_instance_id.null?
        @@mb_body_get_object_instance_id = Bridge.get_method_bind("PhysicsServer2D", "body_get_object_instance_id", 2198884583_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_object_instance_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_attach_canvas_instance_id : Void* = Pointer(Void).null
    def body_attach_canvas_instance_id(body : Int64, id : Int64) : Void
      if @@mb_body_attach_canvas_instance_id.null?
        @@mb_body_attach_canvas_instance_id = Bridge.get_method_bind("PhysicsServer2D", "body_attach_canvas_instance_id", 3411492887_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = id
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_attach_canvas_instance_id, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_canvas_instance_id : Void* = Pointer(Void).null
    def body_get_canvas_instance_id(body : Int64) : Int64
      if @@mb_body_get_canvas_instance_id.null?
        @@mb_body_get_canvas_instance_id = Bridge.get_method_bind("PhysicsServer2D", "body_get_canvas_instance_id", 2198884583_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_canvas_instance_id, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_continuous_collision_detection_mode : Void* = Pointer(Void).null
    def body_set_continuous_collision_detection_mode(body : Int64, mode : Int64) : Void
      if @@mb_body_set_continuous_collision_detection_mode.null?
        @@mb_body_set_continuous_collision_detection_mode = Bridge.get_method_bind("PhysicsServer2D", "body_set_continuous_collision_detection_mode", 1882257015_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_continuous_collision_detection_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_continuous_collision_detection_mode : Void* = Pointer(Void).null
    def body_get_continuous_collision_detection_mode(body : Int64) : Int64
      if @@mb_body_get_continuous_collision_detection_mode.null?
        @@mb_body_get_continuous_collision_detection_mode = Bridge.get_method_bind("PhysicsServer2D", "body_get_continuous_collision_detection_mode", 2661282217_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_continuous_collision_detection_mode, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_collision_layer : Void* = Pointer(Void).null
    def body_set_collision_layer(body : Int64, layer : Int64) : Void
      if @@mb_body_set_collision_layer.null?
        @@mb_body_set_collision_layer = Bridge.get_method_bind("PhysicsServer2D", "body_set_collision_layer", 3411492887_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = layer
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_collision_layer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_collision_layer : Void* = Pointer(Void).null
    def body_get_collision_layer(body : Int64) : Int64
      if @@mb_body_get_collision_layer.null?
        @@mb_body_get_collision_layer = Bridge.get_method_bind("PhysicsServer2D", "body_get_collision_layer", 2198884583_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_collision_layer, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_collision_mask : Void* = Pointer(Void).null
    def body_set_collision_mask(body : Int64, mask : Int64) : Void
      if @@mb_body_set_collision_mask.null?
        @@mb_body_set_collision_mask = Bridge.get_method_bind("PhysicsServer2D", "body_set_collision_mask", 3411492887_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mask
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_collision_mask : Void* = Pointer(Void).null
    def body_get_collision_mask(body : Int64) : Int64
      if @@mb_body_get_collision_mask.null?
        @@mb_body_get_collision_mask = Bridge.get_method_bind("PhysicsServer2D", "body_get_collision_mask", 2198884583_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_collision_mask, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_collision_priority : Void* = Pointer(Void).null
    def body_set_collision_priority(body : Int64, priority : Float64) : Void
      if @@mb_body_set_collision_priority.null?
        @@mb_body_set_collision_priority = Bridge.get_method_bind("PhysicsServer2D", "body_set_collision_priority", 1794382983_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = priority
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_collision_priority, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_collision_priority : Void* = Pointer(Void).null
    def body_get_collision_priority(body : Int64) : Float64
      if @@mb_body_get_collision_priority.null?
        @@mb_body_get_collision_priority = Bridge.get_method_bind("PhysicsServer2D", "body_get_collision_priority", 866169185_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_body_get_collision_priority, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_param : Void* = Pointer(Void).null
    def body_set_param(body : Int64, param : Int64, value : Void*) : Void
      if @@mb_body_set_param.null?
        @@mb_body_set_param = Bridge.get_method_bind("PhysicsServer2D", "body_set_param", 2715630609_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_param : Void* = Pointer(Void).null
    def body_get_param(body : Int64, param : Int64) : Void*
      if @@mb_body_get_param.null?
        @@mb_body_get_param = Bridge.get_method_bind("PhysicsServer2D", "body_get_param", 3208033526_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_body_get_param, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_body_reset_mass_properties : Void* = Pointer(Void).null
    def body_reset_mass_properties(body : Int64) : Void
      if @@mb_body_reset_mass_properties.null?
        @@mb_body_reset_mass_properties = Bridge.get_method_bind("PhysicsServer2D", "body_reset_mass_properties", 2722037293_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_body_reset_mass_properties, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_state : Void* = Pointer(Void).null
    def body_set_state(body : Int64, state : Int64, value : Void*) : Void
      if @@mb_body_set_state.null?
        @@mb_body_set_state = Bridge.get_method_bind("PhysicsServer2D", "body_set_state", 1706355209_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = state
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_set_state, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_state : Void* = Pointer(Void).null
    def body_get_state(body : Int64, state : Int64) : Void*
      if @@mb_body_get_state.null?
        @@mb_body_get_state = Bridge.get_method_bind("PhysicsServer2D", "body_get_state", 4036367961_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = state
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_body_get_state, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_body_apply_central_impulse : Void* = Pointer(Void).null
    def body_apply_central_impulse(body : Int64, impulse : Vector2) : Void
      if @@mb_body_apply_central_impulse.null?
        @@mb_body_apply_central_impulse = Bridge.get_method_bind("PhysicsServer2D", "body_apply_central_impulse", 3201125042_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = impulse
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_apply_central_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_apply_torque_impulse : Void* = Pointer(Void).null
    def body_apply_torque_impulse(body : Int64, impulse : Float64) : Void
      if @@mb_body_apply_torque_impulse.null?
        @@mb_body_apply_torque_impulse = Bridge.get_method_bind("PhysicsServer2D", "body_apply_torque_impulse", 1794382983_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = impulse
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_apply_torque_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_apply_impulse : Void* = Pointer(Void).null
    def body_apply_impulse(body : Int64, impulse : Vector2, position : Vector2) : Void
      if @@mb_body_apply_impulse.null?
        @@mb_body_apply_impulse = Bridge.get_method_bind("PhysicsServer2D", "body_apply_impulse", 205485391_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = impulse
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = position
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_apply_impulse, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_apply_central_force : Void* = Pointer(Void).null
    def body_apply_central_force(body : Int64, force : Vector2) : Void
      if @@mb_body_apply_central_force.null?
        @@mb_body_apply_central_force = Bridge.get_method_bind("PhysicsServer2D", "body_apply_central_force", 3201125042_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = force
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_apply_central_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_apply_force : Void* = Pointer(Void).null
    def body_apply_force(body : Int64, force : Vector2, position : Vector2) : Void
      if @@mb_body_apply_force.null?
        @@mb_body_apply_force = Bridge.get_method_bind("PhysicsServer2D", "body_apply_force", 205485391_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = force
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = position
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_apply_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_apply_torque : Void* = Pointer(Void).null
    def body_apply_torque(body : Int64, torque : Float64) : Void
      if @@mb_body_apply_torque.null?
        @@mb_body_apply_torque = Bridge.get_method_bind("PhysicsServer2D", "body_apply_torque", 1794382983_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = torque
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_apply_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_add_constant_central_force : Void* = Pointer(Void).null
    def body_add_constant_central_force(body : Int64, force : Vector2) : Void
      if @@mb_body_add_constant_central_force.null?
        @@mb_body_add_constant_central_force = Bridge.get_method_bind("PhysicsServer2D", "body_add_constant_central_force", 3201125042_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = force
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_add_constant_central_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_add_constant_force : Void* = Pointer(Void).null
    def body_add_constant_force(body : Int64, force : Vector2, position : Vector2) : Void
      if @@mb_body_add_constant_force.null?
        @@mb_body_add_constant_force = Bridge.get_method_bind("PhysicsServer2D", "body_add_constant_force", 205485391_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = force
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = position
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_add_constant_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_add_constant_torque : Void* = Pointer(Void).null
    def body_add_constant_torque(body : Int64, torque : Float64) : Void
      if @@mb_body_add_constant_torque.null?
        @@mb_body_add_constant_torque = Bridge.get_method_bind("PhysicsServer2D", "body_add_constant_torque", 1794382983_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = torque
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_add_constant_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_constant_force : Void* = Pointer(Void).null
    def body_set_constant_force(body : Int64, force : Vector2) : Void
      if @@mb_body_set_constant_force.null?
        @@mb_body_set_constant_force = Bridge.get_method_bind("PhysicsServer2D", "body_set_constant_force", 3201125042_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = force
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_constant_force, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_constant_force : Void* = Pointer(Void).null
    def body_get_constant_force(body : Int64) : Vector2
      if @@mb_body_get_constant_force.null?
        @@mb_body_get_constant_force = Bridge.get_method_bind("PhysicsServer2D", "body_get_constant_force", 2440833711_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_body_get_constant_force, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_constant_torque : Void* = Pointer(Void).null
    def body_set_constant_torque(body : Int64, torque : Float64) : Void
      if @@mb_body_set_constant_torque.null?
        @@mb_body_set_constant_torque = Bridge.get_method_bind("PhysicsServer2D", "body_set_constant_torque", 1794382983_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = torque
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_constant_torque, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_constant_torque : Void* = Pointer(Void).null
    def body_get_constant_torque(body : Int64) : Float64
      if @@mb_body_get_constant_torque.null?
        @@mb_body_get_constant_torque = Bridge.get_method_bind("PhysicsServer2D", "body_get_constant_torque", 866169185_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_body_get_constant_torque, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_axis_velocity : Void* = Pointer(Void).null
    def body_set_axis_velocity(body : Int64, axis_velocity : Vector2) : Void
      if @@mb_body_set_axis_velocity.null?
        @@mb_body_set_axis_velocity = Bridge.get_method_bind("PhysicsServer2D", "body_set_axis_velocity", 3201125042_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = axis_velocity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_axis_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_add_collision_exception : Void* = Pointer(Void).null
    def body_add_collision_exception(body : Int64, excepted_body : Int64) : Void
      if @@mb_body_add_collision_exception.null?
        @@mb_body_add_collision_exception = Bridge.get_method_bind("PhysicsServer2D", "body_add_collision_exception", 395945892_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = excepted_body
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_add_collision_exception, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_remove_collision_exception : Void* = Pointer(Void).null
    def body_remove_collision_exception(body : Int64, excepted_body : Int64) : Void
      if @@mb_body_remove_collision_exception.null?
        @@mb_body_remove_collision_exception = Bridge.get_method_bind("PhysicsServer2D", "body_remove_collision_exception", 395945892_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = excepted_body
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_remove_collision_exception, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_max_contacts_reported : Void* = Pointer(Void).null
    def body_set_max_contacts_reported(body : Int64, amount : Int64) : Void
      if @@mb_body_set_max_contacts_reported.null?
        @@mb_body_set_max_contacts_reported = Bridge.get_method_bind("PhysicsServer2D", "body_set_max_contacts_reported", 3411492887_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = amount
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_max_contacts_reported, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_get_max_contacts_reported : Void* = Pointer(Void).null
    def body_get_max_contacts_reported(body : Int64) : Int64
      if @@mb_body_get_max_contacts_reported.null?
        @@mb_body_get_max_contacts_reported = Bridge.get_method_bind("PhysicsServer2D", "body_get_max_contacts_reported", 2198884583_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_body_get_max_contacts_reported, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_body_set_omit_force_integration : Void* = Pointer(Void).null
    def body_set_omit_force_integration(body : Int64, enable : Bool) : Void
      if @@mb_body_set_omit_force_integration.null?
        @@mb_body_set_omit_force_integration = Bridge.get_method_bind("PhysicsServer2D", "body_set_omit_force_integration", 1265174801_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_omit_force_integration, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_is_omitting_force_integration : Void* = Pointer(Void).null
    def body_is_omitting_force_integration(body : Int64) : Bool
      if @@mb_body_is_omitting_force_integration.null?
        @@mb_body_is_omitting_force_integration = Bridge.get_method_bind("PhysicsServer2D", "body_is_omitting_force_integration", 4155700596_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_body_is_omitting_force_integration, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_body_set_state_sync_callback : Void* = Pointer(Void).null
    def body_set_state_sync_callback(body : Int64, callable : Void*) : Void
      if @@mb_body_set_state_sync_callback.null?
        @@mb_body_set_state_sync_callback = Bridge.get_method_bind("PhysicsServer2D", "body_set_state_sync_callback", 3379118538_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_body_set_state_sync_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_set_force_integration_callback : Void* = Pointer(Void).null
    def body_set_force_integration_callback(body : Int64, callable : Void*, userdata : Void*) : Void
      if @@mb_body_set_force_integration_callback.null?
        @@mb_body_set_force_integration_callback = Bridge.get_method_bind("PhysicsServer2D", "body_set_force_integration_callback", 3059434249_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callable
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = userdata
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_body_set_force_integration_callback, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_body_test_motion : Void* = Pointer(Void).null
    def body_test_motion(body : Int64, parameters : PhysicsTestMotionParameters2D, result : PhysicsTestMotionResult2D) : Bool
      if @@mb_body_test_motion.null?
        @@mb_body_test_motion = Bridge.get_method_bind("PhysicsServer2D", "body_test_motion", 1699844009_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = parameters
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = result
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      ret = 0_u8
      Bridge.ptrcall(@@mb_body_test_motion, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_body_get_direct_state : Void* = Pointer(Void).null
    def body_get_direct_state(body : Int64) : PhysicsDirectBodyState2D
      if @@mb_body_get_direct_state.null?
        @@mb_body_get_direct_state = Bridge.get_method_bind("PhysicsServer2D", "body_get_direct_state", 1191931871_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_body_get_direct_state, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      PhysicsDirectBodyState2D.new(ret_ptr)
    end
    @@mb_joint_create : Void* = Pointer(Void).null
    def joint_create() : Int64
      if @@mb_joint_create.null?
        @@mb_joint_create = Bridge.get_method_bind("PhysicsServer2D", "joint_create", 529393457_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_joint_create, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_joint_clear : Void* = Pointer(Void).null
    def joint_clear(joint : Int64) : Void
      if @@mb_joint_clear.null?
        @@mb_joint_clear = Bridge.get_method_bind("PhysicsServer2D", "joint_clear", 2722037293_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_joint_clear, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_joint_set_param : Void* = Pointer(Void).null
    def joint_set_param(joint : Int64, param : Int64, value : Float64) : Void
      if @@mb_joint_set_param.null?
        @@mb_joint_set_param = Bridge.get_method_bind("PhysicsServer2D", "joint_set_param", 3972556514_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_joint_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_joint_get_param : Void* = Pointer(Void).null
    def joint_get_param(joint : Int64, param : Int64) : Float64
      if @@mb_joint_get_param.null?
        @@mb_joint_get_param = Bridge.get_method_bind("PhysicsServer2D", "joint_get_param", 4016448949_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_joint_get_param, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_joint_disable_collisions_between_bodies : Void* = Pointer(Void).null
    def joint_disable_collisions_between_bodies(joint : Int64, disable : Bool) : Void
      if @@mb_joint_disable_collisions_between_bodies.null?
        @@mb_joint_disable_collisions_between_bodies = Bridge.get_method_bind("PhysicsServer2D", "joint_disable_collisions_between_bodies", 1265174801_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = disable
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_joint_disable_collisions_between_bodies, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_joint_is_disabled_collisions_between_bodies : Void* = Pointer(Void).null
    def joint_is_disabled_collisions_between_bodies(joint : Int64) : Bool
      if @@mb_joint_is_disabled_collisions_between_bodies.null?
        @@mb_joint_is_disabled_collisions_between_bodies = Bridge.get_method_bind("PhysicsServer2D", "joint_is_disabled_collisions_between_bodies", 4155700596_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_joint_is_disabled_collisions_between_bodies, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_joint_make_pin : Void* = Pointer(Void).null
    def joint_make_pin(joint : Int64, anchor : Vector2, body_a : Int64, body_b : Int64) : Void
      if @@mb_joint_make_pin.null?
        @@mb_joint_make_pin = Bridge.get_method_bind("PhysicsServer2D", "joint_make_pin", 1612646186_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = anchor
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = body_a
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = body_b
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_joint_make_pin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_joint_make_groove : Void* = Pointer(Void).null
    def joint_make_groove(joint : Int64, groove1_a : Vector2, groove2_a : Vector2, anchor_b : Vector2, body_a : Int64, body_b : Int64) : Void
      if @@mb_joint_make_groove.null?
        @@mb_joint_make_groove = Bridge.get_method_bind("PhysicsServer2D", "joint_make_groove", 481430435_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = groove1_a
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = groove2_a
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = anchor_b
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = body_a
      arg_4 = pointerof(val_4).as(Void*)
      val_5 = body_b
      arg_5 = pointerof(val_5).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4, arg_5]
      Bridge.ptrcall(@@mb_joint_make_groove, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_joint_make_damped_spring : Void* = Pointer(Void).null
    def joint_make_damped_spring(joint : Int64, anchor_a : Vector2, anchor_b : Vector2, body_a : Int64, body_b : Int64) : Void
      if @@mb_joint_make_damped_spring.null?
        @@mb_joint_make_damped_spring = Bridge.get_method_bind("PhysicsServer2D", "joint_make_damped_spring", 1994657646_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = anchor_a
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = anchor_b
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = body_a
      arg_3 = pointerof(val_3).as(Void*)
      val_4 = body_b
      arg_4 = pointerof(val_4).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3, arg_4]
      Bridge.ptrcall(@@mb_joint_make_damped_spring, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_pin_joint_set_flag : Void* = Pointer(Void).null
    def pin_joint_set_flag(joint : Int64, flag : Int64, enabled : Bool) : Void
      if @@mb_pin_joint_set_flag.null?
        @@mb_pin_joint_set_flag = Bridge.get_method_bind("PhysicsServer2D", "pin_joint_set_flag", 3520002352_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flag
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = enabled
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_pin_joint_set_flag, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_pin_joint_get_flag : Void* = Pointer(Void).null
    def pin_joint_get_flag(joint : Int64, flag : Int64) : Bool
      if @@mb_pin_joint_get_flag.null?
        @@mb_pin_joint_get_flag = Bridge.get_method_bind("PhysicsServer2D", "pin_joint_get_flag", 2647867364_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = flag
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0_u8
      Bridge.ptrcall(@@mb_pin_joint_get_flag, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_pin_joint_set_param : Void* = Pointer(Void).null
    def pin_joint_set_param(joint : Int64, param : Int64, value : Float64) : Void
      if @@mb_pin_joint_set_param.null?
        @@mb_pin_joint_set_param = Bridge.get_method_bind("PhysicsServer2D", "pin_joint_set_param", 550574241_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_pin_joint_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_pin_joint_get_param : Void* = Pointer(Void).null
    def pin_joint_get_param(joint : Int64, param : Int64) : Float64
      if @@mb_pin_joint_get_param.null?
        @@mb_pin_joint_get_param = Bridge.get_method_bind("PhysicsServer2D", "pin_joint_get_param", 348281383_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_pin_joint_get_param, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_damped_spring_joint_set_param : Void* = Pointer(Void).null
    def damped_spring_joint_set_param(joint : Int64, param : Int64, value : Float64) : Void
      if @@mb_damped_spring_joint_set_param.null?
        @@mb_damped_spring_joint_set_param = Bridge.get_method_bind("PhysicsServer2D", "damped_spring_joint_set_param", 220564071_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = value
      arg_2 = pointerof(val_2).as(Void*)
      args = [arg_0, arg_1, arg_2]
      Bridge.ptrcall(@@mb_damped_spring_joint_set_param, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_damped_spring_joint_get_param : Void* = Pointer(Void).null
    def damped_spring_joint_get_param(joint : Int64, param : Int64) : Float64
      if @@mb_damped_spring_joint_get_param.null?
        @@mb_damped_spring_joint_get_param = Bridge.get_method_bind("PhysicsServer2D", "damped_spring_joint_get_param", 2075871277_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = param
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_damped_spring_joint_get_param, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_joint_get_type : Void* = Pointer(Void).null
    def joint_get_type(joint : Int64) : Int64
      if @@mb_joint_get_type.null?
        @@mb_joint_get_type = Bridge.get_method_bind("PhysicsServer2D", "joint_get_type", 4262502231_i64)
      end
      val_0 = joint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_joint_get_type, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_free_rid : Void* = Pointer(Void).null
    def free_rid(rid : Int64) : Void
      if @@mb_free_rid.null?
        @@mb_free_rid = Bridge.get_method_bind("PhysicsServer2D", "free_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_free_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_active : Void* = Pointer(Void).null
    def set_active(active : Bool) : Void
      if @@mb_set_active.null?
        @@mb_set_active = Bridge.get_method_bind("PhysicsServer2D", "set_active", 2586408642_i64)
      end
      val_0 = active
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_active, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_process_info : Void* = Pointer(Void).null
    def get_process_info(process_info : Int64) : Int64
      if @@mb_get_process_info.null?
        @@mb_get_process_info = Bridge.get_method_bind("PhysicsServer2D", "get_process_info", 576496006_i64)
      end
      val_0 = process_info
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_process_info, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  class PhysicsServer2DExtension < Godot::PhysicsServer2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_body_test_motion_is_excluding_body : Void* = Pointer(Void).null
    def body_test_motion_is_excluding_body(body : Int64) : Bool
      if @@mb_body_test_motion_is_excluding_body.null?
        @@mb_body_test_motion_is_excluding_body = Bridge.get_method_bind("PhysicsServer2DExtension", "body_test_motion_is_excluding_body", 4155700596_i64)
      end
      val_0 = body
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_body_test_motion_is_excluding_body, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_body_test_motion_is_excluding_object : Void* = Pointer(Void).null
    def body_test_motion_is_excluding_object(object : Int64) : Bool
      if @@mb_body_test_motion_is_excluding_object.null?
        @@mb_body_test_motion_is_excluding_object = Bridge.get_method_bind("PhysicsServer2DExtension", "body_test_motion_is_excluding_object", 1116898809_i64)
      end
      val_0 = object
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_body_test_motion_is_excluding_object, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class PhysicsServer2DManager < Godot::Object
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_register_server : Void* = Pointer(Void).null
    def register_server(name : String, create_callback : Void*) : Void
      if @@mb_register_server.null?
        @@mb_register_server = Bridge.get_method_bind("PhysicsServer2DManager", "register_server", 2137474292_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = create_callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_register_server, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_default_server : Void* = Pointer(Void).null
    def set_default_server(name : String, priority : Int64) : Void
      if @@mb_set_default_server.null?
        @@mb_set_default_server = Bridge.get_method_bind("PhysicsServer2DManager", "set_default_server", 2956805083_i64)
      end
      val_0 = name
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = priority
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_default_server, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class PhysicsShapeQueryParameters2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_shape : Void* = Pointer(Void).null
    def set_shape(shape : Resource) : Void
      if @@mb_set_shape.null?
        @@mb_set_shape = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_shape", 968641751_i64)
      end
      arg_ptr_0 = shape ? shape.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shape : Void* = Pointer(Void).null
    def get_shape() : Resource
      if @@mb_get_shape.null?
        @@mb_get_shape = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "get_shape", 121922552_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Resource.new(ret_ptr)
    end
    @@mb_set_shape_rid : Void* = Pointer(Void).null
    def set_shape_rid(shape : Int64) : Void
      if @@mb_set_shape_rid.null?
        @@mb_set_shape_rid = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_shape_rid", 2722037293_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shape_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shape_rid : Void* = Pointer(Void).null
    def get_shape_rid() : Int64
      if @@mb_get_shape_rid.null?
        @@mb_get_shape_rid = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "get_shape_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_shape_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_transform : Void* = Pointer(Void).null
    def set_transform(transform : Transform2D) : Void
      if @@mb_set_transform.null?
        @@mb_set_transform = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_transform", 2761652528_i64)
      end
      val_0 = transform
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_transform, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_transform : Void* = Pointer(Void).null
    def get_transform() : Transform2D
      if @@mb_get_transform.null?
        @@mb_get_transform = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "get_transform", 3814499831_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_transform, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_set_motion : Void* = Pointer(Void).null
    def set_motion(motion : Vector2) : Void
      if @@mb_set_motion.null?
        @@mb_set_motion = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_motion", 743155724_i64)
      end
      val_0 = motion
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_motion, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_motion : Void* = Pointer(Void).null
    def get_motion() : Vector2
      if @@mb_get_motion.null?
        @@mb_get_motion = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "get_motion", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_motion, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_margin : Void* = Pointer(Void).null
    def set_margin(margin : Float64) : Void
      if @@mb_set_margin.null?
        @@mb_set_margin = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_margin", 373806689_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_margin : Void* = Pointer(Void).null
    def get_margin() : Float64
      if @@mb_get_margin.null?
        @@mb_get_margin = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "get_margin", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_margin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(collision_mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_collision_mask", 1286410249_i64)
      end
      val_0 = collision_mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_exclude : Void* = Pointer(Void).null
    def set_exclude(exclude : Godot::Array) : Void
      if @@mb_set_exclude.null?
        @@mb_set_exclude = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_exclude", 381264803_i64)
      end
      arg_ptr_0 = exclude ? exclude.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude : Void* = Pointer(Void).null
    def get_exclude() : Godot::Array
      if @@mb_get_exclude.null?
        @@mb_get_exclude = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "get_exclude", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_exclude, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_collide_with_bodies : Void* = Pointer(Void).null
    def set_collide_with_bodies(enable : Bool) : Void
      if @@mb_set_collide_with_bodies.null?
        @@mb_set_collide_with_bodies = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_collide_with_bodies", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_bodies, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_bodies_enabled : Void* = Pointer(Void).null
    def is_collide_with_bodies_enabled() : Bool
      if @@mb_is_collide_with_bodies_enabled.null?
        @@mb_is_collide_with_bodies_enabled = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "is_collide_with_bodies_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_bodies_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_with_areas : Void* = Pointer(Void).null
    def set_collide_with_areas(enable : Bool) : Void
      if @@mb_set_collide_with_areas.null?
        @@mb_set_collide_with_areas = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "set_collide_with_areas", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_areas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_areas_enabled : Void* = Pointer(Void).null
    def is_collide_with_areas_enabled() : Bool
      if @@mb_is_collide_with_areas_enabled.null?
        @@mb_is_collide_with_areas_enabled = Bridge.get_method_bind("PhysicsShapeQueryParameters2D", "is_collide_with_areas_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_areas_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class PhysicsTestMotionParameters2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_from : Void* = Pointer(Void).null
    def get_from() : Transform2D
      if @@mb_get_from.null?
        @@mb_get_from = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "get_from", 3814499831_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_from, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
    @@mb_set_from : Void* = Pointer(Void).null
    def set_from(from : Transform2D) : Void
      if @@mb_set_from.null?
        @@mb_set_from = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "set_from", 2761652528_i64)
      end
      val_0 = from
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_from, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_motion : Void* = Pointer(Void).null
    def get_motion() : Vector2
      if @@mb_get_motion.null?
        @@mb_get_motion = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "get_motion", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_motion, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_motion : Void* = Pointer(Void).null
    def set_motion(motion : Vector2) : Void
      if @@mb_set_motion.null?
        @@mb_set_motion = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "set_motion", 743155724_i64)
      end
      val_0 = motion
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_motion, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_margin : Void* = Pointer(Void).null
    def get_margin() : Float64
      if @@mb_get_margin.null?
        @@mb_get_margin = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "get_margin", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_margin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_margin : Void* = Pointer(Void).null
    def set_margin(margin : Float64) : Void
      if @@mb_set_margin.null?
        @@mb_set_margin = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "set_margin", 373806689_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_separation_ray_enabled : Void* = Pointer(Void).null
    def is_collide_separation_ray_enabled() : Bool
      if @@mb_is_collide_separation_ray_enabled.null?
        @@mb_is_collide_separation_ray_enabled = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "is_collide_separation_ray_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_separation_ray_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_separation_ray_enabled : Void* = Pointer(Void).null
    def set_collide_separation_ray_enabled(enabled : Bool) : Void
      if @@mb_set_collide_separation_ray_enabled.null?
        @@mb_set_collide_separation_ray_enabled = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "set_collide_separation_ray_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_separation_ray_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude_bodies : Void* = Pointer(Void).null
    def get_exclude_bodies() : Godot::Array
      if @@mb_get_exclude_bodies.null?
        @@mb_get_exclude_bodies = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "get_exclude_bodies", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_exclude_bodies, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_exclude_bodies : Void* = Pointer(Void).null
    def set_exclude_bodies(exclude_list : Godot::Array) : Void
      if @@mb_set_exclude_bodies.null?
        @@mb_set_exclude_bodies = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "set_exclude_bodies", 381264803_i64)
      end
      arg_ptr_0 = exclude_list ? exclude_list.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude_bodies, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude_objects : Void* = Pointer(Void).null
    def get_exclude_objects() : Godot::Array
      if @@mb_get_exclude_objects.null?
        @@mb_get_exclude_objects = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "get_exclude_objects", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_exclude_objects, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_exclude_objects : Void* = Pointer(Void).null
    def set_exclude_objects(exclude_list : Godot::Array) : Void
      if @@mb_set_exclude_objects.null?
        @@mb_set_exclude_objects = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "set_exclude_objects", 381264803_i64)
      end
      arg_ptr_0 = exclude_list ? exclude_list.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude_objects, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_recovery_as_collision_enabled : Void* = Pointer(Void).null
    def is_recovery_as_collision_enabled() : Bool
      if @@mb_is_recovery_as_collision_enabled.null?
        @@mb_is_recovery_as_collision_enabled = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "is_recovery_as_collision_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_recovery_as_collision_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_recovery_as_collision_enabled : Void* = Pointer(Void).null
    def set_recovery_as_collision_enabled(enabled : Bool) : Void
      if @@mb_set_recovery_as_collision_enabled.null?
        @@mb_set_recovery_as_collision_enabled = Bridge.get_method_bind("PhysicsTestMotionParameters2D", "set_recovery_as_collision_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_recovery_as_collision_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class PhysicsTestMotionResult2D < Godot::RefCounted
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_travel : Void* = Pointer(Void).null
    def get_travel() : Vector2
      if @@mb_get_travel.null?
        @@mb_get_travel = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_travel", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_travel, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_remainder : Void* = Pointer(Void).null
    def get_remainder() : Vector2
      if @@mb_get_remainder.null?
        @@mb_get_remainder = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_remainder", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_remainder, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_point : Void* = Pointer(Void).null
    def get_collision_point() : Vector2
      if @@mb_get_collision_point.null?
        @@mb_get_collision_point = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collision_point", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collision_point, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_normal : Void* = Pointer(Void).null
    def get_collision_normal() : Vector2
      if @@mb_get_collision_normal.null?
        @@mb_get_collision_normal = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collision_normal", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collision_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_velocity : Void* = Pointer(Void).null
    def get_collider_velocity() : Vector2
      if @@mb_get_collider_velocity.null?
        @@mb_get_collider_velocity = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collider_velocity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collider_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_id : Void* = Pointer(Void).null
    def get_collider_id() : Int64
      if @@mb_get_collider_id.null?
        @@mb_get_collider_id = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collider_id", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_id, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_rid : Void* = Pointer(Void).null
    def get_collider_rid() : Int64
      if @@mb_get_collider_rid.null?
        @@mb_get_collider_rid = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collider_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider : Void* = Pointer(Void).null
    def get_collider() : Godot::Object
      if @@mb_get_collider.null?
        @@mb_get_collider = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collider", 1981248198_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_collider, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_get_collider_shape : Void* = Pointer(Void).null
    def get_collider_shape() : Int64
      if @@mb_get_collider_shape.null?
        @@mb_get_collider_shape = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collider_shape", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_local_shape : Void* = Pointer(Void).null
    def get_collision_local_shape() : Int64
      if @@mb_get_collision_local_shape.null?
        @@mb_get_collision_local_shape = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collision_local_shape", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_local_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_depth : Void* = Pointer(Void).null
    def get_collision_depth() : Float64
      if @@mb_get_collision_depth.null?
        @@mb_get_collision_depth = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collision_depth", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_collision_depth, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_safe_fraction : Void* = Pointer(Void).null
    def get_collision_safe_fraction() : Float64
      if @@mb_get_collision_safe_fraction.null?
        @@mb_get_collision_safe_fraction = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collision_safe_fraction", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_collision_safe_fraction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_unsafe_fraction : Void* = Pointer(Void).null
    def get_collision_unsafe_fraction() : Float64
      if @@mb_get_collision_unsafe_fraction.null?
        @@mb_get_collision_unsafe_fraction = Bridge.get_method_bind("PhysicsTestMotionResult2D", "get_collision_unsafe_fraction", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_collision_unsafe_fraction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class PinJoint2D < Godot::Joint2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_softness : Void* = Pointer(Void).null
    def set_softness(softness : Float64) : Void
      if @@mb_set_softness.null?
        @@mb_set_softness = Bridge.get_method_bind("PinJoint2D", "set_softness", 373806689_i64)
      end
      val_0 = softness
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_softness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_softness : Void* = Pointer(Void).null
    def get_softness() : Float64
      if @@mb_get_softness.null?
        @@mb_get_softness = Bridge.get_method_bind("PinJoint2D", "get_softness", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_softness, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_limit_lower : Void* = Pointer(Void).null
    def set_angular_limit_lower(angular_limit_lower : Float64) : Void
      if @@mb_set_angular_limit_lower.null?
        @@mb_set_angular_limit_lower = Bridge.get_method_bind("PinJoint2D", "set_angular_limit_lower", 373806689_i64)
      end
      val_0 = angular_limit_lower
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_limit_lower, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_limit_lower : Void* = Pointer(Void).null
    def get_angular_limit_lower() : Float64
      if @@mb_get_angular_limit_lower.null?
        @@mb_get_angular_limit_lower = Bridge.get_method_bind("PinJoint2D", "get_angular_limit_lower", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angular_limit_lower, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_angular_limit_upper : Void* = Pointer(Void).null
    def set_angular_limit_upper(angular_limit_upper : Float64) : Void
      if @@mb_set_angular_limit_upper.null?
        @@mb_set_angular_limit_upper = Bridge.get_method_bind("PinJoint2D", "set_angular_limit_upper", 373806689_i64)
      end
      val_0 = angular_limit_upper
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_limit_upper, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_angular_limit_upper : Void* = Pointer(Void).null
    def get_angular_limit_upper() : Float64
      if @@mb_get_angular_limit_upper.null?
        @@mb_get_angular_limit_upper = Bridge.get_method_bind("PinJoint2D", "get_angular_limit_upper", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_angular_limit_upper, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_motor_target_velocity : Void* = Pointer(Void).null
    def set_motor_target_velocity(motor_target_velocity : Float64) : Void
      if @@mb_set_motor_target_velocity.null?
        @@mb_set_motor_target_velocity = Bridge.get_method_bind("PinJoint2D", "set_motor_target_velocity", 373806689_i64)
      end
      val_0 = motor_target_velocity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_motor_target_velocity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_motor_target_velocity : Void* = Pointer(Void).null
    def get_motor_target_velocity() : Float64
      if @@mb_get_motor_target_velocity.null?
        @@mb_get_motor_target_velocity = Bridge.get_method_bind("PinJoint2D", "get_motor_target_velocity", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_motor_target_velocity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_motor_enabled : Void* = Pointer(Void).null
    def set_motor_enabled(enabled : Bool) : Void
      if @@mb_set_motor_enabled.null?
        @@mb_set_motor_enabled = Bridge.get_method_bind("PinJoint2D", "set_motor_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_motor_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_motor_enabled : Void* = Pointer(Void).null
    def is_motor_enabled() : Bool
      if @@mb_is_motor_enabled.null?
        @@mb_is_motor_enabled = Bridge.get_method_bind("PinJoint2D", "is_motor_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_motor_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_angular_limit_enabled : Void* = Pointer(Void).null
    def set_angular_limit_enabled(enabled : Bool) : Void
      if @@mb_set_angular_limit_enabled.null?
        @@mb_set_angular_limit_enabled = Bridge.get_method_bind("PinJoint2D", "set_angular_limit_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_angular_limit_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_angular_limit_enabled : Void* = Pointer(Void).null
    def is_angular_limit_enabled() : Bool
      if @@mb_is_angular_limit_enabled.null?
        @@mb_is_angular_limit_enabled = Bridge.get_method_bind("PinJoint2D", "is_angular_limit_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_angular_limit_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class PlaceholderTexture2D < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_size : Void* = Pointer(Void).null
    def set_size(size : Vector2) : Void
      if @@mb_set_size.null?
        @@mb_set_size = Bridge.get_method_bind("PlaceholderTexture2D", "set_size", 743155724_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class PlaceholderTexture2DArray < Godot::PlaceholderTextureLayered
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class PointLight2D < Godot::Light2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("PointLight2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("PointLight2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_texture_offset : Void* = Pointer(Void).null
    def set_texture_offset(texture_offset : Vector2) : Void
      if @@mb_set_texture_offset.null?
        @@mb_set_texture_offset = Bridge.get_method_bind("PointLight2D", "set_texture_offset", 743155724_i64)
      end
      val_0 = texture_offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_offset : Void* = Pointer(Void).null
    def get_texture_offset() : Vector2
      if @@mb_get_texture_offset.null?
        @@mb_get_texture_offset = Bridge.get_method_bind("PointLight2D", "get_texture_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_texture_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture_scale : Void* = Pointer(Void).null
    def set_texture_scale(texture_scale : Float64) : Void
      if @@mb_set_texture_scale.null?
        @@mb_set_texture_scale = Bridge.get_method_bind("PointLight2D", "set_texture_scale", 373806689_i64)
      end
      val_0 = texture_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_scale : Void* = Pointer(Void).null
    def get_texture_scale() : Float64
      if @@mb_get_texture_scale.null?
        @@mb_get_texture_scale = Bridge.get_method_bind("PointLight2D", "get_texture_scale", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_texture_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class Polygon2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_polygon : Void* = Pointer(Void).null
    def set_polygon(polygon : Void*) : Void
      if @@mb_set_polygon.null?
        @@mb_set_polygon = Bridge.get_method_bind("Polygon2D", "set_polygon", 1509147220_i64)
      end
      val_0 = polygon
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_polygon, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_polygon : Void* = Pointer(Void).null
    def get_polygon() : Void*
      if @@mb_get_polygon.null?
        @@mb_get_polygon = Bridge.get_method_bind("Polygon2D", "get_polygon", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_polygon, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_uv : Void* = Pointer(Void).null
    def set_uv(uv : Void*) : Void
      if @@mb_set_uv.null?
        @@mb_set_uv = Bridge.get_method_bind("Polygon2D", "set_uv", 1509147220_i64)
      end
      val_0 = uv
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_uv, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_uv : Void* = Pointer(Void).null
    def get_uv() : Void*
      if @@mb_get_uv.null?
        @@mb_get_uv = Bridge.get_method_bind("Polygon2D", "get_uv", 2961356807_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_uv, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_color : Void* = Pointer(Void).null
    def set_color(color : Color) : Void
      if @@mb_set_color.null?
        @@mb_set_color = Bridge.get_method_bind("Polygon2D", "set_color", 2920490490_i64)
      end
      val_0 = color
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_color, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_color : Void* = Pointer(Void).null
    def get_color() : Color
      if @@mb_get_color.null?
        @@mb_get_color = Bridge.get_method_bind("Polygon2D", "get_color", 3444240500_i64)
      end
      ret = Color.new
      Bridge.ptrcall(@@mb_get_color, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_polygons : Void* = Pointer(Void).null
    def set_polygons(polygons : Godot::Array) : Void
      if @@mb_set_polygons.null?
        @@mb_set_polygons = Bridge.get_method_bind("Polygon2D", "set_polygons", 381264803_i64)
      end
      arg_ptr_0 = polygons ? polygons.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_polygons, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_polygons : Void* = Pointer(Void).null
    def get_polygons() : Godot::Array
      if @@mb_get_polygons.null?
        @@mb_get_polygons = Bridge.get_method_bind("Polygon2D", "get_polygons", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_polygons, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
    @@mb_set_vertex_colors : Void* = Pointer(Void).null
    def set_vertex_colors(vertex_colors : Void*) : Void
      if @@mb_set_vertex_colors.null?
        @@mb_set_vertex_colors = Bridge.get_method_bind("Polygon2D", "set_vertex_colors", 3546319833_i64)
      end
      val_0 = vertex_colors
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vertex_colors, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vertex_colors : Void* = Pointer(Void).null
    def get_vertex_colors() : Void*
      if @@mb_get_vertex_colors.null?
        @@mb_get_vertex_colors = Bridge.get_method_bind("Polygon2D", "get_vertex_colors", 1392750486_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_vertex_colors, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("Polygon2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("Polygon2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_texture_offset : Void* = Pointer(Void).null
    def set_texture_offset(texture_offset : Vector2) : Void
      if @@mb_set_texture_offset.null?
        @@mb_set_texture_offset = Bridge.get_method_bind("Polygon2D", "set_texture_offset", 743155724_i64)
      end
      val_0 = texture_offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_offset : Void* = Pointer(Void).null
    def get_texture_offset() : Vector2
      if @@mb_get_texture_offset.null?
        @@mb_get_texture_offset = Bridge.get_method_bind("Polygon2D", "get_texture_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_texture_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture_rotation : Void* = Pointer(Void).null
    def set_texture_rotation(texture_rotation : Float64) : Void
      if @@mb_set_texture_rotation.null?
        @@mb_set_texture_rotation = Bridge.get_method_bind("Polygon2D", "set_texture_rotation", 373806689_i64)
      end
      val_0 = texture_rotation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_rotation : Void* = Pointer(Void).null
    def get_texture_rotation() : Float64
      if @@mb_get_texture_rotation.null?
        @@mb_get_texture_rotation = Bridge.get_method_bind("Polygon2D", "get_texture_rotation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_texture_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_texture_scale : Void* = Pointer(Void).null
    def set_texture_scale(texture_scale : Vector2) : Void
      if @@mb_set_texture_scale.null?
        @@mb_set_texture_scale = Bridge.get_method_bind("Polygon2D", "set_texture_scale", 743155724_i64)
      end
      val_0 = texture_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_scale : Void* = Pointer(Void).null
    def get_texture_scale() : Vector2
      if @@mb_get_texture_scale.null?
        @@mb_get_texture_scale = Bridge.get_method_bind("Polygon2D", "get_texture_scale", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_texture_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_invert_enabled : Void* = Pointer(Void).null
    def set_invert_enabled(invert : Bool) : Void
      if @@mb_set_invert_enabled.null?
        @@mb_set_invert_enabled = Bridge.get_method_bind("Polygon2D", "set_invert_enabled", 2586408642_i64)
      end
      val_0 = invert
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_invert_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_invert_enabled : Void* = Pointer(Void).null
    def get_invert_enabled() : Bool
      if @@mb_get_invert_enabled.null?
        @@mb_get_invert_enabled = Bridge.get_method_bind("Polygon2D", "get_invert_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_invert_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_antialiased : Void* = Pointer(Void).null
    def set_antialiased(antialiased : Bool) : Void
      if @@mb_set_antialiased.null?
        @@mb_set_antialiased = Bridge.get_method_bind("Polygon2D", "set_antialiased", 2586408642_i64)
      end
      val_0 = antialiased
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_antialiased, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_antialiased : Void* = Pointer(Void).null
    def get_antialiased() : Bool
      if @@mb_get_antialiased.null?
        @@mb_get_antialiased = Bridge.get_method_bind("Polygon2D", "get_antialiased", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_antialiased, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_invert_border : Void* = Pointer(Void).null
    def set_invert_border(invert_border : Float64) : Void
      if @@mb_set_invert_border.null?
        @@mb_set_invert_border = Bridge.get_method_bind("Polygon2D", "set_invert_border", 373806689_i64)
      end
      val_0 = invert_border
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_invert_border, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_invert_border : Void* = Pointer(Void).null
    def get_invert_border() : Float64
      if @@mb_get_invert_border.null?
        @@mb_get_invert_border = Bridge.get_method_bind("Polygon2D", "get_invert_border", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_invert_border, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_offset : Void* = Pointer(Void).null
    def set_offset(offset : Vector2) : Void
      if @@mb_set_offset.null?
        @@mb_set_offset = Bridge.get_method_bind("Polygon2D", "set_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset : Void* = Pointer(Void).null
    def get_offset() : Vector2
      if @@mb_get_offset.null?
        @@mb_get_offset = Bridge.get_method_bind("Polygon2D", "get_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_bone : Void* = Pointer(Void).null
    def add_bone(path : NodePath, weights : Void*) : Void
      if @@mb_add_bone.null?
        @@mb_add_bone = Bridge.get_method_bind("Polygon2D", "add_bone", 703042815_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weights
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_add_bone, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone_count : Void* = Pointer(Void).null
    def get_bone_count() : Int64
      if @@mb_get_bone_count.null?
        @@mb_get_bone_count = Bridge.get_method_bind("Polygon2D", "get_bone_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bone_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_bone_path : Void* = Pointer(Void).null
    def get_bone_path(index : Int64) : NodePath
      if @@mb_get_bone_path.null?
        @@mb_get_bone_path = Bridge.get_method_bind("Polygon2D", "get_bone_path", 408788394_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bone_path, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_get_bone_weights : Void* = Pointer(Void).null
    def get_bone_weights(index : Int64) : Void*
      if @@mb_get_bone_weights.null?
        @@mb_get_bone_weights = Bridge.get_method_bind("Polygon2D", "get_bone_weights", 1542882410_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bone_weights, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      ret_ptr
    end
    @@mb_erase_bone : Void* = Pointer(Void).null
    def erase_bone(index : Int64) : Void
      if @@mb_erase_bone.null?
        @@mb_erase_bone = Bridge.get_method_bind("Polygon2D", "erase_bone", 1286410249_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_erase_bone, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_bones : Void* = Pointer(Void).null
    def clear_bones() : Void
      if @@mb_clear_bones.null?
        @@mb_clear_bones = Bridge.get_method_bind("Polygon2D", "clear_bones", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_bones, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_bone_path : Void* = Pointer(Void).null
    def set_bone_path(index : Int64, path : NodePath) : Void
      if @@mb_set_bone_path.null?
        @@mb_set_bone_path = Bridge.get_method_bind("Polygon2D", "set_bone_path", 2761262315_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = path
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bone_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_bone_weights : Void* = Pointer(Void).null
    def set_bone_weights(index : Int64, weights : Void*) : Void
      if @@mb_set_bone_weights.null?
        @@mb_set_bone_weights = Bridge.get_method_bind("Polygon2D", "set_bone_weights", 1345852415_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = weights
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_bone_weights, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_skeleton : Void* = Pointer(Void).null
    def set_skeleton(skeleton : NodePath) : Void
      if @@mb_set_skeleton.null?
        @@mb_set_skeleton = Bridge.get_method_bind("Polygon2D", "set_skeleton", 1348162250_i64)
      end
      val_0 = skeleton
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_skeleton, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_skeleton : Void* = Pointer(Void).null
    def get_skeleton() : NodePath
      if @@mb_get_skeleton.null?
        @@mb_get_skeleton = Bridge.get_method_bind("Polygon2D", "get_skeleton", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_skeleton, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_internal_vertex_count : Void* = Pointer(Void).null
    def set_internal_vertex_count(internal_vertex_count : Int64) : Void
      if @@mb_set_internal_vertex_count.null?
        @@mb_set_internal_vertex_count = Bridge.get_method_bind("Polygon2D", "set_internal_vertex_count", 1286410249_i64)
      end
      val_0 = internal_vertex_count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_internal_vertex_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_internal_vertex_count : Void* = Pointer(Void).null
    def get_internal_vertex_count() : Int64
      if @@mb_get_internal_vertex_count.null?
        @@mb_get_internal_vertex_count = Bridge.get_method_bind("Polygon2D", "get_internal_vertex_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_internal_vertex_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class PortableCompressedTexture2D < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum CompressionMode : Int64
      CompressionModeLossless = 0_i64
      CompressionModeLossy = 1_i64
      CompressionModeBasisUniversal = 2_i64
      CompressionModeS3tc = 3_i64
      CompressionModeEtc2 = 4_i64
      CompressionModeBptc = 5_i64
      CompressionModeAstc = 6_i64
    end
    @@mb_create_from_image : Void* = Pointer(Void).null
    def create_from_image(image : Image, compression_mode : Int64, normal_map : Bool, lossy_quality : Float64) : Void
      if @@mb_create_from_image.null?
        @@mb_create_from_image = Bridge.get_method_bind("PortableCompressedTexture2D", "create_from_image", 3679243433_i64)
      end
      val_0 = image
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = compression_mode
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = normal_map
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = lossy_quality
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_create_from_image, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_compression_mode : Void* = Pointer(Void).null
    def get_compression_mode() : Int64
      if @@mb_get_compression_mode.null?
        @@mb_get_compression_mode = Bridge.get_method_bind("PortableCompressedTexture2D", "get_compression_mode", 3265612739_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_compression_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_size_override : Void* = Pointer(Void).null
    def set_size_override(size : Vector2) : Void
      if @@mb_set_size_override.null?
        @@mb_set_size_override = Bridge.get_method_bind("PortableCompressedTexture2D", "set_size_override", 743155724_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_size_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_size_override : Void* = Pointer(Void).null
    def get_size_override() : Vector2
      if @@mb_get_size_override.null?
        @@mb_get_size_override = Bridge.get_method_bind("PortableCompressedTexture2D", "get_size_override", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_size_override, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_keep_compressed_buffer : Void* = Pointer(Void).null
    def set_keep_compressed_buffer(keep : Bool) : Void
      if @@mb_set_keep_compressed_buffer.null?
        @@mb_set_keep_compressed_buffer = Bridge.get_method_bind("PortableCompressedTexture2D", "set_keep_compressed_buffer", 2586408642_i64)
      end
      val_0 = keep
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_keep_compressed_buffer, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_keeping_compressed_buffer : Void* = Pointer(Void).null
    def is_keeping_compressed_buffer() : Bool
      if @@mb_is_keeping_compressed_buffer.null?
        @@mb_is_keeping_compressed_buffer = Bridge.get_method_bind("PortableCompressedTexture2D", "is_keeping_compressed_buffer", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_keeping_compressed_buffer, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_basisu_compressor_params : Void* = Pointer(Void).null
    def set_basisu_compressor_params(uastc_level : Int64, rdo_quality_loss : Float64) : Void
      if @@mb_set_basisu_compressor_params.null?
        @@mb_set_basisu_compressor_params = Bridge.get_method_bind("PortableCompressedTexture2D", "set_basisu_compressor_params", 1602489585_i64)
      end
      val_0 = uastc_level
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rdo_quality_loss
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_basisu_compressor_params, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_keep_all_compressed_buffers : Void* = Pointer(Void).null
    def set_keep_all_compressed_buffers(keep : Bool) : Void
      if @@mb_set_keep_all_compressed_buffers.null?
        @@mb_set_keep_all_compressed_buffers = Bridge.get_method_bind("PortableCompressedTexture2D", "set_keep_all_compressed_buffers", 2586408642_i64)
      end
      val_0 = keep
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_keep_all_compressed_buffers, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_keeping_all_compressed_buffers : Void* = Pointer(Void).null
    def is_keeping_all_compressed_buffers() : Bool
      if @@mb_is_keeping_all_compressed_buffers.null?
        @@mb_is_keeping_all_compressed_buffers = Bridge.get_method_bind("PortableCompressedTexture2D", "is_keeping_all_compressed_buffers", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_keeping_all_compressed_buffers, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class RayCast2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("RayCast2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_enabled : Void* = Pointer(Void).null
    def is_enabled() : Bool
      if @@mb_is_enabled.null?
        @@mb_is_enabled = Bridge.get_method_bind("RayCast2D", "is_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_target_position : Void* = Pointer(Void).null
    def set_target_position(local_point : Vector2) : Void
      if @@mb_set_target_position.null?
        @@mb_set_target_position = Bridge.get_method_bind("RayCast2D", "set_target_position", 743155724_i64)
      end
      val_0 = local_point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_position : Void* = Pointer(Void).null
    def get_target_position() : Vector2
      if @@mb_get_target_position.null?
        @@mb_get_target_position = Bridge.get_method_bind("RayCast2D", "get_target_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_target_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_colliding : Void* = Pointer(Void).null
    def is_colliding() : Bool
      if @@mb_is_colliding.null?
        @@mb_is_colliding = Bridge.get_method_bind("RayCast2D", "is_colliding", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_colliding, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_force_raycast_update : Void* = Pointer(Void).null
    def force_raycast_update() : Void
      if @@mb_force_raycast_update.null?
        @@mb_force_raycast_update = Bridge.get_method_bind("RayCast2D", "force_raycast_update", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_raycast_update, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_collider : Void* = Pointer(Void).null
    def get_collider() : Godot::Object
      if @@mb_get_collider.null?
        @@mb_get_collider = Bridge.get_method_bind("RayCast2D", "get_collider", 1981248198_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_collider, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_get_collider_rid : Void* = Pointer(Void).null
    def get_collider_rid() : Int64
      if @@mb_get_collider_rid.null?
        @@mb_get_collider_rid = Bridge.get_method_bind("RayCast2D", "get_collider_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_shape : Void* = Pointer(Void).null
    def get_collider_shape() : Int64
      if @@mb_get_collider_shape.null?
        @@mb_get_collider_shape = Bridge.get_method_bind("RayCast2D", "get_collider_shape", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_point : Void* = Pointer(Void).null
    def get_collision_point() : Vector2
      if @@mb_get_collision_point.null?
        @@mb_get_collision_point = Bridge.get_method_bind("RayCast2D", "get_collision_point", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collision_point, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_normal : Void* = Pointer(Void).null
    def get_collision_normal() : Vector2
      if @@mb_get_collision_normal.null?
        @@mb_get_collision_normal = Bridge.get_method_bind("RayCast2D", "get_collision_normal", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collision_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_exception_rid : Void* = Pointer(Void).null
    def add_exception_rid(rid : Int64) : Void
      if @@mb_add_exception_rid.null?
        @@mb_add_exception_rid = Bridge.get_method_bind("RayCast2D", "add_exception_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_exception_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_exception : Void* = Pointer(Void).null
    def add_exception(node : CollisionObject2D) : Void
      if @@mb_add_exception.null?
        @@mb_add_exception = Bridge.get_method_bind("RayCast2D", "add_exception", 3090941106_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_exception, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_exception_rid : Void* = Pointer(Void).null
    def remove_exception_rid(rid : Int64) : Void
      if @@mb_remove_exception_rid.null?
        @@mb_remove_exception_rid = Bridge.get_method_bind("RayCast2D", "remove_exception_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_exception_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_exception : Void* = Pointer(Void).null
    def remove_exception(node : CollisionObject2D) : Void
      if @@mb_remove_exception.null?
        @@mb_remove_exception = Bridge.get_method_bind("RayCast2D", "remove_exception", 3090941106_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_exception, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_exceptions : Void* = Pointer(Void).null
    def clear_exceptions() : Void
      if @@mb_clear_exceptions.null?
        @@mb_clear_exceptions = Bridge.get_method_bind("RayCast2D", "clear_exceptions", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_exceptions, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("RayCast2D", "set_collision_mask", 1286410249_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("RayCast2D", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_mask_value : Void* = Pointer(Void).null
    def set_collision_mask_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_collision_mask_value.null?
        @@mb_set_collision_mask_value = Bridge.get_method_bind("RayCast2D", "set_collision_mask_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_collision_mask_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask_value : Void* = Pointer(Void).null
    def get_collision_mask_value(layer_number : Int64) : Bool
      if @@mb_get_collision_mask_value.null?
        @@mb_get_collision_mask_value = Bridge.get_method_bind("RayCast2D", "get_collision_mask_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_collision_mask_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_exclude_parent_body : Void* = Pointer(Void).null
    def set_exclude_parent_body(mask : Bool) : Void
      if @@mb_set_exclude_parent_body.null?
        @@mb_set_exclude_parent_body = Bridge.get_method_bind("RayCast2D", "set_exclude_parent_body", 2586408642_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude_parent_body, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude_parent_body : Void* = Pointer(Void).null
    def get_exclude_parent_body() : Bool
      if @@mb_get_exclude_parent_body.null?
        @@mb_get_exclude_parent_body = Bridge.get_method_bind("RayCast2D", "get_exclude_parent_body", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_exclude_parent_body, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_with_areas : Void* = Pointer(Void).null
    def set_collide_with_areas(enable : Bool) : Void
      if @@mb_set_collide_with_areas.null?
        @@mb_set_collide_with_areas = Bridge.get_method_bind("RayCast2D", "set_collide_with_areas", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_areas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_areas_enabled : Void* = Pointer(Void).null
    def is_collide_with_areas_enabled() : Bool
      if @@mb_is_collide_with_areas_enabled.null?
        @@mb_is_collide_with_areas_enabled = Bridge.get_method_bind("RayCast2D", "is_collide_with_areas_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_areas_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_with_bodies : Void* = Pointer(Void).null
    def set_collide_with_bodies(enable : Bool) : Void
      if @@mb_set_collide_with_bodies.null?
        @@mb_set_collide_with_bodies = Bridge.get_method_bind("RayCast2D", "set_collide_with_bodies", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_bodies, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_bodies_enabled : Void* = Pointer(Void).null
    def is_collide_with_bodies_enabled() : Bool
      if @@mb_is_collide_with_bodies_enabled.null?
        @@mb_is_collide_with_bodies_enabled = Bridge.get_method_bind("RayCast2D", "is_collide_with_bodies_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_bodies_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_hit_from_inside : Void* = Pointer(Void).null
    def set_hit_from_inside(enable : Bool) : Void
      if @@mb_set_hit_from_inside.null?
        @@mb_set_hit_from_inside = Bridge.get_method_bind("RayCast2D", "set_hit_from_inside", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hit_from_inside, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_hit_from_inside_enabled : Void* = Pointer(Void).null
    def is_hit_from_inside_enabled() : Bool
      if @@mb_is_hit_from_inside_enabled.null?
        @@mb_is_hit_from_inside_enabled = Bridge.get_method_bind("RayCast2D", "is_hit_from_inside_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_hit_from_inside_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class RectangleShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_size : Void* = Pointer(Void).null
    def set_size(size : Vector2) : Void
      if @@mb_set_size.null?
        @@mb_set_size = Bridge.get_method_bind("RectangleShape2D", "set_size", 743155724_i64)
      end
      val_0 = size
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_size, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_size : Void* = Pointer(Void).null
    def get_size() : Vector2
      if @@mb_get_size.null?
        @@mb_get_size = Bridge.get_method_bind("RectangleShape2D", "get_size", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_size, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class RemoteTransform2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_remote_node : Void* = Pointer(Void).null
    def set_remote_node(path : NodePath) : Void
      if @@mb_set_remote_node.null?
        @@mb_set_remote_node = Bridge.get_method_bind("RemoteTransform2D", "set_remote_node", 1348162250_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_remote_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_remote_node : Void* = Pointer(Void).null
    def get_remote_node() : NodePath
      if @@mb_get_remote_node.null?
        @@mb_get_remote_node = Bridge.get_method_bind("RemoteTransform2D", "get_remote_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_remote_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_force_update_cache : Void* = Pointer(Void).null
    def force_update_cache() : Void
      if @@mb_force_update_cache.null?
        @@mb_force_update_cache = Bridge.get_method_bind("RemoteTransform2D", "force_update_cache", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_update_cache, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_use_global_coordinates : Void* = Pointer(Void).null
    def set_use_global_coordinates(use_global_coordinates : Bool) : Void
      if @@mb_set_use_global_coordinates.null?
        @@mb_set_use_global_coordinates = Bridge.get_method_bind("RemoteTransform2D", "set_use_global_coordinates", 2586408642_i64)
      end
      val_0 = use_global_coordinates
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_global_coordinates, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_use_global_coordinates : Void* = Pointer(Void).null
    def get_use_global_coordinates() : Bool
      if @@mb_get_use_global_coordinates.null?
        @@mb_get_use_global_coordinates = Bridge.get_method_bind("RemoteTransform2D", "get_use_global_coordinates", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_global_coordinates, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_update_position : Void* = Pointer(Void).null
    def set_update_position(update_remote_position : Bool) : Void
      if @@mb_set_update_position.null?
        @@mb_set_update_position = Bridge.get_method_bind("RemoteTransform2D", "set_update_position", 2586408642_i64)
      end
      val_0 = update_remote_position
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_update_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_update_position : Void* = Pointer(Void).null
    def get_update_position() : Bool
      if @@mb_get_update_position.null?
        @@mb_get_update_position = Bridge.get_method_bind("RemoteTransform2D", "get_update_position", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_update_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_update_rotation : Void* = Pointer(Void).null
    def set_update_rotation(update_remote_rotation : Bool) : Void
      if @@mb_set_update_rotation.null?
        @@mb_set_update_rotation = Bridge.get_method_bind("RemoteTransform2D", "set_update_rotation", 2586408642_i64)
      end
      val_0 = update_remote_rotation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_update_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_update_rotation : Void* = Pointer(Void).null
    def get_update_rotation() : Bool
      if @@mb_get_update_rotation.null?
        @@mb_get_update_rotation = Bridge.get_method_bind("RemoteTransform2D", "get_update_rotation", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_update_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_update_scale : Void* = Pointer(Void).null
    def set_update_scale(update_remote_scale : Bool) : Void
      if @@mb_set_update_scale.null?
        @@mb_set_update_scale = Bridge.get_method_bind("RemoteTransform2D", "set_update_scale", 2586408642_i64)
      end
      val_0 = update_remote_scale
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_update_scale, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_update_scale : Void* = Pointer(Void).null
    def get_update_scale() : Bool
      if @@mb_get_update_scale.null?
        @@mb_get_update_scale = Bridge.get_method_bind("RemoteTransform2D", "get_update_scale", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_update_scale, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class ScenePaint2DEditor < Godot::Control
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_register_scene_provider : Void* = Pointer(Void).null
    def register_scene_provider(control : Control, callback : Void*) : Void
      if @@mb_register_scene_provider.null?
        @@mb_register_scene_provider = Bridge.get_method_bind("ScenePaint2DEditor", "register_scene_provider", 2575427985_i64)
      end
      val_0 = control
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = callback
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_register_scene_provider, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_unregister_scene_provider : Void* = Pointer(Void).null
    def unregister_scene_provider(control : Control) : Void
      if @@mb_unregister_scene_provider.null?
        @@mb_unregister_scene_provider = Bridge.get_method_bind("ScenePaint2DEditor", "unregister_scene_provider", 1496901182_i64)
      end
      val_0 = control
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_unregister_scene_provider, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_painted_scene : Void* = Pointer(Void).null
    def set_painted_scene(scene : Node2D) : Void
      if @@mb_set_painted_scene.null?
        @@mb_set_painted_scene = Bridge.get_method_bind("ScenePaint2DEditor", "set_painted_scene", 2735608809_i64)
      end
      val_0 = scene
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_painted_scene, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_painted_scene : Void* = Pointer(Void).null
    def get_painted_scene() : Node2D
      if @@mb_get_painted_scene.null?
        @@mb_get_painted_scene = Bridge.get_method_bind("ScenePaint2DEditor", "get_painted_scene", 3536679914_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_painted_scene, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Node2D.new(ret_ptr)
    end
  end
  class SegmentShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_a : Void* = Pointer(Void).null
    def set_a(a : Vector2) : Void
      if @@mb_set_a.null?
        @@mb_set_a = Bridge.get_method_bind("SegmentShape2D", "set_a", 743155724_i64)
      end
      val_0 = a
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_a, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_a : Void* = Pointer(Void).null
    def get_a() : Vector2
      if @@mb_get_a.null?
        @@mb_get_a = Bridge.get_method_bind("SegmentShape2D", "get_a", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_a, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_b : Void* = Pointer(Void).null
    def set_b(b : Vector2) : Void
      if @@mb_set_b.null?
        @@mb_set_b = Bridge.get_method_bind("SegmentShape2D", "set_b", 743155724_i64)
      end
      val_0 = b
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_b, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_b : Void* = Pointer(Void).null
    def get_b() : Vector2
      if @@mb_get_b.null?
        @@mb_get_b = Bridge.get_method_bind("SegmentShape2D", "get_b", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_b, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class SeparationRayShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_length : Void* = Pointer(Void).null
    def set_length(length : Float64) : Void
      if @@mb_set_length.null?
        @@mb_set_length = Bridge.get_method_bind("SeparationRayShape2D", "set_length", 373806689_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_length : Void* = Pointer(Void).null
    def get_length() : Float64
      if @@mb_get_length.null?
        @@mb_get_length = Bridge.get_method_bind("SeparationRayShape2D", "get_length", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_slide_on_slope : Void* = Pointer(Void).null
    def set_slide_on_slope(active : Bool) : Void
      if @@mb_set_slide_on_slope.null?
        @@mb_set_slide_on_slope = Bridge.get_method_bind("SeparationRayShape2D", "set_slide_on_slope", 2586408642_i64)
      end
      val_0 = active
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_slide_on_slope, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_slide_on_slope : Void* = Pointer(Void).null
    def get_slide_on_slope() : Bool
      if @@mb_get_slide_on_slope.null?
        @@mb_get_slide_on_slope = Bridge.get_method_bind("SeparationRayShape2D", "get_slide_on_slope", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_slide_on_slope, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class ShapeCast2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("ShapeCast2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_enabled : Void* = Pointer(Void).null
    def is_enabled() : Bool
      if @@mb_is_enabled.null?
        @@mb_is_enabled = Bridge.get_method_bind("ShapeCast2D", "is_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_shape : Void* = Pointer(Void).null
    def set_shape(shape : Shape2D) : Void
      if @@mb_set_shape.null?
        @@mb_set_shape = Bridge.get_method_bind("ShapeCast2D", "set_shape", 771364740_i64)
      end
      val_0 = shape
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_shape, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_shape : Void* = Pointer(Void).null
    def get_shape() : Shape2D
      if @@mb_get_shape.null?
        @@mb_get_shape = Bridge.get_method_bind("ShapeCast2D", "get_shape", 522005891_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_shape, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Shape2D.new(ret_ptr)
    end
    @@mb_set_target_position : Void* = Pointer(Void).null
    def set_target_position(local_point : Vector2) : Void
      if @@mb_set_target_position.null?
        @@mb_set_target_position = Bridge.get_method_bind("ShapeCast2D", "set_target_position", 743155724_i64)
      end
      val_0 = local_point
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_position : Void* = Pointer(Void).null
    def get_target_position() : Vector2
      if @@mb_get_target_position.null?
        @@mb_get_target_position = Bridge.get_method_bind("ShapeCast2D", "get_target_position", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_target_position, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_margin : Void* = Pointer(Void).null
    def set_margin(margin : Float64) : Void
      if @@mb_set_margin.null?
        @@mb_set_margin = Bridge.get_method_bind("ShapeCast2D", "set_margin", 373806689_i64)
      end
      val_0 = margin
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_margin, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_margin : Void* = Pointer(Void).null
    def get_margin() : Float64
      if @@mb_get_margin.null?
        @@mb_get_margin = Bridge.get_method_bind("ShapeCast2D", "get_margin", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_margin, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_max_results : Void* = Pointer(Void).null
    def set_max_results(max_results : Int64) : Void
      if @@mb_set_max_results.null?
        @@mb_set_max_results = Bridge.get_method_bind("ShapeCast2D", "set_max_results", 1286410249_i64)
      end
      val_0 = max_results
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_max_results, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_max_results : Void* = Pointer(Void).null
    def get_max_results() : Int64
      if @@mb_get_max_results.null?
        @@mb_get_max_results = Bridge.get_method_bind("ShapeCast2D", "get_max_results", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_max_results, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_is_colliding : Void* = Pointer(Void).null
    def is_colliding() : Bool
      if @@mb_is_colliding.null?
        @@mb_is_colliding = Bridge.get_method_bind("ShapeCast2D", "is_colliding", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_colliding, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_collision_count : Void* = Pointer(Void).null
    def get_collision_count() : Int64
      if @@mb_get_collision_count.null?
        @@mb_get_collision_count = Bridge.get_method_bind("ShapeCast2D", "get_collision_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_force_shapecast_update : Void* = Pointer(Void).null
    def force_shapecast_update() : Void
      if @@mb_force_shapecast_update.null?
        @@mb_force_shapecast_update = Bridge.get_method_bind("ShapeCast2D", "force_shapecast_update", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_force_shapecast_update, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_get_collider : Void* = Pointer(Void).null
    def get_collider(index : Int64) : Godot::Object
      if @@mb_get_collider.null?
        @@mb_get_collider = Bridge.get_method_bind("ShapeCast2D", "get_collider", 3332903315_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_collider, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Godot::Object.new(ret_ptr)
    end
    @@mb_get_collider_rid : Void* = Pointer(Void).null
    def get_collider_rid(index : Int64) : Int64
      if @@mb_get_collider_rid.null?
        @@mb_get_collider_rid = Bridge.get_method_bind("ShapeCast2D", "get_collider_rid", 495598643_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_rid, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collider_shape : Void* = Pointer(Void).null
    def get_collider_shape(index : Int64) : Int64
      if @@mb_get_collider_shape.null?
        @@mb_get_collider_shape = Bridge.get_method_bind("ShapeCast2D", "get_collider_shape", 923996154_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collider_shape, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_point : Void* = Pointer(Void).null
    def get_collision_point(index : Int64) : Vector2
      if @@mb_get_collision_point.null?
        @@mb_get_collision_point = Bridge.get_method_bind("ShapeCast2D", "get_collision_point", 2299179447_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collision_point, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_collision_normal : Void* = Pointer(Void).null
    def get_collision_normal(index : Int64) : Vector2
      if @@mb_get_collision_normal.null?
        @@mb_get_collision_normal = Bridge.get_method_bind("ShapeCast2D", "get_collision_normal", 2299179447_i64)
      end
      val_0 = index
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_collision_normal, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_closest_collision_safe_fraction : Void* = Pointer(Void).null
    def get_closest_collision_safe_fraction() : Float64
      if @@mb_get_closest_collision_safe_fraction.null?
        @@mb_get_closest_collision_safe_fraction = Bridge.get_method_bind("ShapeCast2D", "get_closest_collision_safe_fraction", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_closest_collision_safe_fraction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_closest_collision_unsafe_fraction : Void* = Pointer(Void).null
    def get_closest_collision_unsafe_fraction() : Float64
      if @@mb_get_closest_collision_unsafe_fraction.null?
        @@mb_get_closest_collision_unsafe_fraction = Bridge.get_method_bind("ShapeCast2D", "get_closest_collision_unsafe_fraction", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_closest_collision_unsafe_fraction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_add_exception_rid : Void* = Pointer(Void).null
    def add_exception_rid(rid : Int64) : Void
      if @@mb_add_exception_rid.null?
        @@mb_add_exception_rid = Bridge.get_method_bind("ShapeCast2D", "add_exception_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_exception_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_add_exception : Void* = Pointer(Void).null
    def add_exception(node : CollisionObject2D) : Void
      if @@mb_add_exception.null?
        @@mb_add_exception = Bridge.get_method_bind("ShapeCast2D", "add_exception", 3090941106_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_exception, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_exception_rid : Void* = Pointer(Void).null
    def remove_exception_rid(rid : Int64) : Void
      if @@mb_remove_exception_rid.null?
        @@mb_remove_exception_rid = Bridge.get_method_bind("ShapeCast2D", "remove_exception_rid", 2722037293_i64)
      end
      val_0 = rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_exception_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_remove_exception : Void* = Pointer(Void).null
    def remove_exception(node : CollisionObject2D) : Void
      if @@mb_remove_exception.null?
        @@mb_remove_exception = Bridge.get_method_bind("ShapeCast2D", "remove_exception", 3090941106_i64)
      end
      val_0 = node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_remove_exception, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_clear_exceptions : Void* = Pointer(Void).null
    def clear_exceptions() : Void
      if @@mb_clear_exceptions.null?
        @@mb_clear_exceptions = Bridge.get_method_bind("ShapeCast2D", "clear_exceptions", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_clear_exceptions, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("ShapeCast2D", "set_collision_mask", 1286410249_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("ShapeCast2D", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_collision_mask_value : Void* = Pointer(Void).null
    def set_collision_mask_value(layer_number : Int64, value : Bool) : Void
      if @@mb_set_collision_mask_value.null?
        @@mb_set_collision_mask_value = Bridge.get_method_bind("ShapeCast2D", "set_collision_mask_value", 300928843_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = value
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_collision_mask_value, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask_value : Void* = Pointer(Void).null
    def get_collision_mask_value(layer_number : Int64) : Bool
      if @@mb_get_collision_mask_value.null?
        @@mb_get_collision_mask_value = Bridge.get_method_bind("ShapeCast2D", "get_collision_mask_value", 1116898809_i64)
      end
      val_0 = layer_number
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_collision_mask_value, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_exclude_parent_body : Void* = Pointer(Void).null
    def set_exclude_parent_body(mask : Bool) : Void
      if @@mb_set_exclude_parent_body.null?
        @@mb_set_exclude_parent_body = Bridge.get_method_bind("ShapeCast2D", "set_exclude_parent_body", 2586408642_i64)
      end
      val_0 = mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_exclude_parent_body, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_exclude_parent_body : Void* = Pointer(Void).null
    def get_exclude_parent_body() : Bool
      if @@mb_get_exclude_parent_body.null?
        @@mb_get_exclude_parent_body = Bridge.get_method_bind("ShapeCast2D", "get_exclude_parent_body", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_exclude_parent_body, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_with_areas : Void* = Pointer(Void).null
    def set_collide_with_areas(enable : Bool) : Void
      if @@mb_set_collide_with_areas.null?
        @@mb_set_collide_with_areas = Bridge.get_method_bind("ShapeCast2D", "set_collide_with_areas", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_areas, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_areas_enabled : Void* = Pointer(Void).null
    def is_collide_with_areas_enabled() : Bool
      if @@mb_is_collide_with_areas_enabled.null?
        @@mb_is_collide_with_areas_enabled = Bridge.get_method_bind("ShapeCast2D", "is_collide_with_areas_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_areas_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collide_with_bodies : Void* = Pointer(Void).null
    def set_collide_with_bodies(enable : Bool) : Void
      if @@mb_set_collide_with_bodies.null?
        @@mb_set_collide_with_bodies = Bridge.get_method_bind("ShapeCast2D", "set_collide_with_bodies", 2586408642_i64)
      end
      val_0 = enable
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collide_with_bodies, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_collide_with_bodies_enabled : Void* = Pointer(Void).null
    def is_collide_with_bodies_enabled() : Bool
      if @@mb_is_collide_with_bodies_enabled.null?
        @@mb_is_collide_with_bodies_enabled = Bridge.get_method_bind("ShapeCast2D", "is_collide_with_bodies_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_collide_with_bodies_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_collision_result : Void* = Pointer(Void).null
    def get_collision_result() : Godot::Array
      if @@mb_get_collision_result.null?
        @@mb_get_collision_result = Bridge.get_method_bind("ShapeCast2D", "get_collision_result", 3995934104_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_collision_result, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Godot::Array.new(ret_ptr)
    end
  end
  class Skeleton2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_bone_count : Void* = Pointer(Void).null
    def get_bone_count() : Int64
      if @@mb_get_bone_count.null?
        @@mb_get_bone_count = Bridge.get_method_bind("Skeleton2D", "get_bone_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bone_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_bone : Void* = Pointer(Void).null
    def get_bone(idx : Int64) : Bone2D
      if @@mb_get_bone.null?
        @@mb_get_bone = Bridge.get_method_bind("Skeleton2D", "get_bone", 2556267111_i64)
      end
      val_0 = idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bone, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Bone2D.new(ret_ptr)
    end
    @@mb_get_skeleton : Void* = Pointer(Void).null
    def get_skeleton() : Int64
      if @@mb_get_skeleton.null?
        @@mb_get_skeleton = Bridge.get_method_bind("Skeleton2D", "get_skeleton", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_skeleton, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_modification_stack : Void* = Pointer(Void).null
    def set_modification_stack(modification_stack : SkeletonModificationStack2D) : Void
      if @@mb_set_modification_stack.null?
        @@mb_set_modification_stack = Bridge.get_method_bind("Skeleton2D", "set_modification_stack", 3907307132_i64)
      end
      val_0 = modification_stack
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_modification_stack, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_modification_stack : Void* = Pointer(Void).null
    def get_modification_stack() : SkeletonModificationStack2D
      if @@mb_get_modification_stack.null?
        @@mb_get_modification_stack = Bridge.get_method_bind("Skeleton2D", "get_modification_stack", 2107508396_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_modification_stack, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      SkeletonModificationStack2D.new(ret_ptr)
    end
    @@mb_execute_modifications : Void* = Pointer(Void).null
    def execute_modifications(delta : Float64, execution_mode : Int64) : Void
      if @@mb_execute_modifications.null?
        @@mb_execute_modifications = Bridge.get_method_bind("Skeleton2D", "execute_modifications", 1005356550_i64)
      end
      val_0 = delta
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = execution_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_execute_modifications, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_bone_local_pose_override : Void* = Pointer(Void).null
    def set_bone_local_pose_override(bone_idx : Int64, override_pose : Transform2D, strength : Float64, persistent : Bool) : Void
      if @@mb_set_bone_local_pose_override.null?
        @@mb_set_bone_local_pose_override = Bridge.get_method_bind("Skeleton2D", "set_bone_local_pose_override", 555457532_i64)
      end
      val_0 = bone_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = override_pose
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = strength
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = persistent
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      Bridge.ptrcall(@@mb_set_bone_local_pose_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone_local_pose_override : Void* = Pointer(Void).null
    def get_bone_local_pose_override(bone_idx : Int64) : Transform2D
      if @@mb_get_bone_local_pose_override.null?
        @@mb_get_bone_local_pose_override = Bridge.get_method_bind("Skeleton2D", "get_bone_local_pose_override", 2995540667_i64)
      end
      val_0 = bone_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bone_local_pose_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      Transform2D.new(ret_ptr)
    end
  end
  class SkeletonModification2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("SkeletonModification2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enabled : Void* = Pointer(Void).null
    def get_enabled() : Bool
      if @@mb_get_enabled.null?
        @@mb_get_enabled = Bridge.get_method_bind("SkeletonModification2D", "get_enabled", 2240911060_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_get_modification_stack : Void* = Pointer(Void).null
    def get_modification_stack() : SkeletonModificationStack2D
      if @@mb_get_modification_stack.null?
        @@mb_get_modification_stack = Bridge.get_method_bind("SkeletonModification2D", "get_modification_stack", 2137761694_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_modification_stack, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      SkeletonModificationStack2D.new(ret_ptr)
    end
    @@mb_set_is_setup : Void* = Pointer(Void).null
    def set_is_setup(is_setup : Bool) : Void
      if @@mb_set_is_setup.null?
        @@mb_set_is_setup = Bridge.get_method_bind("SkeletonModification2D", "set_is_setup", 2586408642_i64)
      end
      val_0 = is_setup
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_is_setup, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_is_setup : Void* = Pointer(Void).null
    def get_is_setup() : Bool
      if @@mb_get_is_setup.null?
        @@mb_get_is_setup = Bridge.get_method_bind("SkeletonModification2D", "get_is_setup", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_is_setup, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_execution_mode : Void* = Pointer(Void).null
    def set_execution_mode(execution_mode : Int64) : Void
      if @@mb_set_execution_mode.null?
        @@mb_set_execution_mode = Bridge.get_method_bind("SkeletonModification2D", "set_execution_mode", 1286410249_i64)
      end
      val_0 = execution_mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_execution_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_execution_mode : Void* = Pointer(Void).null
    def get_execution_mode() : Int64
      if @@mb_get_execution_mode.null?
        @@mb_get_execution_mode = Bridge.get_method_bind("SkeletonModification2D", "get_execution_mode", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_execution_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_clamp_angle : Void* = Pointer(Void).null
    def clamp_angle(angle : Float64, min : Float64, max : Float64, invert : Bool) : Float64
      if @@mb_clamp_angle.null?
        @@mb_clamp_angle = Bridge.get_method_bind("SkeletonModification2D", "clamp_angle", 1229502682_i64)
      end
      val_0 = angle
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = min
      arg_1 = pointerof(val_1).as(Void*)
      val_2 = max
      arg_2 = pointerof(val_2).as(Void*)
      val_3 = invert
      arg_3 = pointerof(val_3).as(Void*)
      args = [arg_0, arg_1, arg_2, arg_3]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_clamp_angle, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_editor_draw_gizmo : Void* = Pointer(Void).null
    def set_editor_draw_gizmo(draw_gizmo : Bool) : Void
      if @@mb_set_editor_draw_gizmo.null?
        @@mb_set_editor_draw_gizmo = Bridge.get_method_bind("SkeletonModification2D", "set_editor_draw_gizmo", 2586408642_i64)
      end
      val_0 = draw_gizmo
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_editor_draw_gizmo, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_editor_draw_gizmo : Void* = Pointer(Void).null
    def get_editor_draw_gizmo() : Bool
      if @@mb_get_editor_draw_gizmo.null?
        @@mb_get_editor_draw_gizmo = Bridge.get_method_bind("SkeletonModification2D", "get_editor_draw_gizmo", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_editor_draw_gizmo, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class SkeletonModification2DCCDIK < Godot::SkeletonModification2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_target_node : Void* = Pointer(Void).null
    def set_target_node(target_nodepath : NodePath) : Void
      if @@mb_set_target_node.null?
        @@mb_set_target_node = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_target_node", 1348162250_i64)
      end
      val_0 = target_nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_node : Void* = Pointer(Void).null
    def get_target_node() : NodePath
      if @@mb_get_target_node.null?
        @@mb_get_target_node = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_target_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_target_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_tip_node : Void* = Pointer(Void).null
    def set_tip_node(tip_nodepath : NodePath) : Void
      if @@mb_set_tip_node.null?
        @@mb_set_tip_node = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_tip_node", 1348162250_i64)
      end
      val_0 = tip_nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_tip_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_tip_node : Void* = Pointer(Void).null
    def get_tip_node() : NodePath
      if @@mb_get_tip_node.null?
        @@mb_get_tip_node = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_tip_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_tip_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_ccdik_data_chain_length : Void* = Pointer(Void).null
    def set_ccdik_data_chain_length(length : Int64) : Void
      if @@mb_set_ccdik_data_chain_length.null?
        @@mb_set_ccdik_data_chain_length = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_data_chain_length", 1286410249_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_ccdik_data_chain_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_data_chain_length : Void* = Pointer(Void).null
    def get_ccdik_data_chain_length() : Int64
      if @@mb_get_ccdik_data_chain_length.null?
        @@mb_get_ccdik_data_chain_length = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_data_chain_length", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_ccdik_data_chain_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_ccdik_joint_bone2d_node : Void* = Pointer(Void).null
    def set_ccdik_joint_bone2d_node(joint_idx : Int64, bone2d_nodepath : NodePath) : Void
      if @@mb_set_ccdik_joint_bone2d_node.null?
        @@mb_set_ccdik_joint_bone2d_node = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_joint_bone2d_node", 2761262315_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone2d_nodepath
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_ccdik_joint_bone2d_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_joint_bone2d_node : Void* = Pointer(Void).null
    def get_ccdik_joint_bone2d_node(joint_idx : Int64) : NodePath
      if @@mb_get_ccdik_joint_bone2d_node.null?
        @@mb_get_ccdik_joint_bone2d_node = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_joint_bone2d_node", 408788394_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_ccdik_joint_bone2d_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_ccdik_joint_bone_index : Void* = Pointer(Void).null
    def set_ccdik_joint_bone_index(joint_idx : Int64, bone_idx : Int64) : Void
      if @@mb_set_ccdik_joint_bone_index.null?
        @@mb_set_ccdik_joint_bone_index = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_joint_bone_index", 3937882851_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_ccdik_joint_bone_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_joint_bone_index : Void* = Pointer(Void).null
    def get_ccdik_joint_bone_index(joint_idx : Int64) : Int64
      if @@mb_get_ccdik_joint_bone_index.null?
        @@mb_get_ccdik_joint_bone_index = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_joint_bone_index", 923996154_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_ccdik_joint_bone_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_ccdik_joint_rotate_from_joint : Void* = Pointer(Void).null
    def set_ccdik_joint_rotate_from_joint(joint_idx : Int64, rotate_from_joint : Bool) : Void
      if @@mb_set_ccdik_joint_rotate_from_joint.null?
        @@mb_set_ccdik_joint_rotate_from_joint = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_joint_rotate_from_joint", 300928843_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = rotate_from_joint
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_ccdik_joint_rotate_from_joint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_joint_rotate_from_joint : Void* = Pointer(Void).null
    def get_ccdik_joint_rotate_from_joint(joint_idx : Int64) : Bool
      if @@mb_get_ccdik_joint_rotate_from_joint.null?
        @@mb_get_ccdik_joint_rotate_from_joint = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_joint_rotate_from_joint", 1116898809_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_ccdik_joint_rotate_from_joint, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_ccdik_joint_enable_constraint : Void* = Pointer(Void).null
    def set_ccdik_joint_enable_constraint(joint_idx : Int64, enable_constraint : Bool) : Void
      if @@mb_set_ccdik_joint_enable_constraint.null?
        @@mb_set_ccdik_joint_enable_constraint = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_joint_enable_constraint", 300928843_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = enable_constraint
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_ccdik_joint_enable_constraint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_joint_enable_constraint : Void* = Pointer(Void).null
    def get_ccdik_joint_enable_constraint(joint_idx : Int64) : Bool
      if @@mb_get_ccdik_joint_enable_constraint.null?
        @@mb_get_ccdik_joint_enable_constraint = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_joint_enable_constraint", 1116898809_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_ccdik_joint_enable_constraint, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_ccdik_joint_constraint_angle_min : Void* = Pointer(Void).null
    def set_ccdik_joint_constraint_angle_min(joint_idx : Int64, angle_min : Float64) : Void
      if @@mb_set_ccdik_joint_constraint_angle_min.null?
        @@mb_set_ccdik_joint_constraint_angle_min = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_joint_constraint_angle_min", 1602489585_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = angle_min
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_ccdik_joint_constraint_angle_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_joint_constraint_angle_min : Void* = Pointer(Void).null
    def get_ccdik_joint_constraint_angle_min(joint_idx : Int64) : Float64
      if @@mb_get_ccdik_joint_constraint_angle_min.null?
        @@mb_get_ccdik_joint_constraint_angle_min = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_joint_constraint_angle_min", 2339986948_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_ccdik_joint_constraint_angle_min, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_ccdik_joint_constraint_angle_max : Void* = Pointer(Void).null
    def set_ccdik_joint_constraint_angle_max(joint_idx : Int64, angle_max : Float64) : Void
      if @@mb_set_ccdik_joint_constraint_angle_max.null?
        @@mb_set_ccdik_joint_constraint_angle_max = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_joint_constraint_angle_max", 1602489585_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = angle_max
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_ccdik_joint_constraint_angle_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_joint_constraint_angle_max : Void* = Pointer(Void).null
    def get_ccdik_joint_constraint_angle_max(joint_idx : Int64) : Float64
      if @@mb_get_ccdik_joint_constraint_angle_max.null?
        @@mb_get_ccdik_joint_constraint_angle_max = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_joint_constraint_angle_max", 2339986948_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_ccdik_joint_constraint_angle_max, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_ccdik_joint_constraint_angle_invert : Void* = Pointer(Void).null
    def set_ccdik_joint_constraint_angle_invert(joint_idx : Int64, invert : Bool) : Void
      if @@mb_set_ccdik_joint_constraint_angle_invert.null?
        @@mb_set_ccdik_joint_constraint_angle_invert = Bridge.get_method_bind("SkeletonModification2DCCDIK", "set_ccdik_joint_constraint_angle_invert", 300928843_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = invert
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_ccdik_joint_constraint_angle_invert, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_ccdik_joint_constraint_angle_invert : Void* = Pointer(Void).null
    def get_ccdik_joint_constraint_angle_invert(joint_idx : Int64) : Bool
      if @@mb_get_ccdik_joint_constraint_angle_invert.null?
        @@mb_get_ccdik_joint_constraint_angle_invert = Bridge.get_method_bind("SkeletonModification2DCCDIK", "get_ccdik_joint_constraint_angle_invert", 1116898809_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_ccdik_joint_constraint_angle_invert, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class SkeletonModification2DFABRIK < Godot::SkeletonModification2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_target_node : Void* = Pointer(Void).null
    def set_target_node(target_nodepath : NodePath) : Void
      if @@mb_set_target_node.null?
        @@mb_set_target_node = Bridge.get_method_bind("SkeletonModification2DFABRIK", "set_target_node", 1348162250_i64)
      end
      val_0 = target_nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_node : Void* = Pointer(Void).null
    def get_target_node() : NodePath
      if @@mb_get_target_node.null?
        @@mb_get_target_node = Bridge.get_method_bind("SkeletonModification2DFABRIK", "get_target_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_target_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_fabrik_data_chain_length : Void* = Pointer(Void).null
    def set_fabrik_data_chain_length(length : Int64) : Void
      if @@mb_set_fabrik_data_chain_length.null?
        @@mb_set_fabrik_data_chain_length = Bridge.get_method_bind("SkeletonModification2DFABRIK", "set_fabrik_data_chain_length", 1286410249_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_fabrik_data_chain_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fabrik_data_chain_length : Void* = Pointer(Void).null
    def get_fabrik_data_chain_length() : Int64
      if @@mb_get_fabrik_data_chain_length.null?
        @@mb_get_fabrik_data_chain_length = Bridge.get_method_bind("SkeletonModification2DFABRIK", "get_fabrik_data_chain_length", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fabrik_data_chain_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fabrik_joint_bone2d_node : Void* = Pointer(Void).null
    def set_fabrik_joint_bone2d_node(joint_idx : Int64, bone2d_nodepath : NodePath) : Void
      if @@mb_set_fabrik_joint_bone2d_node.null?
        @@mb_set_fabrik_joint_bone2d_node = Bridge.get_method_bind("SkeletonModification2DFABRIK", "set_fabrik_joint_bone2d_node", 2761262315_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone2d_nodepath
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_fabrik_joint_bone2d_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fabrik_joint_bone2d_node : Void* = Pointer(Void).null
    def get_fabrik_joint_bone2d_node(joint_idx : Int64) : NodePath
      if @@mb_get_fabrik_joint_bone2d_node.null?
        @@mb_get_fabrik_joint_bone2d_node = Bridge.get_method_bind("SkeletonModification2DFABRIK", "get_fabrik_joint_bone2d_node", 408788394_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_fabrik_joint_bone2d_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_fabrik_joint_bone_index : Void* = Pointer(Void).null
    def set_fabrik_joint_bone_index(joint_idx : Int64, bone_idx : Int64) : Void
      if @@mb_set_fabrik_joint_bone_index.null?
        @@mb_set_fabrik_joint_bone_index = Bridge.get_method_bind("SkeletonModification2DFABRIK", "set_fabrik_joint_bone_index", 3937882851_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_fabrik_joint_bone_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fabrik_joint_bone_index : Void* = Pointer(Void).null
    def get_fabrik_joint_bone_index(joint_idx : Int64) : Int64
      if @@mb_get_fabrik_joint_bone_index.null?
        @@mb_get_fabrik_joint_bone_index = Bridge.get_method_bind("SkeletonModification2DFABRIK", "get_fabrik_joint_bone_index", 923996154_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_fabrik_joint_bone_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fabrik_joint_magnet_position : Void* = Pointer(Void).null
    def set_fabrik_joint_magnet_position(joint_idx : Int64, magnet_position : Vector2) : Void
      if @@mb_set_fabrik_joint_magnet_position.null?
        @@mb_set_fabrik_joint_magnet_position = Bridge.get_method_bind("SkeletonModification2DFABRIK", "set_fabrik_joint_magnet_position", 163021252_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = magnet_position
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_fabrik_joint_magnet_position, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fabrik_joint_magnet_position : Void* = Pointer(Void).null
    def get_fabrik_joint_magnet_position(joint_idx : Int64) : Vector2
      if @@mb_get_fabrik_joint_magnet_position.null?
        @@mb_get_fabrik_joint_magnet_position = Bridge.get_method_bind("SkeletonModification2DFABRIK", "get_fabrik_joint_magnet_position", 2299179447_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_fabrik_joint_magnet_position, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_fabrik_joint_use_target_rotation : Void* = Pointer(Void).null
    def set_fabrik_joint_use_target_rotation(joint_idx : Int64, use_target_rotation : Bool) : Void
      if @@mb_set_fabrik_joint_use_target_rotation.null?
        @@mb_set_fabrik_joint_use_target_rotation = Bridge.get_method_bind("SkeletonModification2DFABRIK", "set_fabrik_joint_use_target_rotation", 300928843_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = use_target_rotation
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_fabrik_joint_use_target_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_fabrik_joint_use_target_rotation : Void* = Pointer(Void).null
    def get_fabrik_joint_use_target_rotation(joint_idx : Int64) : Bool
      if @@mb_get_fabrik_joint_use_target_rotation.null?
        @@mb_get_fabrik_joint_use_target_rotation = Bridge.get_method_bind("SkeletonModification2DFABRIK", "get_fabrik_joint_use_target_rotation", 1116898809_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_fabrik_joint_use_target_rotation, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class SkeletonModification2DJiggle < Godot::SkeletonModification2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_target_node : Void* = Pointer(Void).null
    def set_target_node(target_nodepath : NodePath) : Void
      if @@mb_set_target_node.null?
        @@mb_set_target_node = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_target_node", 1348162250_i64)
      end
      val_0 = target_nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_node : Void* = Pointer(Void).null
    def get_target_node() : NodePath
      if @@mb_get_target_node.null?
        @@mb_get_target_node = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_target_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_target_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_jiggle_data_chain_length : Void* = Pointer(Void).null
    def set_jiggle_data_chain_length(length : Int64) : Void
      if @@mb_set_jiggle_data_chain_length.null?
        @@mb_set_jiggle_data_chain_length = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_data_chain_length", 1286410249_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_jiggle_data_chain_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_data_chain_length : Void* = Pointer(Void).null
    def get_jiggle_data_chain_length() : Int64
      if @@mb_get_jiggle_data_chain_length.null?
        @@mb_get_jiggle_data_chain_length = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_data_chain_length", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_jiggle_data_chain_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_stiffness : Void* = Pointer(Void).null
    def set_stiffness(stiffness : Float64) : Void
      if @@mb_set_stiffness.null?
        @@mb_set_stiffness = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_stiffness", 373806689_i64)
      end
      val_0 = stiffness
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_stiffness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_stiffness : Void* = Pointer(Void).null
    def get_stiffness() : Float64
      if @@mb_get_stiffness.null?
        @@mb_get_stiffness = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_stiffness", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_stiffness, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_mass : Void* = Pointer(Void).null
    def set_mass(mass : Float64) : Void
      if @@mb_set_mass.null?
        @@mb_set_mass = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_mass", 373806689_i64)
      end
      val_0 = mass
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_mass, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_mass : Void* = Pointer(Void).null
    def get_mass() : Float64
      if @@mb_get_mass.null?
        @@mb_get_mass = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_mass", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_mass, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_damping : Void* = Pointer(Void).null
    def set_damping(damping : Float64) : Void
      if @@mb_set_damping.null?
        @@mb_set_damping = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_damping", 373806689_i64)
      end
      val_0 = damping
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_damping, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_damping : Void* = Pointer(Void).null
    def get_damping() : Float64
      if @@mb_get_damping.null?
        @@mb_get_damping = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_damping", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_damping, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_gravity : Void* = Pointer(Void).null
    def set_use_gravity(use_gravity : Bool) : Void
      if @@mb_set_use_gravity.null?
        @@mb_set_use_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_use_gravity", 2586408642_i64)
      end
      val_0 = use_gravity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_gravity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_use_gravity : Void* = Pointer(Void).null
    def get_use_gravity() : Bool
      if @@mb_get_use_gravity.null?
        @@mb_get_use_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_use_gravity", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_gravity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_gravity : Void* = Pointer(Void).null
    def set_gravity(gravity : Vector2) : Void
      if @@mb_set_gravity.null?
        @@mb_set_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_gravity", 743155724_i64)
      end
      val_0 = gravity
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_gravity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_gravity : Void* = Pointer(Void).null
    def get_gravity() : Vector2
      if @@mb_get_gravity.null?
        @@mb_get_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_gravity", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_gravity, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_use_colliders : Void* = Pointer(Void).null
    def set_use_colliders(use_colliders : Bool) : Void
      if @@mb_set_use_colliders.null?
        @@mb_set_use_colliders = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_use_colliders", 2586408642_i64)
      end
      val_0 = use_colliders
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_use_colliders, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_use_colliders : Void* = Pointer(Void).null
    def get_use_colliders() : Bool
      if @@mb_get_use_colliders.null?
        @@mb_get_use_colliders = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_use_colliders", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_use_colliders, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_collision_mask : Void* = Pointer(Void).null
    def set_collision_mask(collision_mask : Int64) : Void
      if @@mb_set_collision_mask.null?
        @@mb_set_collision_mask = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_collision_mask", 1286410249_i64)
      end
      val_0 = collision_mask
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_collision_mask, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_collision_mask : Void* = Pointer(Void).null
    def get_collision_mask() : Int64
      if @@mb_get_collision_mask.null?
        @@mb_get_collision_mask = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_collision_mask", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_collision_mask, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_reset : Void* = Pointer(Void).null
    def reset() : Void
      if @@mb_reset.null?
        @@mb_reset = Bridge.get_method_bind("SkeletonModification2DJiggle", "reset", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_reset, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_set_jiggle_joint_bone2d_node : Void* = Pointer(Void).null
    def set_jiggle_joint_bone2d_node(joint_idx : Int64, bone2d_node : NodePath) : Void
      if @@mb_set_jiggle_joint_bone2d_node.null?
        @@mb_set_jiggle_joint_bone2d_node = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_bone2d_node", 2761262315_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone2d_node
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_bone2d_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_bone2d_node : Void* = Pointer(Void).null
    def get_jiggle_joint_bone2d_node(joint_idx : Int64) : NodePath
      if @@mb_get_jiggle_joint_bone2d_node.null?
        @@mb_get_jiggle_joint_bone2d_node = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_bone2d_node", 408788394_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_jiggle_joint_bone2d_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_jiggle_joint_bone_index : Void* = Pointer(Void).null
    def set_jiggle_joint_bone_index(joint_idx : Int64, bone_idx : Int64) : Void
      if @@mb_set_jiggle_joint_bone_index.null?
        @@mb_set_jiggle_joint_bone_index = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_bone_index", 3937882851_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = bone_idx
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_bone_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_bone_index : Void* = Pointer(Void).null
    def get_jiggle_joint_bone_index(joint_idx : Int64) : Int64
      if @@mb_get_jiggle_joint_bone_index.null?
        @@mb_get_jiggle_joint_bone_index = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_bone_index", 923996154_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_jiggle_joint_bone_index, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_jiggle_joint_override : Void* = Pointer(Void).null
    def set_jiggle_joint_override(joint_idx : Int64, override : Bool) : Void
      if @@mb_set_jiggle_joint_override.null?
        @@mb_set_jiggle_joint_override = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_override", 300928843_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = override
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_override, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_override : Void* = Pointer(Void).null
    def get_jiggle_joint_override(joint_idx : Int64) : Bool
      if @@mb_get_jiggle_joint_override.null?
        @@mb_get_jiggle_joint_override = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_override", 1116898809_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_jiggle_joint_override, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_jiggle_joint_stiffness : Void* = Pointer(Void).null
    def set_jiggle_joint_stiffness(joint_idx : Int64, stiffness : Float64) : Void
      if @@mb_set_jiggle_joint_stiffness.null?
        @@mb_set_jiggle_joint_stiffness = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_stiffness", 1602489585_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = stiffness
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_stiffness, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_stiffness : Void* = Pointer(Void).null
    def get_jiggle_joint_stiffness(joint_idx : Int64) : Float64
      if @@mb_get_jiggle_joint_stiffness.null?
        @@mb_get_jiggle_joint_stiffness = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_stiffness", 2339986948_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_jiggle_joint_stiffness, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_jiggle_joint_mass : Void* = Pointer(Void).null
    def set_jiggle_joint_mass(joint_idx : Int64, mass : Float64) : Void
      if @@mb_set_jiggle_joint_mass.null?
        @@mb_set_jiggle_joint_mass = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_mass", 1602489585_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = mass
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_mass, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_mass : Void* = Pointer(Void).null
    def get_jiggle_joint_mass(joint_idx : Int64) : Float64
      if @@mb_get_jiggle_joint_mass.null?
        @@mb_get_jiggle_joint_mass = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_mass", 2339986948_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_jiggle_joint_mass, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_jiggle_joint_damping : Void* = Pointer(Void).null
    def set_jiggle_joint_damping(joint_idx : Int64, damping : Float64) : Void
      if @@mb_set_jiggle_joint_damping.null?
        @@mb_set_jiggle_joint_damping = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_damping", 1602489585_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = damping
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_damping, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_damping : Void* = Pointer(Void).null
    def get_jiggle_joint_damping(joint_idx : Int64) : Float64
      if @@mb_get_jiggle_joint_damping.null?
        @@mb_get_jiggle_joint_damping = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_damping", 2339986948_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_jiggle_joint_damping, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_jiggle_joint_use_gravity : Void* = Pointer(Void).null
    def set_jiggle_joint_use_gravity(joint_idx : Int64, use_gravity : Bool) : Void
      if @@mb_set_jiggle_joint_use_gravity.null?
        @@mb_set_jiggle_joint_use_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_use_gravity", 300928843_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = use_gravity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_use_gravity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_use_gravity : Void* = Pointer(Void).null
    def get_jiggle_joint_use_gravity(joint_idx : Int64) : Bool
      if @@mb_get_jiggle_joint_use_gravity.null?
        @@mb_get_jiggle_joint_use_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_use_gravity", 1116898809_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_jiggle_joint_use_gravity, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_jiggle_joint_gravity : Void* = Pointer(Void).null
    def set_jiggle_joint_gravity(joint_idx : Int64, gravity : Vector2) : Void
      if @@mb_set_jiggle_joint_gravity.null?
        @@mb_set_jiggle_joint_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "set_jiggle_joint_gravity", 163021252_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = gravity
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_jiggle_joint_gravity, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_jiggle_joint_gravity : Void* = Pointer(Void).null
    def get_jiggle_joint_gravity(joint_idx : Int64) : Vector2
      if @@mb_get_jiggle_joint_gravity.null?
        @@mb_get_jiggle_joint_gravity = Bridge.get_method_bind("SkeletonModification2DJiggle", "get_jiggle_joint_gravity", 2299179447_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_jiggle_joint_gravity, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret
    end
  end
  class SkeletonModification2DLookAt < Godot::SkeletonModification2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_bone2d_node : Void* = Pointer(Void).null
    def set_bone2d_node(bone2d_nodepath : NodePath) : Void
      if @@mb_set_bone2d_node.null?
        @@mb_set_bone2d_node = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_bone2d_node", 1348162250_i64)
      end
      val_0 = bone2d_nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bone2d_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone2d_node : Void* = Pointer(Void).null
    def get_bone2d_node() : NodePath
      if @@mb_get_bone2d_node.null?
        @@mb_get_bone2d_node = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_bone2d_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_bone2d_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_bone_index : Void* = Pointer(Void).null
    def set_bone_index(bone_idx : Int64) : Void
      if @@mb_set_bone_index.null?
        @@mb_set_bone_index = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_bone_index", 1286410249_i64)
      end
      val_0 = bone_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_bone_index, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_bone_index : Void* = Pointer(Void).null
    def get_bone_index() : Int64
      if @@mb_get_bone_index.null?
        @@mb_get_bone_index = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_bone_index", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_bone_index, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_target_node : Void* = Pointer(Void).null
    def set_target_node(target_nodepath : NodePath) : Void
      if @@mb_set_target_node.null?
        @@mb_set_target_node = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_target_node", 1348162250_i64)
      end
      val_0 = target_nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_node : Void* = Pointer(Void).null
    def get_target_node() : NodePath
      if @@mb_get_target_node.null?
        @@mb_get_target_node = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_target_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_target_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_additional_rotation : Void* = Pointer(Void).null
    def set_additional_rotation(rotation : Float64) : Void
      if @@mb_set_additional_rotation.null?
        @@mb_set_additional_rotation = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_additional_rotation", 373806689_i64)
      end
      val_0 = rotation
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_additional_rotation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_additional_rotation : Void* = Pointer(Void).null
    def get_additional_rotation() : Float64
      if @@mb_get_additional_rotation.null?
        @@mb_get_additional_rotation = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_additional_rotation", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_additional_rotation, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enable_constraint : Void* = Pointer(Void).null
    def set_enable_constraint(enable_constraint : Bool) : Void
      if @@mb_set_enable_constraint.null?
        @@mb_set_enable_constraint = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_enable_constraint", 2586408642_i64)
      end
      val_0 = enable_constraint
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_constraint, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enable_constraint : Void* = Pointer(Void).null
    def get_enable_constraint() : Bool
      if @@mb_get_enable_constraint.null?
        @@mb_get_enable_constraint = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_enable_constraint", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_enable_constraint, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_constraint_angle_min : Void* = Pointer(Void).null
    def set_constraint_angle_min(angle_min : Float64) : Void
      if @@mb_set_constraint_angle_min.null?
        @@mb_set_constraint_angle_min = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_constraint_angle_min", 373806689_i64)
      end
      val_0 = angle_min
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constraint_angle_min, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constraint_angle_min : Void* = Pointer(Void).null
    def get_constraint_angle_min() : Float64
      if @@mb_get_constraint_angle_min.null?
        @@mb_get_constraint_angle_min = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_constraint_angle_min", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_constraint_angle_min, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_constraint_angle_max : Void* = Pointer(Void).null
    def set_constraint_angle_max(angle_max : Float64) : Void
      if @@mb_set_constraint_angle_max.null?
        @@mb_set_constraint_angle_max = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_constraint_angle_max", 373806689_i64)
      end
      val_0 = angle_max
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constraint_angle_max, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constraint_angle_max : Void* = Pointer(Void).null
    def get_constraint_angle_max() : Float64
      if @@mb_get_constraint_angle_max.null?
        @@mb_get_constraint_angle_max = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_constraint_angle_max", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_constraint_angle_max, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_constraint_angle_invert : Void* = Pointer(Void).null
    def set_constraint_angle_invert(invert : Bool) : Void
      if @@mb_set_constraint_angle_invert.null?
        @@mb_set_constraint_angle_invert = Bridge.get_method_bind("SkeletonModification2DLookAt", "set_constraint_angle_invert", 2586408642_i64)
      end
      val_0 = invert
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_constraint_angle_invert, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_constraint_angle_invert : Void* = Pointer(Void).null
    def get_constraint_angle_invert() : Bool
      if @@mb_get_constraint_angle_invert.null?
        @@mb_get_constraint_angle_invert = Bridge.get_method_bind("SkeletonModification2DLookAt", "get_constraint_angle_invert", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_constraint_angle_invert, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class SkeletonModification2DPhysicalBones < Godot::SkeletonModification2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_physical_bone_chain_length : Void* = Pointer(Void).null
    def set_physical_bone_chain_length(length : Int64) : Void
      if @@mb_set_physical_bone_chain_length.null?
        @@mb_set_physical_bone_chain_length = Bridge.get_method_bind("SkeletonModification2DPhysicalBones", "set_physical_bone_chain_length", 1286410249_i64)
      end
      val_0 = length
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_physical_bone_chain_length, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_physical_bone_chain_length : Void* = Pointer(Void).null
    def get_physical_bone_chain_length() : Int64
      if @@mb_get_physical_bone_chain_length.null?
        @@mb_get_physical_bone_chain_length = Bridge.get_method_bind("SkeletonModification2DPhysicalBones", "get_physical_bone_chain_length", 2455072627_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_physical_bone_chain_length, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_physical_bone_node : Void* = Pointer(Void).null
    def set_physical_bone_node(joint_idx : Int64, physicalbone2d_node : NodePath) : Void
      if @@mb_set_physical_bone_node.null?
        @@mb_set_physical_bone_node = Bridge.get_method_bind("SkeletonModification2DPhysicalBones", "set_physical_bone_node", 2761262315_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = physicalbone2d_node
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_physical_bone_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_physical_bone_node : Void* = Pointer(Void).null
    def get_physical_bone_node(joint_idx : Int64) : NodePath
      if @@mb_get_physical_bone_node.null?
        @@mb_get_physical_bone_node = Bridge.get_method_bind("SkeletonModification2DPhysicalBones", "get_physical_bone_node", 408788394_i64)
      end
      val_0 = joint_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_physical_bone_node, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_fetch_physical_bones : Void* = Pointer(Void).null
    def fetch_physical_bones() : Void
      if @@mb_fetch_physical_bones.null?
        @@mb_fetch_physical_bones = Bridge.get_method_bind("SkeletonModification2DPhysicalBones", "fetch_physical_bones", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_fetch_physical_bones, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_start_simulation : Void* = Pointer(Void).null
    def start_simulation(bones : Godot::Array) : Void
      if @@mb_start_simulation.null?
        @@mb_start_simulation = Bridge.get_method_bind("SkeletonModification2DPhysicalBones", "start_simulation", 2787316981_i64)
      end
      arg_ptr_0 = bones ? bones.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_start_simulation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_stop_simulation : Void* = Pointer(Void).null
    def stop_simulation(bones : Godot::Array) : Void
      if @@mb_stop_simulation.null?
        @@mb_stop_simulation = Bridge.get_method_bind("SkeletonModification2DPhysicalBones", "stop_simulation", 2787316981_i64)
      end
      arg_ptr_0 = bones ? bones.pointer : Pointer(Void).null
      arg_0 = pointerof(arg_ptr_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_stop_simulation, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
  end
  class SkeletonModification2DStackHolder < Godot::SkeletonModification2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_held_modification_stack : Void* = Pointer(Void).null
    def set_held_modification_stack(held_modification_stack : SkeletonModificationStack2D) : Void
      if @@mb_set_held_modification_stack.null?
        @@mb_set_held_modification_stack = Bridge.get_method_bind("SkeletonModification2DStackHolder", "set_held_modification_stack", 3907307132_i64)
      end
      val_0 = held_modification_stack
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_held_modification_stack, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_held_modification_stack : Void* = Pointer(Void).null
    def get_held_modification_stack() : SkeletonModificationStack2D
      if @@mb_get_held_modification_stack.null?
        @@mb_get_held_modification_stack = Bridge.get_method_bind("SkeletonModification2DStackHolder", "get_held_modification_stack", 2107508396_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_held_modification_stack, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      SkeletonModificationStack2D.new(ret_ptr)
    end
  end
  class SkeletonModification2DTwoBoneIK < Godot::SkeletonModification2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_target_node : Void* = Pointer(Void).null
    def set_target_node(target_nodepath : NodePath) : Void
      if @@mb_set_target_node.null?
        @@mb_set_target_node = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_target_node", 1348162250_i64)
      end
      val_0 = target_nodepath
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_node : Void* = Pointer(Void).null
    def get_target_node() : NodePath
      if @@mb_get_target_node.null?
        @@mb_get_target_node = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_target_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_target_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_target_minimum_distance : Void* = Pointer(Void).null
    def set_target_minimum_distance(minimum_distance : Float64) : Void
      if @@mb_set_target_minimum_distance.null?
        @@mb_set_target_minimum_distance = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_target_minimum_distance", 373806689_i64)
      end
      val_0 = minimum_distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_minimum_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_minimum_distance : Void* = Pointer(Void).null
    def get_target_minimum_distance() : Float64
      if @@mb_get_target_minimum_distance.null?
        @@mb_get_target_minimum_distance = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_target_minimum_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_target_minimum_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_target_maximum_distance : Void* = Pointer(Void).null
    def set_target_maximum_distance(maximum_distance : Float64) : Void
      if @@mb_set_target_maximum_distance.null?
        @@mb_set_target_maximum_distance = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_target_maximum_distance", 373806689_i64)
      end
      val_0 = maximum_distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_target_maximum_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_target_maximum_distance : Void* = Pointer(Void).null
    def get_target_maximum_distance() : Float64
      if @@mb_get_target_maximum_distance.null?
        @@mb_get_target_maximum_distance = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_target_maximum_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_target_maximum_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_flip_bend_direction : Void* = Pointer(Void).null
    def set_flip_bend_direction(flip_direction : Bool) : Void
      if @@mb_set_flip_bend_direction.null?
        @@mb_set_flip_bend_direction = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_flip_bend_direction", 2586408642_i64)
      end
      val_0 = flip_direction
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flip_bend_direction, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_flip_bend_direction : Void* = Pointer(Void).null
    def get_flip_bend_direction() : Bool
      if @@mb_get_flip_bend_direction.null?
        @@mb_get_flip_bend_direction = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_flip_bend_direction", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_flip_bend_direction, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_joint_one_bone2d_node : Void* = Pointer(Void).null
    def set_joint_one_bone2d_node(bone2d_node : NodePath) : Void
      if @@mb_set_joint_one_bone2d_node.null?
        @@mb_set_joint_one_bone2d_node = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_joint_one_bone2d_node", 1348162250_i64)
      end
      val_0 = bone2d_node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joint_one_bone2d_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joint_one_bone2d_node : Void* = Pointer(Void).null
    def get_joint_one_bone2d_node() : NodePath
      if @@mb_get_joint_one_bone2d_node.null?
        @@mb_get_joint_one_bone2d_node = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_joint_one_bone2d_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_joint_one_bone2d_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_joint_one_bone_idx : Void* = Pointer(Void).null
    def set_joint_one_bone_idx(bone_idx : Int64) : Void
      if @@mb_set_joint_one_bone_idx.null?
        @@mb_set_joint_one_bone_idx = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_joint_one_bone_idx", 1286410249_i64)
      end
      val_0 = bone_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joint_one_bone_idx, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joint_one_bone_idx : Void* = Pointer(Void).null
    def get_joint_one_bone_idx() : Int64
      if @@mb_get_joint_one_bone_idx.null?
        @@mb_get_joint_one_bone_idx = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_joint_one_bone_idx", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_joint_one_bone_idx, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_joint_two_bone2d_node : Void* = Pointer(Void).null
    def set_joint_two_bone2d_node(bone2d_node : NodePath) : Void
      if @@mb_set_joint_two_bone2d_node.null?
        @@mb_set_joint_two_bone2d_node = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_joint_two_bone2d_node", 1348162250_i64)
      end
      val_0 = bone2d_node
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joint_two_bone2d_node, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joint_two_bone2d_node : Void* = Pointer(Void).null
    def get_joint_two_bone2d_node() : NodePath
      if @@mb_get_joint_two_bone2d_node.null?
        @@mb_get_joint_two_bone2d_node = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_joint_two_bone2d_node", 4075236667_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_joint_two_bone2d_node, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
    @@mb_set_joint_two_bone_idx : Void* = Pointer(Void).null
    def set_joint_two_bone_idx(bone_idx : Int64) : Void
      if @@mb_set_joint_two_bone_idx.null?
        @@mb_set_joint_two_bone_idx = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "set_joint_two_bone_idx", 1286410249_i64)
      end
      val_0 = bone_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_joint_two_bone_idx, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_joint_two_bone_idx : Void* = Pointer(Void).null
    def get_joint_two_bone_idx() : Int64
      if @@mb_get_joint_two_bone_idx.null?
        @@mb_get_joint_two_bone_idx = Bridge.get_method_bind("SkeletonModification2DTwoBoneIK", "get_joint_two_bone_idx", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_joint_two_bone_idx, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class SkeletonModificationStack2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_setup : Void* = Pointer(Void).null
    def setup() : Void
      if @@mb_setup.null?
        @@mb_setup = Bridge.get_method_bind("SkeletonModificationStack2D", "setup", 3218959716_i64)
      end
      Bridge.ptrcall(@@mb_setup, @pointer, Pointer(Pointer(Void)).null, Pointer(Void).null)
    end
    @@mb_execute : Void* = Pointer(Void).null
    def execute(delta : Float64, execution_mode : Int64) : Void
      if @@mb_execute.null?
        @@mb_execute = Bridge.get_method_bind("SkeletonModificationStack2D", "execute", 1005356550_i64)
      end
      val_0 = delta
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = execution_mode
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_execute, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_enable_all_modifications : Void* = Pointer(Void).null
    def enable_all_modifications(enabled : Bool) : Void
      if @@mb_enable_all_modifications.null?
        @@mb_enable_all_modifications = Bridge.get_method_bind("SkeletonModificationStack2D", "enable_all_modifications", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_enable_all_modifications, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_modification : Void* = Pointer(Void).null
    def get_modification(mod_idx : Int64) : SkeletonModification2D
      if @@mb_get_modification.null?
        @@mb_get_modification = Bridge.get_method_bind("SkeletonModificationStack2D", "get_modification", 2570274329_i64)
      end
      val_0 = mod_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_modification, @pointer, args.to_unsafe.as(Void**), pointerof(ret_ptr).as(Void*))
      SkeletonModification2D.new(ret_ptr)
    end
    @@mb_add_modification : Void* = Pointer(Void).null
    def add_modification(modification : SkeletonModification2D) : Void
      if @@mb_add_modification.null?
        @@mb_add_modification = Bridge.get_method_bind("SkeletonModificationStack2D", "add_modification", 354162120_i64)
      end
      val_0 = modification
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_add_modification, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_delete_modification : Void* = Pointer(Void).null
    def delete_modification(mod_idx : Int64) : Void
      if @@mb_delete_modification.null?
        @@mb_delete_modification = Bridge.get_method_bind("SkeletonModificationStack2D", "delete_modification", 1286410249_i64)
      end
      val_0 = mod_idx
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_delete_modification, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_modification : Void* = Pointer(Void).null
    def set_modification(mod_idx : Int64, modification : SkeletonModification2D) : Void
      if @@mb_set_modification.null?
        @@mb_set_modification = Bridge.get_method_bind("SkeletonModificationStack2D", "set_modification", 1098262544_i64)
      end
      val_0 = mod_idx
      arg_0 = pointerof(val_0).as(Void*)
      val_1 = modification
      arg_1 = pointerof(val_1).as(Void*)
      args = [arg_0, arg_1]
      Bridge.ptrcall(@@mb_set_modification, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_set_modification_count : Void* = Pointer(Void).null
    def set_modification_count(count : Int64) : Void
      if @@mb_set_modification_count.null?
        @@mb_set_modification_count = Bridge.get_method_bind("SkeletonModificationStack2D", "set_modification_count", 1286410249_i64)
      end
      val_0 = count
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_modification_count, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_modification_count : Void* = Pointer(Void).null
    def get_modification_count() : Int64
      if @@mb_get_modification_count.null?
        @@mb_get_modification_count = Bridge.get_method_bind("SkeletonModificationStack2D", "get_modification_count", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_modification_count, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_is_setup : Void* = Pointer(Void).null
    def get_is_setup() : Bool
      if @@mb_get_is_setup.null?
        @@mb_get_is_setup = Bridge.get_method_bind("SkeletonModificationStack2D", "get_is_setup", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_is_setup, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_enabled : Void* = Pointer(Void).null
    def set_enabled(enabled : Bool) : Void
      if @@mb_set_enabled.null?
        @@mb_set_enabled = Bridge.get_method_bind("SkeletonModificationStack2D", "set_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enabled : Void* = Pointer(Void).null
    def get_enabled() : Bool
      if @@mb_get_enabled.null?
        @@mb_get_enabled = Bridge.get_method_bind("SkeletonModificationStack2D", "get_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_get_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_strength : Void* = Pointer(Void).null
    def set_strength(strength : Float64) : Void
      if @@mb_set_strength.null?
        @@mb_set_strength = Bridge.get_method_bind("SkeletonModificationStack2D", "set_strength", 373806689_i64)
      end
      val_0 = strength
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_strength, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_strength : Void* = Pointer(Void).null
    def get_strength() : Float64
      if @@mb_get_strength.null?
        @@mb_get_strength = Bridge.get_method_bind("SkeletonModificationStack2D", "get_strength", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_strength, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_skeleton : Void* = Pointer(Void).null
    def get_skeleton() : Skeleton2D
      if @@mb_get_skeleton.null?
        @@mb_get_skeleton = Bridge.get_method_bind("SkeletonModificationStack2D", "get_skeleton", 1697361217_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_skeleton, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Skeleton2D.new(ret_ptr)
    end
  end
  class Sprite2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture : Void* = Pointer(Void).null
    def set_texture(texture : Texture2D) : Void
      if @@mb_set_texture.null?
        @@mb_set_texture = Bridge.get_method_bind("Sprite2D", "set_texture", 4051416890_i64)
      end
      val_0 = texture
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture : Void* = Pointer(Void).null
    def get_texture() : Texture2D
      if @@mb_get_texture.null?
        @@mb_get_texture = Bridge.get_method_bind("Sprite2D", "get_texture", 3635182373_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Texture2D.new(ret_ptr)
    end
    @@mb_set_centered : Void* = Pointer(Void).null
    def set_centered(centered : Bool) : Void
      if @@mb_set_centered.null?
        @@mb_set_centered = Bridge.get_method_bind("Sprite2D", "set_centered", 2586408642_i64)
      end
      val_0 = centered
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_centered, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_centered : Void* = Pointer(Void).null
    def is_centered() : Bool
      if @@mb_is_centered.null?
        @@mb_is_centered = Bridge.get_method_bind("Sprite2D", "is_centered", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_centered, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_offset : Void* = Pointer(Void).null
    def set_offset(offset : Vector2) : Void
      if @@mb_set_offset.null?
        @@mb_set_offset = Bridge.get_method_bind("Sprite2D", "set_offset", 743155724_i64)
      end
      val_0 = offset
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_offset, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_offset : Void* = Pointer(Void).null
    def get_offset() : Vector2
      if @@mb_get_offset.null?
        @@mb_get_offset = Bridge.get_method_bind("Sprite2D", "get_offset", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_offset, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_flip_h : Void* = Pointer(Void).null
    def set_flip_h(flip_h : Bool) : Void
      if @@mb_set_flip_h.null?
        @@mb_set_flip_h = Bridge.get_method_bind("Sprite2D", "set_flip_h", 2586408642_i64)
      end
      val_0 = flip_h
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flip_h, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flipped_h : Void* = Pointer(Void).null
    def is_flipped_h() : Bool
      if @@mb_is_flipped_h.null?
        @@mb_is_flipped_h = Bridge.get_method_bind("Sprite2D", "is_flipped_h", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flipped_h, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_flip_v : Void* = Pointer(Void).null
    def set_flip_v(flip_v : Bool) : Void
      if @@mb_set_flip_v.null?
        @@mb_set_flip_v = Bridge.get_method_bind("Sprite2D", "set_flip_v", 2586408642_i64)
      end
      val_0 = flip_v
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_flip_v, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_flipped_v : Void* = Pointer(Void).null
    def is_flipped_v() : Bool
      if @@mb_is_flipped_v.null?
        @@mb_is_flipped_v = Bridge.get_method_bind("Sprite2D", "is_flipped_v", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_flipped_v, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_region_enabled : Void* = Pointer(Void).null
    def set_region_enabled(enabled : Bool) : Void
      if @@mb_set_region_enabled.null?
        @@mb_set_region_enabled = Bridge.get_method_bind("Sprite2D", "set_region_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_region_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_region_enabled : Void* = Pointer(Void).null
    def is_region_enabled() : Bool
      if @@mb_is_region_enabled.null?
        @@mb_is_region_enabled = Bridge.get_method_bind("Sprite2D", "is_region_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_region_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_pixel_opaque : Void* = Pointer(Void).null
    def is_pixel_opaque(pos : Vector2) : Bool
      if @@mb_is_pixel_opaque.null?
        @@mb_is_pixel_opaque = Bridge.get_method_bind("Sprite2D", "is_pixel_opaque", 556197845_i64)
      end
      val_0 = pos
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_pixel_opaque, @pointer, args.to_unsafe.as(Void**), pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_region_rect : Void* = Pointer(Void).null
    def set_region_rect(rect : Rect2) : Void
      if @@mb_set_region_rect.null?
        @@mb_set_region_rect = Bridge.get_method_bind("Sprite2D", "set_region_rect", 2046264180_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_region_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_region_rect : Void* = Pointer(Void).null
    def get_region_rect() : Rect2
      if @@mb_get_region_rect.null?
        @@mb_get_region_rect = Bridge.get_method_bind("Sprite2D", "get_region_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_region_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_set_region_filter_clip_enabled : Void* = Pointer(Void).null
    def set_region_filter_clip_enabled(enabled : Bool) : Void
      if @@mb_set_region_filter_clip_enabled.null?
        @@mb_set_region_filter_clip_enabled = Bridge.get_method_bind("Sprite2D", "set_region_filter_clip_enabled", 2586408642_i64)
      end
      val_0 = enabled
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_region_filter_clip_enabled, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_region_filter_clip_enabled : Void* = Pointer(Void).null
    def is_region_filter_clip_enabled() : Bool
      if @@mb_is_region_filter_clip_enabled.null?
        @@mb_is_region_filter_clip_enabled = Bridge.get_method_bind("Sprite2D", "is_region_filter_clip_enabled", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_region_filter_clip_enabled, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_set_frame : Void* = Pointer(Void).null
    def set_frame(frame : Int64) : Void
      if @@mb_set_frame.null?
        @@mb_set_frame = Bridge.get_method_bind("Sprite2D", "set_frame", 1286410249_i64)
      end
      val_0 = frame
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_frame, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_frame : Void* = Pointer(Void).null
    def get_frame() : Int64
      if @@mb_get_frame.null?
        @@mb_get_frame = Bridge.get_method_bind("Sprite2D", "get_frame", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_frame, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_frame_coords : Void* = Pointer(Void).null
    def set_frame_coords(coords : Vector2i) : Void
      if @@mb_set_frame_coords.null?
        @@mb_set_frame_coords = Bridge.get_method_bind("Sprite2D", "set_frame_coords", 1130785943_i64)
      end
      val_0 = coords
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_frame_coords, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_frame_coords : Void* = Pointer(Void).null
    def get_frame_coords() : Vector2i
      if @@mb_get_frame_coords.null?
        @@mb_get_frame_coords = Bridge.get_method_bind("Sprite2D", "get_frame_coords", 3690982128_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_frame_coords, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Vector2i.new(ret_ptr)
    end
    @@mb_set_vframes : Void* = Pointer(Void).null
    def set_vframes(vframes : Int64) : Void
      if @@mb_set_vframes.null?
        @@mb_set_vframes = Bridge.get_method_bind("Sprite2D", "set_vframes", 1286410249_i64)
      end
      val_0 = vframes
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_vframes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_vframes : Void* = Pointer(Void).null
    def get_vframes() : Int64
      if @@mb_get_vframes.null?
        @@mb_get_vframes = Bridge.get_method_bind("Sprite2D", "get_vframes", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_vframes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_hframes : Void* = Pointer(Void).null
    def set_hframes(hframes : Int64) : Void
      if @@mb_set_hframes.null?
        @@mb_set_hframes = Bridge.get_method_bind("Sprite2D", "set_hframes", 1286410249_i64)
      end
      val_0 = hframes
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_hframes, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_hframes : Void* = Pointer(Void).null
    def get_hframes() : Int64
      if @@mb_get_hframes.null?
        @@mb_get_hframes = Bridge.get_method_bind("Sprite2D", "get_hframes", 3905245786_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_hframes, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_rect : Void* = Pointer(Void).null
    def get_rect() : Rect2
      if @@mb_get_rect.null?
        @@mb_get_rect = Bridge.get_method_bind("Sprite2D", "get_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
  end
  class Texture2DArray < Godot::ImageTextureLayered
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_create_placeholder : Void* = Pointer(Void).null
    def create_placeholder() : Resource
      if @@mb_create_placeholder.null?
        @@mb_create_placeholder = Bridge.get_method_bind("Texture2DArray", "create_placeholder", 121922552_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_create_placeholder, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Resource.new(ret_ptr)
    end
  end
  class Texture2DArrayRD < Godot::TextureLayeredRD
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class Texture2DRD < Godot::Texture2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture_rd_rid : Void* = Pointer(Void).null
    def set_texture_rd_rid(texture_rd_rid : Int64) : Void
      if @@mb_set_texture_rd_rid.null?
        @@mb_set_texture_rd_rid = Bridge.get_method_bind("Texture2DRD", "set_texture_rd_rid", 2722037293_i64)
      end
      val_0 = texture_rd_rid
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_rd_rid, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_rd_rid : Void* = Pointer(Void).null
    def get_texture_rd_rid() : Int64
      if @@mb_get_texture_rd_rid.null?
        @@mb_get_texture_rd_rid = Bridge.get_method_bind("Texture2DRD", "get_texture_rd_rid", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_texture_rd_rid, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
  class VisibleOnScreenNotifier2D < Godot::Node2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_rect : Void* = Pointer(Void).null
    def set_rect(rect : Rect2) : Void
      if @@mb_set_rect.null?
        @@mb_set_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "set_rect", 2046264180_i64)
      end
      val_0 = rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_rect : Void* = Pointer(Void).null
    def get_rect() : Rect2
      if @@mb_get_rect.null?
        @@mb_get_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "get_rect", 1639390495_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      Rect2.new(ret_ptr)
    end
    @@mb_set_show_rect : Void* = Pointer(Void).null
    def set_show_rect(show_rect : Bool) : Void
      if @@mb_set_show_rect.null?
        @@mb_set_show_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "set_show_rect", 2586408642_i64)
      end
      val_0 = show_rect
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_show_rect, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_is_showing_rect : Void* = Pointer(Void).null
    def is_showing_rect() : Bool
      if @@mb_is_showing_rect.null?
        @@mb_is_showing_rect = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "is_showing_rect", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_showing_rect, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
    @@mb_is_on_screen : Void* = Pointer(Void).null
    def is_on_screen() : Bool
      if @@mb_is_on_screen.null?
        @@mb_is_on_screen = Bridge.get_method_bind("VisibleOnScreenNotifier2D", "is_on_screen", 36873697_i64)
      end
      ret = 0_u8
      Bridge.ptrcall(@@mb_is_on_screen, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret != 0_u8
    end
  end
  class VisibleOnScreenEnabler2D < Godot::VisibleOnScreenNotifier2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    enum EnableMode : Int64
      EnableModeInherit = 0_i64
      EnableModeAlways = 1_i64
      EnableModeWhenPaused = 2_i64
    end
    @@mb_set_enable_mode : Void* = Pointer(Void).null
    def set_enable_mode(mode : Int64) : Void
      if @@mb_set_enable_mode.null?
        @@mb_set_enable_mode = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "set_enable_mode", 2961788752_i64)
      end
      val_0 = mode
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_mode, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enable_mode : Void* = Pointer(Void).null
    def get_enable_mode() : Int64
      if @@mb_get_enable_mode.null?
        @@mb_get_enable_mode = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "get_enable_mode", 2650445576_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_enable_mode, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_enable_node_path : Void* = Pointer(Void).null
    def set_enable_node_path(path : NodePath) : Void
      if @@mb_set_enable_node_path.null?
        @@mb_set_enable_node_path = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "set_enable_node_path", 1348162250_i64)
      end
      val_0 = path
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_enable_node_path, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_enable_node_path : Void* = Pointer(Void).null
    def get_enable_node_path() : NodePath
      if @@mb_get_enable_node_path.null?
        @@mb_get_enable_node_path = Bridge.get_method_bind("VisibleOnScreenEnabler2D", "get_enable_node_path", 277076166_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_enable_node_path, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      NodePath.new(ret_ptr)
    end
  end
  class VisualShaderNodeTexture2DArray < Godot::VisualShaderNodeSample3D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_texture_array : Void* = Pointer(Void).null
    def set_texture_array(value : TextureLayered) : Void
      if @@mb_set_texture_array.null?
        @@mb_set_texture_array = Bridge.get_method_bind("VisualShaderNodeTexture2DArray", "set_texture_array", 1278366092_i64)
      end
      val_0 = value
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_texture_array, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_texture_array : Void* = Pointer(Void).null
    def get_texture_array() : TextureLayered
      if @@mb_get_texture_array.null?
        @@mb_get_texture_array = Bridge.get_method_bind("VisualShaderNodeTexture2DArray", "get_texture_array", 3984243839_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_texture_array, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      TextureLayered.new(ret_ptr)
    end
  end
  class VisualShaderNodeTexture2DArrayParameter < Godot::VisualShaderNodeTextureParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class VisualShaderNodeTexture2DParameter < Godot::VisualShaderNodeTextureParameter
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
  end
  class World2D < Godot::Resource
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_get_canvas : Void* = Pointer(Void).null
    def get_canvas() : Int64
      if @@mb_get_canvas.null?
        @@mb_get_canvas = Bridge.get_method_bind("World2D", "get_canvas", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_canvas, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_navigation_map : Void* = Pointer(Void).null
    def get_navigation_map() : Int64
      if @@mb_get_navigation_map.null?
        @@mb_get_navigation_map = Bridge.get_method_bind("World2D", "get_navigation_map", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_navigation_map, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_space : Void* = Pointer(Void).null
    def get_space() : Int64
      if @@mb_get_space.null?
        @@mb_get_space = Bridge.get_method_bind("World2D", "get_space", 2944877500_i64)
      end
      ret = 0_i64
      Bridge.ptrcall(@@mb_get_space, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_get_direct_space_state : Void* = Pointer(Void).null
    def get_direct_space_state() : PhysicsDirectSpaceState2D
      if @@mb_get_direct_space_state.null?
        @@mb_get_direct_space_state = Bridge.get_method_bind("World2D", "get_direct_space_state", 2506717822_i64)
      end
      ret_ptr = Pointer(Void).null
      Bridge.ptrcall(@@mb_get_direct_space_state, @pointer, Pointer(Pointer(Void)).null, pointerof(ret_ptr).as(Void*))
      PhysicsDirectSpaceState2D.new(ret_ptr)
    end
  end
  class WorldBoundaryShape2D < Godot::Shape2D
    def initialize(pointer : Void* = Pointer(Void).null)
      super(pointer)
    end
    @@mb_set_normal : Void* = Pointer(Void).null
    def set_normal(normal : Vector2) : Void
      if @@mb_set_normal.null?
        @@mb_set_normal = Bridge.get_method_bind("WorldBoundaryShape2D", "set_normal", 743155724_i64)
      end
      val_0 = normal
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_normal, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_normal : Void* = Pointer(Void).null
    def get_normal() : Vector2
      if @@mb_get_normal.null?
        @@mb_get_normal = Bridge.get_method_bind("WorldBoundaryShape2D", "get_normal", 3341600327_i64)
      end
      ret = Vector2.new
      Bridge.ptrcall(@@mb_get_normal, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
    @@mb_set_distance : Void* = Pointer(Void).null
    def set_distance(distance : Float64) : Void
      if @@mb_set_distance.null?
        @@mb_set_distance = Bridge.get_method_bind("WorldBoundaryShape2D", "set_distance", 373806689_i64)
      end
      val_0 = distance
      arg_0 = pointerof(val_0).as(Void*)
      args = [arg_0]
      Bridge.ptrcall(@@mb_set_distance, @pointer, args.to_unsafe.as(Void**), Pointer(Void).null)
    end
    @@mb_get_distance : Void* = Pointer(Void).null
    def get_distance() : Float64
      if @@mb_get_distance.null?
        @@mb_get_distance = Bridge.get_method_bind("WorldBoundaryShape2D", "get_distance", 1740695150_i64)
      end
      ret = 0.0_f64
      Bridge.ptrcall(@@mb_get_distance, @pointer, Pointer(Pointer(Void)).null, pointerof(ret).as(Void*))
      ret
    end
  end
end
