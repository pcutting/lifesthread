module ChartsHelper


####################
# make a chart
# return html string
####################
def makeChart(*options)

display = '
<div id="overview" style="margin-left:50px;margin-top:20px;width:400px;height:50px"></div>
<p> Try zooming. The image above shows an adjustable overview. Click and drag to select a zone.</p>
<div id="placeholder" style="width:600px;height:500px;"></div>

<script id="source" language="javascript" type="text/javascript">


$(function () {
var options = {
  xaxis: { mode: "time" },
  selection: { mode: "x" },
  //grid: { coloredAreas: weekendAreas },
  legend: {
      show: true,
      //labelFormatter: null,
      //labelBoxBorderColor: color,
      noColumns: 2,
      position: "sw"   // "ne" or "nw" or "se" or "sw"
      //margin: number of pixels
      //backgroundColor: null or color
      //backgroundOpacity: number in 0.0 - 1.0
      //container: null or jQuery object
}
};

  var options_overview = {
  xaxis: { mode: "time" },
  selection: { mode: "x" },
  //grid: { coloredAreas: weekendAreas },
  legend: {
      show: false,
      //labelFormatter: null,
      //labelBoxBorderColor: color,
      noColumns: 2,
      position: "sw"   // "ne" or "nw" or "se" or "sw"
      //margin: number of pixels
      //backgroundColor: null or color
      //backgroundOpacity: number in 0.0 - 1.0
      //container: null or jQuery object
}
};

var plot = $.plot($("#placeholder"), 
[ {' + @plot_data.join(" }, {")  + ' }
], options);

var overview = $.plot($("#overview"), 
[
{' + @plot_data.join(" }, {")  + '}
], {
  lines: { show: true, lineWidth: 2 },
  shadowSize: 0,
  legend: {
      show: false },
  xaxis: { ticks: 3, mode: "time" },
  // yaxis: { ticks: [], min: 0, max: 4000 },
  selection: { mode: "x" }
});

// now connect the two
var internalSelection = false;

$("#placeholder").bind("selected", function (event, area) {
  // do the zooming
  plot = $.plot($("#placeholder"),
   
  [{' + @plot_data.join(" }, {")  + '}],
                $.extend(true, {}, options, {
                    xaxis: { min: area.x1, max: area.x2 }
                }));
  
  if (internalSelection)
      return; // prevent eternal loop
  internalSelection = true;
  overview.setSelection(area);
  internalSelection = false;
});

$("#overview").bind("selected", function (event, area) {
  if (internalSelection)
      return;
  internalSelection = true;
  plot.setSelection(area);
  internalSelection = false;
});
});
</script>
'

end #def makeCharts(options)


##################
# myPlots
##################


def myPlots(options)
#pass "all" or specific option


#if it's a specific option then go with it, otherwise show 
#  all components of that model that are chartable.
if options == "all" then 

else
@chartoptions=Hash[
     :bp=>[true,true,true],
     :chol_ldl=>[true,true,true],
     :chol_hdl=>[true,true,true],
     :measurements=>[true,true,true],
     :measurement_weight=>[true,true,true],
     :measurement_resting_metabolism=>[true,true,true],
     :measurement_fat_percent=>[true,true,true],
     :measurement_muscle_percent=>[true,true,true],
     :measurement_visceral_fat=>[true,true,true],
     :measurement_water_percent=>[true,true,true],
     :measurement_chest=>[true,true,true],
     :measurement_pectoral=>[true,true,true],
     :measurement_bicep_left=>[true,true,true],
     :measurement_bicep_right=>[true,true,true],
     :measurement_belly=>[true,true,true],
     :measurement_hip=>[true,true,true],
     :measurement_lower_hip=>[true,true,true],
     :measurement_thigh_left=>[true,true,true],
     :measurement_thigh_right=>[true,true,true],
     :cholesterol=>[true,true,true],
     :sleep=>[true,true,true]
     ]
     
     puts "@chartoptions for else condition in myplots =========="
     puts @chartoptions
end


  if options == "all" || options == "bp"
    @bps = current_user.bps.find(:all, :order => "measured_on asc") 
    getBP  unless @bps.nil? #function call
  end

  if options == "all" || options == "sleep"
    @sleeps = current_user.sleeps.find(:all, :order => "started_at asc")
    getSleep unless @sleeps.nil? #function call
  end

  if options == "all" || options == "measurements" 
    @measurements = current_user.measurements.find(:all, :order => "measured_on asc", :conditions => "is_goal = false " ) 
    getMeasurements unless @measurements.nil? #function call
  end

  if options == "all" || options == "cholesterol" 
    @cholesterols = current_user.cholesterols.find(:all, :order => "measured_on asc") 
    getCholesterol unless @cholesterol.nil? #function call
  end

end # ends myPlots
  
  
###########################
# build function to get 
# the min and max Y ranges 
# for the chart.
###########################  
def check_min_max

end
  
