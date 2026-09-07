param(
    [string]$ProjectPath = ".",
    [string]$Name = "",
    [string]$Release = "",
    [string]$TargetDir = ""
)

$ErrorActionPreference = "Stop"

$projFull = (Resolve-Path $ProjectPath).Path
if (-not $Name) {
    $Name = Split-Path -Leaf $projFull
}

$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
$exeExt = if ($onWindows) { ".exe" } else { "" }
$soExt = if ($onWindows) { "dll" } else { "so" }

Write-Host "[PackageGame] Packaging playable Godot game for '$Name' in '$projFull'..." -ForegroundColor Cyan

# 1. Locate root libgodot directory
$curr = $projFull
$rootDir = ""
while ($curr) {
    if ((Test-Path (Join-Path $curr "shard.yml")) -and (Test-Path (Join-Path $curr "src/libgodot.cr"))) {
        $rootDir = $curr
        break
    }
    $parent = Split-Path -Parent $curr
    if ($parent -eq $curr) { break }
    $curr = $parent
}
if (-not $rootDir) {
    $rootDir = Split-Path -Parent $PSScriptRoot
}

# 2. Locate Godot engine runner
$godotCandidates = @(
    (Join-Path $projFull "godot$exeExt"),
    (Join-Path $rootDir "godot$exeExt"),
    (Join-Path $rootDir "godot.exe"),
    (Join-Path $rootDir "godot"),
    $env:GODOT4,
    $env:GODOT4_BIN
)
$godotExe = ""
foreach ($cand in $godotCandidates) {
    if ($cand) {
        $cleanCand = $cand -replace '^/([a-zA-Z])/', '$1:/'
        if (Test-Path $cleanCand) {
            $godotExe = (Resolve-Path $cleanCand).Path
            break
        }
    }
}
if (-not $godotExe -and (Get-Command godot -ErrorAction SilentlyContinue)) {
    $godotExe = (Get-Command godot).Source
}

if (-not $godotExe) {
    Write-Warning "[PackageGame] Godot runner executable not found. Executable wrapper will not be created."
}

# 3. Ensure bin directory exists
$binDir = Join-Path $projFull "bin"
if (-not (Test-Path $binDir)) {
    New-Item -ItemType Directory -Force -Path $binDir | Out-Null
}

# 4. Ensure .godot/extension_list.cfg exists
$godotConfigDir = Join-Path $projFull ".godot"
if (-not (Test-Path $godotConfigDir)) {
    New-Item -ItemType Directory -Force -Path $godotConfigDir | Out-Null
}
$extListFile = Join-Path $godotConfigDir "extension_list.cfg"
Set-Content -Path $extListFile -Value "res://addons/crystal_integration/crystal.gdextension" -Force

# 5. Ensure addons/crystal_integration is synchronized
$addonSrc = Join-Path $rootDir "addons"
$addonDest = Join-Path $projFull "addons"
if (Test-Path $addonSrc) {
    $syncScript = Join-Path $rootDir "scripts/sync_addons.ps1"
    if (Test-Path $syncScript) {
        & $syncScript -Source $addonSrc -Destinations $addonDest
    }
}

# 6. Ensure runtime DLLs and crystal_bridge are in bin/
$depsScript = Join-Path $rootDir "scripts/ensure_deps.ps1"
if (Test-Path $depsScript) {
    & $depsScript -TargetBin $binDir
}

$bridgeSrc = Join-Path $rootDir "bin/crystal_bridge.$soExt"
if (Test-Path $bridgeSrc) {
    Copy-Item $bridgeSrc (Join-Path $binDir "crystal_bridge.$soExt") -Force
}

