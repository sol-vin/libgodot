# =============================================================================
# LibGodot for Crystal - Root Makefile
# =============================================================================
#
# Builds the complete LibGodot Crystal toolchain, editor test suite, and examples:
#   - crystal_bridge.dll (GDExtension C++ loader bridge)
#   - game.dll (Crystal game library for Godot GDExtension host/editor)
#   - game.exe (Crystal standalone executable for LibGodot host paradigm)
#   - Syncs binaries & runtime DLLs to bin/, test/bin/, template/bin/, and examples/*/bin/
#
# Usage:
#   make               - Build everything (bridge, test, examples, template, sync & verify)
#   make bridge        - Build bin/crystal_bridge.dll from C++ source
#   make test_project  - Build test/bin/game.dll test suite project
#   make examples      - Build all example projects in examples/
#   make template      - Build template project
#   make game_dll      - Build and sync game.dll across all targets
#   make deps          - Copy Crystal runtime DLLs (gc, iconv, pcre2)
#   make sync          - Sync compiled binaries from bin/ to all consumer projects
#   make engine        - Recompile Godot engine shared library (libgodot.dll) via SCons
#   make test          - Run Crystal specs and Godot headless smoke tests
#   make docs          - Generate HTML API documentation
#   make run           - Run editor test project with godot.exe
#   make editor        - Open editor test project in Godot editor
#   make clean         - Clean built artifacts (retains libgodot.dll)
#   make help          - Display this help message
# =============================================================================

# Tool configuration
CRYSTAL      ?= crystal
CXX          ?= g++
SCONS        ?= scons
GODOT        ?= ./godot.exe
ENTRY        ?= test/src/main.cr
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
TEST_BIN_DIR     = test/bin
TEMPLATE_BIN_DIR = template/bin
EXAMPLES_DIR     = examples
BRIDGE_DLL       = $(BIN_DIR)/crystal_bridge.dll
GAME_DLL         = $(BIN_DIR)/game.dll
GAME_EXE         = $(BIN_DIR)/game.exe
LIBGODOT_DLL     = $(BIN_DIR)/libgodot.dll

.PHONY: all bridge test_project examples examples_exe template game_dll game_exe generate dump_api deps addons sync engine test tests docs run editor clean help

# Default target: compile bridge, test project, examples, template, sync DLLs, and run test suite
all: dirs deps bridge addons test_project examples template sync test
	@echo ===================================================================
	@echo   LibGodot Crystal library build completed successfully!
	@echo   Run 'make run' to launch test runner or 'make editor' for editor.
	@echo ===================================================================

# Ensure output directories exist
dirs:
	@$(POWERSHELL) "foreach ($$dir in @('$(BIN_DIR)', '$(TEST_BIN_DIR)', '$(TEMPLATE_BIN_DIR)')) { if (-not (Test-Path $$dir)) { New-Item -ItemType Directory -Force -Path $$dir | Out-Null } }"

# Compile C++ GDExtension bridge and sync to consumer projects
bridge: dirs
	@echo [Bridge] Compiling GDExtension bridge (crystal_bridge.dll)...
	$(CXX) -shared $(CXXFLAGS) src/bridge/crystal_bridge.cpp -o $(BRIDGE_DLL)
	@$(POWERSHELL) "try { Copy-Item '$(BRIDGE_DLL)' '$(TEST_BIN_DIR)/crystal_bridge.dll' -Force } catch {}; try { Copy-Item '$(BRIDGE_DLL)' '$(TEMPLATE_BIN_DIR)/crystal_bridge.dll' -Force } catch {}"

# Synchronize addons across root, test, template, and examples
addons: dirs
	@powershell -ExecutionPolicy Bypass -File scripts/sync_addons.ps1

# Build test project
test_project: dirs deps bridge addons
	@echo [Test] Building test suite project...
	$(MAKE) -C test RELEASE=$(RELEASE)

# Build all example projects in examples/
examples: dirs deps bridge addons
	@echo [Examples] Building all projects in $(EXAMPLES_DIR)...
	@$(POWERSHELL) "if (Test-Path '$(EXAMPLES_DIR)') { foreach ($$ex in Get-ChildItem -Path '$(EXAMPLES_DIR)' -Directory) { if (Test-Path (Join-Path $$ex.FullName 'Makefile')) { Write-Host \"[Examples] Building $($$ex.Name)...\"; & make -C $$ex.FullName RELEASE=$(RELEASE) } } }"

