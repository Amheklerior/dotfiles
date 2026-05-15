# ------------------------------------------------------------------------------
# GO DEV ENV
# ------------------------------------------------------------------------------

# make go installed tools globally available in PATH
export GOPATH="${GOPATH:-$HOME/go}"
path+=("$GOPATH/bin")

# ------------------------------------------------------------------------------
# NODE DEV ENV
# ------------------------------------------------------------------------------

# setup fnm as Node.js version management tool
eval "$(fnm env --use-on-cd)"
