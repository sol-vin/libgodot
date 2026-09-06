# Build script for Crystal Godot Template
$ErrorActionPreference = "Stop"

Write-Host "[Template] Building Crystal game.dll..." -ForegroundColor Cyan
if (-not (Test-Path "bin")) {
    New-Item -ItemType Directory -Path "bin" | Out-Null
}

# Copy runtime DLLs
$crystalPath = Split-Path (Get-Command crystal).Source
foreach ($dll in @("gc.dll", "iconv-2.dll", "pcre2-8.dll")) {
    $src = Join-Path $crystalPath $dll
    if (Test-Path $src) {
        Copy-Item $src "bin/" -Force
    }
}

# Copy crystal_bridge.dll
if (Test-Path "../bin/crystal_bridge.dll") {
    Copy-Item "../bin/crystal_bridge.dll" "bin/" -Force
}

# Set CRYSTAL_PATH so require "libgodot" finds ../src/libgodot.cr
$origPath = crystal env CRYSTAL_PATH
$env:CRYSTAL_PATH = "../src;$origPath"

# Compile Crystal source
crystal build --link-flags "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init" src/main.cr -o bin/game.dll

Write-Host "[Template] Build completed successfully: bin/game.dll" -ForegroundColor Green
