require "libgodot"

# NewNode node
node MyNewCrystalNode < Node do
  def _ready : Void
	Godot.print("NewNode initialized")
  end

  def _process(delta : Float64) : Void
  end
end
