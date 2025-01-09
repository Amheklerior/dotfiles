#!/bin/zsh

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# load system preferences
source $DOTFILES_REPO/prefs/macos/defaults.sh
