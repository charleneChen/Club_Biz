class Society < ActiveRecord::Base

  #The simplest rule of thumb is that you should set up a has_many :through relationship if you need to work with the relationship model as an independent entity.
  # If you don't need to do anything with the relationship model, it may be simpler to set up a has_and_belongs_to_many relationship
  # (though you'll need to remember to create the joining table in the database).
  has_many :groupships
  has_many :groups, through: :groupships

  has_many :followings
  has_many :students, through: :followings

  has_many :memberships
  has_many :students, through: :memberships

  #has_and_belongs_to_many :groups

	has_many :events, :dependent => :destroy

	validates :club_name, :username, :password, :admin_name, 
		:admin_phone, :admin_email, :description, presence: true
	validates :club_name, length: {maximum: 20}
	validates :username, :password, length: {minimum: 5}

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['club_name LIKE ? OR description LIKE ?', search_condition, search_condition])
  end
end
