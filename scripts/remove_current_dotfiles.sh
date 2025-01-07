#!/bin/zsh

local LOG_PREFIX="[remove current dotfiles]:"

# save the dotfiles in the following directory
# if the -c option is privided, save the item into the .config subdir
local BACKUP_DIR="$HOME/backup_$(date +%Y-%m-%d_%H-%M)"
local _backup_and_remove() {
  [[ $* != *"-c"* ]] && to="$BACKUP_DIR" || to=$BACKUP_DIR/.config
  [ -e $1 ] && mv $1 $to && _log "$LOG_PREFIX $1 backed up into $to and removed" || :
}

# create the backup dir if it doesn't exist
mkdir -p $BACKUP_DIR/.config && _log "$LOG_PREFIX created backup dir $BACKUP_DIR"

# shell dotfiles
_backup_and_remove $HOME/.zshrc
_backup_and_remove $HOME/.zprofile
_backup_and_remove $HOME/.zshenv

# git configs
_backup_and_remove $HOME/.gitconfig

# ssh configs
_backup_and_remove $HOME/.ssh

# other config files
_backup_and_remove $XDG_CONFIG_HOME/delta -c 
_backup_and_remove $XDG_CONFIG_HOME/ghostty -c
_backup_and_remove $XDG_CONFIG_HOME/plugins -c
_backup_and_remove $XDG_CONFIG_HOME/.bunfig.toml -c
_backup_and_remove $XDG_CONFIG_HOME/starship.toml -c