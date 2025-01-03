# vars
SYSTEM := $(shell uname -s)
STOW_ITEMS := \
	.zshrc \
	.zprofile \
	.zshenv \
	.ssh \
	.gitconfig \
	.config/starship.toml \
	.config/.bunfig.toml \
	wallpapers \
	bin

# dirs
DOTFILES := ${HOME}/.dotfiles
BACKUP_DIR := ${HOME}/backup
BREWFILE := $(DOTFILES)/install/bundles/Brewfile
SSH_KEYS := $(DOTFILES)/ssh-keys
XDG_CONFIG_HOME := ${HOME}/.config
FNM_INSTALL_DIR := ${HOME}/.fnm
COREPACK_INSTALL_DIR := ${HOME}/.corepack
PERSONAL_REPO_LIST := $(DOTFILES)/install/bundles/personal-repos.list
WORK_REPO_LIST := $(DOTFILES)/install/bundles/work-repos.list
SHELL_PLUGINS_LIST := $(DOTFILES)/install/bundles/shell-plugins.list

# paths
# for intel-macs: /usr/local/bin
HOMEBREW_BIN_PATH := /opt/homebrew/bin
SYS_SHELLS := /etc/shells 

# logging tags
PREPARE_LOG := [prepare]:
BREW_LOG := [brew]:
PKG_LOG := [packages]:
CORE_LOG := [core]:
STOW_LOG := [stow]:
DEV_LOG := [dev setup]:
SETTINGS_LOG := [settings]:
