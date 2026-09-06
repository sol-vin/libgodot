$RootDir = Split-Path -Parent $PSScriptRoot
$binDir = Join-Path $RootDir "bin"
$testBinDir = Join-Path $RootDir "test/bin"
$templateBinDir = Join-Path $RootDir "template/bin"
$examplesDir = Join-Path $RootDir "examples"

$targetDirs = [System.Collections.Generic.List[string]]::new()
$targetDirs.Add($testBinDir)
$targetDirs.Add($templateBinDir)

if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $targetDirs.Add((Join-Path $ex.FullName "bin"))
    }
}

foreach ($dir in $targetDirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    foreach ($dll in @('crystal_bridge.dll', 'gc.dll', 'iconv-2.dll', 'pcre2-8.dll', 'libgodot.dll', 'libgodot.lib')) {
        $src = Join-Path $binDir $dll
        $dst = Join-Path $dir $dll
        if (Test-Path $src) {
            Copy-Item $src $dst -Force -ErrorAction SilentlyContinue
        }
    }
}

# Sync test binaries back to root bin
$testGameDll = Join-Path $testBinDir "game.dll"
if (Test-Path $testGameDll) {
    Copy-Item $testGameDll (Join-Path $binDir "game.dll") -Force -ErrorAction SilentlyContinue
}
$testGameExe = Join-Path $testBinDir "game.exe"
if (Test-Path $testGameExe) {
    Copy-Item $testGameExe (Join-Path $binDir "game.exe") -Force -ErrorAction SilentlyContinue
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

exit 0
