.PHONY: bootstrap prepare packages core settings dev-env wrapup \
				sys-check cli-dev-tools brew brew-install brew-setup \
				zsh ssh git default-user-shell sh-symlink personal work \
				link unlink backup restore

# running 'make' with no specified task will run bootstrap,
# isntead of running the first task defined in the makefile 
.DEFAULT_GOAL := bootstrap

# force make to use bash to interpret the recipes
# NOTE: default shell used my make is /bin/sh
SHELL := /bin/bash

# vars
SYSTEM := $(shell uname -s)
HOME_ITEMS := .zshrc .ssh
CONFIG_ITEMS := starship.toml

# folders
DOTFILES := ${HOME}/.dotfiles
BREWFILE := $(DOTFILES)/install/Brewfile
SSH_KEYS := $(DOTFILES)/ssh-keys
XDG_CONFIG_HOME := ${HOME}/.config

# paths
HOMEBREW_ZSH_PATH := /opt/homebrew/bin/zsh
SYS_SHELLS := /etc/shells


prepare: sys-check cli-dev-tools backup

bootstrap: brew packages core link settings dev-env personal work wrapup

brew: brew-install brew-setup

core: zsh ssh git

zsh: default-user-shell sh-symlink

sys-check: 
	if [ "$(SYSTEM)" == "Darwin" ]; then \
		echo "sys-check: OK!"; \
	else \
		echo "sys-check: KO! It only works on macos" && exit 1; \
	fi

# TODO: find a way to automate installation without user intervention (this opens a dialog)
cli-dev-tools: 
	xcode-select -p >/dev/null || xcode-select --install

backup: 
	mkdir -p $(DOTFILES)/backup/.config
	for item in $(HOME_ITEMS); do \
		if [ -e "${HOME}/$$item" ]; then \
			mv -f ${HOME}/$$item $(DOTFILES)/backup/; \
		fi; \
	done
	for item in $(CONFIG_ITEMS); do \
		if [ -e "${XDG_CONFIG_HOME}/$$item" ]; then \
				mv -f ${XDG_CONFIG_HOME}/$$item ${DOTFILES}/backup/.config; \
		fi \
	done

restore: unlink
	for item in $(HOME_ITEMS); do \
 		if [ -f "${DOTFILES}/backup/$$item" ]; then \
  		mv -f ${DOTFILES}/backup/$$item ${HOME}/; \
		fi; \
 		if [ -d "${DOTFILES}/backup/$$item" ]; then \
  		mv -f ${DOTFILES}/backup/$$item/* ${HOME}/$$item; \
		fi \
	done
	for item in $(CONFIG_ITEMS); do \
 		if [ -e "${DOTFILES}/backup/.config/$$item" ]; then \
  		mv -f ${DOTFILES}/backup/.config/$$item ${XDG_CONFIG_HOME}/; \
		fi \
	done

brew-install:
	command -v brew >/dev/null 2>&1 || \
	bash -c $$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh);

brew-setup: brew-install
	brew analytics off
	brew update --auto-update
	brew doctor

# TODO: I might split this in 4 different steps for bins, cask-apps, mas-apps, and vscode-ext
# NOTE: the --no-quarantine flag is addedd to avoid the Gatekeeper for cask apps 
packages: brew-install
	HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$(BREWFILE)

# make the updated version of zsh the default shell when I open a new terminal.
# NOTE: homebrew version of zsh must be added to the list of recognised shells, otherwise the chsh command would not allow the update 
default-user-shell: packages
	if ! grep -Fxq $(HOMEBREW_ZSH_PATH) $(SYS_SHELLS); then \
		echo $(HOMEBREW_ZSH_PATH) | sudo tee -a $(SYS_SHELLS) >/dev/null; \
	fi
	if [ $$SHELL != $(HOMEBREW_ZSH_PATH) ]; then \
		chsh -s $(HOMEBREW_ZSH_PATH); \
	fi

# update sh symlink to points to zsh instead of bash 
# NOTE: could not symlink to /opt/homebrew/bin/zsh, linked it to the preinstalled /bin/zsh instead
sh-symlink:
	if ! sh --version | grep -q zsh; then \
		sudo ln -sfv /bin/zsh /var/select/sh; \
	fi

ssh: packages
	mkdir -p ${HOME}/.ssh
	cp $(SSH_KEYS)/* ${HOME}/.ssh 
	ansible-vault decrypt ${HOME}/.ssh/personal ${HOME}/.ssh/work

git: 
	echo "setup git and git-lfs"

link: packages
	stow -d $(DOTFILES)/system -t ${HOME} .

unlink:
	stow -D -d $(DOTFILES)/system -t ${HOME} .

settings:
	echo "Setting up all system preferences..."

dev-env: 
	echo "Setting up development specific goodies..."

personal:
	echo "clone my personal repos..."

work:
	echo "clone work related repos..."

wrapup:
	brew cleanup
	echo "You're ready to rock \m/"