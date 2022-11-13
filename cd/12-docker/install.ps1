# Doesn't work on virtualbox
# Invoke-WebRequest `
#     -Uri "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe" `
#     -OutFile "$env:TEMP\Docker Desktop Installer.exe"
# # --quiet to prevent installer prompts.
# Start-Process `
#     -FilePath "$env:TEMP\Docker Desktop Installer.exe" `
#     -Wait `
#     -ArgumentList @( "install", "--accept-license", "--quiet", "--installation-dir=C:\opt\docker")