# ------------------------------------------------------------------------------
#
#    WARN: order is important!
#
# - the completion system must initialize after the $FPATH is fully populated.
#   homebrew and dev tools adds directories to fpath to make completion functions
#   available (see: completion.zsh)
#
# - zoxide created a wrapper around the `cd` command, so it's important no other
#   tool tamper with the chpwd functions after zoxide.
#
# - zsh syntax highliting must be setup last to make sure all ZLE widgets have
#   been registered by preceeding tools.
#   see: https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
#
# ------------------------------------------------------------------------------

# ensure unique values for the path and fpath arrays
typeset -U path fpath

# set PATH, MANPATH, FPATH, etc. for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# setup shell
ZDIR="$XDG_CONFIG_HOME/zsh"
source "$ZDIR/dev.zsh"
source "$ZDIR/completion.zsh"
source "$ZDIR/keybindings.zsh"
source "$ZDIR/starship.zsh"
source "$ZDIR/tirith.zsh"
source "$ZDIR/bat.zsh"
source "$ZDIR/fzf.zsh"
source "$ZDIR/fzf-tab.zsh"
source "$ZDIR/zoxide.zsh"
source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
unset ZDIR

# load custom aliases
source "$HOME/.zalias"

# load work-specific shell configurations if any
[ -f "$HOME/.zwork" ] && source "$HOME/.zwork"
