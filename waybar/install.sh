#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

# Link configuration files
link_file ./config.jsonc ~/.config/waybar/config.jsonc
link_file ./style.css ~/.config/waybar/style.css
link_file ./modules/power-menu.xml ~/.config/waybar/modules/power-menu.xml
link_file ./modules/cups.sh ~/.config/waybar/modules/cups.sh
