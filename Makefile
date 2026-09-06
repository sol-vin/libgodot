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
BIN_DIR       = bin
DEMO_BIN_DIR  = demo/bin
BRIDGE_DLL    = $(BIN_DIR)/crystal_bridge.dll
GAME_DLL      = $(BIN_DIR)/game.dll
GAME_EXE      = $(BIN_DIR)/game.exe
LIBGODOT_DLL  = $(BIN_DIR)/libgodot.dll

.PHONY: all bridge game_dll game_exe deps sync engine test docs run editor clean help

# Default target: compile bridge, game.dll, game.exe, ensure deps and sync
all: dirs deps bridge game_dll game_exe sync
	@echo ===================================================================
	@echo   LibGodot Crystal build completed successfully!
	@echo   Run 'make test' to verify or 'make run' to launch the demo.
	@echo ===================================================================

# Ensure output directories exist
dirs:
	@$(POWERSHELL) "if (-not (Test-Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(BIN_DIR)' | Out-Null }; if (-not (Test-Path '$(DEMO_BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(DEMO_BIN_DIR)' | Out-Null }"


# Compile C++ GDExtension bridge
bridge: dirs
	@echo [1/4] Compiling GDExtension bridge (crystal_bridge.dll)...
	$(CXX) -shared $(CXXFLAGS) src/bridge/crystal_bridge.cpp -o $(BRIDGE_DLL)

# Compile Crystal shared library (game.dll)
game_dll: dirs
	@echo [2/4] Compiling Crystal game library (game.dll)...
	$(CRYSTAL) build $(CRYSTAL_FLAGS) --link-flags "$(LINK_FLAGS)" $(ENTRY) -o $(GAME_DLL)

# Compile Crystal standalone executable (game.exe)
game_exe: dirs
	@echo [3/4] Compiling Crystal host executable (game.exe)...
	$(CRYSTAL) build $(CRYSTAL_FLAGS) $(ENTRY) -o $(GAME_EXE)

# Copy Crystal runtime dependencies (gc.dll, iconv-2.dll, pcre2-8.dll) and libgodot.dll
deps: dirs
	@echo [Dependencies] Ensuring runtime DLLs are available in bin/ and demo/bin/...
	@$(POWERSHELL) "$$c = Split-Path (Get-Command crystal -ErrorAction SilentlyContinue).Source; if ($$c) { foreach ($$dll in @('gc.dll','iconv-2.dll','pcre2-8.dll')) { $$src = Join-Path $$c $$dll; if (Test-Path $$src) { Copy-Item $$src '$(BIN_DIR)/' -Force; Copy-Item $$src '$(DEMO_BIN_DIR)/' -Force } } }"
	@$(POWERSHELL) "if (Test-Path 'godot-src/bin/godot.windows.template_debug.x86_64.dll') { Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(BIN_DIR)/libgodot.dll' -Force; Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(DEMO_BIN_DIR)/libgodot.dll' -Force }; if ((Test-Path '$(BIN_DIR)/libgodot.dll') -and (-not (Test-Path '$(DEMO_BIN_DIR)/libgodot.dll'))) { Copy-Item '$(BIN_DIR)/libgodot.dll' '$(DEMO_BIN_DIR)/libgodot.dll' -Force }"


# Synchronize compiled artifacts into demo/bin
sync:
	@echo [4/4] Syncing compiled binaries to demo/bin/...
	@$(CP) $(BRIDGE_DLL) $(DEMO_BIN_DIR)/crystal_bridge.dll
	@$(CP) $(GAME_DLL) $(DEMO_BIN_DIR)/game.dll
	@$(CP) $(GAME_EXE) $(DEMO_BIN_DIR)/game.exe

# Build Godot engine shared library from source (requires godot-src and scons)
engine:
	@echo Compiling Godot Engine shared library (libgodot.dll) via SCons...
	$(SCONS) -C godot-src target=template_debug dev_build=yes library_type=shared_library -j$(SCONS_JOBS)
	@$(POWERSHELL) "Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(BIN_DIR)/libgodot.dll' -Force; Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.dll' '$(DEMO_BIN_DIR)/libgodot.dll' -Force; if (Test-Path 'godot-src/bin/godot.windows.template_debug.x86_64.lib') { Copy-Item 'godot-src/bin/godot.windows.template_debug.x86_64.lib' '$(BIN_DIR)/libgodot.lib' -Force }"
	@echo libgodot.dll updated successfully!

# Run test suites and verification
test:
	@echo Running Crystal verification specs...
	$(CRYSTAL) run spec/libgodot_spec.cr
	$(CRYSTAL) run spec/boot_spec.cr
	@echo All specs passed!

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
	@echo Cleaning build artifacts...
	@$(POWERSHELL) "Get-ChildItem -Path '$(BIN_DIR)', '$(DEMO_BIN_DIR)' -Include 'crystal_bridge.*', 'game.*', '~crystal_bridge.*' -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue"
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
