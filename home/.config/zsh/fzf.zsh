# ------------------------------------------------------------------------------
# FZF SETUP
# ------------------------------------------------------------------------------
# setup fzf for fuzzy finding, with shell bindings and file previews.
#
# see: https://github.com/junegunn/fzf
# ------------------------------------------------------------------------------

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# customise default command behaviour, to search files only
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# call fzf with a content previewer, using `bat` for syntax highlighting
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}'"
