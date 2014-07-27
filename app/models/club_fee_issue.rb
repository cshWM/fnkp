class ClubFeeIssue < ActiveRecord::Base
  belongs_to :club_fee
  belongs_to :club

  validates :club_fee, presence: true
  validates :club, presence: true

  validates_uniqueness_of :club_id, :scope => [:club_fee_id]
end
