class Api::V1::BeersController < ApplicationController
  def index
    render json: Beer.limit(6)
  end
end