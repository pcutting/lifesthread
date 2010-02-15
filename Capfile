load 'deploy' if respond_to?(:namespace) # cap2 differentiator
load 'config/deploy'

namespace :deploy do

task :restart, :roles => :app do
run "chmod 755 #{release_path}/public -R"
run "chown -R lifesthread:lifesthread #{release_path}"
run "touch #{release_path}/current/tmp/restart.txt"
end



end

