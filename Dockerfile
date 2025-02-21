# node > 14.6.0 is required for the SFDX-Git-Delta plugin
FROM node:lts-alpine

#add usefull tools
RUN apk add --update --no-cache  \
      coreutils \
      git \
      findutils \
      bash \
      unzip \
      curl \
      wget \
      npm \
      openjdk8-jre \
      openssh-client \
      perl \
      jq

# install Salesforce CLI from npm
RUN npm install @salesforce/cli --global
RUN sf --version

# install SFDX-Git-Delta plugin - https://github.com/scolladon/sfdx-git-delta
RUN echo y | sf plugins install sfdx-git-delta
RUN sf plugins