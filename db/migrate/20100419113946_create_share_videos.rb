class CreateShareVideos < ActiveRecord::Migration
  def self.up
    create_table :share_videos do |t|
      t.string :title
      t.string :video_url

      t.timestamps
    end
  end

  def self.down
    drop_table :share_videos
  end
end
