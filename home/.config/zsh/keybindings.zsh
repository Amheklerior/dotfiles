# ------------------------------------------------------------------------------
# KEYBINDINGS SETUP
# ------------------------------------------------------------------------------
# Emacs-style keybindings with one tweak: Up/Down search history filtered by
# whatever is already on the line, instead of just stepping through entries.
#
# NOTE: -e is explicit because zsh would otherwise auto-pick vi-mode from
# $EDITOR being set to "nvim".
# ------------------------------------------------------------------------------

bindkey -e

bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
