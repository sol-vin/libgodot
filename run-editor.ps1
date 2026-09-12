param(
    [Parameter(Position = 0)]
    [Alias("p")]
    [string]$Path = "test",

    [Alias("log")]
    [string]$LogFile = "editor.log",

    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$AdditionalArgs
)

# Validate unknown named parameters or typos like -pah
if ($AdditionalArgs) {
    for ($i = 0; $i -lt $AdditionalArgs.Count; $i++) {
        $arg = $AdditionalArgs[$i]
        if ($arg -match '^-pa[a-zA-Z]*$') {
            Write-Host "[RunEditor] Error: Unknown parameter '$arg'. Did you mean '-Path'?" -ForegroundColor Red
            exit 1
        }
    }
}
if ($PSBoundParameters.ContainsKey("Path") -and $Path -match '^-(?!-)?[a-zA-Z]') {
    Write-Host "[RunEditor] Error: Unknown parameter or invalid path '$Path'. Did you mean '-Path'?" -ForegroundColor Red
    exit 1
}

$ErrorActionPreference = "Stop"

$RootDir = $PSScriptRoot

# 1. Resolve target project path
if ([System.IO.Path]::IsPathRooted($Path)) {
    $TargetDir = (Resolve-Path $Path -ErrorAction SilentlyContinue)
    if (-not $TargetDir) { $TargetDir = $Path }
} else {
    $candidate = Join-Path $RootDir $Path
    if (Test-Path $candidate) {
        $TargetDir = (Resolve-Path $candidate).Path
    } else {
        $TargetDir = $candidate
    }
}

if (-not (Test-Path $TargetDir)) {
    Write-Host "[RunEditor] Error: Target project directory '$TargetDir' does not exist!" -ForegroundColor Red
    exit 1
}

$ProjectGodot = Join-Path $TargetDir "project.godot"
if (-not (Test-Path $ProjectGodot)) {
    Write-Host "[RunEditor] Warning: No 'project.godot' found in '$TargetDir'!" -ForegroundColor Yellow
}

# 2. Resolve Godot executable
$GodotExe = $null
$normGodot4 = if ($env:GODOT4) { $env:GODOT4 -replace '^/([a-zA-Z])/', '$1:/' } else { $null }
$normGodot = if ($env:GODOT) { $env:GODOT -replace '^/([a-zA-Z])/', '$1:/' } else { $null }

if (Test-Path (Join-Path $RootDir "godot.exe")) {
    $GodotExe = (Resolve-Path (Join-Path $RootDir "godot.exe")).Path
} elseif (Test-Path (Join-Path $RootDir "godot")) {
    $GodotExe = (Resolve-Path (Join-Path $RootDir "godot")).Path
} elseif (-not [string]::IsNullOrWhiteSpace($normGodot4) -and (Test-Path $normGodot4)) {
    $GodotExe = (Resolve-Path $normGodot4).Path
} elseif (-not [string]::IsNullOrWhiteSpace($normGodot) -and (Test-Path $normGodot)) {
    $GodotExe = (Resolve-Path $normGodot).Path
} elseif (Get-Command godot -ErrorAction SilentlyContinue) {
    $GodotExe = (Get-Command godot).Source
}

if (-not $GodotExe -or -not (Test-Path $GodotExe)) {
    Write-Host "[RunEditor] Error: Godot engine executable was not found!" -ForegroundColor Red
    Write-Host "[RunEditor] Please ensure 'godot.exe' exists in '$RootDir' or set `$env:GODOT4." -ForegroundColor Yellow
    exit 1
}

# 3. Resolve log file destination
if (-not [System.IO.Path]::IsPathRooted($LogFile)) {
    $ResolvedLog = Join-Path $RootDir $LogFile
} else {
    $ResolvedLog = $LogFile
}

$logDir = Split-Path -Parent $ResolvedLog
if ($logDir -and -not (Test-Path $logDir)) {
    New-Item -ItemType Directory -Force -Path $logDir | Out-Null
}

# 4. Set up PATH for DLL resolution
$oldPath = $env:PATH
$binCandidates = @(
    (Join-Path $TargetDir "addons/crystal_addon/bin"),
    (Join-Path $TargetDir "addons/crystal_integration/bin"),
    (Join-Path $TargetDir "bin"),
    (Join-Path $RootDir "bin"),
    (Join-Path $RootDir "test/bin")
) | Where-Object { Test-Path $_ }

if ($binCandidates) {
    $binJoined = $binCandidates -join [System.IO.Path]::PathSeparator
    $env:PATH = $binJoined + [System.IO.Path]::PathSeparator + $env:PATH
}

Write-Host "=================================================" -ForegroundColor Green
Write-Host "         LibGodot Editor Launcher               " -ForegroundColor Green
Write-Host "=================================================" -ForegroundColor Green
Write-Host "Project: $TargetDir"
Write-Host "Engine:  $GodotExe"
Write-Host "Log:     $ResolvedLog"
Write-Host "=================================================" -ForegroundColor Green

# 5. Launch Godot and shadow all output to log file
$godotArgs = @("--verbose", "--editor", "--path", $TargetDir)
if ($AdditionalArgs) {
    $godotArgs += $AdditionalArgs
}

$utf8NoBom = [System.Text.UTF8Encoding]::new($false)
$writer = [System.IO.StreamWriter]::new($ResolvedLog, $false, $utf8NoBom)
try {
    $writer.WriteLine("=================================================")
    $writer.WriteLine("LibGodot Editor Session Log")
    $writer.WriteLine("Started: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
    $writer.WriteLine("Project: $TargetDir")
    $writer.WriteLine("Engine:  $GodotExe")
    $writer.WriteLine("Args:    $($godotArgs -join ' ')")
    $writer.WriteLine("=================================================")
    $writer.Flush()

    $prevErrorAction = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    & $GodotExe @godotArgs 2>&1 | ForEach-Object {
        $line = $_.ToString()
        Write-Host $line
        $writer.WriteLine($line)
        $writer.Flush()
    }
} finally {
    $writer.WriteLine("=================================================")
    $writer.WriteLine("Session Ended: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') (Exit Code: $LASTEXITCODE)")
    $writer.WriteLine("=================================================")
    $writer.Flush()
    $writer.Dispose()
    $env:PATH = $oldPath
    $ErrorActionPreference = $prevErrorAction
}