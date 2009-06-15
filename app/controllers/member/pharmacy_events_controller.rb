class PharmacyEventsController < ApplicationController
  # GET /pharmacy_events
  # GET /pharmacy_events.xml
  def index
    @pharmacy_events = PharmacyEvents.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pharmacy_events }
    end
  end

  # GET /pharmacy_events/1
  # GET /pharmacy_events/1.xml
  def show
    @pharmacy_events = PharmacyEvents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pharmacy_events }
    end
  end

  # GET /pharmacy_events/new
  # GET /pharmacy_events/new.xml
  def new
    @pharmacy_events = PharmacyEvents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pharmacy_events }
    end
  end

  # GET /pharmacy_events/1/edit
  def edit
    @pharmacy_events = PharmacyEvents.find(params[:id])
  end

  # POST /pharmacy_events
  # POST /pharmacy_events.xml
  def create
    @pharmacy_events = PharmacyEvents.new(params[:pharmacy_events])

    respond_to do |format|
      if @pharmacy_events.save
        flash[:notice] = 'PharmacyEvents was successfully created.'
        format.html { redirect_to(@pharmacy_events) }
        format.xml  { render :xml => @pharmacy_events, :status => :created, :location => @pharmacy_events }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pharmacy_events.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pharmacy_events/1
  # PUT /pharmacy_events/1.xml
  def update
    @pharmacy_events = PharmacyEvents.find(params[:id])

    respond_to do |format|
      if @pharmacy_events.update_attributes(params[:pharmacy_events])
        flash[:notice] = 'PharmacyEvents was successfully updated.'
        format.html { redirect_to(@pharmacy_events) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pharmacy_events.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacy_events/1
  # DELETE /pharmacy_events/1.xml
  def destroy
    @pharmacy_events = PharmacyEvents.find(params[:id])
    @pharmacy_events.destroy

    respond_to do |format|
      format.html { redirect_to(pharmacy_events_url) }
      format.xml  { head :ok }
    end
  end
end
