<#
.SYNOPSIS
    Scaffolds a new LibGodot Crystal example project under examples/<Name>.

.DESCRIPTION
    Creates a new standalone Godot 4.8 + Crystal example project in the examples/
    directory based on the standard template, configures paths, and synchronizes
    runtime DLLs and addons.

.PARAMETER Name
    The name of the new example (e.g. "character_controller", "physics_test").

.EXAMPLE
    .\create-new-example.ps1 -Name character_controller
#>
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Name
)

$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$ExamplesDir = Join-Path $Root "examples"
$TargetDir = Join-Path $ExamplesDir $Name
$TemplateDir = Join-Path $Root "template"

if (-not (Test-Path $TemplateDir)) {
    Write-Error "Template directory '$TemplateDir' does not exist."
    exit 1
}

if (Test-Path $TargetDir) {
    Write-Error "Example project '$TargetDir' already exists! Choose a different name."
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Scaffolding New LibGodot Example: $Name                  " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Create directory and copy from template
Write-Host "[1/5] Copying template files to examples/$Name..."
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Copy-Item -Path (Join-Path $TemplateDir "*") -Destination $TargetDir -Recurse -Force

# 2. Update shard.yml with project name
$shardPath = Join-Path $TargetDir "shard.yml"
if (Test-Path $shardPath) {
    Write-Host "[2/5] Updating shard.yml..."
    $shardContent = @"
name: $Name
version: 0.1.0

targets:
  ${Name}:
    main: src/main.cr

crystal: '>= 1.10.0'

dependencies:
  libgodot:
    path: ../../
"@
    Set-Content -Path $shardPath -Value $shardContent -Force
}

# 3. Update project.godot with project name
$projectGodotPath = Join-Path $TargetDir "project.godot"
if (Test-Path $projectGodotPath) {
    Write-Host "[3/5] Updating project.godot..."
    $content = Get-Content -Path $projectGodotPath -Raw
    $content = $content -replace 'config/name="[^"]*"', "config/name=`"$Name`""
    Set-Content -Path $projectGodotPath -Value $content -Force
}

# 4. Configure Makefile with 2-level relative paths
$makefilePath = Join-Path $TargetDir "Makefile"
if (Test-Path $makefilePath) {
    Write-Host "[4/5] Configuring Makefile for examples/$Name..."
    $makefileContent = @"
# =============================================================================
# Crystal Godot Example: $Name
# =============================================================================

CRYSTAL      ?= crystal
GODOT        ?= ../../godot.exe
ENTRY        ?= src/main.cr

BIN_DIR       = bin
GAME_DLL      = `$(BIN_DIR)/game.dll
GAME_EXE      = `$(BIN_DIR)/game.exe
BRIDGE_SRC    = ../../bin/crystal_bridge.dll

POWERSHELL   = powershell -NoProfile -Command
CP           = `$(POWERSHELL) "Copy-Item -Force"
RM           = `$(POWERSHELL) "Remove-Item -Force -ErrorAction SilentlyContinue"

LINK_FLAGS   = /DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init

.PHONY: all game_dll game_exe deps bridge extension_list addons run editor clean help

all: dirs deps bridge extension_list addons game_dll game_exe
	@echo ===================================================================
	@echo   Example $Name built successfully!
	@echo ===================================================================

dirs:
	@powershell -ExecutionPolicy Bypass -Command "if (-not (Test-Path '`$(BIN_DIR)')) { New-Item -ItemType Directory -Force -Path '`$(BIN_DIR)' | Out-Null }"

deps: dirs
	@powershell -ExecutionPolicy Bypass -File ../../scripts/ensure_deps.ps1 -TargetBin '`$(BIN_DIR)'

bridge: dirs
	@powershell -ExecutionPolicy Bypass -Command "if (Test-Path '`$(BRIDGE_SRC)') { Copy-Item '`$(BRIDGE_SRC)' '`$(BIN_DIR)/crystal_bridge.dll' -Force -ErrorAction SilentlyContinue }"

extension_list:
	@powershell -ExecutionPolicy Bypass -Command "if (-not (Test-Path '.godot')) { New-Item -ItemType Directory -Force -Path '.godot' | Out-Null }; Set-Content -Path '.godot/extension_list.cfg' -Value 'res://addons/crystal_integration/crystal.gdextension' -Force"

addons:
	@powershell -ExecutionPolicy Bypass -File ../../scripts/sync_addons.ps1 -Source ../../addons -Destinations addons

game_dll: dirs deps bridge extension_list addons
	@echo [$Name] Compiling game.dll from `$(ENTRY)...
	@powershell -ExecutionPolicy Bypass -File ../../scripts/build_crystal.ps1 -Entry `$(ENTRY) -Output `$(GAME_DLL) -LinkFlags '`$(LINK_FLAGS)' `$(if `$(filter 1,`$(RELEASE)),-Release,) -SourcePath ../../src

game_exe: dirs deps bridge extension_list addons game_dll
	@echo [$Name] Packaging complete playable game executable...
	@powershell -ExecutionPolicy Bypass -File ../../scripts/package_game.ps1 -ProjectPath . -Name $Name `$(if `$(filter 1,`$(RELEASE)),-Release 1,)

run: all
	@echo [$Name] Running example with Godot...
	`$(GODOT) --path .

editor: all
	@echo [$Name] Opening example in Godot Editor...
	`$(GODOT) --editor --path .

clean:
	@`$(RM) `$(BIN_DIR)/*
"@
    Set-Content -Path $makefilePath -Value $makefileContent -Force

    # Generate support scripts for new example
    $buildScript = Join-Path $TargetDir "build.ps1"
    Set-Content -Path $buildScript -Value @"
param([switch]`$Release)
`$ErrorActionPreference = "Stop"
`$relArg = if (`$Release) { "1" } else { "" }
`$packageScript = Join-Path (Resolve-Path "../../scripts/package_game.ps1")
& powershell -NoProfile -ExecutionPolicy Bypass -File `$packageScript -ProjectPath `$PSScriptRoot -Name "$Name" -Release `$relArg
"@ -Force

    $runScript = Join-Path $TargetDir "run.ps1"
    Set-Content -Path $runScript -Value @"
`$ErrorActionPreference = "Stop"
& .\build.ps1
if (Test-Path ".\$Name.exe") { & ".\$Name.exe" } else { & "..\..\godot.exe" --path . }
"@ -Force

    $runEditorScript = Join-Path $TargetDir "run-editor.ps1"
    Set-Content -Path $runEditorScript -Value @"
`$ErrorActionPreference = "Stop"
& .\build.ps1
& "..\..\godot.exe" --editor --path .
"@ -Force

    # Scaffold export_presets.cfg
    $presetPath = Join-Path $TargetDir "export_presets.cfg"
    $templatePresets = Join-Path $Root "template/export_presets.cfg"
    if (Test-Path $templatePresets) {
        Copy-Item $templatePresets $presetPath -Force
    }
}

# 5. Sync runtime DLLs and addons
Write-Host "[5/5] Synchronizing addons and runtime DLLs..."
$syncScript = Join-Path $Root "scripts\sync_addons.ps1"
if (Test-Path $syncScript) {
    & powershell -ExecutionPolicy Bypass -File $syncScript -Source (Join-Path $Root "addons") -Destinations (Join-Path $TargetDir "addons")
}

Write-Host "`nExample project created successfully at: examples/$Name" -ForegroundColor Green
Write-Host "To build and run:" -ForegroundColor Yellow
Write-Host "  cd examples/$Name"
Write-Host "  make run       # Launch game"
Write-Host "  make editor    # Launch Godot editor"
Write-Host "Or from the root directory:" -ForegroundColor Yellow
Write-Host "  make examples  # Builds all examples"
