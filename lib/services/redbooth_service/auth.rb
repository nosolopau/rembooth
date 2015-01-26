module RedboothService
  class Auth
    def self.refresh_token(credentials)
      Dotenv.load

      client_id = ENV['REDBOOTH_APP_ID']
      client_secret = ENV['REDBOOTH_APP_SECRET']
      oauth2_urls = RedboothRuby::Session::OAUTH_URLS

      @oauth2_client = OAuth2::Client.new(client_id, client_secret, oauth2_urls)
      @access_token = OAuth2::AccessToken.new(@oauth2_client, credentials[:access_token])
      refresh_access_token_obj = OAuth2::AccessToken.new(@oauth2_client, @access_token.token, {'refresh_token' => credentials[:refresh_token]})
      @access_token = refresh_access_token_obj.refresh!

      { token: @access_token.token, refresh_token: @access_token.refresh_token, expires_at: @access_token.expires_at }
    end
  end
end