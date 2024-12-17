#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./config.rasi ~/.config/rofi/config.rasi
link_file ./theme.rasi ~/.config/rofi/theme.rasi
