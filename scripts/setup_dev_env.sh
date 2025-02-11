#!/bin/zsh

local LOG_PREFIX="[setup dev env]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

_log "$LOG_PREFIX setting up node dev env..."

local _install_node() {
  v=$1
  if [[ ! $(fnm list | grep -q $v) ]]; then
    _log "$LOG_PREFIX installing node $v versions"
    fnm install --$v
  else
    _log "$LOG_PREFIX node $v version already installed on this system"
  fi
}

# create node and corepack install dirs
mkdir -p $HOME/.fnm $HOME/.corepack && \
_log "$LOG_PREFIX created node and corepack install dirs: ~/.fnm, ~/.corepack"

# install LTS and latest versions of node
_install_node lts
_install_node latest

# installing pnpm as package manager of choice
# NOTE. I need to get latest version of corepack because trying to install pnpm with the version
# of corepack that comes with node causes signature validation errors -> https://pnpm.io/it/installation#using-corepack
npm i -g corepack@latest
corepack enable pnpm

_log "$LOG_PREFIX node dev env setup complete!"
