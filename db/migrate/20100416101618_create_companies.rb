class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
t.column :user_id, :integer, :null => false
t.column :company_name, :string, :default => ""
t.column :title, :string, :default => ""
t.column :time_from, :date
t.column :time_to, :date
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
