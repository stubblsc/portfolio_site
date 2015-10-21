# Change paramentres below to appropriate values and set CONFIGURED to yes.
CONFIGURED=yes

# Default timeout until child process is killed during server upgrade,
# it has *no* relation to option "timeout" in server's config.rb.
TIMEOUT=60

# Path to your web application, sh'ld be also set in server's config.rb,
# option "working_directory". Rack's config.ru is located here.
APP_ROOT=/home/rails/apps/portfolio_site

# Server's config.rb, it's not a rack's config.ru
CONFIG_RB=/etc/unicorn.conf

# Where to store PID, sh'ld be also set in server's config.rb, option "pid".
PID=/var/run/unicorn.pid
RAILS_ENV="production"
UNICORN_OPTS="-D -c $CONFIG_RB -E $RAILS_ENV"

PATH=/usr/local/rvm/rubies/ruby-2.2.1/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/local/rvm/bin:/usr/local/rvm/gems/ruby-2.2.1@global/bin:/usr/local/rvm/gems/ruby-2.2.1/bin/
export GEM_HOME=/usr/local/rvm/gems/ruby-2.2.1
export GEM_PATH=/usr/local/rvm/gems/ruby-2.2.1:/usr/local/rvm/gems/ruby-2.2.1@global
DAEMON=/usr/local/rvm/gems/ruby-2.2.1/bin/unicorn

# Generate by running `rake -f /home/rails/Rakefile secret`
# export SECRET_KEY_BASE=e9a806f70df01968fdda069f009690b2a09a168e5b495aed217090a8cb5ef4b76f82d7efa430409c968996ffa43ef9393d4e1cdb82dc7549cc8fcd2beb0d0338
export APP_DATABASE_PASSWORD=CbiqIorI0q
# root = "/home/rails/apps/portfolio_site/current"
# working_directory root
#
# pid "#{root}/tmp/pids/unicorn.pid"
#
# stderr_path "#{root}/log/unicorn.log"
# stdout_path "#{root}/log/unicorn.log"
#
# worker_processes Integer(ENV['WEB_CONCURRENCY'])
# timeout 30
# preload_app true
#
# listen '/tmp/unicorn.spui.sock', backlog: 64
#
# before_fork do |server, worker|
#   Signal.trap 'TERM' do
#     puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
#     Process.kill 'QUIT', Process.pid
#   end
#
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.connection.disconnect!
# end
#
# after_fork do |server, worker|
#   Signal.trap 'TERM' do
#     puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
#   end
#
#   defined?(ActiveRecord::Base) and
#     ActiveRecord::Base.establish_connection
# end
#
# # Force the bundler gemfile environment variable to
# # reference the capistrano "current" symlink
# before_exec do |_|
#   ENV['BUNDLE_GEMFILE'] = File.join(root, 'Gemfile')
# end
