#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

echo "WARNING: This module isn't ready to be used yet"
# link_file ./lenovo.kbd ~/.config/kmonad/lenovo.kbd
