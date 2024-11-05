.PHONY: settings

.DEFAULT_GOAL := settings


settings: prompt
	echo "$(SETTINGS_LOG) Setting up system and apps preferences... (IN PROGRESS)"
	$(DOTFILES)/prefs/macos/defaults.sh
	echo "$(SETTINGS_LOG) Done! You may want to restart now"