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

    # Ensure bin/ does not contain stray project.godot which causes Godot warning
    if (Test-Path (Join-Path $binDir "project.godot")) {
        Remove-Item (Join-Path $binDir "project.godot") -Force -ErrorAction SilentlyContinue
    }
    if (Test-Path (Join-Path $binDir "main.tscn")) {
        Remove-Item (Join-Path $binDir "main.tscn") -Force -ErrorAction SilentlyContinue
    }
}

# 9. If TargetDir specified, assemble/export standalone playable package
if ($TargetDir) {
    $gameDir = if ((Split-Path -Leaf $TargetDir) -eq $Name) { $TargetDir } else { Join-Path $TargetDir $Name }
    if (-not (Test-Path $gameDir)) {
        New-Item -ItemType Directory -Force -Path $gameDir | Out-Null
    }
    Write-Host "[PackageGame] Packaging standalone game into '$gameDir'..." -ForegroundColor Cyan

    $exportedSuccessfully = $false
    $presetCfg = Join-Path $projFull "export_presets.cfg"
    if (-not (Test-Path $presetCfg)) {
        $templatePresets = Join-Path $rootDir "template/export_presets.cfg"
        if (Test-Path $templatePresets) {
            Copy-Item $templatePresets $presetCfg -Force
        }
    }

    # Attempt native Godot standalone export with embedded PCK
    if ($godotExe -and (Test-Path $godotExe) -and (Test-Path $presetCfg)) {
        $preset = if ($onWindows) { "Windows Desktop" } else { "Linux" }
        $destExe = [System.IO.Path]::GetFullPath((Join-Path $gameDir "game$exeExt"))
        $destDir = Split-Path -Parent $destExe
        if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Force -Path $destDir | Out-Null }
        if (Test-Path $destExe) { Remove-Item $destExe -Force }

        Write-Host "  -> Running Godot standalone export (Preset: $preset) -> $destExe..." -ForegroundColor Cyan
        $exportProc = Start-Process -FilePath $godotExe -ArgumentList @("--headless", "--path", "`"$projFull`"", "--export-release", "`"$preset`"", "`"$destExe`"") -NoNewWindow -Wait -PassThru

        if ((Test-Path $destExe) -and ((Get-Item $destExe).Length -gt 1000000)) {
            $exportedSuccessfully = $true
            if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
                & chmod +x $destExe
            }

            # Copy game library and runtime dependencies directly next to game executable
            if (Test-Path (Join-Path $binDir "game.$soExt")) {
                Copy-Item (Join-Path $binDir "game.$soExt") $gameDir -Force
            }
            if (Test-Path (Join-Path $binDir "crystal_bridge.$soExt")) {
                Copy-Item (Join-Path $binDir "crystal_bridge.$soExt") $gameDir -Force
            }
            if ($onWindows) {
                foreach ($dll in @("gc.dll", "iconv-2.dll", "pcre2-8.dll", "libgodot.dll")) {
                    $srcDll = Join-Path $binDir $dll
                    if (-not (Test-Path $srcDll)) { $srcDll = Join-Path $rootDir "bin/$dll" }
                    if (Test-Path $srcDll) { Copy-Item $srcDll $gameDir -Force }
                }
            } else {
                if (Test-Path (Join-Path $binDir "libgodot.so")) {
                    Copy-Item (Join-Path $binDir "libgodot.so") $gameDir -Force
                }
            }

            # Remove any temporary shadow-copy dlls, subdirectories, and non-library files
            Get-ChildItem -Path $gameDir -Directory | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
            Get-ChildItem -Path $gameDir -File | Where-Object {
                $isExe = ($_.Name -eq "game$exeExt")
                $isLib = ($_.Name -like "*.dll") -or ($_.Name -like "*.so*")
                $isShadow = ($_.Name -like "*_loaded_*")
                (-not $isExe -and -not $isLib) -or $isShadow
            } | Remove-Item -Force -ErrorAction SilentlyContinue

            Write-Host "  [OK] Standalone Godot export complete in '$gameDir'." -ForegroundColor Green
        } else {
            Write-Warning "[PackageGame] Godot export-release did not produce expected standalone binary. Falling back to project runner bundle."
        }
    }

    # Fallback to self-contained project bundle if export templates not present
    if (-not $exportedSuccessfully) {
        if ($godotExe -and (Test-Path $godotExe)) {
            $targetExe = Join-Path $gameDir "game$exeExt"
            Copy-Item $godotExe $targetExe -Force
            if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
                & chmod +x $targetExe
            }
        }
        foreach ($item in @("project.godot", "main.tscn", "scenes", "scripts")) {
            $srcItem = Join-Path $projFull $item
            if (Test-Path $srcItem) { Copy-Item $srcItem $gameDir -Recurse -Force }
        }
        $targetGodot = Join-Path $gameDir ".godot"
        if (-not (Test-Path $targetGodot)) { New-Item -ItemType Directory -Force -Path $targetGodot | Out-Null }
        Copy-Item $extListFile (Join-Path $targetGodot "extension_list.cfg") -Force
        $targetAddons = Join-Path $gameDir "addons"
        if (-not (Test-Path $targetAddons)) { New-Item -ItemType Directory -Force -Path $targetAddons | Out-Null }
        Copy-Item (Join-Path $projFull "addons/*") $targetAddons -Recurse -Force
        $targetBin = Join-Path $gameDir "bin"
        if (-not (Test-Path $targetBin)) { New-Item -ItemType Directory -Force -Path $targetBin | Out-Null }
        Copy-Item (Join-Path $binDir "/*") $targetBin -Recurse -Force
        foreach ($dll in Get-ChildItem -Path $binDir -File) {
            Copy-Item $dll.FullName $gameDir -Force
        }
    }

    Write-Host "[PackageGame] Successfully packaged '$Name' in '$gameDir'!" -ForegroundColor Green
}

Write-Host "[PackageGame] Playable game setup complete for '$Name'." -ForegroundColor Green
