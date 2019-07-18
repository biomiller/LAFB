FROM node:10 as node-build
WORKDIR /build
COPY . .
RUN npm install
CMD npm start
EXPOSE 8089
ENTRYPOINT ["node", "server.js"]
