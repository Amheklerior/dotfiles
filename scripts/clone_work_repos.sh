#!/bin/zsh

local LOG_PREFIX="[clone work repos]:"

local REPO_LIST="$DOTFILES_REPO/bundles/work-repos.list"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

_prompt_for_confirmation "$LOG_PREFIX Do you want to clone work related git repos on this machine?"
if ! _has_confirmed; then
  return
fi

_log "$LOG_PREFIX cloning work related git repos..."

# get and decrypt the work repo list
if [ ! -e "$XDG_DATA_HOME/work-repo" ]; then
  cp $REPO_LIST $XDG_DATA_HOME/work-repo
  _log "$LOG_PREFIX provide decryption password to access your work repo list..."
  ansible-vault decrypt "$XDG_DATA_HOME/work-repo"
fi

# loop through the list of repos and clone them
while IFS=' ' read -r repo path; do
  if [ -e "$HOME/$path" ]; then
    _log "$LOG_PREFIX $repo is already present"
    continue
  fi
  _log "$LOG_PREFIX cloning git repo $repo..."
  glab repo clone $repo "$HOME/$path" || _log "$LOG_PREFIX Failed to clone: $repo"
done < "$XDG_DATA_HOME/work-repo"

# remove tmp decrypted file
rm $XDG_DATA_HOME/work-repo

_log "$LOG_PREFIX work related git repos cloned successfully"