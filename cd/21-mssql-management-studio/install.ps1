$path=(Resolve-Path -LiteralPath "$PSScriptRoot").ToString()
Push-Location "$path"
./install.cmd
Pop-Location