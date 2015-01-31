# REMbooth

REMbooth is a reminders service for tasks managed with [Redbooth](https://redbooth.com).

[![Build Status](https://travis-ci.org/nosolopau/rembooth.svg?branch=master)](https://travis-ci.org/nosolopau/rembooth)

## Configuration

REMbooth uses `rbenv` to manage the application environment variables. Before launching the project, set the required environment variables in the `.env` file:

    REDBOOTH_APP_ID: value
    REDBOOTH_APP_SECRET: value
    TWITTER_CONSUMER_KEY: value
    TWITTER_CONSUMER_SECRET: value
    TWITTER_ACCESS_TOKEN: value
    TWITTER_ACCESS_TOKEN_SECRET: value

## Launching

You can use the awesome gem `foreman` to launch an instance of the typical MongoDB configuration and the Delayed Job worker:

    bundle exec foreman start

If you want to launch only the server, use:

    bundle exec rails s

## Running the tests

Just use:

    bundle exec rake

