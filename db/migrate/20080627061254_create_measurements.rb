class CreateMeasurements < ActiveRecord::Migration
  def self.up
    create_table :measurements do |t|
      t.references :user
      t.decimal :weight
      t.integer :resting_metabolism
      t.integer :fat_percent
      t.integer :muscle_percent
      t.integer :visceral_fat
      t.integer :water_percent
      t.decimal :chest
      t.decimal :neck
      t.decimal :bicep
      t.decimal :belly
      t.decimal :hip
      t.decimal :calf
      t.decimal :thigh
      t.datetime :measured_on
      t.string :comment
      t.boolean :is_goal, :default => false 

      t.timestamps
    end
  end

  def self.down
    drop_table :measurements
  end
end
