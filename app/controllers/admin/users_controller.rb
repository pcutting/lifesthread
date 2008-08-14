class Admin::UsersController < Admin::BaseController

  def index
    @users = User.paginate :page => params[:page] , :per_page => 100 , :order => 'login asc'

  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
    @roles = @user.roles.all
    @profile = @user.profile
    
  end

  def update
    @user = User.find(params[:id])
    @user.admin = true if params[:user][:admin]
    @user.admin = false if params[:user][:admin].nil? || params[:user][:admin]== "0"
    
    # Parameters: {"user"=>{"public"=>"0", "admin"=>"0", "first_name"=>"Warner", "time_zone"=>"Arizona", "last_name"=>"Wardle", "email"=>"z_1218523237_0@testuser.com", "middle_name"=>"N"}, "commit"=>"Update", "leader"=>"1", "conditions"=>"04102", "authenticity_token"=>"17f223eaa077da3ac510a01515056c12d6091587", "_method"=>"put", "action"=>"update", "has_role"=>"MEMBER", "id"=>"1016097037", "controller"=>"admin/users"}

    unless params[:has_role] == "" then
      @role = @user.roles.new
      @role.has_role = params[:has_role]
      @role.conditions = params[:conditions]
      @role.leader = params[:leader] rescue @role.leader = false
      
      if @role.save then
        #saved message
      else
        #failed message
      end
    
    end 
    
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
