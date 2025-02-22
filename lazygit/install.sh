#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./config.yml ~/.config/lazygit/config.yml
download_file https://github.com/catppuccin/lazygit/raw/refs/heads/main/themes-mergable/mocha/lavender.yml ~/.config/lazygit/mocha-lavender.yml
