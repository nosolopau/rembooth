# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :MAILTO, 'pau@nosolopau.com'
env :PATH, ENV['PATH']

job_type :unicorn_start, 'cd :path && bundle exec unicorn -c :path/config/unicorn.rb -E :environment -D'
job_type :rake, 'cd :path && RAILS_ENV=:environment bundle exec rake :task'

every 15.minutes do
  rake 'notifier:run'
end

every :reboot do
  unicorn_start 'application'
end