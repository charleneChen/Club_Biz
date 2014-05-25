class Student < ActiveRecord::Base

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_many :followings
  has_many :events, through: :followings

  has_many :memberships
  has_many :societies, through: :memberships

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 50 }
  has_secure_password
  validates :password, length: { minimum: 6 }
	#validates :password, presence: true, on: :create

  def Student.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Student.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  #def following?(society)
  #  memberships.find_by(society_id: society.id)
  #end
  #
  #def follow!(society)
  #  memberships.create!(society_id: society.id)
  #end

  private

  def create_remember_token
    self.remember_token = Student.hash(Student.new_remember_token)
  end

end
