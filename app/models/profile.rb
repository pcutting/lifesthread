class Profile < ActiveRecord::Base

belongs_to :user

serialize :chart_options
serialize :favorits

def age  
(( Time.now - self.dob.to_time ) / 1.years).to_i
end




end
