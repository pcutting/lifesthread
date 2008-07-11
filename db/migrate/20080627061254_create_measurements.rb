class CreateMeasurements < ActiveRecord::Migration
  def self.up
    create_table :measurements do |t|
      t.references :user
      t.integer :weight
      t.integer :resting_metabolism
      t.integer :fat_percent
      t.integer :muscle_percent
      t.integer :visceral_fat
      t.integer :water_percent
      t.decimal :chest
      t.decimal :pectoral
      t.decimal :bicep_left
      t.decimal :bicep_right
      t.decimal :belly
      t.decimal :hip
      t.decimal :lower_hip
      t.decimal :thigh_left
      t.decimal :thigh_right
      t.datetime :measured_on
      t.string :comment
      t.boolean :is_goal

      t.timestamps
    end
  end

  def self.down
    drop_table :measurements
  end
end
