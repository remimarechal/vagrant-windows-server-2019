$ErrorActionPreference = "Stop"
$path=(Resolve-Path -LiteralPath "$PSScriptRoot").ToString()

If ( -Not ( Test-Path "$env:TEMP\apache-ant-1.9.16-bin.zip" ) ) {
    Invoke-WebRequest `
        -Uri "https://dlcdn.apache.org//ant/binaries/apache-ant-1.9.16-bin.zip" `
        -OutFile "$env:TEMP\apache-ant-1.9.16-bin.zip"
}
If ( -Not ( Test-Path "C:\opt" ) ) {
    New-Item `
        -ItemType Directory `
        -Force `
        -Path "C:\opt"
}
Expand-Archive `
    -Force `
    -Path "$env:TEMP\apache-ant-1.9.16-bin.zip" `
    -DestinationPath "$env:TEMP"
Move-Item `
    -Path "$env:TEMP\apache-ant-1.9.16" `
    -Destination "C:\opt\ant-1.9.16"
Remove-Item `
    -Path "$env:TEMP\apache-ant-1.9.16-bin.zip"
[Environment]::SetEnvironmentVariable(
    "PATH", 
    "$path;C:\opt\ant-1.9.16\bin", 
    [EnvironmentVariableTarget]::User)