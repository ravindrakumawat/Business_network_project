class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  validates_presence_of :name


def picture_attributes=(picture_attributes)
  picture_attributes.each do |attributes|
    pictures.build(attributes)
  end
end
end
