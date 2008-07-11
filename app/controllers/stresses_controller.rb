class StressesController < ApplicationController

 before_filter :login_required
 
 
  # GET /stresses
  # GET /stresses.xml
  def index
    @stresses = current_user.stresses.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /stresses/1
  # GET /stresses/1.xml
  def show
    @stress = current_user.stresses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /stresses/new
  # GET /stresses/new.xml
  def new
    @stress = Stress.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /stresses/1/edit
  def edit
    @stress = current_user.stresses.find(params[:id])
  end

  # POST /stresses
  # POST /stresses.xml
  def create
    @stress = current_user.stresses.new(params[:stress])

    respond_to do |format|
      if @stress.save
        flash[:notice] = 'Stress was successfully created.'
        format.html { redirect_to(@stress) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /stresses/1
  # PUT /stresses/1.xml
  def update
    @stress = current_user.stresses.find(params[:id])

    respond_to do |format|
      if @stress.update_attributes(params[:stress])
        flash[:notice] = 'Stress was successfully updated.'
        format.html { redirect_to(@stress) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /stresses/1
  # DELETE /stresses/1.xml
  def destroy
    @stress = current_user.stresses.find(params[:id])
    @stress.destroy

    respond_to do |format|
      format.html { redirect_to(stresses_url) }
    end
  end
end
