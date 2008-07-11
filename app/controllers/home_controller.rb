class HomeController < ApplicationController

def index
  if logged_in? then
   
   if current_user.profile.dob.nil? then
      flash[:notice] = "Please fill out your profile so that we can start to build your lifes thread. Thank you!"
      redirect_to(edit_profile_path)
   else
   
   @profile = current_user.profile

    #I have a seperate variable for each item because I don't require them to make the complete 
    # measurements. Ie , they may put weight on on record, and then update chest and waist sizes.
    @has_weight_nil =  current_user.measurements.find(:first, :order => "measured_on desc", :conditions => [ "is_goal = ?  && weight >  ?", false, 1] ).nil?
    
    unless @has_weight_nil
      @current_weight =  current_user.measurements.find(:first, :order => "measured_on desc", :conditions => [ 'is_goal = ? && weight >  ?', false, 1] ).weight
    end 

    @has_goal_weight_nil =  current_user.measurements.find(:first, :order => "measured_on desc", :conditions => [ (('is_goal = ? && weight >  ?')), true, 1 ] ).nil?

    unless @has_goal_weight_nil
      @goal_weight = current_user.measurements.find(:first, :order => "measured_on desc", :conditions => [ (('is_goal = ? && weight >  ?')), true , 1] ).weight
    end

    end
  @bp = Bp.new
  @measurement = Measurement.new
  @food = Food.new
  @opinion = Opinion.new
    
  end
  
end

def show
end

def new
  @bp = Bp.new
  @measurement = Measurement.new
# from book
end

def create

if params[:commit] == "survey" then
      @value = params[:opinion]
      @opinion = current_user.opinions.new
      @opinion.question_id = @value[:question].to_i
      @opinion.save
      redirect_to(home_path(:question => @opinion.question_id))
else

      @bp = current_user.bps.new(params[:bp])
      @measurement = current_user.measurements.new(params[:measurements])
      @food = current_user.foods.new(params[:foods])
      
     # flash[:notice] = ""
      if !@bp.systolic.blank? && !@bp.diastolic.blank? then 
        @bp.save  
        flash[:notice] ="Records updated."
      end

      if !( @measurement.water_percent.blank? && @measurement.muscle_percent.blank? && @measurement.chest.blank? && @measurement.weight.blank? &&  @measurement.pectoral.blank? &&  @measurement.bicep_left.blank? &&    @measurement.visceral_fat.blank? &&   @measurement.bicep_right.blank? &&   @measurement.belly.blank? &&     @measurement.hip.blank? &&     @measurement.thigh_left.blank? &&     @measurement.resting_metabolism.blank? &&      @measurement.thigh_right.blank? &&     @measurement.fat_percent.blank? &&     @measurement.comment.blank? &&     @measurement.lower_hip.blank?   ) then
        @measurement.save
        flash[:notice] = "Records updated."
      end

    if !(@food.name.blank? &&
      # @food.complex_carbs.blank? &&
      # @food.monounsaturated_fats.blank? &&
      # @food.category.blank? &&
      # @food.subcategory.blank? &&
      # @food.fiber.blank? &&
      # @food.simple_carbs.blank? &&
      @food.meal.blank? &&
      # @food.protein.blank? &&
      #@food.saturated_fats.blank? &&
      #@food.comment.blank? &&
      #@food.polyunsaturated_fats.blank? &&
      @food.calories_per_serving.blank? ) then 
        @food.save
        flash[:notice] = "Records updated"
    end



     if flash[:notice] = "" then
    #  flash[:notice] = "There were no updates, please fill out the required data and submit again."
     end 
      
    #      if @bp.save or @measurement.save
    #        flash[:notice] = flash[:notice] + ' Records updated was successfully created.'
            redirect_to(home_path) 
     #     else
      #      #render :action => "new"
      #    end
end 

end


end
