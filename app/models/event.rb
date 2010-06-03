class Event < ActiveRecord::Base
#has_many :events
validates_presence_of :title, :from_datentime, :to_datentime, :country, :state, :venue, :address, :city, :postalcode, :description, :eventtype_id, :industry_id, :attender, :organization, :attending, :repeat
validates_numericality_of :postalcode
end