# 7. Compile Crystal game library (game.dll / game.so)
$mainCr = Join-Path $projFull "src/main.cr"
if (Test-Path $mainCr) {
    $buildScript = Join-Path $rootDir "scripts/build_crystal.ps1"
    $gameLib = Join-Path $binDir "game.$soExt"
    $linkFlags = if ($onWindows) { "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init" } else { "-shared" }
    $srcPath = Join-Path $rootDir "src"
    
    Write-Host "[PackageGame] Compiling game.$soExt..." -ForegroundColor Cyan
    if ($Release -eq "1") {
        & $buildScript -Entry $mainCr -Output $gameLib -LinkFlags $linkFlags -SourcePath $srcPath -Release
    } else {
        & $buildScript -Entry $mainCr -Output $gameLib -LinkFlags $linkFlags -SourcePath $srcPath
    }
}

# 8. Create playable Godot game executable
if ($godotExe -and (Test-Path $godotExe)) {
    # Place runner at project root as <Name>.exe (e.g. basic_demo.exe)
    $rootGameExe = Join-Path $projFull "$Name$exeExt"
    Copy-Item $godotExe $rootGameExe -Force
    if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
        & chmod +x $rootGameExe
    }
    Write-Host "  -> Created playable executable: $rootGameExe" -ForegroundColor Green

    # Also place runner in bin/game.exe for toolchain consistency
    $binGameExe = Join-Path $binDir "game$exeExt"
    Copy-Item $godotExe $binGameExe -Force
    if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
        & chmod +x $binGameExe
    }

    # Also make sure bin/ has copies of project.godot & main.tscn if run from bin
    if (Test-Path (Join-Path $projFull "project.godot")) {
        Copy-Item (Join-Path $projFull "project.godot") $binDir -Force
    }
    if (Test-Path (Join-Path $projFull "main.tscn")) {
        Copy-Item (Join-Path $projFull "main.tscn") $binDir -Force
    }
}

# 9. If TargetDir specified (for export/packaging), assemble complete self-contained package
if ($TargetDir) {
    if (-not (Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null
    }
    Write-Host "[PackageGame] Assembling self-contained package in '$TargetDir'..." -ForegroundColor Cyan

    # Copy executable
    if ($godotExe -and (Test-Path $godotExe)) {
        $targetExe = Join-Path $TargetDir "$Name$exeExt"
        Copy-Item $godotExe $targetExe -Force
        if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
            & chmod +x $targetExe
        }
    }

    # Copy project files & scenes
    foreach ($item in @("project.godot", "main.tscn", "scenes", "scripts")) {
        $srcItem = Join-Path $projFull $item
        if (Test-Path $srcItem) {
            Copy-Item $srcItem $TargetDir -Recurse -Force
        }
    }

    # Copy .godot/extension_list.cfg
    $targetGodot = Join-Path $TargetDir ".godot"
    if (-not (Test-Path $targetGodot)) { New-Item -ItemType Directory -Force -Path $targetGodot | Out-Null }
    Copy-Item $extListFile (Join-Path $targetGodot "extension_list.cfg") -Force

    # Copy addons/
    $targetAddons = Join-Path $TargetDir "addons"
    if (-not (Test-Path $targetAddons)) { New-Item -ItemType Directory -Force -Path $targetAddons | Out-Null }
    Copy-Item (Join-Path $projFull "addons/*") $targetAddons -Recurse -Force

    # Copy bin/ with all libraries
    $targetBin = Join-Path $TargetDir "bin"
    if (-not (Test-Path $targetBin)) { New-Item -ItemType Directory -Force -Path $targetBin | Out-Null }
    Copy-Item (Join-Path $binDir "/*") $targetBin -Recurse -Force

    # Also place runtime DLLs / SOs at root next to executable for seamless loading
    foreach ($dll in Get-ChildItem -Path $binDir -File) {
        Copy-Item $dll.FullName $TargetDir -Force
    }

    Write-Host "[PackageGame] Successfully assembled self-contained playable package in '$TargetDir'!" -ForegroundColor Green
}

Write-Host "[PackageGame] Playable game setup complete for '$Name'." -ForegroundColor Green
