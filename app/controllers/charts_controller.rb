class ChartsController < ApplicationController

  def index
   @chartoptions = current_user.profile.chart_options
    
   if @chartoptions.nil? then
     #@conditions = Hash[:plot => true, :average => true , :show_goal => true]
     @conditions = Array.new
     @conditions << true
     @conditions << true
     @conditions << true
     
     
     @chartoptions=Hash[
     :bp=>[[true],[true],[false]],
     :chol_ldl=>[[true],[true],[true]],
     :chol_hdl=>[[true],[true],[true]],
     :measurements=>[[false],[false],[false]],
     :measurement_weight=>[[true],[true],[true]],
     :measurement_resting_metabolism=>[[true],[true],[true]],
     :measurement_fat_percent=>[[true],[true],[true]],
     :measurement_muscle_percent=>[[true],[true],[true]],
     :measurement_visceral_fat=>[[true],[true],[true]],
     :measurement_water_percent=>[[true],[true],[true]],
     :measurement_chest=>[[true],[true],[true]],
     :measurement_pectoral=>[[true],[true],[true]],
     :measurement_bicep_left=>[[true],[true],[true]],
     :measurement_bicep_right=>[[true],[true],[true]],
     :measurement_belly=>[[true],[true],[true]],
     :measurement_hip=>[[true],[true],[true]],
     :measurement_lower_hip=>[[true],[true],[true]],
     :measurement_thigh_left=>[[true],[true],[true]],
     :measurement_thigh_right=>[[true],[true],[true]],
     :cholesterol=>[[true],[true],[true]]
     ]
     
     
     
     
     current_user.profile.chart_options = @chartoptions
     current_user.profile.save

    end #end if chart_options...
      
      
    puts "chart_options =========================="
    puts @chartoptions
    puts "chart_options :bp2 =========================="
    puts @chartoptions[:bp][2] 
   

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
  
    @returned = params[:chartoptions]
    curre nt_user.profile.chart_options = @returned
    if current_user.profile.save
    
    redirect_to(charts_path) 
    else
    
    redirect_to(home_path)
    end
    
    
  
  end
  
 
  def show

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
