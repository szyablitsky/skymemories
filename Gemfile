source 'https://rubygems.org'

gem 'rails', '4.0.0'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'faker'
  gem 'brakeman'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'sqlite3'
  # gem 'pg', '0.12.2'
end

group :test do
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rb-inotify'
  gem 'libnotify'
  gem 'spork', '~> 1.0rc'
  gem 'guard-spork'
  gem 'childprocess', '0.3.6'
  gem 'coveralls', require: false
end

group :assets do
  gem 'sass-rails', '~> 4.0.0'
  #gem 'compass-rails', '>= 2.0.alpha.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

gem 'russian'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'vimeo'
gem 'gravatar_image_tag'
gem 'will_paginate'
gem 'simple_form', '>= 3.0.0.rc'
gem 'bourbon'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
# gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
#                               :github => 'anjlab/bootstrap-rails',
#                               :branch => '3.0.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
