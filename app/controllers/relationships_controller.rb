class RelationshipsController < ApplicationController
 before_filter :login_required

  # GET /relationships
  # GET /relationships.xml
  def index
    @relationships = current_user.relationships.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /relationships/1
  # GET /relationships/1.xml
  def show
    @relationship = current_user.relationships.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /relationships/new
  # GET /relationships/new.xml
  def new
    @relationship = Relationship.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /relationships/1/edit
  def edit
    @relationship = current_user.relationships.find(params[:id])
  end


  # POST /relationships
  # POST /relationships.xml
  def create
    @relationship = current_user.relationships.new(params[:relationship])

    respond_to do |format|
      if @relationship.save
        flash[:notice] = 'Relationship was successfully created.'
        format.html { redirect_to(@relationship) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /relationships/1
  # PUT /relationships/1.xml
  def update
    @relationship = current_user.relationships.find(params[:id])

    respond_to do |format|
      if @relationship.update_attributes(params[:relationship])
        flash[:notice] = 'Relationship was successfully updated.'
        format.html { redirect_to(@relationship) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.xml
  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to(relationships_path) }
    end
  end
end
