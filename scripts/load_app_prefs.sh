#!/bin/zsh

local LOG_PREFIX="[applications preferences]:"

local APP_PREFS="$HOME/.dotfiles/prefs"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES/scripts/utils.sh"

# the list of the apps to configure
local APPS=(
  vscode
  # TODO: integrate other apps
)

local _remove_current_config_files() {
  cat "$APP_PREFS/$1/cpaths" | xargs -n1 -I "{}" rm -rf "$HOME/{}"
}

local _load_custom_prefs() {
  stow -d "$APP_PREFS/$app/configs" -t $HOME -S .
}

for app in ${APPS[@]}; do
  _log "$LOG_PREFIX loading preferences for $app..."
  _remove_current_config_files $app
  _load_custom_prefs $app
done