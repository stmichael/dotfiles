# Michael's dotfiles

This repo contains my dotfiles, where the folder `arch` contains the setup of the operating system and each folder apart from `arch` the configuration of a module.

## Arch installation

The setup of Arch is split into three files `base`, `desktop` and `apps`. Although they are shell scripts, they shouldn't be executed directly. Instead they are meant to be step by step guides for a manual installation. Some steps can be pasted and executed as is, other describe some changes that have to be applied.

Be aware that this folder doesn't contain a generic Arch installation but my personal setup. Disc encryption, desktop environment, display manager, applications are to my liking and can be reused but at your own risk.

## Modules

Each folder that is not `arch` contains the configuration of a package. A module always contains a script `install.sh` that will create symbolic links for the configuration files to their designated places. In most cases the script will create links in a folder within `~/.config`, in some cases the links will be in `~`, in rare cases the links will be created in `/etc` (I know, it's not ideal).
