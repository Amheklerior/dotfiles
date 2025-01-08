#!/bin/zsh

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES/scripts/utils.sh"

# load system preferences
source $REPO/prefs/macos/defaults.sh
