require 'faraday'

punk_url = "https://api.punkapi.com/v2/beers"
punk_response = Faraday.get(punk_url)
parsed_response = JSON.parse(punk_response.body)

user1 = User.new(email: "qbeer-reviewer@aol.com", password: "password", password_confirmation: "password")
user1.save

admin1 = User.new(email: "qbeerAdmin@gmail.com", password: "password", password_confirmation: "password", role: "admin")
admin1.save

parsed_response.each do |beer|
  Beer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], user: user1)
end

parsed_response.each do |object|
    mash_beer = Beer.find_by(name: object["name"])
      Mash.create(mash_temp_value: object["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: object["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: object["method"]["mash_temp"][0]["duration"], fermentation_value: object["method"]["fermentation"]["temp"]["value"], fermentation_unit: object["method"]["fermentation"]["temp"]["unit"], beer: mash_beer)
end


parsed_response.each do |object|
  ingredient_beer = Beer.find_by(name: object["name"])
  MaltIngredient.create(ingredient_type: "malt", malt_ingredients: object["ingredients"]["malt"], beer: ingredient_beer)
  HopIngredient.create(ingredient_type: "hop", hop_ingredients: object["ingredients"]["hops"], beer: ingredient_beer)
  YeastIngredient.create(ingredient_type: "yeast", name: object["ingredients"]["yeast"], beer: ingredient_beer)
end