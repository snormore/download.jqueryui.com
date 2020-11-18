FROM node:current-alpine

WORKDIR /workspace
COPY package*.json ./

RUN apk add libxml2 libxslt git imagemagick python3 make g++
RUN npm install
RUN npm install -g grunt-cli grunt modern-syslog

COPY . .

RUN grunt prepare

EXPOSE 8088

CMD ["node", "server.js"]

