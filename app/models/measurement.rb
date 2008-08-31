class Measurement < ActiveRecord::Base
belongs_to :user

after_save :update_profile_cache




#after_save
def update_profile_cache

  u = User.find_by_id(self.user_id)

  @weight_current = u.measurements.find(:first, :order => 'measured_on desc', :conditions => ['is_goal = ? AND weight > ? ', false, 0]) rescue @weight_current = 0
   @weight_goal = u.measurements.find(:first, :order => 'measured_on desc', :conditions => ['is_goal = ? AND weight > ?', true, 0]) rescue @weight_goal = 0

  unless @weight_current.nil? or @weight_current == 0
    u.profile.cache_current_weight = @weight_current.weight.to_f
  end
  
  unless @weight_goal.nil? or @weight_goal == 0
    u.profile.cache_current_weight_goal = @weight_goal.weight.to_f
  end

  u.profile.cache_last_updated = Time.zone.now
  
  u.profile.save

end


end
