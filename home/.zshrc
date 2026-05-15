# ensure unique values for the path and fpath arrays
typeset -U path fpath

# set PATH, MANPATH, FPATH, etc. for Homebrew.
# WARN: must be placed before compinit so Homebrew-installed completions in
#  $HOMEBREW_PREFIX/share/zsh/site-functions are visible to the completion system.
eval "$(/opt/homebrew/bin/brew shellenv)"

# initialize completion system (compinit)
source "$XDG_CONFIG_HOME/zsh/completion.zsh"

# setup zsh in-line ghost suggestions
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# setup zsh keybindings
source "$XDG_CONFIG_HOME/zsh/keybindings.zsh"

# load tools
source "$XDG_CONFIG_HOME/zsh/starship.zsh"
source "$XDG_CONFIG_HOME/zsh/bat.zsh"
source "$XDG_CONFIG_HOME/zsh/fzf.zsh"
source "$XDG_CONFIG_HOME/zsh/fzf-tab.zsh"
source "$XDG_CONFIG_HOME/zsh/fnm.zsh"
source "$XDG_CONFIG_HOME/zsh/go.sh"
source "$XDG_CONFIG_HOME/zsh/tirith.zsh"
source "$XDG_CONFIG_HOME/zsh/zoxide.zsh"

# setup zsh syntax highlighting
# WARN: must be loaded after all tools that register ZLE widgets (e.g. fzf-tab)
# see: https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# load custom aliases
source "$HOME/.zalias"

# load work-specific shell configurations if any
[ -f "$HOME/.zwork" ] && source "$HOME/.zwork"