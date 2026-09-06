# =============================================================================
# LibGodot for Crystal - Root Makefile
# =============================================================================
#
# Builds the complete LibGodot Crystal toolchain and demo:
#   - crystal_bridge.dll (GDExtension C++ loader bridge)
#   - game.dll (Crystal game library for Godot GDExtension host/editor)
#   - game.exe (Crystal standalone executable for LibGodot host paradigm)
#   - Syncs binaries & runtime DLLs to bin/ and demo/bin/
#
# Usage:
#   make               - Build everything (bridge, game.dll, game.exe, deps & sync)
#   make bridge        - Build bin/crystal_bridge.dll from C++ source
#   make game_dll      - Build bin/game.dll from Crystal source
#   make game_exe      - Build bin/game.exe from Crystal source
#   make deps          - Copy Crystal runtime DLLs (gc, iconv, pcre2) to bin/ & demo/bin/
#   make sync          - Sync compiled binaries from bin/ to demo/bin/
#   make engine        - Recompile Godot engine shared library (libgodot.dll) via SCons
#   make test          - Run Crystal specs and verification suite
#   make docs          - Generate HTML API documentation
#   make run           - Run demo with godot.exe
#   make editor        - Open demo project in Godot editor
#   make clean         - Clean built artifacts (retains libgodot.dll)
#   make help          - Display this help message
# =============================================================================

# Tool configuration
CRYSTAL      ?= crystal
CXX          ?= g++
SCONS        ?= scons
GODOT        ?= ./godot.exe
ENTRY        ?= demo/src/main.cr
SCONS_JOBS   ?= 7


# Shell helpers for robust cross-platform operations on Windows
POWERSHELL   = powershell -NoProfile -Command
CP           = $(POWERSHELL) "Copy-Item -Force"
RM           = $(POWERSHELL) "Remove-Item -Force -ErrorAction SilentlyContinue"

# Compiler flags
CXXFLAGS     ?= -std=c++17 -O2 -I rsrc
LINK_FLAGS   = /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init

# Optional release mode: make RELEASE=1
CRYSTAL_FLAGS =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
endif

# Output artifacts
BIN_DIR          = bin
DEMO_BIN_DIR     = demo/bin
TEMPLATE_BIN_DIR = template/bin
BRIDGE_DLL       = $(BIN_DIR)/crystal_bridge.dll
GAME_DLL         = $(BIN_DIR)/game.dll
GAME_EXE         = $(BIN_DIR)/game.exe
LIBGODOT_DLL     = $(BIN_DIR)/libgodot.dll

.PHONY: all bridge demo template game_dll game_exe generate dump_api deps addons sync engine test docs run editor clean help

# Default target: compile bridge, demo, and template, then ensure all DLLs are synced
all: dirs deps bridge addons demo template sync
	@echo ===================================================================
	@echo   LibGodot Crystal library build completed successfully!
	@echo   Run 'make run' to launch the demo or 'make editor' for the editor.
	@echo ===================================================================

# Ensure output directories exist
dirs:
	@$(POWERSHELL) "foreach ($$dir in @('$(BIN_DIR)', '$(DEMO_BIN_DIR)', '$(TEMPLATE_BIN_DIR)')) { if (-not (Test-Path $$dir)) { New-Item -ItemType Directory -Force -Path $$dir | Out-Null } }"

# Compile C++ GDExtension bridge and sync to consumer projects
bridge: dirs
	@echo [Bridge] Compiling GDExtension bridge (crystal_bridge.dll)...
	$(CXX) -shared $(CXXFLAGS) src/bridge/crystal_bridge.cpp -o $(BRIDGE_DLL)
	@$(POWERSHELL) "try { Copy-Item '$(BRIDGE_DLL)' '$(DEMO_BIN_DIR)/crystal_bridge.dll' -Force } catch {}; try { Copy-Item '$(BRIDGE_DLL)' '$(TEMPLATE_BIN_DIR)/crystal_bridge.dll' -Force } catch {}"

# Synchronize addons across root, demo, and template for complete parity
addons: dirs
	@powershell -ExecutionPolicy Bypass -File scripts/sync_addons.ps1

