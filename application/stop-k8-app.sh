# Delete the applicaiton
#
kubectl delete -n nodetestnamespace -f nodetest-deployment.yaml
kubectl delete -n nodetestnamespace -f nodetest-service.yaml
#
kubectl get svc,nodes,pods -n nodetestnamespace
#
kubectl get svc,nodes,pods -n nodetestnamespace
kubectl delete all --all -n nodetestnamespace
kubectl get svc,nodes,pods -n nodetestnamespace



