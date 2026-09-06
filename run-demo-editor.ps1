# Opens the Godot 4.8 Editor for the Crystal LibGodot Demo
$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$GodotExe = Join-Path $Root "godot.exe"
$DemoPath = Join-Path $Root "demo"

if (-not (Test-Path $GodotExe)) {
    Write-Error "godot.exe was not found in root directory: $Root"
    exit 1
}

Write-Host "==========================================" -ForegroundColor Green
Write-Host "  Opening Godot Editor for Demo Project   " -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host "Engine:  $GodotExe"
Write-Host "Project: $DemoPath"

& $GodotExe --editor --path $DemoPath @args | Out-Host

