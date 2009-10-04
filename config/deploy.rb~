set :ip_address, "74.63.8.179"
set :user, "rails"
set :password, "work4you2"
#set :server, "lifesthread.com"
set :application, "wellnessboard"
set :repository, "git@github.com:pcutting/wellnessboard.git"
set :scm, "git"

set :deploy_via, :copy

set :use_sudo, true
set :group_writable, false
set :rails_env, 'production'

set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :copy

set :deploy_to, "/home/#{user}/#{application}"

role :app, ip_address
role :web, ip_address
role :db, ip_address, :primary => true


