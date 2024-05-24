.PHONY: settings osx iterm2 # add others

.DEFAULT_GOAL := settings


settings: osx iterm2

osx:
	echo "$(SETTINGS_LOG) Setting up system preferences..."

iterm2:
	echo "$(SETTINGS_LOG) Setting up iterm2 preferences..."
