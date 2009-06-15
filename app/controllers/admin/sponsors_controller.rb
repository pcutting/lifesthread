class Admin::SponsorsController < Admin::BaseController

  # GET /sponsors
  # GET /sponsors.xml
  def index
    @sponsors = Sponsor.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sponsors }
    end
  end

  # GET /sponsors/1
  # GET /sponsors/1.xml
  def show
    @sponsor = Sponsor.find(params[:id])
    @events = @sponsor.pharmacy_events.all
    @pharmacy_notices = @sponsor.pharmacy_notices.all
    @pharmacy_event_new = @sponsor.pharmacy_events.new
    @pharmacy_notice_new = @sponsor.pharmacy_notices.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sponsor }
    end
  end

  # GET /sponsors/new
  # GET /sponsors/new.xml
  def new
    @sponsor = Sponsor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sponsor }
    end
  end

  # GET /sponsors/1/edit
  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  # POST /sponsors
  # POST /sponsors.xml
  def create
  
    railse params.to_yaml
  
    @sponsor = Sponsor.new(params[:sponsor])
    respond_to do |format|
    
    #raise @sponsor.to_yaml
      if @sponsor.save
        flash[:notice] = 'Sponsor was successfully created.'
        format.html { redirect_to(admin_sponsor_path(@sponsor)) }
   #    format.html { redirect_to( edit_admin_user_path(params[:user])) } 
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /sponsors/1
  # PUT /sponsors/1.xml
  def update
    @sponsor = Sponsor.find(params[:id])
    
    #  raise @sponsor.to_yaml
    respond_to do |format|
      if @sponsor.update_attributes(params[:sponsor])
        flash[:notice] = 'Sponsor was successfully updated.'
        format.html { redirect_to(admin_sponsor_path(@sponsor)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.xml
  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.destroy

    respond_to do |format|
      format.html { redirect_to(admin_sponsors_url) }
      format.xml  { head :ok }
    end
  end
end
