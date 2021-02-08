#start-k8-app..sh
set -x
# reconfigure kubectl
aws eks --region us-east-1 update-kubeconfig --name terraform-eks-demo 
#
# Create namespace2
kubectl create namespace wtestnamespace

kubectl apply -n wtestnamespace -f wtest-deployment.yaml
kubectl apply -n wtestnamespace -f wtest-service.yaml
kubectl expose deployment wtest --type=LoadBalancer --port=80 --name=my-wtest -n wtestnamespace

kubectl get svc,nodes,pods,deployments -n wtestnamespace

kubectl get pods -l app=wtest -n wtestnamespace \
    -o go-template='{{range .items}}{{.status.podIP}}{{"\n"}}{{end}}' > static-file.txt && cat static-file.txt
#
# above commands are handy work 

