#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./kitty.conf ~/.config/kitty/kitty.conf
download_file https://raw.githubusercontent.com/catppuccin/kitty/main/themes/mocha.conf ~/.config/kitty/catppuccin-mocha.conf
