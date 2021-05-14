class Beer < ApplicationRecord
  validates :name, :abv, :ph, :ibu, :beer_volume_value, :beer_volume_unit, :boil_volume_value, :boil_volume_unit, presence: true
  belongs_to :user
  has_many :reviews
  has_many :ingredients
end