class CoachPath < ActiveRecord::Base
  belongs_to :coach_category
  belongs_to :coach

  default_scope -> { order('date_acomplished DESC') }

  validates_date :date_acomplished, :allow_blank => true
  validates :coach, presence: true
  validates :coach_category, presence: true

  validates_uniqueness_of :coach, :scope => [:coach_category]
end
