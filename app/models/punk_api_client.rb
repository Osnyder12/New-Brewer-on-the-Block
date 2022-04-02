class PunkAPIClient
  class PunkError < StandardError; end
  PunkResponse  = Struct.new :success?, :errors, :payload, keyword_init: true

  PUNK_URL = "https://api.punkapi.com/v2/beers"

  attr_reader :create_beers, :user

  def initialize(beers)
    @create_beers = beers
  end

  def self.seed_recipes(user:)
    @user = user
    raise PunkError, 'No user provided.' if user.nil?

    return beer_request(PUNK_URL)

  rescue PunkError => e
    PunkResponse[success?: false, errors: e.message]
  end

  def self.beer_request(url)
    response = Faraday.get(url)
    parsed_response =  JSON.parse(response.body)
    return create_beers(parsed_response)
  end

  def self.create_beers(parsed_response)
    parsed_response.each do |beer|
      new_beer = Beer.new(name: beer["name"], description: beer["description"], abv: beer["abv"], image_url: beer["image_url"], ibu: beer["ibu"], ph: beer["ph"], beer_volume_value: beer["volume"]["value"], beer_volume_unit: beer["volume"]["unit"], boil_volume_value: beer["boil_volume"]["value"], boil_volume_unit: beer["boil_volume"]["unit"], mash_temp_value: beer["method"]["mash_temp"][0]["temp"]["value"], mash_temp_unit: beer["method"]["mash_temp"][0]["temp"]["unit"], mash_temp_duration: beer["method"]["mash_temp"][0]["duration"], fermentation_value: beer["method"]["fermentation"]["temp"]["value"], fermentation_unit: beer["method"]["fermentation"]["temp"]["unit"], external_recipe: true, user: @user)
      new_beer.save!

      next unless new_beer.persisted?

      Ingredient.create(ingredient_type: "yeast", name: beer["ingredients"]["yeast"], beer: new_beer)
      saved_beer = Beer.find_by(name: beer["name"])
      beer["ingredients"]["hops"].each do |hop|
        Ingredient.create(ingredient_type: "hop", name: hop["name"] , amount_value: hop["amount"]["value"], amount_unit: hop["amount"]["unit"], add_time: hop["add"], beer: saved_beer)
      end
      beer["ingredients"]["malt"].each do |malt|
        Ingredient.create(ingredient_type: "malt", name: malt["name"] , amount_value: malt["amount"]["value"], amount_unit: malt["amount"]["unit"], beer: saved_beer)
      end
    end
  end

end