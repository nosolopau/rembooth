# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'rembooth'
set :repo_url, 'git@github.com:nosolopau/rembooth.git'
set :user, 'deploy'
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

set :deploy_to, "/home/#{fetch(:user)}/public_html/#{fetch(:application)}_#{fetch(:stage)}"
set :deploy_via, 'remote_cache'

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_files, %w{.env newrelic.yml}
set :unicorn_binary, "bundle exec unicorn"
set :unicorn_config, "#{release_path}/config/unicorn.rb"
set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.1.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

namespace :deploy do
  task :start do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{release_path} && #{fetch(:unicorn_binary)} -c #{fetch(:unicorn_config)} -E #{fetch(:stage)} -D"
    end
  end

  task :stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill `cat #{fetch(:unicorn_pid)}`"
    end
  end

  task :graceful_stop do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill -s QUIT `cat #{fetch(:unicorn_pid)}`"
    end
  end

  task :reload do
    on roles(:app), in: :sequence, wait: 5 do
      execute "kill -s USR2 `cat #{fetch(:unicorn_pid)}`"
    end
  end

  task :restart do
    invoke 'deploy:stop'
    invoke 'deploy:start'
  end

  after 'deploy:restart', 'deploy:reload'

  after 'deploy', 'deploy:reload'
end

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'delayed_job:restart'
  end
end

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
