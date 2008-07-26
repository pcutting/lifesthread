# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080719024928) do

  create_table "bps", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.datetime "measured_on"
    t.string   "comment"
    t.boolean  "is_goal"
    t.integer  "systolic",    :limit => 11
    t.integer  "diastolic",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cholesterols", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.datetime "measured_on"
    t.string   "comment"
    t.boolean  "is_goal"
    t.integer  "hdl",         :limit => 11
    t.integer  "ldl",         :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", :force => true do |t|
    t.integer  "exercisable_id",   :limit => 11
    t.string   "exercisable_type"
    t.string   "style"
    t.string   "exercise"
    t.integer  "length",           :limit => 11
    t.integer  "reps",             :limit => 11
    t.integer  "resistance",       :limit => 11
    t.string   "unit",                           :default => "lb"
    t.integer  "calories_burned",  :limit => 11
    t.integer  "intensity",        :limit => 11
    t.integer  "comfort_level",    :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fitness_plans", :force => true do |t|
    t.integer  "user_id",                 :limit => 11
    t.string   "label"
    t.integer  "time_length_for_workout", :limit => 10, :precision => 10, :scale => 0
    t.date     "start"
    t.date     "end"
    t.string   "your_why"
    t.boolean  "mon"
    t.boolean  "tue"
    t.boolean  "wed"
    t.boolean  "thur"
    t.boolean  "fri"
    t.boolean  "sat"
    t.boolean  "sun"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.string   "category"
    t.string   "subcategory"
    t.string   "name"
    t.integer  "calories",    :limit => 11
    t.integer  "protein",     :limit => 11
    t.integer  "fiber",       :limit => 11
    t.integer  "carbs",       :limit => 11
    t.integer  "fats",        :limit => 11
    t.string   "meal"
    t.string   "comment"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "illness_histories", :force => true do |t|
    t.integer  "user_id",           :limit => 11
    t.string   "title"
    t.boolean  "has"
    t.boolean  "controlled"
    t.boolean  "at_risk"
    t.boolean  "in_family_history"
    t.boolean  "concerned_about"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", :force => true do |t|
    t.integer  "relationship_id", :limit => 11
    t.string   "event"
    t.string   "description"
    t.integer  "temperature",     :limit => 11
    t.integer  "comfort_zone",    :limit => 11
    t.integer  "satisfaction",    :limit => 11
    t.datetime "occurred_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurements", :force => true do |t|
    t.integer  "user_id",            :limit => 11
    t.integer  "weight",             :limit => 10, :precision => 10, :scale => 0
    t.integer  "resting_metabolism", :limit => 11
    t.integer  "fat_percent",        :limit => 11
    t.integer  "muscle_percent",     :limit => 11
    t.integer  "visceral_fat",       :limit => 11
    t.integer  "water_percent",      :limit => 11
    t.integer  "chest",              :limit => 10, :precision => 10, :scale => 0
    t.integer  "pectoral",           :limit => 10, :precision => 10, :scale => 0
    t.integer  "bicep_left",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "bicep_right",        :limit => 10, :precision => 10, :scale => 0
    t.integer  "belly",              :limit => 10, :precision => 10, :scale => 0
    t.integer  "hip",                :limit => 10, :precision => 10, :scale => 0
    t.integer  "lower_hip",          :limit => 10, :precision => 10, :scale => 0
    t.integer  "thigh_left",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "thigh_right",        :limit => 10, :precision => 10, :scale => 0
    t.datetime "measured_on"
    t.string   "comment"
    t.boolean  "is_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_histories", :force => true do |t|
    t.integer  "user_id",                  :limit => 11
    t.date     "approx_date"
    t.string   "hospital"
    t.string   "problem"
    t.string   "treatment"
    t.string   "doctor"
    t.string   "city"
    t.string   "state"
    t.string   "dr_phone"
    t.boolean  "required_hospitalization"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medications", :force => true do |t|
    t.integer  "user_id",          :limit => 11
    t.string   "name"
    t.integer  "strength",         :limit => 11
    t.string   "unit_type"
    t.date     "prescribed_start"
    t.date     "prescribed_end"
    t.date     "actual_start"
    t.date     "actual_stop"
    t.integer  "dosage",           :limit => 11
    t.string   "dosage_unit"
    t.string   "purpose"
    t.string   "result"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opinions", :force => true do |t|
    t.integer  "question_id", :limit => 11
    t.integer  "user_id",     :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id",            :limit => 11
    t.integer  "authorized_user_id", :limit => 11
    t.string   "role"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.date     "dob"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "cell_phone"
    t.string   "phone"
    t.string   "work_phone"
    t.integer  "height_inch",                     :limit => 11
    t.string   "body_shape"
    t.string   "sex"
    t.string   "race"
    t.string   "rx_affiliate_no",                               :default => "SELF"
    t.string   "sale_code",                                     :default => "SELF"
    t.boolean  "terms_agreed"
    t.datetime "terms_agreed_on"
    t.string   "primary_care_physician"
    t.string   "employer_name"
    t.string   "marital_status"
    t.string   "partner_employer"
    t.string   "occupation"
    t.string   "emergency_contact"
    t.string   "emergency_phone"
    t.string   "emergency_relationship"
    t.string   "emergency_address"
    t.string   "emergency_city"
    t.string   "emergency_state"
    t.string   "emergency_zip"
    t.boolean  "has_children"
    t.integer  "number_of_children",              :limit => 11
    t.string   "list_unusual_substance_exposure"
    t.integer  "education_years",                 :limit => 11
    t.boolean  "smoker"
    t.boolean  "was_smoker"
    t.string   "average_smoking"
    t.boolean  "non_smoker"
    t.boolean  "alcoholic"
    t.integer  "ounces_alcohol_weekly",           :limit => 11
    t.integer  "user_id",                         :limit => 11
    t.text     "chart_options"
    t.text     "favorits"
    t.boolean  "is_pregnant"
    t.date     "conception_on"
    t.boolean  "is_breast_feeding"
    t.boolean  "is_menopause"
    t.string   "blood_type"
    t.integer  "user_priority",                   :limit => 11, :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "survey_id",  :limit => 11
    t.string   "statement"
    t.integer  "points",     :limit => 11
    t.integer  "position",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id",           :limit => 11
    t.string   "relationship_type"
    t.string   "nick_name"
    t.date     "known_since"
    t.date     "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "permit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sleeps", :force => true do |t|
    t.integer  "user_id",          :limit => 11
    t.string   "slept_in"
    t.datetime "started_at"
    t.datetime "woke_up_at"
    t.integer  "quality",          :limit => 11
    t.boolean  "interrupted",                    :default => false
    t.string   "environment"
    t.string   "waken_by"
    t.string   "condition_awoken"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stress_logs", :force => true do |t|
    t.integer  "stress_id",            :limit => 11
    t.datetime "measured_on"
    t.string   "event"
    t.string   "description"
    t.string   "action_taken"
    t.integer  "effect_on_life",       :limit => 11
    t.integer  "perceivable_progress", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stresses", :force => true do |t|
    t.integer  "user_id",                     :limit => 11
    t.string   "category"
    t.string   "title"
    t.date     "first_acknowledged"
    t.integer  "initial_effect_on_life",      :limit => 11
    t.integer  "desired_effect_on_lifestyle", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.string   "what"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_dialogs", :force => true do |t|
    t.integer  "support_id",       :limit => 11
    t.integer  "user_id",          :limit => 11
    t.text     "note"
    t.integer  "rate_helpfulness", :limit => 11
    t.boolean  "is_visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supports", :force => true do |t|
    t.string   "title"
    t.integer  "priority",         :limit => 11
    t.string   "category"
    t.string   "reference_page"
    t.text     "comment"
    t.boolean  "resolved"
    t.datetime "resolved_on"
    t.boolean  "ok_to_contact"
    t.string   "contact_number"
    t.integer  "user_id",          :limit => 11
    t.boolean  "marked_closed"
    t.datetime "marked_closed_on"
    t.boolean  "reopen"
    t.datetime "reopen_on"
    t.boolean  "is_visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "question"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "sir_name"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "admin",                                   :default => false
    t.boolean  "public",                                  :default => false
    t.string   "time_zone",                               :default => "Eastern"
  end

  create_table "workouts", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.string   "title"
    t.date     "day"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "supplements"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
