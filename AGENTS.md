# Agent Guidelines for LibGodot

## 1. Strict Separation: LibGodot (`src/`) vs. Demo Project (`demo/`)

- **LibGodot (`src/`) is strictly a library**:
  - `src/` contains only the reusable Crystal bindings, macros, and GDExtension bridge (`src/bridge/crystal_bridge.cpp`, `src/libgodot.cr`, and `src/libgodot/*`).
  - **NEVER put demo code, game logic, sample nodes, or test scripts inside `src/`**.
  - **DO NOT create `src/main.cr`**. The library entry point is `src/libgodot.cr` (`require "libgodot"`).
  - Do not add demo-specific classes, helpers, or workarounds inside `src/`. The library must remain clean, modular, and completely decoupled from any specific game project.

- **The Demo Project (`demo/`) is an independent consumer**:
  - `demo/` is a standalone Godot project used to test, showcase, and verify `libgodot` capabilities.
  - All game scenes, sample nodes (`DemoCharacter`, `DemoPlayer`, `DemoHUD`, etc.), and project entry points belong exclusively in `demo/` (specifically `demo/src/main.cr`).
  - The demo consumes the library via `require "../../src/libgodot"` (or `require "libgodot"`).

## 2. No Mocking or Cheating for Demos

- Never add hardcoded shortcuts, mock classes, or fake implementations into `libgodot` solely to make a demo or test pass.
- Features must be properly implemented through Godot's GDExtension C-API and the Crystal runtime bridge.

## 3. Build Tooling & Entry Points

- The root `Makefile` defaults to compiling `demo/src/main.cr` as the application entry point (`ENTRY = demo/src/main.cr`).
- When compiling binaries for testing the demo, output artifacts should be generated and synchronized into `bin/` and `demo/bin/`.
- Automated specifications and unit tests reside in `spec/`.
