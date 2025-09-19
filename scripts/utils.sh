#!/bin/zsh

# homebrew installation path for arm-macs
# NOTE. for intel-macs the path is: /usr/local/bin
local HOMEBREW_BIN_PATH="/opt/homebrew/bin"

local _prompt_for_confirmation() {
  echo "$1 (y/n)" && read -r REPLY < /dev/tty
}

local _has_confirmed() {
  test $REPLY = "y" || test $REPLY = "Y"
}

local _is_installed() {
  test $(command -v $1) >/dev/null
}

local _trim() {
  sed '/^$/d'
}