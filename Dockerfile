FROM ubuntu:16.04

# Install NodeJS
RUN apt-get update\
  && apt-get install -y curl vim \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && apt-get update \
  && apt-get install -y nodejs

# Install serverless framework
RUN npm install serverless@^v1.42.3 -g

# Install Ruby
RUN apt-get update\
  && apt-get install -y wget build-essential libyaml-dev zlib1g-dev libreadline-gplv2-dev libssl-dev libffi-dev\
  && wget http://ftp.ruby-lang.org/pub/ruby/2.5/ruby-2.5.5.tar.gz\
  && tar xvzf ruby-2.5.5.tar.gz\
  && cd ruby-2.5.5\
  && ./configure --prefix=/usr/local --disable-install-doc --enable-load-relative --enable-shared\
  && make\
  && make install\
  && rm -rf ruby-2.5.5 ruby-2.5.5.tar.gz\
  && gem install bundler -v 2.0.1 --no-rdoc --no-ri\
  && apt-get install -y git-core libxml2-dev libxslt1-dev libmagickwand-dev yasm tzdata\
  && apt-get install -y openssh-server

RUN mkdir lambda
WORKDIR /lambda

ADD . /lambda

RUN rake dev_build

RUN gem env
