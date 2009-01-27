class MedicationsController < ApplicationController

 before_filter :login_required
 
 
  # GET /medications
  # GET /medications.xml
  def index
    @medications = current_user.medications.find(:all, :order => "prescribed_start desc")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /medications/1
  # GET /medications/1.xml
  def show
    @medication = current_user.medications.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /medications/new
  # GET /medications/new.xml
  def new
    @medication = Medication.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /medications/1/edit
  def edit
    @medication = current_user.medications.find(params[:id])
  end

  # POST /medications
  # POST /medications.xml
  def create
    @medication = current_user.medications.new(params[:medication])

    respond_to do |format|
      if @medication.save
        flash[:notice] = 'Medication was successfully created.'
        format.html { redirect_to(medications_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /medications/1
  # PUT /medications/1.xml
  def update
    @medication = current_user.medications.find(params[:id])

    respond_to do |format|
      if @medication.update_attributes(params[:medication])
        flash[:notice] = 'Medication was successfully updated.'
        format.html { redirect_to(medications_path) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /medications/1
  # DELETE /medications/1.xml
  def destroy
    @medication = current_user.medications.find(params[:id])
    @medication.destroy

    respond_to do |format|
      format.html { redirect_to(medications_path) }
      format.xml  { head :ok }
    end
  end
end
