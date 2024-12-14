#!/bin/bash

set -eu -o pipefail

BASEDIR=$(cd $(dirname $BASH_SOURCE) && pwd)
cd $BASEDIR

source ../utils.sh

if ! command -v npm 2>&1 >/dev/null
then
    echo "Error: Couldn't find the binary npm. Please install the package npm!"
    exit 1
fi

if ! command -v vsce 2>&1 >/dev/null
then
    sudo npm install -g @vscode/vsce
fi

# Install selection extension
cd incremental-selection
vsce package --skip-license --allow-missing-repository
code --uninstall-extension undefined_publisher.incremental-selection
code --install-extension incremental-selection-0.0.1.vsix
cd ..

# Link configuration files
link_file ./keybindings.json ~/.config/"Code - OSS"/User/keybindings.json
link_file ./settings.json ~/.config/"Code - OSS"/User/settings.json
