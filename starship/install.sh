#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

rm -f ~/.config/starship.toml
cp ./starship.toml ~/.config/starship.toml
echo "" >> ~/.config/starship.toml
curl -L https://github.com/catppuccin/starship/raw/refs/heads/main/themes/mocha.toml >> ~/.config/starship.toml
