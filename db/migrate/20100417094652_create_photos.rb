class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
     t.column :user_id, :integer, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
