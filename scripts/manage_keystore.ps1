<#
.SYNOPSIS
    Manages Android keystores for LibGodot: creates, decodes, inspects, and auto-generates random keystores.

.DESCRIPTION
    Provides automated keystore management for Android packaging in LibGodot:
      - Generates custom or totally random keystores (alias, password, DName, and metadata).
      - Decodes existing .keystore / .jks files to inspect certificate fingerprints (SHA256, SHA1, MD5),
        owner/issuer DNames, algorithms, and validity periods.
      - Decodes signed Android APK files directly to extract and inspect the signing certificate.
      - If no keystore exists, creates a totally random one with saved credentials.

.PARAMETER Action
    Action to perform: 'GetOrCreate' (default), 'Create', or 'Decode'.

.PARAMETER Path
    Path to the keystore file (.keystore, .jks) or APK file (.apk).

.PARAMETER Alias
    Key alias name. If omitted when creating with -Random, a unique random alias is generated.

.PARAMETER Password
    Keystore and key password. If omitted when creating with -Random, a secure random password is generated.

.PARAMETER ValidityDays
    Certificate validity duration in days (default: 10000).

.PARAMETER DName
    Distinguished Name for the certificate (e.g. "CN=MyName,O=MyOrg,C=US").
    If omitted when creating with -Random, a unique random DName is generated.

.PARAMETER Random
    Forces generation of a totally random keystore (random alias, random password, random DName).

.PARAMETER PassThru
    Returns the structured keystore result object to PowerShell pipeline.

.EXAMPLE
    # Auto-get or create a random keystore:
    .\manage_keystore.ps1

.EXAMPLE
    # Create a totally random release keystore at a specific path:
    .\manage_keystore.ps1 -Action Create -Path "release.keystore" -Random

.EXAMPLE
    # Decode and inspect a keystore:
    .\manage_keystore.ps1 -Action Decode -Path "~/.android/release.keystore"

.EXAMPLE
    # Decode and inspect the certificate of a signed APK:
    .\manage_keystore.ps1 -Action Decode -Path "bin/android/template.apk"
#>

[CmdletBinding(DefaultParameterSetName = "Default")]
param(
    [Parameter(Position = 0)]
    [ValidateSet("GetOrCreate", "Create", "Decode")]
    [string]$Action = "GetOrCreate",

    [Parameter(Position = 1)]
    [string]$Path = "",

    [string]$Alias = "",
    [string]$Password = "",
    [int]$ValidityDays = 10000,
    [string]$DName = "",
    [switch]$Random,
    [switch]$Decode,
    [switch]$Create,
    [switch]$PassThru
)

$ErrorActionPreference = "Stop"

if ($Decode) { $Action = "Decode" }
if ($Create) { $Action = "Create" }

# ==============================================================================
# Helper Functions
# ==============================================================================

function Find-Keytool {
    # 1. Check system PATH
    $cmd = Get-Command keytool -ErrorAction SilentlyContinue
    if ($cmd) {
        return $cmd.Source
    }

    # 2. Check JAVA_HOME
    if ($env:JAVA_HOME) {
        $cand = Join-Path $env:JAVA_HOME "bin/keytool"
        if ($env:OS -eq "Windows_NT") { $cand += ".exe" }
        if (Test-Path $cand) { return $cand }
    }

    # 3. Candidate directories on Windows / Linux / macOS
    $searchPaths = @(
        "C:\Program Files\Android\Android Studio\jbr\bin\keytool.exe",
        "C:\Program Files\Android\Android Studio\jre\bin\keytool.exe",
        "C:\Program Files\Java\*\bin\keytool.exe",
        "C:\Program Files\Eclipse Adoptium\*\bin\keytool.exe",
        "C:\Program Files\Microsoft\*\bin\keytool.exe",
        "/usr/local/lib/android/sdk/jbr/bin/keytool",
        "/opt/android-studio/jbr/bin/keytool",
        "/usr/lib/jvm/*/bin/keytool",
        "/Library/Java/JavaVirtualMachines/*/Contents/Home/bin/keytool"
    )

    foreach ($pattern in $searchPaths) {
        $resolved = Resolve-Path $pattern -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($resolved -and (Test-Path $resolved.Path)) {
            return $resolved.Path
        }
    }

    throw "[ManageKeystore] 'keytool' executable not found. Please ensure a JDK or Android Studio JBR is installed and in PATH."
}

