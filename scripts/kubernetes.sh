
# RUN KUBERNETES

az group create --name [GROUP]

az aks create --name [AKS_NAME] -g [GROUP]

az aks get-credentials --name [AKS_NAME] -g [GROUP]

cd ~/LAFB

kubectl apply -f ./mongo/

kubectl apply -f ./db_connector/

kubectl apply -f ./prize_generator/

kubectl apply -f /number_generator/

kubectl apply -f ./server/

kubectl apply -f ./notification_server/

kubectl apply -f ./text_generator/

kubectl apply -f ./static_website/

kubectl apply -f ./jenkins/

kubectl apply -f ./nginx/




