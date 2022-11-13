# http://stackoverflow.com/a/9949105
# like set -e in bash
$ErrorActionPreference = "Stop"
$path=(Resolve-Path -LiteralPath "$PSScriptRoot").ToString()

# Install MSSQL
Push-Location "$path"
.\SQL2019-SSEI-Dev.exe `
    /Quiet `
    /Language=en-US `
    /ENU `
    /InstallPath=C:\MSSQL `
    /IAcceptSqlServerLicenseTerms `
    /CONFIGURATIONFILE=".\SqlServerInstallConfig.ini"
Pop-Location

# For service exists
Write-Host "Wait for MSSQL service exists..."
For ($i = 0; $i -lt 120; $i++) {
    If ((Get-Service -Name "MSSQL`$MSSQL" -ErrorAction SilentlyContinue).Length -gt 0) { 
        Break
    }
    Sleep 10
}
# Wait for service running
Write-Host "Wait for MSSQL service running..."
(Get-Service "MSSQL`$MSSQL").WaitForStatus('Running')
Write-Host "MSSQL service is running"

Write-Host "Wait 60 seconds before MSSQL configuration script..."
Sleep 60
Write-Host "Configuring MSSQL TCP port..."
Install-PackageProvider -Name NuGet -Force
Install-Module -Name SqlServer -Force
Import-Module "C:\Program Files (x86)\Microsoft SQL Server\150\Tools\PowerShell\Modules\SQLPS"
$smo = 'Microsoft.SqlServer.Management.Smo.'
$wmi = New-Object ($smo + 'Wmi.ManagedComputer')
$uri = "ManagedComputer[@Name='$(hostname)']/ServerInstance[@Name='MSSQL']/ServerProtocol[@Name='Tcp']"
$Tcp = $wmi.GetSmoObject($uri)
$wmi.GetSmoObject("$uri/IPAddress[@Name='IPAll']").IPAddressProperties[1].Value="1433"
$Tcp.alter()
Write-Host "Done."

Write-Host "Restart MSSQL service..."
Restart-Service -Name "MSSQL`$MSSQL"
Write-Host "Done."

netsh advfirewall firewall add rule name="MSSQL" dir=in localport=1433 protocol=TCP action=allow

Write-Host "Clean MSSQL installer..."
Remove-Item -Recurse -Force "C:\SQL2019" | Out-Null