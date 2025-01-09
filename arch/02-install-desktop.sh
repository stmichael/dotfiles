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
sudo sed -i 's/animation=.*/animation=matrix/g' /etc/ly/config.ini

# Add firmware update daemon
sudo pacman -S fwupd udisks2
sudo systemctl enable fwupd
sudo systemctl start fwupd
sudo systemctl enable udisks2
sudo systemctl start udisks2

# desktop environment
sudo pacman -S hyprland hyprlock waybar socat

# fonts
sudo pacman -S noto-fonts ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-nerd-fonts-symbols-mono

# keybindings
sudo pacman -S keyd
sudo systemctl enable keyd
sudo systemctl start keyd

# power profiles
sudo pacman -S power-profiles-daemon python
sudo systemctl enable power-profiles-daemon
sudo systemctl start power-profiles-daemon

# sound setup
sudo pacman -S alsa-lib sof-firmware pipewire pipewire-alsa pipewire-pulse wireplumber playerctl
systemctl --user enable pipewire-pulse wireplumber
systemctl --user start pipewire-pulse wireplumber

# application launcher
sudo pacman -S rofi jq

# terminal
sudo pacman -S alacritty

# display layout
sudo pacman -S python-flit-core
yay -S wlr-layout-ui

# notification
sudo pacman -S mako libnotify

# brightness control
sudo pacman -S brightnessctl

# hypridle
sudo pacman -S hypridle

# hyprpaper
sudo pacman -S hyprpaper

# bluetooth
sudo pacman -S bluez bluez-utils
sudo systemctl enable bluetooth
sudo systemctl start bluetooth
yay -S bluetuith

# .local network detection
sudo pacman -S avahi nss-mdns
sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon
# avahi-browse --all --ignore-local --resolve --terminate to show a list of discovered services
sudo sed -i 's/hosts:.*/hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns/g' /etc/nsswitch.conf

# printing
sudo pacman -S cups hplip
# avahi-browse --all --ignore-local --resolve --terminate to show a list of discovered services
sudo systemctl enable cups
sudo systemctl start cups
hp-setup -i

# screen sharing (test on https://mozilla.github.io/webrtc-landing/gum_test.html)
sudo pacman -S xdg-desktop-portal-hyprland grim slurp
# Add the following config to hyprland
# exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# backup
sudo pacman -S borg
sudo mount --mkdir -t ext4 /dev/sda1 /mnt/usb
mkdir -p /mnt/usb/backup/home-stmichael
borg init --encryption=repokey /mnt/usb/backup/home-stmichael
sudo umount /mnt/usb

# finger print
# -> possibly causes freezes after suspension
# sudo pacman -S fprintd
# sudo fprintd-enroll stmichael
# sudo sed -i '2i auth            sufficient      pam_fprintd.so' /etc/pam.d/sudo

# check out https://crates.io/crates/hyprsome/0.1.10 for workspace to monitor distribution
# https://github.com/hyprland-community/awesome-hyprland
# https://hyprland-community.github.io/pyprland/
