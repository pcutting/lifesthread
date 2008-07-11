class CreateMedications < ActiveRecord::Migration
  def self.up
    create_table :medications do |t|
      t.references :user
      t.string :name
      t.integer :strength
      t.string :unit_type
      t.date :prescribed_start
      t.date :prescribed_end
      t.date :actual_start
      t.date :actual_stop
      t.integer :dosage
      t.string :dosage_unit
      t.string :purpose
      t.string :result
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :medications
  end
end
