#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./config.yaml ~/.config/k9s/config.yaml
link_file ./aliases.yaml ~/.config/k9s/aliases.yaml
download_file https://github.com/catppuccin/k9s/raw/refs/heads/main/dist/catppuccin-mocha.yaml ~/.config/k9s/skins/catppuccin-mocha.yaml
