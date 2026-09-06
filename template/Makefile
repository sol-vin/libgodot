# =============================================================================
# Crystal Godot Template Makefile
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

CRYSTAL_FLAGS =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
endif

.PHONY: all game_dll game_exe deps bridge extension_list addons run editor clean help

all: dirs deps bridge extension_list addons game_dll
	@echo ===================================================================
	@echo   Template game.dll built successfully!
	@echo ===================================================================

dirs:
	@$(POWERSHELL) "if (-not (Test-Path '$(BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(BIN_DIR)' | Out-Null }"

deps: dirs
	@$(POWERSHELL) "$$c = Split-Path (Get-Command crystal -ErrorAction SilentlyContinue).Source; if ($$c) { foreach ($$dll in @('gc.dll','iconv-2.dll','pcre2-8.dll')) { $$src = Join-Path $$c $$dll; if ((Test-Path $$src) -and (-not (Test-Path ('$(BIN_DIR)/' + $$dll)))) { Copy-Item $$src '$(BIN_DIR)/' -Force -ErrorAction SilentlyContinue } } }; exit 0"
	@$(POWERSHELL) "if ((Test-Path '../bin/libgodot.dll') -and (-not (Test-Path '$(BIN_DIR)/libgodot.dll'))) { Copy-Item '../bin/libgodot.dll' '$(BIN_DIR)/libgodot.dll' -Force -ErrorAction SilentlyContinue }; exit 0"

bridge: dirs
	@$(POWERSHELL) "if (Test-Path '$(BRIDGE_SRC)') { Copy-Item '$(BRIDGE_SRC)' '$(BIN_DIR)/crystal_bridge.dll' -Force -ErrorAction SilentlyContinue }; exit 0"

extension_list:
	@$(POWERSHELL) "if (-not (Test-Path '.godot')) { New-Item -ItemType Directory -Force -Path '.godot' | Out-Null }; Set-Content -Path '.godot/extension_list.cfg' -Value 'res://addons/crystal_integration/crystal.gdextension' -Force; exit 0"

addons:
	@powershell -ExecutionPolicy Bypass -File ../scripts/sync_addons.ps1 -Source ../addons -Destinations addons

game_dll: dirs deps bridge extension_list addons
	@echo [Template] Compiling game.dll from $(ENTRY)...
	@$(POWERSHELL) "$$env:CRYSTAL_PATH = '../src;' + (crystal env CRYSTAL_PATH); crystal build $(CRYSTAL_FLAGS) --link-flags '$(LINK_FLAGS)' $(ENTRY) -o $(GAME_DLL)"

game_exe: dirs deps bridge
	@echo [Template] Compiling standalone game.exe from $(ENTRY)...
	@$(POWERSHELL) "$$env:CRYSTAL_PATH = '../src;' + (crystal env CRYSTAL_PATH); crystal build $(CRYSTAL_FLAGS) $(ENTRY) -o $(GAME_EXE)"

run: all
	@echo [Template] Running project with Godot...
	$(GODOT) --path .

editor: all
	@echo [Template] Opening project in Godot Editor...
	$(GODOT) --editor --path .

clean:
	@$(RM) $(BIN_DIR)/*
