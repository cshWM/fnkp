class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  has_many :altered_coaches, :class_name => 'Coach', :foreign_key => :altered_by
#  belongs_to :altered_by_user, :class_name => 'User', :foreign_key => :altered_by_user_id


  has_many :orders
  has_many :line_items
  validates :name, presence: true, length: { maximum: 250 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 250 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :tipo, presence: true, inclusion: { in: 1..3 }, numericality: {only_integer: true}

  has_secure_password
  validates :password,
            length: { in: 6..20 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
