Rails.application.config.middleware.use OmniAuth::Builder do
  provider :redbooth, ENV['REDBOOTH_APP_ID'], ENV['REDBOOTH_APP_SECRET']
end