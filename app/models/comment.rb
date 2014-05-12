class Comment < ActiveRecord::Base

	belongs_to :event

	validates :content, presence: true, length: {maximum: 140}
end
