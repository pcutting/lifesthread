class Member::UsersController < Member::BaseController

before_filter :load_member_conditions

  def index
    @users = User.paginate :page => params[:page] , :per_page => 100 , :order => 'login asc'

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
#-----------------
private

  def load_member_conditions
    @roles = current_user.roles.find(:all, :conditions => ["has_role = ? OR has_role = ?", "MEMBER","SUPER MEMBER" ])
    @conditions = Array.new
    
    #consider getting rid of this and just doing @roles.each {|role| role.conditions ... }
    @roles.each do |role|
      @conditions << role.conditions
    end
    
  end

end
