# =============================================================================
# Crystal Godot Addon Template Makefile
# =============================================================================

ADDON_NAME      ?= crystal_addon
ADDON_DIR       = addons/$(ADDON_NAME)
ADDON_BIN_DIR   = $(ADDON_DIR)/bin

ifeq ($(OS),Windows_NT)
	PLATFORM        = windows
	SO_EXT          = dll
	EXE_EXT         = .exe
	GODOT           ?= ../godot.exe
	PWSH_CMD        ?= powershell -NoProfile -ExecutionPolicy Bypass -Command
	PWSH_FILE       ?= powershell -NoProfile -ExecutionPolicy Bypass -File
	LINK_FLAGS      ?= /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init
else
	PLATFORM        = linux
	SO_EXT          = so
	EXE_EXT         =
	GODOT           ?= ../godot
	PWSH_CMD        ?= pwsh -NoProfile -Command
	PWSH_FILE       ?= pwsh -NoProfile -File
	LINK_FLAGS      ?= -shared
endif

ENTRY           ?= src/main.cr
GAME_LIB        = $(ADDON_BIN_DIR)/game.$(SO_EXT)
BRIDGE_SRC      = ../bin/crystal_bridge.$(SO_EXT)

RM              = $(PWSH_CMD) "Remove-Item -Force -ErrorAction SilentlyContinue"

CRYSTAL_FLAGS   =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
endif

.PHONY: all build deps bridge extension_list package run editor clean help

all: dirs deps bridge extension_list build
	@echo ===================================================================
	@echo   Crystal Godot Addon '$(ADDON_NAME)' built successfully!
	@echo   Run 'make editor' to test in editor or 'make package' to create zip.
	@echo ===================================================================

dirs:
	@$(PWSH_CMD) "if (-not (Test-Path '$(ADDON_BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '$(ADDON_BIN_DIR)' | Out-Null }"

deps: dirs
	@$(PWSH_FILE) ../scripts/ensure_deps.ps1 -TargetBin '$(ADDON_BIN_DIR)'

bridge: dirs
	@$(PWSH_CMD) "if (Test-Path '$(BRIDGE_SRC)') { Copy-Item '$(BRIDGE_SRC)' '$(ADDON_BIN_DIR)/crystal_bridge.$(SO_EXT)' -Force -ErrorAction SilentlyContinue }"

extension_list: dirs
	@$(PWSH_CMD) "if (-not (Test-Path '.godot')) { New-Item -ItemType Directory -Force -Path '.godot' | Out-Null }; Set-Content -Path '.godot/extension_list.cfg' -Value 'res://$(ADDON_DIR)/crystal_addon.gdextension' -Force"

build: dirs deps bridge extension_list
	@echo [Addon] Compiling $(GAME_LIB) from $(ENTRY)...
	@$(PWSH_FILE) ../scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_LIB) -LinkFlags '$(LINK_FLAGS)' $(if $(filter 1,$(RELEASE)),-Release,) -SourcePath ../src

package: all
	@echo [Addon] Packaging distributable zip for '$(ADDON_NAME)'...
	@$(PWSH_FILE) package.ps1 -AddonName $(ADDON_NAME)

editor: all
	@echo [Addon] Launching Godot Editor to test addon...
	$(GODOT) --editor --path .

run: all
	@echo [Addon] Running Godot project with addon...
	$(GODOT) --path .

clean:
	@$(RM) $(ADDON_BIN_DIR)/*
	@$(RM) dist/*
