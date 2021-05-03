class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :amounts
  has_many :beers, through: :amounts
end