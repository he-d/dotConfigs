#!/bin/bash

# =============== Downlaod Section===============
# Update System
sudo apt upgrade && sudo apt upgrade -y

# GIT
sudo apt install -y git

# PASS - for git credential-manager
sudo apt install -y pass

# CURL
sudo apt install -y curl

# SNAP
sudo apt install -y snap

# WGET
sudo apt install -y wget

# GPG
sudo apt install -y gpg

# 7-ZIP
sudo apt install -y p7zip-full

# FOR VM ONLY
sudo apt install -y open-vm-tools open-vm-tools-desktop

# ALACRITTY
sudo add-apt-repository ppa:aslatter/ppa
sudo apt update
sudo apt install -y alacritty

# KITTY 
sudo apt install -y kitty

# NEOFETCH 
sudo apt install -y neofetch

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

# 7Zip
sudo apt install -y p7zip-full

# Font-Manager
sudo apt install -y font-manager

# Python3 Virtual Envionment
sudo apt install -y python3-venv

# RIPGREP - for searching (fo e.g. nvim-telescop search)
sudo apt install -y ripgrep

#Java
sudo apt install -y openjdk-11-jre
sudo apt install -y openjdk-11-jdk
sudo apt install -y gradle
sudo apt install -y maven

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
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

#Packer for NEOVIM
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# VIM
sudo apt insatll -y vim

#Node JS
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt update
sudo apt install -y nodejs

# Tmux and TPM
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ZSH and Oh-My ZSH
sudo apt install -y zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# set ZSH as default shell
chsh -s ($which zsh)

# Set default terminal emulator
sudo update-alternatives --config x-terminal-emulator

# Update sudoedit to vim
sudo update-alternatives --config editor


# Start configuration
echo "Finished installing programms, starting the 'theConquerer' setup"

if [ -d ~/Desktop/cqConfig/ ]; then 
    rm -rf  ~/Desktop/cqConfig/
fi
mkdir -p ~/Desktop/cqConfig/
cd ~/Desktop/cqConfig/
wget https://github.com/he-d/dotConfigs/archive/refs/heads/main.zip

7z x main.zip
rm main.zip

cd dotConfigs-main/


echo "Copying vim configuration"
cp -f vim/.vimrc ~/.vimrc


echo "Copying nvim configuration"
if [ -d ~/.config/nvim/ ]; then 
    rm -rf  ~/.config/nvim/
fi
mkdir ~/.config/nvim
cp -rf nvim/setup/after/ ~/.config/nvim/
cp -rf nvim/setup/lua/ ~/.config/nvim/
cp -f nvim/setup/init.lua ~/.config/nvim/


echo "Copying tmux configuration"
cp -f tmux/.tmux.conf ~/.tmux.conf


echo "Copying awesome configuration"
if [ -d ~/.config/awesome/ ]; then 
    rm -rf  ~/.config/awesome/
fi
mkdir ~/.config/awesome
cp -f awesome/rc.lua ~/.config/awesome/


echo "Copying zsh configuration"
cp -f zsh/theConquerer.zsh-theme ~/.oh-my-zsh/themes/
cp -f zsh/.zshrc ~/.zshrc


echo "Copying kitty configuration"
if [ -d ~/.config/kitty/ ]; then
    rm -rf ~/.config/kitty/
fi
mkdir ~/.config/kitty
cp -f kitty/kitty.conf ~/.config/kitty/


echo "Copying VS Code configuration"
if [ ! -d ~/.config/Code/User/ ]; then 
    mkdir -p ~/.config/Code/User/
fi
cp -f code/keybindings.json ~/.config/Code/User/
cp -f code/settings.json ~/.config/Code/User/



# Configuratinon finished - cleaning everything up
rm -rf ~/Desktop/cqConfig/

echo "To complete the configuration reboot the system!"

    read -p "Reboot now? [y]/[n]" yn
    case $yn in 
        [Yy]* ) echo "Rebooting now";;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
exit

