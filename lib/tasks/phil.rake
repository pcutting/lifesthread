task :phil do

puts "rake db:drop"
puts "rake db:create"
puts "rake db:migrate"
puts "rake db:fixtures:load"

puts ""

puts "rake db:drop RAILS_ENV=production"
puts "rake db:create RAILS_ENV=production"
puts "rake db:migrate RAILS_ENV=production"
puts "rake db:fixtures:load RAILS_ENV=production"





end
