class PunkBeer < ApplicationRecord
  
  has_many :punk_yeast_ingredients
  has_many :punk_ingredients
  has_many :punk_reviews
end