class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
t.column :user_id, :integer, :null => false
t.column :interest, :text
t.column :address, :text
t.column :groups_and_association, :text
t.column :skillz, :text
t.column :schools, :text
t.column :honors_and_awards, :text 
t.column :activities, :text
t.column :additional_notes, :text

      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
