class FitnessPlansController < ApplicationController

 before_filter :login_required

  # GET /fitness_plans
  def index
    @fitness_plans = current_user.fitness_plans.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /fitness_plans/1
  def show
    @fitness_plan = current_user.fitness_plans.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /fitness_plans/new
  def new
    @fitness_plan = FitnessPlan.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /fitness_plans/1/edit
  def edit
    @fitness_plan = current_user.fitness_plans.find(params[:id])
  end

  # POST /fitness_plans
  def create
    @fitness_plan = current_user.fitness_plans.new(params[:fitness_plan])

    respond_to do |format|
      if @fitness_plan.save
        flash[:notice] = 'FitnessPlan was successfully created.'
        format.html { redirect_to(@fitness_plan) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /fitness_plans/1
  # PUT /fitness_plans/1.xml
  def update
    @fitness_plan = current_user.fitness_plans.find(params[:id])

    respond_to do |format|
      if @fitness_plan.update_attributes(params[:fitness_plan])
        flash[:notice] = 'FitnessPlan was successfully updated.'
        format.html { redirect_to(@fitness_plan) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /fitness_plans/1
  # DELETE /fitness_plans/1.xml
  def destroy
    @fitness_plan = current_user.fitness_plans.find(params[:id])
    @fitness_plan.destroy

    respond_to do |format|
      format.html { redirect_to(fitness_plans_path) }
    end
  end
end
