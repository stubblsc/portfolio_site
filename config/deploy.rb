# config valid only for current version of Capistrano
lock '3.4.0'

# Change these

set :repo_url,        'git@github.com:stubblsc/portfolio_site.git'
set :scm,             :git
set :branch,          'master'#:master#423.to_s.to_sym
set :application,     'portfolio_site'
set :user,            'rails'
set :puma_threads,    [1, 6]
set :puma_workers,    1

set :rails_env, :production

# set :ssh_options, {
#   forward_agent: true,
#   port: 4321
# }

set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end
