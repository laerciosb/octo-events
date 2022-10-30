FROM ruby:3.1.2-alpine

LABEL maintainer="laerciosbezerra@gmail.com"

ENV LANG=C.UTF-8
ENV API_HOME=/usr/src/api
RUN mkdir -p $API_HOME

COPY . $API_HOME/
WORKDIR $API_HOME

# Required Variables
ARG ENVIRONMENT="production"
ENV RAILS_ENV=$ENVIRONMENT
ARG API_PORT=3000
ENV PORT=$API_PORT

# Initial Setup
RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache --update build-base postgresql-dev bash tzdata icu-data-full

# Back dependencies
ARG EXCLUDE_GEMS="development test"
RUN gem install bundler --no-document --version 2.2.22
RUN bundle config set specific_platform true
RUN if [ "$RAILS_ENV" = "production" ]; then bundle config set without $EXCLUDE_GEMS; fi
RUN bundle install --jobs 4 --retry 3

# Use the following lines for Rails Apps
RUN chmod +x ./server.sh

# API Runner
EXPOSE $PORT

# Start rails server
CMD ["bash", "./server.sh"]
