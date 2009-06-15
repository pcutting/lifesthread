class Admin::PharmacyNoticesController < Admin::BaseController
  # GET /pharmacy_notices
  # GET /pharmacy_notices.xml
  def index
    @pharmacy_notices = PharmacyNotices.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pharmacy_notices }
    end
  end

  # GET /pharmacy_notices/1
  # GET /pharmacy_notices/1.xml
  def show
    @pharmacy_notices = PharmacyNotices.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pharmacy_notices }
    end
  end

  # GET /pharmacy_notices/new
  # GET /pharmacy_notices/new.xml
  def new
    @pharmacy_notices = PharmacyNotices.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pharmacy_notices }
    end
  end

  # GET /pharmacy_notices/1/edit
  def edit
    @pharmacy_notices = PharmacyNotices.find(params[:id])
  end

  # POST /pharmacy_notices
  # POST /pharmacy_notices.xml
  def create
    unless params[:acode].nil? then 

      sponsor_code = params[:acode] 
      #raise params.to_yaml
       
      @sponsor = Sponsor.find_by_code(sponsor_code[:code])     
      @pharmacy_notice = @sponsor.pharmacy_notices.new(params[:pharmacy_notice])     
      #raise @pharmacy_notice.to_yaml   
      respond_to do |format|
        if @pharmacy_notice.save
          flash[:notice] = 'Pharmacynotices was successfully created.'
          format.html { redirect_to(admin_sponsor_path(@sponsor)) }
        else
          format.html { render :action => "new" }
        end
      end

    else #not from sponsor views. 
 
    @pharmacy_notices = PharmacyNotices.new(params[:pharmacy_notices])

    respond_to do |format|
      if @pharmacy_notices.save
        flash[:notice] = 'PharmacyNotices was successfully created.'
        format.html { redirect_to(@pharmacy_notices) }
        format.xml  { render :xml => @pharmacy_notices, :status => :created, :location => @pharmacy_notices }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pharmacy_notices.errors, :status => :unprocessable_entity }
      end
    end
    end # end if param is from sponsor show
  end

  # PUT /pharmacy_notices/1
  # PUT /pharmacy_notices/1.xml
  def update
    @pharmacy_notices = PharmacyNotices.find(params[:id])

    respond_to do |format|
      if @pharmacy_notices.update_attributes(params[:pharmacy_notices])
        flash[:notice] = 'PharmacyNotices was successfully updated.'
        format.html { redirect_to(@pharmacy_notices) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pharmacy_notices.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacy_notices/1
  # DELETE /pharmacy_notices/1.xml
  def destroy
    @pharmacy_notices = PharmacyNotices.find(params[:id])
    @pharmacy_notices.destroy

    respond_to do |format|
      format.html { redirect_to(pharmacy_notices_url) }
      format.xml  { head :ok }
    end
  end
end
