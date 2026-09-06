# Editor launch script for Crystal Godot Template
$ErrorActionPreference = "Stop"

& .\build.ps1

Write-Host "[Template] Launching Godot Editor..." -ForegroundColor Cyan
& ..\godot.exe --editor --path .
