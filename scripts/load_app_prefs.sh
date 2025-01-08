#!/bin/zsh

local LOG_PREFIX="[applications preferences]:"

# the list of the apps to configure
local APPS=(
  visual-studio-code
  # TODO: integrate other apps
)

local _is_app_installed() {
  test $(brew list --cask | grep $1) >/dev/null
}

for app in ${APPS[@]}; do
  if ! _is_app_installed $app; then
    _log "$LOG_PREFIX $app not installed on your system, skipping!"
    continue
  fi

  # remove current config files...
  # TODO

  # ...and replace them with the one from the repo
  _log "$LOG_PREFIX loading preferences for $app..."
  # TODO
done