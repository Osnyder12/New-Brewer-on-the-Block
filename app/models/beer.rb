class Beer < ApplicationRecord
  validates :name, :abv, :ph, :beer_volume_value, :beer_volume_unit, :boil_volume_value, :boil_volume_unit, presence: true

  has_many :mashes
  has_many :amounts
  has_many :ingredients, through: :amounts
end