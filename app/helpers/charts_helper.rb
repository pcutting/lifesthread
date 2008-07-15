module ChartsHelper


def myPlots



bp1, bp2 , bp1_avg , bp2_avg = [], [], [], []  
sum_bp1, sum_bp2 , count = 0,0,0 


 if ( @chartoptions[:bp][0] == true|| @chartoptions[:bp][1] == true) 



 for bps in current_user.bps.find(:all, :order => "measured_on asc") 


 count += 1 


 bp1 << [ "[#{bps.measured_on.to_i * 1000}, #{bps.systolic} ]" ] 


 bp2 << [ "[ #{bps.measured_on.to_i * 1000}, #{bps.diastolic}]" ] 


 sum_bp1 += bps.systolic 


 bp1_avg << [ "[ #{bps.measured_on.to_i * 1000}, #{sum_bp1 / count} ]" ] 


 sum_bp2 += bps.diastolic 


 bp2_avg << [ "[ #{bps.measured_on.to_i * 1000}, #{sum_bp2 / count} ]" ] 


 end  


if @chartoptions[:bp][0] == true

@plot_data << "label: 'Systolic', data: [#{bp1.join(",")}]  ,points: { show: true }, lines: { show: true }" 

  
@plot_data << "label: 'Diastolic' , data: [#{bp2.join(",")}]  ,points: { show: true }, lines: { show: true }" 


 end 


 if @chartoptions[:bp][1] == true

  
@plot_data << "label: 'Sys Avg' , data: [#{bp1_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
@plot_data << "label: 'Dias Avg', data: [#{bp2_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 


 end 



 end #@options[:bp] 




 if @chartoptions[:measurements][0] == true|| @chartoptions[:measurements][1] == true|| @chartoptions[:measurements][2] == true

  
 meas1, meas2, meas3, meas4, meas5, meas6, meas7, meas8 = [],[],[],[],[],[],[],[] 

  
 meas1_avg, meas2_avg, meas3_avg, meas4_avg, meas5_avg, meas6_avg, meas7_avg, meas8_avg = [],[],[],[],[],[],[],[] 

  
 meas1_count, meas2_count, meas3_count, meas4_count, meas5_count, meas6_count, meas7_count, meas8_count = 0,0,0,0,0,0,0,0 

  
 meas1_sum, meas2_sum, meas3_sum, meas4_sum, meas5_sum, meas6_sum, meas7_sum, meas8_sum = 0,0,0,0,0,0,0,0 



 for measurement in current_user.measurements.find(:all, :order => "measured_on asc") 


 unless measurement.weight.nil? && ! (@chartoptions[:measurement_weight][0] == true|| @chartoptions[:measurement_weight][1] == true)  


 meas1_count += 1 

 meas1_sum += measurement.weight  


 meas1  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.weight}] "  


 meas1_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{ meas1_sum.to_f/ meas1_count.to_f}] " 


 end 


 unless measurement.fat_percent.nil?  && ! ( @chartoptions[:measurement_fat_percent][0] == true|| @chartoptions[:measurement_fat_percent][1] == true) 


 meas3_count += 1 

 meas3_sum += measurement.fat_percent  


 meas3  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.fat_percent}]"  


 meas3_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas3_sum.to_f/ meas3_count.to_f}]" 


 end 


 unless measurement.muscle_percent.nil?   && ! ( @chartoptions[:measurement_muscle_percent][0] == true || @chartoptions[:measurement_muscle_percent][1] == true ) 


 meas4_count += 1 

 meas4_sum += measurement.muscle_percent  


 meas4  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.muscle_percent}]"  


 meas4_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas4_sum.to_f/ meas4_count.to_f}]" 


 end 
 

 unless measurement.visceral_fat.nil?  && ! ( @chartoptions[:measurement_visceral_fat][0] == true|| @chartoptions[:measurement_visceral_fat][1] == true)


 meas5_count += 1 

 meas5_sum += measurement.visceral_fat  


 meas5  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.visceral_fat}]" 


 meas5_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas5_sum.to_f/ meas5_count.to_f}]"  


 end 
 

 unless measurement.chest.nil?  && ! ( @chartoptions[:measurement_chest][0] == true|| @chartoptions[:measurement_chest][1] == true) 


 meas6_count += 1 

 meas6_sum += measurement.chest  


 meas6  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.chest}]"  


 meas6_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas6_sum.to_f/ meas6_count.to_f}]" 


 end 


 unless measurement.belly.nil?  && ! ( @chartoptions[:measurement_belly][0] == true|| @chartoptions[:measurement_belly][1] == true) 


 meas7_count += 1 

 meas7_sum += measurement.belly  


 meas7  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.belly}]"  


 meas7_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas7_sum.to_f/ meas7_count.to_f}]" 


 end 
 

 unless measurement.hip.nil?   && ! (@chartoptions[:measurement_hip][0] == true|| @chartoptions[:measurement_hip][1] == true) 


 meas8_count += 1 

 meas8_sum += measurement.hip  


 meas8  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.hip} ]"  


 meas8_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas8_sum.to_f/ meas8_count.to_f} ]" 


 end 


 end 



 if @chartoptions[:measurements][0] == true

  
 if @chartoptions[:measurement_weight][0] == true

  
