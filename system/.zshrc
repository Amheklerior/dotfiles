
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
alias sdot="source ~/.zshrc"


### HOMEBREW 

# set PATH, MANPATH, etc. for Homebrew
# NOTE: should be moved to the .zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# bypass the Gatekeeper for cask apps
export HOMEBREW_CASK_OPTS="--no-quarantine"

# the filepath to the Brewfile
export HOMEBREW_BUNDLE_FILE="$DOTFILES/install/Brewfile"

# shortcut to reset the system, aligning it with the original Brewfile
alias breset="brew bundle install --file=$HOMEBREW_BUNDLE_FILE && brew bundle cleanup --file=$HOMEBREW_BUNDLE_FILE"

# create a list of currently installed software in the `Brewfile`.
# --force: overrides a previously created `Brewfile`.
# --describe: adds descriptive comments (for formulae and cask only).
#
# NOTE: using a separate brewfile for dumping the current list of packages/apps, 
# as I want to keep direct control over what gets inside the actual Brewfile
alias bdump="brew bundle dump --force --describe --file=$HOMEBREW_BUNDLE_FILE.dump"


### PATHS

# ensure unique values for the path array
typeset -U path fpath

# add homebrew site functions to the FPATH
# NOTE: it was already present, moved it at the top of the list.
fpath=(
  "$(brew --prefix)/share/zsh/site-functions"
  $fpath
)


### PROMPT

# load the completion functions and initialize the completion system.
# -z: first unload any preloaded completion function.
autoload -Uz compinit && compinit

# load starship
eval "$(starship init zsh)"

# setup zsh autouggestions
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# setup zsh syntax highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


### SHELL UTILS

# load zoxide
eval "$(zoxide init zsh)"

# dropin replacement of cd
alias cd="z"


# setup bat color theme
export BAT_THEME=gruvbox-dark

# setup bat as man pager
export MANPAGER="sh -c 'col -bx | bat --language=man --style=plain'"
# ...only if you experience formatting issues with man pages
# export MANROFFOPT="-c"

# integrate bat to the -h and --help command options
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# dropin replacement of cat 
alias cat="bat"

# integrate syntax highlighting to the tail command
alias watch="tail -f $1 | bat --paging=never -l log"

# preview and set a bat theme
setbat() {
  export BAT_THEME=$(bat --list-themes | fzf --preview="bat --theme={} --color=always $HOME/.zshrc")
}


# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# customise default command behaviour, to search files only
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# call fzf with a content previewer, using bat for syntax highlighting
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"


# exa shortcuts
alias ls="exa --all --oneline --classify --group-directories-first --icons"
alias ll="exa --all --long --classify --header --group --group-directories-first --icons"
alias ld="ls --only-dirs"
alias lld="ll --only-dirs"
alias tree="exa --tree --all --classify --icons --group-directories-first --git-ignore"
alias t2="tree -L2"
alias t4="tree -L4"


# ripgrep shortcuts
alias grep="rg"
alias rg="rg --colors=match:fg:green"


### DEV 

# git shortcuts
alias gf='git fetch --all'
alias gco='git checkout'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph -10'

# set personal git account name/email 
gpconf() {
	git config user.name "Amheklerior"
	git config user.email "49590425+Amheklerior@users.noreply.github.com"
}

# set work git account name/email 
gwconf() {
	git config user.name "Andrea Amato"
	git config user.email "andrea.amato@moneyfarm.com"
}
