#  create_table :profiles do |t|
#      t.date :dob
#      t.string :address1
#      t.string :address2
#      t.string :city
#      t.string :state
#      t.string :zip
#      t.string :cell_phone
#      t.string :phone
#      t.string :work_phone
#      t.integer :height_inch
#      t.string :body_shape
#      t.string :sex
#      t.string :race
#      t.string :rx_affiliate_no , :default => "SELF"
#      t.string :sale_code , :default => "SELF"
#      t.boolean :terms_agreed
#      t.datetime :terms_agreed_on
#      t.string :primary_care_physician
#      t.string :employer_name
#      t.string :marital_status
#      t.string :partner_employer
#      t.string :occupation
#      t.string :emergency_contact
#      t.string :emergency_phone
#      t.string :emergency_relationship
#      t.string :emergency_address
#      t.string :emergency_city
#      t.string :emergency_state
#      t.string :emergency_zip
#      t.boolean :has_children
#      t.integer :number_of_children
#      t.string :list_unusual_substance_exposure
#      t.string :education
#      t.boolean :smoker
#      t.boolean :was_smoker
#      t.string :average_smoking
#      t.boolean :non_smoker
#      t.boolean :alcoholic
#      t.integer :ounces_alcohol_weekly
#      t.references :user
#      t.text :chart_options
#      t.text :favorits
#      t.boolean :is_pregnant
#      t.date :conception_on
#      t.boolean :is_breast_feeding
#      t.boolean :is_menopause 
#      t.string :blood_type
#      t.integer :user_priority , :default => 1
#      t.string :member_id
#      t.string :super_member_id
#
#      t.timestamps


class Profile < ActiveRecord::Base

belongs_to :user

serialize :chart_options
serialize :favorits

lambda_ages = lambda do |*args|

  if args[0].class == Range then
  my_range = args[0]
  args[0] = my_range.first
  args[1] = my_range.last
  end

  if args[1] == nil then 
  args[1] = 200 
  end
  {:conditions => ["dob <= ? AND dob > ?", args[0].to_i.years.ago,args[1].to_i.years.ago ] }
end #ends lambda




named_scope  :with_ages , lambda_ages

named_scope :with_sex , lambda { |*args| 
if (args[0].first == "f" || args[0].first == "F")  then args[0] = "female" else args[0] = "male" end
{ :conditions => ["sex = ?", args[0] ] } 
}



named_scope :with_state , lambda { |*args| 

{ :conditions => ["state = ?", args[0] ] } 
}
#User.with_gender('m').with_age(21..35).find



named_scope :with_zips , lambda { |*zips| 
#if args[0].class == String then 
#{ :conditions => ["zip = ?",  "#{args[0]}" ] } 
#end
#if args.size == 1 then 
#{ :conditions => ["zip = ?",  "#{args[0]}" ] } 
#elsif args.size > 1 then
#{ :conditions => ["zip IN ?",  "(\"#{ args.join("\",\"") }\")" ] } 
#end

{ :conditions => ["zip IN (?)", zips[0] ]  }

}

named_scope :with_all, { }


named_scope :with_rx_affiliate_no , lambda { |*args| 
{ :conditions => ["rx_affiliate_no = ?", args[0] ] } 
}

def age  
(( Time.now - self.dob.to_time ) / 1.years).to_i
end

