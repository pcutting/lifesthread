module ChartsHelper
  class Calendar 
    
    attr_accessor :events
    
    def initialize
      @events = Array.new
    end
  end
  
  class Event
  
    @date
    @label
    @summary 
    @type

    attr_reader :date, :label, :summary, :type 
    attr_writer  :label, :summary, :type
    
    def date 
      @date.to_date
    end
    
    def initialize
      
    end
    
    def initialize(date,label,summary,type)
      @date = date.to_date
      @label = label
      @summary = summary
      @type = type
    end
    
    def to_s
      "#{@label}: #{@date} <br/>#{@summary}"
    end
  end

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

def makeChart(*options)

display = "
<div class='charts last'>

<div class='left'>
<div id='overview' style='width:600px;height:50px'></div>
<p> Try zooming. Click and drag to select a zone.</p>

<div id='placeholder' style='width:600px;height:300px;'></div>

</div>


<div id='legendholder' class='right' style='width:200px;height:1px;'></div>


<div class='last'></div>
<script id='source' language='javascript' type='text/javascript'>


$(function () {
var options = {
  xaxis: { mode: 'time' },
  selection: { mode: 'x' },
  legend: { show: false}
};

var options_overview = {
  xaxis: { mode: 'time' },
  selection: { mode: 'x' },
  legend: { show: false}
};

var options_legend = {
  xaxis: { mode: 'time' },
  selection: { mode: 'x' },
  legend: {
      show: true,
      //labelFormatter: null,
      //labelBoxBorderColor: color,
      noColumns:2,
      position: 'ne'  
      // 'ne' or 'nw' or 'se' or 'sw'
      //margin: number of pixels
      //backgroundColor: null or color
      //backgroundOpacity: number in 0.0 - 1.0
      //container: null // or jQuery object
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
      position: 'ne'
       },
  xaxis: { ticks: 0, mode: 'time' },
  yaxis: { ticks: 0}
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
     :measurements=>[true,true,true],
     :measurement_weight=>[true,true,true],
     :measurement_resting_metabolism=>[true,true,true],
     :measurement_fat_percent=>[true,true,true],
     :measurement_muscle_percent=>[true,true,true],
     :measurement_visceral_fat=>[true,true,true],
     :measurement_water_percent=>[true,true,true],
     :measurement_chest=>[true,true,true],
     :measurement_calf => [true, true, true],
     :measurement_pectoral=>[true,true,true],
     :measurement_bicep=>[true,true,true],
     :measurement_belly=>[true,true,true],
     :measurement_hip=>[true,true,true],
     :measurement_thigh=>[true,true,true],
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
    getCholesterol unless @cholesterols.nil? #function call
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
      @set1 = ChartItem.new("Stress:#{stress.title}")
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
      #puts ("#{sleeps.started_at.to_i * 1000},#{( sum_sleep1 / count)}" )
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

    #puts @chartable.datasets

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
      
      if ( bps.systolic.nil? || bps.diastolic.nil? ) then
        #can not have a nil value here.  
        count -= 1
      else
        sum_bp1 += bps.systolic  
        sum_bp2 += bps.diastolic  
        
      end  
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

if ( @chartoptions[:cholesterol][0] || @chartoptions[:cholesterol][1])

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

def getMeasurements
#measurements
#TODO check that this needs to be called, currently it always calls it.
#if @chartoptions[:measurements][0] || @chartoptions[:measurements][1] || @chartoptions[:measurements][2]

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
    @set8 = ChartItem.new("Measurement:Thigh")
    @set8Avg = ChartItem.new("Avg Thigh Measurement")
    @set9 = ChartItem.new("Measurement:Calf")
    @set9Avg = ChartItem.new("Avg Calf Measurement")
    @set10 = ChartItem.new("Measurement:Bicep")
    @set10Avg = ChartItem.new("Avg Bicep Measurement")
    @set11 = ChartItem.new("Measurement:Metabolism")
    @set11Avg = ChartItem.new("Avg Metabolism Measurement")
    @set12 = ChartItem.new("Measurement:Water %")
    @set12Avg = ChartItem.new("Avg Water % Measurement")
    #@set = ChartItem.new("Measurement:")
    #@setAvg = ChartItem.new("Avg Measurement")
    
    
    
  meas1, meas2, meas3, meas4, meas5, meas6, meas7, meas8, meas9, meas10, meas11, meas12, meas13 = [],[],[],[],[],[],[],[],[],[],[],[],[]
  
  meas1_avg, meas2_avg, meas3_avg, meas4_avg, meas5_avg, meas6_avg, meas7_avg, meas8_avg, meas9_avg, meas10_avg, meas11_avg, meas12_avg, meas13_avg = [],[],[],[],[],[],[],[],[],[],[],[],[]
  
   
  meas1_count, meas2_count, meas3_count, meas4_count, meas5_count, meas6_count, meas7_count, meas8_count, meas9_count, meas10_count, meas11_count, meas12_count, meas13_count = 0,0,0,0,0,0,0,0 ,0,0,0,0,0
  
  meas1_sum, meas2_sum, meas3_sum, meas4_sum, meas5_sum, meas6_sum, meas7_sum, meas8_sum , meas9_sum, meas10_sum, meas11_sum, meas12_sum, meas13_sum = 0,0,0,0,0,0,0,0,0,0,0,0,0 
  
  for measurement in @measurements
    if (!measurement.weight.nil? && measurement.weight != 0) &&  (@chartoptions[:measurement_weight][0] || @chartoptions[:measurement_weight][1]  || @chartoptions[:measurements][0] || @chartoptions[:measurements][1])  
      meas1_count += 1 
      meas1_sum += measurement.weight  
      @set1.addPoint(measurement.measured_on.to_i * 1000,measurement.weight)
      @set1Avg.addPoint(measurement.measured_on.to_i * 1000, meas1_sum.to_f/ meas1_count.to_f)
    end 
    
    if !(measurement.fat_percent.nil? ) &&  ( @chartoptions[:measurement_fat_percent][0] || @chartoptions[:measurement_fat_percent][1]  || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      
      meas3_count += 1 
      meas3_sum += measurement.fat_percent
      @set2.addPoint(measurement.measured_on.to_time.to_i * 1000, measurement.fat_percent)
      @set2Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas3_sum.to_f/ meas3_count.to_f)
    end 
    
    if !(measurement.muscle_percent.nil?)   &&  ( @chartoptions[:measurement_muscle_percent][0] || @chartoptions[:measurement_muscle_percent][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas4_count += 1 
      meas4_sum += measurement.muscle_percent  
      
      @set3.addPoint(measurement.measured_on.to_time.to_i * 1000, measurement.muscle_percent)
      @set3Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas4_sum.to_f/ meas4_count.to_f)
    end 
    
    if !(measurement.visceral_fat.nil? ) && ( @chartoptions[:measurement_visceral_fat][0] || @chartoptions[:measurement_visceral_fat][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1])
      meas5_count += 1 
      meas5_sum += measurement.visceral_fat  
      @set4.addPoint(measurement.measured_on.to_time.to_i * 1000, measurement.visceral_fat)
      @set4Avg.addPoint(measurement.measured_on.to_time.to_i * 1000,meas5_sum.to_f/ meas5_count.to_f)
      
    end 
    
    if !(measurement.chest.nil? )  &&  ( @chartoptions[:measurement_chest][0] || @chartoptions[:measurement_chest][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas6_count += 1 
      meas6_sum += measurement.chest  
      @set5.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.chest)
      @set5Avg.addPoint(measurement.measured_on.to_time.to_i * 1000,meas6_sum.to_f/ meas6_count.to_f)
    end 
    
    if !(measurement.belly.nil? ) &&  ( @chartoptions[:measurement_belly][0] || @chartoptions[:measurement_belly][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas7_count += 1 
      meas7_sum += measurement.belly  
      
      @set6.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.belly)
      @set6.addPoint(measurement.measured_on.to_time.to_i * 1000,meas7_sum.to_f/ meas7_count.to_f) 
    end 
    
    if !(measurement.hip.nil? )  &&  (@chartoptions[:measurement_hip][0] || @chartoptions[:measurement_hip][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas8_count += 1 
      meas8_sum += measurement.hip  
      @set7.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.hip)
      @set7Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas8_sum.to_f/ meas8_count.to_f)
    end 
    
    b1 = measurement.thigh.nil? && measurement.thigh == 0 
    b2a = @chartoptions[:measurement_thigh][0]
    b2b = @chartoptions[:measurement_thigh][1]   
    b2c = @chartoptions[:measurements][0] 
    b2d = @chartoptions[:measurements][1]
    
    b2 = b2a || b2b || b2c || b2d
    
    if !(b1)  &&  (b2) 
      meas9_count += 1 
      unless measurement.thigh.nil? then
        meas9_sum += measurement.thigh  
        @set8.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.thigh)
        @set8Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas9_sum.to_f/ meas9_count.to_f)
      end 
    end     
    
    if !(measurement.calf.nil? && measurement.calf == 0 )  &&  (@chartoptions[:measurement_calf][0] || @chartoptions[:measurement_calf][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas10_count += 1 
      meas10_sum += measurement.calf  
      @set9.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.calf)
      @set9Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas10_sum.to_f/ meas10_count.to_f)
    end  
    
    if !(measurement.bicep.nil? && measurement.bicep == 0 )  &&  (@chartoptions[:measurement_bicep][0] || @chartoptions[:measurement_bicep][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas11_count += 1 
      meas11_sum += measurement.bicep  
      @set10.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.bicep)
      @set10Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas11_sum.to_f/ meas11_count.to_f)
    end      

    if !(measurement.resting_metabolism.nil? && measurement.resting_metabolism == 0 )  &&  (@chartoptions[:measurement_resting_metabolism][0] || @chartoptions[:measurement_resting_metabolism][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas12_count += 1 
      meas12_sum += measurement.resting_metabolism  
      @set11.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.resting_metabolism)
      @set11Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas12_sum.to_f/ meas12_count.to_f)
    end   
    
    if !(measurement.water_percent.nil? && measurement.water_percent == 0 )  &&  (@chartoptions[:measurement_water_percent][0] || @chartoptions[:measurement_water_percent][1]   || @chartoptions[:measurements][0] || @chartoptions[:measurements][1]) 
      meas13_count += 1 
      meas13_sum += measurement.water_percent  
      @set12.addPoint(measurement.measured_on.to_time.to_i * 1000,measurement.water_percent)
      @set12Avg.addPoint(measurement.measured_on.to_time.to_i * 1000, meas13_sum.to_f/ meas13_count.to_f)
    end       
    
  end 
#  ----------------------------------
#  now start adding them to the chart
#  ----------------------------------    
  #if @chartoptions[:measurements][0]
    if (@chartoptions[:measurement_weight][0] || @chartoptions[:measurements][0] )
      @chartable.add(@set1)
    end 
    if (@chartoptions[:measurement_fat_percent][0] || @chartoptions[:measurements][0] )
      @chartable.add(@set2)
    end 
    if (@chartoptions[:measurement_muscle_percent][0] || @chartoptions[:measurements][0] )
      @chartable.add(@set3)
    end 
    if (@chartoptions[:measurement_visceral_fat][0] || @chartoptions[:measurements][0] )
     @chartable.add(@set4)
    end 
    if (@chartoptions[:measurement_chest][0] || @chartoptions[:measurements][0] )
     @chartable.add(@set5)
    end 
    if (@chartoptions[:measurement_belly][0] || @chartoptions[:measurements][0] )
     @chartable.add(@set6) 
    end 
    if (@chartoptions[:measurement_hip][0] || @chartoptions[:measurements][0] )
@chartable.add(@set7)
    end 

    if (@chartoptions[:measurement_thigh][0] || @chartoptions[:measurements][0] )
@chartable.add(@set8)
    end 

    if (@chartoptions[:measurement_calf][0] || @chartoptions[:measurements][0] )
@chartable.add(@set9)
    end 
    if (@chartoptions[:measurement_bicep][0] || @chartoptions[:measurements][0] )
@chartable.add(@set10)
    end 
    if (@chartoptions[:measurement_resting_metabolism][0] || @chartoptions[:measurements][0] )
@chartable.add(@set11)
    end 
    if (@chartoptions[:measurement_water_percent][0] || @chartoptions[:measurements][0] )
@chartable.add(@set12)
    end 
  #end # if @chartoptions[:measurements][0] || @chartoptions[:measurements][0]
  
  
#  if @chartoptions[:measurements][1]
    if @chartoptions[:measurement_weight][1] || @chartoptions[:measurements][1]
      @chartable.add(@set1Avg)
    end 
    if @chartoptions[:measurement_fat_percent][1] || @chartoptions[:measurements][1]
      @chartable.add(@set2Avg)
    end 
    if @chartoptions[:measurement_muscle_percent][1] || @chartoptions[:measurements][1]
     @chartable.add(@set3Avg)
    end 
    if @chartoptions[:measurement_visceral_fat][1] || @chartoptions[:measurements][1]
      @chartable.add(@set4Avg)
    end 
    if @chartoptions[:measurement_chest][1] || @chartoptions[:measurements][1]
      @chartable.add(@set5Avg)
    end 
    if @chartoptions[:measurement_belly][1] || @chartoptions[:measurements][1]
      @chartable.add(@set6Avg)
    end 
    if @chartoptions[:measurement_hip][1] || @chartoptions[:measurements][1]
      @chartable.add(@set7Avg)
    end 
    if @chartoptions[:measurement_thigh][1] || @chartoptions[:measurements][1]
      @chartable.add(@set8Avg)
    end 
    if @chartoptions[:measurement_calf][1] || @chartoptions[:measurements][1]
      @chartable.add(@set9Avg)
    end 
    if @chartoptions[:measurement_bicep][1] || @chartoptions[:measurements][1]
      @chartable.add(@set10Avg)
    end 
    if @chartoptions[:measurement_resting_metabolism][1] || @chartoptions[:measurements][1]
      @chartable.add(@set11Avg)
    end 
    if @chartoptions[:measurement_water_percent][1] || @chartoptions[:measurements][1]
      @chartable.add(@set12Avg)
    end 
#  end # if @chartoptions[:measurements][1] || @chartoptions[:measurements][1]


#end # if @chartoptions[:measurments] 
end #def getMeasurements

###########################################
# table generation.
###########################################

def make_table

  i = 0
  column = 0
  width = 850
  max_column = 10
  cell_width = width/ max_column

  #medical      #t.date :approx_date      #t.string :hospital      #t.string :problem      #t.string :treatment      #t.string :doctor      #t.string :city      #t.string :state      #t.string :dr_phone      #t.boolean :required_hospitalization
  #illness      #t.string :title      #t.boolean :has      #t.boolean :controlled      #t.boolean :at_risk      #t.boolean :in_family_history      #t.boolean :concerned_about      #t.string :comment
  
  @calendar = Calendar.new
  counter = 0

  unless @medical_histories.nil?
    
    for med in @medical_histories
      counter += 1
      @calendar.events.push(Event.new(med.approx_date.to_date, "H#{counter}<br/>#{med.approx_date.to_date.to_s(:short)}" , "<em>Dr Name:</em>#{med.doctor} <em>Hospital:</em>#{med.hospital},<br/><em>Purpose:</em>#{med.problem}, <em>Hospitalization:</em>#{if med.required_hospitalization then 'Yes' else 'No' end}","H"))
    end
  end
  
  unless @illness.nil?
    counter = 0
    for ill in @illness
      counter += 1
      #i need to add a date field for this.
      @calendar.events.push(Event.new(ill.measured_on.to_date, "I#{counter}<br/>#{ill.measured_on.to_date.to_s(:short)}", "Condition:#{ill.title}, Controlled:#{if ill.controlled then 'Yes' else 'No' end}", "I"))
    end
  end
  
  @calendar.events.sort! { |a,b| a.date <=> b.date }
  
  #if @calendar.events.size > 1 then
  #  @calendar.events.sort! { |a,b| a.date <=> b.date } 
  #end 
  
  table = '<br/><table>'
  for event in @calendar.events
     table += "<tr><td" 
     if event.type == "H" then table += ' class="Hospital" '
     elsif event.type == "I" then table += ' class="Illness" ' 
     elsif event.type == "M" then table += ' class="Medication" '
     end
     
     table += ">#{event.label}</td><td>#{event.date}</td><td>#{event.summary}</td></tr>"
  end 
  table += "</table></br>"
  
  chart = "<table width=#{width}><tr>"

  
  while i < @calendar.events.size
     
    currentDate = @calendar.events[i].date
    previousDate = currentDate if previousDate.nil?
    
    
    chart += "<td width= #{cell_width}>"
       
      while i < @calendar.events.size && @calendar.events[i].date == currentDate
        chart += '<table><tr><td'
        
        if @calendar.events[i].type == "H" then chart += ' class="Hospital" '
         elsif @calendar.events[i].type == "I" then chart += ' class="Illness" ' 
         elsif @calendar.events[i].type == "M" then chart += ' class="Medication" '
        end
     
        chart += ">" +@calendar.events[i].label + "</td></tr></table><br/>"
        i += 1
      end #@calendar... == currentDate

      
    chart += "</td>"
    column += 1
    if column >=  max_column 
      column = 0
      chart += "</tr><tr><td colspan = #{ max_column }><div align = left>#{[previousDate]}</div><div align = right>#{@calendar.events[i].date}</div></td></tr><tr>"
      previousDate = @calendar.events[i].date
    end
  end #while x< @cal...
  
#  while column < max_column 
#    chart += "<td width = #{cell_width}></td>"
#    column += 1
#  end 
  
  chart += "</tr><tr><td colspan = #{ max_column }><div align = left>#{previousDate}</div><div align = right>#{@calendar.events.last.date}</div></td></tr><tr>"
  chart += "</tr></table>"
  
  chart += "<br/><h3>Summary</h3>[H = Hospital Medical Event, I = Illness History]<br/>" + table 
  
end







#---------------------------------------------

class ADate

 # @date
 # @illnesses
 # @hospitals
 # @medications
 
  attr_accessor :date, :illnesses, :hospitals, :medications
  
  def initialize(d)
    @date = d.to_date
    @illnesses = []
    @hospitals = [] 
    @medications = []
  end
  
  def date=(d)
    @date = d.to_date
  end
  
  def illnesses=(ill)
    @illnesses.push(ill)
  end
  
  def hospitals=(hosp)
    @hospitals.push(hosp)
  end
  
  def medications=(med)
    @medications.push(med)
  end  

  
end #ADate


#------------------------------------------------

def make_table_styled
  i = 0
  column = 0
  width = 850
  max_column = 15
  cell_width = width / max_column
  
   min_date = nil
  max_date = nil

  
  @table_styled = {}
  counter = 0

  unless @medical_histories.nil?
    for med in @medical_histories
      counter += 1
      #raise med.approx_date.to_date.hash
      if @table_styled[med.approx_date.to_date.hash].nil? then    
        @table_styled[med.approx_date.to_date.hash] = ADate.new(med.approx_date)  
      end #null date
     
      #raise @table_styled.to_yaml
      # #{med.approx_date.to_date.strftime("%d %b '%y")}
      @table_styled[med.approx_date.to_date.hash].hospitals = Event.new(med.approx_date.to_date, "P#{counter}" , "<em>Procedure: </em>#{med.problem}, <em>InPatient: </em>#{if med.required_hospitalization then 'Yes' else 'No' end}, <em>Dr: </em>#{med.doctor}, <em>Facility: </em>#{med.hospital},","P")
    
    end
  end
  
   
  unless @illness.nil?
    counter = 0
    for ill in @illness
      counter += 1
      if @table_styled[ill.measured_on.to_date.hash].nil? then
        @table_styled[ill.measured_on.to_date.hash] = ADate.new(ill.measured_on)
      end #null date
      
      #i need to add a date field for this.
      # <br/>#{ill.measured_on.to_date.strftime("%d %b '%y")}
      @table_styled[ill.measured_on.to_date.hash].illnesses = Event.new(
        ill.measured_on.to_date, 
        "C#{counter}", 
        "Condition: #{ill.title}, Controlled: #{if ill.controlled then 'Yes' else 'No' end}, Family History: #{if ill.in_family_history then 'Yes' else 'No' end}", "C")
    end 
  end


  unless @medications.nil?
    counter = 0
    for med in @medications
      counter += 1
      
      unless med.prescribed_start.nil? then
        if @table_styled[med.prescribed_start.to_date.hash].nil? then
          @table_styled[med.prescribed_start.to_date.hash] = ADate.new(med.prescribed_start)
        end #null date
        # <br/>#{med.prescribed_start.to_date.strftime("%d %b '%y")}
        @table_styled[med.prescribed_start.to_date.hash].medications = Event.new(
          med.prescribed_start.to_date, 
          "M#{counter}", 
          "Medication:#{med.name}, Dosage:#{med.strength} #{med.unit_type}, Objective:#{med.purpose}",  "M")
          
       end
    end
  end


  
  #raise @table_styled.inspect
 
  @table_styled = @table_styled.sort
  
  table = '<br/><h3>Timeline</h3><table>'
  
  table += '<tr><td class="Illness">Condition</td>'
  @table_styled.each {|day, day_value| 
    table += "<td>"
    day_value.illnesses.each {| ill | 
     table += "#{ill.label}<br/>"
    }  
    table += "</td>"
  }
  
   
  table += '<tr><td class="Hospital">Procedure</td>'
  
  @table_styled.each {|day, day_value| 
    table += "<td>"
    day_value.hospitals.each {| hosp | 
     table += "#{hosp.label}<br/>"
    }  
    table += "</td>"
  }
  
  table += "</tr>" 
  
  

  
  table += '<tr><td class="Medication">Prescription</td>'
  @table_styled.each {|day, day_value| 
  
    if (min_date == nil) then 
      min_date = day_value.date
      max_date = min_date
    else
      if day_value.date > max_date then max_date = day_value.date end
      if day_value.date < min_date then min_date = day_value.date end #probably not needed.
    end
  
    table += "<td>"
    day_value.medications.each {| med | 
     table += "#{med.label}<br/>"
    }  
    table += "</td>"
  }  
  
  cells = @table_styled.size + 1
  l_cells = cells / 2
  r_cells = cells - l_cells
  
  table += "</tr><tr><td colspan=#{l_cells}>#{min_date.to_s(:long)}</td><td colspan=#{r_cells } align=right>#{max_date.to_s(:long)}</td></tr></table></br>"
 
  summary = "<br/><table><tr><th></th><th>Date</th><th>Summary</th></tr>"

 
  @table_styled.each {|day, day_value| 
    

    day_value.illnesses.each {| value |
     cls = '"Illness"'
     summary += "<tr><td class=#{cls}>#{value.label}</td><td>#{value.date.to_s(:long)}</td><td>#{value.summary}</td></tr>"
    }   
  
    day_value.hospitals.each {| value |
      cls='"Hospital"'
      summary += "<tr><td class=#{cls}>#{value.label}</td><td>#{value.date.to_s(:long)}</td><td>#{value.summary}</td></tr>"
    }  
  

    
    day_value.medications.each {| value |
      cls='"Medication"'
      summary += "<tr><td class=#{cls}>#{value.label}</td><td>#{value.date.to_s(:long)}</td><td>#{value.summary}</td></tr>"
    }  
  }  
  summary += "</table>"
  
  
 
         #if @calendar.events[i].type == "H" then chart += ' class="Hospital" '
         #elsif @calendar.events[i].type == "I" then chart += ' class="Illness" ' 
         #elsif @calendar.events[i].type == "M" then chart += ' class="Medication" '
        #end
     
        #chart += ">" +@calendar.events[i].label + "</td></tr></table><br/>"
        #i += 1
 
 
  table + summary
  
end



 
end # ends helper

