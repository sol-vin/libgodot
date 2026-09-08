param(
    [switch]$NoBuild
)

$ErrorActionPreference = "Stop"

$projRoot = $PSScriptRoot
$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$exeName = if ($onWindows) { "godot.exe" } else { "godot" }

# 1. Resolve Godot executable
$godotCandidates = @(
    (Join-Path $projRoot $exeName),
    (Join-Path $projRoot "../$exeName"),
    (Join-Path $projRoot "../../$exeName"),
    $env:GODOT4,
    $env:GODOT4_BIN
)

$godotExe = $null
foreach ($cand in $godotCandidates) {
    if ($cand -and (Test-Path $cand)) {
        $godotExe = (Resolve-Path $cand).Path
        break
    }
}

if (-not $godotExe -and (Get-Command godot -ErrorAction SilentlyContinue)) {
    $godotExe = (Get-Command godot).Source
}

if (-not $godotExe) {
    Write-Host "[RunEditor] Error: Godot engine executable was not found!" -ForegroundColor Red
    Write-Host "[RunEditor] Run .\setup-dev.ps1 in this directory to automatically download and install Godot." -ForegroundColor Yellow
    exit 1
}

# 2. Build addon library if needed
if (-not $NoBuild) {
    $addonName = "crystal_addon"
    $addonBin = Join-Path $projRoot "addons/$addonName/bin/game." + (if ($onWindows) { "dll" } elseif ($IsMacOS) { "dylib" } else { "so" })
    $mainCr = Join-Path $projRoot "src/main.cr"
    $needsBuild = $false

    if (Test-Path $mainCr) {
        if (-not (Test-Path $addonBin)) {
            $needsBuild = $true
        } elseif ((Get-Item $mainCr).LastWriteTime -gt (Get-Item $addonBin).LastWriteTime) {
            $needsBuild = $true
        }
    }

    if ($needsBuild) {
        Write-Host "[RunEditor] Building addon before launching editor..." -ForegroundColor Cyan
        if (Get-Command make -ErrorAction SilentlyContinue) {
            & make -C $projRoot build
        }
    }
}

# 3. Launch Godot Editor
Write-Host "[RunEditor] Launching Godot Editor using $godotExe..." -ForegroundColor Green
& $godotExe --editor --path $projRoot @args
