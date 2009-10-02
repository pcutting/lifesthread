#load 'deploy' if respond_to?(:namespace) # cap2 differentiator
#Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
#load 'config/deploy'


#load 'deploy' if respond_to?(:namespace) # cap2 differentiator
#load 'config/deploy'

#namespace :deploy do

#task :restart, :roles => :app do
#run "chmod 755 #{release_path}/public -R"
#run "touch #{deploy_to}/current/tmp/restart.txt"
#end

#end


# task :restart, :roles => :app do
#    run "chown -R railsapps:railsapps #{deploy_to}"
#    run "touch #{deploy_to}/current/tmp/restart.txt"
#  end
  
  
  
load 'deploy' if respond_to?(:namespace) # cap2 differentiator
load 'config/deploy'

namespace :deploy do

task :restart, :roles => :app do
run "chmod 755 #{release_path}/public -R"
run "chown -R railsapps:railsapps #{release_path}"
run "touch #{release_path}/current/tmp/restart.txt"
end
end

