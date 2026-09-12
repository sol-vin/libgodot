# Generated strongly typed wrapper for GDScript node `InteropController`
# Script Path: res://scripts/interop_controller.gd
module Godot
  class InteropController < Godot::Node
	# Wrap a native pointer to an existing InteropController instance
	def initialize(pointer : Void* = Pointer(Void).null)
	  super(pointer)
	end
	# Helper to wrap any Godot node into a typed InteropController
	def self.from(node : Godot::Object) : self
	  new(node.pointer)
	end
	# Property `counter` (Int64)
	def counter : Int64
	  call_i64("get", "counter")
	end
	def counter=(val) : Void
	  call("set", "counter", val)
	end
	# Property `received_node_name` (String)
	def received_node_name : String
	  call_str("get", "received_node_name")
	end
	def received_node_name=(val) : Void
	  call("set", "received_node_name", val)
	end
	# Property `channel_received_count` (Int64)
	def channel_received_count : Int64
	  call_i64("get", "channel_received_count")
	end
	def channel_received_count=(val) : Void
	  call("set", "channel_received_count", val)
	end
	# Property `last_channel_received_val` (String)
	def last_channel_received_val : String
	  call_str("get", "last_channel_received_val")
	end
	def last_channel_received_val=(val) : Void
	  call("set", "last_channel_received_val", val)
	end
	# Property `last_crystal_signal_name` (String)
	def last_crystal_signal_name : String
	  call_str("get", "last_crystal_signal_name")
	end
	def last_crystal_signal_name=(val) : Void
	  call("set", "last_crystal_signal_name", val)
	end
	# Property `last_crystal_signal_data` (String)
	def last_crystal_signal_data : String
	  call_str("get", "last_crystal_signal_data")
	end
	def last_crystal_signal_data=(val) : Void
	  call("set", "last_crystal_signal_data", val)
	end
	# Property `signal_call_count` (Int64)
	def signal_call_count : Int64
	  call_i64("get", "signal_call_count")
	end
	def signal_call_count=(val) : Void
	  call("set", "signal_call_count", val)
	end
	# Method `add_numbers` -> Int64
	def add_numbers(a : Int64, b : Int64) : Int64
	  call_i64("add_numbers", a