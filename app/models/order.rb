class Order < ActiveRecord::Base
  has_many :line_items
  belongs_to :users

  validates :name, presence: true, length: { maximum: 140 }
  validates :total_value, numericality: {greater_than: -10000, less_than:100000}
  validates :state, presence: true, length: { maximum: 40 }
#  validates :state_date, presence: true


end
