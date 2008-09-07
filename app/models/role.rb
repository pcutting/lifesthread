class Role < ActiveRecord::Base

belongs_to :user



#current_user.roles.find(:all, :conditions => ["has_role = ? OR has_role = ?", "MEMBER","SUPER MEMBER" ]) == []

#named_scope :with_sex , lambda { |*args| 
#if (args[0].first == "f" || args[0].first == "F")  then args[0] = "female" else args[0] = "male" end
#{ :conditions => ["sex = ?", args[0] ] }  }

#send it the zipcode, here conditions so far = zip code.
#named_scope :with_member , lambda { |*args| 
#if args[0].class == String then { :conditions => ["(has_role = ? OR has_role = ? ) AND conditions = ?", "MEMBER","SUPER MEMBER", args[0] ] } 
#end
#if args[0].class == Array then 
#my_conditions = ""
#args.each { |arg| my_conditions += arg  }

#{ :conditions => ["(has_role = ? OR has_role IN ? ) AND conditions = #{args.join(", conditions = ?")}", "MEMBER","SUPER MEMBER", "#{args.join(",")}" ] } 
#end
#}


end
