#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./yazi.toml ~/.config/yazi/yazi.toml
link_file ./keymap.toml ~/.config/yazi/keymap.toml
link_file ./init.lua ~/.config/yazi/init.lua
download_file https://github.com/catppuccin/yazi/raw/refs/heads/main/themes/mocha/catppuccin-mocha-lavender.toml ~/.config/yazi/theme.toml
