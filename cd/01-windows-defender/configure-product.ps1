"disable windows defender" | Set-Content -Path "c:\windows-defender.txt"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value "1"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Defender" -Name "DisableAntiVirus" -Value "1"
