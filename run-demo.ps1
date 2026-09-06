# Runs the Crystal LibGodot Demo using the root godot.exe
$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$GodotExe = Join-Path $Root "godot.exe"
$DemoPath = Join-Path $Root "demo"

if (-not (Test-Path $GodotExe)) {
    Write-Error "godot.exe was not found in root directory: $Root"
    exit 1
}

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  Launching Crystal LibGodot Demo Game    " -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Engine:  $GodotExe"
Write-Host "Project: $DemoPath"

& $GodotExe --path $DemoPath @args | Out-Host

