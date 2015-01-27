require 'twitter'

module TwitterService
  class Base
    attr_accessor :client

    def initialize
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
        config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
        config.access_token = ENV['TWITTER_ACCESS_TOKEN']
        config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      end
    end

    def update(status)
      @client.update(status)
    end

    def self.tweet(status = '')
      new.update(status)
    end
  end
end
