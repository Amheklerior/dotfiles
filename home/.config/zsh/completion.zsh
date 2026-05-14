# ------------------------------------------------------------------------------
# COMPLETION SYSTEM SETUP
# ------------------------------------------------------------------------------
# Initialize the zsh completion systemn (compsys) for tab-completion.
#
# compsys is zsh's completion system in which each <command> is matched with a
# `_<command>` completion function. `compinit` is the entrypoint that bootstraps
# it. It finds and registers all `_*` completion functions by walking every
# directory in $FPATH, performs some security checks to avoid hostile `_foo`
# functions injection, and writes a cache file (default: ~/.zcompdump). The
# cache file holds the mapping of commands -> completion function, so subsequent
# `compinit -C` calls can load it directly (skipping FPATH dirs traversal, and
# security checks) speeding up shell startup.
# 
# NOTE: the cache file is compiled to bytecode so `compinit -C` calls can skip
#  the parser too in reading its content.
#
# WARN: it must be sourced after all tools (like homebrew) have populated FPATH.
#
# ------------------------------------------------------------------------------

autoload -Uz compinit
zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"

# NOTE: fast-track initialization if the dump file has less than 24h.
if [[ -n $zcompdump(#qN.mh+24) ]]; then
  compinit
  [[ ! -f $zcompdump.zwc || $zcompdump -nt $zcompdump.zwc ]] && zcompile $zcompdump
else
  compinit -C
fi

unset zcompdump
