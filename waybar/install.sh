#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

# Link configuration files
link_file ./config.jsonc ~/.config/waybar/config.jsonc
link_file ./style.css ~/.config/waybar/style.css
link_file ./modules ~/.config/waybar/modules

download_file https://github.com/catppuccin/waybar/releases/download/v1.1/mocha.css ~/.config/waybar/mocha.css
