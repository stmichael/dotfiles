#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./config.rasi ~/.config/rofi/config.rasi
link_file ./theme.rasi ~/.config/rofi/theme.rasi
link_file ./scripts ~/.config/rofi/scripts

rm -rf /tmp/flag-icons-7.5.0/icons/flags
download_file https://github.com/lipis/flag-icons/archive/refs/tags/v7.5.0.zip /tmp/flag-icons.zip
unzip /tmp/flag-icons.zip -d /tmp
mkdir -p ~/.config/rofi/icons
cp -r /tmp/flag-icons-7.5.0/flags ~/.config/rofi/icons
rm -rf /tmp/flag-icons.zip /tmp/flag-icons-7.5.0
