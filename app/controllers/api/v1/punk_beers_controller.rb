class Api::V1::PunkBeersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

#   punk_url = "https://api.punkapi.com/v2/beers"
#   punk_response = Faraday.get(punk_url)
#   parsed_response = JSON.parse(punk_response.body)

#   parsed_response.each do |beer|
#     PunkBeer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"])
#   end

#   parsed_response.each do |object|
#       mash_beer = PunkBeer.find_by(name: object["name"])
#         PunkMash.create(mash_temp_value: object["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: object["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: object["method"]["mash_temp"][0]["duration"], fermentation_value: object["method"]["fermentation"]["temp"]["value"], fermentation_unit: object["method"]["fermentation"]["temp"]["unit"], punk_beer: mash_beer)
#   end

#   parsed_response.each do |object|
#     ingredient_beer = PunkBeer.find_by(name: object["name"])
#     PunkMaltIngredient.create(ingredient_type: "malt", malt_ingredients: object["ingredients"]["malt"], punk_beer: ingredient_beer)
#     PunkHopIngredient.create(ingredient_type: "hop", hop_ingredients: object["ingredients"]["hops"], punk_beer: ingredient_beer)
#     PunkYeastIngredient.create(ingredient_type: "yeast", name: object["ingredients"]["yeast"], punk_beer: ingredient_beer)
#   end


# # ---- v2
# # parsed_response.each do |beer|
# #   saved_beer = PunkBeer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"])

# #   PunkMash.create(mash_temp_value: beer["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: beer["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: beer["method"]["mash_temp"][0]["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"], punk_beer: saved_beer)
# #   PunkMaltIngredient.create(ingredient_type: "malt", malt_ingredients: beer["ingredients"]["malt"], punk_beer: saved_beer)
# #   PunkHopIngredient.create(ingredient_type: "hop", hop_ingredients: beer["ingredients"]["hops"], punk_beer: saved_beer)
# #   PunkYeastIngredient.create(ingredient_type: "yeast", name: beer["ingredients"]["yeast"], punk_beer: saved_beer)
# # end


# # ---- v3

# parsed_response.each do |beer|
#   # consider adding all mash values to the beer table to combine them into one

#   saved_beer = PunkBeer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"])


#  # for mash, we would just add all of these same values to line 43
#   # PunkMash.create(mash_temp_value: beer["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: beer["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: beer["method"]["mash_temp"][0]["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"], punk_beer: saved_beer)

#   beer["ingredients"]["malt"].each do |malt| 
#     Ingredient.create(ingredient_type: "malt", name: malt["name"] , amount: malt["amount"]["value"] , amount_unit: malt["amount"]["unit"] , beer: saved_beer)
#   end
# # hops
#   beer["ingredients"]["hops"].each do |hop| 
#     Ingredient.create(ingredient_type: "malt", name: malt["name"] , amount: malt["amount"]["value"] , amount_unit: malt["amount"]["unit"] , beer: saved_beer)
#   end

#   Ingredient.create(ingredient_type: "yeast", name: malt["name"] , amount: malt["amount"]["value"] , amount_unit: malt["amount"]["unit"] , beer: saved_beer)

  
#   PunkMaltIngredient.create(ingredient_type: "malt", malt_ingredients: beer["ingredients"]["malt"], punk_beer: saved_beer)
#   PunkHopIngredient.create(ingredient_type: "hop", hop_ingredients: beer["ingredients"]["hops"], punk_beer: saved_beer)
#   PunkYeastIngredient.create(ingredient_type: "yeast", name: beer["ingredients"]["yeast"], punk_beer: saved_beer)
# end



#------





  def index
    punk_beer = PunkBeer.all
    render json: punk_beer
  end

  def show
    beer = PunkBeer.find(params[:id])
    malts = beer.punk_ingredients.where(ingredient_type: "malt")
    hops = beer.punk_ingredients.where(ingredient_type: "hop")
    yeast = beer.punk_yeast_ingredients




    reviews = beer.punk_reviews

    render json: {
      punk_beer: beer,
      malts: malts,
      hops: hops,
      yeast: yeast,
      reviews: reviews,
      current_user: current_user,
    }
  end
end