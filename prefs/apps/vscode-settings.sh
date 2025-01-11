#!/bin/zsh

local VSCODE_PREFS_PATH="$HOME/Library/Application Support/Code/User"

# remove current settings
[[ -e $VSCODE_PREFS_PATH/snippets ]] && rm -rf $VSCODE_PREFS_PATH/snippets
[[ -e $VSCODE_PREFS_PATH/keybindings.json ]] && rm $VSCODE_PREFS_PATH/keybindings.json
[[ -e $VSCODE_PREFS_PATH/settings.json ]] && rm $VSCODE_PREFS_PATH/settings.json

# symlink my custom vscode settings
stow -d $DOTFILES_REPO/prefs/vscode -t $VSCODE_PREFS_PATH -S .