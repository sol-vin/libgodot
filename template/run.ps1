# Run script for Crystal Godot Template
$ErrorActionPreference = "Stop"

& .\build.ps1

Write-Host "[Template] Launching Godot..." -ForegroundColor Cyan
& ..\godot.exe --path .
