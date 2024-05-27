.PHONY: link unlink

.DEFAULT_GOAL := link


link: stow
	echo "$(STOW_LOG) symlink dotfiles..."
	stow -d $(DOTFILES)/system -t ${HOME} .

unlink: stow
	echo "$(STOW_LOG) unlink dotfiles..."
	stow -D -d $(DOTFILES)/system -t ${HOME} .
