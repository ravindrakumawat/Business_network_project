class Group < ActiveRecord::Base
  belongs_to :group_type
  has_many :group_join
  belongs_to :user
  has_attached_file :logo,
    :default_url => "/system/:attachment/missing.jpeg",
  :styles =>
  {
    :thumb => "150x150",
  },
     :url  => "/system/logos//:id/:style/:basename.:extension",
    :path => ":rails_root/public/system/logos/:id/:style/:basename.:extension"

validates_presence_of :group_name, :description,:group_type_id,
           :location, :agreement
#validates_format_of :website, :with => /www\.\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


end
