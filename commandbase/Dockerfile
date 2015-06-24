FROM jcaldwell/osbase

MAINTAINER Jeffery Caldwell <jeffery.caldwell@gmail.com>

RUN apt-get update && apt-get install -y ca-certificates curl unzip tar python-pip build-essential git-core mercurial bzr cmake zsh stow python-dev clang ctags
RUN mkdir -p /usr/local/go && curl -Ls https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz | tar xvzf - -C /usr/local/go --strip-components=1

# Install java 8 oracle.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install node and deps
RUN \
    curl -sL https://deb.nodesource.com/setup | bash - && \
    apt-get -y install python build-essential nodejs

# Install nodemon
RUN npm install -g nodemon
RUN npm install -g mean-cli

ENTRYPOINT /bin/bash

