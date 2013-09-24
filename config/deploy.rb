require 'rvm/capistrano'
require 'rvm/capistrano/alias_and_wrapp'
require 'bundler/capistrano'
require 'capistrano-puma'

set :application, 'sky_memories'
set :repository,  'git@github.com:szyablitsky/skymemories.git'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, 'finch.pro'                   # Your HTTP server, Apache/etc
role :app, 'finch.pro'                   # This may be the same as your `Web` server
role :db,  'finch.pro', :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

set :user, 'finch'
set :deploy_to, '/home/finch/sites/sm.finch.pro'
set :use_sudo, false

set :rvm_ruby_string, :local
set :rvm_autolibs_flag, 'read-only' # more info: rvm help autolibs
set :bundle_dir, ''
set :bundle_flags, '--system --quiet'
set :bundle_without,  [:test, :development]

before 'deploy',                'rvm:install_rvm'
before 'deploy',                'rvm:install_ruby'
before 'deploy',                'rvm:create_alias'
before 'deploy',                'rvm:create_wrappers'
after  'deploy',                'deploy:cleanup'
after  'deploy:start',          'puma:start'
after  'deploy:stop',           'puma:stop'
after  'deploy:restart',        'puma:restart'
after  'deploy:create_symlink', 'puma:after_symlink'