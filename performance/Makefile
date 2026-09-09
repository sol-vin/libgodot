# =============================================================================
# Crystal LibGodot Performance Stress Benchmark Makefile
# =============================================================================

UNAME_S := $(shell uname -s 2>/dev/null)

ifeq ($(OS),Windows_NT)
	PLATFORM        = windows
	SO_EXT          = dll
	EXE_EXT         = .exe
	GODOT           ?= ../godot.exe
	PWSH_CMD        ?= powershell -NoProfile -ExecutionPolicy Bypass -Command
	PWSH_FILE       ?= powershell -NoProfile -ExecutionPolicy Bypass -File
	LINK_FLAGS      ?= /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init
else ifeq ($(UNAME_S),Darwin)
	PLATFORM        = macos
	SO_EXT          = dylib
	EXE_EXT         =
	GODOT           ?= ../godot
	PWSH_CMD        ?= pwsh -NoProfile -Command
	PWSH_FILE       ?= pwsh -NoProfile -File
	LINK_FLAGS      ?= -dynamiclib
else
	PLATFORM        = linux
	SO_EXT          = so
	EXE_EXT         =
	GODOT           ?= ../godot
	PWSH_CMD        ?= pwsh -NoProfile -Command
	PWSH_FILE       ?= pwsh -NoProfile -File
	LINK_FLAGS      ?= -shared
endif

ENTRY        ?= src/main.cr

BIN_DIR       = bin
GAME_LIB      = $(BIN_DIR)/game.$(SO_EXT)
BRIDGE_SRC    = ../bin/crystal_bridge.$(SO_EXT)

CP           = $(PWSH_CMD) "Copy-Item -Force"
RM           = $(PWSH_CMD) "Remove-Item -Force -ErrorAction SilentlyContinue"

CRYSTAL_FLAGS =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
endif

.PHONY: all game_dll game_exe standalone package deps bridge extension_list addons run editor clean help

all: dirs deps bridge extension_list addons game_dll
	@echo ===================================================================
	@echo   Performance Benchmark library built successfully!
	@echo ===================================================================

dirs:
	@$(PWSH_CMD) "if (-not (Test-Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(BIN_DIR)' | Out-Null }"

deps: dirs
	@$(PWSH_FILE) ../scripts/ensure_deps.ps1

bridge: dirs
	@$(PWSH_CMD) "if (Test-Path '$(BRIDGE_SRC)') { Copy-Item '$(BRIDGE_SRC)' '$(BIN_DIR)/crystal_bridge.$(SO_EXT)' -Force -ErrorAction SilentlyContinue }"

extension_list: dirs
	@$(PWSH_FILE) ../scripts/ensure_extension_list.ps1 -ProjectPath .

addons:
	@$(PWSH_FILE) ../scripts/sync_addons.ps1 -Source ../addons -Destinations addons

game_dll: dirs deps bridge extension_list addons
	@echo [Performance] Compiling game.$(SO_EXT) from $(ENTRY)...
	@$(PWSH_FILE) ../scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_LIB) -LinkFlags '$(LINK_FLAGS)' $(if $(filter 1,$(RELEASE)),-Release,) -SourcePath ../src
	@$(PWSH_CMD) "if (Test-Path '$(GAME_LIB)') { try { Copy-Item '$(GAME_LIB)' 'addons/crystal_integration/bin/game.$(SO_EXT)' -Force } catch {} }"

standalone: dirs deps bridge extension_list addons game_dll
	@echo [Performance] Packaging standalone benchmark executable...
	@$(PWSH_FILE) ../scripts/package_game.ps1 -ProjectPath . -Name "perf" $(if $(filter 1,$(RELEASE)),-Release 1,) -ForceCompile

game_exe: standalone
package: standalone

run: all
	@echo [Performance] Running Performance Stress Benchmark...
	$(GODOT) --path . $(ARGS)

editor: all
	@echo [Performance] Opening Performance project in Godot Editor...
	$(GODOT) --editor --path .

clean:
	@$(RM) $(BIN_DIR)/*
	@$(PWSH_CMD) "Remove-Item -Path 'perf.exe', 'perf', 'perf.console.exe', 'game.exe', 'game' -Recurse -Force -ErrorAction SilentlyContinue"
