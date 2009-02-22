class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.date :dob
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :cell_phone
      t.string :phone
      t.string :work_phone
      t.integer :height_inch
      t.string :body_shape
      t.string :sex
      t.string :race
      t.string :rx_affiliate_no , :default => "NONE"
      t.string :sale_code , :default => "SELF"
      t.boolean :terms_agreed
      t.datetime :terms_agreed_on
      t.string :primary_care_physician
      t.string :employer_name
      t.string :marital_status
      t.string :partner_employer
      t.string :occupation
      t.string :emergency_contact
      t.string :emergency_phone
      t.string :emergency_relationship
      t.string :emergency_address
      t.string :emergency_city
      t.string :emergency_state
      t.string :emergency_zip
      t.boolean :has_children
      t.integer :number_of_children
      t.string :list_unusual_substance_exposure
      t.string :education
      t.boolean :smoker
      t.boolean :was_smoker
      t.string :average_smoking
      t.boolean :non_smoker
      t.boolean :alcoholic
      t.integer :ounces_alcohol_weekly
      t.references :user
      t.text :chart_options
      t.text :favorites
      t.boolean :is_pregnant
      t.date :conception_on
      t.boolean :is_breast_feeding
      t.boolean :is_menopause 
      t.date  :started_menopause
      t.string :blood_type
      t.integer :user_priority , :default => 1
      t.string :member_id
      t.string :super_member_id
      t.integer :cache_current_weight , :default => 0
      t.integer :cache_current_weight_goal , :default => 0
      t.datetime :cache_last_updated , :default => Time.now
      t.text :unit_preferences
      t.string :sponsor_id 
      
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
