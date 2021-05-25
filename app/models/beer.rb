class Beer < ApplicationRecord
  validates :name, :abv, :ph, :ibu, :beer_volume_value, :beer_volume_unit, :boil_volume_value, :boil_volume_unit, presence: true
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: proc { |att| att['ingredient_type'].blank? }
end