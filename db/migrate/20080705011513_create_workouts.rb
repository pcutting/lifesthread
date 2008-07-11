class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.references :user
      t.string :title
      t.date :day
      t.time :start_time
      t.time :end_time
      t.string :supplements
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
