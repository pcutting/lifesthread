class CreateFoods < ActiveRecord::Migration
  def self.up
    create_table :foods do |t|
      t.references :user
      t.string :category
      t.string :subcategory
      t.string :name
      t.integer :calories
      t.integer :protein
      t.integer :fiber
      t.integer :carbs
      t.integer :fats
      t.string :meal
      t.string :comment
      t.datetime :date

      t.timestamps
    end
  end

  def self.down
    drop_table :foods
  end
end
