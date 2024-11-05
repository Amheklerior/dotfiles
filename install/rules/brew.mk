.PHONY: brew brew-install brew-setup

.DEFAULT_GOAL := brew

# NOTE: The above is necessary because calling `eval "$(/opt/homebrew/brew shellenv)"`
# from a make recipe, executes it in a subshell that exits as soon as the comman
# completes.
# This means that, although the command should make the `brew` command available
# in the `PATH`, allowing me to simply call `brew` instead of `/opt/homebrew/bin/brew`
# in the following recipes of the bootstrap process, the `brew` command calls fail
# because the command is not found.
brew := $(HOMEBREW_BIN_PATH)/brew

brew: prompt brew-install brew-setup

brew-install:
	if ! command -v $(brew) >/dev/null; then \
		echo "$(BREW_LOG) installing homebrew on your system..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "$(BREW_LOG) brew already installed!"; \
	fi

brew-setup: brew-install
	echo "$(BREW_LOG) setting up homebrew..."
	$(brew) analytics state | grep enabled >/dev/null && $(brew) analytics off || :
	$(brew) update --auto-update
