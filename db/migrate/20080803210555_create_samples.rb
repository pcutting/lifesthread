class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.integer :count
      t.timestamps
    end
  end

  def self.down
    drop_table :samples
  end
end
