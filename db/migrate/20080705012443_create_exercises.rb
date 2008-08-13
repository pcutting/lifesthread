class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.integer :exercisable_id
      t.string :exercisable_type
      t.string :style
      t.string :exercise
      t.integer :length
      t.integer :reps
      t.integer :resistance
      t.string :unit , :default => "lb"
      t.integer :calories_burned
      t.integer :intensity
      t.integer :comfort_level
      t.boolean :listable
      t.string :documentation_at
      t.integer :author_id
      t.integer :approved_by

      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end
end
