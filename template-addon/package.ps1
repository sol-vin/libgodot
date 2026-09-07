param(
    [string]$AddonName = "crystal_addon",
    [string]$OutputDir = "dist"
)

$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$addonDir = Join-Path $Root "addons/$AddonName"

if (-not (Test-Path $addonDir)) {
    Write-Error "Addon directory '$addonDir' not found!"
    exit 1
}

$distDir = Join-Path $Root $OutputDir
if (-not (Test-Path $distDir)) {
    New-Item -ItemType Directory -Force -Path $distDir | Out-Null
}

$zipName = "$AddonName.zip"
$zipPath = Join-Path $distDir $zipName

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

Write-Host "Packaging compiled addon '$AddonName' into $zipPath..." -ForegroundColor Cyan

# We want the zip to contain addons/<AddonName>/...
$stagingDir = Join-Path $distDir "staging"
if (Test-Path $stagingDir) {
    Remove-Item $stagingDir -Recurse -Force
}
$stagedAddon = Join-Path $stagingDir "addons/$AddonName"
New-Item -ItemType Directory -Force -Path $stagedAddon | Out-Null

Copy-Item -Path (Join-Path $addonDir "*") -Destination $stagedAddon -Recurse -Force

Compress-Archive -Path (Join-Path $stagingDir "addons") -DestinationPath $zipPath -Force
Remove-Item $stagingDir -Recurse -Force

Write-Host "Successfully packaged addon to: $zipPath" -ForegroundColor Green
Write-Host "Users can unzip this directly into any vanilla Godot 4.x project root." -ForegroundColor Green
