class CreateSleeps < ActiveRecord::Migration
  def self.up
    create_table :sleeps do |t|
      t.references :user
      t.string :slept_in
      t.datetime :started_at
      t.datetime :woke_up_at
      t.integer :quality
      t.boolean :interrupted
      t.string :environment

      t.timestamps
    end
  end

  def self.down
    drop_table :sleeps
  end
end
