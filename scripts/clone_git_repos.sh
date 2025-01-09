#!/bin/zsh

local LOG_PREFIX="[clone git repos]:"

local REPO_LIST="$DOTFILES_REPO/bundles/personal-repos.list"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

_prompt_for_confirmation "$LOG_PREFIX Do you want to clone personal git repos on this machine?"
if ! _has_confirmed; then
  return
fi

_log "$LOG_PREFIX cloning personal git repos..."

# get and decrypt the personal repo list
if [ ! -e "$XDG_DATA_HOME/personal-repo" ]; then
  cp $REPO_LIST $XDG_DATA_HOME/personal-repo
  _log "$LOG_PREFIX provide decryption password to access your personal git repo list..."
  ansible-vault decrypt "$XDG_DATA_HOME/personal-repo"
fi

# loop through the list of repos and clone them
while IFS=' ' read -r repo path; do
  if [ -e "$HOME/$path" ]; then
    _log "$LOG_PREFIX $repo is already present"
    continue
  fi
  _log "$LOG_PREFIX cloning git repo $repo..."
  gh repo clone $repo "$HOME/$path" || _log "$LOG_PREFIX Failed to clone: $repo"
done < "$XDG_DATA_HOME/personal-repo"

# remove tmp decrypted file
rm $XDG_DATA_HOME/personal-repo

_log "$LOG_PREFIX personal git repos cloned successfully"