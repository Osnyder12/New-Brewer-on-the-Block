class Api::V1::IngredientsController < ApplicationController

  def create
    ingredient = Ingredient.new(ingredient_params)
    ingredient.beer = Beer.last
    beer = ingredient.beer

    if ingredient.save
      render json: {ingredient: ingredient, beer: beer}
    else
      render json: { error: beer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:ingredient_type, :name, :amount_value, :amount_unit, :add_time)
  end

end