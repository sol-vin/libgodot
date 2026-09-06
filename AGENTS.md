# Agent Guidelines for LibGodot

## 1. Strict Separation: LibGodot (`src/`) vs. Test (`test/`) vs. Examples (`examples/`)

- **LibGodot (`src/`) is strictly a library**:
  - `src/` contains only the reusable Crystal bindings, macros, and GDExtension bridge (`src/bridge/crystal_bridge.cpp`, `src/libgodot.cr`, and `src/libgodot/*`).
  - **NEVER put project code, game logic, sample nodes, or test scripts inside `src/`**.
  - **DO NOT create `src/main.cr`**. The library entry point is `src/libgodot.cr` (`require "libgodot"`).
  - Do not add demo- or test-specific classes, helpers, or workarounds inside `src/`. The library must remain clean, modular, and completely decoupled from any specific game project.

- **The Test Suite Project (`test/`) is a dedicated verification consumer**:
  - `test/` is a standalone Godot project opened in the editor or run standalone to test the bridge.
  - Features `@tool` in-editor testers (`ToolTester2D`, `ToolTester3D`), custom inspector buttons, and the interactive runtime UI panel (`RunTesterPanel`).
  - All test definitions, assertions, test scenes, and test entry points reside in `test/` (specifically `test/src/main.cr`).

- **Example Projects (`examples/`) are independent consumers**:
  - `examples/` holds all example showcase projects (e.g. `examples/basic_demo`).
  - New examples can be scaffolded using `.\create-new-example.ps1 -Name <name>`.
  - All examples are compiled via `make examples`.

## 2. No Mocking or Cheating for Demos or Tests

- Never add hardcoded shortcuts, mock classes, or fake implementations into `libgodot` solely to make a demo or test pass.
- Features must be properly implemented through Godot's GDExtension C-API and the Crystal runtime bridge.

## 3. Build Tooling & Entry Points

- The root `Makefile` defaults to compiling `test/src/main.cr` as the application entry point (`ENTRY = test/src/main.cr`).
- When compiling binaries, output artifacts are generated and synchronized into `bin/`, `test/bin/`, `template/bin/`, and `examples/*/bin/`.
- Automated specifications and unit tests reside in `spec/`.
