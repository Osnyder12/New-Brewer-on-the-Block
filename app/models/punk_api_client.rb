class PunkAPIClient
  PUNK_URL = "https://api.punkapi.com/v2/beers"

  attr_reader :create_beers

  def initialize(beers)
    @create_beers = beers
  end

  def self.seed_recipes
    return beer_request(PUNK_URL)
  end

  def self.beer_request(url)
    response = Faraday.get(url)
    parsed_response =  JSON.parse(response.body)
    return create_beers(parsed_response)
  end

  def self.create_beers(parsed_response)
    parsed_response.each do |beer|
      new_beer = PunkBeer.create(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], mash_temp_value: beer["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: beer["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: beer["method"]["mash_temp"][0]["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"])
      PunkIngredient.create(ingredient_type: "yeast", name: beer["ingredients"]["yeast"], punk_beer: new_beer)
    
      saved_beer = PunkBeer.find_by(name: beer["name"])
      beer["ingredients"]["hops"].each do |hop|
        PunkIngredient.create(ingredient_type: "hop", name: hop["name"] , amount_value: hop["amount"]["value"], amount_unit: hop["amount"]["unit"], add_time: hop["add"], punk_beer: saved_beer)
      end
      beer["ingredients"]["malt"].each do |malt|
        PunkIngredient.create(ingredient_type: "malt", name: malt["name"] , amount_value: malt["amount"]["value"], amount_unit: malt["amount"]["unit"], punk_beer: saved_beer)
      end
    end
  end

end