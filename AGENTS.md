# Agent Guidelines for LibGodot

This document is the authoritative engineering and operational manual for AI agents and contributors working on the **LibGodot for Crystal** project. Every agent working in this repository must read, understand, and strictly abide by the rules, architectural invariants, and verification protocols outlined below.

---

## 1. Architectural Invariants & Directory Separation

The project maintains a strict boundary between the core engine bindings library, test projects, showcase examples, and starter templates.

```
libgodot/
├── src/                          # STRICTLY the reusable LibGodot library
│   ├── libgodot.cr               # Root library entry point (require "libgodot")
│   ├── bridge/crystal_bridge.cpp # C++ GDExtension loader bridge
│   └── libgodot/                 # Core macros, C-API, bridge, docs, and generated classes
├── test/                         # Dedicated standalone verification consumer project
│   ├── src/main.cr               # Test suite application entry point
│   ├── src/suites/               # Modular test suites by feature area
│   ├── project.godot             # Standalone Godot test project configuration
│   └── scenes/                   # Test scenes (main.tscn, 2d, 3d, UI)
├── examples/                     # Independent consumer showcase projects
│   └── basic_demo/               # Standard showcase project
├── template/                     # Starter template for new standalone games
├── template-addon/               # Starter template for redistributable Godot addons
├── addons/crystal_integration/   # GDExtension manifest (.gdextension) & editor build hook
├── bin/                          # Output binaries, bridge DLL, and shared dependencies
├── spec/                         # Headless Crystal unit specifications
└── .agents/                      # Agent skills, runbooks, and customizations
```

### Strict Separation Rules:
1. **`src/` is strictly a reusable library**:
   - `src/` contains **only** reusable Crystal bindings, engine reflection macros, C-API definitions, and the C++ loader bridge (`src/bridge/crystal_bridge.cpp`).
   - **NEVER put project code, game logic, sample nodes, player scripts, or test scenes inside `src/`**.
   - **DO NOT create `src/main.cr`**. The library entry point is `src/libgodot.cr` (`require "libgodot"`).
   - Do not add demo-specific or test-specific classes, helpers, or workarounds inside `src/`. The library must remain clean, modular, and completely decoupled from any specific game project.
2. **`test/` is a dedicated verification consumer**:
   - `test/` is a standalone Godot project that can be opened in the Godot Editor (`make editor`) or run standalone (`make run`).
   - All test definitions, assertions, test scenes, `@tool` in-editor testers (`ToolTester2D`, `ToolTester3D`), and the interactive runtime UI panel (`RunTesterPanel`) reside in `test/` (entry point: `test/src/main.cr`).
3. **`examples/` and `template/` are independent consumers**:
   - Each example and template project is a self-contained Godot project with its own `project.godot`, `shard.yml`, `Makefile`, and `scenes/`.
   - New examples must be scaffolded using `.\create-new-example.ps1 -Name <name>`.
   - All examples are compiled via `make examples`.

---

## 2. Dual-Paradigm Execution Model

LibGodot supports two distinct execution paradigms designed for both rapid in-editor iteration and lean standalone production shipping:

<table>
  <thead>
    <tr>
      <th align="left">Paradigm</th>
      <th align="left">Mode A: GDExtension In-Editor</th>
      <th align="left">Mode B: Standalone LibGodot Host</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Host Binary</strong></td>
      <td>Godot Engine (<code>godot.exe</code>)</td>
      <td>Crystal Executable (<code>bin/game.exe</code>)</td>
    </tr>
    <tr>
      <td><strong>Primary DLLs</strong></td>
      <td><code>bin/crystal_bridge.dll</code> + <code>bin/game.dll</code></td>
      <td><code>bin/libgodot.dll</code> (or <code>.so</code>)</td>
    </tr>
    <tr>
      <td><strong>GC Bootstrapping</strong></td>
      <td>Initialized by C++ loader bridge (<code>GC_init()</code>)</td>
      <td>Initialized natively by Crystal CRT</td>
    </tr>
    <tr>
      <td><strong>Hot Reloading</strong></td>
      <td>Automatic timestamped shadow DLL loading on F5 / F6</td>
      <td>Recompilation of standalone executable required</td>
    </tr>
    <tr>
      <td><strong>Primary Use Case</strong></td>
      <td>Development, editor tool scripts, level design</td>
      <td>Production shipping, headless CI, embedded runners</td>
    </tr>
  </tbody>
