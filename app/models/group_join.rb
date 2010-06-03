class GroupJoin < ActiveRecord::Base
belongs_to :user
belongs_to :group, :class_name => "User", :foreign_key => "group_id"
validates_presence_of :user_id, :group_id

def self.exists?(user, group)
not find_by_user_id_and_group_id(user, group).nil?
end

end
