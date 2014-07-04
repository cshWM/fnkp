class Club < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save { self.short_name = short_name.upcase }

  belongs_to :association
  belongs_to :municipality
  has_one :user


  default_scope -> { order('short_name DESC') }

  validates :name, length: { maximum: 140 }, presence: true, uniqueness: { case_sensitive: false }
  validates :short_name, length: { maximum: 10 }, presence: true, uniqueness: { case_sensitive: false }

  validates :municipality_id, presence: true

  validates :address, length: { maximum: 500 }
  validates :postal4, numericality: true, length: { maximum: 4 }, :allow_blank => true
  validates :postal3, numericality: true, length: { maximum: 3 }, :allow_blank => true
  validates :city, length: { maximum: 100 }

  validates :phone, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, :allow_blank => true,
            length: { maximum: 250 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :president, length: { maximum: 140 }

  validates :url, length: { maximum: 500 }, :url => {:allow_nil => true, :allow_blank => true, :message => "O endereço não é válido"}

#  validates :user_id
  validates :association_id, presence: true

  validates :active, :inclusion => {:in => [true, false]}

end
