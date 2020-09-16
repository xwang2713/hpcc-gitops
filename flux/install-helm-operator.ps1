# Install Helm Operator
helm upgrade -i helm-operator fluxcd/helm-operator `
	    --namespace flux `
	    --set helm.versions=v3
