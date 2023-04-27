FROM node:13.6.0-alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN rm -rf package-lock.json node_modules
RUN npm install

# Bundle app source
COPY . /usr/src/app

USER node
CMD [ "npm", "start" ]