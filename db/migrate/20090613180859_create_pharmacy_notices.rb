class CreatePharmacyNotices < ActiveRecord::Migration
  def self.up
    create_table :pharmacy_notices do |t|
      t.references :sponsor
      t.datetime :start_display
      t.datetime :stop_display
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :pharmacy_notices
  end
end
