.PHONY: bootstrap prepare packages core link settings dev-env wrapup \
				cli-dev-tools brew brew-install brew-setup

DOTFILES := ${HOME}/.dotfiles
BREWFILE := $(DOTFILES)/Brewfile

bootstrap: prepare packages core link settings dev-env wrapup

prepare: cli-dev-tools brew

brew: brew-install brew-setup

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

core: 
	echo "Setting up the system with the basics..."

link: 
	echo "Linking all dotfiles..."

settings:
	echo "Setting up all system preferences..."

dev-env: 
	echo "Setting up development specific goodies..."

wrapup:
	echo "Checks and cleanup..."
	echo "You're ready to rock \m/"