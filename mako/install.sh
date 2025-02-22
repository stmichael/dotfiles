#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

cp ./config ~/.config/mako/config
curl -L https://github.com/catppuccin/mako/raw/refs/heads/main/themes/catppuccin-mocha/catppuccin-mocha-lavender >> ~/.config/mako/config
