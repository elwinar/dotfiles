set -x GOPATH $HOME/.go
set -x GOPRIVATE github.com/aivetech
set -x KUBECTL_EXTERNAL_DIFF kubectl-neat-diff

# add_to_path $HOME/.go/bin
# add_to_path $HOME/.npm/bin
add_to_path $HOME/bin

set -gx PNPM_HOME "$HOME/.local/share/pnpm"
add_to_path $PNPM_HOME
add_to_path $PNPM_HOME/bin

mise activate fish | source
