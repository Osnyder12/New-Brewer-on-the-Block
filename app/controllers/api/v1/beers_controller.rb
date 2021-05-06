class Api::V1::BeersController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  def index
    render json: Beer.limit(6)
  end

  def show
    beer = Beer.find(params[:id])
    reviews = beer.reviews
    render json: {
      beer: beer,
      reviews: reviews,
      current_user: current_user,
    }
  end
end