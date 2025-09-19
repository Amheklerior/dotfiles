#!/bin/zsh

local LOG_PREFIX="[install and setup homebrew]:"

local brew_cmd="$HOMEBREW_BIN_PATH/brew"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# install homebrew if not already installed
if ! _is_installed $brew_cmd; then
  _log "$LOG_PREFIX installing homebrew on your system..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  _log "$LOG_PREFIX homebrew already installed!"
fi

# load homebrew environment variables
# NOTE: this is needed only in case the bootstrap script exits in error halfway through
# on a subsequent run, homebrew will be already installed but the brew command won't be available
# as the homebrew bin dir is not in the PATH. This will make sure it will be.
eval "$($brew_cmd shellenv)"

# setup homebrew
_log "$LOG_PREFIX setting up homebrew..."
brew analytics state | grep enabled >/dev/null && brew analytics off || :
