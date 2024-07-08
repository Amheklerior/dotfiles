.PHONY: brew brew-install brew-setup 

.DEFAULT_GOAL := brew


brew: brew-install brew-setup

# install homebrew if not already present
brew-install:
	echo "$(BREW_LOG) install homebrew if not present..."
	test $$(command -v $(HOMEBREW_BIN_PATH)/brew) \
		&& echo "$(BREW_LOG) brew already installed!" \
		|| bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew-setup: brew-install
	echo "$(BREW_LOG) setup homebrew..."
	brew analytics off
	brew update --auto-update
	brew doctor
