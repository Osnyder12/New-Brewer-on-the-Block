require 'faraday'

punk_url = "https://api.punkapi.com/v2/beers"
  punk_response = Faraday.get(punk_url)
  parsed_response = JSON.parse(punk_response.body)

user1 = User.new(email: "beer-reviewer@aol.com", password: "password", password_confirmation: "password")
user1.save

admin1 = User.new(email: "beerAdmin@gmail.com", password: "password", password_confirmation: "password", role: "admin")
admin1.save

beer1 = Beer.new(name: "SMaSH American IPA", description: "For this SMaSH (Single Malt and Single Hop) beer, I chose Mosaic hops, the daughter of American IPA hop stalwart Simcoe. Mosaic hops only became commercially available following the fall 2012 harvest, but they're already picking up steam among home and craft brewers for creating an array of flavors and aromas that have been said to include cedar, stone fruit, tropical fruit, blueberry, and floral notes. To round things out, I paired the Mosaic hops with the sweet, clean Golden Promise pale malt. Think of it as a Scottish equivalent to Maris Otter pale malt.", abv: 6.7, image_url: "https://www.seriouseats.com/thmb/jKeM58rr2uwn_fEKKU4lyiTuGbw=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2013__01__20130130-238963-SMaSH-homebrew-2d65e2d25c7146a9ae9fec066937df85.jpg", ibu: 66, ph: 4.4, beer_volume_value: 20, beer_volume_unit: "litres", boil_volume_value: 25, boil_volume_unit: "litres", mash_temp_value: 64, mash_temp_unit: "celsius", mash_temp_duration: 75, fermentation_value: 19, fermentation_unit: "celsius", user: user1)
beer1.save

hop_ingredients1 = Ingredient.new(ingredient_type: "hop", name: "Mosaic hops", amount_value: 0.02, amount_unit: "kilograms", add_time: "start", beer: beer1)
hop_ingredients1.save
hop_ingredients1 = Ingredient.new(ingredient_type: "hop", name: "Mosaic hops", amount_value: 0.04, amount_unit: "kilograms", add_time: "middle", beer: beer1)
hop_ingredients1.save
hop_ingredients1 = Ingredient.new(ingredient_type: "hop", name: "Mosaic hops", amount_value: 0.05, amount_unit: "kilograms", add_time: "end", beer: beer1)
hop_ingredients1.save

malt_ingredients1 = Ingredient.new(ingredient_type: "malt", name: "Maris Otter Extra Pale", amount_value: 5.44, amount_unit: "kilograms", beer: beer1)
malt_ingredients1.save

yeast_ingredient1 = YeastIngredient.new(ingredient_type: "yeast", name: "Wyeast 1056 American Ale Yeast", beer: beer1)
yeast_ingredient1.save

### Punk Beers

parsed_response.each do |beer|
  # consider adding all mash values to the beer table to combine them into one
  saved_beer = PunkBeer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], mash_temp_value: beer["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: beer["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: beer["method"]["mash_temp"][0]["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"])
  PunkYeastIngredient.create(ingredient_type: "yeast", name: beer["ingredients"]["yeast"], punk_beer: saved_beer)
end

parsed_response.each do |beer|
  saved_beer = PunkBeer.find_by(name: beer["name"])
  beer["ingredients"]["malt"].each do |malt|
    PunkIngredient.create(ingredient_type: "malt", name: malt["name"] , amount_value: malt["amount"]["value"], amount_unit: malt["amount"]["unit"], punk_beer: saved_beer)
  end
end
# hops
parsed_response.each do |beer|
  saved_beer = PunkBeer.find_by(name: beer["name"])
  beer["ingredients"]["hops"].each do |hop|
    PunkIngredient.create(ingredient_type: "hop", name: hop["name"] , amount_value: hop["amount"]["value"], amount_unit: hop["amount"]["unit"], add_time: hop["add"], punk_beer: saved_beer)
  end
end
