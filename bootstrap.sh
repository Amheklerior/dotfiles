#!/bin/zsh

# don't echo the commands while running make
export MAKEFLAGS="--silent"

# run the init pipeline:
# - check system compatibility
# - create backup of current dotfiles
# - install homebrew
make init || exit 1

# complete homebrew installation
# - set homebrew env vars
# - add the `brew` command to the PATH
echo "[brew]: setting up homebrew environment variables..."
eval "$(/opt/homebrew/bin/brew shellenv)"

# export dir for tmp files (used by the bootstrap recipe)
export XDG_DATA_HOME="$HOME/.local/share"

# bootstrap the system
# - install packages and apps
# - setup shell
# - setup ssh
# - link my dotfiles
make bootstrap || exit 1

# source dotfiles in current shell
echo "[dotfiles]: source dotfiles..."
source $HOME/.zshenv
source $HOME/.zprofile
source $HOME/.zshrc

# setup the rest of the system
# - setup dev env
# - clone personal and work repos
# - configure system and apps settings
make setup || exit 1

# Complete
echo "[Done]: You're ready to rock \m/"