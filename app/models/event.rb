class Event < ActiveRecord::Base

	belongs_to :society

	has_many :event_images, :dependent => :destroy
	has_many :comments, :dependent => :destroy

	accepts_nested_attributes_for :event_images, :reject_if => lambda { |a| a[:photo].blank? }, allow_destroy: true

	validates :title, :event_type, :content, :venue, :ticket_price, :ticket_number, presence: true
	validates :ticket_price, :ticket_number, numericality: {greater_than_or_equal_to: 0}
	validates :title, uniqueness: true
	validates :content, length: {maximum: 200}
	validates :title, length: {maximum: 50}
	validates :event_type, length: {maximum: 10}
end
