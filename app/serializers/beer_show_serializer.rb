class BeerShowSerializer < ActiveModel::serializer
  attributes :id, :name, :description, :abv, :image_url, :ibu, :ph, :beer_volume_value, :beer_volume_unit, :boil_volume_value, :boil_volume_unit
end