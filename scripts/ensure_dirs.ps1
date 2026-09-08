$RootDir = Split-Path -Parent $PSScriptRoot
$dirs = @(
    (Join-Path $RootDir "bin"),
    (Join-Path $RootDir "addons/crystal_integration/bin"),
    (Join-Path $RootDir "test/bin"),
    (Join-Path $RootDir "template/bin")
)
foreach ($d in $dirs) {
    if (-not (Test-Path $d)) {
        New-Item -ItemType Directory -Force -Path $d | Out-Null
    }
}
