set -x XDG_CURRENT_DESKTOP Unity
set -x BROWSER firefox-developer-edition
set -x MOZ_ENABLE_WAYLAND 1

set -x GOPATH $HOME/.go
set -x GOPRIVATE synthesio/\*,gitlab.synthesio.com/\*
set -x GO111MODULE on

add_to_path $HOME/.go/bin
add_to_path $HOME/.cargo/bin
add_to_path $HOME/.gem/ruby/2.5.0/bin
add_to_path $HOME/.gem/ruby/2.7.0/bin
add_to_path $HOME/.config/composer/vendor/bin
add_to_path $HOME/.npm/bin

# Configuration for Synthesio-related tools.
set -x SYNTHESIO_PASSWORD_STORE_DIR $HOME/development/passwords
set -x GITLAB_PRIVATE_TOKEN "v3UnCorkiDzstoB25j_d"
# Monorepository cache paths overrides.
set -x SYNTHESIO_GO_PATH $GOPATH
# Environment defaults for services (ensure we don't leak to consul.)
set -x AGENT_NAPOLEON_URL http://127.0.0.1
set -x AGENT_DEVELOPMENT true
# Legacy standard path
set -x STO_STDPATH $HOME/development/standard
# Security API token
set -x FIDGITY_HEADER ewogICAgIm1hcHBpbmdzIjogewogICAgICAgICJzeW50aGVzaW9hcHAiOiB7CiAgICAgICAgICAgICJjbGllbnRfaWQiOiAiNDExMiIsCiAgICAgICAgICAgICJhY2NvdW50X2lkIjogIjIxMTIiCiAgICAgICAgfQogICAgfSwKICAgICJwcm92aWRlcl9pZCI6ICJmbGVtaW5nVjIiLAogICAgInNjb3BlcyI6IFsKICAgICAgICAiaW50ZXJuYWwiCiAgICBdCn0=
set -x ENV ~/development/env
# Frontend CHNZ tool-related
set -x CHNZ_GITLAB_DEFAULT_GROUP frontend


