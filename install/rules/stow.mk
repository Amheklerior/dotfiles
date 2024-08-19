.PHONY: dotfiles link source

.DEFAULT_GOAL := dotfiles


dotfiles: setdir link source

# create directories to let stow symlink their content individually,
# rather than the entire dir.
# NOTE: The .ssh/ dir should already be present with the ssh key pairs in it
setdir:
	if [[ ! -e ${HOME}/.config ]]; then \
		echo "$(STOW_LOG) Creating the ~/.config dir" && \
		mkdir ${HOME}/.config; \
	fi

link: stow
	echo "$(STOW_LOG) symlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} .

source:
	echo "$(STOW_LOG) source dotfiles..."
	source ${HOME}/.z{shenv,profile,shrc}