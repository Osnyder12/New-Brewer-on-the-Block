# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
beer1 = Beer.new(name: "Buzz", description: "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.", abv: 4.5, image_url: "https://images.punkapi.com/v2/keg.png", ibu: 60, ph: 4.4, beer_volume_value: 20, beer_volume_unit: "litres", boil_volume_value: 25, boil_volume_unit: "litres")
beer1.save

# ingredient1 = Ingredient.new(name: "Maris Otter Extra Pale")
# ingredient2 = Ingredient.new(name: "Caramalt")
# ingredient3 = Ingredient.new(name: "Munich")
# ingredient1.save
# ingredient2.save
# ingredient3.save

# amount1 = Amount.new(ingredient_id: ingredient1.id, beer_id: beer1.id, value: 3.3, unit: "kilograms")
# amount2 = Amount.new(ingredient_id: ingredient2.id, beer_id: beer1.id, value: 0.2, unit: "kilograms")
# amount3 = Amount.new(ingredient_id: ingredient3.id, beer_id: beer1.id, value: 0.4, unit: "kilograms")
# amount1.save
# amount2.save
# amount3.save

# mash1 = Mash.new(mash_temp_value: 64, mash_temp_unit: "celsius", mash_temp_duration: 75, fermentation_value: 19, fermentation_unit: "celsius", beer_id: beer1.id)
# mash1.save