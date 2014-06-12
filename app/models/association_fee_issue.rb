class AssociationFeeIssue < ActiveRecord::Base
  belongs_to :associationfee
  belongs_to :association
end
