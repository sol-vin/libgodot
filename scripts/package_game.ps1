param(
    [string]$ProjectPath = ".",
    [string]$Name = "",
    [string]$Release = "",
    [string]$TargetDir = "",
    [switch]$ForceCompile
)

$ErrorActionPreference = "Stop"

$projFull = (Resolve-Path $ProjectPath).Path
if (-not $Name) {
    $Name = Split-Path -Leaf $projFull
}

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
$exeExt = if ($onWindows) { ".exe" } else { "" }
$soExt = if ($onWindows) { "dll" } elseif ($isMac) { "dylib" } else { "so" }

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
        if ($mainCand -match '\.exe$' -and (Test-Path $mainCand)) {
            $cleanCand = $mainCand
        }
        if ($onWindows -and $cleanCand -notmatch '\.exe$') {
            continue
        }
        if (Test-Path $cleanCand) {
            $item = Get-Item $cleanCand
            if ($item.Length -gt 0) {
                $godotExe = $item.FullName
                break
            }
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

# 4. Ensure addons/crystal_integration is synchronized
$addonSrc = Join-Path $rootDir "addons"
$addonDest = Join-Path $projFull "addons"
if (Test-Path $addonSrc) {
    $syncScript = Join-Path $rootDir "scripts/sync_addons.ps1"
    if (Test-Path $syncScript) {
        & $syncScript -Source $addonSrc -Destinations $addonDest
    }
}

# 5. Ensure .godot/extension_list.cfg includes all project gdextensions
$godotConfigDir = Join-Path $projFull ".godot"
if (-not (Test-Path $godotConfigDir)) {
    New-Item -ItemType Directory -Force -Path $godotConfigDir | Out-Null
}
$extListFile = Join-Path $godotConfigDir "extension_list.cfg"
$allExts = [System.Collections.Generic.List[string]]::new()
$projAddons = Join-Path $projFull "addons"
if (Test-Path $projAddons) {
    Get-ChildItem -Path $projAddons -Filter "*.gdextension" -Recurse | ForEach-Object {
        $relPath = $_.FullName.Substring($projFull.Length).TrimStart('\', '/').Replace('\', '/')
        $allExts.Add("res://$relPath")
    }
}
if ($allExts.Count -eq 0) {
    $allExts.Add("res://addons/crystal_integration/crystal.gdextension")
}
Set-Content -Path $extListFile -Value $allExts -Force

# 6. Ensure runtime DLLs and crystal_bridge are in bin/
$depsScript = Join-Path $rootDir "scripts/ensure_deps.ps1"
if (Test-Path $depsScript) {
    & $depsScript -TargetBin $binDir
}

$bridgeSrc = Join-Path $rootDir "bin/crystal_bridge.$soExt"
if (Test-Path $bridgeSrc) {
    Copy-Item $bridgeSrc (Join-Path $binDir "crystal_bridge.$soExt") -Force
}

# 7. Compile Crystal game library (game.dll / game.so) if missing or outdated
$mainCr = Join-Path $projFull "src/main.cr"
$gameLib = Join-Path $binDir "game.$soExt"
$needsCompile = $false
if ($ForceCompile) {
    $needsCompile = $true
} elseif (Test-Path $mainCr) {
    if (-not (Test-Path $gameLib)) {
        $needsCompile = $true
    } elseif ((Get-Item $mainCr).LastWriteTime -gt (Get-Item $gameLib).LastWriteTime) {
        $needsCompile = $true
    }
}
if ($needsCompile) {
    $buildScript = Join-Path $rootDir "scripts/build_crystal.ps1"
    $linkFlags = if ($onWindows) { "/DLL /ENTRY:_DllMainCRTStartup /EXPORT:crystal_godot_init" } elseif ($isMac) { "-dynamiclib" } else { "-shared" }
    $srcPath = Join-Path $rootDir "src"
    
    Write-Host "[PackageGame] Compiling game.$soExt..." -ForegroundColor Cyan
    if ($Release -eq "1") {
        & $buildScript -Entry $mainCr -Output $gameLib -LinkFlags $linkFlags -SourcePath $srcPath -Release
    } else {
        & $buildScript -Entry $mainCr -Output $gameLib -LinkFlags $linkFlags -SourcePath $srcPath
    }
}

# Ensure addons/crystal_integration/bin is populated with game and bridge
$addonBin = Join-Path $projFull "addons/crystal_integration/bin"
if (Test-Path $addonBin) {
    if (Test-Path $gameLib) {
        Copy-Item $gameLib (Join-Path $addonBin "game.$soExt") -Force -ErrorAction SilentlyContinue
    }
    $bridgeLocal = Join-Path $binDir "crystal_bridge.$soExt"
    if (Test-Path $bridgeLocal) {
        Copy-Item $bridgeLocal (Join-Path $addonBin "crystal_bridge.$soExt") -Force -ErrorAction SilentlyContinue
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

    # Ensure macOS preset in export_presets.cfg has application/bundle_identifier
    if ($isMac -and (Test-Path $presetCfg)) {
        $cfgContent = Get-Content $presetCfg -Raw
        if ($cfgContent -match 'platform="macOS"' -and $cfgContent -notmatch 'application/bundle_identifier=') {
            $cleanName = ($Name -replace '[^a-zA-Z0-9]', '').ToLower()
            $cfgContent = $cfgContent -replace '(\[preset\.\d+\.options\]\r?\n)', "`$1application/bundle_identifier=`"org.godotengine.$cleanName`"`n"
            Set-Content -Path $presetCfg -Value $cfgContent -Force
        }
    }

    # Attempt native Godot standalone export with embedded PCK
    if ($godotExe -and (Test-Path $godotExe) -and (Test-Path $presetCfg)) {
        $preset = if ($onWindows) { "Windows Desktop" } elseif ($isMac) { "macOS" } else { "Linux" }
        $destFile = if ($isMac) {
            [System.IO.Path]::GetFullPath((Join-Path $gameDir "$Name.zip"))
        } else {
            [System.IO.Path]::GetFullPath((Join-Path $gameDir "game$exeExt"))
        }
        $destDir = Split-Path -Parent $destFile
        if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Force -Path $destDir | Out-Null }
        if (Test-Path $destFile) { Remove-Item $destFile -Force }

        Write-Host "  -> Running Godot standalone export (Preset: $preset) -> $destFile..." -ForegroundColor Cyan
        if ($onWindows) {
            $exportProc = Start-Process -FilePath $godotExe -ArgumentList @("--headless", "--path", "`"$projFull`"", "--export-release", "`"$preset`"", "`"$destFile`"") -NoNewWindow -Wait -PassThru
            $exportExitCode = $exportProc.ExitCode
        } else {
            $exportArgs = @("--headless", "--path", $projFull, "--export-release", $preset, $destFile)
            & $godotExe $exportArgs
            $exportExitCode = $LASTEXITCODE
        }
        if ($exportExitCode -ne 0) {
            Write-Warning "  [PackageGame] Godot export exited with code $exportExitCode"
        }

        if ($isMac -and (Test-Path $destFile) -and ((Get-Item $destFile).Length -gt 100000)) {
            $exportedSuccessfully = $true
            # Unpack .app bundle
            Expand-Archive -Path $destFile -DestinationPath $gameDir -Force
            $appDir = (Get-ChildItem -Path $gameDir -Filter "*.app" -Directory | Select-Object -First 1).FullName
            if ($appDir) {
                $frameworksDir = Join-Path $appDir "Contents/Frameworks"
                $macosDir = Join-Path $appDir "Contents/MacOS"
                if (-not (Test-Path $frameworksDir)) { New-Item -ItemType Directory -Force -Path $frameworksDir | Out-Null }
                foreach ($libName in @("crystal_bridge.dylib", "game.dylib", "libgodot.dylib")) {
                    $srcLib = Join-Path $binDir $libName
                    if (Test-Path $srcLib) {
                        Copy-Item $srcLib (Join-Path $frameworksDir $libName) -Force
                        Copy-Item $srcLib (Join-Path $macosDir $libName) -Force
                        Copy-Item $srcLib (Join-Path $gameDir $libName) -Force
                    }
                }
            }
            Write-Host "  [OK] Standalone Godot macOS export complete in '$gameDir'." -ForegroundColor Green
        } elseif ((Test-Path $destFile) -and ((Get-Item $destFile).Length -gt 1000000)) {
            $destExe = $destFile
            $exportedSuccessfully = $true
            if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
                & chmod +x $destExe
            }

            # Copy game library and runtime dependencies directly next to game executable and into addons/crystal_integration/bin
            $gameAddonBin = Join-Path $gameDir "addons/crystal_integration/bin"
            if (-not (Test-Path $gameAddonBin)) { New-Item -ItemType Directory -Force -Path $gameAddonBin | Out-Null }

            if (Test-Path (Join-Path $binDir "game.$soExt")) {
                Copy-Item (Join-Path $binDir "game.$soExt") $gameDir -Force
                Copy-Item (Join-Path $binDir "game.$soExt") $gameAddonBin -Force
            }
            if (Test-Path (Join-Path $binDir "crystal_bridge.$soExt")) {
                Copy-Item (Join-Path $binDir "crystal_bridge.$soExt") $gameDir -Force
                Copy-Item (Join-Path $binDir "crystal_bridge.$soExt") $gameAddonBin -Force
            }
            if ($onWindows) {
                foreach ($dll in @("gc.dll", "iconv-2.dll", "pcre2-8.dll", "libgodot.dll")) {
                    $srcDll = Join-Path $binDir $dll
                    if (-not (Test-Path $srcDll)) { $srcDll = Join-Path $rootDir "bin/$dll" }
                    if (Test-Path $srcDll) {
                        Copy-Item $srcDll $gameDir -Force
                        Copy-Item $srcDll $gameAddonBin -Force
                    }
                }
            } else {
                if (Test-Path (Join-Path $binDir "libgodot.so")) {
                    Copy-Item (Join-Path $binDir "libgodot.so") $gameDir -Force
                    Copy-Item (Join-Path $binDir "libgodot.so") $gameAddonBin -Force
                }
            }

            # Remove any temporary shadow-copy dlls, but preserve addons directory
            Get-ChildItem -Path $gameDir -Directory | Where-Object { $_.Name -ne "addons" } | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
            Get-ChildItem -Path $gameDir -File | Where-Object {
                $isExe = ($_.Name -eq "game$exeExt")
                $isLib = ($_.Name -like "*.dll") -or ($_.Name -like "*.so*")
                $isShadow = ($_.Name -like "*_loaded_*")
                (-not $isExe -and -not $isLib) -or $isShadow
            } | Remove-Item -Force -ErrorAction SilentlyContinue

            Write-Host "  [OK] Standalone Godot export complete in '$gameDir'." -ForegroundColor Green
        } else {
            throw "[PackageGame] Godot export-release did not produce expected standalone binary for '$Name'. Ensure export templates are installed."
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
