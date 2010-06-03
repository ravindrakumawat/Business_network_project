class Video < ActiveRecord::Base
	belongs_to :thumbnail
	belongs_to :user
	has_many :replies, :class_name => 'VideoReply'
  
 # before_create :save_thumbnail

  has_attached_file :video,:max_size => 300.megabytes,
    :processors => lambda{
    |a| a.video? ? [ :video_thumbnail ] : [ :thumbnail ]
    },
    :url  => "/videos/files/:id/:style/:basename.:extension",
    :path => ":rails_root/public/videos/files/:id/:style/:basename.:extension"

 validates_presence_of :title,:description,:video_file_name
    
# This method is called from the controller and takes care of the converting
 acts_as_state_machine :initial => :pending
  state :pending
  state :converting
  state :converted, :enter => :set_new_filename
  state :error

  event :convert do
    transitions :from => :pending, :to => :converting
  end

  event :converted do
    transitions :from => :converting, :to => :converted
  end

  event :failed do
    transitions :from => :converting, :to => :error
  end
 def rename_file
		true
	end
def convert
    self.convert!
	spawn do
	    success = system(convert_command)
	    logger.debug 'Converting File: ' + success.to_s
	    if success && $?.exitstatus == 0
	      self.converted!
	    else
	      self.failure!
	    end
		end
  end

  def flash_url
    "#{video.url}.flv"
  end
  
  def save_thumbnail
	    logger.info "Saving thumbnail of Video..."
	    t = Thumbnail.create!(self.temp_path)
	    self.thumbnail = t
	    t
  end

  protected

  def convert_command

		#construct new file extension
    flv =  "." + id.to_s + ".flv"

		#build the command to execute ffmpeg
    command = <<-end_command
     ffmpeg -i #{ RAILS_ROOT + '/public' + public_filename } -ar 22050 -s 720x480 -f flv -y #{ RAILS_ROOT + '/public' + public_filename + flv }

    end_command

    logger.debug "Converting video...command: " + command
    command
  end

  # This updates the stored filename with the new flash video file
  def set_new_filename
    update_attribute(:filename, "#{filename}.#{id}.flv")
    update_attribute(:content_type, "application/x-flash-video")
  end
end