@plot_data << "label: 'Weight', data: [#{meas1.join(",")}] ,points: { show: true }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_fat_percent][0] == true

  
@plot_data << "label: 'Fat%', data: [#{meas3.join(",")}] ,points: { show: true }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_muscle_percent][0] == true

  
@plot_data << "label: 'Muscle%', data: [#{meas4.join(",")}] ,points: { show: true }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_visceral_fat][0] == true

  
@plot_data << "label: 'Visceral Fat%', data: [#{meas5.join(",")}] ,points: { show: true }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_chest][0] == true

  
@plot_data << "label: 'Chest', data: [#{meas6.join(",")}] ,points: { show: true }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_belly][0] == true

  
@plot_data << "label: 'Belly', data: [#{meas7.join(",")}] ,points: { show: true }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_hip][0] == true

  
@plot_data << "label: 'Hip', data: [#{meas8.join(",")}] ,points: { show: true }, lines: { show: true }" 

  
 end 


 end # if @chartoptions[:measurements][0] == true



 if @chartoptions[:measurements][1] == true

  
 if @chartoptions[:measurement_weight][1] == true

  
@plot_data << "label: 'Weight Avg', data: [#{meas1_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_fat_percent][1] == true

  
@plot_data << "label: 'Fat% Avg', data: [#{meas3_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_muscle_percent][1] == true

  
@plot_data << "label: 'Muscle% Avg', data: [#{meas4_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_visceral_fat][1] == true

  
@plot_data << "label: 'Visceral Fat% Avg', data: [#{meas5_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_chest][1] == true

  
@plot_data << "label: 'Chest Avg', data: [#{meas6_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_belly][1] == true

  
@plot_data << "label: 'Belly Avg', data: [#{meas7_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
 end 

  
 if @chartoptions[:measurement_hip][1] == true

  
@plot_data << "label: 'Hip Avg', data: [#{meas8_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 

  
 end 


 end # if @chartoptions[:measurements][1] == true


 end # if @chartoptions[:measurments] 




 cholesterol1,cholesterol2 = [],[] 


 chol_sum1, chol_sum2, count = 0,0,0 


 chol_avg1, chol_avg2 = [],[] 




 if ( @chartoptions[:cholesterol][0] == true|| @chartoptions[:cholesterol][1] == true) 



 for cholesterols in current_user.cholesterols.find(:all, :order => "measured_on asc") 


 chol_sum1 += cholesterols.hdl 


 chol_sum2 += cholesterols.ldl 


 count += 1 


 cholesterol1 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{cholesterols.hdl} ]" ] 


 cholesterol2 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{cholesterols.ldl}]" ] 


 chol_avg1 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{chol_sum1 / count.to_f}]" ] 


 chol_avg2 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{chol_sum2 / count.to_f}]" ] 


 end 
 
  
 if @chartoptions[:cholesterol][0] == true

     
@plot_data << "label: 'HDL', data: [#{cholesterol1.join(",")}] ,points: { show: true }, lines: { show: true }" 

     
@plot_data << "label: 'LDL' , data: [#{cholesterol2.join(",")}] ,points: { show: true }, lines: { show: true }" 
 
  
 end 

  
 if @chartoptions[:cholesterol][1] == true

     
@plot_data << "label: 'HDL Avg', data: [#{chol_avg1.join(",")}] ,points: { show: false }, lines: { show: true }" 

     
@plot_data << "label: 'LDL Avg' , data: [#{chol_avg2.join(",")}] ,points: { show: false }, lines: { show: true }" 
 
  
 end
 

 end # cholesterol 




end

end