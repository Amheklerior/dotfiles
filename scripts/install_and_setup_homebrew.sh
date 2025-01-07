#!/bin/zsh

local LOG_PREFIX="[install and setup homebrew]:"

local brew_cmd="$HOMEBREW_BIN_PATH/brew"

# install homebrew if not already installed
if ! _is_installed $brew_cmd; then
  _log "$LOG_PREFIX installing homebrew on your system..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$($brew_cmd shellenv)"
else
  _log "$LOG_PREFIX homebrew already installed!"
fi

# setup homebrew
_log "$LOG_PREFIX setting up homebrew..."
brew analytics state | grep enabled >/dev/null && brew analytics off || :
brew update --auto-update