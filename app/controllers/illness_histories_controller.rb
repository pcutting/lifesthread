class IllnessHistoriesController < ApplicationController
 before_filter :login_required
 
 
  # GET /illness_histories
  # GET /illness_histories.xml
  def index
    @illness_histories = current_user.illness_histories.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /illness_histories/1
  # GET /illness_histories/1.xml
  def show
    @illness_history = current_user.illness_histories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /illness_histories/new
  # GET /illness_histories/new.xml
  def new
    @illness_history = IllnessHistory.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /illness_histories/1/edit
  def edit
    @illness_history = current_user.illness_histories.find(params[:id])
  end

  # POST /illness_histories
  # POST /illness_histories.xml
  def create
    @illness_history = current_user.illness_histories.new(params[:illness_history])

    respond_to do |format|
      if @illness_history.save
        flash[:notice] = 'IllnessHistory was successfully created.'
        format.html { redirect_to(@illness_history) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /illness_histories/1
  # PUT /illness_histories/1.xml
  def update
    @illness_history = current_user.illness_histories.find(params[:id])

    respond_to do |format|
      if @illness_history.update_attributes(params[:illness_history])
        flash[:notice] = 'IllnessHistory was successfully updated.'
        format.html { redirect_to(@illness_history) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /illness_histories/1
  # DELETE /illness_histories/1.xml
  def destroy
    @illness_history = current_user.illness_histories.find(params[:id])
    @illness_history.destroy

    respond_to do |format|
      format.html { redirect_to(illness_histories_url) }
    end
  end
end
