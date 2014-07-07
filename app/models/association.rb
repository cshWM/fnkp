class Association < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save { self.short_name = short_name.upcase }

  has_many :clubs
  has_many :association_fees, through: :association_fee_issues

  has_one :user
  validates :name, length: { maximum: 140 },
            uniqueness: { case_sensitive: false }
  validates :short_name, length: { maximum: 10 },
            uniqueness: { case_sensitive: false }
  validates :address, length: { maximum: 500 }
  validates :postal4, numericality: true, length: { maximum: 4 }, :allow_blank => true
  validates :postal3, numericality: true, length: { maximum: 3 }, :allow_blank => true
  validates :phone, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 250 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :president, length: { maximum: 140 }
  validates :url, length: { maximum: 500 }, :url => {:allow_nil => true, :allow_blank => true, :message => "O endereço não é válido"}





end
