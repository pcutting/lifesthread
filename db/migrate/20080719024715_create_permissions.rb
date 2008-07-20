class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.references :user
      t.integer :authorized_user_id
      t.string :role
      t.string :subject

      t.timestamps
    end
  end

  def self.down
    drop_table :permissions
  end
end
