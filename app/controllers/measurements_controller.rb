class MeasurementsController < ApplicationController
 before_filter :login_required
 
 
  # GET /measurements
  # GET /measurements.xml
  def index
    @measurements = current_user.measurements.find(:all, :order => "measured_on desc")

    @measurement = Measurement.new
    

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @measurements }
    end
  end

  # GET /measurements/1
  # GET /measurements/1.xml
  def show
    @measurement = current_user.measurements.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measurement }
    end
  end

  # GET /measurements/new
  # GET /measurements/new.xml
  def new
    @measurement = Measurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @measurement }
    end
  end

  # GET /measurements/1/edit
  def edit
    @measurement = current_user.measurements.find(params[:id])
  end

  # POST /measurements
  # POST /measurements.xml
  def create
    @measurement = current_user.measurements.new(params[:measurement])

    respond_to do |format|
      if @measurement.save
        flash[:notice] = 'Measurement was successfully created.'
        format.html { redirect_to(measurements_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /measurements/1
  # PUT /measurements/1.xml
  def update
    @measurement = current_user.measurements.find(params[:id])

    respond_to do |format|
      if @measurement.update_attributes(params[:measurement])
        flash[:notice] = 'Measurement was successfully updated.'
        format.html { redirect_to(@measurement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measurement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.xml
  def destroy
    @measurement = current_user.measurements.find(params[:id])
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to(measurements_path) }
      format.xml  { head :ok }
    end
  end
end
