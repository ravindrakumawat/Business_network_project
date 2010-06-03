class AddIndustries < ActiveRecord::Migration
  def self.up
    ["Accounting",
     "Airlines/Aviation",
     "Animation",
     "Information Technology",
     "Software Technology"].each do |c|
      Industry.create(:industry_name => c)
      end
  end

  def self.down
    Industry.destroy_all
  end
end
