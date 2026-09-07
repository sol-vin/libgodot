# Launch Godot Editor for Crystal Godot Basic Demo
$ErrorActionPreference = "Stop"

& .\build.ps1

$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$exeExt = if ($onWindows) { ".exe" } else { "" }

if (Test-Path "..\..\godot$exeExt") {
    Write-Host "[Demo] Launching Godot Editor..." -ForegroundColor Cyan
    & "..\..\godot$exeExt" --editor --path .
} else {
    godot --editor --path .
}
