class PunkBeer < ApplicationRecord
  
  has_many :punk_mashes
  has_many :punk_malt_ingredients
  has_many :punk_hop_ingredients
  has_many :punk_yeast_ingredients
end