class Coach < ActiveRecord::Base
  has_many :coach_paths
  has_many :coach_categories, through: :coach_paths
end