# Build standalone executables for all example projects in examples/
examples_exe: dirs deps bridge addons
	@echo [Examples] Building standalone executables for all projects in $(EXAMPLES_DIR)...
	@$(POWERSHELL) "if (Test-Path '$(EXAMPLES_DIR)') { foreach ($$ex in Get-ChildItem -Path '$(EXAMPLES_DIR)' -Directory) { if (Test-Path (Join-Path $$ex.FullName 'Makefile')) { Write-Host \"[Examples] Building executable for $($$ex.Name)...\"; & make -C $$ex.FullName game_exe RELEASE=$(RELEASE) } } }"

template: dirs deps bridge addons
	@echo [Template] Building template project...
	$(MAKE) -C template RELEASE=$(RELEASE)

# Compile game.dll for all consumers and synchronize
game_dll: dirs deps bridge addons test_project examples template sync
	@echo [Build] All game.dll targets compiled and synced!

# Compile standalone game executable for LibGodot host paradigm
game_exe: dirs deps bridge
	@echo [Standalone] Compiling standalone game.exe from $(ENTRY)...
	@$(POWERSHELL) "$$env:CRYSTAL_PATH = 'src;' + (crystal env CRYSTAL_PATH); crystal build $(CRYSTAL_FLAGS) $(ENTRY) -o $(GAME_EXE)"
	@$(POWERSHELL) "try { Copy-Item '$(GAME_EXE)' '$(TEST_BIN_DIR)/game.exe' -Force } catch {}"

# Generate Crystal bindings from Godot extension_api.json
dump_api:
	@echo [API] Dumping extension_api.json from Godot...
	$(GODOT) --headless --dump-extension-api

generate:
	@echo [Generator] Generating complete Godot bindings from extension_api.json...
	$(CRYSTAL) run scripts/generate_bindings.cr

# Copy Crystal runtime dependencies and libgodot.dll to all bin dirs
deps: dirs
	@echo [Dependencies] Ensuring runtime DLLs are available in bin/, test/bin/, and template/bin/...
	@$(POWERSHELL) "$$c = Split-Path (Get-Command crystal -ErrorAction SilentlyContinue).Source; if ($$c) { foreach ($$dll in @('gc.dll','iconv-2.dll','pcre2-8.dll')) { $$src = Join-Path $$c $$dll; if (Test-Path $$src) { foreach ($$d in @('$(BIN_DIR)', '$(TEST_BIN_DIR)', '$(TEMPLATE_BIN_DIR)')) { if (-not (Test-Path ($$d + '/' + $$dll))) { Copy-Item $$src ($$d + '/') -Force -ErrorAction SilentlyContinue } } } } }; exit 0"
	@$(POWERSHELL) "if ((Test-Path 'godot-src/bin/godot.windows.template_debug.x86_64.dll') -and (-not (Test-Path '$(BIN_DIR)/libgodot.dll'))) { Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(BIN_DIR)/libgodot.dll' -Force -ErrorAction SilentlyContinue }; if (Test-Path '$(BIN_DIR)/libgodot.dll') { foreach ($$d in @('$(TEST_BIN_DIR)', '$(TEMPLATE_BIN_DIR)')) { if (-not (Test-Path ($$d + '/libgodot.dll'))) { Copy-Item '$(BIN_DIR)/libgodot.dll' ($$d + '/libgodot.dll') -Force -ErrorAction SilentlyContinue } } }; exit 0"

# Synchronize compiled binaries and runtime dependencies to consumer projects
sync: addons
	@echo [Sync] Syncing runtime DLLs and bridge to test/bin, template/bin, and examples...
	@$(POWERSHELL) "$$targetDirs = [System.Collections.Generic.List[string]]::new(); $$targetDirs.Add('$(TEST_BIN_DIR)'); $$targetDirs.Add('$(TEMPLATE_BIN_DIR)'); if (Test-Path '$(EXAMPLES_DIR)') { foreach ($$ex in Get-ChildItem -Path '$(EXAMPLES_DIR)' -Directory) { $$targetDirs.Add(\"$(EXAMPLES_DIR)/$$($$ex.Name)/bin\") } }; foreach ($$dir in $$targetDirs) { if (-not (Test-Path $$dir)) { New-Item -ItemType Directory -Force -Path $$dir | Out-Null }; foreach ($$dll in @('crystal_bridge.dll', 'gc.dll', 'iconv-2.dll', 'pcre2-8.dll', 'libgodot.dll', 'libgodot.lib')) { $$src = Join-Path '$(BIN_DIR)' $$dll; if ((Test-Path $$src) -and (-not (Test-Path (Join-Path $$dir $$dll)))) { Copy-Item $$src (Join-Path $$dir $$dll) -Force -ErrorAction SilentlyContinue } } }; exit 0"
	@$(POWERSHELL) "if (Test-Path '$(TEST_BIN_DIR)/game.dll') { Copy-Item '$(TEST_BIN_DIR)/game.dll' '$(BIN_DIR)/game.dll' -Force -ErrorAction SilentlyContinue }; exit 0"
	@$(POWERSHELL) "if (Test-Path '$(TEST_BIN_DIR)/game.exe') { Copy-Item '$(TEST_BIN_DIR)/game.exe' '$(BIN_DIR)/game.exe' -Force -ErrorAction SilentlyContinue }; exit 0"
	@$(POWERSHELL) "$$projects = [System.Collections.Generic.List[string]]::new(); $$projects.Add('test'); $$projects.Add('template'); if (Test-Path '$(EXAMPLES_DIR)') { foreach ($$ex in Get-ChildItem -Path '$(EXAMPLES_DIR)' -Directory) { $$projects.Add(\"$(EXAMPLES_DIR)/$$($$ex.Name)\") } }; foreach ($$p in $$projects) { $$cfgDir = Join-Path $$p '.godot'; if (-not (Test-Path $$cfgDir)) { New-Item -ItemType Directory -Force -Path $$cfgDir | Out-Null }; Set-Content -Path (Join-Path $$cfgDir 'extension_list.cfg') -Value 'res://addons/crystal_integration/crystal.gdextension' -Force }; exit 0"

