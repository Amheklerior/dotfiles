.PHONY: dotfiles link source

.DEFAULT_GOAL := dotfiles


dotfiles: setdir link source

# create directories to let stow symlink their content individually,
# rather than the entire dir.
setdir:
	if [ ! -e ${HOME}/.config ]; then \
		mkdir ${HOME}/.config; \
	fi
	if [ ! -e ${HOME}/.ssh ]; then \
		mkdir ${HOME}/.ssh; \
	fi


link: stow
	echo "$(STOW_LOG) symlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} .

source:
	echo "$(STOW_LOG) source dotfiles..."
	source ${HOME}/.z{shenv,profile,shrc}