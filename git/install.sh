#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

link_file ./gitconfig ~/.gitconfig
link_file ./gitconfig-private ~/.gitconfig-private
link_file ./gitconfig-spoud ~/.gitconfig-spoud
link_file ./gitconfig-finnova ~/.gitconfig-finnova
