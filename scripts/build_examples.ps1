param(
    [switch]$Exe,
    [string]$Release = ""
)

$RootDir = Split-Path -Parent $PSScriptRoot
$examplesDir = Join-Path $RootDir "examples"

if (Test-Path $examplesDir) {
    foreach ($ex in Get-ChildItem -Path $examplesDir -Directory) {
        $makefilePath = Join-Path $ex.FullName "Makefile"
        if (Test-Path $makefilePath) {
            $target = if ($Exe) { "game_exe" } else { "all" }
            $relArg = if ($Release -eq "1") { "RELEASE=1" } else { "" }
            Write-Host "[Examples] Building $target for $($ex.Name)..."
            Push-Location $ex.FullName
            try {
                if ($relArg) {
                    & make $target $relArg
                } else {
                    & make $target
                }
            } finally {
                Pop-Location
            }
        }
    }
}
exit 0
