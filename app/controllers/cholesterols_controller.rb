class CholesterolsController < ApplicationController

 before_filter :login_required
 
 
  # GET /cholesterols
  # GET /cholesterols.xml
  def index
    @cholesterols = current_user.cholesterols.find(:all, :order => "measured_on desc")
    @cholesterol = Cholesterol.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /cholesterols/1
  # GET /cholesterols/1.xml
  def show
    @cholesterol = current_user.cholesterols.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /cholesterols/new
  # GET /cholesterols/new.xml
  def new
    @cholesterol = Cholesterol.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /cholesterols/1/edit
  def edit
    @cholesterol = current_user.cholesterols.find(params[:id])
  end

  # POST /cholesterols
  # POST /cholesterols.xml
  def create
    @cholesterol = current_user.cholesterols.new(params[:cholesterol])

    respond_to do |format|
      if @cholesterol.save
        flash[:notice] = 'Cholesterol was successfully created.'
        format.html { redirect_to(cholesterols_path) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /cholesterols/1
  # PUT /cholesterols/1.xml
  def update
    @cholesterol = current_user.cholesterols.find(params[:id])

    respond_to do |format|
      if @cholesterol.update_attributes(params[:cholesterol])
        flash[:notice] = 'Cholesterol was successfully updated.'
        format.html { redirect_to(@cholesterol) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /cholesterols/1
  # DELETE /cholesterols/1.xml
  def destroy
    @cholesterol = current_user.cholesterols.find(params[:id])
    @cholesterol.destroy

    respond_to do |format|
      format.html { redirect_to(cholesterols_path) }
    end
  end
end
