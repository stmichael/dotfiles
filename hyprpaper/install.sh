#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./random-wallpaper.sh ~/.config/hypr/random-wallpaper.sh
link_file ./hyprpaper.conf ~/.config/hypr/hyprpaper.conf
