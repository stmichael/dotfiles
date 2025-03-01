#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./app-groups/app-groups ~/bin/app-groups
link_file ./app-groups/config.json ~/.config/app-groups/config.json
link_file ./nordvpn/nordvpn ~/bin/nordvpn
