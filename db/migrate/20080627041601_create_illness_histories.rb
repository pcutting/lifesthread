class CreateIllnessHistories < ActiveRecord::Migration
  def self.up
    create_table :illness_histories do |t|
      t.references :user
      t.string :title
      t.boolean :has
      t.boolean :controlled
      t.boolean :at_risk
      t.boolean :in_family_history
      t.boolean :concerned_about
      t.datetime :measured_on
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :illness_histories
  end
end
