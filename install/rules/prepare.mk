.PHONY: prepare sys-check backup

.DEFAULT_GOAL := prepare


prepare: prompt sys-check backup

# check whether it's running on a macos system (the only supported so far)
sys-check: 
	echo "$(PREPARE_LOG) checking system os..."
	if [[ "$(SYSTEM)" == "Darwin" ]]; then \
		echo "$(PREPARE_LOG) sys-check: OK!"; \
	else \
		echo "$(PREPARE_LOG) sys-check: KO! It only works on Apple Silicon MacOS systems" && exit 1; \
	fi

# move any file/dir which is NOT a symlink into the backup directory
backup: 
	if [[ ! -e $(BACKUP_DIR)/.config ]]; then \
		echo "$(PREPARE_LOG) creating backup for current dotfiles..."; \
		mkdir -p $(BACKUP_DIR)/.config; \
		for item in $(STOW_ITEMS); do \
			if [[ -e "${HOME}/$$item" ]] && [ ! -L "${HOME}/$$item" ]; then \
				mv -f ${HOME}/$$item $(BACKUP_DIR); \
			fi; \
		done; \
	else \
		echo "$(PREPARE_LOG) Skipping backup. Aldready done"; \
	fi
