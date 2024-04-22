# Instructions

## Windows Setup Script
1. Run the following command in your terminal: `Set-ExecutionPolicy RemoteSigned`
2. Disable App Execution Aliases (Minimally the ones related to Python)
3. Copy the raw link for windows_setup_script.ps1
4. Run the script: `iwr -useb [RAW_SCRIPT_LINK] | iex`
5. Copy the contents of Microsoft.Powershell_profile.ps1 to your powershell profile

## bash

## zsh
1. Install the zsh script if machine is preinstalled with bash: `sudo apt install zsh`
2. Make zsh your default shell: `chsh -s $(which zsh)`
3. Copy the raw link for zsh_setup_script.zsh
4. Run `wget -0 https://[RAW_LINK_FROM_GITHUB] | sudo zsh`
5. Replace your .zshrc file with the one in this repo
