FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -qq build-essential nodejs chromedriver
RUN npm install --global yarn

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD vendor/cache /app/vendor/cache
ADD package.json /app/package.json
ADD yarn.lock /app/yarn.lock

RUN bundle install --local
RUN yarn install
ADD . /app
