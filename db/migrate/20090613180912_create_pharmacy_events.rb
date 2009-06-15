class CreatePharmacyEvents < ActiveRecord::Migration
  def self.up
    create_table :pharmacy_events do |t|
      t.references :sponsor
      t.datetime :start_display
      t.datetime :stop_display
      t.datetime :event_date
      t.string :title
      t.string :location
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :pharmacy_events
  end
end
