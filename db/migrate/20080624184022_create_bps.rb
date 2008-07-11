class CreateBps < ActiveRecord::Migration
  def self.up
    create_table :bps do |t|
      t.references :user
      t.datetime :measured_on
      t.string :comment
      t.boolean :is_goal
      t.integer :systolic
      t.integer :diastolic

      t.timestamps
    end
  end

  def self.down
    drop_table :bps
  end
end
