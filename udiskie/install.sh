#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

# Link configuration files
link_file ./config.yml ~/.config/udiskie/config.yml
