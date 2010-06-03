class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name
      t.text :description
      t.integer :shared, :default => 1
      t.references :user
      t.timestamps
    end
     add_index :albums, :user_id
  end

  def self.down
    drop_table :albums
  end
end
