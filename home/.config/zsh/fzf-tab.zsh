# ------------------------------------------------------------------------------
# FZF-TAB SETUP
# ------------------------------------------------------------------------------
# integrate fuzzy search on tab autocompletion with fzf-tab.
#
# WARN: must be placed after compinit in ~/.zshrc
#
# see: https://github.com/Aloxaf/fzf-tab
# ------------------------------------------------------------------------------

# load the plugin
source "$SHELL_PLUGINS/fzf-tab/fzf-tab.plugin.zsh"

# inherit common styling from FZF_DEFAULT_OPTS (set in fzf.zsh)
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# binding-specific window sizing & preview placement
zstyle ':fzf-tab:*' fzf-flags --height=50%
zstyle ':fzf-tab:*' fzf-preview-window 'right:60%'

# show preview for commands that may complete in a file/directory
zstyle ':fzf-tab:complete:(cat|bat|less|more|head|tail|nvim|vim|v|e|nano|cd|ls|ll|lld|llf|eza|tree|t|t2|t4):*' \
  fzf-preview '
    if [[ -d $realpath ]]; then
      eza --all --oneline --classify --group-directories-first --icons --color=always -- $realpath
    elif [[ -f $realpath ]]; then
      bat --color=always --style=numbers --line-range=:500 -- $realpath
    fi
  '

# show preview for git refs (branches, tags, commits)
zstyle ':fzf-tab:complete:git-(checkout|switch|log|show|diff):*' \
  fzf-preview 'git log --oneline --graph --color=always -20 $word'
