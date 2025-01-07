#!/bin/zsh

local LOG_PREFIX="[Install packages and apps]:"

local BUNDLES_DIR="$DOTFILES/bundles"

local _install() {
  local bundle="$BUNDLES_DIR/$1.bundle" 
  [ -e $bundle ] || return

  _prompt_for_confirmation "$LOG_PREFIX do you want to install $1 from $bundle?"
  if ! _has_confirmed; then
    _log "$LOG_PREFIX skipping $1 installation"
    return
  fi

  # NOTE: the --no-quarantine flag is addedd to avoid the MacOS's Gatekeeper for cask apps
  _log "$LOG_PREFIX installing $1 from $bundle..."
  HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$bundle || : 
} 

# install core packages
local CORE_PACKAGES=(zsh ansible stow git)
for package in ${CORE_PACKAGES[@]}; do
  if _is_installed "$HOMEBREW_BIN_PATH/$package"; then
    _log "$LOG_PREFIX $package already installed on your system"
  else
    _log "$LOG_PREFIX installing $package on your system..."
    brew install $package
  fi
done

# install packages, fonts, apps, and vscode extensions
_install packages
_install fonts
_install apps
_install vscode

# cleanup and check for any warnings/errors
brew cleanup
brew doctor || :