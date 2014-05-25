class Groupship < ActiveRecord::Base
  belongs_to :group
  belongs_to :society

  validates :society_id, presence: true
  validates :group_id, presence: true
end
