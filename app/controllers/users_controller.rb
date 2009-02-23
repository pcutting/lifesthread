class UsersController < ApplicationController

layout "setup"

  # render new.rhtml
  def new

  end


  def create
  
      #raise @results.to_yaml

    tryAgain = false
      cookies.delete :auth_token
      # protects against session fixation attacks, wreaks havoc with 
      # request forgery protection.
      # uncomment at your own risk
      # reset_session
      prof = params[:profile]
      
      #raise prof.to_yaml
      
      
      @user = User.new(params[:user])
      @user.admin = false
      if (params[:terms_agreed].nil? )
        tryAgain = true 
        flash[:notice] = 'Please check "I agree" for the terms and conditions.'      
      else
        @user.save 
        @profile = Profile.new
        @user.profile = @profile
        @user.profile.zip = prof[:zip_code]
        @user.profile.sponsor_id = prof[:sponsor_id]
        @user.profile.super_member_id = prof[:sponsor_id]
        @user.profile.height_inch = (prof[:feet].to_i * 12) + prof[:inches].to_i
        @user.profile.dob = prof[:dob]
        
        #@user.profile.zip = params[:zip]
        @user.profile.terms_agreed = true
        profile_save = @user.profile.save
        
        #raise @user.errors.to_yaml
      end
      
      if @user.errors.empty? && tryAgain == false
        self.current_user = @user
        #redirect_back_or_default('/')
        flash[:notice] = "Thanks for signing up!"
        respond_to do |format|
          format.html  { redirect_to (new_quotient_path) }
        end
      else
        flash[:notice] += "There was an error in creating your account."
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
