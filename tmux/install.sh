#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./tmux.conf ~/.config/tmux/tmux.conf

/usr/share/tmux-plugin-manager/bin/install_plugins
