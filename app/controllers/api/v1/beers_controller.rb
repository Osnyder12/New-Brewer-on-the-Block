class Api::V1::BeersController < ApplicationController
  def index
    render json: Beer.limit(6)
  end

  def show
    beer = Beer.find(params[:id])
    render json: beer
  end
end