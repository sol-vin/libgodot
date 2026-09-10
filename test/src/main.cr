require "../../src/libgodot"
require "./generated/project_nodes/all_project_nodes"

# =============================================================================
# LibGodot Test Runner & Assertion Framework
# =============================================================================

module TestFramework
  class AssertionError < Exception
  end

  record TestResult, category : String, name : String, passed : Bool, message : String = ""

  def self.assert_true(cond : Bool, msg : String = "Expected true, got false")
	raise AssertionError.new(msg) unless cond
  end

  def self.assert_false(cond : Bool, msg : String = "Expected false, got true")
	raise AssertionError.new(msg) if cond
  end

  def self.assert_eq(actual, expected, msg : String = "")
	if actual != expected
	  detail = msg.empty? ? "Expected #{expected.inspect}, got #{actual.inspect}" : "#{msg} (Expected #{expected.inspect}, got #{actual.inspect})"
	  raise AssertionError.new(detail)
	end
  end

  def self.assert_approx_eq(actual : Float32 | Float64, expected : Float32 | Float64, epsilon : Float64 = 0.001, msg : String = "")
	diff = (actual - expected).abs
	if diff > epsilon
	  detail = msg.empty? ? "Expected ~#{expected}, got #{actual} (diff #{diff})" : "#{msg} (Expected ~#{expected}, got #{actual})"
	  raise AssertionError.new(detail)
	end
  end

  def self.assert_not_nil(val, msg : String = "Expected non-nil value")
	raise AssertionError.new(msg) if val.nil?
  end

  def self.assert_nil(val, msg : String = "Expected nil value")
	raise AssertionError.new(msg) unless val.nil?
  end

  # Signal Recording and Spy Helper
  class SignalSpy
	getter emissions = Array(Array(String)).new
	getter emitter : Godot::Object
	getter signal_name : String

	def initialize(@emitter : Godot::Object, @signal_name : String)
	end

	def record(*args)
	  @emissions << args.map(&.to_s).to_a
	end

	def count : Int32
	  @emissions.size
	end

	def emitted? : Bool
	  !@emissions.empty?
	end

	def clear
	  @emissions.clear
	end
  end

  # =====================================