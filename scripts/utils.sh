#!/bin/zsh

# homebrew installation path for arm-macs
# NOTE. for intel-macs the path is: /usr/local/bin
local HOMEBREW_BIN_PATH="/opt/homebrew/bin"

# utility for logging to the stdout
# TODO: add timestamp, color, etc.
local _log() {
  echo $1
}

local _prompt_for_confirmation() {
  echo "$1 (y/n)" && read
}

local _has_confirmed() {
  test $REPLY = "y" || test $REPLY = "Y"
}

local _is_installed() {
  test $(command -v $1) >/dev/null
}
