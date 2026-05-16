#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

export $(cat colors | xargs)

rm -rf ~/.config/theme
mkdir -p ~/.config/theme
cp colors ~/.config/theme/theme.colors
cat templates/lua.lua | envsubst > ~/.config/theme/theme.lua
cat templates/conf.conf | envsubst > ~/.config/theme/theme.conf
cat templates/css.css | envsubst > ~/.config/theme/theme.css
cat templates/rasi.rasi | envsubst > ~/.config/theme/theme.rasi
cat templates/tmux.conf | envsubst > ~/.config/theme/theme.tmux.conf
cat templates/mako.conf | envsubst > ~/.config/theme/theme.mako.conf
cat templates/lazygit.yml | envsubst > ~/.config/theme/theme.lazygit.yml
