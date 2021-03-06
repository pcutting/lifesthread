# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  


  helper :all # include all helpers, all the time
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  helper :charts
  
 before_filter :set_time_zone
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'fd048dd326f2d85d235ecaf1aa54bd93'
  
  
  def active_scaffold_input_date(column, options)
    active_scaffold_calendar(column, options)
  end
  
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
private 
  def set_time_zone
    Time.zone = current_user.time_zone if logged_in?
  end
  
end