####################
#gets sleep
####################
def getSleep

  sleep1, sleep2 , sleep1_avg , sleep2_avg = [], [], [], []  
  sum_sleep1, sum_sleep2 , count = 0,0,0 
  if ( @chartoptions[:sleep][0]|| @chartoptions[:sleep][1]  ) 
    for sleeps in @sleeps
      count += 1 
      #divide seconds of sleep by 288 so that we can get a number between 0 and 100 (or above) 
      # based on the concept that you want to get 8 hours of sleep on average, and to give you numbers 
      # are reasonable to look at.
      #60 sec/min * 60 min/hour = 3600 seconds per hour
      #3600 s/h * 8 hours = 28800
      # 288 = 0-100 scale rather then 0.0 to 1.0 scale.
      
      sleep1 << [ "[#{sleeps.started_at.to_i * 1000}, #{((sleeps.woke_up_at - sleeps.started_at) / 288)} ]" ] 
      sum_sleep1 += ((sleeps.woke_up_at - sleeps.started_at) / 288)
      sleep1_avg << [ "[ #{sleeps.started_at.to_i * 1000}, #{sum_sleep1 / count} ]" ] 

    end  
    if @chartoptions[:sleep][0]
      @plot_data << "label: '% of Required Sleep<a href=\"popup\">i</a> ', data: [#{sleep1.join(",")}]  ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:sleep][1]
      @plot_data << "label: 'Sleep Avg' , data: [#{sleep1_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    
    end 
  end  

 
end #def getSleep
  
  
  
#####################
# Gets Blood Pressure
#####################
  
def getBP
  #Bloodpressure
  bp1, bp2 , bp1_avg , bp2_avg = [], [], [], []  
  sum_bp1, sum_bp2 , count = 0,0,0 
  if ( @chartoptions[:bp][0]|| @chartoptions[:bp][1]) 
    for bps in @bps
      count += 1 

      bp1 << [ "[#{bps.measured_on.to_i * 1000}, #{bps.systolic} ]" ] 
      bp2 << [ "[ #{bps.measured_on.to_i * 1000}, #{bps.diastolic}]" ] 
      sum_bp1 += bps.systolic 
      bp1_avg << [ "[ #{bps.measured_on.to_i * 1000}, #{sum_bp1 / count} ]" ] 
      sum_bp2 += bps.diastolic 
      bp2_avg << [ "[ #{bps.measured_on.to_i * 1000}, #{sum_bp2 / count} ]" ] 
    end  
    if @chartoptions[:bp][0]
      @plot_data << "label: 'Systolic', data: [#{bp1.join(",")}]  ,points: { show: true }, lines: { show: true }" 
      @plot_data << "label: 'Diastolic' , data: [#{bp2.join(",")}]  ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:bp][1]
      @plot_data << "label: 'Sys Avg' , data: [#{bp1_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
      @plot_data << "label: 'Dias Avg', data: [#{bp2_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
  end #@options[:bp] 
end # def getBP
  
  
#################
#Cholesterol
#################  
  
def getCholesterol

#cholesterol
cholesterol1,cholesterol2 = [],[] 
chol_sum1, chol_sum2, count = 0,0,0 
chol_avg1, chol_avg2 = [],[] 
if ( @chartoptions[:cholesterol][0]|| @chartoptions[:cholesterol][1]) 
  for cholesterols in @cholesterols
    chol_sum1 += cholesterols.hdl 
    chol_sum2 += cholesterols.ldl 
    count += 1 
    cholesterol1 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{cholesterols.hdl} ]" ] 
    cholesterol2 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{cholesterols.ldl}]" ] 
    chol_avg1 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{chol_sum1 / count.to_f}]" ] 
    chol_avg2 << [ "[ #{cholesterols.measured_on.to_i * 1000}, #{chol_sum2 / count.to_f}]" ] 
  end 
  if @chartoptions[:cholesterol][0]
    @plot_data << "label: 'HDL', data: [#{cholesterol1.join(",")}] ,points: { show: true }, lines: { show: true }" 
    @plot_data << "label: 'LDL' , data: [#{cholesterol2.join(",")}] ,points: { show: true }, lines: { show: true }" 
  end 
  if @chartoptions[:cholesterol][1]
    @plot_data << "label: 'HDL Avg', data: [#{chol_avg1.join(",")}] ,points: { show: false }, lines: { show: true }" 
    @plot_data << "label: 'LDL Avg' , data: [#{chol_avg2.join(",")}] ,points: { show: false }, lines: { show: true }" 
  end
end # cholesterol 
end #def getCholesterol
  
  
##################
# Get measurements
##################

