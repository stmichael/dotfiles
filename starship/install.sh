#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

rm -f ~/.config/starship.toml
cp ./starship.toml ~/.config/starship.toml
