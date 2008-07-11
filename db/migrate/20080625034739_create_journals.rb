class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.references :relationship
      t.string :event
      t.string :description
      t.integer :temperature
      t.integer :comfort_zone
      t.integer :satisfaction
      t.datetime :occurred_on

      t.timestamps
    end
  end

  def self.down
    drop_table :journals
  end
end
