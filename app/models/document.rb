class Document < ActiveRecord::Base
belongs_to :user

  has_attached_file :file,  
  :default_url => "/document/:attachment/missing.jpeg",
  :url => "/document/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/document/:attachment/:id/:style/:basename.:extension"

#validates_attachment_content_type :file, :content_type => ['file/','file/txt','file/doc', 'file/docx']

end
