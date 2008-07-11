class CreateMedicalHistories < ActiveRecord::Migration
  def self.up
    create_table :medical_histories do |t|
      t.references :user
      t.date :approx_date
      t.string :hospital
      t.string :problem
      t.string :treatment
      t.string :doctor
      t.string :city
      t.string :state
      t.string :dr_phone
      t.boolean :required_hospitalization

      t.timestamps
    end
  end

  def self.down
    drop_table :medical_histories
  end
end
