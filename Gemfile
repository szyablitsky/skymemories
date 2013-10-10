source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

group :development do
  gem 'brakeman'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano-rbenv'
  gem 'capistrano-puma', require: false
  gem 'capistrano-rails', '~> 0.0.7'
  gem 'erd'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'#, '>= 3.0.0'
  gem 'faker'
end

group :test do
  gem 'cucumber-rails', require: false
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

gem 'pg'
gem 'puma'
gem 'rails-i18n'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'vimeo'
gem 'gravatar_image_tag'
gem 'will_paginate'
gem 'simple_form'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass', branch: '3'
gem 'newrelic_rpm'
gem 'bxslider-rails', github: 'szyablitsky/bxslider-rails'
gem 'pace-rails'
gem 'nav_lynx', github: 'vigetlabs/nav_lynx'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use debugger
# gem 'debugger', group: [:development, :test]
