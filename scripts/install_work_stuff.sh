#!/bin/zsh

local LOG_PREFIX="[Setup work-related stuff]:"

local bundle="$DOTFILES_REPO/bundles/hh.bundle"
local repo_list="$DOTFILES_REPO/bundles/hh-repos.list"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# NOTE: the --no-quarantine flag is addedd to avoid the MacOS's Gatekeeper for cask apps
_log "$LOG_PREFIX installing work packages and apps from $bundle..."
HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$bundle || : 

# cleanup and check for any warnings/errors
brew cleanup
brew doctor || :

# proceeds to repo cloning if desired 
_prompt_for_confirmation "$LOG_PREFIX Do you want to clone work-related git repos on this machine?"
if ! _has_confirmed; then
  return
fi

_log "$LOG_PREFIX cloning work related git repos..."

# get and decrypt the work repo list
if [ ! -e "$XDG_DATA_HOME/work-repo" ]; then
  cp $repo_list $XDG_DATA_HOME/work-repo
  _log "$LOG_PREFIX provide decryption password to access your work repos list..."
  ansible-vault decrypt "$XDG_DATA_HOME/work-repo"
fi

# loop through the list of repos and clone them
while IFS=' ' read -r repo path; do
  if [ -e "$HOME/$path" ]; then
    _log "$LOG_PREFIX $repo is already present"
    continue
  fi
  _log "$LOG_PREFIX cloning git repo $repo..."
  glab repo clone $repo "$WORK/$path" || _log "$LOG_PREFIX Failed to clone: $repo"
done < "$XDG_DATA_HOME/work-repo"

# remove tmp decrypted file
rm $XDG_DATA_HOME/work-repo

_log "$LOG_PREFIX work-related git repos cloned successfully"
