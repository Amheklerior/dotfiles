#!/bin/zsh

local LOG_PREFIX="[Setup work-related stuff]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# variables
local BUNDLE="$DOTFILES_REPO/bundles/hh.bundle"
local HH_NPM_REGISTRY="https://npm.pkg.github.com"
local REPO_LIST="$DOTFILES_REPO/bundles/hh-repos.list"

# install work-related packages and apps from a bundle
# NOTE: the --no-quarantine flag is addedd to avoid the MacOS's Gatekeeper for cask apps
_log "$LOG_PREFIX installing work packages and apps from $BUNDLE..."
HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$BUNDLE || : 

# cleanup and check for any warnings/errors
brew cleanup
brew doctor || :
_log "$LOG_PREFIX work-related packages and apps have been installed"

# setup work ssh key-pair for accessing the production server
if [ -e "$HOME/.ssh/work-server" ]; then
  _log "$LOG_PREFIX ssh keys to access work production server are already set up"
else
  _log "$LOG_PREFIX setting up work-related ssh keys"
  cp $DOTFILES_REPO/ssh-keys/work-server $DOTFILES_REPO/ssh-keys/work-server.pub $HOME/.ssh
  _log "$LOG_PREFIX Please enter the decryption password for decrypting the private ssh keys"
  ansible-vault decrypt $HOME/.ssh/work-server && _log "$LOG_PREFIX ssh keys setup complete"
fi

# login into the Heritage Holdings npm registry hosted on Github
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

# TODO: install a DB server
# - install mysql
# - enter mysql shell: `mysql -u root`
# - create an empty DB: `CREATE DATABASE iconic;`
# - find a way to integrate the `.my.cnf` configuration file

# TODO: install a DB client
# - install mysql vscode extension for quering data
# - alternatively install the Sequel Ace or DBeaver app (or another app)

_prompt_for_confirmation "$LOG_PREFIX Do you want to clone personal git repos on this machine?"
if ! _has_confirmed; then
  return
fi
_log "$LOG_PREFIX cloning personal git repos..."

# copy and decrypt the heritage holdings repo list
if [ ! -e "$XDG_DATA_HOME/work-repo" ]; then
  cp $REPO_LIST $XDG_DATA_HOME/work-repo
  _log "$LOG_PREFIX provide decryption password to access work repo list..."
  ansible-vault decrypt "$XDG_DATA_HOME/work-repo"
fi

# clone all repos into the work dir
for repo in $(awk '{print $1}' $XDG_DATA_HOME/work-repo | _trim); do
  if [ -e "$HOME/$repo" ]; then
    _log "$LOG_PREFIX $repo is already present"
    continue
  fi
  _log "$LOG_PREFIX cloning git repo $repo..."
  git clone github.com:heritageholdings/$repo.git "$WORK/$repo" || _log "$LOG_PREFIX Failed to clone: $repo"
done

# remove tmp decrypted repo file
rm $XDG_DATA_HOME/work-repo