def updateChartOptions(returned)
  results = Hash.new 
     
  unless returned[:bp].nil?   
   results[:bp]=
   [if  returned[:bp][:a].nil? then false else true end,
  if  returned[:bp][:b].nil? then false else true end,
  if  returned[:bp][:c].nil? then false else true end] 
  else results[:bp] = [false, false, false]
  end

  unless returned[:stress].nil?   
   results[:stress]=
   [if  returned[:stress][:a].nil? then false else true end,
  if  returned[:stress][:b].nil? then false else true end,
  if  returned[:stress][:c].nil? then false else true end] 
  else results[:stress] = [false, false, false]
  end


  unless returned[:sleep].nil?   
   results[:sleep]=
   [if  returned[:sleep][:a].nil? then false else true end,
  if  returned[:sleep][:b].nil? then false else true end,
  if  returned[:sleep][:c].nil? then false else true end] 
  else results[:sleep] = [false, false, false]
  end

  unless returned[:cholesterol].nil?   
   results[:cholesterol]=
  [if  returned[:cholesterol][:a].nil? then false else true end,
  if  returned[:cholesterol][:b].nil? then false else true end,
  if  returned[:cholesterol][:c].nil? then false else true end] 
  else results[:cholesterol] = [false, false, false]

  end

  unless returned[:chol_ldl].nil?   
   results[:chol_ldl]=
  [if  returned[:chol_ldl][:a].nil? then false else true end,
  if  returned[:chol_ldl][:b].nil? then false else true end,
  if  returned[:chol_ldl][:c].nil? then false else true end] 
  else results[:chol_ldl] = [false, false, false]

  end

  unless returned[:chol_hdl].nil?   
   results[:chol_hdl]=
  [if  returned[:chol_hdl][:a].nil? then false else true end,
  if  returned[:chol_hdl][:b].nil? then false else true end,
  if  returned[:chol_hdl][:c].nil? then false else true end]
  else results[:chol_hdl] = [false, false, false]

  end

  unless returned[:measurements].nil?    
  results[:measurements]=
  [if  returned[:measurements][:a].nil? then false else true end,
  if  returned[:measurements][:b].nil? then false else true end,
  if  returned[:measurements][:c].nil? then false else true end]
  else results[:measurements] = [false, false, false]

  end

  unless returned[:measurement_weight].nil?   
   results[:measurement_weight]=
  [if  returned[:measurement_weight][:a].nil? then false else true end,
  if  returned[:measurement_weight][:b].nil? then false else true end,
  if  returned[:measurement_weight][:c].nil? then false else true end]
  else results[:measurement_weight] = [false, false, false]

  end

  unless returned[:measurement_resting_metabolism].nil?   
   results[:measurement_resting_metabolism]=
  [if  returned[:measurement_resting_metabolism][:a].nil? then false else true end,
  if  returned[:measurement_resting_metabolism][:b].nil? then false else true end,
  if  returned[:measurement_resting_metabolism][:c].nil? then false else true end]
  else results[:measurement_resting_metabolism] = [false, false, false]

  end

  unless returned[:measurement_fat_percent].nil?   
   results[:measurement_fat_percent]=
  [if  returned[:measurement_fat_percent][:a].nil? then false else true end,
  if  returned[:measurement_fat_percent][:b].nil? then false else true end,
  if  returned[:measurement_fat_percent][:c].nil? then false else true end]
  else results[:measurement_fat_percent] = [false, false, false]

  end

  unless returned[:measurement_muscle_percent].nil?   
   results[:measurement_muscle_percent]=
  [if  returned[:measurement_muscle_percent][:a].nil? then false else true end,
  if  returned[:measurement_muscle_percent][:b].nil? then false else true end,
  if  returned[:measurement_muscle_percent][:c].nil? then false else true end] 
  else results[:measurement_muscle_percent] = [false, false, false]

  end

  unless returned[:measurement_visceral_fat].nil?   
   results[:measurement_visceral_fat]=
  [if  returned[:measurement_visceral_fat][:a].nil? then false else true end,
  if  returned[:measurement_visceral_fat][:b].nil? then false else true end,
  if  returned[:measurement_visceral_fat][:c].nil? then false else true end]
  else results[:measurement_visceral_fat] = [false, false, false]

  end

  unless returned[:measurement_water_percent].nil?   
   results[:measurement_water_percent]=
  [if  returned[:measurement_water_percent][:a].nil? then false else true end,
  if  returned[:measurement_water_percent][:b].nil? then false else true end,
  if  returned[:measurement_water_percent][:c].nil? then false else true end] 
  else results[:measurement_water_percent] = [false, false, false]

  end

  unless returned[:measurement_chest].nil?   
   results[:measurement_chest]=
  [if  returned[:measurement_chest][:a].nil? then false else true end,
  if  returned[:measurement_chest][:b].nil? then false else true end,
  if  returned[:measurement_chest][:c].nil? then false else true end]
  else results[:measurement_chest] = [false, false, false]

  end

  unless returned[:measurement_neck].nil?   
   results[:measurement_neck]=
  [if  returned[:measurement_neck][:a].nil? then false else true end,
  if  returned[:measurement_neck][:b].nil? then false else true end,
  if  returned[:measurement_neck][:c].nil? then false else true end]
  else results[:measurement_neck] = [false, false, false]
   
  end

  unless returned[:measurement_bicep].nil?   
   results[:measurement_bicep]=
  [if  returned[:measurement_bicep][:a].nil? then false else true end,
  if  returned[:measurement_bicep][:b].nil? then false else true end,
  if  returned[:measurement_bicep][:c].nil? then false else true end]
  else results[:measurement_bicep] = [false, false, false]
   
  end


  unless returned[:measurement_belly].nil?   
   results[:measurement_belly]=
  [if  returned[:measurement_belly][:a].nil? then false else true end,
  if  returned[:measurement_belly][:b].nil? then false else true end,
  if  returned[:measurement_belly][:c].nil? then false else true end]
  else results[:measurement_belly] = [false, false, false]

  end

  unless returned[:measurement_hip].nil?   
   results[:measurement_hip]=
  [if  returned[:measurement_hip][:a].nil? then false else true end,
  if  returned[:measurement_hip][:b].nil? then false else true end,
  if  returned[:measurement_hip][:c].nil? then false else true end]
  else results[:measurement_hip] = [false, false, false]

  end

  unless returned[:measurement_calf].nil?   
   results[:measurement_calf]=
  [if  returned[:measurement_calf][:a].nil? then false else true end,
  if  returned[:measurement_calf][:b].nil? then false else true end,
  if  returned[:measurement_calf][:c].nil? then false else true end] 
  else results[:measurement_calf] = [false, false, false]

  end

  unless returned[:measurement_thigh].nil?   
   results[:measurement_thigh]=
  [if  returned[:measurement_thigh][:a].nil? then false else true end,
  if  returned[:measurement_thigh][:b].nil? then false else true end,
  if  returned[:measurement_thigh][:c].nil? then false else true end] 
  else results[:measurement_thigh] = [false, false, false]
  end
  
  results
end


def myChartOptions

   if self.chart_options.nil? then
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
     :measurement_neck=>[false, false, false],
     :measurement_bicep=>[false, false, false],
     :measurement_belly=>[false, false, false],
     :measurement_hip=>[false, false, false],
     :measurement_calf=>[false, false, false],
     :measurement_thigh=>[false, false, false],
     :cholesterol=>[true,true,true],
     :sleep=>[true,true,true],
     :stress=>[true,true,true]
     ]
 
     
     self.chart_options = @chartoptions
     self.save
 
   
   
    else
      self.chart_options = @chartoptions   
   
   
   
   # elsif @chartoptions[:stress].nil?
     
   #  @chartoptions[:stress] = [true,true,true]
   #  current_user.profile.chart_options = @chartoptions
   #  current_user.profile.save

    end #end if chart_options...
    
    @chartoptions    

end



end
