require 'fake_web'
require 'net/https'

REDBOOTH_API_BASE = 'https://redbooth.com/api/3/'

FakeWeb.allow_net_connect = false

task_lists = Rails.root.join('features', 'fixtures', 'task_lists.json')
FakeWeb.register_uri(:get, REDBOOTH_API_BASE + 'task_lists', body: task_lists)
