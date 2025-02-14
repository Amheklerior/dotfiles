#!/bin/zsh

local LOG_PREFIX="[setup dev env]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

_log "$LOG_PREFIX setting up node dev env..."

# create node and corepack install dirs
mkdir -p $HOME/.fnm $HOME/.corepack && \
_log "$LOG_PREFIX created node and corepack install dirs: ~/.fnm, ~/.corepack"

# install LTS node version
if [[ ! $(fnm list | grep -q lts) ]]; then
  _log "$LOG_PREFIX installing node LTS version..."
  fnm install --lts
else
  _log "$LOG_PREFIX node LTS version already installed on this system"
fi

_log "$LOG_PREFIX node dev env setup complete!"
