class Member::ReportsController < Member::BaseController

before_filter :load_member_conditions

def index
  
  

  @age_group = Array.new


#if ( params[:commit] == "By Member" )then
#  if params[:report_option] != "" and  params[:report_option] == current_user then
#    @profiles = Profile.with_rx_affiliate_no(params[:report_option])
#  else
#    flash[:notice] = "The Member id number doesn't match up with your profile."
#    set_default
#  end 

#was elsif  *********************

if  ( params[:commit] == "By Zip" ) then 
  @filter = "By Zip code(s): #{params[:report_option]}"
  if params[:report_option]=="" then 
   set_default 
   flash[:notice] = "Please enter the Zip code you want to report on and press 'By Zip' again unless you are looking for #{@member_conditions.join(", ")}."
   
  else
    report_options = [ params[:report_option] ]
    @valid_zips = @member_conditions & report_options
    unless @valid_zips == [] then 
      @profiles = Profile.with_zips(@valid_zips) 
    else
      flash[:notice] = "You do not have access to this (#{params[:report_option]}) zip code."
      set_default
    end 
  end 
else
  # this condition if nothing else works.
  set_default

end
#added end *************  
#elsif ( params[:commit] == "National" ) then 
#  @profiles = Profile.all
  

#elsif ( params[:commit] == "State" ) then 
#  if params[:state] == "--" then
#    @profiles = Profile.with_state(current_user.profile.state)
#  else
#    @profiles = Profile.with_state(params[:state]) 
#  end
#else  #default to state report.
#  set_default
#end

  #these ranges are for the age groups.
  @ranges = [0..12,12..18,18..21,21..30,30..40,40..50,50..60,60..70,70..80,80..90,90..100,100..200]
  @ranges.each do |rng|
    
    @age_group << [rng, @profiles.with_ages(rng)] unless @profiles.with_ages(rng).count == 0
  end
  
end

#------------
private
  def set_default
    @filter = "By Zip codes #{@member_conditions.join(",")}"
    @profiles = Profile.with_zips(@member_conditions)  
  end
  

end
