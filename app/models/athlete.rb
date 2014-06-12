class Athlete < ActiveRecord::Base
  belongs_to :club
  validates :name, length: { maximum: 250 }
  validates :short_name, length: { maximum: 25 }
  validates :sex, length: { maximum: 9 }

  # validates :birthdate
  # CC
end
