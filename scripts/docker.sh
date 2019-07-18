# Build Images

docker build -t teamdeadweight/nginx -f nginx/Dockerfile .

docker build -t teamdeadweight/db_connector -f db_connector/Dockerfile .

docker build -t teamdeadweight/server -f server/Dockerfile .

docker build -t teamdeadweight/static_website -f static_website/Dockerfile .

docker build -t teamdeadweight/text_generator:3char --build-arg APP_VERSION=3char.py -f text_generator/Dockerfile .
docker build -t teamdeadweight/text_generator:2char --build-arg APP_VERSION=2char.py -f text_generator/Dockerfile .

docker build -t teamdeadweight/prize_generator:bigReward --build-arg REWARD=bigReward.py -f prize_generator/Dockerfile .
docker build -t teamdeadweight/prize_generator:smallReward --build-arg REWARD=smallReward.py -f prize_generator/Dockerfile .

docker build -t teamdeadweight/number_generator:6digit --build-arg APP_VERSION=6digit.py -f number_generator/Dockerfile .
docker build -t teamdeadweight/number_generator:8digit --build-arg APP_VERSION=8digit.py -f number_generator/Dockerfile .

# Run containers

docker run -d -p 80:80 --name nginx teamdeadweight/nginx

docker run -d -p 5001:5001 --name db-connector teamdeadweight/db_connector

docker run -d -p 27017:27017 --name mongo teamdeadweight/mongo

docker run -d -P --name server teamdeadweight/server

docker run -d -P --name static-website teamdeadweight/static_website

docker run -d -P --name text-generator teamdeadweight/text_generator:2char
docker run -d -P --name text-generator teamdeadweight/text_generator:3char

docker run -d -P --name prize-generator teamdeadweight/prize_generator:bigReward
docker run -d -P --name prize-generator teamdeadweight/prize_generator:smallReward

docker run -d -P --name number-generator teamdeadweight/number_generator:6digit
docker run -d -P --name number-generator teamdeadweight/number_generator:8digit

# Stop containers

docker stop $(docker ps -aq)

docker stop nginx
docker stop db-connector
docker stop server
docker stop mongo
docker stop static-website
docker stop prize-generator
docker stop text-generator
docker stop number-generator

# Remove Containers
docker rm $(docker ps -aq)

docker rm nginx
docker rm db-connector
docker rm server
docker rm mongo
docker rm static-website
docker rm prize-generator
docker rm text-generator
docker rm number-generator

# Remove all images
docker rmi $(docker images -q)
