class EventImage < ActiveRecord::Base
	belongs_to :event
  before_validation { photo.clear if _destroy == '1'and !image.dirty? }

	has_attached_file :photo,
		:url  => "/assets/photos/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension",
    :styles => { :medium => "900x300>", :thumb => "300x200>" }

  validates_attachment :photo,
                       content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                       :presence => true
	
end
