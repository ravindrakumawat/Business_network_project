class CreateGroupJoins < ActiveRecord::Migration
  def self.up
    create_table :group_joins do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps
    end
  end

  def self.down
    drop_table :group_joins
  end
end
