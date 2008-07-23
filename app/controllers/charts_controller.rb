class ChartsController < ApplicationController

  def index
   @chartoptions = current_user.profile.chart_options
    
   if @chartoptions.nil? then
     #@conditions = Hash[:plot => true, :average => true , :show_goal => true]

     @chartoptions=Hash[
     :bp=>[true,true,true],
     :chol_ldl=>[true,true,true],
     :chol_hdl=>[true,true,true],
     :measurements=>[true,true,true],
     :measurement_weight=>[false, false, false],
     :measurement_resting_metabolism=>[false, false, false],
     :measurement_fat_percent=>[false, false, false],
     :measurement_muscle_percent=>[false, false, false],
     :measurement_visceral_fat=>[false, false, false],
     :measurement_water_percent=>[false, false, false],
     :measurement_chest=>[false, false, false],
     :measurement_pectoral=>[false, false, false],
     :measurement_bicep_left=>[false, false, false],
     :measurement_bicep_right=>[false, false, false],
     :measurement_belly=>[false, false, false],
     :measurement_hip=>[false, false, false],
     :measurement_lower_hip=>[false, false, false],
     :measurement_thigh_left=>[false, false, false],
     :measurement_thigh_right=>[false, false, false],
     :cholesterol=>[true,true,true],
     :sleep=>[true,true,true],
     :stress=>[true,true,true]
     ]
 
     
     current_user.profile.chart_options = @chartoptions
     current_user.profile.save

     
    elsif @chartoptions[:stress].nil?
     
     @chartoptions[:stress] = [true,true,true]
     current_user.profile.chart_options = @chartoptions
     current_user.profile.save

    end #end if chart_options...
      
   

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
  
    @returned = params[:chartoptions]
    @results=Hash.new 
    
unless @returned[:bp].nil?   
 @results[:bp]=
 [if  @returned[:bp][:a].nil? then false else true end,
if  @returned[:bp][:b].nil? then false else true end,
if  @returned[:bp][:c].nil? then false else true end] 
else @results[:bp] = [false, false, false]
end

unless @returned[:stress].nil?   
 @results[:stress]=
 [if  @returned[:stress][:a].nil? then false else true end,
if  @returned[:stress][:b].nil? then false else true end,
if  @returned[:stress][:c].nil? then false else true end] 
else @results[:stress] = [false, false, false]
end


unless @returned[:sleep].nil?   
 @results[:sleep]=
 [if  @returned[:sleep][:a].nil? then false else true end,
if  @returned[:sleep][:b].nil? then false else true end,
if  @returned[:sleep][:c].nil? then false else true end] 
else @results[:sleep] = [false, false, false]
end

unless @returned[:cholesterol].nil?   
 @results[:cholesterol]=
[if  @returned[:cholesterol][:a].nil? then false else true end,
if  @returned[:cholesterol][:b].nil? then false else true end,
if  @returned[:cholesterol][:c].nil? then false else true end] 
else @results[:cholesterol] = [false, false, false]

end

unless @returned[:chol_ldl].nil?   
 @results[:chol_ldl]=
[if  @returned[:chol_ldl][:a].nil? then false else true end,
if  @returned[:chol_ldl][:b].nil? then false else true end,
if  @returned[:chol_ldl][:c].nil? then false else true end] 
else @results[:chol_ldl] = [false, false, false]

end

unless @returned[:chol_hdl].nil?   
 @results[:chol_hdl]=
[if  @returned[:chol_hdl][:a].nil? then false else true end,
if  @returned[:chol_hdl][:b].nil? then false else true end,
if  @returned[:chol_hdl][:c].nil? then false else true end]
else @results[:chol_hdl] = [false, false, false]

end

unless @returned[:measurements].nil?    
@results[:measurements]=
[if  @returned[:measurements][:a].nil? then false else true end,
if  @returned[:measurements][:b].nil? then false else true end,
if  @returned[:measurements][:c].nil? then false else true end]
else @results[:measurements] = [false, false, false]

end

unless @returned[:measurement_weight].nil?   
 @results[:measurement_weight]=
[if  @returned[:measurement_weight][:a].nil? then false else true end,
if  @returned[:measurement_weight][:b].nil? then false else true end,
if  @returned[:measurement_weight][:c].nil? then false else true end]
else @results[:measurement_weight] = [false, false, false]

end

unless @returned[:measurement_resting_metabolism].nil?   
 @results[:measurement_resting_metabolism]=
[if  @returned[:measurement_resting_metabolism][:a].nil? then false else true end,
if  @returned[:measurement_resting_metabolism][:b].nil? then false else true end,
if  @returned[:measurement_resting_metabolism][:c].nil? then false else true end]
else @results[:measurement_resting_metabolism] = [false, false, false]

end

unless @returned[:measurement_fat_percent].nil?   
 @results[:measurement_fat_percent]=
