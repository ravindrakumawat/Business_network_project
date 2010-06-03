class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :group_name
      t.integer :group_type_id
      t.text :summery
      t.text :description
      t.string :website
      t.integer :user_id
      t.string :access
      t.integer :language_id
      t.boolean :location
      t.boolean :agreement
      
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
