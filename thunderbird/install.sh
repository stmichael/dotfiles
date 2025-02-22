#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

download_file https://github.com/catppuccin/thunderbird/raw/refs/heads/main/themes/mocha/mocha-lavender.xpi ~/.config/thunderbird/themes/mocha-lavender.xpi
