class Member::BaseController < ApplicationController
  
  before_filter :login_required
  before_filter :must_be_member
  before_filter :load_member_conditions

  
  def load_member_conditions
    @roles = current_user.roles.find(:all, :conditions => ["has_role = ? OR has_role = ?", "MEMBER","SUPER MEMBER" ])
    @member_conditions = Array.new
    
    #consider getting rid of this and just doing @roles.each {|role| role.conditions ... }
    @roles.each do |role|
      @member_conditions << role.conditions
    end
   
    puts "***member/base_controller.rb** @member_conditions : #{@member_conditions.join(",")}   #{@member_conditions.class}"
  end
  
  
protected #-----------------------------

  def must_be_member
    raise NoPermission if  @current_user.roles.find(:all, :conditions => ["has_role = ? OR has_role = ?", "MEMBER","SUPER MEMBER" ]) == [] 
  end
  

end