</table>

### Mode A Mechanics & Windows Shadow Loading:
- On Windows, loading a DLL via `LoadLibraryA` locks the file on disk, preventing the compiler from overwriting `game.dll`.
- In development mode, `crystal_bridge.cpp` creates a timestamped shadow copy (`game_loaded_<PID>_<TIMESTAMP>.dll`) and loads the shadow copy.
- This leaves `bin/game.dll` unlocked so Crystal can rebuild freely while the Godot Editor remains open.
- Pressing **F5** in the editor triggers `EditorPlugin._build()` in `addons/crystal_integration/crystal_integration.gd`, recompiling `game.dll` and reloading instantly.

---

## 3. Build Tooling, Compilation & Synchronization

### The Golden Build Rule: Always Use `make all`
- **Whenever compiling or rebuilding, agents MUST run `make all` (or `make all RELEASE=1`)**.
- **NEVER run partial build targets** (e.g. `make bridge`, `make test_project`, or `make game_dll`) in isolation without syncing.
- Running `make all` guarantees:
  1. `src/bridge/crystal_bridge.cpp` is compiled into `bin/crystal_bridge.dll`.
  2. Runtime dependencies (`gc.dll`, `iconv-2.dll`, `pcre2-8.dll`, `libgodot.dll`) are verified.
  3. GDExtension manifests and addons are updated across all projects.
  4. Test suite project (`test/bin/game.dll`) is compiled.
  5. All showcase projects in `examples/` are compiled.
  6. Starter templates (`template/bin/game.dll`, `template-addon/dist/`) are compiled.
  7. All output binaries are synchronized across `bin/`, `test/bin/`, `template/bin/`, and `examples/*/bin/`.
  8. Full test suite verification runs.
- **Monitoring Rule**: When running `make all` as a background task, agents must check its progress every 30 seconds (via `schedule` or `manage_task` status check) to actively detect progress, avoid stalls, and monitor build step transitions.

### Build Target Reference:
- `make all`: Full workspace build, synchronization, and test run.
- `make all RELEASE=1`: Full release build with `--release -O3` optimizations.
- `make test`: Executes specs, headless in-editor tool tests, and runtime test project.
- `make docs`: Generates offline HTML API documentation into `docs/` using `crystal docs`.
- `make run`: Launches the test project directly in Godot.
- `make editor`: Opens the test project in the Godot Editor (`godot.exe --editor --path test`).
- `make clean`: Cleans build artifacts while safely preserving runtime DLLs (`libgodot.dll`, `gc.dll`).

---

## 4. Memory Safety, Object Lifecycle & Dead-Pointer Protection

LibGodot bridges two distinct memory models:
- **Crystal Boehm GC**: Collects Crystal heap objects, fibers, and wrapper instances (`Godot::Object`).
- **Godot ObjectDB & Reference Counting**: Manages native C++ engine nodes and refcounted resources.

### The Dead-Pointer Hazard
If an object is destroyed in Godot or GDScript (e.g. via `queue_free()` or `free()`), standard C-API bindings retain a raw C++ pointer to deallocated memory. Dereferencing this dead pointer causes an immediate, unrecoverable **segmentation fault (`ACCESS_VIOLATION / 0xC0000005`)** that crashes the game without a stack trace.

### Safety Invariants Every Agent Must Maintain:
1. **Monotonic 64-bit Instance ID Tracking**:
   Every `Godot::Object` wrapper tracks its engine-assigned `@instance_id`. Godot's `ObjectDB` generates monotonic 64-bit IDs that never collide with recycled heap addresses.
2. **Always Enforce `#check_alive!`**:
   Before performing method dispatches, reflection calls, or scene operations on Godot objects, LibGodot calls `#check_alive!`. If the object was freed by Godot or GDScript, it sets `@pointer = null` and raises `Godot::DisposedObjectError`.
3. **Defensive Inspection with `#alive?` and `#destroyed?`**:
   When maintaining references to transient scene entities (enemies, bullets, UI elements), check `#alive?` before accessing them.
