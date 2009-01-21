class Member::UsersController < Member::BaseController

before_filter :load_member_conditions

  def index
    @users = User.paginate :page => params[:page] , :per_page => 100 , :order => 'login asc' ,  :include => :profile, :conditions => ["profiles.zip IN (?)", @member_conditions ] 
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
    
    unless params[:has_role] == "" then
      if @member_roles.include?(params[:has_role]) && @member_conditions.include?(params[:conditions]) then
      
        @role = @user.roles.new
        @role.has_role = params[:has_role]
        @role.conditions = params[:conditions]
        @role.leader = false
        
        if @role.save then
          #saved message
        else
          #failed message
        end
      
      end # verify that this member can grant role.
    
    end     
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to( edit_member_user_path(params[:user])) }
      else
        flash[:notice] = 'Unable to save changes.'
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    #@user = User.find(params[:id])
    @role = Role.find(params[:id])
    @role.destroy
    
    #currently will not delete users.
    #@user.destroy
    
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
#-----------------
private



end
