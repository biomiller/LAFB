#Build new images
docker-compose build

#Set up containers
docker-compsoe up -d

#Tear down containers
docker-compose down --rmi all

#Update services

#prize generator
docker service update --image teamdeadweight/prize_generator:bigReward prize_generator
docker service update --image teamdeadweight/prize_generator:smallReward prize_generator

#text generator
docker service update --image teamdeadweight/text_generator:3char text_generator
docker service update --image teamdeadweight/text_generator:2char text_generator

#number generator
docker service update --image teamdeadweight/number_generator:6digit number_generator
docker service update --image teamdeadweight/number_generator:8digit number_generator
