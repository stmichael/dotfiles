#!/bin/bash

loadkeys dvorak-programmer

# Internet conncetion
ip link
iwctl device list
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl --passphrase <passphrase> station wlan0 connect WN-AF35C0
ping archlinux.org

# Update time
timedatectl

# Setup disk
fdisk -l
cfdisk /dev/nvme0n1

# Follow instructions on https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS
# Format the following partitions
# Type             | Size  | Mount point
# ---------------- | ----- | -----------
# EFI System       | 1G    | /boot
# Linux filesystem | Rest  | LVM

mkfs.fat -F 32 /dev/nvme0n1p1
cryptsetup luksFormat /dev/nvme0n1p2
cryptsetup open /dev/nvme0n1p2 lvm

pvcreate /dev/mapper/lvm
vgcreate vg0 /dev/mapper/lvm
lvcreate -L 4G -n swap vg0
lvcreate -L 32G -n root vg0
lvcreate -l 100%FREE -n home vg0

mkswap /dev/vg0/swap
mkfs.btrfs /dev/vg0/root
mkfs.btrfs /dev/vg0/home

swapon /dev/vg0/swap
mount /dev/vg0/root /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
mount --mkdir /dev/vg0/home /mnt/home


# Bootstrap arch linux
pacstrap -K /mnt base linux linux-firmware intel-ucode vim man sudo
genfstab -U /mnt >> /mnt/etc/fstab


# Set timezone
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc

vim /etc/locale.gen
# uncomment en_US.UTF-8 UTF-8
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=dvorak-programmer" > /etc/vconsole.conf
echo "stmichaels-host" > /etc/hostname

# Set root password
passwd


# Unlock encrypted LVM on startup
pacman -S lvm2
vim /etc/mkinitcpio.conf
# Add `encrypt lvm2` to HOOKS
mkinitcpio -P


# Install boot manager
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
vim /etc/default/grub
# set `GRUB_CMDLINE_LINUX="cryptdevice=/dev/nvme0n1p2:cryptlvm root=/dev/vg0/root"`
grub-mkconfig -o /boot/grub/grub.cfg


# Enable networkmanager
pacman -S networkmanager
systemctl enable NetworkManager.service


# Reboot
exit
reboot

# -> Login as root

# Connect to wifi
nmcli device wifi connect WN-AF35C0 password <password>


# User setup
EDITOR=vim sudoedit /etc/sudoers
# -> uncomment line `%sudo ALL=(ALL:ALL) ALL`
groupadd sudo
useradd -m -G sudo -s /bin/bash stmichael
passwd stmichael
