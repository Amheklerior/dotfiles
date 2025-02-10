#!/bin/bash

local LOG_PREFIX="[enable touchId for sudo access]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# The file to be modified to configure sudo access
# NOTE: Instead of modifying the main /etc/pam.d/sudo file, which would be 
# overriden at every system update, we create a _local extension file,
# which is maintained by the user and already imported by the main one.
local SUDO_ACCESS_FILE="/etc/pam.d/sudo_local"

# line to enable touchId for sudo access
local AUTH_LINE="auth sufficient pam_tid.so"

local _already_set() {
  test $(grep -Fxq $AUTH_LINE $SUDO_ACCESS_FILE)
}

# create the /etc/pam.d/sudo_local file if it doesn't exist
if [ ! -e $SUDO_ACCESS_FILE ]; then
  sudo touch $SUDO_ACCESS_FILE
  _log "$LOG_PREFIX $SUDO_ACCESS_FILE created"
else
  _log "$LOG_PREFIX $SUDO_ACCESS_FILE already exists"
  return
fi

if _already_set; then
  _log "$LOG_PREFIX touchId for sudo access already enabled"
  return
fi

# enable touchId for sudo access
echo $AUTH_LINE | sudo tee -a $SUDO_ACCESS_FILE >/dev/null
defaults write com.apple.security.authorization ignoreArd -bool true

_log "$LOG_PREFIX touchId for sudo access should be now enabled"
