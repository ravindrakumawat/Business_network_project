class AddFunctions < ActiveRecord::Migration
  def self.up
    ["Accounting",
     "Administrative",
     "Advertising",
     "Business Development",
     "Consulting"].each do |c|
      Function.create(:name => c)
      end
  end

  def self.down
    Function.destroy_all
  end
end
