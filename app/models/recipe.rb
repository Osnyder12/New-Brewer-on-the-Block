class Recipe < ApplicationRecord
  belongs_to :beer
  belongs_to :ingredient
end