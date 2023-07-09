# !created by Abiola on 07-06-2023
FROM node:16.20.0-alpine3.18

# Create app directory
WORKDIR /backend

COPY . /backend

RUN npm install

EXPOSE 8080

CMD [ "node", "server.js" ]