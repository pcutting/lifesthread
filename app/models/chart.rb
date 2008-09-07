class Chart


#serialize :chart_options

datam = Array.new
x_max, x_min, y_max, y_min = 0,0,0,0

virgin_chart = true

def addData(recordset, showPoints = true, description = "blank")
  points = Array.new
  points << [ 12, 123]
  points << [ 45, 1234]


#max = m.find(:first, :select => "max(weight) as max_weight, min(weight) as min_weight, max(measured_on) as max_date, min(measured_on) as min_date")
#>> max.attributes
#=> {"max_weight"=>"215", "max_date"=>"2008-09-02 01:17:47", "min_weight"=>"145", "min_date"=>"2007-06-27 12:11:43"}
  my_ranges = recordset.find(:first, :select => "max(weight) as max_weight, min(weight) as min_weight, max(measured_on) as max_date, min(measured_on) as min_date")
  
  set_boundry(x,y)
  set_boundry(x,y)
  
  datam << [points, showPoints, desciption]
  
end

def set_boundry(point_x, point_y)
  if virgin_chart then
    x_max, x_min = point_x, point_x
    y_max, y_min = point_y, point_y
    virgin_chart = false
  else 
    if x_max < point_x then x_max = point_x end
    if y_max < point_y then y_max = point_y end
    if x_min > point_x then x_min = point_x end
    if y_min > point_y then y_min = point_y end
  end
end
