class AssociationFee < ActiveRecord::Base
  has_many :associations, through: :association_fee_issues

  validates :name, length: { maximum: 140 }
  validates :valid_year, numericality: {only_integer: true, greater_than: 2013},
                        length: { maximum: 4 },
                        allow_blank: false, allow_nil: false,
                        presence: true
  validates :is_total, inclusion: { in: [true, false] }
  validates :value, numericality: {greater_than: 0, less_than:10000},
                    allow_blank: false, allow_nil: false
  validates :active, inclusion: { in: [true, false] }

end
