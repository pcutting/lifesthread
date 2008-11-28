class StartupsController < ApplicationController

 before_filter :login_required
 
 
  # GET /profiles
  # GET /profiles.xml
  def index
    @profiles = current_user.profile.find(:all)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = current_user.profile
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
  def new
    @profile = Profile.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = current_user.profile 
  end

  # POST /profiles
  # POST /profiles.xml
  def create
    @profile = current_user.build_profile(params[:profile]) 

    respond_to do |format|
      if @profile.save
        if @profile.terms_agreed != true 
        
          format.html { render :action => "update" }
        
        end
        flash[:notice] = 'Profile was successfully created.'
        format.html { redirect_to(@profile) }
        
      else
        format.html { render :action => "new" }
 
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = current_user.profile 

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Profile was successfully updated.'
        format.html { redirect_to(profile_path) }
         
      else
        format.html { render :action => "edit" }
         
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = current_user.profile 
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profile_path) }
    end
  end
end
