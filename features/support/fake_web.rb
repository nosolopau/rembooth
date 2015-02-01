require 'fake_web'
require 'net/https'

REDBOOTH_BASE = 'https://redbooth.com/'
REDBOOTH_API_BASE =  REDBOOTH_BASE + 'api/3/'

FakeWeb.allow_net_connect = %r[^https?://coveralls.io]

task_lists = Rails.root.join('features', 'fixtures', 'task_lists.json')
FakeWeb.register_uri(:get, REDBOOTH_API_BASE + 'task_lists', body: task_lists)

