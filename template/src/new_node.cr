require "libgodot"

# NewNode node
node NewNode < Node do
  def _ready : Void
    Godot.print("NewNode initialized")
  end

  def _process(delta : Float64) : Void
  end
end