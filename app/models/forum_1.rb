class Forum < ActiveRecord::Base
 has_many :topics
  has_many :replies, :through => :topics

end
