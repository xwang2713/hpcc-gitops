# cluster-config-management
Configuration as code for Kubernetes Cluster.
This is part of Google Anthos.

Anthos Config Management: https://cloud.google.com/anthos-config-management/docs

config-management-operator.yaml is provided by Google Anthos, an open source project under Apache 2 license

To download the latest manifest: gsutil cp gs://config-management-release/released/latest/config-management-operator.yaml config-management-operator.yaml


```console
kubectl apply -f config-management-operator.yaml
kubectl get pods -n kube-system

kubectl apply -f config-management.yaml
kubectl get pods -n config-management-system

#Wait several sec and check
```


