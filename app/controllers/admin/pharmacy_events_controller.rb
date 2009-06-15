class Admin::PharmacyEventsController < Admin::BaseController

  # GET /pharmacy_events
  # GET /pharmacy_events.xml
  def index
    @pharmacy_events = @sponsor.pharmacy_events.all # PharmacyEvents.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pharmacy_events }
    end
  end

  # GET /pharmacy_events/1
  # GET /pharmacy_events/1.xml
  def show
    @pharmacy_event = PharmacyEvents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pharmacy_events }
    end
  end

  # GET /pharmacy_events/new
  # GET /pharmacy_events/new.xml
  def new
    @pharmacy_event = PharmacyEvents.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pharmacy_events }
    end
  end
    
  # GET /pharmacy_events/1/edit
  def edit
    @pharmacy_event = PharmacyEvents.find(params[:id])
  end

  # POST /pharmacy_events
  # POST /pharmacy_events.xml
  def create
    unless params[:acode].nil? then 

      sponsor_code = params[:acode] 
      #raise sponsor_code[:code].to_yaml
       
      @sponsor = Sponsor.find_by_code(sponsor_code[:code])     
      @pharmacy_event = @sponsor.pharmacy_events.new(params[:pharmacy_event])     
      #raise @pharmacy_event.to_yaml   
      respond_to do |format|
        if @pharmacy_event.save
          flash[:notice] = 'PharmacyEvents was successfully created.'
          format.html { redirect_to(admin_sponsor_path(@sponsor)) }
        else
          format.html { render :action => "new" }
        end
      end

    else #not from sponsor views.   
   
    @pharmacy_event = PharmacyEvents.new(params[:pharmacy_events])
    respond_to do |format|
      if @pharmacy_event.save
        flash[:notice] = 'PharmacyEvents was successfully created.'
        format.html { redirect_to(@pharmacy_event) }      
      else
        format.html { render :action => "new" }
      end

    end #end if.
    end
  end
    
  # PUT /pharmacy_events/1
  # PUT /pharmacy_events/1.xml
  def update
    @pharmacy_event = PharmacyEvents.find(params[:id])
    
    respond_to do |format|
      if @pharmacy_event.update_attributes(params[:pharmacy_event])
        flash[:notice] = 'PharmacyEvents was successfully updated.'
        format.html { redirect_to(@pharmacy_event) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
    
  # DELETE /pharmacy_events/1
  # DELETE /pharmacy_events/1.xml
  def destroy
    @pharmacy_event = PharmacyEvents.find(params[:id])
    @pharmacy_event.destroy
    
    respond_to do |format|
      format.html { redirect_to(pharmacy_events_url) }
    end
  end
end 
