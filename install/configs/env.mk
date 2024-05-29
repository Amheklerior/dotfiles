# vars
SYSTEM := $(shell uname -s)
STOW_ITEMS := .zshrc .zprofile .zshenv .ssh .gitconfig starship.toml

# dirs
DOTFILES := ${HOME}/.dotfiles
BACKUP_DIR := ${HOME}/backup
TMP_DIR := ${HOME}/tmp
BREWFILE := $(DOTFILES)/install/bundles/Brewfile
SSH_KEYS := $(DOTFILES)/ssh-keys
XDG_CONFIG_HOME := ${HOME}/.config

# paths
HOMEBREW_ZSH_PATH := /opt/homebrew/bin/zsh
SYS_SHELLS := /etc/shells

# logging tags
PREPARE_LOG := [prepare]:
BREW_LOG := [brew]:
PKG_LOG := [packages]:
CORE_LOG := [core]:
STOW_LOG := [stow]:
DEV_LOG := [dev setup]:
SETTINGS_LOG := [settings]:
