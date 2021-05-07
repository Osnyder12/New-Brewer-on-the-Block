require 'faraday'

punk_url = "https://api.punkapi.com/v2/beers"
punk_response = Faraday.get(punk_url)
parsed_response = JSON.parse(punk_response.body)

user1 = User.new(email: "qbeer-reviewer@aol.com", password: "password", password_confirmation: "password")
user1.save

admin1 = User.new(email: "qbeerAdmin@gmail.com", password: "password", password_confirmation: "password", role: "admin")
admin1.save




# parsed_response.each do |beer|
#   beer["method"]["mash_temp"].each do |mash|
#     beer["ingredients"]["malt"].each do |malt|
#       beer["ingredients"]["hops"].each do |hop|
#         i = 0
#         while i < parsed_response.length do 
#           i += 1
#           beer[i] = Beer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], user: user1)
#           Ingredient.create(ingredient_type: "malt", name: malt["name"], amount_value: malt["amount"]["value"], amount_unit: malt["amount"]["unit"])
#           Ingredient.create(ingredient_type: "hop", name: hop["name"], amount_value: hop["amount"]["value"], amount_unit: hop["amount"]["unit"], add_time: hop["add"])
#           Mash.create(mash_temp_value: mash["temp"]["value"], mash_temp_unit: mash["temp"]["unit"], mash_temp_duration: mash["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"], beer: beer[i])
#         end
#       end
#     end
#   end
# end

# c = 0
# while c < parsed_response.length do
#   c += 1
#   parsed_response.each do |beer|
#       beer[c] = Beer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], user: user1)
#     end
# end
# binding.pry


# beer_mashes = parsed_response.each do |beer|
#   i = 0
#   while i < parsed_response.length
#   beer["method"]["mash_temp"].each do |mash|
#     Mash.create(mash_temp_value: mash["temp"]["value"], mash_temp_unit: mash["temp"]["unit"], mash_temp_duration: mash["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"], beer: beer[i])
#   end
#   i += 1
# end
# end

beers = parsed_response.map do |beer|
  Beer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], user: user1)
end


malt_ingredients = parsed_response.map do |beer|
  beer["ingredients"]["malt"].each do |malt|
    Ingredient.create(ingredient_type: "malt", name: malt["name"], amount_value: malt["amount"]["value"], amount_unit: malt["amount"]["unit"])
  end
end

hop_ingredients = parsed_response.map do |beer|
  beer["ingredients"]["hops"].each do |hop|
    Ingredient.create(ingredient_type: "hop", name: hop["name"], amount_value: hop["amount"]["value"], amount_unit: hop["amount"]["unit"], add_time: hop["add"])
  end
end

yeast_ingredients = parsed_response.map do |beer|
    Ingredient.create(ingredient_type: "yeast", name: beer["ingredients"]["yeast"]["name"])
end

# beer_mashes = parsed_response.map do |beer|
#   beer["method"]["mash_temp"].each do |mash|
#     Mash.create(mash_temp_value: mash["temp"]["value"], mash_temp_unit: mash["temp"]["unit"], mash_temp_duration: mash["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"], beer_id: beer.id)
#   end
# end

# ingredient1 = Ingredient.new(ingredient_type: "malt", name: "Maris Otter Extra Pale", amount_value: 3.3, amount_unit: "kilograms")
# ingredient2 = Ingredient.new(ingredient_type: "malt", name: "Caramalt", amount_value: 0.2, amount_unit: "kilograms")
# ingredient3 = Ingredient.new(ingredient_type: "malt", name: "Munich", amount_value: 0.4, amount_unit: "kilograms")
# ingredient4 = Ingredient.new(ingredient_type: "hop", name: "Fuggles", amount_value: 25, amount_unit: "grams", add_time: "start")
# ingredient5 = Ingredient.new(ingredient_type: "hop", name: "First Gold", amount_value: 25, amount_unit: "grams", add_time: "start")
# ingredient6 = Ingredient.new(ingredient_type: "hop", name: "Fuggles", amount_value: 37.5, amount_unit: "grams", add_time: "middle")
# ingredient7 = Ingredient.new(ingredient_type: "hop", name: "First Gold", amount_value: 37.5, amount_unit: "grams", add_time: "middle")
# ingredient8 = Ingredient.new(ingredient_type: "hop", name: "Cascade", amount_value: 37.5, amount_unit: "grams", add_time: "end")
# ingredient9 = Ingredient.new(ingredient_type: "yeast", name: "Wyeast 1056 - American Ale™")

# ingredient1.save
# ingredient2.save
# ingredient3.save
# ingredient4.save
# ingredient5.save
# ingredient6.save
# ingredient7.save
# ingredient8.save
# ingredient9.save

# recipe1 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient1)
# recipe2 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient2)
# recipe3 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient3)
# recipe4 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient4)
# recipe5 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient5)
# recipe6 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient6)
# recipe7 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient7)
# recipe8 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient8)
# recipe9 = Recipe.new(beer: Beer.find_by(name: "Buzz"), ingredient: ingredient9)

# recipe1.save
# recipe2.save
# recipe3.save
# recipe4.save
# recipe5.save
# recipe6.save
# recipe7.save
# recipe8.save
# recipe9.save


# mash1 = Mash.new(mash_temp_value: 64, mash_temp_unit: "celsius", mash_temp_duration: 75, fermentation_value: 19, fermentation_unit: "celsius", beer: Beer.find_by(name: "Buzz"))
# mash1.save

# review1 = Review.new(rating: 4, difficulty: 7, comment: "This was super challenging but rewarding in the end!", beer: Beer.find_by(name: "Buzz"), user: user1)
# review1.save


# Beer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], user: user1)
# Ingredient.create(ingredient_type: beer["ingredients"].keys[0], name: beer["ingredients"]["malt"], amount_value: 3.3, amount_unit: "kilograms")