# load the completion functions and initialize the completion system.
# -z: first unload any preloaded completion function.
autoload -Uz compinit && compinit

# integrate fuzzy search on tab autocompletion
source "$SHELL_PLUGINS/fzf-tab/fzf-tab.plugin.zsh"

# setup zsh in-line ghost suggestions
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# setup zsh syntax highlighting
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Consider the following chars word-separators
export WORDCHARS="*?[]~=&;!#$%^(){}<>"

# Allow moving back and forth across words with option+left/right
# NOTE: Ghostty terminal emulator uses lowercase chars (while others use uppercase chars)
bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Delete word by word with option+delete
bindkey '^[^?' backward-kill-word

# improve history up/down traversal to limit results on the current shell input
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# load tools
source "$XDG_CONFIG_HOME/zsh/starship.zsh"
source "$XDG_CONFIG_HOME/zsh/zoxide.zsh"
source "$XDG_CONFIG_HOME/zsh/bat.zsh"
source "$XDG_CONFIG_HOME/zsh/fzf.zsh"
source "$XDG_CONFIG_HOME/zsh/fnm.zsh"
source "$XDG_CONFIG_HOME/zsh/tirith.zsh"

# load custom aliases
source "$HOME/.zalias"

# load work-specific shell configurations if any
if [ -e "$HOME/.zwork" ]; then source "$HOME/.zwork"; fi
