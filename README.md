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
   1. You may need to change your chsh permissions first if you receive a permission error:
      1. `sudo vim /etc/pam.d/chsh`
      2. change `auth   required  pam_shells.so` to `auth  sufficient  pam_shells.so`
      3. Be sure to change it back to `required` after switching shells
3. Restart your computer
4. When prompted, enter `q` to start zsh with no .zshrc file
5. Copy the raw link for zsh_setup_script.zsh
6. Run `wget -0 https://[RAW_LINK_FROM_GITHUB] | sudo zsh`
