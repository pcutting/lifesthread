class Member::BaseController < ApplicationController
  
  before_filter :login_required
  before_filter :must_be_member
  
protected #-----------------------------

  def must_be_member
    raise NoPermission if  @current_user.roles.find(:all, :conditions => ["has_role = ? OR has_role = ?", "MEMBER","SUPER MEMBER" ]) == [] 
  end
  
end
