<#
.SYNOPSIS
    Scaffolds a new standalone Godot Crystal Addon from template-addon.

.DESCRIPTION
    Creates a new compiled GDExtension addon project in the specified target directory
    (defaults to examples/addons/<Name> or addons_dev/<Name>) configured with custom name,
    metadata, and directory structures ready for compilation and packaging.

.PARAMETER Name
    The name of the new addon (e.g. "dialogue_system", "terrain_tool").

.PARAMETER Author
    The author name (defaults to "Developer").

.PARAMETER Description
    Short description of the addon.

.PARAMETER TargetPath
    Optional custom destination path for the addon project.

.EXAMPLE
    .\create-new-addon.ps1 -Name dialogue_system -Author "Jane Doe"
#>
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Name,
    [Parameter(Position = 1)]
    [string]$Author = "Developer",
    [Parameter(Position = 2)]
    [string]$Description = "Compiled Crystal GDExtension Addon for Godot",
    [string]$TargetPath = ""
)

$ErrorActionPreference = "Stop"

$Root = $PSScriptRoot
$TemplateDir = Join-Path $Root "template-addon"

if (-not (Test-Path $TemplateDir)) {
    Write-Error "Template directory '$TemplateDir' does not exist."
    exit 1
}

# Determine target directory
if ([string]::IsNullOrWhiteSpace($TargetPath)) {
    $TargetDir = Join-Path $Root "examples/$Name"
} else {
    $TargetDir = $TargetPath
}

if (Test-Path $TargetDir) {
    Write-Error "Target directory '$TargetDir' already exists! Choose a different name or path."
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Scaffolding New Crystal Addon: $Name                     " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Create target directory and copy root template files (excluding addons, dist, .godot)
Write-Host "[1/5] Copying template-addon files..."
New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
Get-ChildItem -Path $TemplateDir -Exclude "addons", "dist", ".godot" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $TargetDir -Recurse -Force
}

# 2. Setup addons/$Name directory from template
$newAddonDir = Join-Path $TargetDir "addons/$Name"
New-Item -ItemType Directory -Force -Path $newAddonDir | Out-Null
$templateAddonDir = Join-Path $TemplateDir "addons/crystal_addon"
Get-ChildItem -Path $templateAddonDir -Exclude "bin" | ForEach-Object {
    Copy-Item -Path $_.FullName -Destination $newAddonDir -Recurse -Force
}
New-Item -ItemType Directory -Force -Path (Join-Path $newAddonDir "bin") | Out-Null

# 3. Configure <Name>.gdextension file
$oldGdx = Join-Path $newAddonDir "crystal_addon.gdextension"
$newGdx = Join-Path $newAddonDir "$Name.gdextension"
if (Test-Path $oldGdx) {
    Write-Host "[2/5] Configuring $Name.gdextension..."
    $gdxContent = Get-Content -Path $oldGdx -Raw
    $gdxContent = $gdxContent -replace "crystal_addon", $Name
    Set-Content -Path $newGdx -Value $gdxContent -Force
    Remove-Item $oldGdx -Force
}

# 4. Update plugin.cfg
$pluginCfg = Join-Path $newAddonDir "plugin.cfg"
if (Test-Path $pluginCfg) {
    Write-Host "[4/6] Updating plugin.cfg..."
    $cfgContent = @"
[plugin]

name="$Name"
description="$Description"
author="$Author"
version="1.0.0"
script="plugin.gd"
"@
    Set-Content -Path $pluginCfg -Value $cfgContent -Force
}

$targetFull = (Resolve-Path $TargetDir).Path.Replace('\', '/').Trim('/')
$rootFull = (Resolve-Path $Root).Path.Replace('\', '/').Trim('/')
if ($targetFull.StartsWith($rootFull)) {
    $sub = $targetFull.Substring($rootFull.Length).Trim('/')
    $depth = ($sub.Split('/')).Count
    $relToRoot = "../" * $depth
} else {
    $relToRoot = "../"
}

# 5. Update shard.yml and project.godot
Write-Host "[4/5] Updating project configuration files..."
$shardPath = Join-Path $TargetDir "shard.yml"
if (Test-Path $shardPath) {
    $shardContent = @"
name: $Name
version: 0.1.0
authors:
  - $Author

dependencies:
  libgodot:
    path: $relToRoot

targets:
  ${Name}:
    main: src/main.cr
"@
    Set-Content -Path $shardPath -Value $shardContent -Force
}

$projectGodot = Join-Path $TargetDir "project.godot"
if (Test-Path $projectGodot) {
    $pgContent = Get-Content -Path $projectGodot -Raw
    $pgContent = $pgContent -replace "crystal_addon", $Name
    $pgContent = $pgContent -replace "Crystal Addon Test Runner", "$Name Addon Test Runner"
    Set-Content -Path $projectGodot -Value $pgContent -Force
}

# 6. Update Makefile
$makefile = Join-Path $TargetDir "Makefile"
if (Test-Path $makefile) {
    Write-Host "[5/5] Updating Makefile..."
    $mfContent = Get-Content -Path $makefile -Raw
    $mfContent = $mfContent -replace "crystal_addon", $Name
    $mfContent = $mfContent -replace '\.\./godot', ($relToRoot + 'godot')
    $mfContent = $mfContent -replace '\.\./bin/', ($relToRoot + 'bin/')
    $mfContent = $mfContent -replace '\.\./scripts/', ($relToRoot + 'scripts/')
    $mfContent = $mfContent -replace '\.\./src', ($relToRoot.TrimEnd('/') + '/src')
    Set-Content -Path $makefile -Value $mfContent -Force
}

Write-Host "==========================================================" -ForegroundColor Green
Write-Host "  Addon '$Name' scaffolded successfully at:               " -ForegroundColor Green
Write-Host "  $TargetDir                                              " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green
Write-Host "Next steps:"
Write-Host "  cd '$TargetDir'"
Write-Host "  make all             # Compiles the addon"
Write-Host "  make editor          # Tests in Godot Editor"
Write-Host "  make package         # Creates distributable zip for vanilla Godot users"
