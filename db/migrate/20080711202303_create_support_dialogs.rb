class CreateSupportDialogs < ActiveRecord::Migration
  def self.up
    create_table :support_dialogs do |t|
      t.references :support
      t.references :user
      t.text :note
      t.integer :rate_helpfulness
      t.boolean :is_visible

      t.timestamps
    end
  end

  def self.down
    drop_table :support_dialogs
  end
end
