@tool
extends Node
class_name InteropController

# GDScript <-> Crystal Interoperability Test Controller
signal gd_ping(val: int)
signal gd_pong(msg: String)

var counter: int = 0
var received_node_name: String = ""

func add_numbers(a: int, b: int) -> int:
	return a + b

func compute_distance(p1: Vector2, p2: Vector2) -> float:
	return p1.distance_to(p2)

func format_greeting(name: String) -> String:
	return "Hello from GDScript, %s!" % name

func is_node_valid_and_named(node: Node, expected_name: String) -> bool:
	if node == null:
		return false
	return node.name == expected_name

func spawn_node_for_crystal(node_name: String) -> Node:
	var n = Node.new()
	n.name = node_name
	add_child(n)
	return n

func inspect_crystal_node(node: Node) -> String:
	if node == null:
		return "NIL"
	received_node_name = str(node.name)
	return "OK:%s:%s" % [node.name, node.get_class()]

func reparent_node_from_crystal(child: Node, new_parent: Node) -> bool:
	if child == null or new_parent == null:
		return false
	if child.get_parent() != null:
		child.get_parent().remove_child(child)
	new_parent.add_child(child)
	return child.get_parent() == new_parent

func increment_counter(amount: int) -> int:
	counter += amount
	return counter

func fire_gd_ping(val: int) -> void:
	emit_signal("gd_ping", val)

func run_await_sequence() -> String:
	await get_tree().process_frame
	return "Awaited Frame Successfully"

func destroy_node_from_gdscript(target: Node) -> bool:
	if target == null:
		return false
	target.free()
	return true

func queue_free_node_from_gdscript(target: Node) -> bool:
	if target == null:
		return false
	target.queue_free()
	return true

