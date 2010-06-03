class CreateOnlineTable < ActiveRecord::Migration
  def self.up
     create_table :onlines do |t|
      t.integer :name

      t.timestamps
  end
  end
  def self.down
  drop_table :onlines
  end
end
