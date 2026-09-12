$RootDir = Split-Path -Parent $PSScriptRoot
$binDir = Join-Path $RootDir "bin"
$addonBinDir = Join-Path $RootDir "addons/crystal_integration/bin"
$testBinDir = Join-Path $RootDir "test/bin"
$testAddonBinDir = Join-Path $RootDir "test/addons/crystal_integration/bin"
$templateBinDir = Join-Path $RootDir "template/bin"
$templateIntBinDir = Join-Path $RootDir "template/addons/crystal_integration/bin"
$templateAddonBinDir = Join-Path $RootDir "template-addon/addons/crystal_addon/bin"
$templateAddonIntBinDir = Join-Path $RootDir "template-addon/addons/crystal_integration/bin"
$perfBinDir = Join-Path $RootDir "performance/bin"
$perfAddonBinDir = Join-Path $RootDir "performance/addons/crystal_integration/bin"
$examplesDir = Join-Path $RootDir "examples"

$targetDirs = [System.Collections.Generic.List[string]]::new()
$targetDirs.Add($addonBinDir)
$targetDirs.Add($testBinDir)
$targetDirs.Add($testAddonBinDir)
$targetDirs.Add($templateBinDir)
$targetDirs.Add($templateIntBinDir)
$targetDirs.Add($templateAddonBinDir)
$targetDirs.Add($templateAddonIntBinDir)
$targetDirs.Add($perfBinDir)
$targetDirs.Add($perfAddonBinDir)

$testAddons = Join-Path $RootDir "test/addons"
if (Test-Path $testAddons) {
    foreach ($addon in Get-ChildItem -Path $testAddons -Directory) {
        $targetDirs.Add((Join-Path $addon.FullName "bin"))
    }
}

if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $targetDirs.Add((Join-Path $ex.FullName "bin"))
        $targetDirs.Add((Join-Path $ex.FullName "addons/crystal_integration/bin"))
        # Also sync to any other addon bin folders in examples
        $exAddons = Join-Path $ex.FullName "addons"
        if (Test-Path $exAddons) {
            foreach ($addon in Get-ChildItem -Path $exAddons -Directory) {
                $targetDirs.Add((Join-Path $addon.FullName "bin"))
            }
        }
    }
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

$platformBinFiles = if ($onWindows) {
    @('crystal_bridge.dll', 'gc.dll', 'iconv-2.dll', 'pcre2-8.dll', 'libgodot.dll', 'libgodot.lib')
} elseif ($isMac) {
    @('crystal_bridge.dylib', 'libgodot.dylib')
} else {
    @('crystal_bridge.so', 'libgodot.so')
}

$platformPluginFile = if ($onWindows) { "plugin.dll" } elseif ($isMac) { "plugin.dylib" } else { "plugin.so" }
$platformGameFiles = if ($onWindows) { @("game.dll", "game.exe") } elseif ($isMac) { @("game.dylib", "game") } else { @("game.so", "game") }

$foreignPatterns = if ($onWindows) {
    @('*.so*', '*.dylib', '*.cr', '*.cr.uid')
} elseif ($isMac) {
    @('*.dll', '*.so*', 'gc.dll', 'iconv-2.dll', 'pcre2-8.dll', '*.cr', '*.cr.uid')
} else {
    @('*.dll', '*.dylib', 'gc.dll', 'iconv-2.dll', 'pcre2-8.dll', '*.cr', '*.cr.uid')
}

function Safe-Copy([string]$Src, [string]$Dst) {
    if (Test-Path $Src) {
        try {
            Copy-Item $Src $Dst -Force -ErrorAction Stop
        } catch {
            # File locked by running process; safely continue
        }
    }
}

foreach ($dir in $targetDirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    # Sync only platform-relevant binaries
    foreach ($binFile in $platformBinFiles) {
        $src = Join-Path $binDir $binFile
        $dst = Join-Path $dir $binFile
        Safe-Copy $src $dst
    }
    # Purge foreign OS binaries and stray files from destination
    foreach ($pattern in $foreignPatterns) {
        Get-ChildItem -Path $dir -Filter $pattern -File -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    }
    # Purge stale temporary shadow copies from prior aborted Godot runs
    if ($onWindows) {
        cmd.exe /c "del /s /q /f /a:h `"$dir\~*`" 2>nul & del /s /q /f `"$dir\~*`" 2>nul" | Out-Null
    } else {
        Get-ChildItem -Path $dir -Filter "~*" -Force -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    }
    # Remove android folder from desktop bin directories if present
    $desktopAndroid = Join-Path $dir "android"
    if (Test-Path $desktopAndroid) {
        Remove-Item $desktopAndroid -Recurse -Force -ErrorAction SilentlyContinue
    }
}

