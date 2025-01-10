#!/bin/zsh

local LOG_PREFIX="[load git preferences]:"

local APP_PREFS_DIR="$DOTFILES_REPO/prefs/app-settings"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

_log "$LOG_PREFIX loading preferences for Alt-Tab..."
stow -d $APP_PREFS_DIR -t "$HOME/Library/Preferences" -S com.lwouis.alt-tab-macos.plist

# alternative way (importing from xml file)
# cat $APP_PREFS_DIR/com.lwouis.alt-tab-macos.xml | \
# defaults import $HOME/Library/Preferences/com.lwouis.alt-tab-macos.plist