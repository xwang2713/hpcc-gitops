
helm uninstall flux helm-operator -n flux
helm uninstall hpcc elasticsearch filebeat kibana

$pvc=$(kubectl get pvc | select-string -pattern "elastic"| ForEach-Object { $_ -replace '\s\s+',' '} | ForEach-Object { $_.split(' ')[0] })
kubectl delete pvc $pvc