# Build consumer projects (both demo and template get built for verification)
demo: dirs deps bridge addons
	@echo [Demo] Building demo consumer project...
	$(MAKE) -C demo

template: dirs deps bridge addons
	@echo [Template] Building template project...
	$(MAKE) -C template

# Compile game.dll for all consumers and synchronize
game_dll: dirs deps bridge addons demo template sync
	@echo [Build] All game.dll targets compiled and synced across bin/, demo/bin/, and template/bin/!

# Compile standalone game executable for LibGodot host paradigm
game_exe: dirs deps bridge
	@echo [Demo] Compiling standalone game.exe from $(ENTRY)...
	@$(POWERSHELL) "$$env:CRYSTAL_PATH = 'src;' + (crystal env CRYSTAL_PATH); crystal build $(ENTRY) -o $(GAME_EXE)"
	@$(POWERSHELL) "try { Copy-Item '$(GAME_EXE)' '$(DEMO_BIN_DIR)/game.exe' -Force } catch {}"

# Generate Crystal bindings from Godot extension_api.json
dump_api:
	@echo [API] Dumping extension_api.json from Godot...
	$(GODOT) --headless --dump-extension-api

generate:
	@echo [Generator] Generating complete Godot bindings from extension_api.json...
	$(CRYSTAL) run scripts/generate_bindings.cr

# Copy Crystal runtime dependencies (gc.dll, iconv-2.dll, pcre2-8.dll) and libgodot.dll to all bin dirs
deps: dirs
	@echo [Dependencies] Ensuring runtime DLLs are available in bin/, demo/bin/, and template/bin/...
	@$(POWERSHELL) "$$c = Split-Path (Get-Command crystal -ErrorAction SilentlyContinue).Source; if ($$c) { foreach ($$dll in @('gc.dll','iconv-2.dll','pcre2-8.dll')) { $$src = Join-Path $$c $$dll; if (Test-Path $$src) { foreach ($$d in @('$(BIN_DIR)', '$(DEMO_BIN_DIR)', '$(TEMPLATE_BIN_DIR)')) { if (-not (Test-Path ($$d + '/' + $$dll))) { Copy-Item $$src ($$d + '/') -Force -ErrorAction SilentlyContinue } } } } }; exit 0"
	@$(POWERSHELL) "if ((Test-Path 'godot-src/bin/godot.windows.template_debug.x86_64.dll') -and (-not (Test-Path '$(BIN_DIR)/libgodot.dll'))) { Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(BIN_DIR)/libgodot.dll' -Force -ErrorAction SilentlyContinue }; if (Test-Path '$(BIN_DIR)/libgodot.dll') { foreach ($$d in @('$(DEMO_BIN_DIR)', '$(TEMPLATE_BIN_DIR)')) { if (-not (Test-Path ($$d + '/libgodot.dll'))) { Copy-Item '$(BIN_DIR)/libgodot.dll' ($$d + '/libgodot.dll') -Force -ErrorAction SilentlyContinue } } }; exit 0"

# Synchronize compiled binaries and runtime dependencies to consumer projects
sync: addons
	@echo [Sync] Syncing runtime DLLs and bridge to demo/bin and template/bin...
	@$(POWERSHELL) "foreach ($$dir in @('$(DEMO_BIN_DIR)', '$(TEMPLATE_BIN_DIR)')) { if (-not (Test-Path $$dir)) { New-Item -ItemType Directory -Force -Path $$dir | Out-Null }; foreach ($$dll in @('crystal_bridge.dll', 'gc.dll', 'iconv-2.dll', 'pcre2-8.dll', 'libgodot.dll', 'libgodot.lib')) { $$src = Join-Path '$(BIN_DIR)' $$dll; if ((Test-Path $$src) -and (-not (Test-Path (Join-Path $$dir $$dll)))) { Copy-Item $$src (Join-Path $$dir $$dll) -Force -ErrorAction SilentlyContinue } } }; exit 0"
	@$(POWERSHELL) "if (Test-Path '$(DEMO_BIN_DIR)/game.dll') { Copy-Item '$(DEMO_BIN_DIR)/game.dll' '$(BIN_DIR)/game.dll' -Force -ErrorAction SilentlyContinue }; exit 0"
	@$(POWERSHELL) "if (Test-Path '$(DEMO_BIN_DIR)/game.exe') { Copy-Item '$(DEMO_BIN_DIR)/game.exe' '$(BIN_DIR)/game.exe' -Force -ErrorAction SilentlyContinue }; exit 0"
	@$(POWERSHELL) "foreach ($$p in @('demo', 'template')) { $$cfgDir = Join-Path $$p '.godot'; if (-not (Test-Path $$cfgDir)) { New-Item -ItemType Directory -Force -Path $$cfgDir | Out-Null }; Set-Content -Path (Join-Path $$cfgDir 'extension_list.cfg') -Value 'res://addons/crystal_integration/crystal.gdextension' -Force }; exit 0"

