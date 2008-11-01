class SleepsController < ApplicationController
 before_filter :login_required
 
  # GET /sleeps
  # GET /sleeps.xml
  def index
    @sleeps = current_user.sleeps.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sleeps }
    end
  end

  # GET /sleeps/1
  # GET /sleeps/1.xml
  def show
    @sleep = current_user.sleeps.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sleep }
    end
  end

  # GET /sleeps/new
  # GET /sleeps/new.xml
  def new
    @sleep = Sleep.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sleep }
    end
  end

  # GET /sleeps/1/edit
  def edit
    @sleep = current_user.sleeps.find(params[:id])
  end

  # POST /sleeps
  # POST /sleeps.xml
  def create
    @sleep = current_user.sleeps.new(params[:sleep])

    respond_to do |format|
      if @sleep.save
        flash[:notice] = 'Sleep was successfully created.'
        format.html { redirect_to(@sleep) }
        format.xml  { render :xml => @sleep, :status => :created, :location => @sleep }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sleep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sleeps/1
  # PUT /sleeps/1.xml
  def update
    @sleep = current_user.sleeps.find(params[:id])

    respond_to do |format|
      if @sleep.update_attributes(params[:sleep])
        flash[:notice] = 'Sleep was successfully updated.'
        format.html { redirect_to(@sleep) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sleep.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sleeps/1
  # DELETE /sleeps/1.xml
  def destroy
    @sleep = current_user.sleeps.find(params[:id])
    @sleep.destroy

    respond_to do |format|
      format.html { redirect_to(sleeps_path) }
      format.xml  { head :ok }
    end
  end
end
