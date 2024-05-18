.PHONY: bootstrap prepare packages core link settings dev-env wrapup \
				sys-check cli-dev-tools brew brew-install brew-setup

# vars
SYSTEM := $(shell uname -s)

# folders
DOTFILES := ${HOME}/.dotfiles
BREWFILE := $(DOTFILES)/Brewfile


bootstrap: prepare packages core link settings dev-env wrapup

prepare: sys-check cli-dev-tools brew

brew: brew-install brew-setup

core: zsh ssh git

sys-check: 
	if [ "$(SYSTEM)" != "Darwin" ]; then \
		echo "Nope! it only works for macos"; 
		exit 1; 
	fi

cli-dev-tools: 
	xcode-select --install

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

zsh:
	echo "make zsh the main shell"

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