def 
getMeasurements
#measurements
if @chartoptions[:measurements][0]|| @chartoptions[:measurements][1]|| @chartoptions[:measurements][2]
  meas1, meas2, meas3, meas4, meas5, meas6, meas7, meas8 = [],[],[],[],[],[],[],[] 
  meas1_avg, meas2_avg, meas3_avg, meas4_avg, meas5_avg, meas6_avg, meas7_avg, meas8_avg = [],[],[],[],[],[],[],[] 
  meas1_count, meas2_count, meas3_count, meas4_count, meas5_count, meas6_count, meas7_count, meas8_count = 0,0,0,0,0,0,0,0 
  
  meas1_sum, meas2_sum, meas3_sum, meas4_sum, meas5_sum, meas6_sum, meas7_sum, meas8_sum = 0,0,0,0,0,0,0,0 
  
  for measurement in @measurements
    unless (measurement.weight.nil? || measurement.weight == 0) && ! (@chartoptions[:measurement_weight][0]|| @chartoptions[:measurement_weight][1])  
      meas1_count += 1 
      meas1_sum += measurement.weight  
      meas1  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.weight}] "  
      meas1_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{ meas1_sum.to_f/ meas1_count.to_f}] " 
    end 
    unless (measurement.fat_percent.nil?  || measurement.fat_percent == 0) && ! ( @chartoptions[:measurement_fat_percent][0]|| @chartoptions[:measurement_fat_percent][1]) 
      meas3_count += 1 
      meas3_sum += measurement.fat_percent  
      meas3  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.fat_percent}]"  
      meas3_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas3_sum.to_f/ meas3_count.to_f}]" 
    end 
    unless (measurement.muscle_percent.nil? || measurement.muscle_percent == 0)   && ! ( @chartoptions[:measurement_muscle_percent][0] || @chartoptions[:measurement_muscle_percent][1] ) 
      meas4_count += 1 
      meas4_sum += measurement.muscle_percent  
      meas4  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.muscle_percent}]"  
      meas4_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas4_sum.to_f/ meas4_count.to_f}]" 
    end 
    unless (measurement.visceral_fat.nil?  || measurement.visceral_fat == 0) && ! ( @chartoptions[:measurement_visceral_fat][0]|| @chartoptions[:measurement_visceral_fat][1])
      meas5_count += 1 
      meas5_sum += measurement.visceral_fat  
      meas5  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.visceral_fat}]" 
      meas5_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas5_sum.to_f/ meas5_count.to_f}]"  
    end 
    unless (measurement.chest.nil? || measurement.chest == 0)  && ! ( @chartoptions[:measurement_chest][0]|| @chartoptions[:measurement_chest][1]) 
      meas6_count += 1 
      meas6_sum += measurement.chest  
      meas6  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.chest}]"  
      meas6_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas6_sum.to_f/ meas6_count.to_f}]" 
    end 
    unless (measurement.belly.nil?  || measurement.belly == 0) && ! ( @chartoptions[:measurement_belly][0]|| @chartoptions[:measurement_belly][1]) 
      meas7_count += 1 
      meas7_sum += measurement.belly  
      meas7  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.belly}]"  
      meas7_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas7_sum.to_f/ meas7_count.to_f}]" 
    end 
    unless (measurement.hip.nil?  || measurement.hip == 0)  && ! (@chartoptions[:measurement_hip][0]|| @chartoptions[:measurement_hip][1]) 
      meas8_count += 1 
      meas8_sum += measurement.hip  
      meas8  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{measurement.hip} ]"  
      meas8_avg  << "[ #{measurement.measured_on.to_time.to_i * 1000},#{meas8_sum.to_f/ meas8_count.to_f} ]" 
    end 
  end 
    
  if @chartoptions[:measurements][0]
    if @chartoptions[:measurement_weight][0]
      @plot_data << "label: 'Weight', data: [#{meas1.join(",")}] ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_fat_percent][0]
      @plot_data << "label: 'Fat%', data: [#{meas3.join(",")}] ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_muscle_percent][0]
      @plot_data << "label: 'Muscle%', data: [#{meas4.join(",")}] ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_visceral_fat][0]
      @plot_data << "label: 'Visceral Fat%', data: [#{meas5.join(",")}] ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_chest][0]
      @plot_data << "label: 'Chest', data: [#{meas6.join(",")}] ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_belly][0]
      @plot_data << "label: 'Belly', data: [#{meas7.join(",")}] ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_hip][0]
      @plot_data << "label: 'Hip', data: [#{meas8.join(",")}] ,points: { show: true }, lines: { show: true }" 
    end 
  end # if @chartoptions[:measurements][0]
  if @chartoptions[:measurements][1]
    if @chartoptions[:measurement_weight][1]
      @plot_data << "label: 'Weight Avg', data: [#{meas1_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_fat_percent][1]
      @plot_data << "label: 'Fat% Avg', data: [#{meas3_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_muscle_percent][1]
      @plot_data << "label: 'Muscle% Avg', data: [#{meas4_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_visceral_fat][1]
      @plot_data << "label: 'Visceral Fat% Avg', data: [#{meas5_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_chest][1]
      @plot_data << "label: 'Chest Avg', data: [#{meas6_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_belly][1]
      @plot_data << "label: 'Belly Avg', data: [#{meas7_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
    if @chartoptions[:measurement_hip][1]
      @plot_data << "label: 'Hip Avg', data: [#{meas8_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    end 
  end # if @chartoptions[:measurements][1]
end # if @chartoptions[:measurments] 
end #def getMeasurements



  
end # ends helper
