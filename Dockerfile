# small alpine image
FROM alpine

#add usefull tools
RUN apk add --update --no-cache  \
      git \
      findutils \
      bash \
      unzip \
      curl \
      wget \
      nodejs \
      nodejs-npm \
      openjdk8-jre \
      openssh-client \
      perl \
      jq

# install sfdx from npm
RUN npm install sfdx-cli --global
RUN sfdx --version
RUN sfdx plugins --core

# install latest node version (sgd requires node v14)
RUN npm install n -g
RUN n latest

# install sgd from npm - https://github.com/scolladon/sfdx-git-delta
RUN npm install sfdx-git-delta@latest --global
RUN sgd --version
