#!/bin/zsh

local LOG_PREFIX="[applications preferences]:"

local APP_PREFS="$HOME/.dotfiles/prefs/apps"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

local _load_settings() {
  _log "$LOG_PREFIX loading preferences for $1 app..."
  # silence any 'Domain XXX not found' errors (prefs get set anyway)
  # NOTE: the error is only thrown when using defaults via this script,
  # not when executing directly the commands on the shell prompt.
  source $APP_PREFS/$1-settings.sh 2> /dev/null
}

_load_settings apple-mail
_load_settings apple-notes
_load_settings apple-saffari
_load_settings apple-passwords
_load_settings apple-contacts
_load_settings vscode
_load_settings alt-tab
_load_settings keyclu
_load_settings hiddenbar