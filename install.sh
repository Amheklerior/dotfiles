#!/bin/bash

# don't echo the commands while running make
export MAKEFLAGS="--silent"

# run the init pipeline:
# - check system compatibility
# - create backup of current dotfiles
# - install homebrew
make init

# complete homebrew installation
# - set homebrew env vars
# - add the `brew` command to the PATH
echo "[brew]: Setting up homebrew environment variables..."
eval "$(/opt/homebrew/bin/brew shellenv)"

# bootstrap the system
# - install packages and apps
# - link my dotfiles
make bootstrap

# source dotfiles in current shell
echo "[dotfiles]: source dotfiles..."
source ${HOME}/.z{shenv,profile,shrc}

# setup the rest of the system
# - setup dev env
# - clone personal and work repos
# - configure system and apps settings
make setup

# Complete
echo "[Done]: You're ready to rock \m/"