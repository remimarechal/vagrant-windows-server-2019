$ErrorActionPreference = "Stop"
$path=(Resolve-Path -LiteralPath "$PSScriptRoot").ToString()

If ( -Not ( Test-Path "$env:TEMP\gradle-7.5.1-bin.zip" ) ) {
    Invoke-WebRequest `
        -Uri "https://downloads.gradle-dn.com/distributions/gradle-7.5.1-bin.zip" `
        -OutFile "$env:TEMP\gradle-7.5.1-bin.zip"
}
If ( -Not ( Test-Path "C:\opt" ) ) {
    New-Item `
        -ItemType Directory `
        -Force `
        -Path "C:\opt"
}
Expand-Archive `
    -Path "$env:TEMP\gradle-7.5.1-bin.zip" `
    -DestinationPath "C:\opt"
Remove-Item `
    -Path "$env:TEMP\gradle-7.5.1-bin.zip"
[Environment]::SetEnvironmentVariable(
    "PATH", 
    "$path;C:\opt\gradle-7.5.1\bin", 
    [EnvironmentVariableTarget]::User)