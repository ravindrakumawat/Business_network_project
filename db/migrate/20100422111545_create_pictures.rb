class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.references :album
      t.timestamps

    end
    add_index :pictures, :album_id

  end

  def self.down
    drop_table :pictures
  end
end
