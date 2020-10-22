# node > 14.6.0 is required for the SFDX-Git-Delta plugin
FROM node:14.14-alpine

#add usefull tools
RUN apk add --update --no-cache  \
      git \
      findutils \
      bash \
      unzip \
      curl \
      wget \
      nodejs-npm \
      openjdk8-jre \
      openssh-client \
      perl \
      jq

# install Salesforce CLI from npm
RUN npm install sfdx-cli --global
RUN sfdx --version

# install SFDX-Git-Delta plugin - https://github.com/scolladon/sfdx-git-delta
RUN echo y | sfdx plugins:install sfdx-git-delta
RUN sfdx plugins

# add sgd to path
RUN ln -s /root/.local/share/sfdx/node_modules/.bin/sgd /usr/local/bin/sgd