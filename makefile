.PHONY: bootstrap prepare packages core link settings dev-env wrapup \
				sys-check cli-dev-tools brew brew-install brew-setup \
				default-user-shell sh-symlink

# force make to use bash to interpret the recipes
# NOTE: default shell used my make is /bin/sh
SHELL := /bin/bash

# vars
SYSTEM := $(shell uname -s)

# folders
DOTFILES := $$HOME/.dotfiles
BREWFILE := $(DOTFILES)/Brewfile

# paths
HOMEBREW_ZSH_PATH := /opt/homebrew/bin/zsh


prepare: sys-check cli-dev-tools

bootstrap: brew packages core link settings dev-env wrapup

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

brew-install:
	if ! which brew; then \
		bash -c $(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh);
	fi

brew-setup: brew-install
	brew analytics off
	brew update --auto-update
	brew doctor

# TODO: I might split this in 4 different steps for bins, cask-apps, mas-apps, and vscode-ext
# NOTE: the --no-quarantine flag is addedd to avoid quaranteening downloaded cask apps 
packages: brew
	HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$(BREWFILE)
	brew cleanup

# make the updated version of zsh the default shell when I open a new terminal.
# NOTE: homebrew version of zsh must be added to the list of recognised shells, otherwise the chsh command would not allow the update 
default-user-shell: packages
	echo $(HOMEBREW_ZSH_PATH) | sudo tee -a /etc/shells >/dev/null
	chsh -s $(HOMEBREW_ZSH_PATH)

# update sh symlink to points to zsh instead of bash 
# NOTE: could not symlink to /opt/homebrew/bin/zsh, linked it to the preinstalled /bin/zsh instead
sh-symlink:
	sudo ln -sfv /bin/zsh /var/select/sh

ssh: 
	echo "setup ssh keypairs"

git: 
	echo "setup git and git-lfs"

link: 
	echo "Linking all dotfiles..."

settings:
	echo "Setting up all system preferences..."

dev-env: 
	echo "Setting up development specific goodies..."

wrapup:
	echo "Checks and cleanup..."
	echo "You're ready to rock \m/"