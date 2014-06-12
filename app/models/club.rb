class Club < ActiveRecord::Base
  belongs_to :association
  validates :name, length: { maximum: 140 }
  validates :short_name, length: { maximum: 10 }

end
