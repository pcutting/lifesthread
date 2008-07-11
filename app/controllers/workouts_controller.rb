class WorkoutsController < ApplicationController
  before_filter :login_required
  before_filter :parent
 
  # GET /workouts
  def index
    @workouts = current_user.workouts.find(:all)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /workouts/1
  def show
    @workout = current_user.workouts.find(params[:id])
    @exercises = @workout.exercises

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /workouts/new
  def new
    @workout = Workout.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /workouts/1/edit
  def edit
    @workout = current_user.workouts.find(params[:id])
  end

  # POST /workouts
  def create
    @workout = current_user.workouts.new(params[:workout])

    respond_to do |format|
      if @workout.save
        flash[:notice] = 'Workout was successfully created.'
        format.html { redirect_to(@workout) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /workouts/1
  def update
    if params[:commit] == "Use plan" then # create a workout plan 
      
      @plan = params[:plan]
      @fitnessplan = current_user.fitness_plans.find(@plan[:plan_id])
      @wo = current_user.workouts.new()
      
      
      
      #if there are any notes from the Fitness plan, make sure to copy them over to the workout model here
      
      @wo.day = Time.now
      @wo.start_time = Time.now
      @wo.title = @fitnessplan.label
      
      @wo.save
      
      
      for exercise in @fitnessplan.exercises.find(:all)
        @set = @wo.exercises.new
        @set.exercisable_id = @wo.id
        @set.exercisable_type = "Workout"
        @set.style = exercise.style
        @set.exercise = exercise.exercise
        @set.length = exercise.length
        @set.reps = exercise.reps
        @set.resistance = exercise.resistance 
        @set.unit= exercise.unit
        @set.calories_burned = exercise.calories_burned
        @set.intensity = exercise.intensity
        @set.comfort_level = exercise.comfort_level
        
        @set.save
        
                
      end
      
      respond_to do |format|
        if @wo.save
          flash[:notice] = 'Workout was successfully updated.'
          format.html { redirect_to(@wo) }
        else
          format.html { render :action => "edit" }
        end
      end
      
    
    else #update the normal record
      
      @workout = current_user.workouts.find(params[:id])
      
    
      

      respond_to do |format|
        if @workout.update_attributes(params[:workout])
          flash[:notice] = 'Workout was successfully updated.'
          format.html { redirect_to(@workout) }
        else
          format.html { render :action => "edit" }
        end #if @workout...
      end #respond
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.xml
  def destroy
    @workout = current_user.workouts.find(params[:id])
    @workout.destroy

    respond_to do |format|
      format.html { redirect_to(workouts_url) }

    end
  end
  
private

  def parent
    @parent = parent_object
  end

  def parent_object
    case 
      when params[:fitness_plan_id] then current_user.fitness_plans.find_by_id(params[:fitness_plan_id])
      when params[:id] then current_user.workouts.find_by_id(params[:id])
    end
  end
  
  def parent_path(parent)
    case 
      when params[:fitness_plan_id] then fitness_plan_exercises_path(parent)
      when params[:workout_id] then workout_exercises_path(parent)
    end
  end
end
