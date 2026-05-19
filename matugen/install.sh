#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./config.toml ~/.config/matugen/config.toml
link_file ./templates ~/.config/matugen/templates
