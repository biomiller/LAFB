FROM node:10 as node-build
WORKDIR /build
COPY . .
RUN npm install
EXPOSE 5001
ENTRYPOINT ["node", "server.js"]