4. **Node Ownership Rules**:
   - Nodes added to the scene tree are owned by the tree; call `node.queue_free` to let Godot deallocate them cleanly at frame end.
   - Unparented standalone nodes created via `Godot.create(Godot::Node2D)` are **not** owned by Godot; you **MUST** call `node.destroy` when done with them to prevent native C++ memory leaks.
5. **RefCounted / Resource Rules**:
   - `RefCounted` and `Resource` instances are managed by Godot's atomic reference counter (`reference()`, `unreference()`). Never call manual `.destroy` on refcounted resources.

---

## 5. Concurrency, Fibers & Thread Safety

Godot's runtime is fundamentally single-threaded for scene graph operations. Agents writing concurrent code must follow these rules:

1. **SceneTree Modifications Must Stay on the Main Thread**:
   - **NEVER** call `add_child`, `remove_child`, `reparent`, or `queue_free` from an OS background thread (`Thread.new`) or un-yielded fiber. Doing so corrupts Godot's internal child arrays and causes engine crashes.
2. **Cooperative Fibers Require Yielding in `_process`**:
   - Godot controls the OS main loop. Spawned fibers (`spawn do ... end`) will starve unless the main thread cooperatively yields via `Fiber.yield` in `_process(delta)`.
3. **Avoid Blocking `sleep` in Fibers and Threads**:
   - **Never call top-level `sleep` in a spawned fiber**; Godot does not pump Crystal's LibEvent/IOCP event loop, so the fiber will hang indefinitely. Use Godot's `get_tree.create_timer(sec)` or frame delta accumulators instead.
   - **Never call top-level `sleep` in `Thread.new`**; in Crystal 1.20+, top-level `sleep` yields to an `ExecutionContext`, raising `NilAssertionError: Fiber#execution_context cannot be nil`. For genuine OS thread sleeps, use `Crystal::System::Thread.sleep(duration)`.
4. **Use `Channel(T)` for Background Worker Processing (Actor Pattern)**:
   - Offload heavy computation, pathfinding, or procedural generation to background OS threads (`Thread.new`).
   - Workers send immutable data back via `Channel(T)`.
   - **Always use buffered channels (`Channel(T).new(capacity)`) across OS threads.** In Crystal 1.20+, unbuffered channels (`Channel(T).new`) suspend the calling fiber when no receiver is ready; on raw OS threads (`Thread.new`), `Fiber#execution_context` is `nil`, so suspending raises `NilAssertionError: Fiber#execution_context cannot be nil`.
   - The main thread drains the channel non-blockingly during `_process(delta)` using `select ... when ... else` or after `thread.join`.
5. **Cross-Thread Dispatch via `call_deferred`**:
   - When background threads need to notify Godot nodes, use `node.call_deferred("method_name", *args)`. Godot buffers these into its thread-safe `MessageQueue` for dispatch on the main thread.
6. **Protect Shared Crystal Collections with `::Thread::Mutex`**:
   - Standard Crystal `Hash` and `Array` are not thread-safe. When caching state across threads, wrap access in `::Thread::Mutex.new`.
7. **Awaiting Signals & Timers via `await`**:
   - LibGodot supports two complementary signal awaiting paradigms:
     - **First-Class Bound Signals**: `await(enemy.died)` or `enemy.died.await` (compile-time checked, auto-generated from `signal` declarations).
     - **Classic Target & String Identifier**: `await(enemy, "died")` or `enemy.await_signal("died")` (ideal for dynamic runtime strings, RPC events, or GDScript interop).
   - Both approaches support optional timeout arguments (`timeout_sec: 5.0`).
   - Use `await(timer.timeout)`, `await(timer)`, or `await(duration_seconds)` for non-blocking delays without halting the engine main loop.
   - Awaiting fibers validate `#alive?` on every frame slice, raising `Godot::DisposedObjectError` if the target object is freed before the signal arrives.

---

## 6. Node DSL, Exports & Doc Comment Harvesting

