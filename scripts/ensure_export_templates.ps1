param(
    [string]$Version = "4.8.dev4",
    [string]$DownloadUrl = "https://github.com/godotengine/godot-builds/releases/download/4.8-dev4/Godot_v4.8-dev4_export_templates.tpz",
    [switch]$PackageZip,
    [string]$ZipOutput = "dist/godot-crystal-export-templates-4.8-dev4.zip"
)

$ErrorActionPreference = "Stop"

$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')

# 1. Determine template target directory
$templateBase = if ($onWindows) {
    Join-Path $env:APPDATA "Godot/export_templates"
} else {
    $home = if ($env:HOME) { $env:HOME } else { [System.Environment]::GetFolderPath('UserProfile') }
    Join-Path $home ".local/share/godot/export_templates"
}
$targetDir = Join-Path $templateBase $Version

# 2. Check if templates are already installed
$hasTemplates = $false
if (Test-Path $targetDir) {
    $candidates = if ($onWindows) {
        Get-ChildItem -Path $targetDir -Filter "windows_release_*.exe" -ErrorAction SilentlyContinue
    } else {
        Get-ChildItem -Path $targetDir -Filter "linux_release_*" -ErrorAction SilentlyContinue
    }
    if ($candidates -and $candidates.Count -gt 0) {
        $hasTemplates = $true
        Write-Host "[ExportTemplates] Found existing export templates in '$targetDir'." -ForegroundColor Green
    }
}

# 3. Download and extract templates if missing
if (-not $hasTemplates) {
    Write-Host "[ExportTemplates] Downloading Godot export templates for $Version from $DownloadUrl..." -ForegroundColor Cyan
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    }

    $tempZip = Join-Path ([System.IO.Path]::GetTempPath()) "godot_templates_$$.zip"
    $tempExtract = Join-Path ([System.IO.Path]::GetTempPath()) "godot_templates_extract_$$"

    try {
        if (Test-Path $tempZip) { Remove-Item $tempZip -Force }
        if (Test-Path $tempExtract) { Remove-Item $tempExtract -Recurse -Force }

        Invoke-WebRequest -Uri $DownloadUrl -OutFile $tempZip -UseBasicParsing
        Expand-Archive -Path $tempZip -DestinationPath $tempExtract -Force

        # The .tpz zip archive typically contains a 'templates/' folder
        $srcDir = if (Test-Path (Join-Path $tempExtract "templates")) {
            Join-Path $tempExtract "templates"
        } else {
            $tempExtract
        }

        Copy-Item (Join-Path $srcDir "*") $targetDir -Recurse -Force
        Write-Host "[ExportTemplates] Installed export templates successfully into '$targetDir'." -ForegroundColor Green
    } finally {
        if (Test-Path $tempZip) { Remove-Item $tempZip -Force -ErrorAction SilentlyContinue }
        if (Test-Path $tempExtract) { Remove-Item $tempExtract -Recurse -Force -ErrorAction SilentlyContinue }
    }
}

# 4. Optional packaging of export templates as a distribution zip
if ($PackageZip) {
    Write-Host "[ExportTemplates] Packaging templates archive: $ZipOutput..." -ForegroundColor Cyan
    $outDir = Split-Path -Parent $ZipOutput
    if ($outDir -and -not (Test-Path $outDir)) {
        New-Item -ItemType Directory -Force -Path $outDir | Out-Null
    }
    if (Test-Path $ZipOutput) { Remove-Item $ZipOutput -Force }

    $stagingTemplates = Join-Path ([System.IO.Path]::GetTempPath()) "godot_pkg_templates_$$"
    try {
        if (Test-Path $stagingTemplates) { Remove-Item $stagingTemplates -Recurse -Force }
        $innerDir = Join-Path $stagingTemplates "templates"
        New-Item -ItemType Directory -Force -Path $innerDir | Out-Null
        Copy-Item (Join-Path $targetDir "*") $innerDir -Recurse -Force
        Compress-Archive -Path (Join-Path $stagingTemplates "*") -DestinationPath $ZipOutput -Force
        Write-Host "[ExportTemplates] Export templates package created: $ZipOutput" -ForegroundColor Green
    } finally {
        if (Test-Path $stagingTemplates) { Remove-Item $stagingTemplates -Recurse -Force -ErrorAction SilentlyContinue }
    }
}
