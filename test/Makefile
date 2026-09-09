# =============================================================================
# Crystal LibGodot Test Suite Makefile
# =============================================================================

UNAME_S := $(shell uname -s 2>/dev/null)

# Platform and OS detection
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
TESTS_EXE     = $(BIN_DIR)/tests$(EXE_EXT)
BRIDGE_SRC    = ../bin/crystal_bridge.$(SO_EXT)

# Backward-compatibility alias
GAME_DLL      = $(GAME_LIB)
GAME_EXE      = $(TESTS_EXE)

CP           = $(PWSH_CMD) "Copy-Item -Force"
RM           = $(PWSH_CMD) "Remove-Item -Force -ErrorAction SilentlyContinue"

CRYSTAL_FLAGS =
ifeq ($(RELEASE), 1)
	CRYSTAL_FLAGS += --release
endif

.PHONY: all game_dll game_exe standalone spec deps bridge extension_list addons rebuild export export_release run editor clean help

all: dirs deps bridge extension_list addons game_dll
	@echo ===================================================================
	@echo   Test Suite game library built successfully!
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
	@echo [Test] Compiling game.$(SO_EXT) from $(ENTRY)...
	@$(PWSH_FILE) ../scripts/build_crystal.ps1 -Entry $(ENTRY) -Output $(GAME_LIB) -LinkFlags '$(LINK_FLAGS)' $(if $(filter 1,$(RELEASE)),-Release,) -SourcePath ../src
	@$(PWSH_CMD) "if (Test-Path '$(GAME_LIB)') { Copy-Item '$(GAME_LIB)' '../bin/game.$(SO_EXT)' -Force -ErrorAction SilentlyContinue; Copy-Item '$(GAME_LIB)' 'addons/crystal_integration/bin/game.$(SO_EXT)' -Force -ErrorAction SilentlyContinue }"

spec:
	@echo [Spec] Running Crystal specifications in spec/...
	crystal spec

standalone: dirs deps bridge extension_list addons game_dll
	@echo [Test] Packaging standalone test runner executable...
	@$(PWSH_FILE) ../scripts/package_game.ps1 -ProjectPath . $(if $(filter 1,$(RELEASE)),-Release 1,) -ForceCompile

game_exe: standalone

run: all
	@echo [Test] Running test suite with Godot...
	$(GODOT) --path .

editor: all
	@echo [Test] Opening test suite in Godot Editor...
	$(GODOT) --editor --path .

clean:
	@$(RM) $(BIN_DIR)/*
	@$(PWSH_CMD) "Remove-Item -Path 'tests.exe', 'tests', 'game.exe', 'game', 'export', 'test_report.md', 'test_report.json', '.tool_tests_passed', '.tool_tests_failed', '.runtime_tests_passed', '.runtime_tests_failed', '.runtime_test_results.txt' -Recurse -Force -ErrorAction SilentlyContinue"

rebuild: clean all

export: all
	@echo [Test] Exporting test project to export/ directory...
	@$(PWSH_FILE) ../scripts/package_game.ps1 -ProjectPath . -Name tests -TargetDir export -ForceCompile

export_release: dirs deps bridge extension_list addons
	@echo [Test] Exporting optimized release test project to export/ directory...
	@$(PWSH_FILE) ../scripts/package_game.ps1 -ProjectPath . -Name tests -TargetDir export -Release 1 -ForceCompile

help:
	@echo ===================================================================
	@echo   LibGodot Test Suite - Build and Export Commands
	@echo ===================================================================
	@echo   make                Build test project and dependencies
	@echo   make rebuild        Clean and rebuild all artifacts
	@echo   make game_dll       Compile test game shared library (game.$(SO_EXT))
	@echo   make standalone     Package standalone test executable runner
	@echo   make game_exe       Compile standalone game executable
	@echo   make export         Export standalone playable test suite to export/
	@echo   make export_release Export release optimized test suite to export/
	@echo   make run            Launch test suite with Godot
	@echo   make editor         Open test suite in Godot Editor
	@echo   make clean          Remove all built artifacts and test reports
	@echo ===================================================================
