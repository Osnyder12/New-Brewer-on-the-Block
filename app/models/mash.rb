class Mash < ApplicationRecord
  validates :mash_temp_value, :mash_temp_unit, :mash_temp_duration, :fermentation_value, :fermentation_unit, presence: true

  belongs_to :beer
end