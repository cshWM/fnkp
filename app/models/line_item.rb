class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :users

  validates :name, length: { maximum: 140 }
  validates :value, numericality: {greater_than: -10000, less_than:100000}
end
