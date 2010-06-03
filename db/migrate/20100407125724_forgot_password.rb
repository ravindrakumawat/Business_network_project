class ForgotPassword < ActiveRecord::Migration
 def self.up
    add_column :users, :reset_code, :string
    add_column :users, :reset_code_until, :datetime
  end

  def self.down
    remove_column :users, :reset_code
    remove_column :users, :reset_code_until
  end
end