# Build Godot engine shared library from source (requires godot-src and scons)
engine:
	@echo Compiling Godot Engine shared library (libgodot.dll) via SCons...
	$(SCONS) -C godot-src target=template_debug dev_build=yes library_type=shared_library -j$(SCONS_JOBS)
	@$(POWERSHELL) "Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(BIN_DIR)/libgodot.dll' -Force; Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(DEMO_BIN_DIR)/libgodot.dll' -Force; Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(TEMPLATE_BIN_DIR)/libgodot.dll' -Force; if (Test-Path 'godot-src/bin/godot.windows.template_debug.x86_64.lib') { Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.lib' '$(BIN_DIR)/libgodot.lib' -Force }"
	@echo libgodot.dll updated successfully!

# Run test suites and verification
test: all
	@echo Running Crystal verification specs...
	$(CRYSTAL) run spec/libgodot_spec.cr
	$(CRYSTAL) run spec/boot_spec.cr
	@echo Validating demo project in Godot engine (headless)...
	$(GODOT) --headless --path demo --quit
	@echo Validating template project in Godot engine (headless)...
	$(GODOT) --headless --path template --quit
	@echo All verification specs and project smoke tests passed!

# Generate offline HTML documentation
docs:
	@echo Generating Crystal HTML documentation in docs/...
	$(CRYSTAL) docs src/libgodot.cr
	@echo Documentation generated at docs/index.html

# Launch demo using Godot
run:
	@echo Launching Crystal LibGodot Demo...
	$(GODOT) --path demo

# Launch Godot editor for demo project
editor:
	@echo Opening Godot Editor for Demo...
	$(GODOT) --editor --path demo

# Clean build artifacts (preserves libgodot.dll and runtime DLLs)
clean:
	@echo Cleaning build artifacts across bin/, demo/bin/, and template/bin/...
	@$(POWERSHELL) "Get-ChildItem -Path '$(BIN_DIR)', '$(DEMO_BIN_DIR)', '$(TEMPLATE_BIN_DIR)' -Include 'crystal_bridge.*', 'game.*', '~crystal_bridge.*' -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue"
	@$(POWERSHELL) "Get-ChildItem -Path 'scratch' -Include '*.obj', '*.exp' -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue"
	@echo Clean complete.


# Display help menu
help:
	@echo ===================================================================
	@echo   LibGodot for Crystal - Build Commands
	@echo ===================================================================
	@echo   make              Build bridge, game.dll, game.exe, deps, and sync
	@echo   make bridge       Build bin/crystal_bridge.dll
	@echo   make game_dll     Build bin/game.dll
	@echo   make game_exe     Build bin/game.exe
	@echo   make deps         Ensure runtime DLLs (gc, iconv, pcre2) are copied
	@echo   make sync         Sync bin/ binaries to demo/bin/
	@echo   make test         Run verification specs (libgodot_spec and boot_spec)
	@echo   make docs         Generate API documentation (crystal docs)
	@echo   make run          Run the demo game in Godot
	@echo   make editor       Open the demo in the Godot Editor
	@echo   make engine       Rebuild Godot engine shared library via SCons
	@echo   make clean        Remove compiled game/bridge binaries
	@echo ===================================================================
	@echo   Options:
	@echo     RELEASE=1       Compile Crystal in release mode (-O3 --release)
	@echo     CXX=^<compiler^>  C++ compiler (default: g++)
	@echo     ENTRY=^<file^>    Crystal entry file (default: demo/src/main.cr)
	@echo ===================================================================