# Sync plugin library strictly to crystal_integration addons
$pluginDirs = [System.Collections.Generic.List[string]]::new()
$pluginDirs.Add($addonBinDir)
$pluginDirs.Add($testAddonBinDir)
$pluginDirs.Add($templateIntBinDir)
$pluginDirs.Add($templateAddonIntBinDir)
if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $exInt = Join-Path $ex.FullName "addons/crystal_integration/bin"
        if (Test-Path (Join-Path $ex.FullName "addons/crystal_integration")) {
            $pluginDirs.Add($exInt)
        }
    }
}

foreach ($piDir in $pluginDirs) {
    if (-not (Test-Path $piDir)) {
        New-Item -ItemType Directory -Force -Path $piDir | Out-Null
    }
    $srcP = Join-Path $binDir $platformPluginFile
    Safe-Copy $srcP (Join-Path $piDir $platformPluginFile)
    # Remove foreign plugin extensions
    foreach ($pattern in $foreignPatterns) {
        Get-ChildItem -Path $piDir -Filter $pattern -File -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    }
}

# Clean up any stray plugin binaries in non-crystal_integration addons and game bin directories
foreach ($addonParent in @("test/addons", "template-addon/addons")) {
    $parentPath = Join-Path $RootDir $addonParent
    if (Test-Path $parentPath) {
        Get-ChildItem -Path $parentPath -Directory | Where-Object { $_.Name -ne "crystal_integration" } | ForEach-Object {
            foreach ($pLib in @('plugin.dll', 'plugin.so', 'plugin.dylib')) {
                $strayPlugin = Join-Path $_.FullName "bin/$pLib"
                if (Test-Path $strayPlugin) {
                    Remove-Item $strayPlugin -Force -ErrorAction SilentlyContinue
                }
            }
        }
    }
}

foreach ($gameBin in @($testBinDir, $templateBinDir)) {
    foreach ($pLib in @('plugin.dll', 'plugin.so', 'plugin.dylib')) {
        $strayPlugin = Join-Path $gameBin $pLib
        if (Test-Path $strayPlugin) {
            Remove-Item $strayPlugin -Force -ErrorAction SilentlyContinue
        }
    }
    # Clean stale shadow copies and build residue
    Get-ChildItem -Path $gameBin -Filter "*_loaded_*" -File -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
    foreach ($resPattern in @('*.exp', '*.pdb', '*.lib', 'test_report.*', 'crash_dump.txt')) {
        Get-ChildItem -Path $gameBin -Filter $resPattern -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne "libgodot.lib" } | Remove-Item -Force -ErrorAction SilentlyContinue
    }
}

if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $exBin = Join-Path $ex.FullName "bin"
        if (Test-Path $exBin) {
            foreach ($pLib in @('plugin.dll', 'plugin.so', 'plugin.dylib')) {
                $strayPlugin = Join-Path $exBin $pLib
                if (Test-Path $strayPlugin) {
                    Remove-Item $strayPlugin -Force -ErrorAction SilentlyContinue
                }
            }
            Get-ChildItem -Path $exBin -Filter "*_loaded_*" -File -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
            foreach ($resPattern in @('*.exp', '*.pdb', '*.lib', 'test_report.*', 'crash_dump.txt')) {
                Get-ChildItem -Path $exBin -Filter $resPattern -File -ErrorAction SilentlyContinue | Where-Object { $_.Name -ne "libgodot.lib" } | Remove-Item -Force -ErrorAction SilentlyContinue
            }
        }
    }
}

# Sync test game library (game.dll / game.so / game.dylib)
$testGameLib = if ($onWindows) { "game.dll" } elseif ($isMac) { "game.dylib" } else { "game.so" }
$testTarget = Join-Path $testBinDir $testGameLib
$testAddonTarget = Join-Path $testAddonBinDir $testGameLib
if (Test-Path $testTarget) {
    Safe-Copy $testTarget (Join-Path $binDir $testGameLib)
    Safe-Copy $testTarget $testAddonTarget
} elseif (Test-Path $testAddonTarget) {
    Safe-Copy $testAddonTarget $testTarget
    Safe-Copy $testAddonTarget (Join-Path $binDir $testGameLib)
}

