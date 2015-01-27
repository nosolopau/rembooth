Rails.application.config.middleware.use OmniAuth::Builder do
  provider :redbooth, ENV['REDBOOTH_APP_ID'], ENV['REDBOOTH_APP_SECRET']
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
end



