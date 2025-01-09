#!/bin/zsh

local LOG_PREFIX="[setup work git account]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

if glab auth status >/dev/null 2>&1; then
  _log "$LOG_PREFIX gitlab account already logged in"
  return
fi

_log "$LOG_PREFIX setting up gitlab cli"

# decrypt and copy the gitlab ACCESS_TOKEN to the clipboard
cp $DOTFILES_REPO/private/gitlab-mfm.token $XDG_DATA_HOME/glab-login-token
_log "$LOG_PREFIX Please enter the decryption password for copying the gitlab login token"
ansible-vault decrypt $XDG_DATA_HOME/glab-login-token
cat $XDG_DATA_HOME/glab-login-token | pbcopy
_log "$LOG_PREFIX token successfully copeid on your clipboard! Paste it during the installation process..."

# login to github
gh auth login

# cleanup temporary files
rm $XDG_DATA_HOME/glab-login-token

_log "$LOG_PREFIX github cli setup complete!"