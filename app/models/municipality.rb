class Municipality < ActiveRecord::Base
  belongs_to :district
  has_many :clubs

  validates :name, length: { maximum: 50 }, presence: true,
                  uniqueness: { case_sensitive: false,
                    scope: :active, message: "não podem existir dois concelhos com o mesmo nome activos" }
  validates :active, :inclusion => {:in => [true, false]}

end
