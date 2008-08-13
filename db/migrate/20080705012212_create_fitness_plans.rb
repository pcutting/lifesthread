class CreateFitnessPlans < ActiveRecord::Migration
  def self.up
    create_table :fitness_plans do |t|
      t.references :user
      t.string :label
      t.decimal :time_length_for_workout
      t.date :start
      t.date :end
      t.string :your_why
      t.boolean :mon
      t.boolean :tue
      t.boolean :wed
      t.boolean :thur
      t.boolean :fri
      t.boolean :sat
      t.boolean :sun
      t.boolean :public
      t.boolean :approved
      t.string :documented_at

      t.timestamps
    end
  end

  def self.down
    drop_table :fitness_plans
  end
end
