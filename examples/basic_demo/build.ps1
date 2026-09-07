# Build script for Crystal Godot Basic Demo
param(
    [switch]$Release,
    [switch]$Exe
)

$ErrorActionPreference = "Stop"

$relArg = if ($Release) { "1" } else { "" }
$rootDir = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$packageScript = Join-Path $rootDir "scripts/package_game.ps1"

Write-Host "[Demo] Building Basic Demo..." -ForegroundColor Cyan
& powershell -NoProfile -ExecutionPolicy Bypass -File $packageScript -ProjectPath $PSScriptRoot -Name "basic_demo" -Release $relArg
