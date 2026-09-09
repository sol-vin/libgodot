# Opens the Godot 4.8 Editor for the Crystal LibGodot Performance Stress Suite
$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$GodotExe = Join-Path $Root "godot.exe"
if (-not (Test-Path $GodotExe)) {
    if (Test-Path (Join-Path $Root "godot")) {
        $GodotExe = Join-Path $Root "godot"
    } elseif (Get-Command godot -ErrorAction SilentlyContinue) {
        $GodotExe = "godot"
    }
}
$PerfPath = Join-Path $Root "performance"

if (-not (Test-Path $GodotExe) -and -not (Get-Command $GodotExe -ErrorAction SilentlyContinue)) {
    Write-Error "godot executable was not found in root directory: $Root"
    exit 1
}

Write-Host "=================================================" -ForegroundColor Green
Write-Host "  Opening Godot Editor for Performance Suite     " -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
Write-Host "Engine:  $GodotExe"
Write-Host "Project: $PerfPath"

& $GodotExe --verbose --editor --path $PerfPath @args | Out-Host
