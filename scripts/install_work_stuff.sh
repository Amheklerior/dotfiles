#!/bin/zsh

local LOG_PREFIX="[Setup work-related stuff]:"

local bundle="$DOTFILES_REPO/bundles/hh.bundle"
local repo_list="$DOTFILES_REPO/bundles/hh-repos.list"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# NOTE: the --no-quarantine flag is addedd to avoid the MacOS's Gatekeeper for cask apps
_log "$LOG_PREFIX installing work packages and apps from $bundle..."
HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$bundle || : 

# cleanup and check for any warnings/errors
brew cleanup
brew doctor || :

_log "$LOG_PREFIX work apps has been installed"

# TODO: setup work ssh key-pair for accessing the production server
# TODO: automate or document DB setup
# TODO: automate logging in into the HH npm registry on Github   
# TODO: add repo cloning automation
