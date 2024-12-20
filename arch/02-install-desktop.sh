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
./hyprlock/install.sh
./waybar/install.sh
./code/install.sh

# display manager
sudo pacman -S ly
sudo systemctl enable ly
sudo systemctl start ly

# desktop environment
sudo pacman -S hyprland hyprlock waybar

# fonts
sudo pacman -S noto-fonts ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono

# power profiles
sudo pacman -S power-profiles-daemon python
sudo systemctl enable power-profiles-daemon
sudo systemctl start power-profiles-daemon

# sound setup
sudo pacman -S alsa-lib sof-firmware pipewire pipewire-alsa pipewire-pulse wireplumber
systemctl --user enable pipewire-pulse wireplumber
systemctl --user start pipewire-pulse wireplumber

# application launcher
sudo pacman -S rofi jq

# terminal
sudo pacman -S alacritty

# display layout
sudo pacman -S nwg-displays

# notification
sudo pacman -S mako libnotify

# brightness control
sudo pacman -S brightnessctl

# hypridle
# sound
# workspace setup
# ly theme
# disable focus by mouse movement
# bluetooth

# Ideas
# -----
# Remap alt arrow cross with kmonad. Then all applications would work and don't need to be configured separately.
# Better title submaps
