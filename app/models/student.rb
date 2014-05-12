class Student < ActiveRecord::Base
	validates :name, :email, :password, presence: true
end
