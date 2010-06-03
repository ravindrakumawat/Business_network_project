class AddLanguages < ActiveRecord::Migration
   def self.up
    ["English",
     "Hindi",
      "French",
      "Spanish",
      "German",
      "Portuguese",
      "Dutch",
      "Greek",
      "Japanese"].each do |c|
      Language.create(:name => c)
      end
  end

  def self.down
    Language.destroy_all
  end
end
