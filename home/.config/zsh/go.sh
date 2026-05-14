# ------------------------------------------------------------------------------
# GO SETUP
# ------------------------------------------------------------------------------
# setup Go toolchain by adding Go-installed binaries to the PATH.
#
# NOTE: the documented default GOPATH is used here instead of calling `go env GOPATH`
#  to avoid spawning a Go process on every shell start, and thus speeding up startup.
#
# see: https://go.dev
# ------------------------------------------------------------------------------

export GOPATH="${GOPATH:-$HOME/go}"
path+=("$GOPATH/bin")
