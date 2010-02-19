set :ip_address, "lifesthread.info"  #model.lifesthread.info  or lifesthread.info
set :user, "lifesthread"   #model or lifesthread
set :password, "work4you2"
set :application, "wellnessboard" #wellnessboard or model
set :repository, "git@github.com:pcutting/lifesthread.git"
set :scm, "git"

set :deploy_via, :copy

set :use_sudo, false
set :group_writable, false
set :rails_env, 'production'

set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :copy

set :deploy_to, "/home/#{user}/#{application}"

role :app, ip_address
role :web, ip_address
role :db, ip_address, :primary => true


