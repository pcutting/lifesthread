class SponsorsController < ApplicationController
 before_filter :login_required
 
  # GET /measurements/1
  # GET /measurements/1.xml
  def show
   
    @sponsor = Sponsor.find(params[:id])
    @events = @sponsor.pharmacy_events.all
    @pharmacy_notices = @sponsor.pharmacy_notices.all
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measurement }
    end
  end

  # GET /measurements/new
  # GET /measurements/new.xml

end
