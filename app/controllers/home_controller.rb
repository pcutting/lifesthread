class HomeController < ApplicationController

def index
  
unless logged_in? then
  redirect_to(login_path)
else

   if current_user.profile.dob.nil? then
      flash[:notice] = "Please fill out your profile so that we can start to build your lifes thread. Thank you!"
      redirect_to(edit_profile_path(:fieldset => "welcome"))
   else
   @profile = current_user.profile

    end # if current_user.profile.dob.nil?
  @bp = Bp.new
  @measurement = Measurement.new
  @food = Food.new
  @opinion = Opinion.new
  @sleep = Sleep.new 
  end
  
end

#def show
#end

#def new
#  @bp = Bp.new
#  @measurement = Measurement.new
# from book
#end

def create

if params[:commit] == "survey" then
      @value = params[:opinion]
      @opinion = current_user.opinions.new
      @opinion.question_id = @value[:question].to_i
      @opinion.save
      redirect_to(home_path(:question => @opinion.question_id))
else
      did_save = false
      @bp = current_user.bps.new(params[:bp])
      @measurement = current_user.measurements.new(params[:measurement])
      @food = current_user.foods.new(params[:foods])
      @sleep = current_user.sleeps.new(params[:sleep])
      
     # flash[:notice] = ""
      if !@bp.systolic.blank? && !@bp.diastolic.blank? then 
        did_save = @bp.save  
        flash[:notice] ="Records updated."
      end

      if @sleep.started_at != @sleep.woke_up_at then 
        did_save = @sleep.save  
        flash[:notice] ="Records updated."
      end

      if !( @measurement.water_percent.blank? && @measurement.muscle_percent.blank? && @measurement.chest.blank? && @measurement.weight.blank? &&  @measurement.pectoral.blank? &&  @measurement.bicep_left.blank? &&    @measurement.visceral_fat.blank? &&   @measurement.bicep_right.blank? &&   @measurement.belly.blank? &&     @measurement.hip.blank? &&     @measurement.thigh_left.blank? &&     @measurement.resting_metabolism.blank? &&      @measurement.thigh_right.blank? &&     @measurement.fat_percent.blank? &&     @measurement.comment.blank? &&     @measurement.lower_hip.blank?   ) then
       did_save =  @measurement.save
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
        did_save = @food.save
        flash[:notice] = "Records updated"
    end



     unless did_save then
      flash[:notice] = "There were no updates, please fill out the required data and submit again."
     end 
      
     redirect_to(home_path) 

end 

end


end
