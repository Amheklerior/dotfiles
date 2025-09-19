#!/bin/zsh

local LOG_PREFIX="[Install packages and apps]:"

local BUNDLES_DIR="$DOTFILES_REPO/bundles"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# install packages, fonts, apps, and vscode extensions from the Brewfile bundle
_log "$LOG_PREFIX isntalling packages, apps, and vscode extensions from the bundle..."
brew bundle check || brew bundle install || :

# install utility to monitor plist changes (of great help in automating app prefs)
go install github.com/catilac/plistwatch@latest

# cleanup and check for any warnings/errors
brew cleanup
brew doctor || :