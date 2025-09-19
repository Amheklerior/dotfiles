#!/bin/zsh

local LOG_PREFIX="[install shell plugins]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# create the shell plugins dir if it doesn't exist
mkdir -p $XDG_CONFIG_HOME/plugins

# install shell plugins
if [ ! -e "$XDG_CONFIG_HOME/plugins/fzf-tab" ]; then
  _log "$LOG_PREfiX installing the fzf-tab shell plugin..."
  git clone https://github.com/Aloxaf/fzf-tab.git $XDG_CONFIG_HOME/plugins/fzf-tab
fi

_log "$LOG_PREFIX shell plugins installation complete!"