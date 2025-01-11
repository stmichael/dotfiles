#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./app-groups ~/bin/app-groups
link_file ./config.json ~/.config/app-groups/config.json
