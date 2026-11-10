# ------------------------------------------------------------------------------
# DOCKER SETUP
# ------------------------------------------------------------------------------
# docker engine runs inside a lightweight Linux VM managed by colima. The VM is
# started on demand (no login service), using Apple's virtualization framework
# with Rosetta enabled to run amd64 images as well.
#
# NOTE: VM settings are persisted by colima on first start; changing the disk
# size later requires recreating the VM (`colima delete`).
#
# see: https://github.com/abiosoft/colima
# ------------------------------------------------------------------------------

# expose the colima socket to tools that ignore docker contexts (testcontainers, IDEs)
# NOTE: colima keeps its state under $XDG_CONFIG_HOME/colima when that var is set
export DOCKER_HOST="unix://$XDG_CONFIG_HOME/colima/default/docker.sock"

# start/stop/inspect the docker VM
alias dstart="colima start --vm-type vz --vz-rosetta --cpu 2 --memory 4 --disk 60"
alias dstop="colima stop"
alias dstatus="colima status"