### Node Authoring Conventions:
```crystal
require "libgodot"

# Player character with physics movement and health tracking
node Player < CharacterBody3D do
  # Movement speed in meters per second
  @[Export(range: 1.0_f32..20.0_f32, step: 0.5_f32)]
  property speed : Float32 = 7.0_f32

  # Maximum hit points
  @[Export(range: 10..500, step: 10)]
  property max_health : Int32 = 100

  # Emitted when player health changes
  signal health_changed(current : Int32, max_health : Int32)

  # Emitted when player dies
  signal died

  def _ready : Void
    Godot.print("Player initialized: #{name}")
  end

  def _physics_process(delta : Float64) : Void
    # Fixed-rate physics step
  end
end
```

### Macro Directives:
- **`node ClassName < ParentNode do ... end`**: Declares a Godot class registered in `ClassDB`.
- **`@[Export]` annotations**: Full support for ranges (`@[ExportRange]`), enums (`@[ExportEnum]`), file pickers (`@[ExportFile]`, `@[ExportDir]`), bitmasks (`@[ExportFlags]`), easing curves (`@[ExportExpEasing]`), and buttons (`@[ExportToolButton]`).
- **`signal name(arg : Type)`**: Automatically registers signal with `ClassDB` and synthesizes type-safe helper `emit_<name>(...)`.
- **`@[Tool]`**: Marks the class to execute inside the Godot Editor in real time.
- **`@[RPC]`**: Configures multiplayer network replication mode, transfer mode, and channels.
- **Automated Doc Comment Harvesting**:
  - Regular `# comments` above classes, properties, signals, and methods are extracted at compile time and registered into Godot's `EditorHelp` XML database for in-editor tooltips and offline F1 Help.

---

## 7. Testing Protocols & Quality Gates

### Multi-Tier Test Suite:
1. **Automated Specifications (`spec/`)**:
   - Headless unit tests covering GC object retention, dynamic scaling (200+ properties), Variant type round-trips, and Vector math.
2. **Headless In-Editor `@tool` Tests (`ToolTester2D`, `ToolTester3D`)**:
   - Run in Godot with `--headless` to verify editor plugins, tool button actions, and scene instantiation.
3. **Standalone Runtime Test Project (`test/`)**:
   - Tests 2D nodes, 3D nodes, UI controls, audio, animation, physics, and concurrency suites in `test/src/suites/`.
4. **Quantitative Zero Memory Leak Verification**:
   - Leverages Godot's `Performance` singleton monitors (`OBJECT_COUNT`, `OBJECT_NODE_COUNT`, `MEMORY_STATIC`) and Crystal's `GC.collect` to mathematically verify zero object or memory leaks.

### Quality Gate Requirements:
- **Never add shortcuts, mock classes, or fake implementations** into `libgodot` solely to make a test pass. Features must be properly implemented through Godot's GDExtension C-API and the Crystal runtime bridge.
- Before committing any changes, run `make all` and verify that `scripts/run_tests.ps1` completes with exit code 0.

---

## 8. Documentation Standards

1. **Add Extended Architectural Guides to `Docs` Module**:
   - All architecture documentation, topic explanations, and caveats must be added inside `module Docs` in `src/libgodot/docs.cr` as a dummy class or module (e.g. `module J_NEW_FEATURE_GUIDE`).
   - This ensures documentation is compiled into the static docs site via `crystal docs` (`make docs`) and harvested into Godot's offline `EditorHelp` database.
2. **Never Use Markdown Pipe Tables in Docs; Always Use HTML Tables**:
   - Never use Markdown pipe table syntax (`| Header | ... |`) in doc comments or documentation files.
   - Always use standard HTML tables (`<table>`, `<thead>`, `<tr>`, `<th>`, `<tbody>`, `<td>`) to guarantee clean, error-free rendering across Crystal docs generators, web browsers, and Godot's XML documentation parser.

---

## 9. Agent Custom Skills

This repository includes specialized Antigravity agent skills in `.agents/skills/`:
- **`libgodot-build-and-sync`**: Runbook for building the complete toolchain, release builds, and multi-consumer DLL synchronization.
- **`libgodot-test-runner`**: Runbook for executing specs, headless in-editor tests, and runtime test suites.
- **`libgodot-concurrency-safety`**: Safety patterns for fibers, background OS threads, actor channels, and dead-pointer prevention.
- **`libgodot-api-generator`**: Guide for dumping Godot extension API and updating Crystal class bindings.
- **`libgodot-scaffold`**: Guide for scaffolding new showcase examples and GDExtension addons.
