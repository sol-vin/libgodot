require "libgodot"

# MyNode node
node MyNode < Node do
  def _ready : Void
    Godot.print("MyNode initialized")
  end

  def _process(delta : Float64) : Void
  end
end