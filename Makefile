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

# Platform and OS detection
ifeq ($(OS),Windows_NT)
	PLATFORM        = windows
	SO_EXT          = dll
	EXE_EXT         = .exe
	GODOT           ?= ./godot.exe
	PWSH_CMD        ?= powershell -NoProfile -ExecutionPolicy Bypass -Command
	PWSH_FILE       ?= powershell -NoProfile -ExecutionPolicy Bypass -File
	CXXFLAGS        ?= -std=c++17 -O2 -I rsrc -static -static-libgcc -static-libstdc++
	LINK_FLAGS      ?= /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init
else
	PLATFORM        = linux
	SO_EXT          = so
	EXE_EXT         =
	GODOT           ?= ./godot
	PWSH_CMD        ?= pwsh -NoProfile -Command
	PWSH_FILE       ?= pwsh -NoProfile -File
	CXXFLAGS        ?= -std=c++17 -O2 -fPIC -I rsrc
	LINK_FLAGS      ?= -shared
endif

CP           = $(PWSH_CMD) "Copy-Item -Force"
RM           = $(PWSH_CMD) "Remove-Item -Force -ErrorAction SilentlyContinue"

# Optional release mode: make RELEASE=1
CRYSTAL_FLAGS =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
	CXXFLAGS      += -DLIBGODOT_RELEASE=1 -DNDEBUG
endif

# Output artifacts
BIN_DIR          = bin
TEST_BIN_DIR     = test/bin
TEMPLATE_BIN_DIR = template/bin
EXAMPLES_DIR     = examples
BRIDGE_LIB       = $(BIN_DIR)/crystal_bridge.$(SO_EXT)
GAME_LIB         = $(BIN_DIR)/game.$(SO_EXT)
GAME_EXE         = $(BIN_DIR)/game$(EXE_EXT)
LIBGODOT_LIB     = $(BIN_DIR)/libgodot.$(SO_EXT)

# Aliases for backwards compatibility
BRIDGE_DLL       = $(BRIDGE_LIB)
GAME_DLL         = $(GAME_LIB)
LIBGODOT_DLL     = $(LIBGODOT_LIB)

.PHONY: all bridge test_project examples examples_exe template game_dll game_exe android package_android generate dump_api deps addons sync engine test tests docs run editor clean help

# Default target: compile bridge, test project, examples, template, sync DLLs, and run test suite
all: dirs deps bridge addons test_project examples template sync test
	@echo ===================================================================
	@echo   LibGodot Crystal library build completed successfully!
	@echo   Run 'make run' to launch test runner or 'make editor' for editor.
	@echo ===================================================================

# Ensure output directories exist
dirs:
	@$(PWSH_FILE) scripts/ensure_dirs.ps1

# Compile C++ GDExtension bridge and sync to consumer projects
bridge: dirs
	@echo [Bridge] Compiling GDExtension bridge $(BRIDGE_LIB)...
	$(CXX) -shared $(CXXFLAGS) src/bridge/crystal_bridge.cpp -o $(BRIDGE_LIB)
	@$(PWSH_FILE) scripts/sync_bins.ps1

# Synchronize addons across root, test, template, and examples
addons: dirs
	@$(PWSH_FILE) scripts/sync_addons.ps1

# Build test project
test_project: dirs deps bridge addons
	@echo [Test] Building test suite project...
	$(MAKE) -C test RELEASE=$(RELEASE)

# Build all example projects in examples/
examples: dirs deps bridge addons
	@echo [Examples] Building all projects in $(EXAMPLES_DIR)...
	@$(PWSH_FILE) scripts/build_examples.ps1 -Release "$(RELEASE)"

# Build standalone executables for all example projects in examples/
examples_exe: dirs deps bridge addons
	@echo [Examples] Building standalone executables for all projects in $(EXAMPLES_DIR)...
	@$(PWSH_FILE) scripts/build_examples.ps1 -Exe -Release "$(RELEASE)"

template: dirs deps bridge addons
	@echo [Template] Building template project...
	$(MAKE) -C template RELEASE=$(RELEASE)

# Compile game_dll for all consumers and synchronize
game_dll: dirs deps bridge addons test_project examples template sync
	@echo [Build] All game library targets compiled and synced!

# Compile standalone game executable for LibGodot host paradigm
game_exe: dirs deps bridge
	@echo [Standalone] Compiling standalone game executable from $(ENTRY)...
	@$(PWSH_FILE) scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_EXE) $(if $(filter 1,$(RELEASE)),-Release,)
	@$(PWSH_CMD) "Copy-Item '$(GAME_EXE)' '$(TEST_BIN_DIR)/game$(EXE_EXT)' -Force -ErrorAction SilentlyContinue"

# Cross-compile for Android (libcrystal_bridge.so and libgame.so)
android: dirs
	@echo [Android] Cross-compiling LibGodot for Android arm64-v8a...
	@$(PWSH_FILE) scripts/build_android.ps1 -Release "$(RELEASE)" $(if $(ENTRY),-Entry $(ENTRY),)

# Package Android APK
package_android: dirs bridge android
	@echo [Android] Packaging Android APK...
	@$(PWSH_FILE) scripts/package_android.ps1 $(if $(filter 1,$(RELEASE)),-Release,) $(if $(ENTRY),-Entry $(ENTRY),)

# Create or inspect Android keystores
keystore: dirs
	@$(PWSH_FILE) scripts/manage_keystore.ps1

keystore_decode: dirs
	@$(PWSH_FILE) scripts/manage_keystore.ps1 -Decode $(if $(KEYSTORE),-Path $(KEYSTORE),)


# Generate Crystal bindings from Godot extension_api.json
dump_api:
	@echo [API] Dumping extension_api.json from Godot...
	$(GODOT) --headless --dump-extension-api

generate:
	@echo [Generator] Generating complete Godot bindings from extension_api.json...
	$(CRYSTAL) run scripts/generate_bindings.cr

# Copy Crystal runtime dependencies and libgodot to all bin dirs
deps: dirs
	@echo [Dependencies] Ensuring runtime libraries are available in bin/, test/bin/, and template/bin/...
	@$(PWSH_FILE) scripts/ensure_deps.ps1

# Synchronize compiled binaries and runtime dependencies to consumer projects
sync: addons
	@echo [Sync] Syncing runtime libraries and bridge to test/bin, template/bin, and examples...
	@$(PWSH_FILE) scripts/sync_bins.ps1

# Build Godot engine shared library from source (requires godot-src and scons)
engine:
	@echo Compiling Godot Engine shared library $(LIBGODOT_LIB) via SCons...
	$(SCONS) -C godot-src target=template_debug dev_build=yes library_type=shared_library -j$(SCONS_JOBS)
	@$(PWSH_FILE) scripts/sync_bins.ps1
	@echo $(LIBGODOT_LIB) updated successfully!

# Run complete test suites and verification (Crystal specs, in-editor @tool tests, runtime project tests, smoke tests)
test:
	@$(PWSH_FILE) scripts/run_tests.ps1

tests: test

# Generate offline HTML documentation
docs:
	@echo Generating Crystal HTML documentation in docs/...
	$(CRYSTAL) docs
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
