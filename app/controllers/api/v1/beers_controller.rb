class Api::V1::BeersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def index
    beer = Beer.all
    render json: { 
      beer: beer,
      current_user: current_user,
  }
  end

  def show
    beer = Beer.find(params[:id])
    malts = beer.ingredients.where(ingredient_type: "malt")
    hops = beer.ingredients.where(ingredient_type: "hop")
    yeast = beer.ingredients.where(ingredient_type: "yeast")

    reviews = beer.reviews
    render json: {
      beer: BeerShowSerializer.new(beer),
      malts: malts,
      hops: hops,
      yeast: yeast,
      reviews: reviews,
      current_user: current_user,
    }
  end

  def create
    beer = Beer.new(beer_params)
    beer.user = current_user

    if beer.save
      render json: beer
    else
      render json: { error: beer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :description, :abv, :image_url, :ibu, :ph, :beer_volume_value, :beer_volume_unit, :boil_volume_value, :boil_volume_unit, :mash_temp_value, :mash_temp_unit, :mash_temp_duration, :fermentation_value, :fermentation_unit)
  end
end