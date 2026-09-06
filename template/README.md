# LibGodot Crystal Starter Template

This directory provides a clean, minimal starter skeleton for creating new Godot games powered by Crystal and LibGodot.

---

## Directory Structure

```
template/
├── project.godot       # Godot project configuration
├── scenes/             # Godot scene files
├── src/
│   └── main.cr         # Game entry point and root custom nodes
├── Makefile            # Build configuration
├── build.ps1           # PowerShell build script
├── run.ps1             # PowerShell run script
└── run-editor.ps1      # PowerShell editor launcher script
```

---

## Getting Started

### 1. Copy the Template
Copy the `template/` directory to create your new project:

```bash
cp -r template my_game
cd my_game
```

### 2. Define Your Nodes
Edit `src/main.cr` to define your custom Godot nodes:

```crystal
require "libgodot"

# Root node for your game scene
node MainNode < Node3D do
  # Rotation speed in radians per second
  @[Export(range: 0.1_f32..10.0_f32, step: 0.1_f32)]
  property rotation_speed : Float32 = 1.0_f32

  # Emitted when initialization completes
  signal initialized

  def _ready
    Godot.print("Game initialized successfully!")
    emit_initialized
  end

  def _process(delta : Float64) : Void
    rot = rotation
    rot.y += rotation_speed * delta.to_f32
    self.rotation = rot
  end
end
```

### 3. Build & Run
Run with Make:

```bash
make          # Build game.dll
make run      # Launch with Godot
make editor   # Open in Godot Editor
```

Or run via PowerShell scripts:

```powershell
.\build.ps1
.\run.ps1
```
