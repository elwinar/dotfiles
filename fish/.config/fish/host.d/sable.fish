# Use UTF8
set -x LANG en_US.UTF-8

# Use nvim for mostly anything.
set -x EDITOR      helix
set -x VISUAL      helix
set -x SUDO_EDITOR helix
set -x FCEDIT      helix

# XDG default values
set -x XDG_DATA_HOME   $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME  $HOME/.local/state
set -x XDG_CACHE_HOME  $HOME/.cache

# Overrides to force some softwares to respect XDG
# set -x WS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
# set -x AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -x HISTFILE $XDG_STATE_HOME/bash/history
set -x DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -x GNUPGHOME $XDG_DATA_HOME/gnupg
set -x LESSHISTFILE $XDG_CACHE_HOME/less/history
alias mitmproxy="mitmproxy --set confdir=$XDG_CONFIG_HOME/mitmproxy" 
set -x PSQL_HISTORY $XDG_DATA_HOME/psql_history
set -x PYENV_ROOT $XDG_DATA_HOME/pyenv
set -x VOLTA_HOME $XDG_DATA_HOME/volta

# Ensure the fish shell doesn't fuckup with colors
set fish_term24bit 1

set -x GOPATH $XDG_DATA_HOME/go
set -x GO111MODULE on
add_to_path $GOPATH/bin
set -x GOPRIVATE github.com/aivetech
add_to_path $HOME/bin
add_to_path $VOLTA_HOME/bin

set -x KUBECTL_EXTERNAL_DIFF kubectl-neat-diff
set -x AWS_PROFILE staging
set -x TOKEN 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
set -x AWS_SSH_KEY ~/.ssh/aws.pem
set -x ENVS ~/development/envs
set -x PAYLOADS ~/development/payloads
