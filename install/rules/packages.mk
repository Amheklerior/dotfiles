.PHONY: packages

.DEFAULT_GOAL := packages


packages: core-packages brew-bundle

core-packages: ansible stow

ansible: brew-install
	brew install ansible

stow: brew-install
	brew install stow

# TODO: I might split this in 4 different steps for bins, cask-apps, mas-apps, and vscode-ext
# NOTE: the --no-quarantine flag is addedd to avoid the Gatekeeper for cask apps 
brew-bundle: brew-install
	echo "$(PKG_LOG) install all packages from brewfile..."
	HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$(BREWFILE)
