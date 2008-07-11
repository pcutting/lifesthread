class CreateCholesterols < ActiveRecord::Migration
  def self.up
    create_table :cholesterols do |t|
      t.references :user
      t.datetime :measured_on
      t.string :comment
      t.boolean :is_goal
      t.integer :hdl
      t.integer :ldl

      t.timestamps
    end
  end

  def self.down
    drop_table :cholesterols
  end
end
