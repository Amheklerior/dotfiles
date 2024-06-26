# make nvim the default editor
export EDITOR=nvim
export GIT_EDITOR=nvim

# bypass the Gatekeeper for cask apps
export HOMEBREW_CASK_OPTS="--no-quarantine"

# path to the Brewfile
export HOMEBREW_BUNDLE_FILE="$DOTFILES/install/bundles/Brewfile"

# set PATH, MANPATH, etc. for Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# add homebrew site functions to the FPATH
# NOTE: it was already present, moved it at the top of the list.
fpath=(
  "$(brew --prefix)/share/zsh/site-functions"
  $fpath
)

# add vs code cli (code) to the path
# NOTE: it's already added if vscode is installed via homebrew, hence
# should only be necessary when vscode is installed via UI
path=(
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  "$(go env GOPATH)/bin"
)
