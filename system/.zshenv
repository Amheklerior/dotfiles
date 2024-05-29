# my personal and work dirs
export PERSONAL="$HOME/personal"
export WORK="$HOME/work"

# path to the dotfiles repo
export DOTFILES="$HOME/.dotfiles"

# path to the original dotfiles backup dir
export BACKUP="$HOME/backup"

# path to the bin folder
export BIN="$DOTFILES/bin"

# ensure unique values for the path and fpath arrays
typeset -U path fpath

# add custom binaries to the path
path=(
  $BIN
  $path
)


### FUNCTIONS

# restore the original system dotfiles from backup
# TODO: could pass the items as arguments
restore_from_backup() {
  local items = ".zshrc .zprofile .zshenv .ssh .gitconfig starship.toml"
  for item in $items; do
		if [ -f "$BACKUP_DIR/$item" ]; then
			mv -f $BACKUP_DIR/$item $HOME/$item
		fi
		if [ -d "$BACKUP_DIR/$item" ]; then
			mkdir -p $HOME/$item && mv -f $BACKUP_DIR/$item/* $HOME/$item
		fi
	done
}
