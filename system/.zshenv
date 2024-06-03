# XDG Base Directory Spec:
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="$HOME/.local/runtime"

# my personal and work dirs
export PERSONAL="$HOME/personal"
export WORK="$HOME/work"

# path to the dotfiles repo
export DOTFILES="$HOME/.dotfiles"

# path to the original dotfiles backup dir
export BACKUP="$HOME/backup"

# path to the bin folder
export BIN="$HOME/bin"

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
