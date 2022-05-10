set -x GOPATH $HOME/.go
set -x GO111MODULE on
add_to_path $HOME/.go/bin
set -x GOPRIVATE github.com/aivetech
add_to_path $HOME/.npm/bin
set -x AWS_PROFILE staging
add_to_path $HOME/.local/bin
