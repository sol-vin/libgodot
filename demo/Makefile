# =============================================================================
# Crystal Godot Demo Makefile
# =============================================================================

CRYSTAL      ?= crystal
GODOT        ?= ../godot.exe
ENTRY        ?= src/main.cr

BIN_DIR       = bin
GAME_DLL      = $(BIN_DIR)/game.dll
GAME_EXE      = $(BIN_DIR)/game.exe
BRIDGE_SRC    = ../bin/crystal_bridge.dll

POWERSHELL   = powershell -NoProfile -Command
CP           = $(POWERSHELL) "Copy-Item -Force"
RM           = $(POWERSHELL) "Remove-Item -Force -ErrorAction SilentlyContinue"

LINK_FLAGS   = /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init

.PHONY: all game_dll game_exe deps bridge run editor clean help

all: dirs deps bridge game_dll
	@echo ===================================================================
	@echo   Demo game.dll built successfully!
	@echo ===================================================================

dirs:
	@$(POWERSHELL) "if (-not (Test-Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(BIN_DIR)' | Out-Null }"

deps: dirs
	@$(POWERSHELL) "$$c = Split-Path (Get-Command crystal -ErrorAction SilentlyContinue).Source; if ($$c) { foreach ($$dll in @('gc.dll','iconv-2.dll','pcre2-8.dll')) { $$src = Join-Path $$c $$dll; if ((Test-Path $$src) -and (-not (Test-Path ('$(BIN_DIR)/' + $$dll)))) { Copy-Item $$src '$(BIN_DIR)/' -Force } } }"

bridge: dirs
	@$(POWERSHELL) "if (Test-Path '$(BRIDGE_SRC)') { Copy-Item '$(BRIDGE_SRC)' '$(BIN_DIR)/crystal_bridge.dll' -Force }"

game_dll: dirs deps bridge
	@echo [Demo] Compiling game.dll from $(ENTRY)...
	@$(POWERSHELL) "$$env:CRYSTAL_PATH = '../src;' + (crystal env CRYSTAL_PATH); crystal build --link-flags '$(LINK_FLAGS)' $(ENTRY) -o $(GAME_DLL)"

game_exe: dirs deps bridge
	@echo [Demo] Compiling standalone game.exe from $(ENTRY)...
	@$(POWERSHELL) "$$env:CRYSTAL_PATH = '../src;' + (crystal env CRYSTAL_PATH); crystal build $(ENTRY) -o $(GAME_EXE)"

run: all
	@echo [Demo] Running demo with Godot...
	$(GODOT) --path .

editor: all
	@echo [Demo] Opening demo in Godot Editor...
	$(GODOT) --editor --path .

clean:
	@$(RM) $(BIN_DIR)/*
