param(
    [string]$Version = "4.8.dev4",
    [string]$DownloadUrl = "",
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$projRoot = $PSScriptRoot
$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$isMac = $false
try {
    if ($IsMacOS -or [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)) {
        $isMac = $true
    }
} catch {}
if (-not $isMac -and -not $onWindows) {
    if ((Get-Command uname -ErrorAction SilentlyContinue) -and ((& uname) -eq "Darwin")) { $isMac = $true }
}

$exeName = if ($onWindows) { "godot.exe" } else { "godot" }
$targetExe = Join-Path $projRoot $exeName

if (-not $Force -and (Test-Path $targetExe)) {
    Write-Host "[SetupDev] Godot is already installed at '$targetExe'." -ForegroundColor Green
    try {
        & $targetExe --headless --version
    } catch {}
    Write-Host "[SetupDev] To re-download, pass -Force." -ForegroundColor Cyan
    exit 0
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  LibGodot Project Setup: Installing Godot Engine         " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# Determine default download URL based on OS and version
if (-not $DownloadUrl) {
    $tag = $Version -replace '\.', '-'
    $baseUrl = "https://github.com/godotengine/godot-builds/releases/download/$tag"
    if ($onWindows) {
        $DownloadUrl = "$baseUrl/Godot_v${Version}_win64.exe.zip"
    } elseif ($isMac) {
        $DownloadUrl = "$baseUrl/Godot_v${Version}_macos.universal.zip"
    } else {
        $DownloadUrl = "$baseUrl/Godot_v${Version}_linux.x86_64.zip"
    }
}

Write-Host "[SetupDev] Downloading Godot $Version from:" -ForegroundColor Cyan
Write-Host "  $DownloadUrl" -ForegroundColor Gray

$tempZip = Join-Path ([System.IO.Path]::GetTempPath()) "godot_setup_$([System.Guid]::NewGuid().ToString('N')).zip"
$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) "godot_setup_extract_$([System.Guid]::NewGuid().ToString('N'))"

try {
    if (Test-Path $tempZip) { Remove-Item $tempZip -Force }
    if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force }

    Write-Host "[SetupDev] Downloading archive..."
    Invoke-WebRequest -Uri $DownloadUrl -OutFile $tempZip -UseBasicParsing

    Write-Host "[SetupDev] Extracting Godot archive..."
    Expand-Archive -Path $tempZip -DestinationPath $tempDir -Force

    $binaryFound = $null
    if ($onWindows) {
        # Prefer the standard editor exe over console wrapper if both exist
        $exes = Get-ChildItem -Path $tempDir -Filter "*.exe" -Recurse | Where-Object { $_.Name -notmatch '_console\.exe$' }
        if (-not $exes) {
            $exes = Get-ChildItem -Path $tempDir -Filter "*.exe" -Recurse
        }
        if ($exes) {
            $binaryFound = $exes[0].FullName
        }
    } elseif ($isMac) {
        $apps = Get-ChildItem -Path $tempDir -Filter "Godot.app" -Recurse
        if ($apps) {
            $macBin = Join-Path $apps[0].FullName "Contents/MacOS/Godot"
            if (Test-Path $macBin) { $binaryFound = $macBin }
        }
        if (-not $binaryFound) {
            $bins = Get-ChildItem -Path $tempDir -Recurse | Where-Object { -not $_.PSIsContainer -and $_.Name -match 'Godot' }
            if ($bins) { $binaryFound = $bins[0].FullName }
        }
    } else {
        $bins = Get-ChildItem -Path $tempDir -Recurse | Where-Object { -not $_.PSIsContainer -and ($_.Name -match 'linux' -or $_.Name -match 'Godot') }
        if ($bins) { $binaryFound = $bins[0].FullName }
    }

    if (-not $binaryFound -or -not (Test-Path $binaryFound)) {
        throw "Could not locate Godot executable inside extracted archive."
    }

    Write-Host "[SetupDev] Installing to $targetExe..." -ForegroundColor Cyan
    Copy-Item $binaryFound $targetExe -Force

    if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
        & chmod +x $targetExe
    }

    Write-Host "[SetupDev] Godot installed successfully at '$targetExe'!" -ForegroundColor Green
    try {
        & $targetExe --headless --version
    } catch {}
} finally {
    if (Test-Path $tempZip) { Remove-Item $tempZip -Force -ErrorAction SilentlyContinue }
    if (Test-Path $tempDir) { Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue }
}
