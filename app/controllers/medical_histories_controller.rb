class MedicalHistoriesController < ApplicationController
 before_filter :login_required

  # GET /medical_histories
  # GET /medical_histories.xml
  def index
    @medical_histories = current_user.medical_histories.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /medical_histories/1
  # GET /medical_histories/1.xml
  def show
    @medical_history = current_user.medical_histories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /medical_histories/new
  # GET /medical_histories/new.xml
  def new
    @medical_history = MedicalHistory.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /medical_histories/1/edit
  def edit
    @medical_history = current_user.medical_histories.find(params[:id])
  end

  # POST /medical_histories
  # POST /medical_histories.xml
  def create
    @medical_history = current_user.medical_histories.new(params[:medical_history])

    respond_to do |format|
      if @medical_history.save
        flash[:notice] = 'MedicalHistory was successfully created.'
        format.html { redirect_to(@medical_history) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /medical_histories/1
  # PUT /medical_histories/1.xml
  def update
    @medical_history = current_user.medical_histories.find(params[:id])

    respond_to do |format|
      if @medical_history.update_attributes(params[:medical_history])
        flash[:notice] = 'MedicalHistory was successfully updated.'
        format.html { redirect_to(@medical_history) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /medical_histories/1
  # DELETE /medical_histories/1.xml
  def destroy
    @medical_history = current_user.medical_histories.find(params[:id])
    @medical_history.destroy

    respond_to do |format|
      format.html { redirect_to(medical_histories_path) }
    end
  end
end
