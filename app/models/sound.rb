class Sound < ActiveRecord::Base
  has_one :attachable, :as => :resource
  has_attached_file :audio,
              :url  => "/music/files/:id/:style/:basename.:extension",
              :path => ":rails_root/public/music/files/:id/:style/:basename.:extension"
 belongs_to :user

# validates_attachment_content_type :audio, :content_type => ['file/mp3','file/au','file/aif','file/wma','file/wav', 'file/snd']
validates_presence_of :title,:description,:audio_file_name
end
