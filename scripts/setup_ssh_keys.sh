#!/bin/zsh

local LOG_PREFIX="[setup ssh keys]:"

# create the ssh dir if it doesn't exist
mkdir -p $HOME/.ssh

if [ -e "$HOME/.ssh/personal" ]; then
  _log "$LOG_PREFIX personal ssh keys already set up"
  return
fi

# setup public and private personal SSH keys
_log "$LOG_PREFIX setting up personal ssh keys"
cp $REPO/ssh-keys/personal $REPO/ssh-keys/personal.pub $HOME/.ssh
_log "$LOG_PREFIX Please enter the decryption password for decrypting the private ssh keys"
ansible-vault decrypt $HOME/.ssh/personal && _log "$LOG_PREFIX ssh keys setup complete"