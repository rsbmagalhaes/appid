FROM node:8.13-alpine

WORKDIR /usr/src/app

# Copy package.json first to check if an npm install is needed
COPY package.json /usr/src/app
RUN apt-get update
RUN apt-get upgrade
RUN npm install --production

# Bundle app source
COPY . /usr/src/app

ENV PORT 80
EXPOSE 80 80

CMD ["npm", "start"]
