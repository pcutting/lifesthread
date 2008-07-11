class StressLogsController < ApplicationController
 before_filter :login_required
 before_filter :load_stress

  # GET /stress_logs
  # GET /stress_logs.xml
  def index
    @stress_logs = @stress.stress_logs.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /stress_logs/1
  # GET /stress_logs/1.xml
  def show
    @stress_log = @stress.stress_logs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /stress_logs/new
  # GET /stress_logs/new.xml
  def new
    @stress_log = StressLog.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /stress_logs/1/edit
  def edit
    @stress_log = @stress.stress_logs.find(params[:id])
  end

  # POST /stress_logs
  # POST /stress_logs.xml
  def create
    @stress_log = @stress.stress_logs.new(params[:stress_log])

    respond_to do |format|
      if @stress_log.save
        flash[:notice] = 'StressLog was successfully created.'
        format.html { redirect_to([@stress, @stress_log]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /stress_logs/1
  # PUT /stress_logs/1.xml
  def update
    @stress_log = @stress.stress_logs.find(params[:id])

    respond_to do |format|
      if @stress_log.update_attributes(params[:stress_log])
        flash[:notice] = 'StressLog was successfully updated.'
        format.html { redirect_to([@stress,@stress_log]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /stress_logs/1
  # DELETE /stress_logs/1.xml
  def destroy
    @stress_log = StressLog.find(params[:id])
    @stress_log.destroy

    respond_to do |format|
      format.html { redirect_to(stress_logs_url) }
    end
  end
  
private 

  def load_stress
    @stress = current_user.stresses.find(params[:stress_id])
  
  end
  
end
