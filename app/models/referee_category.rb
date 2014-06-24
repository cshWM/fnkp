class RefereeCategory < ActiveRecord::Base
  validates :name, length: { maximum: 50 }, presence: true,
                  uniqueness: { case_sensitive: false,
                    scope: :active, message: "não podem existir duas categorias com o mesmo nome activas" }
  validates :order, numericality: { only_integer: true }, presence: true
  validates :active, :inclusion => {:in => [true, false]}
end
