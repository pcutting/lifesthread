class Profile < ActiveRecord::Base

belongs_to :user

serialize :chart_options
serialize :favorits

lambda_ages = lambda do |*args|

  if args[0].class == Range then
  my_range = args[0]
  args[0] = my_range.first
  args[1] = my_range.last
  end

  if args[1] == nil then 
  args[1] = 200 
  end
  {:conditions => ["dob <= ? AND dob > ?", args[0].to_i.years.ago,args[1].to_i.years.ago ] }
end #ends lambda




named_scope  :with_ages , lambda_ages

named_scope :with_sex , lambda { |*args| 
if (args[0].first == "f" || args[0].first == "F")  then args[0] = "female" else args[0] = "male" end
{ :conditions => ["sex = ?", args[0] ] } 
}



named_scope :with_state , lambda { |*args| 

{ :conditions => ["state = ?", args[0] ] } 
}
#User.with_gender('m').with_age(21..35).find



named_scope :with_zips , lambda { |*args| 
if args[0].class == String then 
{ :conditions => ["zip = ?",  args[0] ] } 
end
if args[0].class == Array then 
{ :conditions => ["zip = #{args.join(" OR zip = ?")}",  "#{args.join(",")}" ] } 
end
}

def age  
(( Time.now - self.dob.to_time ) / 1.years).to_i
end




end
