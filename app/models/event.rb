class Event < ActiveRecord::Base

	has_many :comments
	belongs_to :society

	validates :title, :type, :content, :image_url, presence: true
	validates :ticket_price, :ticket_number, numericality: {greater_than_or_equal_to: 0}
	validates :title, uniqueness: true
	validates :content, length: {maximum: 200}
	validates :title, length: {maximum: 50}
	validates :type, length: {maximum: 10}
end
