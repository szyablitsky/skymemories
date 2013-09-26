require 'capistrano-rbenv'
require 'capistrano-puma'
require 'bundler/capistrano'
require 'new_relic/recipes'

set :application, 'sky_memories'
set :repository,  'git@github.com:szyablitsky/skymemories.git'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, 'finch.pro'                   # Your HTTP server, Apache/etc
role :app, 'finch.pro'                   # This may be the same as your `Web` server
role :db,  'finch.pro', :primary => true # This is where Rails migrations will run

set :user, 'finch'
set :deploy_to, '/home/finch/sites/sm.finch.pro'
set :use_sudo, false
default_run_options[:pty] = true

set :rbenv_ruby_version, '2.0.0-p247'
set :default_environment, { 'PATH' => '$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH' }
set :bundle_dir, ''
set :bundle_flags, '--system --quiet'
set :bundle_without,  [:test, :development]

after  'deploy',                'deploy:cleanup'  
# if you want to clean up old releases on each deploy uncomment this:
# after 'deploy:restart',         'deploy:cleanup'

after  'deploy:start',          'puma:start'
after  'deploy:stop',           'puma:stop'
after  'deploy:restart',        'puma:restart'
after  'deploy:create_symlink', 'puma:after_symlink'

after 'deploy',                 'newrelic:notice_deployment'
after 'deploy:update',          'newrelic:notice_deployment'
after 'deploy:migrations',      'newrelic:notice_deployment'
after 'deploy:cold',            'newrelic:notice_deployment'
