require 'redbooth-ruby'

module RedboothService
  class Base
    attr_accessor :user

    def initialize(user)
      @user = user
    end

    def client
      @client ||= RedboothRuby::Client.new(session)
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