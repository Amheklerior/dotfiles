# ------------------------------------------------------------------------------
# HOMEBREW SETUP
# ------------------------------------------------------------------------------

# set the global path for the homebrew bundle file
export HOMEBREW_BUNDLE_FILE_GLOBAL="$HOME/.config/homebrew/Brewfile"

# set PATH, MANPATH, etc. for Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# ------------------------------------------------------------------------------
# OTHER CONFIGURATION
# ------------------------------------------------------------------------------

# ensure unique values for the path and fpath arrays
typeset -U path fpath

# add go binaries to the path
path+=("$(go env GOPATH)/bin")

# make neovim the default editor
export EDITOR=nvim
export GIT_EDITOR=nvim
