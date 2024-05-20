
# Ensure unique values for the path array
typeset -U path fpath

# Add site-functions to the path
fpath=(
  "$HOMEBREW_PREFIX/share/zsh/site-functions",
  $fpath,
)

# Load the completion functions and initialize the completion system.
# -z first unload any preloaded completion function.
autoload -Uz compinit && compinit

# Setup zsh autouggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup zsh syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
