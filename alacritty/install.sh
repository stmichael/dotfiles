#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./alacritty.toml ~/.config/alacritty/alacritty.toml
download_file https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml ~/.config/alacritty/catppuccin-mocha.toml
