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

# 3. Ensure bin directory exists and contains .gdignore so Godot never indexes output binaries
$binDir = Join-Path $projFull "bin"
if (-not (Test-Path $binDir)) {
    New-Item -ItemType Directory -Force -Path $binDir | Out-Null
}
$gdignoreFile = Join-Path $binDir ".gdignore"
if (-not (Test-Path $gdignoreFile)) {
    New-Item -ItemType File -Force -Path $gdignoreFile | Out-Null
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

# Mirror project addon binaries to bin/addons for standalone execution
$projAddons = Join-Path $projFull "addons"
if (Test-Path $projAddons) {
    $binAddons = Join-Path $binDir "addons"
    if (-not (Test-Path $binAddons)) {
        New-Item -ItemType Directory -Force -Path $binAddons | Out-Null
    }
    $addonGdignore = Join-Path $binAddons ".gdignore"
    if (-not (Test-Path $addonGdignore)) {
        New-Item -ItemType File -Force -Path $addonGdignore | Out-Null
    }
    $libFilter = if ($onWindows) { "*.dll" } elseif ($isMac) { "*.dylib" } else { "*.so*" }
    foreach ($addonDir in Get-ChildItem -Path $projAddons -Directory) {
        $addonBinSrc = Join-Path $addonDir.FullName "bin"
        if (Test-Path $addonBinSrc) {
            $addonBinDest = Join-Path $binAddons (Join-Path $addonDir.Name "bin")
            if (-not (Test-Path $addonBinDest)) {
                New-Item -ItemType Directory -Force -Path $addonBinDest | Out-Null
            }
            Get-ChildItem -Path $addonBinSrc -Filter $libFilter -File -ErrorAction SilentlyContinue | ForEach-Object {
                Copy-Item $_.FullName (Join-Path $addonBinDest $_.Name) -Force -ErrorAction SilentlyContinue
            }
        }
    }
}

# Clean stray foreign files, source files, and build residue from bin/
$strayPatterns = if ($onWindows) {
    @("*.so*", "*.dylib", "*.cr", "*.cr.uid", "*.pdb", "*.exp", "*.lib", "test_report.*", "crash_dump.txt")
} elseif ($isMac) {
    @("*.dll", "*.so*", "*.cr", "*.cr.uid", "test_report.*", "crash_dump.txt")
} else {
    @("*.dll", "*.dylib", "*.cr", "*.cr.uid", "test_report.*", "crash_dump.txt")
}
foreach ($sp in $strayPatterns) {
    Get-ChildItem -Path $binDir -Filter $sp -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne "libgodot.lib" } | Remove-Item -Force -ErrorAction SilentlyContinue
}
Get-ChildItem -Path $binDir -Filter "*.gdextension*" -Recurse -File -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
$binAndroid = Join-Path $binDir "android"
if (Test-Path $binAndroid) {
    Remove-Item $binAndroid -Recurse -Force -ErrorAction SilentlyContinue
}

