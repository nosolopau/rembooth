require 'redbooth-ruby'

module RedboothService
  class Base
    attr_accessor :user

    def initialize(user)
      @user = user
      @user.refresh_token_if_expired
    end

    def client
      @client ||= RedboothRuby::Client.new(session)
    end

    def all
      fetch_resources
    end

    def fetch_resources(options = {})
      collection = find_by(options)
      items = collection.all

      while collection = collection.next_page do
        items << collection.all
      end

      items
    end

    protected

    def session
      @session ||= RedboothRuby::Session.new(token: user.credentials[:token])
    end

    def user_id
      @user_id ||= client.me(:show).id
    end
  end
end