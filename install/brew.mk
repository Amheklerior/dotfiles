.PHONY: brew brew-install brew-setup 

.DEFAULT_GOAL := brew


brew: brew-install brew-setup

# install homebrew if not already present
brew-install:
	echo "$(BREW_LOG) install homebrew if not present..."
	command -v brew >/dev/null 2>&1 || \
	bash -c $$(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh);

brew-setup: brew-install
	echo "$(BREW_LOG) setup homebrew..."
	brew analytics off
	brew update --auto-update
	brew doctor
