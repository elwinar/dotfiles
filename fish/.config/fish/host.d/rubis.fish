set -x MONOPOLY $HOME/development/monopoly
set -x GOPATH $HOME/.go
set -x USER_ID (id -u)
set -x AGENT_NAPOLEON_URL http://127.0.0.1
set -x AGENT_DEVELOPMENT true
set -x GITLAB_PRIVATE_TOKEN "v3UnCorkiDzstoB25j_d"
set -x SYNTHESIO_PASSWORD_STORE_DIR $HOME/development/passwords

add_to_path $HOME/.go/bin
add_to_path $HOME/.cargo/bin
add_to_path $HOME/.gem/ruby/2.5.0/bin
add_to_path $HOME/.config/composer/vendor/bin

set -x XDG_CURRENT_DESKTOP Unity
