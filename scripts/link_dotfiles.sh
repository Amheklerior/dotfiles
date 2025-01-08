#!/bin/zsh

local LOG_PREFIX="[link dotfiles]:"

local DOTFILES="$REPO/system"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES/scripts/utils.sh"

# first, create the folder structure
# NOTE: this is necessary to prevent GNU stow from linking the directories
# rather than their content.
mkdir -p $XDG_CONFIG_HOME && _log "$LOG_PREFIX created $XDG_CONFIG_HOME"
mkdir -p $HOME/.ssh && _log "$LOG_PREFIX created $HOME/.ssh"

# if dotfiles are already present relink them
# NOTE: using .zshrc as a proxy for all dotfiles, since they are all linked 
# in a single atomic action
if [ -e $HOME/.zshrc ]; then
  _log "$LOG_PREFIX dotfiles already present, relinking them..."
  stow -d $DOTFILES -t $HOME . -R
else
  _log "$LOG_PREFIX linking dotfiles..."
  stow -d $DOTFILES -t $HOME . -S
fi

_log "$LOG_PREFIX dotfiles linked successfully"
