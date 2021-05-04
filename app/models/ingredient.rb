class Ingredient < ApplicationRecord
  validates :name, presence: true

  has_many :recipes
  has_many :beers, through: :recipes
end