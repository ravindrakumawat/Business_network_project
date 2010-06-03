class Picture < ActiveRecord::Base
  belongs_to :album

 has_attached_file :picture,
  :styles => {
    :thumb => "200x175",
    :large => "640x480"
  },
  :url  => "/Album/pictures/:id/:style/:basename.:extension",
  :path => ":rails_root/public/Album/pictures/:id/:style/:basename.:extension"


  def self.destroy_pics(album, pictures)
  Picture.find(pictures, :conditions => {:album_id => album}).each(&:destroy)
end

  def picture_attributes=(picture_attributes)
  picture_attributes.each do |attributes|
    pictures.build(attributes)
  end
end
end
