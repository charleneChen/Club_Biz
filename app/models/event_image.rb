class EventImage < ActiveRecord::Base
	belongs_to :event

	has_attached_file :photo
	validates_attachment_presence :photo
	
end
