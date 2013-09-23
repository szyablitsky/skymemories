source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

group :development do
  gem 'brakeman'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano-rails', '~> 0.0.7'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'#, '>= 3.0.0'
  gem 'faker'
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
  gem 'childprocess'
  gem 'coveralls', require: false
end

group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

gem 'puma'
gem 'russian'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'vimeo'
gem 'gravatar_image_tag'
gem 'will_paginate'
gem 'simple_form', '>= 3.0.0.rc'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'newrelic_rpm'
gem 'rvm-capistrano'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use debugger
# gem 'debugger', group: [:development, :test]
