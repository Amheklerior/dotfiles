#!/bin/zsh

local LOG_PREFIX="[install shell plugins]:"

local PLUGINS_LIST="$DOTFILES_REPO/bundles/shell-plugins.list"

# load utility functions in case the script is run by the user
[[ -o interactive ]] && source "$DOTFILES_REPO/scripts/utils.sh"

# create the shell plugins dir if it doesn't exist
mkdir -p $XDG_CONFIG_HOME/plugins

# read the plugins list and install them
while IFS=' ' read -r plugin repo; do
  if [[ ! -e "$XDG_CONFIG_HOME/plugins/$plugin" ]]; then
    _log "$LOG_PREFIX installing $plugin from $repo..."
    gh repo clone $repo $XDG_CONFIG_HOME/plugins/$plugin \
      || _log "$LOG_PREFIX Failed to clone: $plugin"
  else
    _log "$LOG_PREFIX $plugin is already installed, skipped!"
  fi
done < $PLUGINS_LIST

_log "$LOG_PREFIX shell plugins installation complete!"