# node base image
FROM node:10

# prize generator implementation
ARG REWARD=bigReward.js

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# copy and rename prize generator implementation to use
RUN cp ./routes/${REWARD} ./routes/reward.js

EXPOSE 5002
ENTRYPOINT [ "node", "server.js" ]
