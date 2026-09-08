$RootDir = Split-Path -Parent $PSScriptRoot
$binDir = Join-Path $RootDir "bin"
$testBinDir = Join-Path $RootDir "test/bin"
$templateBinDir = Join-Path $RootDir "template/bin"
$templateAddonBinDir = Join-Path $RootDir "template-addon/addons/crystal_addon/bin"
$examplesDir = Join-Path $RootDir "examples"

$targetDirs = [System.Collections.Generic.List[string]]::new()
$targetDirs.Add($testBinDir)
$targetDirs.Add($templateBinDir)
$targetDirs.Add($templateAddonBinDir)

if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $targetDirs.Add((Join-Path $ex.FullName "bin"))
        # Also sync to any addon bin folders in examples
        $exAddons = Join-Path $ex.FullName "addons"
        if (Test-Path $exAddons) {
            foreach ($addon in Get-ChildItem -Path $exAddons -Directory) {
                $targetDirs.Add((Join-Path $addon.FullName "bin"))
            }
        }
    }
}

foreach ($dir in $targetDirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    foreach ($binFile in @('crystal_bridge.dll', 'crystal_bridge.so', 'crystal_bridge.dylib', 'gc.dll', 'iconv-2.dll', 'pcre2-8.dll', 'libgodot.dll', 'libgodot.so', 'libgodot.dylib', 'libgodot.lib')) {
        $src = Join-Path $binDir $binFile
        $dst = Join-Path $dir $binFile
        if (Test-Path $src) {
            Copy-Item $src $dst -Force -ErrorAction SilentlyContinue
        }
    }
    $androidSrc = Join-Path $binDir "android"
    if (Test-Path $androidSrc) {
        $androidDst = Join-Path $dir "android"
        if (-not (Test-Path $androidDst)) {
            New-Item -ItemType Directory -Force -Path $androidDst | Out-Null
        }
        Get-ChildItem -Path $androidSrc -Directory | ForEach-Object {
            $destAbi = Join-Path $androidDst $_.Name
            if (-not (Test-Path $destAbi)) {
                New-Item -ItemType Directory -Force -Path $destAbi | Out-Null
            }
            Copy-Item -Path (Join-Path $_.FullName "*") -Destination $destAbi -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}


# Sync test binaries back to root bin
foreach ($targetName in @("game.dll", "game.so", "game.dylib", "game.exe", "game")) {
    $testTarget = Join-Path $testBinDir $targetName
    if (Test-Path $testTarget) {
        Copy-Item $testTarget (Join-Path $binDir $targetName) -Force -ErrorAction SilentlyContinue
    }
}

# Ensure extension_list.cfg in all consumer projects
$projects = [System.Collections.Generic.List[string]]::new()
$projects.Add((Join-Path $RootDir "test"))
$projects.Add((Join-Path $RootDir "template"))
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
    Set-Content -Path (Join-Path $cfgDir "extension_list.cfg") -Value 'res://addons/crystal_integration/crystal.gdextension' -Force
}

# Ensure extension_list.cfg for template-addon with its custom addon path
$addonProj = Join-Path $RootDir "template-addon"
if (Test-Path $addonProj) {
    $addonCfgDir = Join-Path $addonProj ".godot"
    if (-not (Test-Path $addonCfgDir)) {
        New-Item -ItemType Directory -Force -Path $addonCfgDir | Out-Null
    }
    Set-Content -Path (Join-Path $addonCfgDir "extension_list.cfg") -Value 'res://addons/crystal_addon/crystal_addon.gdextension' -Force
}

# Ensure addons are synchronized to all consumer projects
$syncAddonsScript = Join-Path $RootDir "scripts/sync_addons.ps1"
if (Test-Path $syncAddonsScript) {
    & $syncAddonsScript
}

exit 0
