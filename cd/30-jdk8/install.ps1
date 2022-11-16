$ErrorActionPreference = "Stop"
$path=(Resolve-Path -LiteralPath "$PSScriptRoot").ToString()

function Main {
    Push-Location "$path"
    .\jdk-8u202-windows-x64.exe /s
    Pop-Location
    while (!(Test-Path "C:\Program Files\Java\jdk1.8.0_202\bin\java.exe")) { 
        Start-Sleep 10
    }
    [Environment]::SetEnvironmentVariable(
        "PATH", 
        "$PATH:C:\Program Files\Java\jdk1.8.0_202", [EnvironmentVariableTarget]::User)
    [Environment]::SetEnvironmentVariable(
        "JDK_HOME", 
        "C:\Program Files\Java\jdk1.8.0_202", [EnvironmentVariableTarget]::User)
    [Environment]::SetEnvironmentVariable(
        "JAVA_HOME", 
        "C:\Program Files\Java\jdk1.8.0_202", [EnvironmentVariableTarget]::User)
}

# function Add-ToUserPath {
#     param (
#         [Parameter(Mandatory=$true)]
#         [ValidateNotNullOrEmpty()]
#         [string] 
#         $dir
#     )
#     $dir = (Resolve-Path $dir)
#     $path = [Environment]::GetEnvironmentVariable("PATH", [System.EnvironmentVariableTarget]::User)
#     if (!($path.Contains($dir))) {
#         # backup the current value
#         # "PATH=$path" | Set-Content -Path "$env:USERPROFILE/path.env"
#         # append dir to path
#         [Environment]::SetEnvironmentVariable("PATH", "$path;$dir", [EnvironmentVariableTarget]::User)
#         Write-Host "Added $dir to PATH"
#         return
#     }
#     Write-Error "$dir is already in PATH"
# }

Main