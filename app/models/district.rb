class District < ActiveRecord::Base
  belongs_to :region
  has_many :municipalities

  validates :name, length: { maximum: 50 }, presence: true,
                  uniqueness: { case_sensitive: false,
                    scope: :active, message: "não podem existir duas regiões com o mesmo nome activas" }
  validates :active, :inclusion => {:in => [true, false]}

end
