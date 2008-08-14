class Member::ReportsController < Member::BaseController

before_filter :load_member_conditions

def index
  
  

  @age_group = Array.new


  if params[:state].nil? then
    @state = "ME"
  else
    @state = params[:state]
  end

  @profiles = Profile.with_state(@state).with_zips(@conditions)

  #these ranges are for the age groups.
  @ranges = [0..12,12..18,18..21,21..30,30..40,40..50,50..60,60..70,70..80,80..90,90..100,100..200]
  @ranges.each do |rng|
    @age_group << [rng, @profiles.with_ages(rng)] unless @profiles.with_ages(rng).count == 0
  end
  
end

#-----------------
private

  def load_member_conditions
    @roles = current_user.roles.find(:all, :conditions => ["has_role = ? OR has_role = ?", "MEMBER","SUPER MEMBER" ])
    @conditions = Array.new
    
    #consider getting rid of this and just doing @roles.each {|role| role.conditions ... }
    @roles.each do |role|
      @conditions << role.conditions
    end
    
  end

end
