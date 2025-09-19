#!/bin/zsh

local LOG_PREFIX="[Setup work-related stuff]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# setup work ssh key-pair for accessing the production server
local SSH_KEYNAME=work-server
if [ -e "$HOME/.ssh/$SSH_KEYNAME" ]; then
  _log "$LOG_PREFIX ssh keys to access work production server are already set up"
else
  _log "$LOG_PREFIX setting up work-related ssh keys"
  cp $DOTFILES_REPO/ssh-keys/$SSH_KEYNAME $DOTFILES_REPO/ssh-keys/$SSH_KEYNAME.pub $HOME/.ssh
  _log "$LOG_PREFIX Please enter the decryption password for decrypting the private ssh keys"
  ansible-vault decrypt $HOME/.ssh/$SSH_KEYNAME && _log "$LOG_PREFIX ssh keys setup complete"
fi

# login into the Heritage Holdings npm registry hosted on Github
local HH_NPM_REGISTRY="https://npm.pkg.github.com"
if [[ $(npm whoami --registry=$HH_NPM_REGISTRY 2>/dev/null) == "Amheklerior" ]]; then
  _log "$LOG_PREFIX already logged in to HH npm registry via GitHub account"
else
  # decrypt and copy the github ACCESS_TOKEN to the clipboard
  cp $DOTFILES_REPO/private/github.token $XDG_DATA_HOME/npm-registry-login-token
  _log "$LOG_PREFIX Please enter the decryption password for copying the github login token"
  ansible-vault decrypt $XDG_DATA_HOME/npm-registry-login-token
  cat $XDG_DATA_HOME/npm-registry-login-token | pbcopy
  _log "$LOG_PREFIX token successfully copeid on your clipboard!"

  # logging in to the HH npm registry
  _log "$LOG_PREFIX logging in to HH npm registry $HH_NPM_REGISTRY!
    When prompted, instert GitHub username (lowercase) as username
    and paste the TOKEN copied above as password..."
  npm login --scope=@heritageholdings --registry=$HH_NPM_REGISTRY
fi

# decrypt and copy the github ACCESS_TOKEN
cp $DOTFILES_REPO/private/github.token $XDG_DATA_HOME/gh-login-token
_log "$LOG_PREFIX Please enter the decryption password for copying the github login token"
ansible-vault decrypt $XDG_DATA_HOME/gh-login-token
local GITHUB_TOKEN=$(cat $XDG_DATA_HOME/gh-login-token)

# setup work laptop via automation script
curl -fsSL -H "Authorization: token $GITHUB_TOKEN" "https://raw.githubusercontent.com/heritageholdings/dev-onboarding/refs/heads/main/setup.sh" | /bin/bash

# cleanup temporary files
rm $XDG_DATA_HOME/gh-login-token
