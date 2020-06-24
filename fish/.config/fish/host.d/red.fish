set -x MONOPOLY $HOME/development/monopoly
set -x GOPATH $HOME/.go
set -x NODE_PATH $HOME/.node

set -x MOZ_ENABLE_WAYLAND 1

add_to_path $HOME/.go/bin
add_to_path $HOME/.cargo/bin
add_to_path $HOME/.gem/ruby/2.5.0/bin
add_to_path $HOME/.config/composer/vendor/bin

set -x STO_STDCOMPOSEFILE  $HOME/development/standard/docker-compose.yml
set -x STO_STDPATH $HOME/development/standard
set -x STO_STDDIRNAME standard
set -x USER_ID (id -u)
set -x AGENT_NAPOLEON_URL http://127.0.0.1
set -x AGENT_DEVELOPMENT true

set -x GITLAB_PRIVATE_TOKEN "v3UnCorkiDzstoB25j_d"

set -x XDG_CURRENT_DESKTOP Unity
