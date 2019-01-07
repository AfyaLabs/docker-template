FROM ruby:2.5.1-alpine
RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Israel Tomilayo <itomilayo@gmail.com>"

CMD puma -C config/puma.rb
