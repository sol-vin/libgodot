# Run script for Crystal Godot Basic Demo
$ErrorActionPreference = "Stop"

& .\build.ps1

$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$exeExt = if ($onWindows) { ".exe" } else { "" }

if (Test-Path ".\basic_demo$exeExt") {
    Write-Host "[Demo] Launching basic_demo$exeExt..." -ForegroundColor Cyan
    & ".\basic_demo$exeExt"
} elseif (Test-Path "..\..\godot$exeExt") {
    Write-Host "[Demo] Launching with Godot..." -ForegroundColor Cyan
    & "..\..\godot$exeExt" --path .
} else {
    godot --path .
}
