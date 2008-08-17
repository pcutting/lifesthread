set :application, "lifesthread"
#set :domain, "208.113.123.94"  #set :domain, "208.113.123.93"
set :domain, "208.113.123.93"  #set :domain, "208.113.123.93"

## http://github.com/guides/deploying-with-capistrano

default_run_options[:pty] = true
set :repository,  "git@github.com:pcutting/lifesthread.git"
set :scm, "git"
set :scm_passphrase, "wellnessboard" #This is your custom users password


set :user, "deploy"
set :password, "work4you2"



set :runner , user
#set :scm_command, "/bin/git" 

set :branch, "master"

set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :ssh_options, { :forward_agent => true }


set :deploy_to, "/var/www/rails_apps/#{application}"

role :app, domain
role :web, domain
role :db,  domain, :primary => true




#https://github.com/pcutting/lifesthread/commits/master
#set :application, "your cool app"

# Source code
#set :scm, :git
#set :repository, "git@github.com:githubusername/gitrepo.git"
#set :branch, "stable"
#set :repository_cache, "git_cache"
#set :deploy_via, :remote_cache
#set :ssh_options, { :forward_agent => true }

# Deployment servers
#role :app, "your server"
#role :web, "your server"
#role :db,  "your server", :primary => true
#set :deploy_to, "/var/www/#{application}"




####################
# RUSS'S DEPLOY.RB
####################


# set :application, "dev.example.com"
# set :domain, "dev.example.com" # The URL for your app
# set :user, "deploy" # Your username on the remote box
# set :repository,  "ssh://#{user}@#{domain}/var/git/example.git"
# set :deploy_to, "/var/www/#{application}"
# set :deploy_via, :checkout # remote_cache, checkout, export
# set :scm_command, "/usr/local/git/bin/git" # path to git on server
# set :branch, "master" 
#default_run_options[:pty] = true
#ssh_options[:keys] = %w(~/.ssh/id_dsa ~/.ssh/id_rsa) 

# set(:term) do
 # Capistrano::CLI.ui.ask "Gimme a search term: "
#end

#default_run_options[:pty] = true
# set :keep_releases, 3
# set :mongrel_port, 3000
# set :mongrel_servers, 3
# set :rails_env, 'production'
# set :runner, user 
# set :scm, :git # :git | :subversion
# set :scm_username, user # only for http pulls from subversion
# set :use_sudo, true


# #=============================================================================
# ROLES
# #=============================================================================

#role :app, domain
#role :web, domain
#role :db,  domain, :primary => true

#
