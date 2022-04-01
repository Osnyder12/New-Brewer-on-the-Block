class Api::V1::ExternalBeersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    response = PunkApiService.new.call

    render json: { error: response.errors }, status: 401 unless response.success?

    render json: response, status: 200
  end

  def show
    beer = PunkBeer.find(params[:id])
    malts = beer.punk_ingredients.where(ingredient_type: "malt")
    hops = beer.punk_ingredients.where(ingredient_type: "hop")
    yeast = beer.punk_ingredients.where(ingredient_type: "yeast")

    reviews = beer.punk_reviews

    render json: {
      punk_beer: PunkBeerShowSerializer.new(beer),
      malts: malts,
      hops: hops,
      yeast: yeast,
      reviews: reviews,
      current_user: current_user,
    }
  end
end