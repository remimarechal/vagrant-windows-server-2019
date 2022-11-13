Write-Host "Install GIT..."
choco install --yes git
#[Environment]::SetEnvironmentVariable("PATH", "$path;C:\Program Files\Git\bin", [EnvironmentVariableTarget]::User)