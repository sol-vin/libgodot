# Runs the Crystal LibGodot Test Suite using the root godot.exe
$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$GodotExe = Join-Path $Root "godot.exe"
$TestPath = Join-Path $Root "test"

if (-not (Test-Path $GodotExe)) {
    Write-Error "godot.exe was not found in root directory: $Root"
    exit 1
}

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Launching Crystal LibGodot Test Runner  " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Engine:  $GodotExe"
Write-Host "Project: $TestPath"

& $GodotExe --path $TestPath @args | Out-Host
