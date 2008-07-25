class Admin::BaseController < ApplicationController
  
  before_filter :login_required
  before_filter :must_be_admin
  
protected #-----------------------------

  def must_be_admin
    raise NoPermission unless  @current_user.admin 
  end
  
end
