# Build images
docker-compose build

# Push all images to dockerhub
docker-compose push

# Deploy docker swarm tack
docker stack deploy --compose-file docker-compose.yaml lafb

# Undeploy docker swarm stack
docker stack rm lafb --rmi all

# Update images on running services

#prize generator
docker service update --image teamdeadweight/prize_generator:bigReward prize_generator
docker service update --image teamdeadweight/prize_generator:smallReward prize_generator

#text generator
docker service update --image teamdeadweight/text_generator:3char text_generator
docker service update --image teamdeadweight/text_generator:2char text_generator

#number generator
docker service update --image teamdeadweight/number_generator:6digit number_generator
docker service update --image teamdeadweight/number_generator:8digit number_generator
