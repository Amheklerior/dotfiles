# ------------------------------------------------------------------------------
# SHELL PROMPT
# ------------------------------------------------------------------------------

# load the completion functions and initialize the completion system.
# -z: first unload any preloaded completion function.
autoload -Uz compinit && compinit

# load starship customized prompt
eval "$(starship init zsh)"

# load security layer to intercept suspicious commands
eval "$(tirith init)"

# integrate fuzzy search on tab autocompletion
source "$SHELL_PLUGINS/fzf-tab/fzf-tab.plugin.zsh"

# setup zsh shell commands in-line suggestions
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# setup zsh syntax highlighting
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Consider the following chars word-separators
export WORDCHARS="*?[]~=&;!#$%^(){}<>"

# improve history up/down traversal to limit results on the current shell input
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# Allow moving back and forth across words with option+left/right
# NOTE: Ghostty terminal emulator uses lowercase chars (while others use uppercase chars)
bindkey '^[b' backward-word
bindkey '^[f' forward-word

# Delete word by word with option+delete
bindkey '^[^?' backward-kill-word

# ------------------------------------------------------------------------------
# ZOXIDE SETUP
# ------------------------------------------------------------------------------

# load zoxide
# NOTE: replace built-in `cd` shell command
eval "$(zoxide init zsh --cmd cd)"

# ------------------------------------------------------------------------------
# BAT SETUP
# ------------------------------------------------------------------------------

# setup bat color theme
export BAT_THEME=gruvbox-dark

# setup bat as man pager
export MANPAGER="sh -c 'col -bx | bat --language=man --style=plain'"
# ...only if you experience formatting issues with man pages
# export MANROFFOPT="-c"

# integrate bat to the `-h` and `--help` command options
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# ------------------------------------------------------------------------------
# FZF SETUP
# ------------------------------------------------------------------------------

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# customise default command behaviour, to search files only
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# call fzf with a content previewer, using bat for syntax highlighting
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# ------------------------------------------------------------------------------
# NODE
# ------------------------------------------------------------------------------

# define the root directory for node installations
export FNM_DIR="$HOME/.fnm"

# resolve `engines.node` field in `package.json` whenever a `.node-version`/`.nvmrc` file is not present
export FNM_RESOLVE_ENGINES="true"

# setup fnm env vars
# --use-on-cd: automatically run fnm use when a directory contains a `.node-version` or `.nvmrc` file
eval "$(fnm env --use-on-cd)"

# ------------------------------------------------------------------------------
# OTHER
# ------------------------------------------------------------------------------

# load custom aliases
source "$HOME/.zalias"

# load work-specific shell configurations if any
if [ -e "$HOME/.zwork" ]; then source "$HOME/.zwork"; fi
