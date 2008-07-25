class Admin::UsersController < Admin::BaseController

  def index
    @users = User.find(:all )
  end

  def show
    @user = User.find(params[:id])

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
