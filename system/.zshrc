### SHELL PROMPT 

# load the completion functions and initialize the completion system.
# -z: first unload any preloaded completion function.
autoload -Uz compinit && compinit

# load starship
eval "$(starship init zsh)"

# setup zsh autouggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# setup zsh syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### ZOXIDE

# load zoxide
eval "$(zoxide init zsh)"


### BAT

# setup bat color theme
export BAT_THEME=gruvbox-dark

# setup bat as man pager
export MANPAGER="sh -c 'col -bx | bat --language=man --style=plain'"
# ...only if you experience formatting issues with man pages
# export MANROFFOPT="-c"

# integrate bat to the `-h` and `--help` command options
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'


### FZF

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# customise default command behaviour, to search files only
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# call fzf with a content previewer, using bat for syntax highlighting
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"


### NODE

# setup fnm env vars 
# --use-on-cd: automatically run fnm use when a directory contains a `.node-version` or `.nvmrc` file
eval "$(fnm env --use-on-cd)"

# define the root directory for node installations
export FNM_DIR="$HOME/.fnm"

# enable corepack support for each new installation (ie. corepack enable)
export FNM_COREPACK_ENABLED="true"

# resolve `engines.node` field in `package.json` whenever a `.node-version`/`.nvmrc` file is not present
export FNM_RESOLVE_ENGINES="true"


### ALIASES & FUNCTIONS

source $HOME/.zalias
source $HOME/.zfunc