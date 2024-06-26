.PHONY: prepare sys-check backup

.DEFAULT_GOAL := prepare


prepare: sys-check backup

# check whether it's running on a macos system (the only supported so far)
sys-check: 
	echo "$(PREPARE_LOG) check system os..."
	if [ "$(SYSTEM)" == "Darwin" ]; then \
		echo "sys-check: OK!"; \
	else \
		echo "sys-check: KO! It only works on macos" && exit 1; \
	fi

# move any file/dir which is NOT a symlink into the backup directory
backup: 
	echo "$(PREPARE_LOG) backup currently present dotfiles..."
	mkdir -p $(BACKUP_DIR)/.config
	for item in $(STOW_ITEMS); do \
		if [ -e "${HOME}/$$item" ] && [ ! -L "${HOME}/$$item" ]; then \
			mv -f ${HOME}/$$item $(BACKUP_DIR); \
		fi; \
	done
