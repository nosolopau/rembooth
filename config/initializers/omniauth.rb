Rails.application.config.middleware.use OmniAuth::Builder do
  provider :redbooth, ENV['fb7ed8767a8362b9be942f836c655bb851687aa33a1d96fb64df77bac09b2f95'], ENV['9ea5323744b1418738ac6639ccda378d9ac6ac5224b55f62db723787a0cc3ff8']
end