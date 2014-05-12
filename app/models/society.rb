class Society < ActiveRecord::Base
	
	has_many :events

	validates :club_name, :username, :password, :admin_name, 
		:admin_phone, :admin_email, :description, presence: true
	validates :club_name, length: {maximum: 20}
	validates :username, :password, length: {minimum: 5}
end
