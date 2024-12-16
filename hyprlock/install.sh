#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./hyprlock.conf ~/.config/hypr/hyprlock.conf
