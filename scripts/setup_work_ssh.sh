#!/bin/zsh

local LOG_PREFIX="[setup work ssh keys]:"

if [ -e "$HOME/.ssh/work" ]; then
  _log "$LOG_PREFIX work ssh keys already set up"
  return
fi

# setup public and private work SSH keys
_log "$LOG_PREFIX setting up work ssh keys"
cp $REPO/ssh-keys/work $REPO/ssh-keys/work.pub $HOME/.ssh
_log "$LOG_PREFIX Please enter the decryption password for decrypting the work ssh private key" 
ansible-vault decrypt $HOME/.ssh/work && _log "$LOG_PREFIX work ssh keys setup completed"