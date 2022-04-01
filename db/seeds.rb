require 'faraday'

user1 = User.new(email: "beer-reviewer@aol.com", password: "password", password_confirmation: "password")
user1.save

admin1 = User.new(email: "beerAdmin@gmail.com", password: "password", password_confirmation: "password", role: "admin")
admin1.save

beer1 = Beer.new(name: "SMaSH American IPA", description: "For this SMaSH (Single Malt and Single Hop) beer, I chose Mosaic hops, the daughter of American IPA hop stalwart Simcoe. Mosaic hops only became commercially available following the fall 2012 harvest, but they're already picking up steam among home and craft brewers for creating an array of flavors and aromas that have been said to include cedar, stone fruit, tropical fruit, blueberry, and floral notes. To round things out, I paired the Mosaic hops with the sweet, clean Golden Promise pale malt. Think of it as a Scottish equivalent to Maris Otter pale malt.", abv: 6.7, image_url: "https://www.seriouseats.com/thmb/jKeM58rr2uwn_fEKKU4lyiTuGbw=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2013__01__20130130-238963-SMaSH-homebrew-2d65e2d25c7146a9ae9fec066937df85.jpg", ibu: 66, ph: 4.4, beer_volume_value: 20, beer_volume_unit: "litres", boil_volume_value: 25, boil_volume_unit: "litres", mash_temp_value: 64, mash_temp_unit: "celsius", mash_temp_duration: 75, fermentation_value: 19, fermentation_unit: "celsius", user: user1)
beer1.save

# PunkAPIClient.seed_recipes(user: user1)

hop_ingredients1 = Ingredient.new(ingredient_type: "hop", name: "Mosaic hops", amount_value: 0.02, amount_unit: "kilograms", add_time: "start", beer: beer1)
hop_ingredients1.save
hop_ingredients1 = Ingredient.new(ingredient_type: "hop", name: "Mosaic hops", amount_value: 0.04, amount_unit: "kilograms", add_time: "middle", beer: beer1)
hop_ingredients1.save
hop_ingredients1 = Ingredient.new(ingredient_type: "hop", name: "Mosaic hops", amount_value: 0.05, amount_unit: "kilograms", add_time: "end", beer: beer1)
hop_ingredients1.save

malt_ingredients1 = Ingredient.new(ingredient_type: "malt", name: "Maris Otter Extra Pale", amount_value: 5.44, amount_unit: "kilograms", beer: beer1)
malt_ingredients1.save

yeast_ingredient1 = Ingredient.new(ingredient_type: "yeast", name: "Wyeast 1056 American Ale Yeast", beer: beer1)
yeast_ingredient1.save

## Beer 2

beer2 = Beer.new(name: "Juicy IPA", description: "Why is it called juicy? It's simple: the beer has a mildly fruity profile, low bitterness, and a ton of hop aroma. This makes the beer taste like it was flavored with fresh hop juice, if there were such a thing.", abv: 7.3, image_url: "https://cdn.craftbeer.com/wp-content/uploads/IPAs-HopCones_1200pix.jpg", ibu: 77, ph: 4.8, beer_volume_value: 20, beer_volume_unit: "litres", boil_volume_value: 25, boil_volume_unit: "litres", mash_temp_value: 64, mash_temp_unit: "celsius", mash_temp_duration: 75, fermentation_value: 19, fermentation_unit: "celsius", user: user1)
beer2.save

hop_ingredients4 = Ingredient.new(ingredient_type: "hop", name: "Citra", amount_value: 0.028, amount_unit: "kilograms", add_time: "middle", beer: beer2)
hop_ingredients4.save
hop_ingredients5 = Ingredient.new(ingredient_type: "hop", name: "Mosaic", amount_value: 0.28, amount_unit: "kilograms", add_time: "middle", beer: beer2)
hop_ingredients5.save
hop_ingredients6 = Ingredient.new(ingredient_type: "hop", name: "Nugget", amount_value: 0.017, amount_unit: "kilograms", add_time: "end", beer: beer2)
hop_ingredients6.save

malt_ingredients2 = Ingredient.new(ingredient_type: "malt", name: "Pale Malt", amount_value: 5, amount_unit: "kilograms", beer: beer2)
malt_ingredients2.save
malt_ingredients3 = Ingredient.new(ingredient_type: "malt", name: "Munich Malt", amount_value: 0.8, amount_unit: "kilograms", beer: beer2)
malt_ingredients3.save

