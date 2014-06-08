class Association < ActiveRecord::Base
  has_many :clubs
  validates :name, length: { maximum: 140 }
  validates :short_name, length: { maximum: 10 }
  validates :address, length: { maximum: 500 }
  validates :postal4, length: { maximum: 4 }
  validates :postal3, length: { maximum: 3 }
  validates :phone, length: { maximum: 50 }
  validates :email, length: { maximum: 250 }
  validates :president, length: { maximum: 140 }
  validates :url, length: { maximum: 500 }

end
