# =============================================================================
# Crystal Godot Demo Makefile
# =============================================================================

UNAME_S := $(shell uname -s 2>/dev/null)

# Platform and OS detection
ifeq ($(OS),Windows_NT)
	PLATFORM        = windows
	SO_EXT          = dll
	EXE_EXT         = .exe
	GODOT           ?= ../../godot.exe
	PWSH_CMD        ?= powershell -NoProfile -ExecutionPolicy Bypass -Command
	PWSH_FILE       ?= powershell -NoProfile -ExecutionPolicy Bypass -File
	LINK_FLAGS      ?= /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init
else ifeq ($(UNAME_S),Darwin)
	PLATFORM        = macos
	SO_EXT          = dylib
	EXE_EXT         =
	GODOT           ?= ../../godot
	PWSH_CMD        ?= pwsh -NoProfile -Command
	PWSH_FILE       ?= pwsh -NoProfile -File
	LINK_FLAGS      ?= -dynamiclib
else
	PLATFORM        = linux
	SO_EXT          = so
	EXE_EXT         =
	GODOT           ?= ../../godot
	PWSH_CMD        ?= pwsh -NoProfile -Command
	PWSH_FILE       ?= pwsh -NoProfile -File
	LINK_FLAGS      ?= -shared
endif

ENTRY        ?= src/main.cr

BIN_DIR       = bin
GAME_LIB      = $(BIN_DIR)/game.$(SO_EXT)
GAME_EXE      = $(BIN_DIR)/game$(EXE_EXT)
BRIDGE_SRC    = ../../bin/crystal_bridge.$(SO_EXT)

# Backward-compatibility alias
GAME_DLL      = $(GAME_LIB)

CP           = $(PWSH_CMD) "Copy-Item -Force"
RM           = $(PWSH_CMD) "Remove-Item -Force -ErrorAction SilentlyContinue"

CRYSTAL_FLAGS =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
endif

.PHONY: all game_dll game_exe deps bridge extension_list addons rebuild export export_release run editor clean help

all: dirs deps bridge extension_list addons game_dll game_exe
	@echo ===================================================================
	@echo   Demo game library and playable executable built successfully!
	@echo ===================================================================

dirs:
	@$(PWSH_CMD) "if (-not (Test-Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(BIN_DIR)' | Out-Null }"

deps: dirs
	@$(PWSH_FILE) ../../scripts/ensure_deps.ps1 -TargetBin '$(BIN_DIR)'

bridge: dirs
	@$(PWSH_CMD) "if (Test-Path '$(BRIDGE_SRC)') { Copy-Item '$(BRIDGE_SRC)' '$(BIN_DIR)/crystal_bridge.$(SO_EXT)' -Force -ErrorAction SilentlyContinue }"

extension_list:
	@$(PWSH_CMD) "if (-not (Test-Path '.godot')) { New-Item -ItemType Directory -Force -Path '.godot' | Out-Null }; Set-Content -Path '.godot/extension_list.cfg' -Value 'res://addons/crystal_integration/crystal.gdextension' -Force"

addons:
	@$(PWSH_FILE) ../../scripts/sync_addons.ps1 -Source ../../addons -Destinations addons

game_dll: dirs deps bridge extension_list addons
	@echo [Demo] Compiling game.$(SO_EXT) from $(ENTRY)...
	@$(PWSH_FILE) ../../scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_LIB) -LinkFlags '$(LINK_FLAGS)' $(if $(filter 1,$(RELEASE)),-Release,) -SourcePath ../../src
	@$(PWSH_CMD) "if (Test-Path '$(GAME_LIB)') { Copy-Item '$(GAME_LIB)' 'addons/crystal_integration/bin/game.$(SO_EXT)' -Force -ErrorAction SilentlyContinue }"

game_exe: dirs deps bridge extension_list addons game_dll
	@echo [Demo] Packaging complete playable game executable...
	@$(PWSH_FILE) ../../scripts/package_game.ps1 -ProjectPath . -Name basic_demo $(if $(filter 1,$(RELEASE)),-Release 1,)

run: all
	@echo [Demo] Running demo with Godot...
	$(GODOT) --path .

editor: all
	@echo [Demo] Opening demo in Godot Editor...
	$(GODOT) --editor --path .

clean:
	@$(RM) $(BIN_DIR)/*
	@$(PWSH_CMD) "Remove-Item -Path 'basic_demo.exe', 'basic_demo', 'game.exe', 'game', 'export' -Recurse -Force -ErrorAction SilentlyContinue"

rebuild: clean all

export: all
	@echo [Demo] Exporting demo to export/ directory...
	@$(PWSH_FILE) ../../scripts/package_game.ps1 -ProjectPath . -Name basic_demo -TargetDir export -ForceCompile

export_release: dirs deps bridge extension_list addons
	@echo [Demo] Exporting optimized release demo to export/ directory...
	@$(PWSH_FILE) ../../scripts/package_game.ps1 -ProjectPath . -Name basic_demo -TargetDir export -Release 1 -ForceCompile

help:
	@echo ===================================================================
	@echo   LibGodot Basic Demo - Build and Export Commands
	@echo ===================================================================
	@echo   make                Build demo library, runnable executable, and sync
	@echo   make rebuild        Clean and rebuild all artifacts
	@echo   make game_dll       Compile demo shared library (game.$(SO_EXT))
	@echo   make game_exe       Package playable demo executable into bin/
	@echo   make export         Export standalone playable demo package to export/
	@echo   make export_release Export release optimized demo package to export/
	@echo   make run            Launch demo in Godot
	@echo   make editor         Open demo in Godot Editor
	@echo   make clean          Remove built binaries and export directories
	@echo ===================================================================
