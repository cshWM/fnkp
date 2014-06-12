class AssociationFee < ActiveRecord::Base
  has_many :associations, :through => :association_fee_issues
end
