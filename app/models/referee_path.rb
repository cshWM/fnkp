class RefereePath < ActiveRecord::Base
  belongs_to :referee_category
  belongs_to :referee

  default_scope -> { order('date_acomplished DESC') }

  validates_date :date_acomplished, :allow_blank => true
  validates :referee, presence: true
  validates :referee_category, presence: true

  validates_uniqueness_of :referee, :scope => [:referee_category]
end
