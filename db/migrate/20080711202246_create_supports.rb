class CreateSupports < ActiveRecord::Migration
  def self.up
    create_table :supports do |t|
      t.string :title
      t.integer :priority
      t.string :category
      t.string :reference_page
      t.text :comment
      t.boolean :resolved
      t.datetime :resolved_on
      t.boolean :ok_to_contact
      t.string :contact_number
      t.references :user
      t.boolean :marked_closed
      t.datetime :marked_closed_on
      t.boolean :reopen
      t.datetime :reopen_on
      t.boolean :is_visible

      t.timestamps
    end
  end

  def self.down
    drop_table :supports
  end
end
