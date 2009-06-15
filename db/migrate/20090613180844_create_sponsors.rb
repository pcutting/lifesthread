class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :code
      t.string :name
      t.text :message
      t.string :webpage
      t.string :location
      t.text :template_header
      t.text :template_body
      
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
