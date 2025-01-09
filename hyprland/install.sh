#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./theme.conf ~/.config/hypr/theme.conf
link_file ./layout.conf ~/.config/hypr/layout.conf
link_file ./input.conf ~/.config/hypr/input.conf
link_file ./keybindings.conf ~/.config/hypr/keybindings.conf
link_file ./rules.conf ~/.config/hypr/rules.conf
link_file ./monitors.conf ~/.config/hypr/monitors.conf
link_file ./hyprland.conf ~/.config/hypr/hyprland.conf
link_file ./scripts ~/.config/hypr/scripts
