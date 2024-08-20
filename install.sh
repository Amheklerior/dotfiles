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
# - setup dev env
# - configure system and apps settings 
make bootstrap