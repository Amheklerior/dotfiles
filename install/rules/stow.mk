.PHONY: dotfiles link source

.DEFAULT_GOAL := dotfiles


dotfiles: link source

link: stow
	echo "$(STOW_LOG) symlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} .

source:
	echo "$(STOW_LOG) source dotfiles..."
	source ${HOME}/.z{shenv,profile,shrc}