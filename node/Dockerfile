FROM node:16

RUN npm install -g laravel-echo-server

WORKDIR /var/www/html

COPY laravel-echo-server.json .

CMD [ "laravel-echo-server", "start" ]