class BeersController < ApplicationController
  def new
    @beer = Beer.new
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def create
    @beer = Beer.new(beer_params)
    @beer.user = current_user

    if @beer.save
      redirect_to "/beers/#{@beer.id}", notice: 'beer Added'
    else
      render :new
    end

  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      redirect_to edit_beer_path(@beer), notice: 'beer was successfully updated'
    else
      render :edit
    end
  end

  private

  def beer_params
    params
    .require(:beer)
    .permit(:name, :description, :abv, :image_url, :ibu, :ph, :beer_volume_value, :beer_volume_unit, :boil_volume_value, :boil_volume_unit, :mash_temp_value, :mash_temp_unit, :mash_temp_duration, :fermentation_value, :fermentation_unit, ingredients_attributes: Ingredient.attribute_names.map(&:to_sym).push(:_destroy))
  end
end