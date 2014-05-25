class Group < ActiveRecord::Base

  belongs_to :event

  has_many :groupships
  has_many :societies, through: :groupships

  #has_and_belongs_to_many :societies

  validates :name, presence: true
end
