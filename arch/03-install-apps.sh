#!/bin/bash

# -> Login as stmichael

# archey
yay -S archey4

# vscode
sudo pacman -S code

# zsh
sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting fzf starship
chsh -s /bin/zsh

# lazygit
sudo pacman -S lazygit

# yazi
sudo pacman -S yazi p7zip jq poppler fd ripgrep fzf zoxide imagemagick ueberzugpp
yay -S fuse-archive
ya pack -a dawsers/fuse-archive

# nordvpn
sudo pacman -S openvpn unzip

# mail client
sudo pacman -S thunderbird

# vlc
sudo pacman -S vlc

# bitwarden
sudo pacman -S bitwarden-cli

# NAS
sudo pacman -S nfs-utils

# Java
yay -S jbang

# slack
yay -S slack-desktop-wayland

# tmux
sudo pacman -S tmux
yay -S tmux-plugin-manager

# kubectl
sudo pacman -S kubectl k9s

# LibreOffice
sudo pacman -S libreoffice-still

# Citrix
yay -S icaclient
sudo pacman -S perl-file-mimeinfo
mkdir -p $HOME/.ICAClient/cache
cp /opt/Citrix/ICAClient/config/{All_Regions,Trusted_Region,Unknown_Region,canonicalization,regions}.ini $HOME/.ICAClient/
echo "[Desktop Entry]
Name=Citrix ICA client
Comment="Launch Citrix applications from .ica files"
Categories=Network;
Exec=/opt/Citrix/ICAClient/wfica
Terminal=false
Type=Application
NoDisplay=true
MimeType=application/x-ica;" | sudo tee /usr/share/applications/wfica.desktop
echo '#!/bin/sh
if [ "$1" == "--version" ]; then
    pactl info | grep Server\ Name | sed -e "s/Server Name: //"
else
    echo "This is a dummy file for apps that check if pulseaudio is available by checking for the binary existing"
fi' | sudo tee /usr/bin/pulseaudio
sudo chmod a+x /usr/bin/pulseaudio

# docker
sudo pacman -S docker
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker stmichael

# bittorrent
sudo pacman -S qbittorrent
