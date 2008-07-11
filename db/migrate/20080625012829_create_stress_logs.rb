class CreateStressLogs < ActiveRecord::Migration
  def self.up
    create_table :stress_logs do |t|
      t.references :stress
      t.datetime :measured_on
      t.string :event
      t.string :description
      t.string :action_taken
      t.integer :effect_on_life
      t.integer :perceivable_progress

      t.timestamps
    end
  end

  def self.down
    drop_table :stress_logs
  end
end
