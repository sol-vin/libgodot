---
name: libgodot-scaffold
description: >-
  Scaffold new showcase examples and redistributable Godot addons using LibGodot.
  Use when creating a new demo project, example game, or packaging an addon.
---

# LibGodot Project Scaffolding Runbook

This skill outlines how to create new showcase examples and redistributable GDExtension addons without violating project separation rules.

---

## 1. Scaffolding a New Showcase Example

To create a new showcase project under `examples/<name>`:
```powershell
.\create-new-example.ps1 -Name <example_name>
```

### What this script creates:
1. `examples/<example_name>/`:
   - `project.godot`: Godot project configured with Crystal extension addon.
   - `shard.yml`: Crystal shard dependency pointing to root `../../src`.
   - `src/main.cr`: Entry point defining example nodes.
   - `scenes/main.tscn`: Starter scene with your Crystal node.
   - `Makefile`: Standalone build script.
   - `bin/`: Target folder for compiled `game.dll`, `crystal_bridge.dll`, and runtime DLLs.
2. Registers the new example in the root build pipeline:
   - Compiling via `make examples` or `make all` will automatically include the new example.

### Critical Rule for Examples:
- **Never put example code in `src/`!**
- All example game logic, character controllers, procedural generators, and UI panels must reside exclusively in `examples/<name>/src/main.cr` and associated files.

---

## 2. Scaffolding a New Redistributable Addon

To create a standalone, redistributable Godot addon package:
```powershell
.\create-new-addon.ps1 -Name <addon_name>
```

### What this creates:
1. An isolated Godot project designed to distribute a Crystal-backed GDExtension library.
2. Generates:
   - Extension manifest (`<addon_name>.gdextension`) configured for Windows, Linux, and Android.
   - `addons/<addon_name>/` structure ready for export into other Godot projects.
   - Packaging script (`package.ps1`) to create a distributable `.zip` archive.

---

## 3. Post-Scaffolding Verification

After scaffolding an example:
```powershell
# Compile all projects including the new example
make all

# Open the new example in the Godot Editor
godot.exe --editor --path examples/<example_name>
```
