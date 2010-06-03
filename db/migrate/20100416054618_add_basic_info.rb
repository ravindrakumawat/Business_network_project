class AddBasicInfo < ActiveRecord::Migration
  def self.up
     add_column :specs, :headline, :string
     add_column :specs, :industry, :integer
  end

  def self.down
    remove_column :specs, :headline
    remove_column :specs, :industry
  end
end