function Invoke-KeytoolCmd {
    param(
        [string]$KeytoolExe,
        [string[]]$Arguments
    )

    $pinfo = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName = $KeytoolExe
    # Quote arguments containing spaces or special characters
    $formattedArgs = @()
    foreach ($arg in $Arguments) {
        if ($arg -match '\s' -or $arg -match '"') {
            $formattedArgs += "`"$($arg.Replace('"', '\"'))`""
        } else {
            $formattedArgs += $arg
        }
    }
    $pinfo.Arguments = $formattedArgs -join " "
    $pinfo.RedirectStandardOutput = $true
    $pinfo.RedirectStandardError = $true
    $pinfo.UseShellExecute = $false
    $pinfo.CreateNoWindow = $true

    $process = [System.Diagnostics.Process]::Start($pinfo)
    $stdout = $process.StandardOutput.ReadToEnd()
    $stderr = $process.StandardError.ReadToEnd()
    $process.WaitForExit()

    $combined = ($stdout + "`n" + $stderr).Trim()
    return [PSCustomObject]@{
        ExitCode = $process.ExitCode
        Output   = $combined
    }
}

function Get-SecureRandomString {
    param([int]$Length = 20)
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    $bytes = [byte[]]::new($Length)
    $rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
    $rng.GetBytes($bytes)
    $result = [char[]]::new($Length)
    for ($i = 0; $i -lt $Length; $i++) {
        $result[$i] = $chars[$bytes[$i] % $chars.Length]
    }
    return -join $result
}

function Get-DefaultKeystoreDir {
    $onWindows = ($env:OS -eq "Windows_NT" -or [System.IO.Path]::PathSeparator -eq ';')
    $dir = if ($onWindows) {
        Join-Path $env:USERPROFILE ".android"
    } else {
        $userHome = if ($env:HOME) { $env:HOME } else { [System.Environment]::GetFolderPath('UserProfile') }
        Join-Path $userHome ".android"
    }
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir | Out-Null
    }
    return $dir
}

function Decode-ApkCertificate {
    param(
        [string]$KeytoolExe,
        [string]$ApkPath
    )

    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host " LibGodot - APK Certificate Decoder" -ForegroundColor Cyan
    Write-Host " Target APK: $ApkPath" -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor Cyan

    if (-not (Test-Path $ApkPath)) {
        throw "[ManageKeystore] APK file not found at '$ApkPath'."
    }

    $execRes = Invoke-KeytoolCmd -KeytoolExe $KeytoolExe -Arguments @("-printcert", "-jarfile", $ApkPath)
    if ($execRes.ExitCode -ne 0) {
        throw "[ManageKeystore] Failed to decode APK certificates with exit code $($execRes.ExitCode):`n$($execRes.Output)"
    }

    $text = $execRes.Output
    
    # Extract key properties via regex
    $owner = if ($text -match "Owner:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $issuer = if ($text -match "Issuer:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $serial = if ($text -match "Serial number:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $validFrom = "Unknown"
    $validUntil = "Unknown"
    if ($text -match "Valid from:\s*([^\r\n]+?)\s+until:\s*([^\r\n]+)") {
        $validFrom = $matches[1].Trim()
        $validUntil = $matches[2].Trim()
    }
    $sha256 = if ($text -match "SHA256:\s*([0-9A-Fa-f:]+)") { $matches[1].Trim() } else { "Unknown" }
    $sha1 = if ($text -match "SHA1:\s*([0-9A-Fa-f:]+)") { $matches[1].Trim() } else { "Unknown" }
    $sigAlg = if ($text -match "Signature algorithm name:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $keyAlg = if ($text -match "Subject Public Key Algorithm:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }

    Write-Host "  Signer Information:" -ForegroundColor Yellow
    Write-Host "    Owner:       $owner" -ForegroundColor White
    Write-Host "    Issuer:      $issuer" -ForegroundColor White
    Write-Host "    Serial:      $serial" -ForegroundColor White
    Write-Host "    Valid From:  $validFrom" -ForegroundColor White
    Write-Host "    Valid Until: $validUntil" -ForegroundColor White
    Write-Host "  Fingerprints:" -ForegroundColor Yellow
    Write-Host "    SHA-256:     $sha256" -ForegroundColor Green
    Write-Host "    SHA-1:       $sha1" -ForegroundColor Gray
    Write-Host "  Cryptographic Details:" -ForegroundColor Yellow
    Write-Host "    Key Info:    $keyAlg" -ForegroundColor White
    Write-Host "    Signature:   $sigAlg" -ForegroundColor White
    Write-Host "============================================================" -ForegroundColor Cyan

    return [PSCustomObject]@{
        TargetType       = "APK"
        Path             = $ApkPath
        Owner            = $owner
        Issuer           = $issuer
        SerialNumber     = $serial
        ValidFrom        = $validFrom
        ValidUntil       = $validUntil
        FingerprintSha256= $sha256
        FingerprintSha1  = $sha1
        KeyAlgorithm     = $keyAlg
        SignatureAlgorithm = $sigAlg
        RawOutput        = $text
    }
}

function Decode-KeystoreFile {
    param(
        [string]$KeytoolExe,
        [string]$KeystorePath,
        [string]$Password = ""
    )

    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host " LibGodot - Keystore Decoder" -ForegroundColor Cyan
    Write-Host " Target Keystore: $KeystorePath" -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor Cyan

    if (-not (Test-Path $KeystorePath)) {
        throw "[ManageKeystore] Keystore file not found at '$KeystorePath'."
    }

    # If no password provided, check for adjacent .credentials.json
    $credJson = "$KeystorePath.credentials.json"
    if (-not $Password -and (Test-Path $credJson)) {
        try {
            $jsonObj = Get-Content $credJson -Raw | ConvertFrom-Json
            if ($jsonObj.password) {
                $Password = $jsonObj.password
                Write-Host "  -> Loaded password from adjacent credentials file ($credJson)" -ForegroundColor Gray
            }
        } catch {}
    }

    # If still empty, try common dev passwords
    $passwordsToTry = @()
    if ($Password) { $passwordsToTry += $Password }
    $passwordsToTry += "android"
    $passwordsToTry += ""

    $rawText = $null
    $successPass = $null
    foreach ($p in $passwordsToTry) {
        $args = @("-list", "-v", "-keystore", $KeystorePath)
        if ($p) {
            $args += @("-storepass", $p)
        }
        $res = Invoke-KeytoolCmd -KeytoolExe $KeytoolExe -Arguments $args
        if ($res.ExitCode -eq 0) {
            $rawText = $res.Output
            $successPass = $p
            break
        }
    }

    if (-not $rawText) {
        throw "[ManageKeystore] Failed to unlock/decode keystore '$KeystorePath'. Please provide -Password."
    }

    $text = $rawText

    # Extract properties
    $alias = if ($text -match "Alias name:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $creationDate = if ($text -match "Creation date:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $owner = if ($text -match "Owner:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $issuer = if ($text -match "Issuer:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $serial = if ($text -match "Serial number:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $validFrom = "Unknown"
    $validUntil = "Unknown"
    if ($text -match "Valid from:\s*([^\r\n]+?)\s+until:\s*([^\r\n]+)") {
        $validFrom = $matches[1].Trim()
        $validUntil = $matches[2].Trim()
    }
    $sha256 = if ($text -match "SHA256:\s*([0-9A-Fa-f:]+)") { $matches[1].Trim() } else { "Unknown" }
    $sha1 = if ($text -match "SHA1:\s*([0-9A-Fa-f:]+)") { $matches[1].Trim() } else { "Unknown" }
    $keyAlg = if ($text -match "Subject Public Key Algorithm:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }
    $sigAlg = if ($text -match "Signature algorithm name:\s*([^\r\n]+)") { $matches[1].Trim() } else { "Unknown" }

    Write-Host "  Keystore Information:" -ForegroundColor Yellow
    Write-Host "    Alias:       $alias" -ForegroundColor Green
    Write-Host "    Created:     $creationDate" -ForegroundColor White
    Write-Host "    Owner:       $owner" -ForegroundColor White
    Write-Host "    Issuer:      $issuer" -ForegroundColor White
    Write-Host "    Serial:      $serial" -ForegroundColor White
    Write-Host "    Valid From:  $validFrom" -ForegroundColor White
    Write-Host "    Valid Until: $validUntil" -ForegroundColor White
    Write-Host "  Fingerprints:" -ForegroundColor Yellow
    Write-Host "    SHA-256:     $sha256" -ForegroundColor Green
    Write-Host "    SHA-1:       $sha1" -ForegroundColor Gray
    Write-Host "  Cryptographic Details:" -ForegroundColor Yellow
    Write-Host "    Key Info:    $keyAlg" -ForegroundColor White
    Write-Host "    Signature:   $sigAlg" -ForegroundColor White
    Write-Host "============================================================" -ForegroundColor Cyan

    return [PSCustomObject]@{
        TargetType       = "Keystore"
        Path             = $KeystorePath
        Alias            = $alias
        Password         = $successPass
        CreationDate     = $creationDate
        Owner            = $owner
        Issuer           = $issuer
        SerialNumber     = $serial
        ValidFrom        = $validFrom
        ValidUntil       = $validUntil
        FingerprintSha256= $sha256
        FingerprintSha1  = $sha1
        KeyAlgorithm     = $keyAlg
        SignatureAlgorithm = $sigAlg
        RawOutput        = $text
    }
}

function New-KeystoreFile {
    param(
        [string]$KeytoolExe,
        [string]$KeystorePath,
        [string]$AliasName,
        [string]$PasswordStr,
        [int]$Validity,
        [string]$DNameStr,
        [bool]$IsRandomGenerated
    )

    $parentDir = Split-Path -Parent $KeystorePath
    if ($parentDir -and -not (Test-Path $parentDir)) {
        New-Item -ItemType Directory -Force -Path $parentDir | Out-Null
    }

    if (Test-Path $KeystorePath) {
        Remove-Item $KeystorePath -Force -ErrorAction SilentlyContinue
    }

    $keytoolArgs = @(
        "-keyalg", "RSA",
        "-keysize", "2048",
        "-genkeypair",
        "-alias", $AliasName,
        "-keypass", $PasswordStr,
        "-keystore", $KeystorePath,
        "-storepass", $PasswordStr,
        "-dname", $DNameStr,
        "-validity", "$Validity"
    )

    $res = Invoke-KeytoolCmd -KeytoolExe $KeytoolExe -Arguments $keytoolArgs
    if ($res.ExitCode -ne 0 -or -not (Test-Path $KeystorePath)) {
        throw "[ManageKeystore] keytool failed to create keystore '$KeystorePath' (Exit code: $($res.ExitCode)):`n$($res.Output)"
    }

    # Save metadata/credentials alongside keystore for automated recovery
    $credPath = "$KeystorePath.credentials.json"
    $meta = [ordered]@{
        keystore           = $KeystorePath
        alias              = $AliasName
        password           = $PasswordStr
        validityDays       = $Validity
        dname              = $DNameStr
        createdAt          = (Get-Date).ToString("o")
        isRandomGenerated  = $IsRandomGenerated
    }
    $meta | ConvertTo-Json -Depth 4 | Set-Content -Path $credPath -Force

    # Inspect the generated cert for fingerprint
    $decoded = Decode-KeystoreFile -KeytoolExe $KeytoolExe -KeystorePath $KeystorePath -Password $PasswordStr

    Write-Host "  [OK] Successfully created keystore: '$KeystorePath'" -ForegroundColor Green
    Write-Host "       Alias:    $AliasName" -ForegroundColor Green
    Write-Host "       Password: $PasswordStr" -ForegroundColor Green
    Write-Host "       SHA-256:  $($decoded.FingerprintSha256)" -ForegroundColor Green
    Write-Host "       Metadata: $credPath" -ForegroundColor Gray

    return [PSCustomObject]@{
        KeystorePath      = $KeystorePath
        Alias             = $AliasName
        Password          = $PasswordStr
        FingerprintSha256 = $decoded.FingerprintSha256
        IsRandom          = $IsRandomGenerated
        CredentialsFile   = $credPath
    }
}

# ==============================================================================
# Main Logic
# ==============================================================================

$keytoolExe = Find-Keytool
$defaultDir = Get-DefaultKeystoreDir

# Auto-detect Decode action if target is .apk
if ($Path -and [System.IO.Path]::GetExtension($Path).ToLower() -eq ".apk") {
    $Action = "Decode"
}

switch ($Action) {
    "Decode" {
        if (-not $Path) {
            throw "[ManageKeystore] Please specify -Path to the keystore or APK to decode."
        }
        $fullPath = [System.IO.Path]::GetFullPath($Path)
        $ext = [System.IO.Path]::GetExtension($fullPath).ToLower()
        $result = if ($ext -eq ".apk") {
            Decode-ApkCertificate -KeytoolExe $keytoolExe -ApkPath $fullPath
        } else {
            Decode-KeystoreFile -KeytoolExe $keytoolExe -KeystorePath $fullPath -Password $Password
        }
        if ($PassThru) { return $result }
    }

    "Create" {
        $targetPath = if ($Path) {
            [System.IO.Path]::GetFullPath($Path)
        } else {
            $randSuffix = Get-SecureRandomString -Length 8
            Join-Path $defaultDir "random_keystore_$randSuffix.keystore"
        }

        $useRandom = $Random -or (-not $Alias -and -not $Password)
        $finalAlias = if ($Alias) { $Alias } else { "key_" + (Get-SecureRandomString -Length 8).ToLower() }
        $finalPass = if ($Password) { $Password } else { Get-SecureRandomString -Length 20 }
        $finalDName = if ($DName) {
            $DName
        } else {
            $randId = (Get-SecureRandomString -Length 6).ToUpper()
            "CN=LibGodot App $randId, OU=LibGodot, O=Automated Build, C=US"
        }

        Write-Host "============================================================" -ForegroundColor Cyan
        Write-Host " LibGodot - Creating Android Keystore" -ForegroundColor Cyan
        Write-Host " Target:   $targetPath" -ForegroundColor Cyan
        Write-Host " Alias:    $finalAlias" -ForegroundColor Cyan
        Write-Host " Random:   $useRandom" -ForegroundColor Cyan
        Write-Host "============================================================" -ForegroundColor Cyan

        $result = New-KeystoreFile -KeytoolExe $keytoolExe -KeystorePath $targetPath -AliasName $finalAlias -PasswordStr $finalPass -Validity $ValidityDays -DNameStr $finalDName -IsRandomGenerated $useRandom
        if ($PassThru) { return $result }
    }

    "GetOrCreate" {
        # If user passed a specific path and it exists: decode and return
        if ($Path -and (Test-Path $Path)) {
            $fullPath = [System.IO.Path]::GetFullPath($Path)
            $ext = [System.IO.Path]::GetExtension($fullPath).ToLower()
            if ($ext -eq ".apk") {
                $result = Decode-ApkCertificate -KeytoolExe $keytoolExe -ApkPath $fullPath
                if ($PassThru) { return $result }
                return
            }

            # Keystore exists, decode and load credentials
            $decoded = Decode-KeystoreFile -KeytoolExe $keytoolExe -KeystorePath $fullPath -Password $Password
            $res = [PSCustomObject]@{
                KeystorePath      = $fullPath
                Alias             = if ($Alias) { $Alias } else { $decoded.Alias }
                Password          = if ($Password) { $Password } else { $decoded.Password }
                FingerprintSha256 = $decoded.FingerprintSha256
                IsRandom          = $false
                CredentialsFile   = "$fullPath.credentials.json"
            }
            if ($PassThru) { return $res }
            return
        }

        # Keystore does NOT exist or no path was given: generate a totally random one!
        $targetPath = if ($Path) {
            [System.IO.Path]::GetFullPath($Path)
        } else {
            $randSuffix = Get-SecureRandomString -Length 8
            Join-Path $defaultDir "random_keystore_$randSuffix.keystore"
        }

        $finalAlias = if ($Alias) { $Alias } else { "key_" + (Get-SecureRandomString -Length 8).ToLower() }
        $finalPass = if ($Password) { $Password } else { Get-SecureRandomString -Length 20 }
        $randId = (Get-SecureRandomString -Length 6).ToUpper()
        $finalDName = if ($DName) { $DName } else { "CN=LibGodot App $randId, OU=LibGodot, O=Automated Build, C=US" }

        Write-Host "============================================================" -ForegroundColor Cyan
        Write-Host " LibGodot - Auto-Generating Random Android Keystore" -ForegroundColor Cyan
        Write-Host " Target:   $targetPath" -ForegroundColor Cyan
        Write-Host " Alias:    $finalAlias" -ForegroundColor Cyan
        Write-Host " Mode:     Totally Random Key & Credentials" -ForegroundColor Cyan
        Write-Host "============================================================" -ForegroundColor Cyan

        $result = New-KeystoreFile -KeytoolExe $keytoolExe -KeystorePath $targetPath -AliasName $finalAlias -PasswordStr $finalPass -Validity $ValidityDays -DNameStr $finalDName -IsRandomGenerated $true
        if ($PassThru) { return $result }
    }
}
