# ------------------------------------------------------------------------------
# HOMEBREW SETUP
# ------------------------------------------------------------------------------

# bypass the MacOS Gatekeeper for cask apps
export HOMEBREW_CASK_OPTS="--no-quarantine"

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
export editor=nvim
export git_editor=nvim
