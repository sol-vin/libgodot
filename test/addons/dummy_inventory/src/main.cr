require "libgodot"

@[Tool]
node InventoryGrid < Control do
  tool

  @[Export]
  property capacity : Int32 = 20

  @[Export]
  property item_count : Int32 = 5

  signal item_added(item_name : String, slot : Int32)

  def add_item(item_name : String) : Bool
    return false if @item_count >= @capacity
    @item_count += 1
    emit_item_added(item_name, @item_count)
    true
  end
end

@[Tool]
node DummyInventoryPlugin < EditorPlugin do
  tool

  def _enter_tree : Void
    Godot.print("[DummyInventoryPlugin] Initialized successfully in editor!")
  end

  def _exit_tree : Void
    Godot.print("[DummyInventoryPlugin] Deinitialized.")
  end
end
