.PHONY: settings

.DEFAULT_GOAL := settings


settings:
	echo "$(SETTINGS_LOG) Do you want to set up system and apps preferences? (y/n)" && read -r REPLY; \
	if [[ $$REPLY != "y" && $$REPLY != "Y" ]]; then \
		echo "$(SETTINGS_LOG) Skipping settings"; \
		exit 0; \
	fi; \
	echo "$(SETTINGS_LOG) Setting up system and apps preferences... (IN PROGRESS)"; \
	$(DOTFILES)/prefs/macos/defaults.sh; \
	echo "$(SETTINGS_LOG) Done! You may want to restart now"