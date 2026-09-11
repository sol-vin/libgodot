<#
.SYNOPSIS
    Downloads and sets up the targeted Godot Engine development binary and dumps GDExtension API definitions.

.DESCRIPTION
    Reads the desired version tag from 'godot-version.yml' (or -Version parameter), downloads the official
    Godot Windows 64-bit binary from github.com/godotengine/godot-builds, places it as 'godot.exe' in the
    repository root, and automatically regenerates rsrc/extension_api.json and rsrc/gdextension_interface.h.

.PARAMETER Version
    Optional override of the version tag (e.g. '4.8-dev5'). If specified, updates godot-version.yml.

.EXAMPLE
    .\setup-dev.ps1
    .\setup-dev.ps1 -Version "4.8-dev5"
#>

[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Version
)

$ErrorActionPreference = "Stop"
$RootDir = $PSScriptRoot
if (-not $RootDir) {
    $RootDir = (Get-Location).Path
}

$VersionFile = Join-Path $RootDir "godot-version.yml"

# 1. Resolve Target Version
if (-not $Version) {
    if (Test-Path $VersionFile) {
        $content = Get-Content -Path $VersionFile -Raw
        if ($content -match 'version:\s*"?([^"\r\n]+)"?') {
            $Version = $matches[1].Trim()
        }
    }
}

if (-not $Version) {
    $Version = "4.8-dev5"
}

Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "           LibGodot Engine Setup & Upgrade Tool                  " -ForegroundColor Cyan
Write-Host "=================================================================" -ForegroundColor Cyan
Write-Host "Target Version : $Version" -ForegroundColor Green
Write-Host "Root Directory : $RootDir" -ForegroundColor Gray

# 2. Fetch Release Metadata from GitHub
$ApiUrl = "https://api.github.com/repos/godotengine/godot-builds/releases/tags/$Version"
Write-Host "Querying release metadata from GitHub API: $ApiUrl..." -ForegroundColor Yellow

$Headers = @{
    "User-Agent" = "LibGodot-SetupDev"
}

try {
    $release = Invoke-RestMethod -Uri $ApiUrl -Headers $Headers
} catch {
    Write-Host "::error::Failed to fetch release '$Version' from godot-builds. Check internet connection or release tag." -ForegroundColor Red
    throw $_
}

# 3. Locate Windows 64-bit non-mono asset
$asset = $release.assets | Where-Object {
    $_.name -match "win64.*\.zip$" -and $_.name -notmatch "mono"
} | Select-Object -First 1

if (-not $asset) {
    Write-Host "::error::Could not find Windows 64-bit zip asset in release '$Version'." -ForegroundColor Red
    throw "No matching Windows 64-bit asset found."
}

$DownloadUrl = $asset.browser_download_url
$ArchiveName = $asset.name
Write-Host "Found Asset    : $ArchiveName" -ForegroundColor Green
Write-Host "Download URL   : $DownloadUrl" -ForegroundColor Gray

# 4. Download Asset
$TempDir = Join-Path $RootDir "scratch\godot_setup"
if (-not (Test-Path $TempDir)) {
    New-Item -ItemType Directory -Path $TempDir -Force | Out-Null
}

$ZipPath = Join-Path $TempDir $ArchiveName
if (Test-Path $ZipPath) {
    Remove-Item -Path $ZipPath -Force -ErrorAction SilentlyContinue
}

Write-Host "Downloading $ArchiveName..." -ForegroundColor Yellow
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "LibGodot-SetupDev")
$wc.DownloadFile($DownloadUrl, $ZipPath)
Write-Host "Download completed successfully ($((Get-Item $ZipPath).Length) bytes)." -ForegroundColor Green

# 5. Extract and Install godot.exe
$ExtractDir = Join-Path $TempDir "extracted"
if (Test-Path $ExtractDir) {
    Remove-Item -Path $ExtractDir -Recurse -Force -ErrorAction SilentlyContinue
}
New-Item -ItemType Directory -Path $ExtractDir -Force | Out-Null

Write-Host "Extracting archive..." -ForegroundColor Yellow
Expand-Archive -Path $ZipPath -DestinationPath $ExtractDir -Force

$extractedExe = Get-ChildItem -Path $ExtractDir -Filter "*.exe" -Recurse | Select-Object -First 1
if (-not $extractedExe) {
    throw "No executable found inside extracted archive."
}

$TargetExe = Join-Path $RootDir "godot.exe"

# Stop any running godot process that may lock godot.exe
$running = Get-Process -Name "godot" -ErrorAction SilentlyContinue
if ($running) {
    Write-Host "Stopping running godot processes..." -ForegroundColor Yellow
    $running | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
}

Write-Host "Installing $($extractedExe.Name) -> $TargetExe..." -ForegroundColor Yellow
Copy-Item -Path $extractedExe.FullName -Destination $TargetExe -Force

# 6. Verify Installed Binary
$installedVersion = & $TargetExe --version
Write-Host "Installed Godot Version: $installedVersion" -ForegroundColor Green

# 7. Dump GDExtension API and Headers
$RsrcDir = Join-Path $RootDir "rsrc"
if (-not (Test-Path $RsrcDir)) {
    New-Item -ItemType Directory -Path $RsrcDir -Force | Out-Null
}

Write-Host "Regenerating GDExtension API definitions..." -ForegroundColor Yellow

$ApiJson = Join-Path $RsrcDir "extension_api.json"
Write-Host "  -> Dumping extension API to $ApiJson..." -ForegroundColor Gray
& $TargetExe --dump-extension-api | Out-Null
if (Test-Path "extension_api.json") {
    Move-Item -Path "extension_api.json" -Destination $ApiJson -Force
}

$ApiHeader = Join-Path $RsrcDir "gdextension_interface.h"
Write-Host "  -> Dumping gdextension interface to $ApiHeader..." -ForegroundColor Gray
& $TargetExe --dump-gdextension-interface | Out-Null
if (Test-Path "gdextension_interface.h") {
    Move-Item -Path "gdextension_interface.h" -Destination $ApiHeader -Force
}

# 8. Regenerate Crystal API Bindings
Write-Host "Regenerating Crystal API bindings..." -ForegroundColor Yellow
& crystal run tools/api_generator/generate_bindings.cr

# 9. Update godot-version.yml
Set-Content -Path $VersionFile -Value "version: `"$Version`"" -Encoding UTF8 -NoNewline
Add-Content -Path $VersionFile -Value "`n"

# 10. Clean Temp Directory
Remove-Item -Path $TempDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "=================================================================" -ForegroundColor Green
Write-Host "  SUCCESS: Godot $Version setup complete and API updated!       " -ForegroundColor Green
Write-Host "  Run 'make all' to rebuild the toolchain against this version. " -ForegroundColor Green
Write-Host "=================================================================" -ForegroundColor Green
