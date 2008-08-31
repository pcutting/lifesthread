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

named_scope :with_rx_affiliate_no , lambda { |*args| 
{ :conditions => ["rx_affiliate_no = ?", args[0] ] } 
}

def age  
(( Time.now - self.dob.to_time ) / 1.years).to_i
end




end
