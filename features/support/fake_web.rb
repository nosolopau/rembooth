require 'fake_web'
require 'net/https'

REDBOOTH_API_BASE = 'https://redbooth.com/'

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, REDBOOTH_API_BASE + 'oauth2/authorize',
  :body => 'client_id=fake',
  :body => 'redirect_uri=http://localhost/users/auth/redbooth/callback',
  :body => 'response_type=code',
  :body => 'state=fake'
)
# FakeWeb.register_uri(:post, REDBOOTH_API_BASE + 'oauth/access_token',
#   :body => 'oauth_token=fake&oauth_token_secret=fake'
# )
# FakeWeb.register_uri(:get,
#   REDBOOTH_API_BASE + '1/account/verify_credentials.json',
#   :body => File.join(Rails.root.to_s,
#     'features', 'fixtures', 'verify_credentials.json'
#   )
# )