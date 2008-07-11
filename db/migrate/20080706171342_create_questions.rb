class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :survey
      t.string :statement
      t.integer :points
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
