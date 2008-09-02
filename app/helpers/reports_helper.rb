module ReportsHelper

def minitable(table_header, table_labels, table_data)

html_block = "#{table_header}<br /><table class='mini'><tr>" #string for returning html block.

table_labels.each do |label|
  html_block += "<th>#{label}</th>"
end

html_block += "</tr>"

table_data.each do |data|

html_block += "<tr><td>#{data.join('</td><td>')}</tr>\n"

end



html_block += "</table>"  #return code for table.
end

end
