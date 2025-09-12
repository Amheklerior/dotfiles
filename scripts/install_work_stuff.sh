#!/bin/zsh

local LOG_PREFIX="[Setup work-related stuff]:"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# variables
local BUNDLE="$DOTFILES_REPO/bundles/hh.bundle"
local HH_NPM_REGISTRY="https://npm.pkg.github.com"

# install work-related packages and apps from a bundle
# NOTE: the --no-quarantine flag is addedd to avoid the MacOS's Gatekeeper for cask apps
_log "$LOG_PREFIX installing work packages and apps from $BUNDLE..."
HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$BUNDLE || : 

# cleanup and check for any warnings/errors
brew cleanup
brew doctor || :
_log "$LOG_PREFIX work-related packages and apps have been installed"

# setup work ssh key-pair for accessing the production server
if [ -e "$HOME/.ssh/work" ]; then
  _log "$LOG_PREFIX ssh keys to access work production server are already set up"
else
  _log "$LOG_PREFIX setting up work-related ssh keys"
  cp $DOTFILES_REPO/ssh-keys/work $DOTFILES_REPO/ssh-keys/work.pub $HOME/.ssh
  _log "$LOG_PREFIX Please enter the decryption password for decrypting the private ssh keys"
  ansible-vault decrypt $HOME/.ssh/work && _log "$LOG_PREFIX ssh keys setup complete"
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

# TODO: add repo cloning automation
# - add repos into the repolist file `hh-repos.list`
# - write the code to clone all repos in the list to the $WORK dir

