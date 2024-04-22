#!/bin/zsh

echo "Installing Pyenv"
sudo apt-get install pyenv

echo "Installing git"
sudo apt-get install git

echo "Setting git globals"
git config --global user.email "jordinkolman@gmail.com"
git config --global user.name "Jordin Kolman"
git config --global init.defaultBranch main

echo "Installing Python"
pyenv install --quiet 3.12.3 3.11.9
pyenv global 3.12.3

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing uv"
pip install uv

echo "Installing zoxide"
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

echo "Installing fzf"
sudo apt-get install fzf

echo "Installing xclip"
sudo apt-get install xclip

echo "Generating SSH Key"
ssh-keygen -t ed25519 -C "jordinkolman@gmail.com"
ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub | xclip

echo "Your SSH Key has been copied to the clipboard"
echo "Be sure to replace your .zshrc file with the one in this repo to apply your themes and preferences!"