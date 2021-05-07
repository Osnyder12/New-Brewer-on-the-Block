class PunkBeer < ApplicationRecord
  
  belongs_to :user
  has_many :reviews
  has_many :punk_mashes
  has_many :punk_malt_ingredients
  has_many :punk_hop_ingredients
end