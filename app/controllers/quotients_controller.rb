class QuotientsController < ApplicationController
  # GET /quotients
  # GET /quotients.xml
  def index
    @quotients = Quotient.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quotients }
    end
  end

  # GET /quotients/1
  # GET /quotients/1.xml
  def show
    @quotient = Quotient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quotient }
    end
  end

  # GET /quotients/new
  # GET /quotients/new.xml
  def new
    @quotient = Quotient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quotient }
    end
  end

  # GET /quotients/1/edit
  def edit
    @quotient = Quotient.find(params[:id])
  end

  # POST /quotients
  # POST /quotients.xml
  def create
    @quotient = Quotient.new(params[:quotient])

    respond_to do |format|
      if @quotient.save
        flash[:notice] = 'Quotient was successfully created.'
        format.html { redirect_to(@quotient) }
        format.xml  { render :xml => @quotient, :status => :created, :location => @quotient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quotient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quotients/1
  # PUT /quotients/1.xml
  def update
    @quotient = Quotient.find(params[:id])

    respond_to do |format|
      if @quotient.update_attributes(params[:quotient])
        flash[:notice] = 'Quotient was successfully updated.'
        format.html { redirect_to(@quotient) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quotient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotients/1
  # DELETE /quotients/1.xml
  def destroy
    @quotient = Quotient.find(params[:id])
    @quotient.destroy

    respond_to do |format|
      format.html { redirect_to(quotients_url) }
      format.xml  { head :ok }
    end
  end
end
