# Delete the applicaiton
#
kubectl delete -n wtestnamespace -f wtest-deployment.yaml
kubectl delete -n wtestnamespace -f wtest-service.yaml
#
kubectl get svc,nodes,pods -n wtestnamespace
#
kubectl get svc,nodes,pods -n wtestnamespace
kubectl delete all --all -n wtestnamespace
kubectl get svc,nodes,pods -n wtestnamespace



