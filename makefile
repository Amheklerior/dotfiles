.PHONY: bootstrap packages core link settings dev-env wrapup \
				prepare cli-dev-tools brew brew-install brew-setup

bootstrap: prepare packages core link settings dev-env wrapup

## PREPARE steps

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

## Others

packages: 
	echo "Installing all packages and apps..."

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