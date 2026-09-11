---
name: libgodot-test-runner
description: >-
  Execute the multi-tier test suite: Crystal specs, headless in-editor @tool tests,
  and standalone runtime test projects. Use when verifying code changes, checking for
  memory leaks, or running CI verification.
---

# LibGodot Test Runner & Verification Runbook

This skill provides procedures for running and troubleshooting the complete LibGodot test infrastructure.

## Running the Automated Test Suite

To run all automated verification suites in one command:
```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/run_tests.ps1
```
Or via Makefile:
```bash
make test
```

---

## The 4 Test Tiers

### 1. Crystal Specification Suite (`spec/`)
Executes headless Crystal specs validating language-level bindings:
- `spec/libgodot_spec.cr`: Basic node declaration, vector math, default property values.
- `spec/features_spec.cr`: DSL syntax, exported property macros, custom getters/setters.
- `spec/safety_and_bindings_spec.cr`: Boehm GC lifetime retention, dynamic scaling (220+ properties, 10+ signal args), Variant round-trips.
- `spec/boot_spec.cr`: Engine boot and initialization callbacks.

To run specs directly:
```bash
crystal spec spec/features_spec.cr spec/safety_and_bindings_spec.cr spec/libgodot_spec.cr spec/boot_spec.cr
```

### 2. In-Editor `@tool` and Script Loading Verification
Executes tool script tests and validates script resource loading inside the Godot Editor:
- Tests `ToolTester2D` and `ToolTester3D` in `test/scenes/main.tscn`.
- Verifies editor-only callbacks, tool buttons, and live inspector updates.
- Command executed internally:
  ```bash
  godot.exe --headless --editor --path test --quit-after 100
  ```
- **In-Editor Script Loading & Clean Shutdown Verification Protocol**:
  Whenever modifying editor integration, bridge deinitialization, or resource loaders/savers, you MUST run this verification check:
  1. **Launch the Godot Editor**:
     ```powershell
     cmd /c "godot.exe --verbose --editor --path template --quit-after 50 2>&1"
     ```
  2. **Verify Script Resource Loader & Language**:
     - Ensure `ResourceFormatLoaderCrystal` correctly handles `.cr` files as `Script` / `CrystalScript` resources (not plain text files).
     - Check logs for absence of loader failures:
       - No `ERROR: No loader found for resource: res://src/main.cr (expected type: Script)`
       - No `ERROR: Condition "res.is_null()" is true. Returning: ERR_CANT_OPEN`
       - No `ERROR: Required virtual method CrystalLanguage::_... must be overridden before calling.`
  3. **Verify Clean Editor Shutdown**:
     - Check console logs upon closing the editor: must contain **ZERO** `ERROR: BUG: Unreferenced static string to 0: ...` errors.
     - Never call `.destroy` or manually unparent editor-owned UI nodes (e.g. `EditorDock` or editor titlebar buttons).
     - Never call `gd_classdb_unregister_extension_class` during process shutdown (`is_engine_shutting_down()`); Godot's engine cleanup handles ClassDB destruction automatically.
  4. **Automated Verification Command**:
     ```powershell
     powershell -File scripts/verify_editor.ps1 -Path template -QuitAfter 50
     ```

### 3. Standalone Runtime Project Tests (`test/`)
Runs the full interactive test project in Godot:
- Boots `test/scenes/main.tscn` containing the `RunTesterPanel` test UI.
- Executes all modular test suites in `test/src/suites/`:
  - `test_2d_nodes.cr`: Sprite2D, Node2D transforms, Area2D, CollisionShape2D.
  - `test_3d_nodes.cr`: Node3D transforms, Camera3D, DirectionalLight3D.
  - `test_control_nodes.cr`: Label, Button, VBoxContainer, MarginContainer.
  - `test_meshes_materials.cr`: BoxMesh, SphereMesh, StandardMaterial3D.
  - `test_physics_shapes.cr`: BoxShape3D, SphereShape3D, physics layers.
  - `test_audio_animation.cr`: AudioStreamPlayer, AnimationPlayer.
  - `test_resources_utilities.cr`: PackedScene, ResourceLoader, ConfigFile.
  - `test_lifecycle_destruction.cr`: SceneTree reparenting, `queue_free`, `.destroy`.
  - `test_classdb_coverage.cr`: Reflection lookups and method dispatch.
  - `test_concurrency.cr`: Cooperative fibers, channels, mutexes, thread safety.
- Command executed internally:
  ```bash
  godot.exe --headless --path test --quit-after 250
  ```

### 4. Template and Example Smoke Tests
Verifies that `template/` and all projects under `examples/` boot cleanly without crashing.
- Test template runtime:
  ```bash
  godot.exe --headless --path template --quit-after 50
  ```
- Test template editor launch and script loader:
  ```bash
  godot.exe --headless --editor --path template --quit-after 50
  ```

---

## Test Artifacts and Logs

After test execution, inspect:
- `test/.runtime_test_results.txt`: Text summary of all passed and failed tests.
- `test/.runtime_tests_passed`: Marker file containing `"PASS"` if all tests passed.
- `test/test_report.json`: JSON output containing test statistics and timing.
- `test/test_report.md`: Markdown summary of test execution.

---

## Quantitative Zero-Leak Verification

LibGodot verifies zero memory leaks using Godot's `Performance` singleton monitors:
```crystal
initial_nodes = Godot.performance.get_monitor(Godot::Performance::OBJECT_NODE_COUNT)
# ... allocate, reparent, queue_free nodes ...
Godot.gc_collect
final_nodes = Godot.performance.get_monitor(Godot::Performance::OBJECT_NODE_COUNT)
TestFramework.assert_eq final_nodes, initial_nodes, "Node count must return to baseline!"
```
If object count or static memory leaks, the test runner fails immediately.
