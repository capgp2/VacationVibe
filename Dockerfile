
FROM node:16.20.0-alpine3.18

# Create app directory
WORKDIR /backend

COPY . .

RUN npm install

EXPOSE 8080

CMD [ "node", "server.js" ]
