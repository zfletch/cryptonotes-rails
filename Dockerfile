FROM ruby:3.4.4

RUN curl -fsSL https://deb.nodesource.com/setup_24.x | bash -
RUN apt-get update -qq && apt-get install -qq build-essential nodejs
RUN npm install --global yarn

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD package.json /app/package.json
ADD yarn.lock /app/yarn.lock

RUN bundle install
RUN yarn install
ADD . /app
