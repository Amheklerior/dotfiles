# vars
SYSTEM := $(shell uname -s)
STOW_ITEMS := .zshrc .zprofile .zshenv .ssh .gitconfig starship.toml

# dirs
DOTFILES := ${HOME}/.dotfiles
BACKUP_DIR := ${HOME}/backup
BREWFILE := $(DOTFILES)/install/bundles/Brewfile
SSH_KEYS := $(DOTFILES)/ssh-keys
XDG_CONFIG_HOME := ${HOME}/.config
FNM_INSTALL_DIR := ${HOME}/.fnm
COREPACK_INSTALL_DIR := ${HOME}/.corepack
PERSONAL_DIR := ${HOME}/personal
PERSONAL_REPO_LIST := $(DOTFILES)/install/bundles/personal-repos.list
PERSONAL_REPO_LIST_DECRYPTED := ${HOME}/.local/share/personal-repos
WORK_DIR := ${HOME}/work
WORK_REPO_LIST := $(DOTFILES)/install/bundles/work-repos.list
WORK_REPO_LIST_DECRIPTED := ${HOME}/.local/share/work-repos

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
