set -x PASSWORD_STORE_DIR ~/passwords
set -x GOPATH $HOME/.go
add_to_path $GOPATH/bin
set -x MOZ_ENABLE_WAYLAND 1

# Synthesio-related env.
set -x AGENT_NAPOLEON_URL http://127.0.0.1
set -x AGENT_DEVELOPMENT true
set -x ENVDIR $HOME/development/synthesio/env
