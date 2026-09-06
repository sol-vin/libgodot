# =============================================================================
# Crystal Godot Demo Makefile
# =============================================================================

CRYSTAL      ?= crystal
GODOT        ?= ../../godot.exe
ENTRY        ?= src/main.cr

BIN_DIR       = bin
GAME_DLL      = $(BIN_DIR)/game.dll
GAME_EXE      = $(BIN_DIR)/game.exe
BRIDGE_SRC    = ../../bin/crystal_bridge.dll

POWERSHELL   = powershell -NoProfile -Command
CP           = $(POWERSHELL) "Copy-Item -Force"
RM           = $(POWERSHELL) "Remove-Item -Force -ErrorAction SilentlyContinue"

LINK_FLAGS   = /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init

CRYSTAL_FLAGS =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
endif

.PHONY: all game_dll game_exe deps bridge extension_list addons run editor clean help

all: dirs deps bridge extension_list addons game_dll
	@echo ===================================================================
	@echo   Demo game.dll built successfully!
	@echo ===================================================================

dirs:
	@powershell -ExecutionPolicy Bypass -Command "if (-not (Test-Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(BIN_DIR)' | Out-Null }"

deps: dirs
	@powershell -ExecutionPolicy Bypass -File ../../scripts/ensure_deps.ps1 -TargetBin '$(BIN_DIR)'

bridge: dirs
	@powershell -ExecutionPolicy Bypass -Command "if (Test-Path '$(BRIDGE_SRC)') { Copy-Item '$(BRIDGE_SRC)' '$(BIN_DIR)/crystal_bridge.dll' -Force -ErrorAction SilentlyContinue }"

extension_list:
	@powershell -ExecutionPolicy Bypass -Command "if (-not (Test-Path '.godot')) { New-Item -ItemType Directory -Force -Path '.godot' | Out-Null }; Set-Content -Path '.godot/extension_list.cfg' -Value 'res://addons/crystal_integration/crystal.gdextension' -Force"

addons:
	@powershell -ExecutionPolicy Bypass -File ../../scripts/sync_addons.ps1 -Source ../../addons -Destinations addons

game_dll: dirs deps bridge extension_list addons
	@echo [Demo] Compiling game.dll from $(ENTRY)...
	@powershell -ExecutionPolicy Bypass -File ../../scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_DLL) -LinkFlags '$(LINK_FLAGS)' $(if $(filter 1,$(RELEASE)),-Release,) -SourcePath ../../src
	@powershell -ExecutionPolicy Bypass -Command "if (Test-Path '$(GAME_DLL)') { Copy-Item '$(GAME_DLL)' '../../bin/game.dll' -Force -ErrorAction SilentlyContinue }"

game_exe: dirs deps bridge
	@echo [Demo] Compiling standalone game.exe from $(ENTRY)...
	@powershell -ExecutionPolicy Bypass -File ../../scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_EXE) $(if $(filter 1,$(RELEASE)),-Release,) -SourcePath ../../src
	@powershell -ExecutionPolicy Bypass -Command "if (Test-Path '$(GAME_EXE)') { Copy-Item '$(GAME_EXE)' '../../bin/game.exe' -Force -ErrorAction SilentlyContinue }"

run: all
	@echo [Demo] Running demo with Godot...
	$(GODOT) --path .

editor: all
	@echo [Demo] Opening demo in Godot Editor...
	$(GODOT) --editor --path .

clean:
	@$(RM) $(BIN_DIR)/*
