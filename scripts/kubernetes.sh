
# RUN KUBERNETES

az group create --name [GROUP]

az aks create --name [AKS_NAME] -g [GROUP]

az aks get-credentials --name [AKS_NAME] -g [GROUP]

cd ~/LAFB

kubectl apply -f ./mongo/pod.yaml
kubectl apply -f ./mongo/service.yaml

kubectl apply -f /prize-generator/deployment.yaml
kubectl apply -f ./prize-generator/service.yaml

kubectl apply -f ./server/deployment.yaml
kubectl apply -f ./server/service.yaml

kubectl apply -f ./notification-server/deployment.yaml
kubectl apply -f ./notification-server/service.yaml

kubectl apply -f ./text-generator/deployment.yaml
kubectl apply -f ./text-generator/service.yaml

kubectl apply -f ./static-website/deployment.yaml
kubectl apply -f ./static-website/service.yaml

kubectl apply -f ./nginx/deployment.yaml
kubectl apply -f ./nginx/service.yaml