[if  @returned[:measurement_fat_percent][:a].nil? then false else true end,
if  @returned[:measurement_fat_percent][:b].nil? then false else true end,
if  @returned[:measurement_fat_percent][:c].nil? then false else true end]
else @results[:measurement_fat_percent] = [false, false, false]

end

unless @returned[:measurement_muscle_percent].nil?   
 @results[:measurement_muscle_percent]=
[if  @returned[:measurement_muscle_percent][:a].nil? then false else true end,
if  @returned[:measurement_muscle_percent][:b].nil? then false else true end,
if  @returned[:measurement_muscle_percent][:c].nil? then false else true end] 
else @results[:measurement_muscle_percent] = [false, false, false]

end

unless @returned[:measurement_visceral_fat].nil?   
 @results[:measurement_visceral_fat]=
[if  @returned[:measurement_visceral_fat][:a].nil? then false else true end,
if  @returned[:measurement_visceral_fat][:b].nil? then false else true end,
if  @returned[:measurement_visceral_fat][:c].nil? then false else true end]
else @results[:measurement_visceral_fat] = [false, false, false]

end

unless @returned[:measurement_water_percent].nil?   
 @results[:measurement_water_percent]=
[if  @returned[:measurement_water_percent][:a].nil? then false else true end,
if  @returned[:measurement_water_percent][:b].nil? then false else true end,
if  @returned[:measurement_water_percent][:c].nil? then false else true end] 
else @results[:measurement_water_percent] = [false, false, false]

end

unless @returned[:measurement_chest].nil?   
 @results[:measurement_chest]=
[if  @returned[:measurement_chest][:a].nil? then false else true end,
if  @returned[:measurement_chest][:b].nil? then false else true end,
if  @returned[:measurement_chest][:c].nil? then false else true end]
else @results[:measurement_chest] = [false, false, false]

end

unless @returned[:measurement_pectoral].nil?   
 @results[:measurement_pectoral]=
[if  @returned[:measurement_pectoral][:a].nil? then false else true end,
if  @returned[:measurement_pectoral][:b].nil? then false else true end,
if  @returned[:measurement_pectoral][:c].nil? then false else true end]
else @results[:measurement_pectoral] = [false, false, false]
 
end

unless @returned[:measurement_bicep_left].nil?   
 @results[:measurement_bicep_left]=
[if  @returned[:measurement_bicep_left][:a].nil? then false else true end,
if  @returned[:measurement_bicep_left][:b].nil? then false else true end,
if  @returned[:measurement_bicep_left][:c].nil? then false else true end]
else @results[:measurement_bicep_left] = [false, false, false]
 
end

unless @returned[:measurement_bicep_right].nil?   
 @results[:measurement_bicep_right]=
[if  @returned[:measurement_bicep_right][:a].nil? then false else true end,
if  @returned[:measurement_bicep_right][:b].nil? then false else true end,
if  @returned[:measurement_bicep_right][:c].nil? then false else true end] 
else @results[:measurement_bicep_right] = [false, false, false]

end

unless @returned[:measurement_belly].nil?   
 @results[:measurement_belly]=
[if  @returned[:measurement_belly][:a].nil? then false else true end,
if  @returned[:measurement_belly][:b].nil? then false else true end,
if  @returned[:measurement_belly][:c].nil? then false else true end]
else @results[:measurement_belly] = [false, false, false]

end

unless @returned[:measurement_hip].nil?   
 @results[:measurement_hip]=
[if  @returned[:measurement_hip][:a].nil? then false else true end,
if  @returned[:measurement_hip][:b].nil? then false else true end,
if  @returned[:measurement_hip][:c].nil? then false else true end]
else @results[:measurement_hip] = [false, false, false]

end

unless @returned[:measurement_lower_hip].nil?   
 @results[:measurement_lower_hip]=
[if  @returned[:measurement_lower_hip][:a].nil? then false else true end,
if  @returned[:measurement_lower_hip][:b].nil? then false else true end,
if  @returned[:measurement_lower_hip][:c].nil? then false else true end] 
else @results[:measurement_lower_hip] = [false, false, false]

end

unless @returned[:measurement_thigh_left].nil?   
 @results[:measurement_thigh_left]=
[if  @returned[:measurement_thigh_left][:a].nil? then false else true end,
if  @returned[:measurement_thigh_left][:b].nil? then false else true end,
if  @returned[:measurement_thigh_left][:c].nil? then false else true end] 
else @results[:measurement_thigh_left] = [false, false, false]

end

unless @returned[:measurement_thigh_right].nil?   
 @results[:measurement_thigh_right]=
[if  @returned[:measurement_thigh_right][:a].nil? then false else true end,
if  @returned[:measurement_thigh_right][:b].nil? then false else true end,
if  @returned[:measurement_thigh_right][:c].nil? then false else true end] 
else @results[:measurement_thigh_right] = [false, false, false]

end
     
        puts "create: results[:bp] ==========================="
    puts @results[:bp]
    
    
    current_user.profile.chart_options = @results
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
