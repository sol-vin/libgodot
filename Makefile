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
	@powershell -ExecutionPolicy Bypass -File scripts/ensure_dirs.ps1

# Compile C++ GDExtension bridge and sync to consumer projects
bridge: dirs
	@echo [Bridge] Compiling GDExtension bridge crystal_bridge.dll...
	$(CXX) -shared $(CXXFLAGS) src/bridge/crystal_bridge.cpp -o $(BRIDGE_DLL)
	@powershell -ExecutionPolicy Bypass -File scripts/sync_bins.ps1

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
	@powershell -ExecutionPolicy Bypass -File scripts/build_examples.ps1 -Release "$(RELEASE)"

# Build standalone executables for all example projects in examples/
examples_exe: dirs deps bridge addons
	@echo [Examples] Building standalone executables for all projects in $(EXAMPLES_DIR)...
	@powershell -ExecutionPolicy Bypass -File scripts/build_examples.ps1 -Exe -Release "$(RELEASE)"

template: dirs deps bridge addons
	@echo [Template] Building template project...
	$(MAKE) -C template RELEASE=$(RELEASE)

# Compile game.dll for all consumers and synchronize
game_dll: dirs deps bridge addons test_project examples template sync
	@echo [Build] All game.dll targets compiled and synced!

# Compile standalone game executable for LibGodot host paradigm
game_exe: dirs deps bridge
	@echo [Standalone] Compiling standalone game.exe from $(ENTRY)...
	@powershell -ExecutionPolicy Bypass -File scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_EXE) $(if $(filter 1,$(RELEASE)),-Release,)
	@powershell -ExecutionPolicy Bypass -Command "Copy-Item '$(GAME_EXE)' '$(TEST_BIN_DIR)/game.exe' -Force -ErrorAction SilentlyContinue"

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
	@powershell -ExecutionPolicy Bypass -File scripts/ensure_deps.ps1

# Synchronize compiled binaries and runtime dependencies to consumer projects
sync: addons
	@echo [Sync] Syncing runtime DLLs and bridge to test/bin, template/bin, and examples...
	@powershell -ExecutionPolicy Bypass -File scripts/sync_bins.ps1

# Build Godot engine shared library from source (requires godot-src and scons)
engine:
	@echo Compiling Godot Engine shared library libgodot.dll via SCons...
	$(SCONS) -C godot-src target=template_debug dev_build=yes library_type=shared_library -j$(SCONS_JOBS)
	@powershell -ExecutionPolicy Bypass -File scripts/sync_bins.ps1
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
	@echo   make deps         Ensure runtime DLLs - gc, iconv, pcre2 are copied
	@echo   make sync         Sync bin/ binaries to test/bin, template/bin, examples
	@echo   make test         Run verification specs and headless smoke tests
	@echo   make docs         Generate API documentation via crystal docs
	@echo   make run          Run the test suite in Godot
	@echo   make editor       Open the test suite in the Godot Editor
	@echo   make engine       Rebuild Godot engine shared library via SCons
	@echo   make clean        Remove compiled game/bridge binaries
	@echo ===================================================================
