FROM node:16

RUN npm install -g laravel-echo-server

WORKDIR /app

COPY laravel-echo-server.json .

CMD [ "laravel-echo-server", "start" ]
