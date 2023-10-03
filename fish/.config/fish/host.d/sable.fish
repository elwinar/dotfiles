set -x GOPATH $XDG_DATA_HOME/go
set -x GO111MODULE on
add_to_path $GOPATH/bin
set -x GOPRIVATE github.com/aivetech
add_to_path $HOME/bin

set -x KUBECTL_EXTERNAL_DIFF kubectl-neat-diff
set -x AWS_PROFILE staging
set -x TOKEN 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
