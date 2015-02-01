# REMbooth

REMbooth is a reminders service for tasks managed with [Redbooth](https://redbooth.com).

[![Build Status](https://travis-ci.org/nosolopau/rembooth.svg?branch=master)](https://travis-ci.org/nosolopau/rembooth)
[![Code Climate](https://codeclimate.com/github/nosolopau/rembooth/badges/gpa.svg)](https://codeclimate.com/github/nosolopau/rembooth)
[![Coverage Status](https://coveralls.io/repos/nosolopau/rembooth/badge.svg?branch=master)](https://coveralls.io/r/nosolopau/rembooth?branch=master)

Try it at [rembooth.nosolopau.com](http://rembooth.nosolopau.com) :)

How to:

1. Sign in REMbooth using your Redbooth account
2. Link your Twitter account.
3. Select some task lists to get notifications when a task is due.
4. The REMBooth robot will mention you in Twitter to remind your pending tasks.

## Configuring

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

## Testing

Just use:

    bundle exec rake

