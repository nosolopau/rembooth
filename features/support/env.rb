require 'coveralls'
Coveralls.wear!

# IMPORTANT: This file is generated by cucumber-rails - edit at your own peril.
# It is recommended to regenerate this file in the future when you upgrade to a
# newer version of cucumber-rails. Consider adding your own code to a new file
# instead of editing this one. Cucumber will automatically load all features/**/*.rb
# files.

require 'cucumber/rails'
require 'rspec/expectations'
require 'fakeweb'

# Capybara defaults to CSS3 selectors rather than XPath.
# If you'd prefer to use XPath, just uncomment this line and adjust any
# selectors in your step definitions to use the XPath syntax.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail. This is a different from how 
# your application behaves in the production environment, where an error page will 
# be rendered instead.
#
# Sometimes we want to override this default behaviour and allow Rails to rescue
# exceptions and display an error page (just like when the app is running in production).
# Typical scenarios where you want to do this is when you test your error pages.
# There are two ways to allow Rails to rescue exceptions:
#
# 1) Tag your scenario (or feature) with @allow-rescue
#
# 2) Set the value below to true. Beware that doing this globally is not
# recommended as it will mask a lot of errors for you!
#
ActionController::Base.allow_rescue = false

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:redbooth] = OmniAuth::AuthHash.new({
  provider: 'redbooth',
  uid: '1019650',
  info: {
      name: 'Test',
      email: 'test@example.com'},
  credentials: {
      token: 'e5575e8766d12efe38b52cda2cf3ba07bbc5cc9ca4a2a118b56b1926b12b40c9',
      refresh_token: '6337c840eb04ae9fc6730a999329117ed132e8e71f25726e4d2d48c13ed8fb46',
      expires: false
  },
  extra: {
      raw_info: {}
  }
})

OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
  provider: 'twitter',
  uid: '11441832',
  info: {
      nickname: 'test',
      name: 'User test',
      location: 'Barcelona',
      image: 'http://pbs.twimg.com/profile_images/524261903598505984/YnbOxKSC_normal.png',
      description: 'My irrelevant bio',
      urls: { Website: 'http://t.co/Ixhe7uCu5x',
              Twitter: 'https://twitter.com/test'
      }
  },
  credentials: {
      token: '11441832-oKD945lN8kc5umXEoXH4aBjyIotFRCqbtfKS0MrHq',
      secret: 'AIuBr8SXPpev2VUNV4ukNlc02hYdi5Kt8s7MXq0GQDzSr'
  }
})


# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

# You may also want to configure DatabaseCleaner to use different strategies for certain features and scenarios.
# See the DatabaseCleaner documentation for details. Example:
#
#   Before('@no-txn,@selenium,@culerity,@celerity,@javascript') do
#     # { :except => [:widgets] } may not do what you expect here
#     # as Cucumber::Rails::Database.javascript_strategy overrides
#     # this setting.
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   Before('~@no-txn', '~@selenium', '~@culerity', '~@celerity', '~@javascript') do
#     DatabaseCleaner.strategy = :transaction
#   end
#
# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