yeast_ingredient2 = Ingredient.new(ingredient_type: "yeast", name: "Wyeast 1056 American Ale Yeast", beer: beer2)
yeast_ingredient2.save

## Beer 3

beer3 = Beer.new(name: "Amber Ale", description: "This amber ale is perfect for an easy brew day. Using both specialty grains and extracts, Easy Amber Ale makes for a deliciously malty beer with a prominent hop character. Whether this is your first brew day or you're a seasoned brewer, this amber ale will have you begging for another sip!", abv: 5.3, image_url: "https://cdn.homebrewersassociation.org/wp-content/uploads/20190827094612/amber-ale-recipe_900x645-900x600.jpg", ibu: 48, ph: 4.4, beer_volume_value: 20, beer_volume_unit: "litres", boil_volume_value: 25, boil_volume_unit: "litres", mash_temp_value: 71, mash_temp_unit: "celsius", mash_temp_duration: 60, fermentation_value: 21, fermentation_unit: "celsius", user: user1)
beer3.save

hop_ingredients7 = Ingredient.new(ingredient_type: "hop", name: "Amarillo", amount_value: 0.014, amount_unit: "kilograms", add_time: "start", beer: beer3)
hop_ingredients7.save
hop_ingredients8 = Ingredient.new(ingredient_type: "hop", name: "East Kent Goldings", amount_value: 0.014, amount_unit: "kilograms", add_time: "middle", beer: beer3)
hop_ingredients8.save
hop_ingredients9 = Ingredient.new(ingredient_type: "hop", name: "Nugget", amount_value: 0.028, amount_unit: "kilograms", add_time: "end", beer: beer3)
hop_ingredients9.save

malt_ingredients4 = Ingredient.new(ingredient_type: "malt", name: "Pilsner dry malt extract", amount_value: 0.91, amount_unit: "kilograms", beer: beer3)
malt_ingredients4.save
malt_ingredients5 = Ingredient.new(ingredient_type: "malt", name: "Pale dry malt extract", amount_value: 0.23, amount_unit: "kilograms", beer: beer3)
malt_ingredients5.save

yeast_ingredient3 = Ingredient.new(ingredient_type: "yeast", name: "Wyeast 1056 American Ale Yeast", beer: beer3)
yeast_ingredient3.save

## Beer 4

beer4 = Beer.new(name: "Classic Oatmeal Stout", description: "This recipe uses a combination of malt extract and malted grains. This is because dark beers require more malt to achieve the higher alcohol levels and deep taste and colour. In an average homebrewing mash tun there just isn’t enough space to hold all the grain required to make a good strong wort.", abv: 4.8, image_url: "https://learn.kegerator.com/wp-content/uploads/2016/02/oatmeal-stout-style.jpg", ibu: 28, ph: 5.0, beer_volume_value: 18, beer_volume_unit: "litres", boil_volume_value: 20, boil_volume_unit: "litres", mash_temp_value: 71, mash_temp_unit: "celsius", mash_temp_duration: 60, fermentation_value: 20, fermentation_unit: "celsius", user: user1)
beer4.save

hop_ingredients10 = Ingredient.new(ingredient_type: "hop", name: "Northern Brewer", amount_value: 0.028, amount_unit: "kilograms", add_time: "start", beer: beer4)
hop_ingredients10.save

malt_ingredients6 = Ingredient.new(ingredient_type: "malt", name: "Flaked oats", amount_value: 0.40, amount_unit: "kilograms", beer: beer4)
malt_ingredients6.save
malt_ingredients7 = Ingredient.new(ingredient_type: "malt", name: "Wheat Malt", amount_value: 0.23, amount_unit: "kilograms", beer: beer4)
malt_ingredients7.save
malt_ingredients8 = Ingredient.new(ingredient_type: "malt", name: "Roasted Barley", amount_value: 0.91, amount_unit: "kilograms", beer: beer4)
malt_ingredients8.save
malt_ingredients9 = Ingredient.new(ingredient_type: "malt", name: "Chocolate malt", amount_value: 0.46, amount_unit: "kilograms", beer: beer4)
malt_ingredients9.save

yeast_ingredient4 = Ingredient.new(ingredient_type: "yeast", name: "Wyeast 1084 Irish ale yeast", beer: beer4)
yeast_ingredient4.save