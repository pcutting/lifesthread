class ExercisesController < ApplicationController
 before_filter :login_required
 before_filter :parent


  # GET /exercises
  def index
    @exercises = @parent.exercises

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /exercises/1
  def show
    @exercise = @parent.exercises.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /exercises/new
  # GET /exercises/new.xml
  def new
    @exercise = Exercise.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /exercises/1/edit
  def edit
    @exercise = @parent.exercises.find(params[:id])
  end

  # POST /exercises
  # POST /exercises.xml
  def create
    @exercise = @parent.exercises.new(params[:exercise])

    respond_to do |format|
      if @exercise.save
        flash[:notice] = 'Exercise was successfully created.'
        format.html { redirect_to parent_path(@parent) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /exercises/1
  # PUT /exercises/1.xml
  def update
    @exercise = @parent.exercises.find(params[:id])

    respond_to do |format|
      if @exercise.update_attributes(params[:exercise])
        flash[:notice] = 'Exercise was successfully updated.'
        format.html { redirect_to parent_path(@parent) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /exercises/1
  # DELETE /exercises/1.xml
  def destroy
    @exercise = @parent.exercises.find(params[:id])
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to parent_path(@parent) }
    end
  end
  
  
private 

  def parent
    @parent = parent_object
  end

  def parent_object
    case 
      when params[:fitness_plan_id] then current_user.fitness_plans.find_by_id(params[:fitness_plan_id])
      when params[:workout_id] then current_user.workouts.find_by_id(params[:workout_id])
    end
  end
  
  def parent_path(parent)
    case 
      when params[:fitness_plan_id] then fitness_plan_exercises_path(parent)
      when params[:workout_id] then workout_exercises_path(parent)
    end
  end
  
end
