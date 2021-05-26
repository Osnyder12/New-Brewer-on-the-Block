class BeerShowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :description, :abv, :image_url, :ibu, :ph, :beer_volume_value, :beer_volume_unit, :boil_volume_value, :boil_volume_unit, :mash_temp_value, :mash_temp_unit, :mash_temp_duration, :fermentation_value, :fermentation_unit

  has_many :reviews
end