# Windows Setup Script

# Prerequisites:

# Set Execution Policy to 'RemoteSigned'
# `Set-ExcutionPolicy RemoteSigned`

# Disable App Execution Aliases

Write-Output "Downloading and Installing Chocolatey"
Invoke-WebRequest -useb community.chocolatey.org/install.ps1 | InvokeExpression

Write-Output "Configuring Chocolatey"
choco feature enable -n allowGlobalConfirmation

Write-Output "Installing Chocolatey Packages"
choco install powershell-core
choco install vscode
choco install git --package-parameters="/NoAutoCrlf /NoShellIntegration"
choco install pyenv-win
choco install oh-my-posh
choco install posh-git
choco install zlocator
choco install fzf

# Ignore checksums when installing Google Chrome to force install, as updates often get out of sync
choco install googlechrome --ignore-checksums

# Pin Chrome and VSCode so auto-updates don't cause choco to accidentally downgrade
choco pin add -n googlechrome
choco pin add -n vscode

refreshenv

# refresh env usually doesn't work the first time
# below will ensure Path gets updated for operations that require updated Path
foreach ($level in "Machine", "User") {
    [Environment]::GetEnvironmentVariables($level).GetEnumerator() | ForEach-Object {
        if ($_.Name -match 'Path$') {
            $combined_path = (Get-Content "Env:$($_.Name)") + ";$($_.Value)"
            $_.Value = (
                ($combined_path -split ';' | Select-Object -Unique) -join ';'
            )
        }
        $_
    } | Set-Content -Path {"Env:$($_.Name)" }
}

Write-Output "Setting up Pyenv and installing Python"
pyenv update
pyenv install --quiet 3.12.3 3.11.9
pyenv global 3.12.3

Write-Output "Generating SSH Key"
ssh-keygen -C jordinkolman@gmail.com - '""' -f "$HOME/.ssh/id_rsa"
cat $HOME/.ssh/id_rsa.pub | clip

Write-Output "Your SSH Key has been copied to the clipboard"
