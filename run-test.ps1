# =============================================================================
# Runs the Crystal LibGodot Test Suite (Automated CI & Interactive UI)
# =============================================================================
param(
    [switch]$Interactive,
    [switch]$UI,
    [switch]$SkipSpecs,
    [switch]$SkipToolTests,
    [switch]$SkipRuntimeTests
)

$ErrorActionPreference = "Stop"
$Root = $PSScriptRoot
$GodotExe = Join-Path $Root "godot.exe"
$TestPath = Join-Path $Root "test"

if (-not (Test-Path $GodotExe)) {
    Write-Error "godot.exe was not found in root directory: $Root"
    exit 1
}

if ($Interactive -or $UI) {
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "  Launching Crystal LibGodot Interactive  " -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    & $GodotExe --path $TestPath @args | Out-Host
    exit $LASTEXITCODE
} else {
    $script = Join-Path $Root "scripts/run_tests.ps1"
    & powershell -ExecutionPolicy Bypass -File $script @args
    exit $LASTEXITCODE
}
