class SupportDialogsController < ApplicationController

 before_filter :login_required , :load_support

  # GET /support_dialogs
  # GET /support_dialogs.xml
  def index
    @support_dialogs = @support.support_dialogs.find(:all)

    respond_to do |format|
      format.html # index.html.erb

    end
  end

  # GET /support_dialogs/1
  # GET /support_dialogs/1.xml
  def show
    @support_dialog = @support.support_dialogs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /support_dialogs/new
  # GET /support_dialogs/new.xml
  def new
    @support_dialog = @support.support_dialogs.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /support_dialogs/1/edit
  def edit
    @support_dialog = @support.support_dialogs.find(params[:id])
  end

  # POST /support_dialogs
  # POST /support_dialogs.xml
  def create
    @support_dialog = @support.support_dialogs.new(params[:support_dialog])

    respond_to do |format|
      if @support_dialog.save
        flash[:notice] = 'SupportDialog was successfully created.'
        format.html { redirect_to([@support, @support_dialog]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /support_dialogs/1
  # PUT /support_dialogs/1.xml
  def update
    @support_dialog = @support.support_dialogs.find(params[:id])

    respond_to do |format|
      if @support_dialog.update_attributes(params[:support_dialog])
        flash[:notice] = 'SupportDialog was successfully updated.'
        format.html { redirect_to([@support, @support_dialog]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /support_dialogs/1
  # DELETE /support_dialogs/1.xml
  def destroy
    @support_dialog = @support.support_dialogs.find(params[:id])
    @support_dialog.destroy

    respond_to do |format|
      format.html { redirect_to(support_support_dialogs_path(@support)) }
    end
  end
  
private 
  
  def load_support
    @support = Support.find(params[:support_id])
  end
  
  
end
