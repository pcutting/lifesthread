module ChartsHelper

  class Point
    attr_accessor :x, :y
    
    def initialize(x,y)
      @x = x
      @y = y
    end #initialize
  
    def to_s
      "#{x}, #{y}"
    end

  end #end point

  class ChartItem
    
    attr_accessor :points, :showPoints, :showLine
    attr_writer :label
    
    def initialize (label)
      @points = Array.new
      @label = label
      @showPoints = true
      @showLines = true
    end #initialize
    
    def addPoint(x,y)
      @points.push(Point.new(x,y))
    end
    
    def size
      @points.size
    end
      
    def displayLabel
      "label:'#{@label}',data: [], points: {show:false}, lines:{show:false}"
    end
    
    def to_s
      "label:'#{@label}'\n#{getAllPoints}"
    end
    
    def getAllPoints
      string = ""
      for point in @points
        if string == "" then  string += "[#{point.to_s}]" 
        else string += ",[#{point.to_s}]" 
        end 
      end
      string  
    end

    def to_chart
      "label:'#{@label}', data:[#{getAllPoints}], points: {show:#{@showPoints}}, lines:{show:#{@showLines}}"
    end
    
  end #ChartItems

  class Chartable
    # may not be needed if i just make an array of chartItems.
    attr_accessor :datasets
    def initialize 
      @datasets = Array.new
    end
    
    def showLabel
      string = ""
      for sample in @datasets
        if string == "" then 
          string += "{#{sample.displayLabel}}"
        else 
          string += ",{#{sample.displayLabel}}"
        end
      end
      string
    end
    
   def to_chart
      string = ""
      for sample in @datasets
        if string == "" then 
          string += "{#{sample.to_chart}}"
        else 
          string += ",{#{sample.to_chart}}"
        end
      end
      string
    end
    
    def add(set)
      @datasets.push(set)
    end
  end #chartables

####################
# Use template system.
# make a chart
# return html string
#
####################
def templateSliderBar

end



def makeChart(*options)

display = "
<div class='span-24 last'>

<div class='span-15'>
<div id='overview' style='width:600px;height:50px'></div>
<p> Try zooming. Click and drag to select a zone.</p>

<div id='placeholder' style='width:600px;height:300px;'></div>

</div>


<div class='span-1'><br/>
</div>

<div class='span-7 last'>
<div id='legendholder' style='width:200px;height:1px;'></div>
</div>


<script id='source' language='javascript' type='text/javascript'>
<div class='span-24 last'></div>

