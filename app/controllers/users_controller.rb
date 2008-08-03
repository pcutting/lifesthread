class UsersController < ApplicationController

layout "entry"

  # render new.rhtml
  def new

  end


  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    
    @user = User.new(params[:user])
    @user.admin = false
    @user.save
    @profile = Profile.new
    @user.profile = @profile
    @user.profile.save
    
    if @user.errors.empty?
      self.current_user = @user
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
    else
      flash[:notice] = "There was an error in creating your account."
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to( admin_users_path) }
      else
        flash[:notice] = 'Unable to save changes.'
        format.html { render :action => "edit" }
      end
    end
  end



end
