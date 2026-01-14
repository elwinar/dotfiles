set -x GOPATH $HOME/.go
set -x GOPRIVATE github.com/aivetech
set -x KUBECTL_EXTERNAL_DIFF kubectl-neat-diff

# add_to_path $HOME/.go/bin
# add_to_path $HOME/.npm/bin
add_to_path $HOME/bin

proto activate fish | source
