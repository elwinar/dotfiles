function kapply
	kustomize build $argv | kubectl apply -f -
end
