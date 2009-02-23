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
        @user.save ?  {} : tryAgain = true
        
        #raise tryAgain.inspect
        
        #raise @user.errors.to_yaml
        
        if (@user.profile.nil?) then 
          @profile = Profile.new
        else 
          @profile = @user.profile
        end 
        
        
        @profile.zip = prof[:zip_code] ||= "00000"
        @profile.sponsor_id = prof[:sponsor_id] ||= "0000"
        @profile.super_member_id = prof[:sponsor_id] ||= "0000"
        @profile.height_inch = ( (prof[:feet].to_i ||= 0) * 12) + (prof[:inches].to_i ||= 0)
        @profile.dob = prof[:dob] ||= Date.current
        
        #@user.profile.zip = params[:zip]
        @profile.terms_agreed = true
        
        @user.profile = @profile
        @user.profile.save ? {} : tryAgain = false
        
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
