
# RUN KUBERNETES

az group create --name [GROUP]

az aks create --name [AKS_NAME] -g [GROUP]

az aks get-credentials --name [AKS_NAME] -g [GROUP]

cd ~/LAFB

kubectl apply -f ./mongo/

kubectl apply -f /db-connector/

kubectl apply -f /prize-generator/

kubectl apply -f /number-generator/

kubectl apply -f ./server/

kubectl apply -f ./notification-server/

kubectl apply -f ./text-generator/

kubectl apply -f ./static-website/

kubectl apply -f ./jenkins/

kubectl apply -f ./nginx/




