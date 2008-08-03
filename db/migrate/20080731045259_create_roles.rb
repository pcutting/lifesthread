class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.references :user
      t.string :permission
      t.string :template
      t.string :conditions
      t.boolean :admin_approved
      t.string :request_comment

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
