class Event < ActiveRecord::Base

	has_many :comments, :dependent => :destroy
	has_many :event_images, :dependent => :destroy
	belongs_to :society

	accepts_nested_attributes_for :event_images, 
		:reject_if => lambda { |t| t['event_image'].nil? }

	validates :title, :event_type, :content, presence: true
	validates :ticket_price, :ticket_number, numericality: {greater_than_or_equal_to: 0}
	validates :title, uniqueness: true
	validates :content, length: {maximum: 200}
	validates :title, length: {maximum: 50}
	validates :event_type, length: {maximum: 10}
end
