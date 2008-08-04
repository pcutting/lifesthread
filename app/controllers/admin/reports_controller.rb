class Admin::ReportsController < Admin::BaseController

def index

  @users = User.all
  user_count = @users.size
  
  @profile = Profile.find(:all, :conditions => "state = 'ME'")
  
  profile_count = @profile.size
  
  

end

end
