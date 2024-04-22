#!/bin/zsh

echo "Installing git"
sudo apt-get install git

echo "Setting git globals"
git config --global user.email "jordinkolman@gmail.com"
git config --global user.name "Jordin Kolman"
git config --global init.defaultBranch main

echo "Installing Pyenv"
curl https://pyenv.run | zsh

echo "Installing Python"
pyenv install --quiet 3.12.3 3.11.9
pyenv global 3.12.3

echo "Installing VSCode"
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt install code

echo "Installing NeoVim"
sudo apt-get install neovim
y
sudo apt-get install python3-neovim
y

echo "Installing oh-my-zsh"
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | zsh

echo "Installing uv pip"
pip install uv

echo "Installing zoxide"
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | zsh

echo "Installing fzf"
sudo apt-get install fzf

echo "Installing xclip"
sudo apt-get install xclip
y

echo "Generating SSH Key"
ssh-keygen -t ed25519 -C "jordinkolman@gmail.com"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub | xclip

echo "Your SSH Key has been copied to the clipboard"
echo "Be sure to copy .zshrc from this repo to apply settings"
