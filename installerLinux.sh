#!/bin/bash

sudo apt upgrade && sudo apt upgrade -y

# GIT
sudo apt install -y git

# CURL
sudo apt install -y curl

# SNAP
sudo apt install -y snap

#WGET
sudo apt install -y wget

#GPG
sudo apt install -y gpg

# FOR VM ONLY
sudo apt install open-vm-tools open-vm-tools-desktop -y

# ALACRITTY
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update
sudo apt install -y alacritty

# AWESOME
sudo apt install -y awesome

# DMENU
sudo apt install -y dmenu

# COMPTON
sudo apt install -y compton

# NITROGEN
sudo apt install -y nitrogen

# GCC
sudo apt install -y gcc

# GCC++
sudo apt install -y g++

# Font-Manager
sudo apt install -y font-manager

# Python3 Virtual Envionment
sudo apt-get install python3-venv

# Ripgrep for searching (fo e.g. nvim-telescop search)
sudo pat install ripgrep

# SUBLIME TEXT
sudo apt install -y gnupg apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install -y sublime-text

# VS Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code

# NEOVIM
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
#./nvim.appimage --appimage-extract
#./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# VIM
sudo apt insatll -y vim

# Update sudoedit to vim
sudo update-alternatives --config editor



echo git clone "https://github.com/he-d/dotConfigs.git"  to 
echo desktop and copy the configurations



echo 
echo Finished Installing Programms!
echo Reboot the system now!

