class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.references :user
      t.string :relationship_type
      t.string :nick_name
      t.date :known_since
      t.date :age

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
