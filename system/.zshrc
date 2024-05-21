
### DOTFILES

# path to the dotfiles repo
export DOTFILES="$HOME/.dotfiles"

# reset dotfiles
# -R/--restow: equivalent to unstow && stow
alias rdot="stow -R -d $DOTFILES/system -t $HOME"

# cd into dotfiles
alias cdot="cd $DOTFILES"

# edit dotfiles
alias edot="$EDITOR $DOTFILES"

# source dotfiles
alias sdot="source ~/.zshenv ~/.zprofile ~/.zshrc"


### HOMEBREW 

# Set PATH, MANPATH, etc. for Homebrew
# NOTE: should be moved to the .zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Bypass the Gatekeeper for cask apps
export HOMEBREW_CASK_OPTS="--no-quarantine"

# The filepath to the Brewfile
export HOMEBREW_BUNDLE_FILE="$DOTFILES/install/Brewfile"

# Shortcut to reset the system, aligning it with the original Brewfile
alias breset="brew bundle install --file=$HOMEBREW_BUNDLE_FILE && brew bundle cleanup --file=$HOMEBREW_BUNDLE_FILE"

# Command to create a list of currently installed software in the `Brewfile`.
# the --force flag let us override a previously created `Brewfile`.
# the --describe flag adds descriptive comments (for formulae only).
#
# NOTE: using a separate brewfile for dumping the current list of packages/apps, 
# as I want to keep direct control over what gets inside the actual Brewfile
alias bdump="brew bundle dump --force --describe --file=$HOMEBREW_BUNDLE_FILE.dump"


### PATHS

# Ensure unique values for the path array
typeset -U path fpath

# Add homebrew site functions to the FPATH
# NOTE: it was already present, moved it at the top of the list.
fpath=(
  "$(brew --prefix)/share/zsh/site-functions"
  $fpath
)


### PROMPT

# Load the completion functions and initialize the completion system.
# -z first unload any preloaded completion function.
autoload -Uz compinit && compinit

# Load starship
eval "$(starship init zsh)"

# Setup zsh autouggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup zsh syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### SHELL UTILS

# Load zoxide
eval "$(zoxide init zsh)"

# dropin replacement of cd
alias cd="z"
