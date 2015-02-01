require 'fake_web'
require 'net/https'

REDBOOTH_BASE = 'https://redbooth.com/'
REDBOOTH_API_BASE =  REDBOOTH_BASE + 'api/3/'

FakeWeb.allow_net_connect = %r[^https?://coveralls.io]

# Redbooth API:
task_lists = Rails.root.join('features', 'fixtures', 'task_lists.json')
tasks = Rails.root.join('features', 'fixtures', 'tasks.json')

FakeWeb.register_uri(:get, REDBOOTH_API_BASE + 'task_lists', body: task_lists)
FakeWeb.register_uri(:get, REDBOOTH_API_BASE + 'tasks?task_list_id=2768599', body: ERB.new(File.read(tasks)).result)

# Twitter API:
twitter_status = Rails.root.join('features', 'fixtures', 'twitter_status.json')

FakeWeb.register_uri(:post, 'https://@api.twitter.com/oauth2/token', body: '')
FakeWeb.register_uri(:post, 'https://api.twitter.com/1.1/statuses/update.json', body: twitter_status)