# The test project executable follows export_presets.cfg (tests.exe / tests), NOT game.exe.
# Clean any stray game.exe / game.pck from test/bin.
foreach ($strayGame in @("game.exe", "game.console.exe", "game.pck", "game.console.pck", "game")) {
    $strayPath = Join-Path $testBinDir $strayGame
    if (Test-Path $strayPath) {
        Remove-Item $strayPath -Force -ErrorAction SilentlyContinue
    }
}

# Sync template game binaries
foreach ($targetName in $platformGameFiles) {
    $tplTarget = Join-Path $templateBinDir $targetName
    $tplAddonTarget = Join-Path $templateIntBinDir $targetName
    if (Test-Path $tplTarget) {
        Safe-Copy $tplTarget $tplAddonTarget
    } elseif (Test-Path $tplAddonTarget) {
        Safe-Copy $tplAddonTarget $tplTarget
    }
}

# Sync example game binaries to their addon bin folders
if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $exBin = Join-Path $ex.FullName "bin"
        $exAddonBin = Join-Path $ex.FullName "addons/crystal_integration/bin"
        foreach ($targetName in $platformGameFiles) {
            $srcGame = Join-Path $exBin $targetName
            $dstGame = Join-Path $exAddonBin $targetName
            if (Test-Path $srcGame) {
                Safe-Copy $srcGame $dstGame
            } elseif (Test-Path $dstGame) {
                Safe-Copy $dstGame $srcGame
            }
        }
    }
}

# Ensure extension_list.cfg in all consumer projects
$projects = [System.Collections.Generic.List[string]]::new()
$projects.Add((Join-Path $RootDir "test"))
$projects.Add((Join-Path $RootDir "template"))
$projects.Add((Join-Path $RootDir "template-addon"))
$projects.Add((Join-Path $RootDir "performance"))
if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $projects.Add($ex.FullName)
    }
}

foreach ($p in $projects) {
    $cfgDir = Join-Path $p ".godot"
    if (-not (Test-Path $cfgDir)) {
        New-Item -ItemType Directory -Force -Path $cfgDir | Out-Null
    }
    $extLines = [System.Collections.Generic.List[string]]::new()
    $pAddons = Join-Path $p "addons"
    if (Test-Path $pAddons) {
        $items = Get-ChildItem -Path $pAddons -Filter "*.gdextension" -Recurse | Sort-Object {
            if ($_.FullName -like "*crystal_integration*") { 0 } else { 1 }
        }, FullName
        foreach ($item in $items) {
            $rel = $item.FullName.Substring($p.Length).TrimStart('\', '/').Replace('\', '/')
            $extLines.Add("res://$rel")
        }
    }
    if ($extLines.Count -eq 0) {
        $extLines.Add('res://addons/crystal_integration/crystal.gdextension')
    }
    Set-Content -Path (Join-Path $cfgDir "extension_list.cfg") -Value $extLines -Force

    $pBin = Join-Path $p "bin"
    if (Test-Path $pBin) {
        $pGdignore = Join-Path $pBin ".gdignore"
        if (-not (Test-Path $pGdignore)) {
            New-Item -ItemType File -Force -Path $pGdignore | Out-Null
        }
    }

    $pLib = Join-Path $p "lib"
    if (Test-Path $pLib) {
        $pLibGdignore = Join-Path $pLib ".gdignore"
        if (-not (Test-Path $pLibGdignore)) {
            New-Item -ItemType File -Force -Path $pLibGdignore | Out-Null
        }
    }
}

# Ensure extension_list.cfg for template-addon with its custom addon path
$addonProj = Join-Path $RootDir "template-addon"
if (Test-Path $addonProj) {
    $addonCfgDir = Join-Path $addonProj ".godot"
    if (-not (Test-Path $addonCfgDir)) {
        New-Item -ItemType Directory -Force -Path $addonCfgDir | Out-Null
    }
    Set-Content -Path (Join-Path $addonCfgDir "extension_list.cfg") -Value @(
        'res://addons/crystal_addon/crystal_addon.gdextension',
        'res://addons/crystal_integration/crystal.gdextension'
    ) -Force
}

# Ensure addons are synchronized to all consumer projects
$syncAddonsScript = Join-Path $RootDir "scripts/sync_addons.ps1"
if (Test-Path $syncAddonsScript) {
    & $syncAddonsScript
}

exit 0
