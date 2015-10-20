#!/usr/bin/env puma

directory '/home/deploy/apps/portfolio_site/current'
rackup "/home/deploy/apps/portfolio_site/current/config.ru"
environment 'production'

pidfile "/home/deploy/apps/portfolio_site/shared/tmp/pids/puma.pid"
state_path "/home/deploy/apps/portfolio_site/shared/tmp/pids/puma.state"
stdout_redirect '/home/deploy/apps/portfolio_site/current/log/puma.error.log', '/home/deploy/apps/portfolio_site/current/log/puma.access.log', true


threads 12,48

bind 'unix:///home/deploy/apps/portfolio_site/shared/tmp/sockets/portfolio_site-puma.sock'

workers 12



preload_app!


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/deploy/apps/portfolio_site/current/Gemfile"
end


on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
