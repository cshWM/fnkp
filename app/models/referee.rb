class Referee < ActiveRecord::Base
  has_many :referee_paths
  has_many :referee_categories, through: :referee_paths
  belongs_to :municipality

  belongs_to :altered_by_user, :class_name => 'User', :foreign_key => :altered_by


  validates :fnkp_code, length: { maximum: 140}, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :official_name, length: { maximum: 300, minimum: 10}, presence: true
  validates :import_code, length: { maximum: 140}
  validates :cc_code, length: { maximum: 20, minimum: 6}, uniqueness: { case_sensitive: false }
  validates :birthdate,
              :timeliness => {
                :before => lambda { 18.years.ago },
                :before_message => "tem de ter pelo menos 18 anos",
                :type => :date
              }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
            length: { maximum: 250 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  validates :mobile, length: { maximum: 50 }
  validates :other_contact1, length: { maximum: 50 }
  validates :other_contact2, length: { maximum: 50 }

  validates :address, length: { maximum: 500 }
  validates :postal_code4, numericality: true, length: { maximum: 4 }, :allow_blank => true
  validates :postal_code3, numericality: true, length: { maximum: 3 }, :allow_blank => true

  validates :active, :inclusion => {:in => [true, false]}

  validates :notes, length: { maximum: 500 }

end
