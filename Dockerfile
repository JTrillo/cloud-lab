FROM ubuntu:18.04

WORKDIR /opt/app

# Copy nedeed files
COPY package.json .
COPY index.js .

# Update container and install curl
RUN apt update
RUN apt install curl -y

# Install NodeJS version 10
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN rm nodesource_setup.sh
RUN apt install nodejs -y

# Install NodeJS app dependencies
RUN npm install -only=production

# Exposing port
EXPOSE 8888

CMD ["npm", "start"]
