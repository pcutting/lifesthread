class Admin::UsersController < Admin::BaseController

  def index
    @users = User.paginate :page => params[:page]  , :order => 'login asc'

  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.admin = true if params[:user][:admin]
    
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

  def destroy
    @user = User.find(params[:id])
    #currently will not delete users.
    #@user.destroy
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end

end
