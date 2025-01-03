#!/bin/zsh

# don't echo the commands while running make
export MAKEFLAGS="--silent"

# run the init pipeline:
# - check system compatibility
# - create backup of current dotfiles
# - install and setup homebrew
make prepare || exit 1

# complete homebrew installation
# - set homebrew env vars
# - add the `brew` command to the PATH
echo "[brew]: setting up homebrew environment variables..."
eval "$(/opt/homebrew/bin/brew shellenv)"

# export dir for tmp files (used by the bootstrap recipe)
export XDG_DATA_HOME="$HOME/.local/share"

# Install packages and apps
# - install core utils
# - install cask apps and mac app store apps
# - install vscode extensions
make packages || exit 1

# bootstrap the system
# - setup shell env
# - setup ssh
# - link my dotfiles
make bootstrap || exit 1

# TODO: Investigate why the dotfiles are not sourced during installation
# source dotfiles in current shell
echo "[dotfiles]: source dotfiles..."
source $HOME/.zshenv
source $HOME/.zprofile
source $HOME/.zshrc

# switch dotfiles repo from https protocol to SSH
git remote set-url origin git@github.com:Amheklerior/dotfiles.git

# setup the rest of the system
# - setup dev env
# - clone personal and work repos
make setup-dev-env || exit 1

# configure system and apps settings
make settings || exit 1

# Complete
echo "[Done]: You're ready to rock \m/"