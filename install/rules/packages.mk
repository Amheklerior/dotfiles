.PHONY: packages

.DEFAULT_GOAL := packages


packages: core-packages brew-bundle

core-packages: ansible stow

ansible: brew-install
	test $$(command -v $(HOMEBREW_BIN_PATH)/ansible) || brew install ansible

stow: brew-install
	test $$(command -v $(HOMEBREW_BIN_PATH)/stow) || brew install stow

# TODO: I might split this in 4 different steps for bins, cask-apps, mas-apps, and vscode-ext
# NOTE: the --no-quarantine flag is addedd to avoid the Gatekeeper for cask apps 
# NOTE: The `:` cmd is a no-op to prevent exiting if any of the packages fails the installation
brew-bundle: brew-install
	echo "$(PKG_LOG) install all packages from brewfile..."
	HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$(BREWFILE) || :
