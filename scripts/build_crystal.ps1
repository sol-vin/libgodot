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
    # Crystal passes -rdynamic when invoking cc, which translates to -export-dynamic.
    # On Linux, this forces internal Crystal symbols containing '@' into .dynsym,
    # causing linkers (LLD and GNU ld) to fail with "has undefined version" or "version node not found".
    # We use a wrapper for CC that strips -rdynamic so only exported symbols (crystal_godot_init) enter .dynsym.
    $wrapperCandidate = Join-Path $RootDir "scripts/cc_wrapper.sh"
    $wrapperPath = ""
    if (Test-Path $wrapperCandidate) {
        $wrapperPath = (Resolve-Path $wrapperCandidate).Path
    } else {
        $wrapperPath = Join-Path ([System.IO.Path]::GetTempPath()) "crystal_cc_wrapper.sh"
        $scriptContent = @'
#!/bin/sh
for arg in "$@"; do
    if [ "$arg" != "-rdynamic" ]; then
        set -- "$@" "$arg"
    fi
    shift
done
target_cc="${REAL_CC:-cc}"
exec "$target_cc" "$@"
'@
        Set-Content -Path $wrapperPath -Value $scriptContent -NoNewline -Force
    }
    if (Get-Command chmod -ErrorAction SilentlyContinue) {
        & chmod +x $wrapperPath
    }
    if (-not [string]::IsNullOrWhiteSpace($env:CC) -and $env:CC -ne $wrapperPath) {
        $env:REAL_CC = $env:CC
    }
    $env:CC = $wrapperPath

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
        $extraFlags = "-Wl,--undefined-version -Wl,--exclude-libs,ALL -Wl,--no-export-dynamic -Wl,--version-script=$symFile"
        if ((Get-Command ld.lld -ErrorAction SilentlyContinue) -or (Get-Command lld -ErrorAction SilentlyContinue)) {
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
