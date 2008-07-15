class SupportsController < ApplicationController

 before_filter :login_required

  # GET /supports
  # GET /supports.xml
  def index
    @supports = current_user.supports.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /supports/1
  # GET /supports/1.xml
  def show
    @support = current_user.supports.find(params[:id])
    @support_dialogs = @support.support_dialogs.find(:all)
 
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /supports/new
  # GET /supports/new.xml
  def new
    @support = current_user.supports.new
    @support.reference_page = params[:ref_page] unless params[:ref_page].nil?
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /supports/1/edit
  def edit
    @support = current_user.supports.find(params[:id])
  end

  # POST /supports
  # POST /supports.xml
  def create
    
    if params[:commit] == "Add note" then   # do this if it's submitting a 'Add note' from the show view
      @support = current_user.supports.find(params[:support_id])
      @support_dialog = @support.support_dialogs.new(params[:support_dialog])
      saved = @support_dialog.save
      
    else
    
      @support = current_user.supports.new(params[:support])
      saved = @support.save
    end

    respond_to do |format|
      if saved
        flash[:notice] = 'Thank you for your support.'
        format.html { redirect_to(@support) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /supports/1
  # PUT /supports/1.xml
  def update
  

  
    @support = current_user.supports.find(params[:id])

    respond_to do |format|
      if @support.update_attributes(params[:support])
        flash[:notice] = 'Support was successfully updated.'
        format.html { redirect_to(@support) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /supports/1
  # DELETE /supports/1.xml
  def destroy
    @support = current_user.supports.find(params[:id])
    @support.destroy

    respond_to do |format|
      format.html { redirect_to(supports_path) }
    end
  end
end
