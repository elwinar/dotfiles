# Ensure the path isn't clutered in case of tty imbrication (tmux & co)
if set -q ORIGINAL_PATH
  	set PATH $ORIGINAL_PATH
else
  	set -gx ORIGINAL_PATH $PATH
end

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

# Additions to the PATH
set -x PATH ~/.local/bin $PATH

# Ensure the fish shell doesn't fuckup with colors
set fish_term24bit 1

# Import the aliases
. (dirname (status -f))/aliases.fish

# Find and source a per-host configuraiton file
if test -e (dirname (status -f))/host.d/(hostname).fish
	. (dirname (status -f))/host.d/(hostname).fish
end
