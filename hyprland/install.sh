#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./scripts/workspaces ~/bin/workspaces
link_file ./scripts/monitor ~/bin/monitor

link_file ./hyprland.lua ~/.config/hypr/hyprland.lua
link_file ./keybindings.lua ~/.config/hypr/keybindings.lua
link_file ./monitors.lua ~/.config/hypr/monitors.lua
link_file ./startup.lua ~/.config/hypr/startup.lua
link_file ./theme.lua ~/.config/hypr/theme.lua
link_file ./input.lua ~/.config/hypr/input.lua
link_file ./layout.lua ~/.config/hypr/layout.lua
link_file ./rules.lua ~/.config/hypr/rules.lua