# Build Godot engine shared library from source (requires godot-src and scons)
engine:
	@echo Compiling Godot Engine shared library (libgodot.dll) via SCons...
	$(SCONS) -C godot-src target=template_debug dev_build=yes library_type=shared_library -j$(SCONS_JOBS)
	@$(POWERSHELL) "Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(BIN_DIR)/libgodot.dll' -Force; Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(TEST_BIN_DIR)/libgodot.dll' -Force; Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(TEMPLATE_BIN_DIR)/libgodot.dll' -Force; if (Test-Path 'godot-src/bin/godot.windows.template_debug.x86_64.lib') { Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.lib' '$(BIN_DIR)/libgodot.lib' -Force }"
	@echo libgodot.dll updated successfully!

# Run complete test suites and verification (Crystal specs, in-editor @tool tests, runtime project tests, smoke tests)
test:
	@powershell -ExecutionPolicy Bypass -File scripts/run_tests.ps1

tests: test

# Generate offline HTML documentation
docs:
	@echo Generating Crystal HTML documentation in docs/...
	$(CRYSTAL) docs src/libgodot.cr
	@echo Documentation generated at docs/index.html

# Launch test project using Godot
run:
	@echo Launching Crystal LibGodot Test Runner...
	$(GODOT) --path test

# Launch Godot editor for test project
editor:
	@echo Opening Godot Editor for Test Project...
	$(GODOT) --editor --path test

# Clean build artifacts (preserves libgodot.dll and runtime DLLs)
clean:
	@echo Cleaning build artifacts across bin/, test/bin/, template/bin/, and examples...
	@$(POWERSHELL) "Get-ChildItem -Path '$(BIN_DIR)', '$(TEST_BIN_DIR)', '$(TEMPLATE_BIN_DIR)' -Include 'crystal_bridge.*', 'game.*', '~crystal_bridge.*' -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue"
	@$(POWERSHELL) "if (Test-Path '$(EXAMPLES_DIR)') { Get-ChildItem -Path '$(EXAMPLES_DIR)' -Include 'crystal_bridge.*', 'game.*', '~crystal_bridge.*' -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue }"
	@$(POWERSHELL) "Get-ChildItem -Path 'scratch' -Include '*.obj', '*.exp' -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue"
	@echo Clean complete.

# Display help menu
help:
	@echo ===================================================================
	@echo   LibGodot for Crystal - Build Commands
	@echo ===================================================================
	@echo   make              Build bridge, test project, examples, template, sync
	@echo   make bridge       Build bin/crystal_bridge.dll
	@echo   make test_project Build test/bin/game.dll
	@echo   make examples     Build all projects in examples/
	@echo   make template     Build template/bin/game.dll
	@echo   make game_dll     Build and sync game.dll across all targets
	@echo   make deps         Ensure runtime DLLs (gc, iconv, pcre2) are copied
	@echo   make sync         Sync bin/ binaries to test/bin, template/bin, examples
	@echo   make test         Run verification specs and headless smoke tests
	@echo   make docs         Generate API documentation (crystal docs)
	@echo   make run          Run the test suite in Godot
	@echo   make editor       Open the test suite in the Godot Editor
	@echo   make engine       Rebuild Godot engine shared library via SCons
	@echo   make clean        Remove compiled game/bridge binaries
	@echo ===================================================================
