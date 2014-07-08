class AssociationFeeIssue < ActiveRecord::Base
  belongs_to :association_fee
  belongs_to :association

#  validates :valid_year, numericality: {only_integer: true, greater_than: 2013},
#                        length: { maximum: 4 },
#                        allow_blank: false, allow_nil: false,
#                       presence: true
#  validates :value, numericality: {greater_than: 0, less_than:10000},
#                    allow_blank: false, allow_nil: false

  validates_uniqueness_of :association, :scope => [:association_fee]

end
