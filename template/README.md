# LibGodot Crystal Starter Template

This directory provides a clean, minimal starter skeleton for creating new Godot games powered by Crystal and LibGodot.

---

## Directory Structure

```
template/
├── .github/
│   └── workflows/
│       ├── ci.yml          # Automated CI: Crystal specs + build on push/PR
│       └── release.yml     # Automated releases: multi-platform build & tag release
├── project.godot           # Godot project configuration
├── scenes/                 # Godot scene files
├── spec/
│   └── main_spec.cr        # Automated Crystal node specifications
├── src/
│   └── main.cr             # Game entry point and custom nodes
├── Makefile                # Cross-platform build configuration (Windows & Linux)
├── build.ps1               # PowerShell build script
├── run.ps1                 # PowerShell run script
└── run-editor.ps1          # PowerShell editor launcher script
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

### 3. Run Automated Tests
Run Crystal specifications:

```bash
crystal spec
```

### 4. Build & Run
Run with Make:

```bash
make          # Build game library (game.dll on Windows, game.so on Linux)
make run      # Launch with Godot
make editor   # Open in Godot Editor
```

Or run via PowerShell scripts:

```powershell
.\build.ps1
.\run.ps1
```

---

## Automated CI/CD (GitHub Actions)

The template comes pre-configured with out-of-the-box GitHub Actions in `.github/workflows/`:
- **`ci.yml`**: Runs `crystal spec`, builds the game, and runs a headless Godot smoke test on every push and pull request.
- **`release.yml`**: Automatically packages Windows and Linux game release archives and publishes a GitHub Release when you push a version tag (e.g. `git tag v1.0.0 && git push --tags`).
