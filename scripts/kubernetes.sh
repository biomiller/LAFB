#!/bin/bash

cd ~/LAFB

kubectl apply -f ./mongo/

kubectl apply -f ./db_connector/

kubectl apply -f ./prize_generator/

kubectl apply -f ./number_generator/

kubectl apply -f ./server/

kubectl apply -f ./notification_server/

kubectl apply -f ./text_generator/

kubectl apply -f ./static_website/

kubectl apply -f ./jenkins/

kubectl apply -f ./nginx/




# kubectl rollout undo deployments/nginx



