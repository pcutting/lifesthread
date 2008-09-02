class Admin::ReportsController < Admin::BaseController


def index

  @age_group = Array.new
  @filter = ""
if ( params[:commit] == "By Member" )then
  @filter = "By Member #{params[:report_option]}"
  if params[:report_option] != "" then
    @profiles = Profile.with_rx_affiliate_no(params[:report_option])
  else 
    flash[:notice] = "Please enter the Member id and then submit 'By Member' again."
    set_default
  end
  
elsif  ( params[:commit] == "By Zip" ) then 
  @filter = "By Zip #{params[:report_option]}"
  if params[:report_option]=="" then 
   set_default 
   flash[:notice] = "Please enter the Zip code you want to report on and press 'By Zip' again."
   
  else
   @profiles = Profile.with_zips(params[:report_option])
  end
  
elsif ( params[:commit] == "National" ) then 
  @filter = "National stats"
  @profiles = Profile.with_all
  
else  #default to state report.
  set_default
end


  #these ranges are for the age groups.
  @ranges = [0..12,12..18,18..21,21..30,30..40,40..50,50..60,60..70,70..80,80..90,90..100,100..200]
  @ranges.each do |rng|
    @age_group << [rng, @profiles.with_ages(rng)] unless @profiles.with_ages(rng).count == 0
  end
  
  respond_to do |format|
    format.html { render :what => params[:what] } # index.html.erb
  end

end

#------------
private
  def set_default
    if params[:state].nil?  or params[:state] == "" then
      @state = "ME"
    else
      @state = params[:state]
    end
    @filter = "By State #{@state}"
    @profiles = Profile.with_state(@state)  
  end
  


end
