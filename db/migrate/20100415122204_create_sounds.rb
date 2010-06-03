class CreateSounds < ActiveRecord::Migration
  def self.up
    create_table :sounds do |t|
      t.string :title
      t.text :description
      t.string :audio_file_name
      t.string :audio_content_type
      t.integer :audio_file_size
      t.datetime :audio_updated_at
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sounds
  end
end
