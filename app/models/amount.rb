class Amount < ApplicationRecord
  validates :value, :unit, presence: true

  belongs_to :beer
  belongs_to :ingredient
end