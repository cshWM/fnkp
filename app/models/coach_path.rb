class CoachPath < ActiveRecord::Base
  belongs_to :coach_category
  belongs_to :coach
end
