function kdiff
	kustomize build $argv | kubectl diff -f -
end
