# !created by Abiola on 07-06-2023
FROM httpd
COPY . /usr/local/apache2/htdocs/

# Backend container
FROM node:16.20.0-alpine3.18

# Create app directory
WORKDIR /backend

COPY . .

RUN npm install

EXPOSE 3000

CMD [ "node", "index.js" ]