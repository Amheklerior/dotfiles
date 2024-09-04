.PHONY: packages core-packages brew-bundle zsh ansible stow brew-check

.DEFAULT_GOAL := packages


packages: core-packages brew-bundle shell-plugins brew-check

core-packages: zsh ansible stow

zsh:
	test $$(command -v $(HOMEBREW_BIN_PATH)/zsh) \
	&& echo "$(PKG_LOG) zsh already installed on your system" \
	|| brew install zsh

ansible:
	test $$(command -v $(HOMEBREW_BIN_PATH)/ansible) \
	&& echo "$(PKG_LOG) ansible already installed on your system" \
	|| brew install ansible

stow:
	test $$(command -v $(HOMEBREW_BIN_PATH)/stow) \
	&& echo "$(PKG_LOG) stow already installed on your system" \
	|| brew install stow

# TODO: I might split this in 4 different steps for bins, cask-apps, mas-apps, and vscode-ext
# NOTE: the --no-quarantine flag is addedd to avoid the Gatekeeper for cask apps 
# NOTE: The `:` cmd is a no-op to prevent exiting if any of the packages fails the installation
brew-bundle:
	echo "$(PKG_LOG) install all packages from brewfile..."
	HOMEBREW_CASK_OPTS="--no-quarantine" brew bundle --file=$(BREWFILE) || :

# For all plugins that are not supported by brew yet, clone them manually into the .config/plugins dir
shell-plugins:
	echo "$(PKG_LOG) install shell plugins..."
	mkdir -p $(XDG_CONFIG_HOME)/plugins
	while IFS=' ' read -r plugin repo; do \
		if [[ ! -e $(XDG_CONFIG_HOME)/plugins/$$plugin ]]; then \
			glab repo clone $$repo $(XDG_CONFIG_HOME)/plugins/$$plugin || echo "$(PCK_LOG) Failed to clone: $$plugin"; \
		else \
			echo "$(PCK_LOG) $$plugin is already present, skipped!"; \
		fi; \
	done < $(SHELL_PLUGINS_LIST)

brew-check:
	brew cleanup
	brew doctor