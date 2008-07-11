class JournalsController < ApplicationController
 before_filter :login_required
 before_filter :load_relationship

  # GET /journals
  # GET /journals.xml
  def index
    @journals = @relationship.journals.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @journals }
    end
  end

  # GET /journals/1
  # GET /journals/1.xml
  def show
    @journal = @relationship.journals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @journal }
    end
  end

  # GET /journals/new
  # GET /journals/new.xml
  def new
    @journal = Journal.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /journals/1/edit
  def edit
    @journal = @relationship.journals.find(params[:id])
  end

  # POST /journals
  # POST /journals.xml
  def create
    @journal = @relationship.journals.new(params[:journal])

    respond_to do |format|
      if @journal.save
        flash[:notice] = 'Journal was successfully created.'
        format.html { redirect_to([@relationship, @journal]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /journals/1
  # PUT /journals/1.xml
  def update
    @journal = @relationship.journals.find(params[:id])

    respond_to do |format|
      if @journal.update_attributes(params[:journal])
        flash[:notice] = 'Journal was successfully updated.'
        format.html { redirect_to([@relationship, @journal]) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /journals/1
  # DELETE /journals/1.xml
  def destroy
    @journal = @relationship.journals.find(params[:id])
    @journal.destroy

    respond_to do |format|
      format.html { redirect_to(relationship_journals_path(@relationship)) }
    end
  end
  
private

  def load_relationship
    @relationship = current_user.relationships.find(params[:relationship_id])
  end
end
