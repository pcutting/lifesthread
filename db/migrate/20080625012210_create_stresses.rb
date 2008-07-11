class CreateStresses < ActiveRecord::Migration
  def self.up
    create_table :stresses do |t|
      t.references :user
      t.string :category
      t.string :title
      t.date :first_acknowledged
      t.integer :initial_effect_on_life
      t.integer :desired_effect_on_lifestyle

      t.timestamps
    end
  end

  def self.down
    drop_table :stresses
  end
end
