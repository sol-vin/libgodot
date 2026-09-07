param(
    [string]$TargetBin = ""
)

$RootDir = Split-Path -Parent $PSScriptRoot
$binDirs = [System.Collections.Generic.List[string]]::new()
$binDirs.Add((Join-Path $RootDir "bin"))
$binDirs.Add((Join-Path $RootDir "test/bin"))
$binDirs.Add((Join-Path $RootDir "template/bin"))

if (-not [string]::IsNullOrWhiteSpace($TargetBin)) {
    $resolved = (Resolve-Path $TargetBin -ErrorAction SilentlyContinue)
    if ($resolved) {
        $binDirs.Add($resolved.Path)
    } else {
        $binDirs.Add($TargetBin)
    }
}

# Add all existing examples/*/bin directories
$examplesDir = Join-Path $RootDir "examples"
if (Test-Path $examplesDir) {
    Get-ChildItem -Path $examplesDir -Directory | ForEach-Object {
        $exBin = Join-Path $_.FullName "bin"
        if (Test-Path $exBin) {
            $binDirs.Add($exBin)
        }
    }
}

$crystalCmd = Get-Command crystal -ErrorAction SilentlyContinue
if ($crystalCmd) {
    $crystalBin = Split-Path $crystalCmd.Source
    foreach ($dll in @('gc.dll', 'iconv-2.dll', 'pcre2-8.dll')) {
        $src = Join-Path $crystalBin $dll
        if (Test-Path $src) {
            foreach ($d in $binDirs) {
                if (Test-Path $d) {
                    $dst = Join-Path $d $dll
                    if (-not (Test-Path $dst)) {
                        Copy-Item $src $dst -Force -ErrorAction SilentlyContinue
                    }
                }
            }
        }
    }
}

$godotSrcDll = Join-Path $RootDir "godot-src/bin/godot.windows.template_debug.x86_64.dll"
$binLibgodot = Join-Path $RootDir "bin/libgodot.dll"
if ((Test-Path $godotSrcDll) -and (-not (Test-Path $binLibgodot))) {
    Copy-Item $godotSrcDll $binLibgodot -Force -ErrorAction SilentlyContinue
}

if (Test-Path $binLibgodot) {
    foreach ($d in $binDirs) {
        if (Test-Path $d) {
            $dst = Join-Path $d "libgodot.dll"
            if (-not (Test-Path $dst)) {
                Copy-Item $binLibgodot $dst -Force -ErrorAction SilentlyContinue
            }
        }
    }
}

$godotSrcSo = Join-Path $RootDir "godot-src/bin/godot.linuxbsd.template_debug.x86_64.so"
$binLibgodotSo = Join-Path $RootDir "bin/libgodot.so"
if ((Test-Path $godotSrcSo) -and (-not (Test-Path $binLibgodotSo))) {
    Copy-Item $godotSrcSo $binLibgodotSo -Force -ErrorAction SilentlyContinue
}

if (Test-Path $binLibgodotSo) {
    foreach ($d in $binDirs) {
        if (Test-Path $d) {
            $dst = Join-Path $d "libgodot.so"
            if (-not (Test-Path $dst)) {
                Copy-Item $binLibgodotSo $dst -Force -ErrorAction SilentlyContinue
            }
        }
    }
}
exit 0
