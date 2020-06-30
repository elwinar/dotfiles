set -x PASSWORD_STORE_DIR ~/passwords
set -x GOPATH $HOME/.go
add_to_path $GOPATH/bin
set -x MOZ_ENABLE_WAYLAND 1

set -x STO_STDCOMPOSEFILE  $HOME/development/synthesio/standard/docker-compose.yml
set -x STO_STDPATH $HOME/development/synthesio/standard
set -x STO_STDDIRNAME standard
set -x AGENT_NAPOLEON_URL http://127.0.0.1
set -x AGENT_DEVELOPMENT true
