#!/bin/bash

# -> Login as stmichael

# install yay
pacman -S --needed git base-devel fakeroot debugedit make
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# SSH
sudo pacman -S openssh
ssh-keygen -t ed25519 -C "michael.staempfli@gmail.com"

# -> Add SSH key to github

# dotfiles
sudo pacman -S git github-cli
git clone git@github.com:stmichael/dotfiles.git
cd dotfiles
./hyprland/install.sh


# display manager
sudo pacman -S ly
sudo systemctl enable ly

# desktop environment
sudo pacman -S ttf-gohu-nerd hyprland

# application launcher
sudo pacman -S wofi

# terminal
sudo pacman -S alacritty

# vscode
sudo pacman -S code nodejs npm
sudo npm install -g @vscode/vsce






# dotfiles
sudo pacman -S git
