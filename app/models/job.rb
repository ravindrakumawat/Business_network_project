class Job < ActiveRecord::Base
 belongs_to :function
 belongs_to :industry
 belongs_to :user

validates_presence_of :title,:pincode,:industry_ids,:function_ids,:experience
          
#validates_format_of :website, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
