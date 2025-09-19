#!/bin/zsh

local LOG_PREFIX="[setup ssh keys]:"

# create the ssh dir if it doesn't exist
mkdir -p $HOME/.ssh

if [ -e "$HOME/.ssh/personal" ]; then
  echo "$LOG_PREFIX personal ssh keys already set up"
  return
fi

# setup public and private personal SSH keys
echo "$LOG_PREFIX setting up personal ssh keys"
cp $DOTFILES_REPO/ssh-keys/personal $DOTFILES_REPO/ssh-keys/personal.pub $HOME/.ssh
echo "$LOG_PREFIX Please enter the decryption password for decrypting the private ssh keys"
ansible-vault decrypt $HOME/.ssh/personal && echo "$LOG_PREFIX ssh keys setup complete"