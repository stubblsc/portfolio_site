source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use mysql as the database for Active Record
gem 'pg'
# gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'puma'

# New Relic app monitoring
gem 'newrelic_rpm'

# Image storage
gem 'paperclip'
gem 'rmagick', :git=>'http://github.com/rmagick/rmagick.git'
gem 'aws-sdk', '< 2.0'

# Bootstrap
gem 'twitter-bootswatch-rails'
gem 'twitter-bootswatch-rails-helpers'

#gem "letter_opener", :group => :development

# gem 'rails_12factor', group: :production

gem 'figaro'

gem 'seed_dump'

group :development, :test do
  # RSpec esting
  gem 'rspec-rails', '~> 3.3.3'
  gem 'capybara', '~> 2.5.0'
  gem 'database_cleaner', '~> 1.4.1'
  gem 'factory_girl_rails', '~> 4.5.0'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Capistrano deployment
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # VCR etc for testing
  gem 'vcr', '~> 2.9.3'
  gem 'rspec-mocks', '~> 3.3.2'
  gem 'webmock', '~> 1.21.0'
end
