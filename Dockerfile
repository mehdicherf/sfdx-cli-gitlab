# small alpine image
FROM alpine

#add usefull tools
RUN apk add --update --no-cache  \
      git \
      findutils \
      bash \
      unzip \
      wget \
      nodejs \
      nodejs-npm \
      openjdk8-jre \
      jq

# install sfdx from npm
RUN npm install sfdx-cli --global
RUN sfdx --version
RUN sfdx plugins --core

# install sgd from npm - https://github.com/scolladon/sfdx-git-delta
RUN npm install sfdx-git-delta@latest --global
RUN sgd --version
