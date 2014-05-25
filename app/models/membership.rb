class Membership < ActiveRecord::Base
  belongs_to :student
  belongs_to :society

  validates :society_id, presence: true
  validates :student_id, presence: true
end
