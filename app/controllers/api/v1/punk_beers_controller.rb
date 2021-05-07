require 'faraday'

class Api::V1::PunkBeersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    punk_url = "https://api.punkapi.com/v2/beers"
    punk_response = Faraday.get(punk_url)
    parsed_response = JSON.parse(punk_response.body)
    binding.pry
    parsed_response.each do |beer|
      PunkBeer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"])
    end
    
    parsed_response.each do |object|
        mash_beer = PunkBeer.find_by(name: object["name"])
          PunkMash.create(mash_temp_value: object["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: object["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: object["method"]["mash_temp"][0]["duration"], fermentation_value: object["method"]["fermentation"]["temp"]["value"], fermentation_unit: object["method"]["fermentation"]["temp"]["unit"], punk_beer: mash_beer)
    end
    
    
    parsed_response.each do |object|
      ingredient_beer = Beer.find_by(name: object["name"])
      PunkMaltIngredient.create(ingredient_type: "malt", malt_ingredients: object["ingredients"]["malt"], punk_beer: ingredient_beer)
      PunkHopIngredient.create(ingredient_type: "hop", hop_ingredients: object["ingredients"]["hops"], punk_beer: ingredient_beer)
      PunkYeastIngredient.create(ingredient_type: "yeast", name: object["ingredients"]["yeast"], punk_beer: ingredient_beer)
    end

    punk_beer = PunkBeer.all
    punk_malts = PunkMaltIngredient.all
    punk_hops = PunkHopIngredient.all
    punk_yeast = PunkYeastIngredient.all
    punk_mashes = PunkMash.all

    render json: {
      punk_beer: punk_beer,
      punk_malt_ingredients: punk_malts,
      punk_hop_ingredients: punk_hops,
      punk_yeast_ingredients: punk_yeast,
      punk_mashes: punk_mashes,
  }
  end

  def show
  end
end