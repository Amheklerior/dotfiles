.PHONY: settings osx iterm2 # add others

.DEFAULT_GOAL := settings


settings: osx apps

osx:
	echo "$(SETTINGS_LOG) Setting up system and apps preferences... {TODO}"

apps:
	echo "$(SETTINGS_LOG) Setting up apps' preferences... {TODO}"