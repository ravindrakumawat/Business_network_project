class ChatRoom < ActiveRecord::Migration
  def self.up
    create_table :group_chats do |t|
      t.text :chat_field
      t.string :user_name
      t.timestamps :date
  end
  end

  def self.down
      drop_table :group_chats
    end
end
