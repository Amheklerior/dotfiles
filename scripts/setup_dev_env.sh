#!/bin/zsh

local LOG_PREFIX="[setup dev env]:"

echo "$LOG_PREFIX setting up node dev env..."

# create node and corepack install dirs
mkdir -p $HOME/.fnm $HOME/.corepack && \
echo "$LOG_PREFIX created node and corepack install dirs: ~/.fnm, ~/.corepack"

# install LTS node version
if [[ ! $(fnm list | grep -q lts) ]]; then
  echo "$LOG_PREFIX installing node LTS version..."
  fnm install --lts
else
  echo "$LOG_PREFIX node LTS version already installed on this system"
fi

echo "$LOG_PREFIX node dev env setup complete!"
