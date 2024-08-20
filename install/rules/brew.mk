.PHONY: brew brew-install brew-setup 

.DEFAULT_GOAL := brew


brew: brew-install brew-setup

brew-install:
	if ! command -v $(brew) >/dev/null; then \
		echo "$(BREW_LOG) installing homebrew on your system..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "$(BREW_LOG) brew already installed!"; \
	fi

brew-setup: brew-install
	echo "$(BREW_LOG) setup homebrew..."
	$(brew) analytics off
	$(brew) update --auto-update
