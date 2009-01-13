class AddChartableToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :bp, :boolean, :default => true
    add_column :profiles, :bp_avg, :boolean, :default => true
    add_column :profiles, :bp_goal, :boolean, :default => true
    add_column :profiles, :measure, :boolean, :default => true
    add_column :profiles, :measure_avg, :boolean, :default => true
    add_column :profiles, :measure_goal, :boolean, :default => true
    add_column :profiles, :sleep, :boolean, :default => true
    add_column :profiles, :sleep_avg, :boolean, :default => true
    add_column :profiles, :sleep_goal, :boolean, :default => true
    add_column :profiles, :stress, :boolean, :default => true
    add_column :profiles, :stress_avg, :boolean, :default => true
    add_column :profiles, :stress_goal, :boolean, :default => true
    add_column :profiles, :food, :boolean, :default => true
    add_column :profiles, :food_avg, :boolean, :default => true
    add_column :profiles, :food_goal, :boolean, :default => true
    add_column :profiles, :weight, :boolean, :default => true
    add_column :profiles, :weight_avg, :boolean, :default => true
    add_column :profiles, :weight_goal, :boolean, :default => true
    add_column :profiles, :metabolism, :boolean, :default => true
    add_column :profiles, :metabolism_avg, :boolean, :default => true
    add_column :profiles, :metabolism_goal, :boolean, :default => true
    add_column :profiles, :fat, :boolean, :default => true
    add_column :profiles, :fat_avg, :boolean, :default => true
    add_column :profiles, :fat_goal, :boolean, :default => true
    add_column :profiles, :muscle, :boolean, :default => true
    add_column :profiles, :muscle_avg, :boolean, :default => true
    add_column :profiles, :muscle_goal, :boolean, :default => true
    add_column :profiles, :visceral, :boolean, :default => true
    add_column :profiles, :visceral_avg, :boolean, :default => true
    add_column :profiles, :visceral_goal, :boolean, :default => true
    add_column :profiles, :water, :boolean, :default => true
    add_column :profiles, :water_avg, :boolean, :default => true
    add_column :profiles, :water_goal, :boolean, :default => true
    add_column :profiles, :chest, :boolean, :default => true
    add_column :profiles, :chest_avg, :boolean, :default => true
    add_column :profiles, :chest_goal, :boolean, :default => true
    add_column :profiles, :bicep, :boolean, :default => true
    add_column :profiles, :bicep_avg, :boolean, :default => true
    add_column :profiles, :bicep_goal, :boolean, :default => true
    add_column :profiles, :belly, :boolean, :default => true
    add_column :profiles, :belly_avg, :boolean, :default => true
    add_column :profiles, :belly_goal, :boolean, :default => true
    add_column :profiles, :hip, :boolean, :default => true
    add_column :profiles, :hip_avg, :boolean, :default => true
    add_column :profiles, :hip_goal, :boolean, :default => true
    add_column :profiles, :thigh, :boolean, :default => true
    add_column :profiles, :thigh_avg, :boolean, :default => true
    add_column :profiles, :thigh_goal, :boolean, :default => true
  end

  def self.down
    remove_column :profiles, :thigh_goal
    remove_column :profiles, :thigh_avg
    remove_column :profiles, :thigh
    remove_column :profiles, :hip_goal
    remove_column :profiles, :hip_avg
    remove_column :profiles, :hip
    remove_column :profiles, :belly_goal
    remove_column :profiles, :belly_avg
    remove_column :profiles, :belly
    remove_column :profiles, :bicep_goal
    remove_column :profiles, :bicep_avg
    remove_column :profiles, :bicep
    remove_column :profiles, :chest_goal
    remove_column :profiles, :chest_avg
    remove_column :profiles, :chest
    remove_column :profiles, :water_goal
    remove_column :profiles, :water_avg
    remove_column :profiles, :water
    remove_column :profiles, :visceral_goal
    remove_column :profiles, :visceral_avg
    remove_column :profiles, :visceral
    remove_column :profiles, :muscle_goal
    remove_column :profiles, :muscle_avg
    remove_column :profiles, :muscle
    remove_column :profiles, :fat_goal
    remove_column :profiles, :fat_avg
    remove_column :profiles, :fat
    remove_column :profiles, :metabolism_goal
    remove_column :profiles, :metabolism_avg
    remove_column :profiles, :metabolism
    remove_column :profiles, :weight_goal
    remove_column :profiles, :weight_avg
    remove_column :profiles, :weight
    remove_column :profiles, :food_goal
    remove_column :profiles, :food_avg
    remove_column :profiles, :food
    remove_column :profiles, :stress_goal
    remove_column :profiles, :stress_avg
    remove_column :profiles, :stress
    remove_column :profiles, :sleep_goal
    remove_column :profiles, :sleep_avg
    remove_column :profiles, :sleep
    remove_column :profiles, :measure_goal
    remove_column :profiles, :measure_avg
    remove_column :profiles, :measure
    remove_column :profiles, :bp_goal
    remove_column :profiles, :bp_avg
    remove_column :profiles, :bp
  end
end
