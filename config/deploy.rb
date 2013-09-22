set :application, "Sky Memories"
set :repository,  "git@github.com:szyablitsky/skymemories.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "finch.pro"                   # Your HTTP server, Apache/etc
role :app, "finch.pro"                   # This may be the same as your `Web` server
role :db,  "finch.pro", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

set :user, "finch"
set :deploy_to, "/home/finch/sites/sm.finch.pro"
set :use_sudo, false
