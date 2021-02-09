#start-k8-app..sh
set -x
# reconfigure kubectl
aws eks --region us-east-1 update-kubeconfig --name k8-nodeport 
#
# Create namespace2
kubectl create namespace nodetestnamespace

kubectl apply -n nodetestnamespace -f nodetest-deployment.yaml
#kubectl apply -n nodetestnamespace -f nodetest-service.yaml
kubectl apply -n nodetestnamespace -f nodetest-node-service.yaml 
# kubectl expose deployment nodetest --type=LoadBalancer --port=80 --name=my-nodetest -n nodetestnamespace

kubectl get svc,nodes,pods,deployments -n nodetestnamespace

kubectl get pods -l app=nodetest -n nodetestnamespace \
    -o go-template='{{range .items}}{{.status.podIP}}{{"\n"}}{{end}}' > static-file.txt && cat static-file.txt
#
# above commands are handy work 

