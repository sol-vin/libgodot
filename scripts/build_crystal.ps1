param(
    [Parameter(Mandatory = $true)]
    [string]$Entry,
    [Parameter(Mandatory = $true)]
    [string]$Output,
    [string]$LinkFlags = "",
    [switch]$Release,
    [string]$SourcePath = ""
)

$RootDir = Split-Path -Parent $PSScriptRoot
if ([string]::IsNullOrWhiteSpace($SourcePath)) {
    $SourcePath = Join-Path $RootDir "src"
}

# Set CRYSTAL_PATH
$baseCrystalPath = crystal env CRYSTAL_PATH
$sep = if ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';') { ";" } else { ":" }
$env:CRYSTAL_PATH = "$SourcePath$sep$baseCrystalPath"

$buildArgs = [System.Collections.Generic.List[string]]::new()
$buildArgs.Add("build")

if ($Release) {
    $buildArgs.Add("--release")
}

# On Linux, shared library linking requires hiding static runtime symbols
# and using a version script to avoid "version node not found for symbol" errors on mangled names containing '@'.
$onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
if (-not $onWindows -and ($Output -match '\.so$' -or $LinkFlags -match '-shared')) {
    if ($LinkFlags -notmatch '--version-script') {
        $candidates = @(
            (Join-Path $RootDir "src/bridge/crystal_game.sym"),
            (Join-Path $RootDir "addons/crystal_integration/crystal_game.sym"),
            (Join-Path (Get-Location) "addons/crystal_integration/crystal_game.sym")
        )
        $symFile = ""
        foreach ($cand in $candidates) {
            if (Test-Path $cand) {
                $symFile = (Resolve-Path $cand).Path
                break
            }
        }
        if ([string]::IsNullOrWhiteSpace($symFile)) {
            $symFile = Join-Path ([System.IO.Path]::GetTempPath()) "crystal_game.sym"
            Set-Content -Path $symFile -Value "{`n  global:`n    crystal_godot_init;`n  local:`n    *;`n};`n" -Force
        }
        $extraFlags = "-Wl,--exclude-libs,ALL -Wl,--no-export-dynamic -Wl,--version-script=$symFile"
        if (Get-Command ld.lld -ErrorAction SilentlyContinue -or Get-Command lld -ErrorAction SilentlyContinue) {
            $extraFlags = "-fuse-ld=lld $extraFlags"
        }
        $LinkFlags = if ([string]::IsNullOrWhiteSpace($LinkFlags)) { "-shared $extraFlags" } else { "$LinkFlags $extraFlags" }
    }
}

if (-not [string]::IsNullOrWhiteSpace($LinkFlags)) {
    $buildArgs.Add("--link-flags")
    $buildArgs.Add($LinkFlags)
}

$buildArgs.Add($Entry)
$buildArgs.Add("-o")
$buildArgs.Add($Output)

& crystal $buildArgs
exit $LASTEXITCODE
