#!/bin/zsh

local LOG_PREFIX="[check system requirements]:"

local _is_macos() {
  test $(uname -s) = "Darwin"
}

# exit immediately if the script is run on a non-supported system
if ! _is_macos; then
  _log "$LOG_PREFIX OS check failed! It only works on Apple Silicon MacOS systems"
  exit 1
fi

_log "$LOG_PREFIX OS check passed!"