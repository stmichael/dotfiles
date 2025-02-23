#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

download_file https://github.com/catppuccin/grub/archive/refs/heads/main.zip /tmp/grub-catpuccin.zip
rm -rf /tmp/grub-main
unzip -d /tmp /tmp/grub-catpuccin.zip
sudo cp -r /tmp/grub-main/src/* /boot/grub/themes

# Set GRUB_THEME="/boot/grub/themes/catppuccin-mocha-grub-theme/theme.txt" in /etc/default/grub
# sudo grub-mkconfig -o /boot/grub/grub.cfg
