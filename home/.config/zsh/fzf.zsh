# ------------------------------------------------------------------------------
# FZF SETUP
# ------------------------------------------------------------------------------
# setup fzf for fuzzy finding, with shell bindings and file previews.
#
# see: https://github.com/junegunn/fzf
# ------------------------------------------------------------------------------

# set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# default command for standalone `fzf` invocations
# NOTE: used also by fzf-tab to provide seamless experience (see fzf-tab.zsh)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --no-ignore --exclude .git --strip-cwd-prefix'

# common styling applied to every fzf invocation
export FZF_DEFAULT_OPTS="--layout=reverse --border=rounded --info=inline"

# Ctrl-T (files): same scope as the default, with a syntax-highlighted
# preview on the side
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window=right:60%"

# Ctrl-R (history): compact window, no preview.
export FZF_CTRL_R_OPTS="--height=30%"

# Alt-C (directories): all dirs including hidden and gitignored (excluding .git),
# with an `ls`-style preview on the side
export FZF_ALT_C_COMMAND='fd --type d --hidden --no-ignore --exclude .git --strip-cwd-prefix'
export FZF_ALT_C_OPTS="--height=70% --preview 'eza --all --oneline --classify --group-directories-first --icons {}' --preview-window=right:60%"
