# ==============================================================================
# LibGodot Documentation System
# ==============================================================================
#
# This file provides in-depth technical documentation modules for LibGodot.
# The modules are organized alphabetically (A through G) so that generating
# HTML documentation via `crystal docs` (or `make docs`) creates an exhaustive,
# well-ordered manual covering architecture, compilation, exports, node DSL,
# doc comments, GDScript interop, and low-level engine caveats.
#
# To browse the generated manual:
# ```bash
# make docs
# ```
# Then open `docs/index.html` in your web browser.
# ==============================================================================

module Docs
  # # A. Dual-Paradigm Architecture
  #
  # LibGodot for Crystal is designed around a **dual-paradigm architecture** that
  # provides both rapid, hot-reloading in-editor game development and lean,
  # standalone native executable production shipping:
  #
  # 1. **Mode A: GDExtension In-Editor / Runner Paradigm** (`game.dll` + `crystal_bridge.dll`)
  # 2. **Mode B: Standalone LibGodot Host Paradigm** (`game.exe` + `libgodot.dll`)
  #
  # ---
  #
  # ### Mode A: GDExtension In-Editor Workflow
  #
  # Used when creating games inside the **Godot Editor 4.8+** (`make editor`) or running
  # via the Godot engine binary (`make run`).
  #
  # In this mode:
  # - Godot is the parent host process (`godot.exe`).
  # - Godot discovers `addons/crystal_integration/crystal.gdextension` at startup.
  # - The manifest directs Godot to load `bin/crystal_bridge.dll` (a lightweight native C++ bridge).
  # - During library initialization (`crystal_library_init`):
  #   1. Godot passes its C-API function table pointer (`GDExtensionInterfaceGetProcAddress`).
  #   2. The bridge initializes the Boehm Garbage Collector (`GC_init()`) for Crystal.
  #   3. In development mode, the bridge creates a timestamped shadow copy of `game.dll`
  #      (`game_loaded_<PID>_<timestamp>.dll`) to prevent Windows OS file lock collisions.
  #   4. The bridge dynamically loads the shadow DLL via `LoadLibraryA` (or `dlopen` on Linux).
  #   5. The bridge resolves `crystal_godot_init` inside `game.dll` and hands over the
  #      `BridgeAPI` function table.
  #   6. Crystal registers custom nodes, signals, exported properties, and doc comments
  #      into Godot's `ClassDB` and `EditorHelp` subsystems.
  # - Pressing **Play (F5)** or **Play Scene (F6)** in the Godot editor invokes the
  #   `EditorPlugin._build()` hook in `addons/crystal_integration/crystal_integration.gd`,
  #   automatically recompiling `game.dll` and reloading without restarting Godot.
  #
  # ---
  #
  # ### Mode B: Standalone LibGodot Host Paradigm
  #
  # Used for standalone shipping builds (`make game_exe`), embedded deployments, or CI test runners.
  #
  # In this mode:
  # - Crystal compiles as a standalone Windows PE executable (`bin/game.exe`).
  # - Crystal owns the `main()` entry point, boots its runtime, and configures GC natively.
  # - Godot is compiled as a shared library (`bin/libgodot.dll`).
  # - Crystal loads `libgodot.dll` in-memory using `LibGodot::DynamicLoader`.
  # - Crystal invokes `libgodot_create_godot_instance(argc, argv, init_callback)`, passing
  #   its own command-line arguments and an initialization callback.
  # - Godot boots in-memory and invokes Crystal's `Scene`-level initialization callback,
  #   registering all nodes and scene hooks directly.
  # - Crystal steps the main loop, controls window initialization, and manages shutdown.
  #
  # ---
  #
  # ### Comparison Table
  #
  # <table style="width: 100%; border-collapse: collapse; margin: 1em 0;">
  #   <thead>
  #     <tr style="border-bottom: 2px solid #4a5568; text-align: left;">
  #       <th style="padding: 10px 14px;">Feature</th>
  #       <th style="padding: 10px 14px;">Mode A (GDExtension Bridge)</th>
  #       <th style="padding: 10px 14px;">Mode B (Standalone LibGodot)</th>
  #     </tr>
  #   </thead>
  #   <tbody>
  #     <tr style="border-bottom: 1px solid #2d3748;">
  #       <td style="padding: 10px 14px;"><strong>Host Process</strong></td>
  #       <td style="padding: 10px 14px;">Godot Engine (<code>godot.exe</code>)</td>
  #       <td style="padding: 10px 14px;">Crystal Executable (<code>game.exe</code>)</td>
  #     </tr>
  #     <tr style="border-bottom: 1px solid #2d3748;">
  #       <td style="padding: 10px 14px;"><strong>Shared Libraries</strong></td>
  #       <td style="padding: 10px 14px;"><code>crystal_bridge.dll</code>, <code>game.dll</code></td>
  #       <td style="padding: 10px 14px;"><code>libgodot.dll</code></td>
  #     </tr>
  #     <tr style="border-bottom: 1px solid #2d3748;">
  #       <td style="padding: 10px 14px;"><strong>Godot Editor</strong></td>
  #       <td style="padding: 10px 14px;">Full support (Inspector, Node tree, F1 Help)</td>
  #       <td style="padding: 10px 14px;">Headless or embedded window</td>
  #     </tr>
  #     <tr style="border-bottom: 1px solid #2d3748;">
  #       <td style="padding: 10px 14px;"><strong>Hot Reloading</strong></td>
  #       <td style="padding: 10px 14px;">Live shadow reload on F5 / F6</td>
  #       <td style="padding: 10px 14px;">Recompilation of executable required</td>
  #     </tr>
  #     <tr style="border-bottom: 1px solid #2d3748;">
  #       <td style="padding: 10px 14px;"><strong>GC Bootstrapping</strong></td>
  #       <td style="padding: 10px 14px;">Initialized by C++ bridge (<code>GC_init</code>)</td>
  #       <td style="padding: 10px 14px;">Initialized natively by Crystal CRT</td>
  #     </tr>
  #     <tr style="border-bottom: 1px solid #2d3748;">
  #       <td style="padding: 10px 14px;"><strong>Target Use-Case</strong></td>
  #       <td style="padding: 10px 14px;">Development, editing, prototyping</td>
  #       <td style="padding: 10px 14px;">Standalone production distribution</td>
  #     </tr>
  #   </tbody>
  # </table>
  module A_ARCHITECTURE
    # Dummy method for documentation visibility
    def self.overview : String
      "Mode A (GDExtension) for editor iteration; Mode B (Standalone LibGodot) for production shipping."
    end
  end

  # # B. Compilation, Linking & Build System
  #
  # LibGodot connects three different compilation layers into a unified build system:
  # 1. **C++ GDExtension Loader Bridge** (`src/bridge/crystal_bridge.cpp`)
  # 2. **Crystal Game / Test / Example DLLs** (`game.dll`)
  # 3. **Godot Engine Dynamic Library** (`libgodot.dll`)
  #
  # ---
  #
  # ### 1. Compiling the C++ Loader Bridge (`crystal_bridge.dll`)
  #
  # The bridge is compiled with MinGW-w64 `g++` (or MSVC / clang) into `bin/crystal_bridge.dll`:
  # ```bash
  # g++ -shared -O3 src/bridge/crystal_bridge.cpp -o bin/crystal_bridge.dll -lgc
  # ```
  #
  # Why is a separate loader bridge required?
  # - **Boehm GC Bootstrapping**: Crystal DLLs dynamically loaded into an external host
  #   process (like `godot.exe`) do not run Crystal's native executable CRT initialization.
  #   The bridge explicitly calls `GC_init()` before invoking any Crystal exported symbol.
  # - **Zero C++ Headers in Crystal**: The bridge maps Godot's complex C++ GDExtension
  #   API and function pointers into a clean, flat C-ABI structure (`BridgeAPI`), allowing
  #   Crystal to interact with Godot without any C++ header dependencies.
  # - **Exception & Crash Guarding**: The bridge wraps instance dispatches in structured
  #   guards, preventing unhandled engine crashes when user scripts fail.
  #
  # ---
  #
  # ### 2. The Shadow Copying Reload Mechanism
  #
  # Under Windows, when a process loads a DLL via `LoadLibraryA`, the operating system
  # places an exclusive shared-read lock on the file. Any attempt by the Crystal compiler
  # to overwrite `game.dll` while Godot is open results in:
  # ```
  # Error: Access is denied. (ERROR_SHARING_VIOLATION / Windows error 32)
  # ```
  #
  # To solve this, `crystal_bridge.cpp` implements **Shadow Copy Loading** in development mode:
  # 1. When `crystal_bridge.dll` initializes, it checks for `LIBGODOT_RELEASE`. If absent,
  #    shadow loading is enabled.
  # 2. Before loading `bin/game.dll`, the bridge copies `bin/game.dll` to:
  #    `bin/game_loaded_<PID>_<TIMESTAMP>.dll`
  # 3. The bridge calls `LoadLibraryA` on the shadow copy, leaving `bin/game.dll` unlocked!
  # 4. The Crystal compiler can now freely rebuild `bin/game.dll` at any time while the
  #    Godot editor is still running.
  # 5. Old shadow copies from terminated processes are automatically pruned at startup.
  #
  # In release builds (`LIBGODOT_RELEASE=1`), shadow copying is disabled to eliminate disk I/O.
  #
  # ---
  #
  # ### 3. Compiling Crystal Game Code (`game.dll`)
  #
  # Crystal compiles user nodes into a dynamic library via:
  # ```bash
  # crystal build --cross-compile --link-flags="-shared" src/main.cr -o bin/game.dll
  # ```
  #
  # Crystal exports two primary C-ABI entry points:
  # - `crystal_godot_init(api : LibBridge::BridgeAPI*) : Int32`:
  #   Called by the loader bridge immediately after loading. Crystal stores the `BridgeAPI`
  #   pointer, iterates over `ClassRegistry`, registers all custom classes, properties,
  #   and signals with `ClassDB`, and registers offline XML documentation with `EditorHelp`.
  # - `crystal_godot_cleanup : Void`:
  #   Called when the library unloads during engine shutdown.
  #
  # ---
  #
  # ### 4. Editor Build Hook (`EditorPlugin._build`)
  #
  # The Godot editor plugin located at `addons/crystal_integration/crystal_integration.gd`
  # intercepts Godot's build pipeline:
  # - It overrides `EditorPlugin._build()`.
  # - Whenever the developer presses **F5** (Play Project) or **F6** (Play Scene), the
  #   plugin executes `crystal build` in the background.
  # - If compilation succeeds, Godot continues launching the scene with the updated DLL.
  # - If compilation fails, the output is printed directly to the Godot Editor Output Dock,
  #   and scene launching is cleanly halted.
  #
  # ---
  #
  # ### 5. Build System Synchronization (`make all`)
  #
  # The root `Makefile` orchestrates compilation across the entire workspace:
  # - `make bridge`: Builds `bin/crystal_bridge.dll`.
  # - `make test_project`: Builds `test/bin/game.dll`.
  # - `make examples`: Builds all showcase projects in `examples/`.
  # - `make template`: Builds `template/bin/game.dll`.
  # - `make sync`: Synchronizes `crystal_bridge.dll`, runtime DLLs (`gc.dll`, `iconv-2.dll`,
  #   `pcre2-8.dll`), and `crystal.gdextension` across `bin/`, `test/bin/`, `template/bin/`,
  #   and `examples/*/bin/`.
  #
  # > **Rule**: Always execute `make all` rather than partial builds to guarantee all consumer
  # > directories and bridge DLLs remain synchronized.
  module B_COMPILATION_AND_BUILD
    # Dummy method for documentation visibility
    def self.rules : Array(String)
      [
        "Always use 'make all' to keep consumer DLLs in sync",
        "Bridge performs shadow copy loading on Windows to prevent file locking",
        "GC_init() is called by the bridge before Crystal code executes",
        "F5 in Godot Editor triggers addons/crystal_integration build hook"
      ]
    end
  end

  # # C. Export System & Inspector Properties
  #
  # LibGodot provides a rich property export system matching Godot's native `@export`
  # capabilities. Annotations placed above Crystal properties are analyzed at compile
  # time by the `node` macro, translating them into Godot `PropertyInfo` descriptors
  # registered into `ClassDB`.
  #
  # ---
  #
  # ### How the Export Macro Pipeline Operates
  #
  # 1. At compile time, the `node` macro inspects each `property` declaration inside the block.
  # 2. It reads attached annotations (`@[Export]`, `@[ExportRange]`, `@[ExportFlags]`, etc.).
  # 3. It maps the Crystal type to Godot's `Variant::Type` enum:
  #    - `Bool` -> `Variant::Type::BOOL` (1)
  #    - `Int32`, `Int64` -> `Variant::Type::INT` (2)
  #    - `Float32`, `Float64` -> `Variant::Type::FLOAT` (3)
  #    - `String` -> `Variant::Type::STRING` (4)
  #    - `Vector2` -> `Variant::Type::VECTOR2` (5)
  #    - `Vector3` -> `Variant::Type::VECTOR3` (9)
  #    - `Color` -> `Variant::Type::COLOR` (20)
  #    - `NodePath` -> `Variant::Type::NODE_PATH` (22)
  # 4. It constructs a `Godot::PropertyInfo` instance specifying:
  #    - `name`: Property name in snake_case (e.g. `"movement_speed"`)
  #    - `variant_type`: The integer Godot Variant type
  #    - `hint`: `PropertyHint` enum value (e.g. `RANGE`, `ENUM`, `FILE`, `FLAGS`)
  #    - `hint_string`: Formatted hint string (e.g. `"0.0,100.0,0.5"`, `"Warrior,Mage,Rogue"`)
  #    - `usage`: `PROPERTY_USAGE_DEFAULT` (6) or `PROPERTY_USAGE_STORAGE` (64)
  # 5. It generates typed property getters and setters in the `CrystalClassDesc` structure:
  #    - `get_property`: Casts the instance pointer, reads the Crystal property, and writes
  #      it into Godot's uninitialized Variant buffer.
  #    - `set_property`: Reads the incoming Variant value, unmarshals it to the target
  #      Crystal type, and invokes the Crystal property setter.
  #
  # ---
  #
  # ### Complete Annotation Reference
  #
  # #### 1. General Export (`@[Export]`)
  # Exports the property with default inspector editor controls inferred from type:
  # ```crystal
  # @[Export]
  # property speed : Float32 = 10.0_f32
  #
  # @[Export]
  # property player_name : String = "Hero"
  #
  # @[Export]
  # property is_alive : Bool = true
  #
  # @[Export]
  # property tint : Color = Color::WHITE
  #
  # @[Export]
  # property target_position : Vector3 = Vector3.new(0, 1, 0)
  # ```
  #
  # #### 2. Numeric Ranges (`@[ExportRange]` or `@[Export(range: ...)]`)
  # Displays a slider with min, max, and step constraints:
  # ```crystal
  # # Min 0.0, max 100.0, step 0.5
  # @[ExportRange(0.0, 100.0, 0.5)]
  # property health : Float64 = 100.0
  #
  # # Crystal range syntax
  # @[Export(range: 1..100, step: 1)]
  # property level : Int32 = 1
  # ```
  #
  # #### 3. Enumerations & Choices (`@[ExportEnum]`)
  # Displays a dropdown list of options:
  # ```crystal
  # @[ExportEnum("Warrior", "Mage", "Rogue", "Paladin")]
  # property character_class : String = "Warrior"
  # ```
  #
  # #### 4. File & Directory Selectors
  # Opens Godot's native file dialog in the inspector:
  # ```crystal
  # # Project-relative file picker with filter
  # @[ExportFile("*.png,*.jpg")]
  # property sprite_path : String = ""
  #
  # # Project-relative file selector
  # @[ExportFilePath]
  # property script_file : String = ""
  #
  # # Project-relative directory picker
  # @[ExportDir]
  # property assets_folder : String = "res://assets"
  #
  # # Absolute OS filesystem file selector
  # @[ExportGlobalFile("*.txt")]
  # property log_file : String = ""
  #
  # # Absolute OS filesystem directory selector
  # @[ExportGlobalDir]
  # property backup_dir : String = ""
  # ```
  #
  # #### 5. Text Input Variations
  # ```crystal
  # # Multiline text editor area
  # @[ExportMultiline]
  # property dialogue_text : String = "Welcome adventurer!\nPrepare for battle."
  #
  # # Placeholder ghost text shown when empty
  # @[ExportPlaceholder("Enter character name...")]
  # property custom_name : String = ""
  # ```
  #
  # #### 6. Bitmask Flags (`@[ExportFlags]`)
  # Renders multiple checkbox toggles representing an integer bitmask:
  # ```crystal
  # # Custom named flags
  # @[ExportFlags("Fire", "Water", "Earth", "Air")]
  # property elemental_affinities : Int32 = 0
  #
  # # Godot 2D / 3D physics and render layer masks
  # @[ExportFlags2DPhysics]
  # property collision_mask_2d : Int32 = 1
  #
  # @[ExportFlags3DPhysics]
  # property collision_mask_3d : Int32 = 1
  #
  # @[ExportFlags2DRender]
  # property render_layers_2d : Int32 = 1
  #
  # @[ExportFlags3DRender]
  # property render_layers_3d : Int32 = 1
  #
  # @[ExportFlags3DNavigation]
  # property nav_layers_3d : Int32 = 1
  #
  # @[ExportFlagsAvoidance]
  # property avoidance_layers : Int32 = 1
  # ```
  #
  # #### 7. Visual & Specialized Controls
  # ```crystal
  # # Exponential easing curve editor widget
  # @[ExportExpEasing]
  # property camera_curve : Float32 = 1.0_f32
  #
  # # Color picker suppressing alpha channel
  # @[ExportColorNoAlpha]
  # property base_color : Color = Color::RED
  #
  # # NodePath selector restricted to Camera3D nodes in the scene tree
  # @[ExportNodePath("Camera3D")]
  # property target_camera : NodePath = NodePath.new
  # ```
  #
  # #### 8. Storage Without Inspector Display (`@[ExportStorage]`)
  # Serializes the property into the scene `.tscn` file without displaying it in the inspector:
  # ```crystal
  # @[ExportStorage]
  # property internal_guid : String = ""
  # ```
  #
  # #### 9. Inspector Groups, Subgroups, and Categories
  # Organizes properties into collapsible sections inside the Godot inspector:
  # ```crystal
  # node Player < CharacterBody3D do
  #   export_category "Player Statistics"
  #
  #   export_group "Locomotion", prefix: "move_"
  #   @[Export] property move_speed : Float32 = 5.0_f32
  #   @[Export] property move_acceleration : Float32 = 20.0_f32
  #
  #   export_subgroup "Jump Mechanics"
  #   @[Export] property jump_velocity : Float32 = 8.0_f32
  #   @[Export] property jump_cut_multiplier : Float32 = 0.5_f32
  # end
  # ```
  #
  # #### 10. Interactive Inspector Tool Buttons (`@[ExportToolButton]`)
  # Creates a clickable button in the Godot inspector that triggers a method when pressed:
  # ```crystal
  # @[ExportToolButton]
  # def regenerate_world : Void
  #   Godot.print("Regenerating voxel terrain...")
  # end
  # ```
  module C_EXPORTS_AND_INSPECTOR
    # Dummy method for documentation visibility
    def self.supported_types : Array(String)
      [
        "Bool", "Int32", "Int64", "Float32", "Float64",
        "String", "Vector2", "Vector3", "Color", "NodePath"
      ]
    end
  end

  # # D. Node DSL, Lifecycle & Signals
  #
  # The `node` macro is the central declarative building block in LibGodot.
  # It provides a clean, expressive DSL for authoring Godot classes in Crystal.
  #
  # ---
  #
  # ### 1. The `node` Macro Syntax
  #
  # ```crystal
  # require "libgodot"
  #
  # # Inherits from Godot::Node by default:
  # node CameraRig do
  #   # ...
  # end
  #
  # # Inherits from a specific Godot class:
  # node Player < CharacterBody3D do
  #   # ...
  # end
  #
  # # Subclassing another custom Crystal node:
  # node Warrior < Player do
  #   # ...
  # end
  # ```
  #
  # ---
  #
  # ### 2. Lifecycle Callback Dispatch
  #
  # Godot nodes execute lifecycle methods at specific stages in the frame lifecycle.
  # LibGodot automatically detects these methods at compile time and registers virtual
  # function pointers with the GDExtension bridge:
  #
  # - `def _ready : Void`
  #   Called once when the node and all of its children have entered the active scene tree.
  # - `def _process(delta : Float64) : Void`
  #   Called every visual frame. `delta` is elapsed time in seconds since previous frame.
  # - `def _physics_process(delta : Float64) : Void`
  #   Called every fixed physics step (typically 60 Hz). Used for physics movement and simulation.
  #
  # Virtual method calls are dispatched directly from the C++ bridge via `call_virtual`,
  # bypassing Variant reflection for maximum execution speed.
  #
  # ---
  #
  # ### 3. Type-Safe Signal System
  #
  # Signals allow nodes to notify observers when state changes occur, decoupled from listeners:
  #
  # ```crystal
  # node BossEnemy < CharacterBody3D do
  #   # Define signals with typed arguments:
  #   signal phase_changed(new_phase : Int32)
  #   signal health_updated(current : Int32, max_health : Int32)
  #   signal defeated
  #
  #   def take_damage(amount : Int32) : Void
  #     @health -= amount
  #     emit_health_updated(@health, @max_health)
  #     if @health <= 0
  #       emit_defeated
  #     end
  #   end
  # end
  # ```
  #
  # Under the hood:
  # 1. The `signal` declaration is harvested at compile time.
  # 2. A `CrystalSignalDesc` entry is registered into Godot's `ClassDB`.
  # 3. A type-safe emission helper method (`emit_<signal_name>(...)`) is generated.
  # 4. Arguments are converted into `CrystalSignalArg` buffers and dispatched via
  #    `Bridge.object_emit_signal`.
  # 5. GDScript, C#, and other Crystal nodes can connect to these signals natively.
  #
  # ---
  #
  # ### 4. Scene Tree APIs
  #
  # Custom nodes have access to Godot's scene tree hierarchy methods:
  # - `add_child(node, force_readable_name = false, internal = 0)`: Adds child to this node.
  # - `remove_child(node)`: Removes a child node without freeing it.
  # - `reparent(new_parent, keep_global_transform = true)`: Moves node to a new parent in one call.
  # - `get_parent : Node` / `get_parent? : Node?`: Returns parent or nil if orphan.
  # - `get_child_count : Int64`: Returns the count of child nodes.
  # - `get_child(idx) : Node` / `get_child?(idx) : Node?`: Retrieves child by index.
  # - `find_child(pattern, recursive = true, owned = false) : Node?`: Searches hierarchy by name.
  # - `queue_free : Void`: Queues the node for clean deletion at the end of the frame.
  # - `is_inside_tree : Bool`: Checks if the node is in the active scene tree.
  # - `instantiate : Node`: Unpacks a `PackedScene` into an active node hierarchy.
  #
  # ---
  #
  # ### 5. In-Editor Tool Scripts (`@[Tool]` or `tool`)
  #
  # Adding `@[Tool]` or invoking `tool` inside a node instructs Godot to run the node
  # inside the **Godot Editor** in real time:
  # ```crystal
  # @[Tool]
  # node ProceduralArchway < Node3D do
  #   @[Export]
  #   property radius : Float32 = 5.0_f32
  #
  #   def _process(delta : Float64) : Void
  #     # Runs inside Godot Editor! Updates visual mesh when radius changes.
  #   end
  # end
  # ```
  #
  # ---
  #
  # ### 6. Network Replication (`@[RPC]`)
  #
  # Methods marked with `@[RPC]` configure multiplayer network replication:
  # ```crystal
  # @[RPC(mode: :any_peer, call_local: true)]
  # def sync_position(pos : Vector3) : Void
  #   self.position = pos
  # end
  # ```
  module D_NODE_DSL_AND_SIGNALS
    # Dummy method for documentation visibility
    def self.lifecycle_methods : Array(String)
      ["_ready", "_process(delta : Float64)", "_physics_process(delta : Float64)"]
    end
  end

  # # E. Doc Comments & Editor Help XML Generation
  #
  # One of the most powerful features of LibGodot is its **automated compile-time
  # documentation harvesting system**. Standard Crystal doc comments (`# ...`) written
  # above classes, properties, signals, and methods are automatically parsed and registered
  # into Godot's offline `EditorHelp` documentation subsystem.
  #
  # ---
  #
  # ### How Doc Comments Flow from Crystal to Godot
  #
  # ```
  # Crystal Source Code (# Comments)
  #          │
  #          ▼ (Compile time: node macro read_file)
  # Dynamic XML Generation (<class>, <members>, <signals>)
  #          │
  #          ▼ (crystal_godot_init)
  # EditorDocRegistry.load_all
  #          │
  #          ▼ (Bridge: GDExtensionEditorHelp::load_xml_buffer)
  # Godot Editor Inspector Tooltips & F1 Help Page
  # ```
  #
  # 1. At compile time, the `node` macro executes `read_file(block.filename)`.
  # 2. It scans lines immediately preceding:
  #    - The `node ClassName` definition (class brief & full description)
  #    - Each `property` declaration (property doc comment)
  #    - Each `signal` declaration (signal description)
  #    - Each `def` method (method description)
  # 3. An in-memory XML string matching Godot's official `DocData` specification is synthesized:
  #    ```xml
  #    <?xml version="1.0" encoding="UTF-8" ?>
  #    <class name="SpinningCrystal" inherits="Area3D">
  #      <brief_description>Collectible item that rotates in 3D space</brief_description>
  #      <description>Collectible item that rotates in 3D space</description>
  #      <members>
  #        <member name="rotation_speed" type="float">Rotation rate in rad/s</member>
  #      </members>
  #      <signals>
  #        <signal name="collected">
  #          <description>Emitted when a character collects this item</description>
  #        </signal>
  #      </signals>
  #    </class>
  #    ```
  # 4. During library initialization (`crystal_godot_init`), `EditorDocRegistry.load_all`
  #    hands each XML document to `Bridge.load_editor_help(xml)`.
  # 5. The bridge invokes Godot's `GDExtensionEditorHelp::load_xml_buffer`.
  # 6. Inside the Godot Editor:
  #    - Hovering over a property in the **Inspector** displays the exact Crystal doc comment.
  #    - Pressing **F1** (Search Help) lists your custom Crystal classes alongside native Godot nodes.
  #
  # ---
  #
  # ### Example Code
  #
  # ```crystal
  # # Floating power-up item that rotates and restores player health
  # node HealthPotion < Area3D do
  #   # Amount of health points restored upon pickup
  #   @[Export(range: 5..100, step: 5)]
  #   property heal_amount : Int32 = 25
  #
  #   # Emitted when a player body consumes this potion
  #   signal consumed(player : Node3D)
  #
  #   # Triggers consumption of the health potion
  #   def consume!(player : Node3D) : Void
  #     emit_consumed(player)
  #     queue_free
  #   end
  # end
  # ```
  module E_DOC_COMMENTS_AND_HELP
    # Dummy method for documentation visibility
    def self.schema : String
      "Godot DocData XML format (<class>, <brief_description>, <members>, <signals>, <methods>)"
    end
  end

  # # F. GDScript Interoperability
  #
  # LibGodot includes bidirectional interoperability with GDScript, allowing Crystal code
  # to call GDScript instance methods, invoke static functions, and read/write dynamic properties.
  #
  # ---
  #
  # ### The `bind_gdscript_methods` DSL
  #
  # Within any Crystal node, invoke `bind_gdscript_methods` to bind external GDScript APIs:
  #
  # ```crystal
  # node QuestTracker < Node do
  #   bind_gdscript_methods do
  #     # Instance method taking arguments
  #     gdscript_method award_experience(points : Int32)
  #
  #     # Instance method returning a value
  #     gdscript_method get_current_quest_title
  #
  #     # Class-level static method
  #     gdscript_static_method calculate_difficulty_multiplier(level : Int32)
  #
  #     # Dynamic script property getter / setter
  #     gdscript_property active_quest_id : String
  #   end
  #
  #   def _ready : Void
  #     # Call GDScript instance methods directly:
  #     award_experience(500)
  #     title = get_current_quest_title
  #     Godot.print("Active Quest: #{title}")
  #
  #     # Access bound properties:
  #     self.active_quest_id = "QUEST_001"
  #   end
  # end
  # ```
  #
  # ---
  #
  # ### How Variant Marshaling Works
  #
  # 1. When calling a bound GDScript method, Crystal converts each argument into a Godot `Variant`
  #    using `Bridge.variant_from_type`.
  # 2. It dispatches the call through Godot's `object_call` / `object_call_ret_*` C-API.
  # 3. Return values are unmarshaled back into native Crystal types (`String`, `Int64`, `Float64`,
  #    `Bool`, `Object`).
  # 4. Variants are immediately destroyed via `Bridge.gd_variant_destroy` to prevent memory leaks.
  module F_GDSCRIPT_INTEROP
    # Dummy method for documentation visibility
    def self.features : Array(String)
      ["gdscript_method", "gdscript_static_method", "gdscript_property", "Variant marshaling"]
    end
  end

  # # G. Engine Caveats, Memory & Internals
  #
  # When building high-performance games with LibGodot, developers should be aware of several
  # critical architectural nuances spanning garbage collection, memory ownership, and threading.
  #
  # ---
  #
  # ### 1. Memory Ownership: Boehm GC vs. Godot Reference Counting
  #
  # LibGodot bridges two distinct memory models:
  # - **Crystal's Boehm GC**: Manages memory allocated on the Crystal heap (strings, arrays,
  #   class instances, fibers).
  # - **Godot Engine C++ Heap**: Manages engine nodes, resources, and scenes using manual
  #   lifecycle (`Node` with `queue_free`) or reference counting (`RefCounted` / `Resource`).
  #
  # #### Critical Rules:
  # 1. **Never store raw pointers to freed Godot nodes**: When a node is destroyed in Godot
  #    (e.g. via `queue_free`), its underlying C++ memory is deallocated. A Crystal wrapper
  #    object (`Godot::Node`) holding that pointer will become invalid. Check `is_queued_for_deletion`
  #    or null pointers before dereferencing cached node references.
  # 2. **GC Roots in Shared Libraries**: On Windows, when `game.dll` is dynamically loaded
  #    by Godot, static Crystal variables and method bindings are registered as GC roots.
  #    Always ensure large static data structures are cleared during `crystal_godot_cleanup`.
  #
  # ---
  #
  # ### 2. Thread Safety & Thread Affinity
  #
  # Godot executes rendering, physics, and main loop processing on different threads:
  # - **Main Thread**: Scene tree operations (`add_child`, `remove_child`, UI updates)
  #   **MUST** occur on the main thread. Attempting to modify the active scene tree from a
  #   background Crystal fiber will cause race conditions inside Godot's internal node lists.
  # - **Physics Thread**: `_physics_process(delta)` is invoked during the fixed physics tick.
  #   Safe for kinematic movement (`move_and_slide`, velocity calculation), but avoid
  #   instantiating full scene trees here unless synchronized.
  # - **Deferred Calls**: Use `Godot.call_deferred` to safely marshal background fiber
  #   work back onto Godot's main event thread.
  #
  # ---
  #
  # ### 3. Method Bind Pointer Caching (`@@mb_*`)
  #
  # Invoking Godot methods through `Variant` reflection (`Object.call`) involves string hash lookups
  # and boxing/unboxing overhead.
  #
  # To achieve near-native C++ performance:
  # - LibGodot retrieves the raw method bind pointer via `Bridge.get_method_bind(class, method, hash)`
  #   and caches it inside a class variable (`@@mb_node_add_child`).
  # - Subsequent calls use `Bridge.ptrcall`, which executes a direct C function pointer call with
  #   arguments passed as an array of raw pointers (`Void**`), incurring zero reflection overhead.
  #
  # ---
  #
  # ### 4. Windows Toolchain & Runtime Nuances
  #
  # - **Compiler Consistency**: The loader bridge is compiled with MinGW-w64 `g++` on Windows.
  #   Crystal's LLVM toolchain targets MSVCRT / UCRT. The bridge exposes a pure C-ABI table
  #   (`extern "C"`), eliminating C++ name mangling or standard library incompatibility issues.
  # - **DLL Export Tables**: Exported functions (`crystal_library_init`, `crystal_godot_init`)
  #   are explicitly decorated with `__declspec(dllexport)` on Windows and `visibility("default")`
  #   on Linux.
  # - **Shadow Copies**: When testing or modifying game code in the editor, never manually delete
  #   active `game_loaded_*.dll` files while Godot is open; the OS will release them when Godot
  #   terminates, and the bridge will automatically clean them up.
  module G_CAVEATS_AND_INTERNALS
    # Dummy method for documentation visibility
    def self.caveats : Array(String)
      [
        "Scene tree modifications must stay on the main thread",
        "Godot Node queue_free invalidates C++ pointers; check validity before reuse",
        "Method binds are cached statically for zero-cost ptrcall dispatch",
        "Never delete active shadow copies while Godot is running"
      ]
    end
  end
end
