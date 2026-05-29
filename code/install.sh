#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

# Link configuration files
link_file ./keybindings.json ~/.config/"Code - OSS"/User/keybindings.json
link_file ./settings.json ~/.config/"Code - OSS"/User/settings.json
