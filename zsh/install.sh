#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./zshrc ~/.zshrc
link_file ./zshenv ~/.zshenv
link_file ./dircolors ~/.config/zsh/dircolors
link_file ./completion.zsh ~/.config/zsh/completion.zsh
link_file ./history.zsh ~/.config/zsh/history.zsh
link_file ./config.zsh ~/.config/zsh/config.zsh
link_file ./key-bindings.zsh ~/.config/zsh/key-bindings.zsh
link_file ./prompt.zsh ~/.config/zsh/prompt.zsh
link_file ./modules ~/.config/zsh/modules

download_file https://github.com/catppuccin/zsh-syntax-highlighting/raw/main/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
