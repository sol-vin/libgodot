# Generated strongly typed wrapper for GDScript node `ComprehensiveInteropNode`
# Script Path: res://scripts/comprehensive_interop_node.gd
module Godot
  class ComprehensiveInteropNode < Godot::Node2D
	# Wrap a native pointer to an existing ComprehensiveInteropNode instance
	def initialize(pointer : Void* = Pointer(Void).null)
	  super(pointer)
	end
	# Helper to wrap any Godot node into a typed ComprehensiveInteropNode
	def self.from(node : Godot::Object) : self
	  new(node.pointer)
	end
	# Property `int_prop` (Int64)
	def int_prop : Int64
	  call_i64("get", "int_prop")
	end
	def int_prop=(val) : Void
	  call("set", "int_prop", val)
	end
	# Property `float_prop` (Float64)
	def float_prop : Float64
	  call_f64("get", "float_prop")
	end
	def float_prop=(val) : Void
	  call("set", "float_prop", val)
	end
	# Property `string_prop` (String)
	def string_prop : String
	  call_str("get", "string_prop")
	end
	def string_prop=(val) : Void
	  call("set", "string_prop", val)
	end
	# Property `bool_prop` (Bool)
	def bool_prop : Bool
	  call_bool("get", "bool_prop")
	end
	def bool_prop=(val) : Void
	  call("set", "bool_prop", val)
	end
	# Property `internal_reset_count` (Int64)
	def internal_reset_count : Int64
	  call_i64("get", "internal_reset_count")
	end
	def internal_reset_count=(val) : Void
	  call("set", "internal_reset_count", val)
	end
	# Property `last_transition_old` (String)
	def last_transition_old : String
	  call_str("get", "last_transition_old")
	end
	def last_transition_old=(val) : Void
	  call("set", "last_transition_old", val)
	end
	# Property `last_transition_new` (String)
	def last_transition_new : String
	  call_str("get", "last_transition_new")
	end
	def last_transition_new=(val) : Void
	  call("set", "last_transition_new", val)
	end
	# Method `compute_scaled_sum` -> Int64
	def compute_scaled_sum(a : Int64, b : Int64, multiplier : Float64) : Int64
	  call_i64("compute_scaled_sum", a, b, multiplier)
	end
	# Method `calculate_hypotenuse` -> Float64
	def calculate_hypotenuse(a : Float64, b : Float64) : Flo