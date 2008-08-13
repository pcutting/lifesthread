class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.references :user
      t.string :has_role
      t.string :sub_roles
      t.string :conditions
      t.boolean :leader

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
