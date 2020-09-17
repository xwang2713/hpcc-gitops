## Introduction
https://github.com/fluxcd/flux


## Get Started

###Setup environment

On Windows
```console
./setup.ps1
```

On Unix
```console
./setup.sh

```
###Select github repo for the deploy
Edit github(.psm1) for the github project.
We provide a sample project https://github.com/xwang2713/flux-hpcc-cluster.
You can fork and clone it for your project.

Current github.psm1 github_path points to "hpcc/local/default" which will start a default kubernetescluster on Docker Desktop.

On Windows
###Start flux and helm controller
```console
./install-flux.ps1
```
On Unix
###Start flux and helm controller
```console
./install-flux.sh
```

Make sure run
```console
fluxctl identity --k8s-fwd-ns flux
```
And add the output to your github project by following the instruction

You can verify the cluster
```console
kubectl get pod
```
### Stop flux and helm controller

```console
helm uninstall flux helm-controller -n flux
```

Also you need manually stop HPCC cluster and related resources. 
Here is a cleanup script for reference


