class BpsController < ApplicationController
 before_filter :login_required

   
   
  # GET /bps
  # GET /bps.xml
  def index
    #@bps = current_user.bps.find(:all, :order => "measured_on desc" )
    @blood_pressures = current_user.bps.paginate( :page => params[:page], :per_page => 30 , :order =>  "measured_on desc")
    #   @users = User.paginate :page => params[:page]  , :order => 'login asc'

    @bp = Bp.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bps }
    end
  end

  # GET /bps/1
  # GET /bps/1.xml
  def show
    @bp = current_user.bps.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /bps/new
  # GET /bps/new.xml
  def new
    @bp = Bp.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /bps/1/edit
  def edit
    @bp = current_user.bps.find(params[:id])
  end

  # POST /bps
  # POST /bps.xml
  def create
    @bp = current_user.bps.new(params[:bp])

    respond_to do |format|
      if @bp.save
        flash[:notice] = 'Bp was successfully created.'
        format.html { redirect_to(bps_path) }
        format.xml  { render :xml => @bp, :status => :created, :location => @bp }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bps/1
  # PUT /bps/1.xml
  def update
    @bp = current_user.bps.find(params[:id])

    respond_to do |format|
      if @bp.update_attributes(params[:bp])
        flash[:notice] = 'Bp was successfully updated.'
        format.html { redirect_to(@bp) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bps/1
  # DELETE /bps/1.xml
  def destroy
    @bp = current_user.bps.find(params[:id])
    @bp.destroy

    respond_to do |format|
      format.html { redirect_to(bps_path) }
      format.xml  { head :ok }
    end
  end
  

end
