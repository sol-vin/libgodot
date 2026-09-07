param(
    [switch]$Release,
    [string]$AddonName = "crystal_addon"
)

$ErrorActionPreference = "Stop"
$Root = $PSScriptRoot
$addonBin = Join-Path $Root "addons/$AddonName/bin"

if (-not (Test-Path $addonBin)) {
    New-Item -ItemType Directory -Force -Path $addonBin | Out-Null
}

$ensureDeps = Join-Path $Root "../scripts/ensure_deps.ps1"
if (Test-Path $ensureDeps) {
    & $ensureDeps -TargetBin $addonBin
}

$bridgeSrc = Join-Path $Root "../bin/crystal_bridge.dll"
if (Test-Path $bridgeSrc) {
    Copy-Item $bridgeSrc (Join-Path $addonBin "crystal_bridge.dll") -Force -ErrorAction SilentlyContinue
}

$buildCrystal = Join-Path $Root "../scripts/build_crystal.ps1"
$entry = Join-Path $Root "src/main.cr"
$output = Join-Path $addonBin "game.dll"
$linkFlags = "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init"

$buildArgs = @{
    Entry = $entry
    Output = $output
    LinkFlags = $linkFlags
    SourcePath = (Resolve-Path (Join-Path $Root "../src")).Path
}
if ($Release) {
    $buildArgs.Release = $true
}

& $buildCrystal @buildArgs

Write-Host "Addon built successfully to $addonBin" -ForegroundColor Green
