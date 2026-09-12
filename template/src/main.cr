require "libgodot"
require "./**"

# Main root node for the template project
node MainNode < Node3D do
  @[ExportMultiline]
  property say_text : String = "Hello! Welcome to crystal in godot!\n Written with love by sol.vin"

  # Emitted when the node completes initialization
  signal initialized

  def _ready
	Godot.print("Starting the game!")
	
	get_tree.create_timer(5.0).timeout.connect do
	  say
	end
	
	emit_initialized
  end
  
  def say
	 Godot.print(say_text)
  end
end