# 8. Create playable Godot game executable and standalone data pack
if ($godotExe -and (Test-Path $godotExe)) {
    # Ensure export_presets.cfg exists in project
    $presetCfg = Join-Path $projFull "export_presets.cfg"
    if (-not (Test-Path $presetCfg)) {
        $templatePresets = Join-Path $rootDir "template/export_presets.cfg"
        if (Test-Path $templatePresets) {
            Copy-Item $templatePresets $presetCfg -Force
        }
    }

    $preset = if ($onWindows) { "Windows Desktop" } elseif ($isMac) { "macOS" } else { "Linux" }

    # Parse export_path from preset in export_presets.cfg to follow the configured export preset
    if (Test-Path $presetCfg) {
        $cfgLines = Get-Content $presetCfg
        $inTargetPreset = $false
        foreach ($line in $cfgLines) {
            if ($line -match '^\s*name\s*=\s*"([^"]+)"') {
                $inTargetPreset = ($matches[1] -eq $preset)
            } elseif ($inTargetPreset -and $line -match '^\s*export_path\s*=\s*"([^"]+)"') {
                $presetPath = $matches[1]
                $presetLeaf = Split-Path -Leaf $presetPath
                $presetBaseName = [System.IO.Path]::GetFileNameWithoutExtension($presetLeaf)
                if ($presetBaseName.EndsWith(".tar")) {
                    $presetBaseName = [System.IO.Path]::GetFileNameWithoutExtension($presetBaseName)
                }
                if ($presetBaseName) {
                    $Name = $presetBaseName
                }
                break
            }
        }
    }

    # Place runner inside bin/ following the preset name (e.g. bin/tests.exe or bin/basic_demo.exe)
    $binNamedExe = Join-Path $binDir "$Name$exeExt"
    Copy-Item $godotExe $binNamedExe -Force
    if (-not $onWindows -and (Get-Command chmod -ErrorAction SilentlyContinue)) {
        & chmod +x $binNamedExe
    }

    # Clean up any leftover temporary shadow files before Godot export
    if ($onWindows) {
        cmd.exe /c "del /s /q /f /a:h `"$projFull\~*`" 2>nul & del /s /q /f `"$projFull\~*`" 2>nul" | Out-Null
    } else {
        Get-ChildItem -Path $projFull -Filter "~*" -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    }

    # Generate standalone project data pack ($Name.pck)
    $pckFile = Join-Path $binDir "$Name.pck"
    if (Test-Path $presetCfg) {
        Write-Host "  -> Generating standalone project pack: $pckFile..." -ForegroundColor Cyan
        & $godotExe @("--headless", "--path", $projFull, "--export-pack", $preset, $pckFile)
        $packExit = $LASTEXITCODE

        if ($packExit -eq 0 -and (Test-Path $pckFile)) {
            if ($onWindows) {
                Copy-Item $pckFile (Join-Path $binDir "$Name.console.pck") -Force -ErrorAction SilentlyContinue
            }
            Write-Host "  -> Standalone pack generated successfully ($([math]::Round((Get-Item $pckFile).Length / 1KB, 1)) KB)" -ForegroundColor Green
        } else {
            Write-Warning "  -> Failed to generate standalone pack via --export-pack"
        }

        # Attempt native export only if export templates exist
        $appDataGodot = if ($env:APPDATA) { Join-Path $env:APPDATA "Godot/export_templates" } else { "" }
        $hasTemplates = $false
        if ($appDataGodot -and (Test-Path $appDataGodot)) {
            $hasTemplates = (Get-ChildItem -Path $appDataGodot -Recurse -Filter "*$exeExt" -File -ErrorAction SilentlyContinue).Count -gt 0
        }
        if ($hasTemplates) {
            $exportMode = if ($Release -eq "1" -or $Release -eq "true") { "--export-release" } else { "--export-debug" }
            Write-Host "  -> Running standalone export ($exportMode $preset)..." -ForegroundColor Cyan
            & $godotExe @("--headless", "--path", $projFull, $exportMode, $preset, $binNamedExe)
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  -> Standalone executable exported with embedded PCK!" -ForegroundColor Green
            }
        }
    }

    Write-Host "  -> Created playable executable: $binNamedExe" -ForegroundColor Green

    # If the preset does not name the output "game", remove any stale game.* binaries
    if ($Name -ne "game") {
        foreach ($staleFile in @("game.exe", "game.console.exe", "game.pck", "game.console.pck", "game")) {
            $stalePath = Join-Path $binDir $staleFile
            if (Test-Path $stalePath) {
                Remove-Item $stalePath -Force -ErrorAction SilentlyContinue
            }
        }
    }

    # Ensure project root does not contain stray game executables
    $rootGameExe = Join-Path $projFull "$Name$exeExt"
    if (Test-Path $rootGameExe) {
        Remove-Item $rootGameExe -Force -ErrorAction SilentlyContinue
    }
    $rootDefaultExe = Join-Path $projFull "game$exeExt"
    if (Test-Path $rootDefaultExe) {
        Remove-Item $rootDefaultExe -Force -ErrorAction SilentlyContinue
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

    # Attempt native Godot standalone export with embedded PCK only if templates exist
    if ($godotExe -and (Test-Path $godotExe) -and (Test-Path $presetCfg) -and $hasTemplates) {
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
        & $godotExe @("--headless", "--path", $projFull, "--export-release", $preset, $destFile)
        $exportExitCode = $LASTEXITCODE
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
            Write-Warning "[PackageGame] Godot export-release did not produce expected standalone binary for '$Name'. Falling back to self-contained project bundle."
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
