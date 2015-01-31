require 'fake_web'
require 'net/https'

REDBOOTH_API_BASE = 'https://redbooth.com/'
#
#FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:any, REDBOOTH_API_BASE + 'oauth2/authorize?client_id=fb7ed8767a8362b9be942f836c655bb851687aa33a1d96fb64df77bac09b2f95&redirect_uri=http%3A%2F%2Flocalhost%3A3003%2Fusers%2Fauth%2Fredbooth%2Fcallback&response_type=code&state=60d20eefaf993e433d8eafe41ed22fe6cd50cbc4152a51f4', :body => 'oauth_token=fake')
# FakeWeb.register_uri(:post, REDBOOTH_API_BASE + 'oauth/access_token',
#   :body => 'oauth_token=fake&oauth_token_secret=fake'
# )
# FakeWeb.register_uri(:get,
#   REDBOOTH_API_BASE + '1/account/verify_credentials.json',
#   :body => File.join(Rails.root.to_s,
#     'features', 'fixtures', 'verify_credentials.json'
#   )
# )