$(function () {
var options = {
  xaxis: { mode: 'time' },
  selection: { mode: 'x' },
  //grid: { coloredAreas: weekendAreas },
  legend: {
      show: false,
      //labelFormatter: null,
      //labelBoxBorderColor: color,
      noColumns: 2,
      position: 'sw'   // 'ne' or 'nw' or 'se' or 'sw'
      //margin: number of pixels
      //backgroundColor: null or color
      //backgroundOpacity: number in 0.0 - 1.0
      //container: null or jQuery object
}
};

  var options_overview = {
  xaxis: { mode: 'time' },
  selection: { mode: 'x' },
  //grid: { coloredAreas: weekendAreas },
  legend: {
      show: false,
      //labelFormatter: null,
      //labelBoxBorderColor: color,
      noColumns: 2,
      position: 'sw'   // 'ne' or 'nw' or 'se' or 'sw'
      //margin: number of pixels
      //backgroundColor: null or color
      //backgroundOpacity: number in 0.0 - 1.0
      //container: null or jQuery object
}
};

  var options_legend = {
  xaxis: { mode: 'time' },
  selection: { mode: 'x' },
  //grid: { coloredAreas: weekendAreas },
  legend: {
      show: true,
      //labelFormatter: null,
      //labelBoxBorderColor: color,
      noColumns:2,
      position: 'ne',   // 'ne' or 'nw' or 'se' or 'sw'
      //margin: number of pixels
      //backgroundColor: null or color
      //backgroundOpacity: number in 0.0 - 1.0
      container: null // or jQuery object
}
};

var plot = $.plot($('#placeholder'), 
[  #{@chartable.to_chart } ], options);


var legendplot = $.plot($('#legendholder'), 
[  #{@chartable.showLabel} ],
{ lines: { show: false },
  shadowSize: 0,
  legend: {
      show: true,
      position: 'ne',
       },
  xaxis: { ticks: 0, mode: 'time' },
  yaxis: { ticks: 0}, //, min: 0, max: 4000 },
  selection: { mode: 'x' }
  }
);

var overview = $.plot($('#overview'), 
[  #{@chartable.to_chart}], 
{ lines: { show: true, lineWidth: 2 },
  shadowSize: 0,
  legend: {
    show: false },
    xaxis: { ticks: 3, mode: 'time' },
    selection: { mode: 'x' }
});

// now connect the two
var internalSelection = false;

$('#placeholder').bind('selected', function (event, area) {
  // do the zooming
  plot = $.plot($('#placeholder'),
   
  [#{@chartable.to_chart}],
                $.extend(true, {}, options, {
                    xaxis: { min: area.x1, max: area.x2 }
                }));
  
  if (internalSelection)
      return; // prevent eternal loop
  internalSelection = true;
  overview.setSelection(area);
  internalSelection = false;
});

$('#overview').bind('selected', function (event, area) {
  if (internalSelection)
      return;
  internalSelection = true;
  plot.setSelection(area);
  internalSelection = false;
});
});
</script>
"

end #def makeCharts(options)


##################
# myPlots
##################


def myPlots(options='all')
#pass "all" or specific option

@chartable = Chartable.new



#if it's a specific option then go with it, otherwise show 
#  all components of that model that are chartable.
unless options == "all" 
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
     :sleep=>[true,true,true],
     :stress=>[true,true,true]
     ]
   else
   @chartoptions = current_user.profile.myChartOptions
   
end


  if options == "all" || options == "bp" || options == "stress"
    @bps = current_user.bps.find(:all, :order => "measured_on asc") 
    getBP(@bps)  unless @bps.nil? #function call
  end

  if options == "all" || options == "stress"
    @stresses = current_user.stresses.find(:all, :order => "first_acknowledged asc") 
    getStresses  unless @stresses.nil? #function call
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
  
  
  
  
#####################
# Gets Stressors
#####################
  
def getStresses
  #stressors
  stress1, stress2 = [], [] 
  
  if ( @chartoptions[:stress][0])
    
   
    for stress in @stresses
      @set1 = ChartItem.new("")
      @set1.addPoint(stress.first_acknowledged.to_time.to_i * 1000,  stress.initial_effect_on_life)
      for stress_log in stress.stress_logs
        @set1.addPoint(stress_log.measured_on.to_i * 1000, stress_log.effect_on_life) 
      end
      
      if @chartoptions[:stress][0]
      @chartable.add(@set1)
      end 


     
    end 
  end 
end 
    
  
  
####################
#gets sleep
####################
def getSleep

  sleep1, sleep2 , sleep1_avg , sleep2_avg = [], [], [], []  
  sum_sleep1, sum_sleep2 , count = 0,0,0 
   
    @set = ChartItem.new('Sleep % of 8hr<a href=\"popup\">i</a>')
    @set2 = ChartItem.new("Average Sleep")
    for sleeps in @sleeps
      count += 1 
      #divide seconds of sleep by 288 so that we can get a number between 0 and 100 (or above) 
      # based on the concept that you want to get 8 hours of sleep on average, and to give you numbers 
      # are reasonable to look at.
      #60 sec/min * 60 min/hour = 3600 seconds per hour
      #3600 s/h * 8 hours = 28800
      # 288 = 0-100 scale rather then 0.0 to 1.0 scale.
      @set.addPoint(sleeps.started_at.to_i * 1000,((sleeps.woke_up_at - sleeps.started_at) / 288))
      #sleep1 << [ "[#{sleeps.started_at.to_i * 1000}, #{((sleeps.woke_up_at - sleeps.started_at) / 288)} ]" ] 
      sum_sleep1 += ( (sleeps.woke_up_at - sleeps.started_at) / 288)
      @set2.addPoint(sleeps.started_at.to_i * 1000,( sum_sleep1 / count) )
      puts ("#{sleeps.started_at.to_i * 1000},#{( sum_sleep1 / count)}" )
      #sleep1_avg << [ "[ #{sleeps.started_at.to_i * 1000}, #{sum_sleep1 / count} ]" ] 
    end
    
    if @chartoptions[:sleep][0]
      @chartable.add(@set)
      #@plot_data << "label: '% of 8hr<a href=\"popup\">i</a>', data: [#{sleep1.join(",")}]  ,points: { show: true }, lines: { show: true }" 
    end 
    if @chartoptions[:sleep][1]
      @chartable.add(@set2)
      #@plot_data << "label: 'Sleep Avg %' , data: [#{sleep1_avg.join(",")}] ,points: { show: false }, lines: { show: true }" 
    
    end 

    puts @chartable.datasets

end #def getSleep
  
  
  
#####################
# Gets Blood Pressure
#####################
  
def getBP(chart_bps)
  
  #Bloodpressure
  bp1, bp2 , bp1_avg , bp2_avg = [], [], [], []  
  sum_bp1, sum_bp2 , count = 0,0,0 
  if ( @chartoptions[:bp][0]|| @chartoptions[:bp][1]) 
  
    @setSys = ChartItem.new("BP:Systolic")
    @setDias = ChartItem.new("BP:Diastolic")
    @setSysAvg = ChartItem.new("BP:Systolic:Avg")
    @setDiasAvg = ChartItem.new("BP:Diastolic:Avg")  
      
    for bps in chart_bps
      count += 1 
      
      @setSys.addPoint(bps.measured_on.to_i * 1000,bps.systolic)
      @setDias.addPoint(bps.measured_on.to_i * 1000,bps.diastolic)
      
      sum_bp1 += bps.systolic  
      sum_bp2 += bps.diastolic     
      @setSysAvg.addPoint(bps.measured_on.to_i * 1000,sum_bp1/count)
      @setDiasAvg.addPoint(bps.measured_on.to_i * 1000,sum_bp2/count)     
    end  
       
    if @chartoptions[:bp][0]      
      @chartable.add(@setSys)
      @chartable.add(@setDias)
    end 
    if @chartoptions[:bp][1]  
      @chartable.add(@setSysAvg)
      @chartable.add(@setDiasAvg)
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

    @set1 = ChartItem.new("Cholesterol:HDL")
    @set2 = ChartItem.new("Cholesterol:LDL")
    @set1Avg = ChartItem.new("HDL Avg")
    @set2Avg = ChartItem.new("LDL Avg") 
 
  for cholesterols in @cholesterols
    chol_sum1 += cholesterols.hdl 
    chol_sum2 += cholesterols.ldl 
    count += 1 
    @set1.addPoint(cholesterols.measured_on.to_i * 1000,cholesterols.hdl)
    @set2.addPoint(cholesterols.measured_on.to_i * 1000,cholesterols.ldl)
    @set1Avg.addPoint(cholesterols.measured_on.to_i * 1000,chol_sum1 / count.to_f)
    @set2Avg.addPoint(cholesterols.measured_on.to_i * 1000,chol_sum2 / count.to_f)
  end 
  if @chartoptions[:cholesterol][0]
    @chartable.add(@set1)
    @chartable.add(@set2) 
  end 
  if @chartoptions[:cholesterol][1]
    @chartable.add(@set1Avg)
    @chartable.add(@set2Avg)
  end
end # cholesterol 
end #def getCholesterol
  
  
##################
# Get measurements
##################

def 
getMeasurements
#measurements
if @chartoptions[:measurements][0] || @chartoptions[:measurements][1] || @chartoptions[:measurements][2]

    @set1 = ChartItem.new("Weight")
    @set1Avg = ChartItem.new("Avg Weight")
    @set2 = ChartItem.new("Fat%")
    @set2Avg = ChartItem.new("Avg Fat%") 
    @set3 = ChartItem.new("Muscle%")
    @set3Avg = ChartItem.new("Avg Muschle %")  
    @set4 = ChartItem.new("Visceral Fat")
    @set4Avg = ChartItem.new("Avg Visceral Fat") 
    @set5 = ChartItem.new("Measurement:Chest")
    @set5Avg = ChartItem.new("Avg Chest Measurement")
    @set6 = ChartItem.new("Measurement:Belly")
    @set6Avg = ChartItem.new("Avg Belly Measurement")
    @set7 = ChartItem.new("Measurement:Hip")
    @set7Avg = ChartItem.new("Avg Hip Measurement")
    #@set = ChartItem.new("")
    #@setAvg = ChartItem.new("")
    
    
    
  meas1, meas2, meas3, meas4, meas5, meas6, meas7, meas8 = [],[],[],[],[],[],[],[] 
  meas1_avg, meas2_avg, meas3_avg, meas4_avg, meas5_avg, meas6_avg, meas7_avg, meas8_avg = [],[],[],[],[],[],[],[] 
  meas1_count, meas2_count, meas3_count, meas4_count, meas5_count, meas6_count, meas7_count, meas8_count = 0,0,0,0,0,0,0,0 
  
  meas1_sum, meas2_sum, meas3_sum, meas4_sum, meas5_sum, meas6_sum, meas7_sum, meas8_sum = 0,0,0,0,0,0,0,0 
  
  for measurement in @measurements
    unless (measurement.weight.nil? || measurement.weight == 0) && ! (@chartoptions[:measurement_weight][0] || @chartoptions[:measurement_weight][1])  
      meas1_count += 1 
      meas1_sum += measurement.weight  
      @set1.addPoint(measurement.measured_on.to_i * 1000,measurement.weight)
      @set1Avg.addPoint(measurement.measured_on.to_i * 1000, meas1_sum.to_f/ meas1_count.to_f)
    end 
    
    if !(measurement.fat_percent.nil? ) &&  ( @chartoptions[:measurement_fat_percent][0] || @chartoptions[:measurement_fat_percent][1]) 
      
      meas3_count += 1 
      meas3_sum += measurement.fat_percent
      @set2.addPoint(measurement.measured_on.to_time.to_i * 1000, measurement.fat_percent)
      @set2Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas3_sum.to_f/ meas3_count.to_f)
    end 
    
    if !(measurement.muscle_percent.nil?)   &&  ( @chartoptions[:measurement_muscle_percent][0] || @chartoptions[:measurement_muscle_percent][1] ) 
      meas4_count += 1 
      meas4_sum += measurement.muscle_percent  
      
      @set3.addPoint(measurement.measured_on.to_time.to_i * 1000, measurement.muscle_percent)
      @set3Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas4_sum.to_f/ meas4_count.to_f)
    end 
    
    if !(measurement.visceral_fat.nil? ) && ( @chartoptions[:measurement_visceral_fat][0] || @chartoptions[:measurement_visceral_fat][1])
      meas5_count += 1 
      meas5_sum += measurement.visceral_fat  
      @set4.addPoint(measurement.measured_on.to_time.to_i * 1000, measurement.visceral_fat)
      @set4Avg.addPoint(measurement.measured_on.to_time.to_i * 1000,meas5_sum.to_f/ meas5_count.to_f)
      
    end 
    
    if !(measurement.chest.nil? )  &&  ( @chartoptions[:measurement_chest][0] || @chartoptions[:measurement_chest][1]) 
      meas6_count += 1 
      meas6_sum += measurement.chest  
      @set5.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.chest)
      @set5Avg.addPoint(measurement.measured_on.to_time.to_i * 1000,meas6_sum.to_f/ meas6_count.to_f)
    end 
    if !(measurement.belly.nil? ) &&  ( @chartoptions[:measurement_belly][0] || @chartoptions[:measurement_belly][1]) 
      meas7_count += 1 
      meas7_sum += measurement.belly  
      
      @set6.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.belly)
      @set6.addPoint(measurement.measured_on.to_time.to_i * 1000,meas7_sum.to_f/ meas7_count.to_f) 
    end 
    if !(measurement.hip.nil? )  &&  (@chartoptions[:measurement_hip][0] || @chartoptions[:measurement_hip][1]) 
      meas8_count += 1 
      meas8_sum += measurement.hip  
      @set7.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.hip)
      @set7Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas8_sum.to_f/ meas8_count.to_f)
    end 
  end 
    
  if @chartoptions[:measurements][0]
    if @chartoptions[:measurement_weight][0]
      @chartable.add(@set1)
    end 
    if @chartoptions[:measurement_fat_percent][0]
      @chartable.add(@set2)
    end 
    if @chartoptions[:measurement_muscle_percent][0]
      @chartable.add(@set3)
    end 
    if @chartoptions[:measurement_visceral_fat][0]
     @chartable.add(@set4)
    end 
    if @chartoptions[:measurement_chest][0]
     @chartable.add(@set5)
    end 
    if @chartoptions[:measurement_belly][0]
     @chartable.add(@set6) 
    end 
    if @chartoptions[:measurement_hip][0]
@chartable.add(@set7)
    end 
  end # if @chartoptions[:measurements][0]
  if @chartoptions[:measurements][1]
    if @chartoptions[:measurement_weight][1]
      @chartable.add(@set1Avg)
    end 
    if @chartoptions[:measurement_fat_percent][1]
      @chartable.add(@set2Avg)
    end 
    if @chartoptions[:measurement_muscle_percent][1]
     @chartable.add(@set3Avg)
    end 
    if @chartoptions[:measurement_visceral_fat][1]
      @chartable.add(@set4Avg)
    end 
    if @chartoptions[:measurement_chest][1]
      @chartable.add(@set5Avg)
    end 
    if @chartoptions[:measurement_belly][1]
      @chartable.add(@set6Avg)
    end 
    if @chartoptions[:measurement_hip][1]
      @chartable.add(@set7Avg)
    end 
  end # if @chartoptions[:measurements][1]
end # if @chartoptions[:measurments] 
end #def getMeasurements



  
end # ends helper

