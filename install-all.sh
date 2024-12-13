#!/usr/bin/env bash

set -eu -o pipefail

source ./utils.sh

BASEDIR=$(absolute_path $(dirname $BASH_SOURCE))
cd $BASEDIR

./hyprland/install.sh
