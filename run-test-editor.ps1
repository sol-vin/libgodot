# Opens the Godot 4.8 Editor for the Crystal LibGodot Test Suite
$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$GodotExe = Join-Path $Root "godot.exe"
$TestPath = Join-Path $Root "test"

if (-not (Test-Path $GodotExe)) {
    Write-Error "godot.exe was not found in root directory: $Root"
    exit 1
}

Write-Host "==========================================" -ForegroundColor Green
Write-Host "  Opening Godot Editor for Test Project   " -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host "Engine:  $GodotExe"
Write-Host "Project: $TestPath"

& $GodotExe --verbose --editor --path $TestPath @args | Out-Host
